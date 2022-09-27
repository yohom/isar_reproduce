import 'package:isar/isar.dart';

part 'persist_object.g.dart';

@collection
class MemoryPO {
  /// 回忆id - 回忆id
  Id id = Isar.autoIncrement;

  /// 标题 - 标题
  @Name('title')
  late String title;

  /// 文字内容 - 文字内容
  @Name('text')
  String? text;

  /// 音频内容 - 音频内容
  @Name('audio')
  List<String>? audio;

  /// 视频内容 - 视频内容
  @Name('video')
  List<String>? video;

  /// 图片内容 - 图片内容
  @Name('image')
  List<String>? image;

  /// 想象图片 - 文字转图片的内容
  @Name('imagine')
  String? imagine;

  /// 歌曲 - 歌曲
  @Name('music')
  final music = IsarLink<MusicPO>();

  /// 回忆发生时间
  @Name('memoryTime')
  late DateTime memoryTime;

  /// 回忆持续时间
  ///
  /// 单位毫秒, 默认0, 即时刻. 如果不为0, 则可以跟[memoryTime]可以形成一个时间范围.
  @Name('memoryDuration')
  int memoryDuration = 0;

  /// 记录的时间 - 记录的时间
  @Name('createTime')
  late DateTime createTime;

  /// 地址 - 地址
  @Name('city')
  String? city;

  /// 地标 - 地标
  @Name('place')
  String? place;

  /// 经纬度 - 经纬度，($纬度,$经度) 拼接
  @Name('coordinate')
  String? coordinate;

  /// 故事
  @Name('story')
  final story = IsarLinks<StoryPO>();

  /// 牵涉到的人物 - 牵涉到的人物
  @Name('person')
  final person = IsarLinks<PersonPO>();

  /// 附件列表
  @Name('attachment')
  List<String>? attachment;

  /// 心情 - 心情
  @Name('emotion')
  String? emotion;

  /// 阴影颜色 - 阴影颜色
  @Name('shadowColor')
  String? shadowColor;

  /// 字体颜色 - 字体颜色
  @Name('textColor')
  String? textColor;

  /// 是否收藏 - 是否收藏
  @Name('isFavorite')
  bool isFavorite = false;

  /// 是否开启周年 - 是否开启周年
  @Name('isAnniversary')
  bool isAnniversary = false;

  /// 状态 - 状态，0-不存在 1-草稿 2-已保存
  @Name('status')
  int status = 0;

  /// 更新时间
  @Name('updatedAt')
  DateTime updatedAt = DateTime.now();

  @override
  String toString() {
    return 'MemoryPO{id: $id, title: $title, text: $text, audio: $audio, video: $video, image: $image, music: $music, memoryTime: $memoryTime, createTime: $createTime, city: $city, place: $place, coordinate: $coordinate, story: $story, person: $person, emotion: $emotion, shadowColor: $shadowColor, textColor: $textColor, isFavorite: $isFavorite, isAnniversary: $isAnniversary, status: $status}';
  }
}

@collection
class PersonPO {
  /// 人物id - 人物id
  Id id = Isar.autoIncrement;

  /// 姓名 - 姓名
  @Index(unique: true)
  @Name('name')
  String? name;

  /// 别称 - 别称
  @Name('alias')
  String? alias;

  /// 封面
  @Name('cover')
  String? cover;

  @override
  String toString() {
    return 'PersonPO{id: $id, name: $name, alias: $alias, cover: $cover}';
  }
}

@collection
class MusicPO {
  /// 人物id - 人物id
  Id id = Isar.autoIncrement;

  /// 作者 - 作者
  @Name('artist')
  String? artist;

  /// 作品名称 - 作品名称
  @Name('artifact')
  String? artifact;

  @override
  String toString() {
    return 'MusicPO{id: $id, artist: $artist, artifact: $artifact}';
  }
}

@collection
class StoryPO {
  /// 故事id
  Id id = Isar.autoIncrement;

  /// 故事名称
  @Index(unique: true)
  @Name('title')
  late String title;

  /// 封面
  @Name('cover')
  String? cover;

  /// 更新时间
  ///
  /// 排序用
  @Name('updatedAt')
  DateTime updatedAt = DateTime.now();
}
