Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D634C527871
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 17:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DBB11240F;
	Sun, 15 May 2022 15:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B98C10E8E4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 May 2022 08:08:21 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 g11-20020a056e021a2b00b002cf48b48824so6123902ile.21
 for <dri-devel@lists.freedesktop.org>; Sat, 14 May 2022 01:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=J6JFQq6mil3YIkYftoI8kQRDl+RyVeEFs1MZE/tezIc=;
 b=CwVgguiLLJ3h50YBz8mETJ4CXy93f7EBLGcmgNNjDLcZB9xtbuCCp2MtyKruYWno7s
 g7CEPXuq9D2/XikSNX0x9xVrhCp+jHpmmjjRrOasGXiN1kvN3BAEdJXUr1X25N39PgEl
 pFLYy23KoYQbExWJtyuyde7FAR9kukJGmzMjMVvX8qjG5C2mIr2UXwCr+Exkv4WiTBc6
 NsSTPng2rSlnaJl1peLVek1WjRORhwUG3Qt4GwAeWsEWd6aG4XYpIyKBOZgeOzDauM3a
 0vF4xKk9Vqg3mF+5UdcbLNpsREvmYAvJVlPxI6Lys/BDySstcstAHQR9otURlxKlGwe1
 Q+rQ==
X-Gm-Message-State: AOAM532hmL//fpSGDAkjaKYQcs48jhN9U6ywB8g9nxoeUZyxSEKa+jFp
 SRtX/K1grdYSdVMHLzJkt4qKMMqCFSwZ7CzgKEwKNnOhoaD2
X-Google-Smtp-Source: ABdhPJxkRk3DcDw0kS90ilV3lM0tf8iFU+RgXJK622aFFqugfyLpp2tucwJV2xxNGIMCsG7ewb55/L3WB71gQtNWzEYFPCNG4y+C
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1485:b0:2cd:fa3d:72b9 with SMTP id
 n5-20020a056e02148500b002cdfa3d72b9mr4451373ilk.247.1652515700692; Sat, 14
 May 2022 01:08:20 -0700 (PDT)
Date: Sat, 14 May 2022 01:08:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000053626005def44bec@google.com>
Subject: [syzbot] WARNING in drm_atomic_helper_wait_for_vblanks (2)
From: syzbot <syzbot+f95421e61338eb84132a@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 15 May 2022 15:27:26 +0000
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

HEAD commit:    9be9ed2612b5 Merge tag 'platform-drivers-x86-v5.18-4' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12dc2e49f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ab029f8aaef5349
dashboard link: https://syzkaller.appspot.com/bug?extid=f95421e61338eb84132a
compiler:       arm-linux-gnueabi-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f95421e61338eb84132a@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 11618 at drivers/gpu/drm/drm_atomic_helper.c:1529 drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2b8 drivers/gpu/drm/drm_atomic_helper.c:1529
[CRTC:33:crtc-0] vblank wait timed out
Modules linked in:
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 11618 Comm: syz-executor.0 Not tainted 5.18.0-rc6-syzkaller #0
Hardware name: ARM-Versatile Express
Backtrace: 
[<816dadf0>] (dump_backtrace) from [<816db120>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:253)
 r7:81d665f4 r6:82222b64 r5:60000093 r4:81d73dd4
[<816db108>] (show_stack) from [<816e3a20>] (__dump_stack lib/dump_stack.c:88 [inline])
[<816db108>] (show_stack) from [<816e3a20>] (dump_stack_lvl+0x48/0x54 lib/dump_stack.c:106)
[<816e39d8>] (dump_stack_lvl) from [<816e3a44>] (dump_stack+0x18/0x1c lib/dump_stack.c:113)
 r5:00000000 r4:82442d14
[<816e3a2c>] (dump_stack) from [<816dbcbc>] (panic+0x11c/0x360 kernel/panic.c:250)
[<816dbba0>] (panic) from [<80242928>] (__warn+0x98/0x198 kernel/panic.c:599)
 r3:00000001 r2:00000000 r1:00000000 r0:81d665f4
 r7:80913100
[<80242890>] (__warn) from [<816dbf9c>] (warn_slowpath_fmt+0x9c/0xd4 kernel/panic.c:629)
 r8:00000009 r7:80913100 r6:000005f9 r5:81dd6170 r4:81dd677c
[<816dbf04>] (warn_slowpath_fmt) from [<80913100>] (drm_atomic_helper_wait_for_vblanks.part.0+0x2ac/0x2b8 drivers/gpu/drm/drm_atomic_helper.c:1529)
 r8:0000649a r7:00000000 r6:82a1d000 r5:829e0050 r4:00000000
[<80912e54>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80914620>] (drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1505 [inline])
[<80912e54>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80914620>] (drm_atomic_helper_commit_tail+0x84/0x94 drivers/gpu/drm/drm_atomic_helper.c:1605)
 r10:8425185c r9:83f0e800 r8:00000000 r7:00000136 r6:739d46c0 r5:83f0e800
 r4:82a1d000
