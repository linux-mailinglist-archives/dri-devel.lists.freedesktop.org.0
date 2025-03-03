Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF91A54435
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62E210E8D4;
	Thu,  6 Mar 2025 08:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bf5ZwNhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801CC10E658
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:58:21 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id E3D7B40D9779
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:58:19 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bf5ZwNhv
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gS21tWSzG2D7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:02:26 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id DAEA842737; Tue,  4 Mar 2025 19:02:17 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b=Bf5ZwNhv
X-Envelope-From: <linux-kernel+bounces-541086-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b=Bf5ZwNhv
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id ABA2441FA2
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:21:21 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 7E4712DCE1
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:21:21 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6B8189173B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id C69E812B93;
 Mon,  3 Mar 2025 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bf5ZwNhv"
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643D71E5B76
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.210.48
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740986468; cv=none;
 b=NkQOi6iqtcoBZ+EWPfMk+3iaxOzu3UI6SKc8p4mXJb/9CI5KwvKJoBUp5dzNdgdP5hiF3u+20HS/8mYrobxZuZJmBvDiikrpa2ikDDJK9frvwIXLoHccp4NSFxD3ra9iubdaesheb81E3pKVzpRhtGGxe5vF3ZMrKJiT+vhYJrg=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740986468; c=relaxed/simple;
 bh=Pvp3M+wKNnNuiJ8B9CHZ4+s0HeyGLX5eihkGbOSiaXs=;
 h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
 b=iGg8SGHM5bNQrQZ3DDAvYbXOK52Eql5GSdVt3ICQSio9VAmVcJ0JeISe/0+DGOaTik50fo+/iVfS7qIcDQ3V/v6xdxStRrAxwhiID28n5NUy11B+Z41BVMY5O0kVFlgvYauwHN2pXoSQYbQ5S8EHqk/2QiAUIfOE7U/UbKFhQnE=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com;
 spf=pass smtp.mailfrom=gmail.com;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b=Bf5ZwNhv; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-72732ef2d9cso2368952a34.1
 for <linux-kernel@vger.kernel.org>; Sun, 02 Mar 2025 23:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740986465; x=1741591265; darn=vger.kernel.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hFqdwtZl0+Gf5GXC30yLZTcaGdBdfUwYXKPZtZNWkPE=;
 b=Bf5ZwNhvQRCQvPeu23ymogStL2rkO33zEWKoAkAhxYKV2fs0daIznLlNcBjMj26g8P
 eNpBPxizguVe0aMdtRxNyY0i5Z2ByfWFTq/ggIZzhkjwKjGx7I94hwYZDD9LG3maitm1
 uaLCsOdQqGp0ngozngyR4TL6ZClxPICb/hTRznZTbNiKO+Z81S2SweWCSMHI0yypSdtD
 iFGGpaMUwtMfOstKeGa6v/IzjlkyfYIw4f5gNnBtLjOyx1Xac05goDyAefieMGz9oVrI
 yItUvGSnuUgO3TqzVzFijtdLqYBuzOHEzA/wt95WVryzXAa6grp0T54izd6DWJwaBArR
 EEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740986465; x=1741591265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hFqdwtZl0+Gf5GXC30yLZTcaGdBdfUwYXKPZtZNWkPE=;
 b=Y81+thwpLdMP0J6cboOL4ibvwNz/LsIXDFONG/A4QjP2RicnV1tkdKc21+46DRdMPn
 dTkEWsNChVuIDo6yI03TYz9wDLsttNyKLk6MaK2WTK2pUENqBv0jbVI3z+fxFBehIjNY
 mns8/jNaXQe6ZDGD3V7w0msCZhIKhG/VuHOFABHDysv3MQSObxQvoMODqXkp8xarVwB9
 HRoVHc+8gWp+F74HcIGV72GaqaM4D8PDA4DBLB45wL8AxpB83F5xXGHvEKdAKYIpDdbH
 dYpoW/tL6Z6jMGtI0Hb4ovz3zFb8vjJmwTSgBdM7iX6NDaFMAtKxFCD10PyhEMkmLyud
 X80w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuPyrpIDMxG+zP3XlsrH2YgRYrjdDs1VePV46ceAzEvDMdPlnSqkDU5tHWhLX4aZM/py4DcLacFqh16fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQ/FJ22V35/l0w73hmtOL15FGreRQuKksu9SlmfG8+F1nOp4k
 COV7CXwNFs+QLJ1POEHbwP1+ukeN5WoXSBdDEe79IzRvIbEdC6n01vt5eT+ncMpNQJjZGZbz7QS
 sN8vnaXhDdp+i+6wUO3WfWqW54O4=
