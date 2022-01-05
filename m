Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049F4853D8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 14:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6B689109;
	Wed,  5 Jan 2022 13:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4A210E87D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 08:44:19 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 r12-20020a056e0219cc00b002b52dee3ee1so17359969ill.16
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 00:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=mCkcmYU9oCL6KT9IEARw6vJUFUGIUiX4y+eoRKhtTBA=;
 b=GyaDlfWBvUcrK5YpiJaFoDik61s561EX+hcdouxLr+ZY31uL/MIZ6jOVZLcRJ5qubq
 BlbAuWXN/YXNz7ul+0gMjRE4B/9W+KUBjeEkdLowa5M28osXqYHrAhD7VQiRx8ZRNRew
 XaVVGWR4ooCZU08UIiJshuR8Rp73dR71/Ker5xHic/eWSijlNeGDlV4HVYKJyIqYK1/9
 IUyw07pUnAT74oTT1+Z2MYSvnegr7SBsEu9udWpc4sEq1ysJEohJKiNCzJwq7B0MI40w
 ObfB0M5FegSvJ8Io57UKwBQEEnw8agduFLDasibiSsKtqTeuwTIK7EGGNdjtjiHBA/6+
 K7dw==
X-Gm-Message-State: AOAM5318xZnHOBjnzRtUB4wSByvabDsD6wRg3o3EkW+Q7IQe3uiKX38p
 8hRdtJLy1xthlxuWnBGzIL95nh3FalmsW2dPcgTgThqXjBDB
X-Google-Smtp-Source: ABdhPJzipN9697NfCAv0h1ouT2iclO+sAElfl9BJW6L/KlEln3IcZpJfpOm8B0LQXD/xcjgpsunSO7q/lYAByqkad7QnFaOjgP3C
MIME-Version: 1.0
X-Received: by 2002:a92:dd12:: with SMTP id n18mr25440881ilm.266.1641372258690; 
 Wed, 05 Jan 2022 00:44:18 -0800 (PST)
Date: Wed, 05 Jan 2022 00:44:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006c6d3f05d4d1c214@google.com>
Subject: [syzbot] WARNING in drm_atomic_helper_wait_for_vblanks
From: syzbot <syzbot+b7db9fbc95be52cf485d@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 Jan 2022 13:54:28 +0000
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

HEAD commit:    800829388818 mm: vmscan: reduce throttling due to a failur..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158d5fc3b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=35d2332e44a37812
dashboard link: https://syzkaller.appspot.com/bug?extid=b7db9fbc95be52cf485d
compiler:       arm-linux-gnueabi-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b7db9fbc95be52cf485d@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 13058 at drivers/gpu/drm/drm_atomic_helper.c:1514 drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2b8 drivers/gpu/drm/drm_atomic_helper.c:1514
[CRTC:32:crtc-0] vblank wait timed out
Modules linked in:
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 13058 Comm: syz-executor.1 Not tainted 5.16.0-rc7-syzkaller #0
Hardware name: ARM-Versatile Express
Backtrace: 
[<816bd724>] (dump_backtrace) from [<816bd910>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:237)
 r7:81d53678 r6:82222be8 r5:60000093 r4:81d60e84
[<816bd8f8>] (show_stack) from [<816c6398>] (__dump_stack lib/dump_stack.c:88 [inline])
[<816bd8f8>] (show_stack) from [<816c6398>] (dump_stack_lvl+0x48/0x54 lib/dump_stack.c:106)
[<816c6350>] (dump_stack_lvl) from [<816c63bc>] (dump_stack+0x18/0x1c lib/dump_stack.c:113)
 r5:00000000 r4:8243cd18
[<816c63a4>] (dump_stack) from [<816be3f0>] (panic+0x104/0x32c kernel/panic.c:232)
[<816be2ec>] (panic) from [<80241f08>] (__warn+0xa4/0x134 kernel/panic.c:603)
 r3:8220c488 r2:00000000 r1:00000000 r0:81d53678
 r7:00000009
[<80241e64>] (__warn) from [<816be6b4>] (warn_slowpath_fmt+0x9c/0xd4 kernel/panic.c:633)
 r7:809265bc r6:000005ea r5:81dc58c0 r4:81dc5e60
[<816be61c>] (warn_slowpath_fmt) from [<809265bc>] (drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2b8 drivers/gpu/drm/drm_atomic_helper.c:1514)
 r8:0000161b r7:00000000 r6:850c0cc0 r5:840dc050 r4:00000000
[<80926310>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80927bf4>] (drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1490 [inline])
[<80926310>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80927bf4>] (drm_atomic_helper_commit_tail+0x80/0x90 drivers/gpu/drm/drm_atomic_helper.c:1590)
 r10:8421c15c r9:83f4c000 r8:00000000 r7:00000168 r6:f8c64d30 r5:83f4c000
 r4:850c0cc0
