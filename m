Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51022A241F6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 18:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54EF88C3D;
	Fri, 31 Jan 2025 17:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852388C3D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 17:38:24 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3ce7a0ec1easo15882605ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738345103; x=1738949903;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bQN8Hl8aILe6f0kGxWFgZSDOzoDHnNcZ9k8ywzy2mdI=;
 b=SNDB7JZztwt4etRcU4GgoNPosY6xq9GHXfbbclO82dTCXyC/ue+3M1rkqG7JGRTwq8
 ZdmCYMEwRb1jbdBrACsH3kr23FUWAIcdBaAzSi5ZGhtwWBLpHr6LZOaFYApGx5okphBE
 OIBvg5LEcXJvHYlwJ54mGjiNhNU/DtGjVif+mAo107Eqbzc4iOEoC1kyYKE5NRjcyXYJ
 QeIr24NCgLPBU1miXJQJcodqSbu6XZZ7WchiE6pkrqDpa54Ld5mLTt1ICABZdxMN0e0o
 edXT2HwsL9wllkupSTLa4+/jkElul8JkevLxi7FLT9B5bYS1uL0uQsvFSaPHhSQia7DH
 MEMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLP1BkRcEudRa3gKC9vvdm15Z+m9CFonObdIAtafnOfcD6T/TIUoDjXEgHcyD3TJfWIMaMM9GE5ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx7ViCZCXVHI8orSYs1/GWSbPoMqWGep9CaMmE2SZ4ZCa+Odgc
 Q07SwJHzUTK3tIwK+gT2azzPP5bg8pILy9q4K+RMefHt7UVYwLNhmVk6DLj8+1X3A6H+U8PcNME
 erTFePtBZDwigkFNyBU/O8yLl5+Pzwjvl55nSM24P8+aZOSZwn9A7dPQ=
X-Google-Smtp-Source: AGHT+IEhvAB+5AypiuaRHXww+07iCdlXgyqBAjMlVpHIFanzTHdtNW2wrrrT9beQ5Ni2o8rnUy9dey6j/27k1MXvVj8tdT4Icn8v
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b83:b0:3ce:80b8:7328 with SMTP id
 e9e14a558f8ab-3cffe3ffb5cmr114132665ab.3.1738345103719; Fri, 31 Jan 2025
 09:38:23 -0800 (PST)
Date: Fri, 31 Jan 2025 09:38:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679d0a8f.050a0220.163cdc.000c.GAE@google.com>
Subject: [syzbot] [fbdev?] UBSAN: array-index-out-of-bounds in
 fbcon_info_from_console
From: syzbot <syzbot+a7d4444e7b6e743572f7@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, simona@ffwll.ch, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    9c5968db9e62 Merge tag 'mm-stable-2025-01-26-14-59' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15045118580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0b04511e541daf8
dashboard link: https://syzkaller.appspot.com/bug?extid=a7d4444e7b6e743572f7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/28361a445db1/disk-9c5968db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3341d04d577f/vmlinux-9c5968db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e5b54cd0e552/bzImage-9c5968db.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a7d4444e7b6e743572f7@syzkaller.appspotmail.com

netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
netlink: zone id is out of range
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/video/fbdev/core/fbcon.c:122:28
index -1 is out of range for type 'fb_info *[32]'
CPU: 1 UID: 0 PID: 8491 Comm: syz.4.565 Not tainted 6.13.0-syzkaller-08265-g9c5968db9e62 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x110/0x150 lib/ubsan.c:429
 fbcon_info_from_console+0x192/0x1a0 drivers/video/fbdev/core/fbcon.c:122
 fbcon_new_modelist+0xbf/0x2d0 drivers/video/fbdev/core/fbcon.c:3048
 fb_new_modelist+0x328/0x440 drivers/video/fbdev/core/fbmem.c:673
 store_modes+0x1c9/0x3e0 drivers/video/fbdev/core/fbsysfs.c:113
 dev_attr_store+0x55/0x80 drivers/base/core.c:2439
 sysfs_kf_write+0x117/0x170 fs/sysfs/file.c:139
 kernfs_fop_write_iter+0x33d/0x500 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0x5ae/0x1150 fs/read_write.c:679
 ksys_write+0x12b/0x250 fs/read_write.c:731
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe6d0f8cd29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe6d1daa038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fe6d11a5fa0 RCX: 00007fe6d0f8cd29
RDX: 000000000000a3d9 RSI: 0000000020000400 RDI: 0000000000000009
RBP: 00007fe6d100e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fe6d11a5fa0 R15: 00007ffe594083d8
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