X-Gm-Gg: ASbGncsebiI9/Xl+QvXQomnzCNde9Z/dIPN29sS3aIZNeo2W5vS6fjA0vE55s3M/Pkr
 dDc37A3KzPuQy3PumXM75LhlyqTCsLGTh5+mKYhR+4FentogobK7v1ByEzWiomnIw/uFJLrG/zE
 KL24TXvjRBMMYBBO3dzQsrklXBug==
X-Google-Smtp-Source: AGHT+IEwxPQ9Llw9JIQnYsnrNdZoRFFeKBVxqAHrDtykyQEmyV0cWYHM2OcREc2vzNQ+1YR6AYpj1nIBdg9bELwQboA=
X-Received: by 2002:a9d:6946:0:b0:727:31a2:964 with SMTP id
 46e09a7af769-728ae594ca7mr9830062a34.8.1740986465164; Sun, 02 Mar 2025
 23:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
From: Strforexc yn <strforexc@gmail.com>
Date: Mon, 3 Mar 2025 15:20:53 +0800
X-Gm-Features: AQ5f1Jr7q1vCNIwAKImCWXUd5xrYy_qbi3dov83QEgTDup4YliqjMX4rXuCoMSY
Message-ID: <CA+HokZpFnzrS7isfKY7=NV++k9XYYOdHNi2bW+5S+G8zdKuvKQ@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free in drm_atomic_helper_wait_for_vblanks
 (DRM) on 6.14.0-rc4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6gS21tWSzG2D7
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741708951.82994@nCsOp035XftZXwua28pi1w
X-ITU-MailScanner-SpamCheck: not spam
X-Mailman-Approved-At: Thu, 06 Mar 2025 08:07:52 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Dear Linux Kernel Developers,I=E2=80=99ve encountered a KASAN-reported
slab-use-after-free in the DRM atomic helper on Linux 6.14.0-rc4
during a commit operation. Here are the details:

Kernel commit: v6.14-rc4 (Commits on Feb 24, 2025)
Kernel Config : https://github.com/Strforexc/LinuxKernelbug/blob/main/.conf=
ig
Kernel Log=EF=BC=9A https://github.com/Strforexc/LinuxKernelbug/blob/main/d=
rm_atomic_helper_wait_for_vblanks/log0
Reproduce.c:  https://github.com/Strforexc/LinuxKernelbug/blob/main/drm_ato=
mic_helper_wait_for_vblanks/repro.cprog


Bug Description=EF=BC=9A
KASAN detects a use-after-free read of size 1 at address
ffff88806b08cc09 in drm_atomic_helper_wait_for_vblanks
(drivers/gpu/drm/drm_atomic_helper.c:1662), triggered by a workqueue
commit following a page flip and client restore.

Analysis=EF=BC=9A
Location: The fault occurs in drm_atomic_helper_wait_for_vblanks at
old_state->crtcs[i].last_vblank_count, accessing a freed struct
drm_atomic_state (old_state).
Cause: old_state is allocated for a page flip, passed to a commit
workqueue, and freed during a client restore
(drm_client_modeset_commit_locked) before the workqueue completes,
leading to a use-after-free.
Context: The race involves a page flip (task 12321), a client restore
(task 12320), and an asynchronous commit (task 9416), likely triggered
by Syzkaller=E2=80=99s DRM testing.

