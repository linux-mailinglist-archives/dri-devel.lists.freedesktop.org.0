Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC49FEA21
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5F710E2CF;
	Mon, 30 Dec 2024 18:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v0cET8Hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738BE10E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:50:57 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4679b5c66d0so2502741cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735584596; x=1736189396;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlAbC4wnqhpknij/cF+MZxS4IRkirEbpZ/AJ7ZWRYyI=;
 b=v0cET8HnnSc9kBP0wgbgT/VVaKcfCI7MIkPAL2PQ6NZcclb6zJflmAY/ITG/Un8hrz
 EpMxfQfS7P4BqXqKq2Nb7H5cQ1PNMqFByqoiZuIBNJ9I7+L02cMVlkMNAefR6zNa8BWL
 Py/o7H6iwvWkitsl7aq+VrGeVcVTdn/c/xpAg5U+eTF5xQnX7BKTrd95bqYAkYBlxqv4
 NB2osNjAhEJeJaBQ0A4irfZBjinM/Ql/CAqch6mmpOoStQQlaRLvVIY7+3MNnRDCfYoO
 DniNrbe8Isad5t8WKM0SHaHbbWfQNGuFMk9XkfzTwbO8COTbbjtnBlkzObmvmiHVlAZ/
 uXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735584596; x=1736189396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlAbC4wnqhpknij/cF+MZxS4IRkirEbpZ/AJ7ZWRYyI=;
 b=wO+h6sgLzXBhibcBd/s2tznN35oJyCUfLiv/rH/jX6hHIhdx2htJqtp0GoyF3cqFTD
 ULRDGLSuzXmS0aJRn0CfgdBgEBIV/SVAEuHmbVc1ZM1iHTlbrRvul1+CpxcEJzztOKb/
 jgsw+RJFHO3axKMLEoShi2+IDsjEFeKwWhReTVXchdQRwVOlUTg1X9kNdFb5/PV/iiiJ
 auMxEWdEOXQmWiE1VVWqr56HLkQAbcrW5VfVQTfNUREVJGClWpVR5FE8sfXpZuJD72Ph
 907UUmTIgRHo+0mjq8/z6wg+2ciI2tAPd5LEp5M86A/Ra48fQhHokBlttWwWBwDxvnTs
 WV+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCAe+4Cq0YgVqaeEIf7NYR1PEswqh8WvI040RhRxx5TcaWdbAtQP0v63hSPaJBCWDDEafSiPe/Xgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx964Rk3xg8uAVhUXcb2CC0rx6AHXtGyAqxjPNnp8/s4dR+9ytx
 N0BdYinf6IXLvx91b8IMzPleRW6Hq0/akitfM+J/jjpFY3GdX3t8rLZN//qnQm+ty819ZfSC0o3
 QgMW4+Hxlu2BJbNVpzDXkcvs7Q8q9Kwptto+I
X-Gm-Gg: ASbGncsHWxTsvVEoj8e3oU9LbIVKNJq6GUbCUuFi+bE3JhdM4I7ycPzHEfyGeKzxXNp
 GRwUjIDGo0L7gNRc/cNYUvHX4WFWepDdu9cxkeA==
X-Google-Smtp-Source: AGHT+IGYBUNK6aYMnJG/vIeCS4E16ZWaexrtJukTdIh0Q5BsWiAQWmRCcCGVKJ3qrBjeehUDwymsI0s3AoS/GioslWM=
X-Received: by 2002:ac8:5e51:0:b0:467:5fea:d4c4 with SMTP id
 d75a77b69052e-46a4c01caa7mr28307581cf.27.1735584596098; Mon, 30 Dec 2024
 10:49:56 -0800 (PST)
MIME-Version: 1.0
References: <676ea4aa.050a0220.2f3838.0483.GAE@google.com>
 <20241228001926.517-1-hdanton@sina.com>
 <CAJuCfpHRQUa8O8UY56oLEyyv06ATSW8wdob01C4u8JwHE7u7FQ@mail.gmail.com>
 <Z2_KXFdi5mSZ9kLa@boqun-archlinux> <Z3LlMKBdez_ks-6N@boqun-archlinux>
In-Reply-To: <Z3LlMKBdez_ks-6N@boqun-archlinux>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 30 Dec 2024 10:49:44 -0800
Message-ID: <CAJuCfpFBWG4MtYJQDRxeqgY_b1eF1c=gQd06RXOVLxZoP9t2Xw@mail.gmail.com>
Subject: Re: [syzbot] [net?] possible deadlock in vm_insert_page
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Hillf Danton <hdanton@sina.com>, 
 syzbot <syzbot+11701838dd42428ab7b3@syzkaller.appspotmail.com>, 
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, edumazet@google.com, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 syzkaller-bugs@googlegroups.com, Kent Overstreet <kent.overstreet@linux.dev>, 
 linux-bcachefs@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Dec 30, 2024 at 10:24=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Sat, Dec 28, 2024 at 01:52:28AM -0800, Boqun Feng wrote:
