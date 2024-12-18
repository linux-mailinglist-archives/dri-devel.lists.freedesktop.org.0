Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D249F63AC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04B810EB5D;
	Wed, 18 Dec 2024 10:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cSFt733y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6B710EB5D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:45:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so3312691f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734518732; x=1735123532; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNC/sargnwfPcpW6YZnimEXUy1SDHHLYlTYhRfx76yw=;
 b=cSFt733y7CDGHHJK1tYgyD7q72g/zKqt76+yPMdNuPmvkWop5ISsrpI1VGPO7U0hvL
 fIUtlCxhD8Y9ZNFNpSLIdijGaeCBkNrCHT8SfmunCHSXsHKPHyEZ9xxuiHm1K3dx7Wd6
 SyXqS5dMm9WrVlHz7rCULydCGBPoIiKyDGTEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734518732; x=1735123532;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zNC/sargnwfPcpW6YZnimEXUy1SDHHLYlTYhRfx76yw=;
 b=SpEy6Pf1stoQzQ6EFK/JaKqHaLPJJsmLRXJcWbbYFR0wiqerqteL+0u7oR2fA5yjiR
 EWGqge/wPhnUaKWtFa/fyt41Ui/OetCPheasffGknCIBng5awWYtFeQz7SyG/V9BMdoY
 kcnkcp4XVXKIDZolE/BQwuOrHRr8fwccXh+DeNYO725Jz9l01IiYGWU06OFNXv1JSdPg
 vRVllvus0l3gcnJCrOiPYRSvDBfywk4CF4Aq9mursgxOgjuOYU9621vQgv3PZzhsQE9+
 oohmKIkH0xDkNCvcfdegsBF5L2GdhPkWyzrzDWUGxPC5MyXxUnNmJ1FdPQAmEvi1tTIL
 9u0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIU8kDk4KQfkAY8l3Ba5pJiKcQdhrydkDYH1d503ilYh3g0ecGZTliZXfDg0rJKfa8adue17UBi54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNICGYA0cudy4v8SYDqlO+isspmaBQ6BE4cEtMmlIR572JnlV0
 Zy/RG1hgszQaridjDPeoodhWE8rLEbbwBubtMeK/ftnMTNKyyJ+7i5wsPGb9ImQ=
X-Gm-Gg: ASbGncs49swnR2Pb+pfRhHjAtNmJRw/3U/H2bXMprho1lgfBcgbW6z4kpmImGJ2L3Dc
 RpRD9pMLQeWym3jv0B3feR96u5A75fRdqWyvV/M4Y6b/vfR6wzwOMR+J0Qhh4qmaHfBTw8HXY80
 9rplR/33K1rgxS5XcmMTRNp5q/Jlfqv+mILY8dAjRtk0Thct3g18MQ44ZDyJevKFXKhltcQTf9l
 HiMEO/mKygM6seKwr71sDdn8jsn3CakSbzUBLuaWbZAux1oeWeSz+Hrlsg9HoFlDLim
X-Google-Smtp-Source: AGHT+IEyq38D6DN06DfCS5sdmgCnLcAOeDZP+UkwCu2xoj5T1NrsUa24AVIK0QD4GXNgepH9wmBfBA==
X-Received: by 2002:a05:6000:4b1a:b0:386:32ca:aa0e with SMTP id
 ffacd0b85a97d-388e4d6bcb5mr2330310f8f.5.1734518732146; 
 Wed, 18 Dec 2024 02:45:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801626asm13739276f8f.29.2024.12.18.02.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:45:31 -0800 (PST)
Date: Wed, 18 Dec 2024 11:45:29 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: syzbot <syzbot+43b8370f38144ca1e467@syzkaller.appspotmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 louis.chauvet@bootlin.com, maarten.lankhorst@linux.intel.com,
 melissa.srw@gmail.com, mripard@kernel.org, simona@ffwll.ch,
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Subject: Re: [syzbot] [dri?] possible deadlock in
 drm_mode_obj_get_properties_ioctl
