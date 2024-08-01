Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F339449D3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864E10E906;
	Thu,  1 Aug 2024 10:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E39E10E906
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:56:21 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-81f8edd7370so969674239f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 03:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722509780; x=1723114580;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MS41VGE4LZARYbbs2s5Peg/vt+HCGpu2lbzImRJhm6U=;
 b=sWEZOpiaq8zlvcZuKtOB8fbbDhqg16gsOlieK2ZSKrhLEEmyBzqHrsQs7/Jtb9+y3e
 yV116rFhIr4KJK4pkFIEfZudtNXZsm70fcmeSVZJM+9i8Dx4MFTtYWqMLxkAPF+HyC+f
 T2QMwS9G9qkR2PXOD8ODae83keDCZqVhZx7x3pmuRm/weZV/kfquTNV38eMch1mdNGUU
 FwEnjIExUY66BVIJADc8/0PgK9rqrQ7YyuSLdY0GQO9Evl4nMzY7zgcDixf5k1GU7/FT
 o8FPZ9D/Zf0vOAHkC9eUcQkrzK0LHx3bfPgl8V1oscOoi3DmOmKXfaT0bLlKlAIKQu0p
 9YOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmStFfpmcYxAwPXj6MN0TlGz90VLJgTOR0Rkv++K8E/8QqqWsN1loBvDkitE8AaQEaCK/BBF0XCW105GTmdQQcanZaM3I7sK8uu3DjXe4q
X-Gm-Message-State: AOJu0Yx2wadhLzDI02K1GvX5YZKHK21KU50LcMPK+ZUJE+0jkSdxnNIj
 IRUqQM27n4m/VlOccvJnTZUm3/R4hBV+YBfmaETAcQUPgheQiMFb3qArL9tTtzR26ijiJHZDrVa
 7xjKWAqS7ybwGh5PFI5KFMjI70NX0697Eln6nK9VYAWzWymL0gIbBkNE=
X-Google-Smtp-Source: AGHT+IGtdLSZk41w7X6MBaxejTdAP23t97hOC0ZaMhucyxiUz0tSL2uNe6DF//jUXWxnqYGHn/sH7puoICyNe2orUK6hnmlwSiab
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2115:b0:4c0:a8a5:81cc with SMTP id
 8926c6da1cb9f-4c8c9c6bb20mr133296173.3.1722509780317; Thu, 01 Aug 2024
 03:56:20 -0700 (PDT)
Date: Thu, 01 Aug 2024 03:56:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000094071d061e9d0f66@google.com>
Subject: [syzbot] [dri?] WARNING in drm_wait_one_vblank (2)
From: syzbot <syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    6342649c33d2 Merge tag 'block-6.11-20240726' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1443cb03980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5efb917b1462a973
dashboard link: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6057dd16bc1c/disk-6342649c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4121b87a6477/vmlinux-6342649c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/57d676edb7cb/bzImage-6342649c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com

------------[ cut here ]------------
platform vkms: [drm] vblank wait timed out on crtc 0
WARNING: CPU: 1 PID: 7412 at drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x976/0x9f0 drivers/gpu/drm/drm_vblank.c:1307
Modules linked in:
CPU: 1 UID: 0 PID: 7412 Comm: syz.1.410 Not tainted 6.10.0-syzkaller-12881-g6342649c33d2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
RIP: 0010:drm_wait_one_vblank+0x976/0x9f0 drivers/gpu/drm/drm_vblank.c:1307
Code: 80 3c 08 00 74 08 4c 89 ff e8 76 0a 9c fc 49 8b 1f 48 c7 c7 e0 f4 72 8c 4c 89 f6 48 89 da 8b 5c 24 0c 89 d9 e8 0b e1 f6 fb 90 <0f> 0b 90 90 49 be 00 00 00 00 00 fc ff df e9 68 fb ff ff 44 89 e9
RSP: 0018:ffffc90003f87ac0 EFLAGS: 00010246
RAX: 1af066dba6c5c900 RBX: 0000000000000000 RCX: 0000000000040000
RDX: ffffc900041f9000 RSI: 0000000000031631 RDI: 0000000000031632
RBP: ffffc90003f87c00 R08: ffffffff815592f2 R09: fffffbfff1cf9f80
R10: dffffc0000000000 R11: fffffbfff1cf9f80 R12: 1ffff920007f0f64
R13: 0000000000002635 R14: ffffffff8c861520 R15: ffff888020618010
FS:  00007ff6598ef6c0(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff6598ced58 CR3: 000000004b096000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_fb_helper_ioctl+0x114/0x140 drivers/gpu/drm/drm_fb_helper.c:1088
 do_fb_ioctl+0x40a/0x7b0 drivers/video/fbdev/core/fb_chrdev.c:155
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff658b77299
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff6598ef048 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ff658d05f80 RCX: 00007ff658b77299
RDX: 0000000000000000 RSI: 0000000040044620 RDI: 0000000000000003
RBP: 00007ff658be48e6 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007ff658d05f80 R15: 00007ff658e2fa38
 </TASK>


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