> > On Fri, Dec 27, 2024 at 06:03:45PM -0800, Suren Baghdasaryan wrote:
> > > On Fri, Dec 27, 2024 at 4:19=E2=80=AFPM Hillf Danton <hdanton@sina.co=
m> wrote:
> > > >
> > > > On Fri, 27 Dec 2024 04:59:22 -0800
> > > > > Hello,
> > > > >
> > > > > syzbot found the following issue on:
> > > > >
> > > > > HEAD commit:    573067a5a685 Merge branch 'for-next/core' into fo=
r-kernelci
> > > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm=
64/linux.git for-kernelci
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D149fd=
fe8580000
> > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dcd720=
2b56d469648
> > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D1170183=
8dd42428ab7b3
> > > > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils=
 for Debian) 2.40
> > > > > userspace arch: arm64
> > > > >
> > > > > Unfortunately, I don't have any reproducer for this issue yet.
> > > > >
> > > > > Downloadable assets:
> > > > > disk image: https://storage.googleapis.com/syzbot-assets/9d3b5c85=
5aa0/disk-573067a5.raw.xz
> > > > > vmlinux: https://storage.googleapis.com/syzbot-assets/0c06fc1ead8=
3/vmlinux-573067a5.xz
> > > > > kernel image: https://storage.googleapis.com/syzbot-assets/3390e5=
9b9e4b/Image-573067a5.gz.xz
> > > > >
> > > > > IMPORTANT: if you fix the issue, please add the following tag to =
the commit:
> > > > > Reported-by: syzbot+11701838dd42428ab7b3@syzkaller.appspotmail.co=
m
> > > > >
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > WARNING: possible circular locking dependency detected
> > > > > 6.13.0-rc3-syzkaller-g573067a5a685 #0 Not tainted
> > > > > ------------------------------------------------------
> > > > > syz.8.396/8273 is trying to acquire lock:
> > > > > ffff0000d0caa9b8 (&vma->vm_lock->lock){++++}-{4:4}, at: vma_start=
_write include/linux/mm.h:769 [inline]
> > > > > ffff0000d0caa9b8 (&vma->vm_lock->lock){++++}-{4:4}, at: vm_flags_=
set include/linux/mm.h:899 [inline]
> > > > > ffff0000d0caa9b8 (&vma->vm_lock->lock){++++}-{4:4}, at: vm_insert=
_page+0x2a0/0xab0 mm/memory.c:2241
> > > > >
> > > > > but task is already holding lock:
> > > > > ffff0000d4aa2868 (&po->pg_vec_lock){+.+.}-{4:4}, at: packet_mmap+=
0x9c/0x4c8 net/packet/af_packet.c:4650
> > > > >
> > > > > which lock already depends on the new lock.
> > > > >
> > > > >
> > > > > the existing dependency chain (in reverse order) is:
> > > > >
> > > > > -> #10 (&po->pg_vec_lock){+.+.}-{4:4}:
> > > > >        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:58=
5
> > > > >        __mutex_lock kernel/locking/mutex.c:735 [inline]
> > > > >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
> > > > >        packet_mmap+0x9c/0x4c8 net/packet/af_packet.c:4650
> > > > >        sock_mmap+0x90/0xa8 net/socket.c:1403
> > > > >        call_mmap include/linux/fs.h:2183 [inline]
> > > > >        mmap_file mm/internal.h:124 [inline]
> > > > >        __mmap_new_file_vma mm/vma.c:2291 [inline]
> > > > >        __mmap_new_vma mm/vma.c:2355 [inline]
> > > > >        __mmap_region+0x1854/0x2180 mm/vma.c:2456
> > > > >        mmap_region+0x1f4/0x370 mm/mmap.c:1348
> > > > >        do_mmap+0x8b0/0xfd0 mm/mmap.c:496
> > > > >        vm_mmap_pgoff+0x1a0/0x38c mm/util.c:580
> > > > >        ksys_mmap_pgoff+0x3a4/0x5c8 mm/mmap.c:542
> > > > >        __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
> > > > >        __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
> > > > >        __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
> > > > >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> > > > >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> > > > >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> > > > >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> > > > >        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
> > > > >        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-co=
mmon.c:762
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > -> #9 (&mm->mmap_lock){++++}-{4:4}:
> > > > >        __might_fault+0xc4/0x124 mm/memory.c:6751
> > > > >        drm_mode_object_get_properties+0x208/0x540 drivers/gpu/drm=
/drm_mode_object.c:407
> > > > >        drm_mode_obj_get_properties_ioctl+0x2bc/0x4fc drivers/gpu/=
drm/drm_mode_object.c:459
> > > > >        drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:7=
96
> > > > >        drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:893
> > > > >        vfs_ioctl fs/ioctl.c:51 [inline]
> > > > >        __do_sys_ioctl fs/ioctl.c:906 [inline]
> > > > >        __se_sys_ioctl fs/ioctl.c:892 [inline]
> > > > >        __arm64_sys_ioctl+0x14c/0x1cc fs/ioctl.c:892
> > > > >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> > > > >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> > > > >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> > > > >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> > > > >        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
> > > > >        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-co=
mmon.c:762
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > -> #8 (crtc_ww_class_mutex){+.+.}-{4:4}:
> > > > >        ww_acquire_init include/linux/ww_mutex.h:162 [inline]
> > > > >        drm_modeset_acquire_init+0x1e4/0x384 drivers/gpu/drm/drm_m=
odeset_lock.c:250
> > > > >        drmm_mode_config_init+0xb98/0x130c drivers/gpu/drm/drm_mod=
e_config.c:453
> > > > >        vkms_modeset_init drivers/gpu/drm/vkms/vkms_drv.c:158 [inl=
ine]
> > > > >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:219 [inline]
> > > > >        vkms_init+0x2fc/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
> > > > >        do_one_initcall+0x254/0x9f8 init/main.c:1266
> > > > >        do_initcall_level+0x154/0x214 init/main.c:1328
> > > > >        do_initcalls+0x58/0xac init/main.c:1344
> > > > >        do_basic_setup+0x8c/0xa0 init/main.c:1363
> > > > >        kernel_init_freeable+0x324/0x478 init/main.c:1577
> > > > >        kernel_init+0x24/0x2a0 init/main.c:1466
> > > > >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> > > > >
> > > > > -> #7 (crtc_ww_class_acquire){+.+.}-{0:0}:
> > > > >        ww_acquire_init include/linux/ww_mutex.h:161 [inline]
> > > > >        drm_modeset_acquire_init+0x1c4/0x384 drivers/gpu/drm/drm_m=
odeset_lock.c:250
> > > > >        drm_client_modeset_commit_atomic+0xd8/0x724 drivers/gpu/dr=
m/drm_client_modeset.c:1009
> > > > >        drm_client_modeset_commit_locked+0xd0/0x4a8 drivers/gpu/dr=
m/drm_client_modeset.c:1173
> > > > >        drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_cl=
ient_modeset.c:1199
> > > > >        __drm_fb_helper_restore_fbdev_mode_unlocked+0xd4/0x178 dri=
vers/gpu/drm/drm_fb_helper.c:237
> > > > >        drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_he=
lper.c:1351
> > > > >        fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1=
113
> > > > >        visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
> > > > >        do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
> > > > >        do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
> > > > >        do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbc=
on.c:549
> > > > >        do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [in=
line]
> > > > >        fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/f=
bcon.c:3008
> > > > >        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:4=
49 [inline]
> > > > >        register_framebuffer+0x470/0x610 drivers/video/fbdev/core/=
fbmem.c:515
> > > > >        __drm_fb_helper_initial_config_and_unlock+0x137c/0x1910 dr=
ivers/gpu/drm/drm_fb_helper.c:1841
> > > > >        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm=
_fb_helper.c:1906
> > > > >        drm_fbdev_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_f=
bdev_client.c:51
> > > > >        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client=
.c:140
> > > > >        drm_fbdev_client_setup+0x1a4/0x39c drivers/gpu/drm/drm_fbd=
ev_client.c:158
> > > > >        drm_client_setup+0x28/0x9c drivers/gpu/drm/drm_client_setu=
p.c:29
> > > > >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:230 [inline]
> > > > >        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
> > > > >        do_one_initcall+0x254/0x9f8 init/main.c:1266
> > > > >        do_initcall_level+0x154/0x214 init/main.c:1328
> > > > >        do_initcalls+0x58/0xac init/main.c:1344
> > > > >        do_basic_setup+0x8c/0xa0 init/main.c:1363
> > > > >        kernel_init_freeable+0x324/0x478 init/main.c:1577
> > > > >        kernel_init+0x24/0x2a0 init/main.c:1466
> > > > >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> > > > >
> > > > > -> #6 (&client->modeset_mutex){+.+.}-{4:4}:
> > > > >        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:58=
5
> > > > >        __mutex_lock kernel/locking/mutex.c:735 [inline]
> > > > >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
> > > > >        drm_client_modeset_probe+0x304/0x3f64 drivers/gpu/drm/drm_=
client_modeset.c:834
> > > > >        __drm_fb_helper_initial_config_and_unlock+0x104/0x1910 dri=
vers/gpu/drm/drm_fb_helper.c:1818
> > > > >        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm=
_fb_helper.c:1906
> > > > >        drm_fbdev_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_f=
bdev_client.c:51
> > > > >        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client=
.c:140
> > > > >        drm_fbdev_client_setup+0x1a4/0x39c drivers/gpu/drm/drm_fbd=
ev_client.c:158
> > > > >        drm_client_setup+0x28/0x9c drivers/gpu/drm/drm_client_setu=
p.c:29
> > > > >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:230 [inline]
> > > > >        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
> > > > >        do_one_initcall+0x254/0x9f8 init/main.c:1266
> > > > >        do_initcall_level+0x154/0x214 init/main.c:1328
> > > > >        do_initcalls+0x58/0xac init/main.c:1344
> > > > >        do_basic_setup+0x8c/0xa0 init/main.c:1363
> > > > >        kernel_init_freeable+0x324/0x478 init/main.c:1577
> > > > >        kernel_init+0x24/0x2a0 init/main.c:1466
> > > > >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> > > > >
> > > > > -> #5 (&helper->lock){+.+.}-{4:4}:
> > > > >        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:58=
5
> > > > >        __mutex_lock kernel/locking/mutex.c:735 [inline]
> > > > >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
> > > > >        __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x178 dri=
vers/gpu/drm/drm_fb_helper.c:228
> > > > >        drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_he=
lper.c:1351
> > > > >        fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1=
113
> > > > >        visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
> > > > >        do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
> > > > >        do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
> > > > >        do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbc=
on.c:549
> > > > >        do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [in=
line]
> > > > >        fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/f=
bcon.c:3008
> > > > >        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:4=
49 [inline]
> > > > >        register_framebuffer+0x470/0x610 drivers/video/fbdev/core/=
fbmem.c:515
> > > > >        __drm_fb_helper_initial_config_and_unlock+0x137c/0x1910 dr=
ivers/gpu/drm/drm_fb_helper.c:1841
> > > > >        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm=
_fb_helper.c:1906
> > > > >        drm_fbdev_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_f=
bdev_client.c:51
> > > > >        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client=
.c:140
> > > > >        drm_fbdev_client_setup+0x1a4/0x39c drivers/gpu/drm/drm_fbd=
ev_client.c:158
> > > > >        drm_client_setup+0x28/0x9c drivers/gpu/drm/drm_client_setu=
p.c:29
> > > > >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:230 [inline]
> > > > >        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
> > > > >        do_one_initcall+0x254/0x9f8 init/main.c:1266
> > > > >        do_initcall_level+0x154/0x214 init/main.c:1328
> > > > >        do_initcalls+0x58/0xac init/main.c:1344
> > > > >        do_basic_setup+0x8c/0xa0 init/main.c:1363
> > > > >        kernel_init_freeable+0x324/0x478 init/main.c:1577
> > > > >        kernel_init+0x24/0x2a0 init/main.c:1466
> > > > >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> > > > >
> > > > > -> #4 (console_lock){+.+.}-{0:0}:
> > > > >        console_lock+0x19c/0x1f4 kernel/printk/printk.c:2833
> > > > >        __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inlin=
e]
> > > > >        bch2_print_string_as_lines+0x2c/0xd4 fs/bcachefs/util.c:28=
6
> > > > >        __bch2_fsck_err+0x1864/0x2544 fs/bcachefs/error.c:411
> > > > >        bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
> > > > >        bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:26=
6
> > > > >        bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
> > > > >        bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
> > > > >        bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
> > > > >        bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
> > > > >        bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
> > > > >        bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.=
c:1133
> > > > >        bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_pas=
ses.c:191
> > > > >        bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_=
passes.c:244
> > > > >        bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
> > > > >        bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
> > > > >        bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
> > > > >        vfs_get_tree+0x90/0x28c fs/super.c:1814
> > > > >        do_new_mount+0x278/0x900 fs/namespace.c:3507
> > > > >        path_mount+0x590/0xe04 fs/namespace.c:3834
> > > > >        do_mount fs/namespace.c:3847 [inline]
> > > > >        __do_sys_mount fs/namespace.c:4057 [inline]
> > > > >        __se_sys_mount fs/namespace.c:4034 [inline]
> > > > >        __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
> > > > >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> > > > >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> > > > >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> > > > >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> > > > >        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
> > > > >        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-co=
mmon.c:762
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > -> #3 (&c->fsck_error_msgs_lock){+.+.}-{4:4}:
> > > > >        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:58=
5
> > > > >        __mutex_lock kernel/locking/mutex.c:735 [inline]
> > > > >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
> > > > >        __bch2_fsck_err+0x344/0x2544 fs/bcachefs/error.c:282
> > > > >        bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
> > > > >        bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:26=
6
> > > > >        bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
> > > > >        bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
> > > > >        bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
> > > > >        bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
> > > > >        bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
> > > > >        bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.=
c:1133
> > > > >        bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_pas=
ses.c:191
> > > > >        bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_=
passes.c:244
> > > > >        bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
> > > > >        bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
> > > > >        bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
> > > > >        vfs_get_tree+0x90/0x28c fs/super.c:1814
> > > > >        do_new_mount+0x278/0x900 fs/namespace.c:3507
> > > > >        path_mount+0x590/0xe04 fs/namespace.c:3834
> > > > >        do_mount fs/namespace.c:3847 [inline]
> > > > >        __do_sys_mount fs/namespace.c:4057 [inline]
> > > > >        __se_sys_mount fs/namespace.c:4034 [inline]
> > > > >        __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
> > > > >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> > > > >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> > > > >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> > > > >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> > > > >        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
> > > > >        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-co=
mmon.c:762
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > -> #2 (&c->mark_lock){++++}-{0:0}:
> > > > >        percpu_down_read+0x5c/0x2e8 include/linux/percpu-rwsem.h:5=
1
> > > > >        __bch2_disk_reservation_add+0xc4/0x9f4 fs/bcachefs/buckets=
.c:1170
> > > > >        bch2_disk_reservation_add+0x29c/0x4f4 fs/bcachefs/buckets.=
h:367
> > > > >        __bch2_folio_reservation_get+0x2dc/0x798 fs/bcachefs/fs-io=
-pagecache.c:428
> > > > >        bch2_folio_reservation_get fs/bcachefs/fs-io-pagecache.c:4=
77 [inline]
> > > > >        bch2_page_mkwrite+0xa70/0xe44 fs/bcachefs/fs-io-pagecache.=
c:637
> > > > >        do_page_mkwrite+0x140/0x2dc mm/memory.c:3176
> > > > >        wp_page_shared mm/memory.c:3577 [inline]
> > > > >        do_wp_page+0x1f50/0x38a0 mm/memory.c:3727
> > > > >        handle_pte_fault+0xe44/0x5890 mm/memory.c:5817
> > > > >        __handle_mm_fault mm/memory.c:5944 [inline]
> > > > >        handle_mm_fault+0xf0c/0x17b0 mm/memory.c:6112
> > > > >        do_page_fault+0x404/0x10a8 arch/arm64/mm/fault.c:647
> > > > >        do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
> > > > >        el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
> > > > >        el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-co=
mmon.c:765
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > -> #1 (sb_pagefaults#4){.+.+}-{0:0}:
> > > > >        percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
> > > > >        __sb_start_write include/linux/fs.h:1725 [inline]
> > > > >        sb_start_pagefault include/linux/fs.h:1890 [inline]
> > > > >        bch2_page_mkwrite+0x280/0xe44 fs/bcachefs/fs-io-pagecache.=
c:614
> > > > >        do_page_mkwrite+0x140/0x2dc mm/memory.c:3176
> > > > >        wp_page_shared mm/memory.c:3577 [inline]
> > > > >        do_wp_page+0x1f50/0x38a0 mm/memory.c:3727
> > > > >        handle_pte_fault+0xe44/0x5890 mm/memory.c:5817
> > > > >        __handle_mm_fault mm/memory.c:5944 [inline]
> > > > >        handle_mm_fault+0xf0c/0x17b0 mm/memory.c:6112
> > > > >        do_page_fault+0x404/0x10a8 arch/arm64/mm/fault.c:647
> > > > >        do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
> > > > >        el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
> > > > >        el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-co=
mmon.c:765
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > -> #0 (&vma->vm_lock->lock){++++}-{4:4}:
> > > > >        check_prev_add kernel/locking/lockdep.c:3161 [inline]
> > > > >        check_prevs_add kernel/locking/lockdep.c:3280 [inline]
> > > > >        validate_chain kernel/locking/lockdep.c:3904 [inline]
> > > > >        __lock_acquire+0x34f0/0x7904 kernel/locking/lockdep.c:5226
> > > > >        lock_acquire+0x23c/0x724 kernel/locking/lockdep.c:5849
> > > > >        down_write+0x50/0xc0 kernel/locking/rwsem.c:1577
> > > > >        vma_start_write include/linux/mm.h:769 [inline]
> > > > >        vm_flags_set include/linux/mm.h:899 [inline]
> > > > >        vm_insert_page+0x2a0/0xab0 mm/memory.c:2241
> > > > >        packet_mmap+0x2f8/0x4c8 net/packet/af_packet.c:4680
> > > > >        sock_mmap+0x90/0xa8 net/socket.c:1403
> > > > >        call_mmap include/linux/fs.h:2183 [inline]
> > > > >        mmap_file mm/internal.h:124 [inline]
> > > > >        __mmap_new_file_vma mm/vma.c:2291 [inline]
> > > > >        __mmap_new_vma mm/vma.c:2355 [inline]
> > > > >        __mmap_region+0x1854/0x2180 mm/vma.c:2456
> > > > >        mmap_region+0x1f4/0x370 mm/mmap.c:1348
> > > > >        do_mmap+0x8b0/0xfd0 mm/mmap.c:496
> > > > >        vm_mmap_pgoff+0x1a0/0x38c mm/util.c:580
> > > > >        ksys_mmap_pgoff+0x3a4/0x5c8 mm/mmap.c:542
> > > > >        __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
> > > > >        __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
> > > > >        __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
> > > > >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> > > > >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> > > > >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> > > > >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> > > > >        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
> > > > >        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-co=
mmon.c:762
> > > > >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > > other info that might help us debug this:
> > > > >
> > > > > Chain exists of:
> > > > >   &vma->vm_lock->lock --> &mm->mmap_lock --> &po->pg_vec_lock
> > > > >
> > > > >  Possible unsafe locking scenario:
> > > > >
> > > > >        CPU0                    CPU1
> > > > >        ----                    ----
> > > > >   lock(&po->pg_vec_lock);
> > > > >                                lock(&mm->mmap_lock);
> > > > >                                lock(&po->pg_vec_lock);
> > > > >   lock(&vma->vm_lock->lock);
> > > > >
> > > > >  *** DEADLOCK ***
> > > > >
> > > > > 2 locks held by syz.8.396/8273:
> > > > >  #0: ffff0000d6a2cc10 (&mm->mmap_lock){++++}-{4:4}, at: mmap_writ=
e_lock_killable include/linux/mmap_lock.h:122 [inline]
> > > > >  #0: ffff0000d6a2cc10 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_p=
goff+0x154/0x38c mm/util.c:578
> > > > >  #1: ffff0000d4aa2868 (&po->pg_vec_lock){+.+.}-{4:4}, at: packet_=
mmap+0x9c/0x4c8 net/packet/af_packet.c:4650
> > > > >
> > > > Given &mm->mmap_lock and &po->pg_vec_lock in same locking order on =
both sides,
> > > > this deadlock report is bogus. Due to lockdep glitch?
> >
> > What do you mean by "both sides"? Note that, here is the report saying
> > the locks that are already held by the current task, and that current
> > task is going to acquire &vma->vm_lock->lock, so lockdep finds new
> > dependency:
> >
> >       &po->pg_vec_lock --> &vma->vm_lock->lock
> >
> > and there will be a circular dependency because (see above) lockdep
> > recorded a dependency chain that:
> >
> >       &vma->vm_lock->lock --> ... --> &po->pg_vec_lock
> >
> > >
> > > Yeah, this looks fishy. Note that to write-lock vma->vm_lock (which i=
s
> > > what's done here) a task needs to also hold the mmap_write_lock, so
> > > the above race between CPU0 and CPU1 should not be possible because
> >
> > Note the the dependency chain has 11 locks in it, so the real deadlock
> > scenario may have 11 CPUs involved, and due to the limitation of how we
> > can do pretty-print in kernel log, it's always show two CPUs cases. The
> > real case may be:
> >
> >       CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7    C=
PU8    CPU9    CPU10
> >       ----    ----    ----    ----    ----    ----    ----    ----    -=
---    ----    ----
> >       lock(&po->pg_vec_lock);
> >               lock(&vma->vm_lock->lock);
> >                       lock(sb_pagefaults#4);
> >                               lock(&c->mark_lock);
> >                                       lock(&c->fsck_error_msgs_lock);
> >                                               lock(console_lock);
> >                                                       lock(&helper->loc=
k);
> >                                                               lock(&cli=
ent->modeset_mutex);
> >                                                                       l=
ock(crtc_ww_class_acquire);
> >                                                                        =
       lock(crtc_ww_class_mutex);
> >                                                                        =
               lock(&mm->mmap_lock);
> >                                                                        =
               lock(&po->pg_vec_lock);
> >                                                                        =
       lock(&mm->mmap_lock);
> >                                                                       l=
ock(crtc_ww_class_mutex);
> >                                                               lock(crtc=
_ww_class_acquire);
> >                                                       lock(&client->mod=
eset_mutex);
> >                                               lock(&helper->lock);
> >                                       lock(console_lock);
> >                               lock(&c->fsck_error_msgs_lock);
> >                       lock(&c->mark_lock);
> >               lock(sb_pagefaults#4);
> >       lock(&vma->vm_lock->lock);
> >
>
> OK, in this case CPU0 and CPU10 should be the same (both of the
> dependencies are introduced by the current task), so the scenario should
> be:
>
>         CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7    C=
PU8    CPU9
>         ----    ----    ----    ----    ----    ----    ----    ----    -=
---    ----
>         lock(&mm->mmap_lock);
>         lock(&po->pg_vec_lock);
>                 lock(&vma->vm_lock->lock);
>                         lock(sb_pagefaults#4);
>                                 lock(&c->mark_lock);
>                                         lock(&c->fsck_error_msgs_lock);
>                                                 lock(console_lock);
>                                                         lock(&helper->loc=
k);
>                                                                 lock(&cli=
ent->modeset_mutex);
>                                                                         l=
ock(crtc_ww_class_acquire);
>                                                                          =
       lock(crtc_ww_class_mutex);
>                                                                          =
       lock(&mm->mmap_lock);
>                                                                         l=
ock(crtc_ww_class_mutex);
>                                                                 lock(crtc=
_ww_class_acquire);
>                                                         lock(&client->mod=
eset_mutex);
>                                                 lock(&helper->lock);
>                                         lock(console_lock);
>                                 lock(&c->fsck_error_msgs_lock);
>                         lock(&c->mark_lock);
>                 lock(sb_pagefaults#4);
>         lock(&vma->vm_lock->lock);
>
> and CPU0 is running the current task.
>
> And CPU1, CPU2 can be the same CPU because the lock dependencies
> (&vma->vm_lock->lock --> sb_pagefaults#4 and sb_pagefaults#4 -->
> &c->mark_lock) are both introduced in a do_page_fault() according to the
> existing dependency chain info #1 and #2 above, therefore, it's
> simpified into:
>
>         CPU0    CPU1    CPU3    CPU4    CPU5    CPU6    CPU7    CPU8    C=
PU9
>         ----    ----    ----    ----    ----    ----    ----    ----    -=
---
>         (current task)
>         lock(&mm->mmap_lock);
>         lock(&po->pg_vec_lock);
>                 lock(&vma->vm_lock->lock);
>                 lock(sb_pagefaults#4);
>                         lock(&c->mark_lock);
>                                 lock(&c->fsck_error_msgs_lock);
>                                         lock(console_lock);
>                                                 lock(&helper->lock);
>                                                         lock(&client->mod=
eset_mutex);
>                                                                 lock(crtc=
_ww_class_acquire);
>                                                                         l=
ock(crtc_ww_class_mutex);
>                                                                         l=
ock(&mm->mmap_lock);
>                                                                 lock(crtc=
_ww_class_mutex);
>                                                         lock(crtc_ww_clas=
s_acquire);
>                                                 lock(&client->modeset_mut=
ex);
>                                         lock(&helper->lock);
>                                 lock(console_lock);
>                         lock(&c->fsck_error_msgs_lock);
>                 lock(&c->mark_lock);
>         lock(&vma->vm_lock->lock);
>
> and CPU1 is running do_page_fault().
>
> Similarly CPU3 and CPU4 can be the same CPU due to depenedency chain
> info #3 and #4 above, so:
>
>         CPU0    CPU1    CPU3    CPU5    CPU6    CPU7    CPU8    CPU9
>         ----    ----    ----    ----    ----    ----    ----    ----
>         [current task]
>         lock(&mm->mmap_lock);
>         lock(&po->pg_vec_lock);
>                 [in do_page_fault()]
>                 lock(&vma->vm_lock->lock);
>                 lock(sb_pagefaults#4);
>                         lock(&c->mark_lock);
>                         lock(&c->fsck_error_msgs_lock);
>                                 lock(console_lock);
>                                         lock(&helper->lock);
>                                                 lock(&client->modeset_mut=
ex);
>                                                         lock(crtc_ww_clas=
s_acquire);
>                                                                 lock(crtc=
_ww_class_mutex);
>                                                                 lock(&mm-=
>mmap_lock);
>                                                         lock(crtc_ww_clas=
s_mutex);
>                                                 lock(crtc_ww_class_acquir=
e);
>                                         lock(&client->modeset_mutex);
>                                 lock(&helper->lock);
>                         lock(console_lock);
>                 lock(&c->mark_lock);
>         lock(&vma->vm_lock->lock);
>
> and CPU3 is doing bch2_check_fix_ptrs().
>
> CPU5, CPU6, CPU7 and CPU8 can be the same CPU due to depenedency chain
> info #5, #6, #7 and #8:
>
>         CPU0    CPU1    CPU3    CPU5    CPU9
>         ----    ----    ----    ----    ----
>         [current task]
>         lock(&mm->mmap_lock);
>         lock(&po->pg_vec_lock);
>                 [in do_page_fault()]
>                 lock(&vma->vm_lock->lock);
>                 lock(sb_pagefaults#4);
>                         [in bch2_check_fix_ptrs()]
>                         lock(&c->mark_lock);
>                         lock(&c->fsck_error_msgs_lock);
>                                 lock(console_lock);
>                                 lock(&helper->lock);
>                                 lock(&client->modeset_mutex);
>                                 lock(crtc_ww_class_acquire);
>                                         lock(crtc_ww_class_mutex);
>                                         lock(&mm->mmap_lock);
>                                 lock(crtc_ww_class_mutex);
>                         lock(console_lock);
>                 lock(&c->mark_lock);
>         lock(&vma->vm_lock->lock);
>
> and CPU5 is doing vkms_init(). May need some help to find where the
> console_lock() was acquired in this path, because I wasn't able to find
> one.
>
> And based on depenedency chain info #9, CPU9 is doing
> drm_mode_obj_get_properties_ioctl():
>
>         CPU0    CPU1    CPU3    CPU5    CPU9
>         ----    ----    ----    ----    ----
>         [current task]
>
>         lock(&mm->mmap_lock);
>         lock(&po->pg_vec_lock);
>                 [in do_page_fault()]
>
>                 lock(&vma->vm_lock->lock);
>                 lock(sb_pagefaults#4);
>                         [in bch2_check_fix_ptrs()]
>
>                         lock(&c->mark_lock);
>                         lock(&c->fsck_error_msgs_lock);
>                                 [in vkms_init()]
>
>                                 lock(console_lock);
>                                 lock(&helper->lock);
>                                 lock(&client->modeset_mutex);
>                                 lock(crtc_ww_class_acquire);
>                                         [in drm_mode_obj_get_properties_i=
octl()]
>
>                                         lock(crtc_ww_class_mutex);
>                                         lock(&mm->mmap_lock);
>                                 lock(crtc_ww_class_mutex);
>                         lock(console_lock);
>                 lock(&c->mark_lock);
>         lock(&vma->vm_lock->lock);


Thanks for breaking down this more. Overall this sequence of:

         lock(&mm->mmap_lock);
         lock(&po->pg_vec_lock);
         lock(&vma->vm_lock->lock);

looks scary to me because as you said pagefault path takes
vma->vm_lock and po->pg_vec_lock in the reverse order. So I tool a
closer look into the path that does that. I believe it's this one:


 -> #10 (&po->pg_vec_lock){+.+.}-{4:4}:
        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:585
        __mutex_lock kernel/locking/mutex.c:735 [inline]
        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
        packet_mmap+0x9c/0x4c8 net/packet/af_packet.c:4650
        sock_mmap+0x90/0xa8 net/socket.c:1403
        call_mmap include/linux/fs.h:2183 [inline]
        mmap_file mm/internal.h:124 [inline]
        __mmap_new_file_vma mm/vma.c:2291 [inline]
        __mmap_new_vma mm/vma.c:2355 [inline]
        __mmap_region+0x1854/0x2180 mm/vma.c:2456
        mmap_region+0x1f4/0x370 mm/mmap.c:1348
        do_mmap+0x8b0/0xfd0 mm/mmap.c:496

And indeed __mmap_new_vma() calls __mmap_new_file_vma() (which
eventually locks pg_vec_lock) before it write-locks the vma here:
https://elixir.bootlin.com/linux/v6.13-rc3/source/mm/vma.c#L2370.
Normally we would want to lock the vma first before making vma
changes, however note that this is a brand new vma not yet added into
the vma tree. We write-lock the vma right before we add it into the
tree here: https://elixir.bootlin.com/linux/v6.13-rc3/source/mm/vma.c#L2371
So, pagefault path would not really care about this VMA because by the
time it becomes visible for pagefaults to use it, it's already
write-locked, so vma_start_read() will fail to read-lock it.
If this was a vma visible to pagefaults then the locking sequence
would have to be enforced so that vma is write-locked before any
changes are done to it (and any other locks are taken).
Thanks,
Suren.

> Cc bcachefs, drm for the awareness.
>
> Regards,
> Boqun
>
> > (of course, it could happen with less CPUs and it could also be a false
> > positive, but the depenedency chain is real)
> >
> > Also a quick look seems to suggest that the lock dependency on CPU 1:
> >
> >       lock(&vma->vm_lock->lock);
> >       lock(sb_pagefaults#4);
> >
> > can happen in a page fault with a reader of &vma->vm_lock->lock.
> >
> >       do_page_fault():
> >         lock_vma_under_rcu():
> >           vma_start_read():
> >             down_read_trylock(); // read lock &vma->vm_lock_lock here.
> >         ...
> >         handle_mm_fault():
> >           sb_start_pagefault(); // lock(sb_pagefaults#4);
> >
> > if so, an existing reader can block the other writer, so I don't think
> > the mmap_lock write protection can help here.
> >
> >
> > It's bit late for me to take a deep look, will continue tomorrow. So fa=
r
> > the story seems to be:
> >
> > *     Page fault can connect &vma->vm_lock->lock with &c->mark_lock.
> >
> > *     Some bcachefs internal can connect &c->mark_lock with console_loc=
k.
> >
> > *     Some drm internal can connect console_lock with drm internal
> >       locks (e.g. crtc_ww_class_mutex) because of fbcon.
> >
> > *     (not sure) drm may trigger a page fault (because of put_user())
> >       with some internal locks held. This will connect
> >       crtc_ww_class_mutex with &mm->mmap_lock.
> >
> > *     And eventually normal mm operations will connect &mm->mmap_lock
> >       with &vma->vm_lock->lock.
> >
> > Regards,
> > Boqun
> >
> >
> > > they will synchronize on the mmap_lock before locking vm_lock or
> > > pg_vec_lock.
> > >
> > > >
> > > > > stack backtrace:
> > > > > CPU: 0 UID: 0 PID: 8273 Comm: syz.8.396 Not tainted 6.13.0-rc3-sy=
zkaller-g573067a5a685 #0
> > > > > Hardware name: Google Google Compute Engine/Google Compute Engine=
, BIOS Google 09/13/2024
> > > > > Call trace:
> > > > >  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
> > > > >  __dump_stack lib/dump_stack.c:94 [inline]
> > > > >  dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
> > > > >  dump_stack+0x1c/0x28 lib/dump_stack.c:129
> > > > >  print_circular_bug+0x154/0x1c0 kernel/locking/lockdep.c:2074
> > > > >  check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2206
> > > > >  check_prev_add kernel/locking/lockdep.c:3161 [inline]
> > > > >  check_prevs_add kernel/locking/lockdep.c:3280 [inline]
> > > > >  validate_chain kernel/locking/lockdep.c:3904 [inline]
> > > > >  __lock_acquire+0x34f0/0x7904 kernel/locking/lockdep.c:5226
> > > > >  lock_acquire+0x23c/0x724 kernel/locking/lockdep.c:5849
> > > > >  down_write+0x50/0xc0 kernel/locking/rwsem.c:1577
> > > > >  vma_start_write include/linux/mm.h:769 [inline]
> > > > >  vm_flags_set include/linux/mm.h:899 [inline]
> > > > >  vm_insert_page+0x2a0/0xab0 mm/memory.c:2241
> > > > >  packet_mmap+0x2f8/0x4c8 net/packet/af_packet.c:4680
> > > > >  sock_mmap+0x90/0xa8 net/socket.c:1403
> > > > >  call_mmap include/linux/fs.h:2183 [inline]
> > > > >  mmap_file mm/internal.h:124 [inline]
> > > > >  __mmap_new_file_vma mm/vma.c:2291 [inline]
> > > > >  __mmap_new_vma mm/vma.c:2355 [inline]
> > > > >  __mmap_region+0x1854/0x2180 mm/vma.c:2456
> > > > >  mmap_region+0x1f4/0x370 mm/mmap.c:1348
> > > > >  do_mmap+0x8b0/0xfd0 mm/mmap.c:496
> > > > >  vm_mmap_pgoff+0x1a0/0x38c mm/util.c:580
> > > > >  ksys_mmap_pgoff+0x3a4/0x5c8 mm/mmap.c:542
> > > > >  __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
> > > > >  __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
> > > > >  __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
> > > > >  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> > > > >  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> > > > >  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> > > > >  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> > > > >  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
> > > > >  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c=
:762
> > > > >  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> > > > >
> > > > >
> > > > > ---
> > > > > This report is generated by a bot. It may contain errors.
> > > > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > > >
> > > > > syzbot will keep track of this issue. See:
> > > > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > > >
> > > > > If the report is already addressed, let syzbot know by replying w=
ith:
> > > > > #syz fix: exact-commit-title
> > > > >
> > > > > If you want to overwrite report's subsystems, reply with:
> > > > > #syz set subsystems: new-subsystem
> > > > > (See the list of subsystem names on the web dashboard)
> > > > >
> > > > > If the report is a duplicate of another one, reply with:
> > > > > #syz dup: exact-subject-of-another-report
> > > > >
> > > > > If you want to undo deduplication, reply with:
> > > > > #syz undup
> > > > >
> > > >
