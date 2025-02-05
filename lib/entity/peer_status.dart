// Реализация сильных enum через static fields
// смотри также ./archive и https://t.me/yugoflutter/2
class PeerStatus {
  final int id;
  final String caption;

  const PeerStatus._(this.id, this.caption);

  static const available = PeerStatus._(3, 'available');
  static const invited = PeerStatus._(1, 'invited');
  static const connected = PeerStatus._(0, 'connected');

  factory PeerStatus.fromId(int id) => switch (id) {
        3 => available,
        1 => invited,
        0 => connected,
        // _ => throw 'Unknown PeerStatus.id == $id',
        _ => PeerStatus._(id, '$id'), // мало ли что из API прилетит
      };

  static const List<PeerStatus> values = [available, invited, connected];
}

void testPeerStatus() {
  final v = PeerStatus.fromId(1);
  final name = switch (v) {
    PeerStatus.available => v.caption,
    PeerStatus.invited => v.caption,
    PeerStatus.connected => v.caption,
    _ => throw 'It\'s fucking unclear',
  };
  print(name);
}
