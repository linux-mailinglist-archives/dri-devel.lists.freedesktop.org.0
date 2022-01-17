Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24149314C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AD010E152;
	Tue, 18 Jan 2022 23:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC971121A3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 22:36:21 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 d125-20020a6bb483000000b006051f7a8573so10357724iof.23
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=rFPvMIgMBi0cfHpcVjBnGzE0dFNesFQwlxraGbUKUxI=;
 b=yDO8J9n3dz0A8KFhjFJc2UisfCA8O4f1VWrtvCWkm/qnqyZsmJ6VGk3i673QUQ4bM6
 vtmRyxs+LNl2hTY/8sgi5ohxuzv+rnOGxlut/20TGC/foXpUK61jPakjDi0rOWQv6Zyd
 +Sd9TFAe9UCaGHFfJ4pR7cZ4H45vblvJRCCEh+5rkwX9Az3rBkyGZf34s9WQVE7rUlpn
 qDyP/dz0iLQGzDiddMig/Wbbxkm9WZw9cVvpIsQbJ7cOD8h1ZRNw1B60sZfHC+kLBX4D
 y2RF4e6NYK0FtpSYjNf8H6H3cOLn60QISYLFfGvtnxCi0Uiu9cey4En2FAaAWXzPb8r8
 FiNg==
X-Gm-Message-State: AOAM532vF7UneibiadsKIXkxWx5Kcoj00pzIntjOMOvLBPARpovV4c3I
 P4uK/NBPAZz3ubgjpXbKqg+L17jMnkQmo1EJFedXXvtQ2Ty4
X-Google-Smtp-Source: ABdhPJzPIevfHh2H2So4HyGtkuouW9DKQn0fJ/tjzbY4ASxHffBzGjiKmBB2i9+52KmgLlwswMyVhPPmm25pCj4/jLG379o4OH6H
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1801:: with SMTP id
 t1mr3997621ioh.50.1642458980478; 
 Mon, 17 Jan 2022 14:36:20 -0800 (PST)
Date: Mon, 17 Jan 2022 14:36:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000016f4ae05d5cec832@google.com>
Subject: [syzbot] WARNING in component_del
From: syzbot <syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, rafael@kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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

HEAD commit:    a33f5c380c4b Merge tag 'xfs-5.17-merge-3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17c4eb7fb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dc846445c1d2060e
dashboard link: https://syzkaller.appspot.com/bug?extid=60df062e1c41940cae0f
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 11050 at drivers/base/component.c:767 component_del+0xe2/0x480 drivers/base/component.c:765
Modules linked in:
CPU: 1 PID: 11050 Comm: syz-executor.5 Not tainted 5.16.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:component_del+0xe2/0x480 drivers/base/component.c:767
Code: 03 fd 48 8b 6d 00 4c 39 ed 74 07 e8 88 bc b7 fc eb 86 e8 81 bc b7 fc eb 05 e8 7a bc b7 fc 48 c7 c7 20 16 29 8d e8 be b5 47 05 <0f> 0b 31 ed 48 89 ef 48 83 c4 20 5b 41 5c 41 5d 41 5e 41 5f 5d e9
RSP: 0018:ffffc90004a97550 EFLAGS: 00010246
RAX: c095017d97055900 RBX: ffff888023b8b6b0 RCX: ffffffff8d291620
RDX: 0000000000000001 RSI: 0000000000000008 RDI: ffffc90004a974c0
RBP: ffffffff8d291720 R08: dffffc0000000000 R09: fffff52000952e99
R10: fffff52000952e99 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffffff8d291720 R14: ffffffff8b27aea0 R15: ffff88807ac5a008
FS:  00007f5f620ee700(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2eb22000 CR3: 000000007da2d000 CR4: 00000000003526e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_hub_remove_port_device+0x1bf/0x2d0 drivers/usb/core/port.c:653
 hub_disconnect+0x171/0x480 drivers/usb/core/hub.c:1737
 usb_unbind_interface+0x1f2/0x860 drivers/usb/core/driver.c:458
 __device_release_driver drivers/base/dd.c:1206 [inline]
 device_release_driver_internal+0x523/0x7b0 drivers/base/dd.c:1237
 proc_ioctl+0x53c/0x640 drivers/usb/core/devio.c:2332
 proc_ioctl_default drivers/usb/core/devio.c:2375 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2731 [inline]
 usbdev_ioctl+0x3f4a/0x6d00 drivers/usb/core/devio.c:2791
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f5f637dbfe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5f620ee168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5f638ef1d0 RCX: 00007f5f637dbfe9
RDX: 0000000020000380 RSI: 00000000c0105512 RDI: 0000000000000005
RBP: 00007f5f6383608d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffef2b2329f R14: 00007f5f620ee300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