[<80927b74>] (drm_atomic_helper_commit_tail) from [<8092873c>] (commit_tail+0x164/0x188 drivers/gpu/drm/drm_atomic_helper.c:1667)
 r5:00000000 r4:850c0cc0
[<809285d8>] (commit_tail) from [<809290e8>] (drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:1884 [inline])
[<809285d8>] (commit_tail) from [<809290e8>] (drm_atomic_helper_commit+0x14c/0x170 drivers/gpu/drm/drm_atomic_helper.c:1817)
 r9:83f4c000 r8:850c0cec r7:00000000 r6:83f4c000 r5:00000000 r4:850c0cc0
[<80928f9c>] (drm_atomic_helper_commit) from [<80949588>] (drm_atomic_commit+0x4c/0x58 drivers/gpu/drm/drm_atomic.c:1412)
 r9:83f4c000 r8:840dc340 r7:00000001 r6:83f4c000 r5:850c0cc0 r4:00000000
[<8094953c>] (drm_atomic_commit) from [<80960b8c>] (drm_client_modeset_commit_atomic+0x200/0x248 drivers/gpu/drm/drm_client_modeset.c:1043)
 r7:00000001 r6:00000001 r5:83f4c1ac r4:850c0cc0
[<8096098c>] (drm_client_modeset_commit_atomic) from [<80960cac>] (drm_client_modeset_commit_locked+0x64/0x18c drivers/gpu/drm/drm_client_modeset.c:1146)
 r10:8220c44c r9:83f4c094 r8:81dcd740 r7:8411f818 r6:8411f800 r5:83f4c000
 r4:83f4c000
[<80960c48>] (drm_client_modeset_commit_locked) from [<80960e00>] (drm_client_modeset_commit+0x2c/0x48 drivers/gpu/drm/drm_client_modeset.c:1172)
 r9:83f4c094 r8:81dcd740 r7:8411f8b4 r6:00000000 r5:83f4c000 r4:8411f800
[<80960dd4>] (drm_client_modeset_commit) from [<80930dc4>] (__drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:252 [inline])
[<80960dd4>] (drm_client_modeset_commit) from [<80930dc4>] (__drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:231 [inline])
[<80960dd4>] (drm_client_modeset_commit) from [<80930dc4>] (drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:279 [inline])
[<80960dd4>] (drm_client_modeset_commit) from [<80930dc4>] (drm_fb_helper_lastclose drivers/gpu/drm/drm_fb_helper.c:2003 [inline])
[<80960dd4>] (drm_client_modeset_commit) from [<80930dc4>] (drm_fbdev_client_restore+0x5c/0x98 drivers/gpu/drm/drm_fb_helper.c:2403)
 r5:823487f8 r4:8411f800
[<80930d68>] (drm_fbdev_client_restore) from [<809605e0>] (drm_client_dev_restore+0x7c/0xc8 drivers/gpu/drm/drm_client.c:226)
 r7:83f4c0a8 r6:83f4c000 r5:83f4c06c r4:8411f800
[<80960564>] (drm_client_dev_restore) from [<80933b00>] (drm_lastclose drivers/gpu/drm/drm_file.c:467 [inline])
[<80960564>] (drm_client_dev_restore) from [<80933b00>] (drm_release+0x130/0x150 drivers/gpu/drm/drm_file.c:498)
 r9:5ac3c35a r8:847bb610 r7:842190c0 r6:850c1900 r5:83f4c06c r4:83f4c000
[<809339d0>] (drm_release) from [<80487ed0>] (__fput+0x84/0x258 fs/file_table.c:280)
 r7:82ccce58 r6:83932ba8 r5:000a201d r4:850c1900
[<80487e4c>] (__fput) from [<80488120>] (____fput+0x10/0x14 fs/file_table.c:313)
 r9:5ac3c35a r8:836f8854 r7:8243d600 r6:836f8000 r5:836f8824 r4:00000000
[<80488110>] (____fput) from [<80266f04>] (task_work_run+0x8c/0xb8 kernel/task_work.c:164)
[<80266e78>] (task_work_run) from [<8020bff0>] (tracehook_notify_resume include/linux/tracehook.h:189 [inline])
[<80266e78>] (task_work_run) from [<8020bff0>] (do_work_pending+0x438/0x53c arch/arm/kernel/signal.c:630)
 r9:5ac3c35a r8:80200244 r7:fffffe30 r6:80200244 r5:85195fb0 r4:836f8000
[<8020bbb8>] (do_work_pending) from [<80200088>] (slow_work_pending+0xc/0x20)
Exception stack(0x85195fb0 to 0x85195ff8)
5fa0:                                     00000000 00000002 00000000 00000003
5fc0: 00000004 01d844c0 0012bf94 00000006 00000000 0012bf88 00130240 00000000
5fe0: 2ce20000 7edf8348 000291dc 00029698 80000010 00000003
 r10:00000006 r9:836f8000 r8:80200244 r7:00000006 r6:0012bf94 r5:01d844c0
 r4:00000004
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