Could DRM maintainers investigate? Possible issues:
1. insufficient reference counting for drm_atomic_state passed to commit_wo=
rk.
2. Race between drm_client_modeset_commit_locked freeing the state and
the commit workqueue using it.
Suggested fixes:
1.increment old_state refcount before queuing commit_work, decrement
after drm_atomic_helper_wait_for_vblanks.
2. Synchronize state cleanup with pending commits.

Our knowledge of the kernel is somewhat limited, and we'd appreciate
it if you could determine if there is such an issue. If this issue
doesn't have an impact, please ignore it =E2=98=BA.

If you fix this issue, please add the following tag to the commit:
Reported-by: Zhizhuo Tang strforexctzzchange@foxmail.com, Jianzhou
Zhao xnxc22xnxc22@qq.com, Haoran Liu <cherest_san@163.com>

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-use-after-free in
drm_atomic_helper_wait_for_vblanks+0x801/0x8d0
drivers/gpu/drm/drm_atomic_helper.c:1662
Read of size 1 at addr ffff88806b08cc09 by task kworker/u10:6/9416

CPU: 1 UID: 0 PID: 9416 Comm: kworker/u10:6 Not tainted 6.14.0-rc4 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014
Workqueue: events_unbound commit_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1b0 lib/dump_stack.c:120
 print_address_description.constprop.0+0x2c/0x420 mm/kasan/report.c:408
 print_report+0xaa/0x270 mm/kasan/report.c:521
 kasan_report+0xbd/0x100 mm/kasan/report.c:634
 drm_atomic_helper_wait_for_vblanks+0x801/0x8d0
drivers/gpu/drm/drm_atomic_helper.c:1662
 drm_atomic_helper_commit_tail+0x8a/0xa0
drivers/gpu/drm/drm_atomic_helper.c:1758
 commit_tail+0x357/0x400 drivers/gpu/drm/drm_atomic_helper.c:1835
 process_one_work+0x109d/0x18c0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x677/0xe90 kernel/workqueue.c:3398
 kthread+0x3b3/0x760 kernel/kthread.c:464
 ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 12321:
 kasan_save_stack+0x24/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x40 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xba/0xc0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 drm_atomic_helper_crtc_duplicate_state+0x73/0xe0
drivers/gpu/drm/drm_atomic_state_helper.c:177
 drm_atomic_get_crtc_state+0x191/0x490 drivers/gpu/drm/drm_atomic.c:360
 page_flip_common+0x57/0x320 drivers/gpu/drm/drm_atomic_helper.c:3631
 drm_atomic_helper_page_flip+0xb8/0x190 drivers/gpu/drm/drm_atomic_helper.c=
:3692
 drm_mode_page_flip_ioctl+0xf20/0x1280 drivers/gpu/drm/drm_plane.c:1516
 drm_ioctl_kernel+0x1f0/0x3f0 drivers/gpu/drm/drm_ioctl.c:796
 drm_ioctl+0x588/0xb70 drivers/gpu/drm/drm_ioctl.c:893
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x1af/0x210 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcb/0x260 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 12320:
 kasan_save_stack+0x24/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x40 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x80 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x54/0x80 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x12e/0x420 mm/slub.c:4757
 drm_atomic_state_default_clear+0x43f/0xe10 drivers/gpu/drm/drm_atomic.c:22=
4
 drm_atomic_state_clear drivers/gpu/drm/drm_atomic.c:293 [inline]
 __drm_atomic_state_free+0x185/0x2b0 drivers/gpu/drm/drm_atomic.c:310
 kref_put include/linux/kref.h:65 [inline]
 drm_atomic_state_put include/drm/drm_atomic.h:538 [inline]
 drm_client_modeset_commit_atomic+0x697/0x7d0
drivers/gpu/drm/drm_client_modeset.c:1085
 drm_client_modeset_commit_locked+0x147/0x1c0