Message-ID: <Z2KnyRy2-r0fO7K_@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+43b8370f38144ca1e467@syzkaller.appspotmail.com>, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 louis.chauvet@bootlin.com, maarten.lankhorst@linux.intel.com,
 melissa.srw@gmail.com, mripard@kernel.org, simona@ffwll.ch,
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
References: <6760a063.050a0220.37aaf.0140.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6760a063.050a0220.37aaf.0140.GAE@google.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Mon, Dec 16, 2024 at 01:49:23PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2e7aff49b5da Merge branches 'for-next/core' and 'for-next/..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=17c49be8580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=696fb014d05da3a3
> dashboard link: https://syzkaller.appspot.com/bug?extid=43b8370f38144ca1e467
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ef408f67fde3/disk-2e7aff49.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/414ac17a20dc/vmlinux-2e7aff49.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/a93415d2a7e7/Image-2e7aff49.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+43b8370f38144ca1e467@syzkaller.appspotmail.com

bcachefs is broken in it's console_locke usage.
-Sima

> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.13.0-rc2-syzkaller-g2e7aff49b5da #0 Not tainted
> ------------------------------------------------------
> syz.3.631/8987 is trying to acquire lock:
> ffff0000cc3cd450 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x9c/0x124 mm/memory.c:6750
> 
> but task is already holding lock:
> ffff80009d267938 (crtc_ww_class_mutex){+.+.}-{0:0}, at: drm_mode_obj_get_properties_ioctl+0x194/0x4fc drivers/gpu/drm/drm_mode_object.c:447
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #8 (crtc_ww_class_mutex){+.+.}-{0:0}:
>        ww_acquire_init include/linux/ww_mutex.h:162 [inline]
>        drm_modeset_acquire_init+0x1e4/0x384 drivers/gpu/drm/drm_modeset_lock.c:250
>        drmm_mode_config_init+0xb98/0x130c drivers/gpu/drm/drm_mode_config.c:453
>        vkms_modeset_init drivers/gpu/drm/vkms/vkms_drv.c:158 [inline]
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:219 [inline]
>        vkms_init+0x2fc/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
>        do_one_initcall+0x254/0x9f8 init/main.c:1266
>        do_initcall_level+0x154/0x214 init/main.c:1328
>        do_initcalls+0x58/0xac init/main.c:1344
>        do_basic_setup+0x8c/0xa0 init/main.c:1363
>        kernel_init_freeable+0x324/0x478 init/main.c:1577
>        kernel_init+0x24/0x2a0 init/main.c:1466
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> 
> -> #7 (crtc_ww_class_acquire){+.+.}-{0:0}:
>        ww_acquire_init include/linux/ww_mutex.h:161 [inline]
>        drm_modeset_acquire_init+0x1c4/0x384 drivers/gpu/drm/drm_modeset_lock.c:250
>        drm_client_modeset_commit_atomic+0xd8/0x724 drivers/gpu/drm/drm_client_modeset.c:1009
>        drm_client_modeset_commit_locked+0xd0/0x4a8 drivers/gpu/drm/drm_client_modeset.c:1173
>        drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_client_modeset.c:1199
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0xd4/0x178 drivers/gpu/drm/drm_fb_helper.c:237
>        drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1351
>        fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1113
>        visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
>        do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
>        do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
>        do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:549
>        do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [inline]
>        fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:3008
>        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>        register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
>        __drm_fb_helper_initial_config_and_unlock+0x137c/0x1910 drivers/gpu/drm/drm_fb_helper.c:1841
>        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1906
>        drm_fbdev_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_client.c:51
>        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x1a4/0x39c drivers/gpu/drm/drm_fbdev_client.c:158
>        drm_client_setup+0x28/0x9c drivers/gpu/drm/drm_client_setup.c:29
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:230 [inline]
>        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
>        do_one_initcall+0x254/0x9f8 init/main.c:1266
>        do_initcall_level+0x154/0x214 init/main.c:1328
>        do_initcalls+0x58/0xac init/main.c:1344
>        do_basic_setup+0x8c/0xa0 init/main.c:1363
>        kernel_init_freeable+0x324/0x478 init/main.c:1577
>        kernel_init+0x24/0x2a0 init/main.c:1466
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> 
> -> #6 (&client->modeset_mutex){+.+.}-{4:4}:
>        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:585
>        __mutex_lock kernel/locking/mutex.c:735 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
>        drm_client_modeset_probe+0x304/0x3f64 drivers/gpu/drm/drm_client_modeset.c:834
>        __drm_fb_helper_initial_config_and_unlock+0x104/0x1910 drivers/gpu/drm/drm_fb_helper.c:1818
>        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1906
>        drm_fbdev_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_client.c:51
>        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x1a4/0x39c drivers/gpu/drm/drm_fbdev_client.c:158
>        drm_client_setup+0x28/0x9c drivers/gpu/drm/drm_client_setup.c:29
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:230 [inline]
>        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
>        do_one_initcall+0x254/0x9f8 init/main.c:1266
>        do_initcall_level+0x154/0x214 init/main.c:1328
>        do_initcalls+0x58/0xac init/main.c:1344
>        do_basic_setup+0x8c/0xa0 init/main.c:1363
>        kernel_init_freeable+0x324/0x478 init/main.c:1577
>        kernel_init+0x24/0x2a0 init/main.c:1466
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> 
> -> #5 (&helper->lock){+.+.}-{4:4}:
>        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:585
>        __mutex_lock kernel/locking/mutex.c:735 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x178 drivers/gpu/drm/drm_fb_helper.c:228
>        drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1351
>        fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1113
>        visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
>        do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
>        do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
>        do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:549
>        do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [inline]
>        fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:3008
>        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>        register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
>        __drm_fb_helper_initial_config_and_unlock+0x137c/0x1910 drivers/gpu/drm/drm_fb_helper.c:1841
>        drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1906
>        drm_fbdev_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_client.c:51
>        drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x1a4/0x39c drivers/gpu/drm/drm_fbdev_client.c:158
>        drm_client_setup+0x28/0x9c drivers/gpu/drm/drm_client_setup.c:29
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:230 [inline]
>        vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:256
>        do_one_initcall+0x254/0x9f8 init/main.c:1266
>        do_initcall_level+0x154/0x214 init/main.c:1328
>        do_initcalls+0x58/0xac init/main.c:1344
>        do_basic_setup+0x8c/0xa0 init/main.c:1363
>        kernel_init_freeable+0x324/0x478 init/main.c:1577
>        kernel_init+0x24/0x2a0 init/main.c:1466
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
> 
> -> #4 (console_lock){+.+.}-{0:0}:
>        console_lock+0x19c/0x1f4 kernel/printk/printk.c:2833
>        __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
>        bch2_print_string_as_lines+0x2c/0xd4 fs/bcachefs/util.c:286
>        __bch2_fsck_err+0x1864/0x2544 fs/bcachefs/error.c:411
>        bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
>        bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:266
>        bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
>        bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
>        bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
>        bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
>        bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
>        bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.c:1133
>        bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:191
>        bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_passes.c:244
>        bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
>        bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
>        bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
>        vfs_get_tree+0x90/0x28c fs/super.c:1814
>        do_new_mount+0x278/0x900 fs/namespace.c:3507
>        path_mount+0x590/0xe04 fs/namespace.c:3834
>        do_mount fs/namespace.c:3847 [inline]
>        __do_sys_mount fs/namespace.c:4057 [inline]
>        __se_sys_mount fs/namespace.c:4034 [inline]
>        __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #3 (&c->fsck_error_msgs_lock){+.+.}-{4:4}:
>        __mutex_lock_common+0x218/0x28f4 kernel/locking/mutex.c:585
>        __mutex_lock kernel/locking/mutex.c:735 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:787
>        __bch2_fsck_err+0x344/0x2544 fs/bcachefs/error.c:282
>        bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
>        bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:266
>        bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
>        bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
>        bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
>        bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
>        bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
>        bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.c:1133
>        bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:191
>        bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_passes.c:244
>        bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
>        bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
>        bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
>        vfs_get_tree+0x90/0x28c fs/super.c:1814
>        do_new_mount+0x278/0x900 fs/namespace.c:3507
>        path_mount+0x590/0xe04 fs/namespace.c:3834
>        do_mount fs/namespace.c:3847 [inline]
>        __do_sys_mount fs/namespace.c:4057 [inline]
>        __se_sys_mount fs/namespace.c:4034 [inline]
>        __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #2 (&c->mark_lock){++++}-{0:0}:
>        percpu_down_read+0x5c/0x2e8 include/linux/percpu-rwsem.h:51
>        __bch2_disk_reservation_add+0xc4/0x9f4 fs/bcachefs/buckets.c:1170
>        bch2_disk_reservation_add+0x29c/0x4f4 fs/bcachefs/buckets.h:367
>        __bch2_folio_reservation_get+0x2dc/0x798 fs/bcachefs/fs-io-pagecache.c:428
>        bch2_folio_reservation_get fs/bcachefs/fs-io-pagecache.c:477 [inline]
>        bch2_page_mkwrite+0xa70/0xe44 fs/bcachefs/fs-io-pagecache.c:637
>        do_page_mkwrite+0x140/0x2dc mm/memory.c:3176
>        do_shared_fault mm/memory.c:5398 [inline]
>        do_fault mm/memory.c:5460 [inline]
>        do_pte_missing mm/memory.c:3979 [inline]
>        handle_pte_fault+0x1418/0x5890 mm/memory.c:5801
>        __handle_mm_fault mm/memory.c:5944 [inline]
>        handle_mm_fault+0xf0c/0x17b0 mm/memory.c:6112
>        faultin_page mm/gup.c:1196 [inline]
>        __get_user_pages+0x15e4/0x3134 mm/gup.c:1494
>        __get_user_pages_locked mm/gup.c:1824 [inline]
>        __gup_longterm_locked+0xda0/0x12a4 mm/gup.c:2532
>        pin_user_pages_remote+0x170/0x24c mm/gup.c:3577
>        process_vm_rw_single_vec mm/process_vm_access.c:106 [inline]
>        process_vm_rw_core mm/process_vm_access.c:216 [inline]
>        process_vm_rw+0x56c/0x9ac mm/process_vm_access.c:284
>        __do_sys_process_vm_writev mm/process_vm_access.c:304 [inline]
>        __se_sys_process_vm_writev mm/process_vm_access.c:299 [inline]
>        __arm64_sys_process_vm_writev+0xdc/0xf8 mm/process_vm_access.c:299
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #1 (sb_pagefaults#3){.+.+}-{0:0}:
>        percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
>        __sb_start_write include/linux/fs.h:1725 [inline]
>        sb_start_pagefault include/linux/fs.h:1890 [inline]
>        bch2_page_mkwrite+0x280/0xe44 fs/bcachefs/fs-io-pagecache.c:614
>        do_page_mkwrite+0x140/0x2dc mm/memory.c:3176
>        do_shared_fault mm/memory.c:5398 [inline]
>        do_fault mm/memory.c:5460 [inline]
>        do_pte_missing mm/memory.c:3979 [inline]
>        handle_pte_fault+0x1418/0x5890 mm/memory.c:5801
>        __handle_mm_fault mm/memory.c:5944 [inline]
>        handle_mm_fault+0xf0c/0x17b0 mm/memory.c:6112
>        faultin_page mm/gup.c:1196 [inline]
>        __get_user_pages+0x15e4/0x3134 mm/gup.c:1494
>        __get_user_pages_locked mm/gup.c:1824 [inline]
>        __gup_longterm_locked+0xda0/0x12a4 mm/gup.c:2532
>        pin_user_pages_remote+0x170/0x24c mm/gup.c:3577
>        process_vm_rw_single_vec mm/process_vm_access.c:106 [inline]
>        process_vm_rw_core mm/process_vm_access.c:216 [inline]
>        process_vm_rw+0x56c/0x9ac mm/process_vm_access.c:284
>        __do_sys_process_vm_writev mm/process_vm_access.c:304 [inline]
>        __se_sys_process_vm_writev mm/process_vm_access.c:299 [inline]
>        __arm64_sys_process_vm_writev+0xdc/0xf8 mm/process_vm_access.c:299
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #0 (&mm->mmap_lock){++++}-{4:4}:
>        check_prev_add kernel/locking/lockdep.c:3161 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3280 [inline]
>        validate_chain kernel/locking/lockdep.c:3904 [inline]
>        __lock_acquire+0x34f0/0x7904 kernel/locking/lockdep.c:5226
>        lock_acquire+0x23c/0x724 kernel/locking/lockdep.c:5849
>        __might_fault+0xc4/0x124 mm/memory.c:6751
>        drm_mode_object_get_properties+0x208/0x540 drivers/gpu/drm/drm_mode_object.c:407
>        drm_mode_obj_get_properties_ioctl+0x2bc/0x4fc drivers/gpu/drm/drm_mode_object.c:459
>        drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:796
>        drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:893
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:906 [inline]
>        __se_sys_ioctl fs/ioctl.c:892 [inline]
>        __arm64_sys_ioctl+0x14c/0x1cc fs/ioctl.c:892
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> other info that might help us debug this:
> 
> Chain exists of:
>   &mm->mmap_lock --> crtc_ww_class_acquire --> crtc_ww_class_mutex
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(crtc_ww_class_mutex);
>                                lock(crtc_ww_class_acquire);
>                                lock(crtc_ww_class_mutex);
>   rlock(&mm->mmap_lock);
> 
>  *** DEADLOCK ***
> 
> 2 locks held by syz.3.631/8987:
>  #0: ffff80009d267910 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_obj_get_properties_ioctl+0x194/0x4fc drivers/gpu/drm/drm_mode_object.c:447
>  #1: ffff80009d267938 (crtc_ww_class_mutex){+.+.}-{0:0}, at: drm_mode_obj_get_properties_ioctl+0x194/0x4fc drivers/gpu/drm/drm_mode_object.c:447
> 
> stack backtrace:
> CPU: 1 UID: 0 PID: 8987 Comm: syz.3.631 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>  dump_stack+0x1c/0x28 lib/dump_stack.c:129
>  print_circular_bug+0x154/0x1c0 kernel/locking/lockdep.c:2074
>  check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2206
>  check_prev_add kernel/locking/lockdep.c:3161 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3280 [inline]
>  validate_chain kernel/locking/lockdep.c:3904 [inline]
>  __lock_acquire+0x34f0/0x7904 kernel/locking/lockdep.c:5226
>  lock_acquire+0x23c/0x724 kernel/locking/lockdep.c:5849
>  __might_fault+0xc4/0x124 mm/memory.c:6751
>  drm_mode_object_get_properties+0x208/0x540 drivers/gpu/drm/drm_mode_object.c:407
>  drm_mode_obj_get_properties_ioctl+0x2bc/0x4fc drivers/gpu/drm/drm_mode_object.c:459
>  drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:796
>  drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:893
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl fs/ioctl.c:892 [inline]
>  __arm64_sys_ioctl+0x14c/0x1cc fs/ioctl.c:892
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
