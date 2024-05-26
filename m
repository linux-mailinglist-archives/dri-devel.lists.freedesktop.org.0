Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E28CF472
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 15:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB1410EBE6;
	Sun, 26 May 2024 13:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com
 [209.85.166.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C85210EC4A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 13:59:23 +0000 (UTC)
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3713862bcefso34174295ab.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 06:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716731962; x=1717336762;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jNEgY/oLrqRd+yaxQrrBw1t0SSKI8XMoyGe1kTK/1Ws=;
 b=fgbJc/Pe2xMiDCpRB1pMiNuBASwOMS3cmmMHir83pSY+k4DkL1YCSVCLQKiIlUSoUw
 WmATmP0WWmbyCGbvswqv/Yy61GBHrMEHJVBYaVK44iIkya5QqDLaosajnKMrXAJaIW9K
 3j10SdPAExC7qt24abFmx0h+uTxg87u81TkrYZQr6Sf2RUSZuys5nty3RbdBOmtVKEiM
 RUyYh8wrUdDIFsLj/vOR7Mi6WNlzPW4P6JRVMdsMuUXFCwlDill8Ex9ShOib/NVNRkxJ
 oiWNU7XJsuwSZvwGb1vmMsYM2gbGxKwqW+jZh6d2y5lOA022SKaU4kjBvE8UO/mWoazm
 EyKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+sODT0JCpwC4hbiBlN6rqOA6exsR6N3cxkc6rns86SZwhWJ81ySqE29s8PzdX5m5mIJUg7JIQ0iM9Ci7hO74cOnqh9hd1bHZPUn4AYN4H
X-Gm-Message-State: AOJu0YzqSOXppx5jGPgCsrRcu+2Ph5JcpqXItJZa3J+fLfEimIO+RhhM
 eBJkUx4vMsZhIU6FuuhFm1XWI1k1JVdmE7EwBubMwLKxnzwpXni08rH7+9S89+JtMCo472oGaYW
 4rcJdaxO4CGErF61Xd9hTshGOW/khKSEaXCq1uM589yFj6fhxhqYgL9g=
X-Google-Smtp-Source: AGHT+IHNNjsHcPytzQ4qNy8yJE2YJ9Q8829cNue7EDdSis/FiJ1bsV6YBDthQBQnJDzAlnUp5Xo63kcVHRe08OjvN7VW/ivZ+0hB
MIME-Version: 1.0
X-Received: by 2002:a92:6408:0:b0:374:5776:de62 with SMTP id
 e9e14a558f8ab-3745776e1bdmr112205ab.2.1716731962249; Sun, 26 May 2024
 06:59:22 -0700 (PDT)
Date: Sun, 26 May 2024 06:59:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c8e60006195bce35@google.com>
Subject: [syzbot] [dri?] WARNING in drm_atomic_helper_wait_for_vblanks (3)
From: syzbot <syzbot+0ac28002caff799b9e57@syzkaller.appspotmail.com>
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

HEAD commit:    6d69b6c12fce Merge tag 'nfs-for-6.10-1' of git://git.linux..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14dbcda4980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aeb4d28a6349ece
dashboard link: https://syzkaller.appspot.com/bug?extid=0ac28002caff799b9e57
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/8ead8862021c/non_bootable_disk-6d69b6c1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/85d8b411b76d/vmlinux-6d69b6c1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a9fe9b7875f4/zImage-6d69b6c1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0ac28002caff799b9e57@syzkaller.appspotmail.com

input: AT Raw Set 2 keyboard as /devices/platform/bus@8000000/bus@8000000:motherboard-bus/bus@8000000:motherboard-bus:iofpga-bus@300000000/1c060000.kmi/serio0/input/input0
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/bus@8000000/bus@8000000:motherboard-bus/bus@8000000:motherboard-bus:iofpga-bus@300000000/1c070000.kmi/serio1/input/input2
------------[ cut here ]------------
WARNING: CPU: 1 PID: 24 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x264/0x26c drivers/gpu/drm/drm_atomic_helper.c:1682
[CRTC:34:crtc-0] vblank wait timed out
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 1 PID: 24 Comm: kworker/1:0 Not tainted 6.9.0-syzkaller #0
Hardware name: ARM-Versatile Express
Workqueue: events output_poll_execute
Call trace: 
[<818d5898>] (dump_backtrace) from [<818d5994>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:00000000 r6:82622d44 r5:00000000 r4:81fe1500
[<818d597c>] (show_stack) from [<818f2fa4>] (__dump_stack lib/dump_stack.c:88 [inline])
[<818d597c>] (show_stack) from [<818f2fa4>] (dump_stack_lvl+0x54/0x7c lib/dump_stack.c:114)
[<818f2f50>] (dump_stack_lvl) from [<818f2fe4>] (dump_stack+0x18/0x1c lib/dump_stack.c:123)
 r5:00000000 r4:8285fd18
[<818f2fcc>] (dump_stack) from [<818d643c>] (panic+0x120/0x358 kernel/panic.c:347)
[<818d631c>] (panic) from [<80243dcc>] (check_panic_on_warn kernel/panic.c:240 [inline])
[<818d631c>] (panic) from [<80243dcc>] (print_tainted+0x0/0xa0 kernel/panic.c:235)
 r3:8260c5c4 r2:00000001 r1:81fca178 r0:81fd1dc8
 r7:80a1fec0
[<80243d58>] (check_panic_on_warn) from [<80243fc0>] (__warn+0x7c/0x180 kernel/panic.c:693)
[<80243f44>] (__warn) from [<802442ac>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:726)
 r8:00000009 r7:820530fc r6:df87dbdc r5:82e3b000 r4:00000000
[<802440c8>] (warn_slowpath_fmt) from [<80a1fec0>] (drm_atomic_helper_wait_for_vblanks.part.0+0x264/0x26c drivers/gpu/drm/drm_atomic_helper.c:1682)
 r10:00000000 r9:00000001 r8:00000001 r7:00000000 r6:8405db00 r5:83ee5050
 r4:00000000
[<80a1fc5c>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80a2130c>] (drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1658 [inline])
[<80a1fc5c>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80a2130c>] (drm_atomic_helper_commit_tail+0x84/0x94 drivers/gpu/drm/drm_atomic_helper.c:1758)
 r10:8421269c r9:00000000 r8:00000000 r7:00000001 r6:217c7950 r5:841df000
 r4:8405db00
[<80a21288>] (drm_atomic_helper_commit_tail) from [<80a22910>] (commit_tail+0x178/0x1a0 drivers/gpu/drm/drm_atomic_helper.c:1835)
 r5:00000000 r4:8405db00
[<80a22798>] (commit_tail) from [<80a22aa0>] (drm_atomic_helper_commit+0x150/0x174 drivers/gpu/drm/drm_atomic_helper.c:2073)
 r9:00000000 r8:8405db2c r7:00000000 r6:841df000 r5:00000000 r4:8405db00
[<80a22950>] (drm_atomic_helper_commit) from [<809de954>] (drm_atomic_commit+0xc0/0xf4 drivers/gpu/drm/drm_atomic.c:1514)
 r9:00000000 r8:83ee5520 r7:00000001 r6:841df000 r5:00000000 r4:8405db00
[<809de894>] (drm_atomic_commit) from [<809e51c0>] (drm_client_modeset_commit_atomic+0x21c/0x25c drivers/gpu/drm/drm_client_modeset.c:1063)
 r6:00000001 r5:841df1ac r4:8405db00
[<809e4fa4>] (drm_client_modeset_commit_atomic) from [<809e52d8>] (drm_client_modeset_commit_locked+0x64/0x18c drivers/gpu/drm/drm_client_modeset.c:1166)
 r10:841df1ec r9:00000001 r8:841df098 r7:83e71418 r6:83e71400 r5:841df000
 r4:841df000
[<809e5274>] (drm_client_modeset_commit_locked) from [<809e542c>] (drm_client_modeset_commit+0x2c/0x48 drivers/gpu/drm/drm_client_modeset.c:1192)
 r9:00000001 r8:841df098 r7:8204c8e0 r6:83e714b8 r5:841df000 r4:83e71400
[<809e5400>] (drm_client_modeset_commit) from [<80a2fcc8>] (__drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:251 [inline])
[<809e5400>] (drm_client_modeset_commit) from [<80a2fcc8>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x8c/0xc4 drivers/gpu/drm/drm_fb_helper.c:230)
 r5:83e71400 r4:00000000
[<80a2fc3c>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<80a2fc2c>] (drm_fb_helper_set_par drivers/gpu/drm/drm_fb_helper.c:1344 [inline])
[<80a2fc3c>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<80a2fc2c>] (drm_fb_helper_hotplug_event+0xf8/0x108 drivers/gpu/drm/drm_fb_helper.c:1990)
 r7:8204c8e0 r6:841df0ac r5:83e714b8 r4:83e71400
[<80a2fb34>] (drm_fb_helper_hotplug_event) from [<80a19ed8>] (drm_fbdev_dma_client_hotplug+0x24/0xc8 drivers/gpu/drm/drm_fbdev_dma.c:182)
 r5:841df000 r4:83e71400
[<80a19eb4>] (drm_fbdev_dma_client_hotplug) from [<809e4750>] (drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:238 [inline])
[<80a19eb4>] (drm_fbdev_dma_client_hotplug) from [<809e4750>] (drm_client_dev_hotplug+0xbc/0x114 drivers/gpu/drm/drm_client.c:217)
 r7:8204c8e0 r6:841df0ac r5:841df000 r4:83e71400
[<809e4694>] (drm_client_dev_hotplug) from [<80a2a990>] (drm_kms_helper_hotplug_event drivers/gpu/drm/drm_probe_helper.c:738 [inline])
[<809e4694>] (drm_client_dev_hotplug) from [<80a2a990>] (output_poll_execute+0x270/0x2c4 drivers/gpu/drm/drm_probe_helper.c:854)
 r9:00000001 r8:841df0d8 r7:00000001 r6:841df000 r5:00000001 r4:82cb2180
[<80a2a720>] (output_poll_execute) from [<802671bc>] (process_one_work+0x1c4/0x510 kernel/workqueue.c:3231)
 r10:82c16205 r9:82e3b000 r8:01800000 r7:ddde40c0 r6:82c16200 r5:841df1ec
 r4:82cb2180
[<80266ff8>] (process_one_work) from [<80267df0>] (process_scheduled_works kernel/workqueue.c:3312 [inline])
[<80266ff8>] (process_one_work) from [<80267df0>] (worker_thread+0x1ec/0x418 kernel/workqueue.c:3393)
 r10:82e3b000 r9:82cb21ac r8:61c88647 r7:ddde40e0 r6:82604d40 r5:ddde40c0
 r4:82cb2180
[<80267c04>] (worker_thread) from [<80271228>] (kthread+0x104/0x134 kernel/kthread.c:389)
 r10:00000000 r9:df819d60 r8:82cc3e40 r7:82cb2180 r6:80267c04 r5:82e3b000
 r4:82cc3c00
[<80271124>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:134)
Exception stack(0xdf87dfb0 to 0xdf87dff8)
dfa0:                                     00000000 00000000 00000000 00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80271124 r4:82cc3c00
Rebooting in 86400 seconds..


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