drivers/gpu/drm/drm_client_modeset.c:1182
 drm_client_modeset_commit+0x51/0x90 drivers/gpu/drm/drm_client_modeset.c:1=
208
 __drm_fb_helper_restore_fbdev_mode_unlocked
drivers/gpu/drm/drm_fb_helper.c:237 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked
drivers/gpu/drm/drm_fb_helper.c:264 [inline]
 drm_fb_helper_lastclose+0xc5/0x160 drivers/gpu/drm/drm_fb_helper.c:1977
 drm_fbdev_client_restore+0x2c/0x50
drivers/gpu/drm/clients/drm_fbdev_client.c:31
 drm_client_dev_restore+0x18b/0x2a0 drivers/gpu/drm/drm_client_event.c:104
 drm_lastclose drivers/gpu/drm/drm_file.c:396 [inline]
 drm_release+0x2cd/0x360 drivers/gpu/drm/drm_file.c:429
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x16c/0x270 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xd8/0x260 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88806b08cc00
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 9 bytes inside of
 freed 512-byte region [ffff88806b08cc00, ffff88806b08ce00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x6b08c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0x4fff00000000040(head|node=3D1|zone=3D1|lastcpupid=3D0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801b441c80 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 04fff00000000040 ffff88801b441c80 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 04fff00000000002 ffffea0001ac2301 ffffffffffffffff 0000000000000000
head: 0000000000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEM=
ALLOC),
pid 11415, tgid 11415 (kworker/u10:6), ts 71479693708, free_ts
71465778238
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1a3/0x1d0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x8a5/0xfa0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x1d8/0x3b0 mm/page_alloc.c:4739
 alloc_pages_mpol+0x1f2/0x550 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab+0x229/0x310 mm/slub.c:2587
 ___slab_alloc+0x7f3/0x12b0 mm/slub.c:3826
 __slab_alloc.constprop.0+0x56/0xc0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __kmalloc_cache_noprof+0x280/0x450 mm/slub.c:4320
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 alloc_bprm+0x80/0x6d0 fs/exec.c:1523
 kernel_execve+0xb0/0x3b0 fs/exec.c:1991
 call_usermodehelper_exec_async+0x25f/0x4e0 kernel/umh.c:109
 ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
page last free pid 9621 tgid 9621 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x71f/0xff0 mm/page_alloc.c:2660
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x50/0x130 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a5/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x6f/0xa0 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4115 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 __do_kmalloc_node mm/slub.c:4293 [inline]
 __kmalloc_node_noprof+0x1c0/0x570 mm/slub.c:4300
 kmalloc_node_noprof include/linux/slab.h:928 [inline]
 qdisc_alloc+0xb6/0xca0 net/sched/sch_generic.c:947
 qdisc_create_dflt+0x75/0x230 net/sched/sch_generic.c:1009
 attach_one_default_qdisc net/sched/sch_generic.c:1175 [inline]
 netdev_for_each_tx_queue include/linux/netdevice.h:2590 [inline]
 attach_default_qdiscs+0x16c/0xb30 net/sched/sch_generic.c:1193
 dev_activate+0x4da/0x610 net/sched/sch_generic.c:1252
 __dev_open+0x3f5/0x540 net/core/dev.c:1644
 __dev_change_flags+0x570/0x730 net/core/dev.c:9260
 dev_change_flags+0x8e/0x170 net/core/dev.c:9332
 do_setlink.constprop.0+0x8c8/0x29e0 net/core/rtnetlink.c:3118
 rtnl_changelink net/core/rtnetlink.c:3733 [inline]
 __rtnl_newlink+0x775/0xa80 net/core/rtnetlink.c:3885
 rtnl_newlink+0x7eb/0xc90 net/core/rtnetlink.c:4022
 rtnetlink_rcv_msg+0x9f4/0xfc0 net/core/rtnetlink.c:6912

Memory state around the buggy address:
 ffff88806b08cb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88806b08cb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88806b08cc00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88806b08cc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88806b08cd00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Regards, Zhizhuo Tang