[<8091459c>] (drm_atomic_helper_commit_tail) from [<80915170>] (commit_tail+0x164/0x18c drivers/gpu/drm/drm_atomic_helper.c:1682)
 r5:00000000 r4:82a1d000
[<8091500c>] (commit_tail) from [<80915d3c>] (drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:1900 [inline])
[<8091500c>] (commit_tail) from [<80915d3c>] (drm_atomic_helper_commit+0x14c/0x170 drivers/gpu/drm/drm_atomic_helper.c:1833)
 r9:83f0e800 r8:82a1d02c r7:00000000 r6:83f0e800 r5:00000000 r4:82a1d000
[<80915bf0>] (drm_atomic_helper_commit) from [<80934bb4>] (drm_atomic_commit+0x58/0x5c drivers/gpu/drm/drm_atomic.c:1434)
 r9:83f0e800 r8:829e0340 r7:00000001 r6:00000001 r5:83f0e800 r4:82a1d000
[<80934b5c>] (drm_atomic_commit) from [<8094c7bc>] (drm_client_modeset_commit_atomic+0x200/0x248 drivers/gpu/drm/drm_client_modeset.c:1044)
 r5:83f0e9ac r4:82a1d000
[<8094c5bc>] (drm_client_modeset_commit_atomic) from [<8094c8dc>] (drm_client_modeset_commit_locked+0x64/0x18c drivers/gpu/drm/drm_client_modeset.c:1147)
 r10:5ac3c35a r9:83f0e894 r8:81ddde34 r7:8417ea18 r6:8417ea00 r5:83f0e800
 r4:83f0e800
[<8094c878>] (drm_client_modeset_commit_locked) from [<8094ca30>] (drm_client_modeset_commit+0x2c/0x48 drivers/gpu/drm/drm_client_modeset.c:1173)
 r9:83f0e894 r8:81ddde34 r7:8417eab4 r6:00000000 r5:83f0e800 r4:8417ea00
[<8094ca04>] (drm_client_modeset_commit) from [<8091db08>] (__drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:252 [inline])
[<8094ca04>] (drm_client_modeset_commit) from [<8091db08>] (__drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:231 [inline])
[<8094ca04>] (drm_client_modeset_commit) from [<8091db08>] (drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:279 [inline])
[<8094ca04>] (drm_client_modeset_commit) from [<8091db08>] (drm_fb_helper_lastclose drivers/gpu/drm/drm_fb_helper.c:2035 [inline])
[<8094ca04>] (drm_client_modeset_commit) from [<8091db08>] (drm_fbdev_client_restore+0x5c/0x98 drivers/gpu/drm/drm_fb_helper.c:2445)
 r5:82349ecc r4:8417ea00
[<8091daac>] (drm_fbdev_client_restore) from [<8094c210>] (drm_client_dev_restore+0x7c/0xc8 drivers/gpu/drm/drm_client.c:226)
 r7:83f0e8a8 r6:83f0e800 r5:83f0e86c r4:8417ea00
[<8094c194>] (drm_client_dev_restore) from [<8091fd30>] (drm_lastclose drivers/gpu/drm/drm_file.c:467 [inline])
[<8094c194>] (drm_client_dev_restore) from [<8091fd30>] (drm_release+0x130/0x150 drivers/gpu/drm/drm_file.c:498)
 r9:7efffd08 r8:8429a010 r7:8424d6c0 r6:850e0cc0 r5:83f0e86c r4:83f0e800
[<8091fc00>] (drm_release) from [<80492948>] (__fput+0x84/0x258 fs/file_table.c:317)
 r7:82c14440 r6:82969008 r5:000a201d r4:850e0cc0
[<804928c4>] (__fput) from [<80492b98>] (____fput+0x10/0x14 fs/file_table.c:350)
 r9:7efffd08 r8:841c0854 r7:824435dc r6:841c0000 r5:841c0824 r4:00000000
[<80492b88>] (____fput) from [<80267280>] (task_work_run+0x8c/0xb8 kernel/task_work.c:164)
[<802671f4>] (task_work_run) from [<8020c030>] (resume_user_mode_work include/linux/resume_user_mode.h:49 [inline])
[<802671f4>] (task_work_run) from [<8020c030>] (do_work_pending+0x430/0x51c arch/arm/kernel/signal.c:630)
 r9:7efffd08 r8:802002a4 r7:fffffe30 r6:802002a4 r5:ea685fb0 r4:841c0000
[<8020bc00>] (do_work_pending) from [<80200088>] (slow_work_pending+0xc/0x20)
Exception stack(0xea685fb0 to 0xea685ff8)
5fa0:                                     00000000 00000002 00000000 00000003
5fc0: 00000004 023d04c0 0012bf9c 00000006 00000000 0012bf90 001369f8 00000000
5fe0: 2f260000 7ed95348 000293ac 00029868 80000010 00000003
 r10:00000006 r9:841c0000 r8:802002a4 r7:00000006 r6:0012bf9c r5:023d04c0
 r4:00000004
SMP: failed to stop secondary CPUs
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
