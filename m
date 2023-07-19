Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBC758E93
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BAB10E1B5;
	Wed, 19 Jul 2023 07:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com
 [209.85.160.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583E210E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:15:55 +0000 (UTC)
Received: by mail-oa1-f77.google.com with SMTP id
 586e51a60fabf-1ba507b5535so8065443fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 00:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689750954; x=1692342954;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SmMt+1RXtbKxP54dgvLSrwyxRWOOWeHY0qYMkvZw70c=;
 b=QA2sdLqccflXoHAdveDIcVjcRtbOXnnWQtOrx2cRN86k7S14us1ZrHI8JL5oLjo6dd
 V2bEfm05oXzBJiVzpMVpTZW9RfcU2S4ochEQ9fH4P0cfD//Fvd+l+131XZk7fTuiwTNx
 wyi9NaB8mO0FUEEb/5R/tXk1XTL/AtP9BFDLaFALT489jf6j6FTv4kAYSVKzZFw3qv5E
 ezJij/cGjCuWwEKDN7oOtHOnNVIwAsRa9FvdH+y/vyfDxywmVKbMTYaNEm1U7HH8gNtg
 uXF0Mit52l9BLBdZwbrTqlAJqll5zArgBBYBrz8k+nDLic8wBDTNzs27akQW3X8lJ313
 pTzg==
X-Gm-Message-State: ABy/qLb6kZxXw/cWf6un7+fZEkPqd5tNYxFxa9k90Borv+ZCsPKYJ2/H
 42Iyh5yUvQarDQJ2frc2VUSP7Vsi0Eoqd5ZvsHOOkNt6ILAS
X-Google-Smtp-Source: APBJJlFRJxQIEVZon2lp0Rv8kpsFdjXr6IP6FbqEFKh8/DiX7zMrzuGeJVYa6LrCakym2Jy6Zx6SP8T/ozk6vQvTKF7s/bn7JRf0
MIME-Version: 1.0
X-Received: by 2002:a05:6870:35c5:b0:1b0:2d25:f5ab with SMTP id
 c5-20020a05687035c500b001b02d25f5abmr17058013oak.0.1689750954093; Wed, 19 Jul
 2023 00:15:54 -0700 (PDT)
Date: Wed, 19 Jul 2023 00:15:54 -0700
In-Reply-To: <00000000000067322b05fdfa973f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000060b4f90600d1cdd0@google.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp (2)
From: syzbot <syzbot+93bd128a383695391534@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    e40939bbfc68 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12abeba2a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4a2640e4213bc2f
dashboard link: https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107c6d56a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9d87aa312c0e/disk-e40939bb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/22a11d32a8b2/vmlinux-e40939bb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0978b5788b52/Image-e40939bb.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+93bd128a383695391534@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 25438 at drivers/gpu/drm/vkms/vkms_crtc.c:103 vkms_get_vblank_timestamp+0x1a4/0x1d4 drivers/gpu/drm/vkms/vkms_crtc.c:103
Modules linked in:
CPU: 1 PID: 25438 Comm: syz-executor.4 Not tainted 6.4.0-rc7-syzkaller-ge40939bbfc68 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/03/2023
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : vkms_get_vblank_timestamp+0x1a4/0x1d4 drivers/gpu/drm/vkms/vkms_crtc.c:103
lr : vkms_get_vblank_timestamp+0x1a4/0x1d4 drivers/gpu/drm/vkms/vkms_crtc.c:103
sp : ffff800097a271f0
x29: ffff800097a271f0 x28: ffff0000c612f080 x27: 0000000000000000
x26: 1ffff00012f44e4c x25: 1ffff00012f44e70 x24: 0000000000000000
x23: ffff0000cb948000 x22: dfff800000000000 x21: 000000df48e233a8
x20: 000000df48e233a8 x19: ffff800097a27380 x18: ffff800097a27d28
x17: 0000000000000000 x16: ffff80008a395170 x15: 0000000000000000
x14: 1ffff00011bde0ac x13: 0000000000000000 x12: ffff80009a3d9000
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : ffff0000d881b780 x7 : 0000000000000000 x6 : ffff80009a3d9000
x5 : ffff0000d08378e8 x4 : ffff0000d08378a8 x3 : 0000000000000000
x2 : ffff800097a27380 x1 : 000000df48e233a8 x0 : 000000df48e233a8
Call trace:
 vkms_get_vblank_timestamp+0x1a4/0x1d4 drivers/gpu/drm/vkms/vkms_crtc.c:103
 drm_crtc_get_last_vbltimestamp drivers/gpu/drm/drm_vblank.c:877 [inline]
 drm_crtc_next_vblank_start+0x1d4/0x3e0 drivers/gpu/drm/drm_vblank.c:1012
 set_fence_deadline drivers/gpu/drm/drm_atomic_helper.c:1537 [inline]
 drm_atomic_helper_wait_for_fences+0x200/0x7c4 drivers/gpu/drm/drm_atomic_helper.c:1584
 drm_atomic_helper_commit+0x500/0x94c drivers/gpu/drm/drm_atomic_helper.c:2013
 drm_atomic_commit+0x24c/0x2a0 drivers/gpu/drm/drm_atomic.c:1503
 drm_client_modeset_commit_atomic+0x5a4/0x730 drivers/gpu/drm/drm_client_modeset.c:1045
 drm_client_modeset_commit_locked+0xd0/0x4a8 drivers/gpu/drm/drm_client_modeset.c:1148
 drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_client_modeset.c:1174
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:251 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:278 [inline]
 drm_fb_helper_lastclose+0xc0/0x160 drivers/gpu/drm/drm_fb_helper.c:2363
 drm_fbdev_generic_client_restore+0x3c/0x50 drivers/gpu/drm/drm_fbdev_generic.c:260
 drm_client_dev_restore+0x12c/0x24c drivers/gpu/drm/drm_client.c:236
 drm_lastclose drivers/gpu/drm/drm_file.c:462 [inline]
 drm_release+0x500/0x608 drivers/gpu/drm/drm_file.c:493
 __fput+0x30c/0x7bc fs/file_table.c:321
 ____fput+0x20/0x30 fs/file_table.c:349
 task_work_run+0x230/0x2e0 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 do_notify_resume+0x2180/0x3c90 arch/arm64/kernel/signal.c:1305
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:137 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:144 [inline]
 el0_svc+0x94/0x160 arch/arm64/kernel/entry-common.c:648
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:665
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591
irq event stamp: 2010
hardirqs last  enabled at (2009): [<ffff80008a44626c>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:84 [inline]
hardirqs last  enabled at (2009): [<ffff80008a44626c>] exit_to_kernel_mode+0xdc/0x10c arch/arm64/kernel/entry-common.c:94
hardirqs last disabled at (2010): [<ffff80008a443db4>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:407
softirqs last  enabled at (1920): [<ffff800080034380>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (1918): [<ffff80008003434c>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
