Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDE428254
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 17:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29D76E334;
	Sun, 10 Oct 2021 15:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1C6E334
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 15:39:57 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id y28so16165294vsd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1vs2SukdlUuNFzLLX2pRrve47jOD7Y358+JdodqUfZc=;
 b=C7hJSByIw5NtyHEEJxehfAG7x4vA16PGU4DXXnXRUEqhL7mOLVnpjSNggwHjgV1cp/
 /G8MjROtBiDhM1wXxWM08iVN1MkkIogzrINb5GzwlraxY1a3UsvfSGvpv82WFVEUkTz8
 nFhhndzplnvXU1/PJLDY6NeXfChscOOAjnaqA8+UZ/Wwiq/CIF/NPsycU6KeNgT8v4lk
 Akk6ljkwzzDvvI8IuuzolslBVGEDwgRy7M4E5u49kOi1Bvz1b5JC34q0Tr3jdxoH08jW
 IhCdzWDfqILdkcMz2BSgcUwLiMXHbX3PA5t8r++rwoTFfL7qw5GcCv63ZJdiSbrNo2Nc
 G4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1vs2SukdlUuNFzLLX2pRrve47jOD7Y358+JdodqUfZc=;
 b=BSVMNgD88rghwwVR+7o+Pbq6vCL+6KyLK6/gkEWiWNYWkcjX8yMb8QdX12Mv6BojVo
 pD5pAc9Sm8Lf9WDEgJ9eZYbjsaDQKlyTOkQHE8VK4+PbByujKJ0IscYB6MGl7Ge0naJH
 aAShOYj3/ohu+zunc/0jykxM7cdETVaw8qJHL3DFi5AkYNVv/FvMWzsLdvAvgxHJj5TI
 cQzJ2CiCjq8XIDlpvpIuE+aYeBCn96GzA3tjc5Vyray0Vmbylg/mdK20TbH5OwX6jV1Z
 +yDAf331eOMMuSJBM/MZFpZwszqGbSMk7Vzg6C4G6shEPgwG4F1WyzWsf9brmsqgSZ0E
 D8NQ==
X-Gm-Message-State: AOAM531bRGAyups6ZLeoiQd9GVceYlm3NFJ5JuOLjqBR0Lc9vChqrkdF
 wi2wqOosPY5bCEzSlPmOw8Vn5MgB8ef5P9dbIZE=
X-Google-Smtp-Source: ABdhPJxrRFvP9sw6vy1tLXEWPQjEaUWzRi0eVw2meCS9Br1gogUT+EqVTzJHhK3V3lgI98xpwjGX5pUO0rIzwj2wA2Q=
X-Received: by 2002:a05:6102:3e84:: with SMTP id
 m4mr18125005vsv.51.1633880396235; 
 Sun, 10 Oct 2021 08:39:56 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 10 Oct 2021 12:39:45 -0300
Message-ID: <CAOMZO5DkOT6-c67akbj_c8Bq9+kDsaC51ovMP23QLOCArKx1eQ@mail.gmail.com>
Subject: imx_ldb: lockdep warning on 5.14.x
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Tim Harvey <tharvey@gateworks.com>
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

Hi,

I am getting the lockdep warning below on a imx6q-sabred running 5.14.9.

Haven't debugged this yet, but just wanted to report in case someone
has any suggestions.

Thanks,

Fabio Estevam

[    4.913294] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
ipu_crtc_ops)
[    4.921640] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
ipu_crtc_ops)
[    4.929798] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops
ipu_crtc_ops)
[    4.937977] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops
ipu_crtc_ops)
[    4.946850] imx-drm display-subsystem: bound 120000.hdmi (ops
dw_hdmi_imx_ops)
[    4.954685] imx-drm display-subsystem: bound ldb (ops imx_ldb_ops)
[    4.966943] [drm] Initialized imx-drm 1.0.0 20120507 for
display-subsystem on minor 0
[    5.001801]
[    5.001811] ======================================================
[    5.001817] WARNING: possible circular locking dependency detected
[    5.001824] 5.14.9-01225-g45da36cc6fcc-dirty #1 Tainted: G        W
[    5.001833] ------------------------------------------------------
[    5.001838] kworker/u8:0/7 is trying to acquire lock:
[    5.001848] c1752080 (regulator_list_mutex){+.+.}-{3:3}, at:
regulator_lock_dependent+0x40/0x294
[    5.001903]
[    5.001903] but task is already holding lock:
[    5.001909] c176df78 (dma_fence_map){++++}-{0:0}, at:
imx_drm_atomic_commit_tail+0x10/0x160
[    5.001957]
[    5.001957] which lock already depends on the new lock.
[    5.001957]
[    5.001963]
[    5.001963] the existing dependency chain (in reverse order) is:
[    5.001968]
[    5.001968] -> #3 (dma_fence_map){++++}-{0:0}:
[    5.001993]        dma_resv_lockdep+0x1c4/0x2b8
[    5.002010]        do_one_initcall+0x84/0x3b8
[    5.002026]        kernel_init_freeable+0x198/0x22c
[    5.002040]        kernel_init+0x10/0x128
[    5.002061]        ret_from_fork+0x14/0x38
[    5.002072]        0x0
[    5.002081]
[    5.002081] -> #2 (fs_reclaim){+.+.}-{0:0}:
[    5.002105]        kmem_cache_alloc+0x28/0x38c
[    5.002125]        __d_alloc+0x20/0x224
[    5.002141]        d_alloc+0x10/0x60
[    5.002152]        d_alloc_parallel+0x48/0xa60
[    5.002165]        __lookup_slow+0x8c/0x178
[    5.002184]        lookup_one_len+0x98/0xd8
[    5.002196]        start_creating+0x94/0x14c
[    5.002216]        debugfs_create_dir+0x10/0x100
[    5.002231]        pinctrl_init+0x1c/0xd4
[    5.002247]        do_one_initcall+0x84/0x3b8
[    5.002259]        kernel_init_freeable+0x198/0x22c
[    5.002271]        kernel_init+0x10/0x128
[    5.002286]        ret_from_fork+0x14/0x38
[    5.002296]        0x0
[    5.002303]
[    5.002303] -> #1 (&sb->s_type->i_mutex_key#2){+.+.}-{3:3}:
[    5.002335]        simple_recursive_removal+0x54/0x33c
[    5.002350]        debugfs_remove+0x30/0x4c
[    5.002364]        _regulator_put.part.0+0x30/0x1d8
[    5.002383]        regulator_put+0x2c/0x3c
[    5.002395]        release_nodes+0x50/0x190
[    5.002415]        devres_release_all+0x80/0xd4
[    5.002426]        really_probe+0xd4/0x314
[    5.002438]        __driver_probe_device+0x80/0xe4
[    5.002449]        driver_probe_device+0x30/0xd4
[    5.002459]        __driver_attach_async_helper+0x20/0x38
[    5.002470]        async_run_entry_fn+0x20/0xb4
[    5.002483]        process_one_work+0x2a0/0x7c0
[    5.002500]        worker_thread+0x30/0x510
[    5.002512]        kthread+0x154/0x17c
[    5.002526]        ret_from_fork+0x14/0x38
[    5.002537]        0x0
[    5.002546]
[    5.002546] -> #0 (regulator_list_mutex){+.+.}-{3:3}:
[    5.002569]        lock_acquire+0x13c/0x418
[    5.002581]        __mutex_lock+0x94/0x97c
[    5.002595]        mutex_lock_nested+0x1c/0x24
[    5.002605]        regulator_lock_dependent+0x40/0x294
[    5.002622]        regulator_enable+0x2c/0xec
[    5.002632]        panel_simple_resume+0x38/0x1f4
[    5.002648]        __rpm_callback+0x3c/0x108
[    5.002661]        rpm_callback+0x68/0x70
[    5.002671]        rpm_resume+0x604/0x7f4
[    5.002681]        __pm_runtime_resume+0x64/0x90
[    5.002692]        panel_simple_prepare+0x2c/0x50
[    5.002703]        imx_ldb_encoder_enable+0x58/0x2b0
[    5.002715]        drm_atomic_helper_commit_modeset_enables+0x230/0x26c
[    5.002734]        imx_drm_atomic_commit_tail+0x3c/0x160
[    5.002753]        commit_tail+0x9c/0x18c
[    5.002766]        drm_atomic_helper_commit+0x158/0x18c
[    5.002778]        drm_client_modeset_commit_atomic+0x23c/0x288
[    5.002795]        drm_client_modeset_commit_locked+0x60/0x1d0
[    5.002806]        drm_client_modeset_commit+0x24/0x40
[    5.002819]        __drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0xc8
[    5.002835]        drm_fb_helper_set_par+0x38/0x68
[    5.002845]        fbcon_init+0x2bc/0x550
[    5.002862]        visual_init+0xbc/0x104
[    5.002881]        do_bind_con_driver+0x1c8/0x3b0
[    5.002896]        do_take_over_console+0x134/0x1f0
[    5.002910]        do_fbcon_takeover+0x60/0xc0
[    5.002924]        register_framebuffer+0x1c8/0x2e8
[    5.002936]        __drm_fb_helper_initial_config_and_unlock+0x3c8/0x614
[    5.002950]        drm_fbdev_client_hotplug+0xf8/0x194
[    5.002961]        drm_fbdev_generic_setup+0x9c/0x194
[    5.002971]        imx_drm_bind+0xe0/0x124
[    5.002985]        try_to_bring_up_master+0x15c/0x1a8
[    5.003002]        __component_add+0x94/0x140
[    5.003013]        imx_ldb_probe+0x32c/0x4e8
[    5.003025]        platform_probe+0x58/0xb8
[    5.003040]        really_probe+0x14c/0x314
[    5.003050]        __driver_probe_device+0x80/0xe4
[    5.003060]        driver_probe_device+0x30/0xd4
[    5.003070]        __device_attach_driver+0x8c/0xb4
[    5.003081]        bus_for_each_drv+0x80/0xd0
[    5.003093]        __device_attach+0xec/0x160
[    5.003105]        bus_probe_device+0x88/0x90
[    5.003116]        deferred_probe_work_func+0x7c/0xac
[    5.003127]        process_one_work+0x2a0/0x7c0
[    5.003143]        worker_thread+0x30/0x510
[    5.003154]        kthread+0x154/0x17c
[    5.003164]        ret_from_fork+0x14/0x38
[    5.003174]        0x0
[    5.003182]
[    5.003182] other info that might help us debug this:
[    5.003182]
[    5.003188] Chain exists of:
[    5.003188]   regulator_list_mutex --> fs_reclaim --> dma_fence_map
[    5.003188]
[    5.003218]  Possible unsafe locking scenario:
[    5.003218]
[    5.003222]        CPU0                    CPU1
[    5.003227]        ----                    ----
[    5.003232]   lock(dma_fence_map);
[    5.003244]                                lock(fs_reclaim);
[    5.003257]                                lock(dma_fence_map);
[    5.003269]   lock(regulator_list_mutex);
[    5.003280]
[    5.003280]  *** DEADLOCK ***
[    5.003280]
[    5.003284] 13 locks held by kworker/u8:0/7:
[    5.003292]  #0: c2006ca8
((wq_completion)events_unbound){+.+.}-{0:0}, at:
process_one_work+0x1ec/0x7c0
[    5.003331]  #1: c20c9f28 (deferred_probe_work){+.+.}-{0:0}, at:
process_one_work+0x1ec/0x7c0
[    5.003367]  #2: c21448d8 (&dev->mutex){....}-{3:3}, at:
__device_attach+0x30/0x160
[    5.003404]  #3: c1769c90 (component_mutex){+.+.}-{3:3}, at:
__component_add+0x44/0x140
[    5.003440]  #4: c174c8f4 (registration_lock){+.+.}-{3:3}, at:
register_framebuffer+0x28/0x2e8
[    5.003475]  #5: c1618454 (console_lock){+.+.}-{0:0}, at:
register_framebuffer+0x248/0x2e8
[    5.003508]  #6: c263dc48 (&fb_info->lock){+.+.}-{3:3}, at:
register_framebuffer+0x1c0/0x2e8
[    5.003543]  #7: c2b8fb6c (&helper->lock){+.+.}-{3:3}, at:
__drm_fb_helper_restore_fbdev_mode_unlocked+0x4c/0xc8
[    5.003578]  #8: c2be90e8 (&dev->master_mutex){+.+.}-{3:3}, at:
drm_master_internal_acquire+0x18/0x3c
[    5.003614]  #9: c2b8fa50 (&client->modeset_mutex){+.+.}-{3:3}, at:
drm_client_modeset_commit_locked+0x20/0x1d0
[    5.003653]  #10: c20c9ae0 (crtc_ww_class_acquire){+.+.}-{0:0}, at:
drm_client_modeset_commit_atomic+0x34/0x288
[    5.003691]  #11: c263c488 (crtc_ww_class_mutex){+.+.}-{3:3}, at:
drm_modeset_backoff+0x90/0x228
[    5.003734]  #12: c176df78 (dma_fence_map){++++}-{0:0}, at:
imx_drm_atomic_commit_tail+0x10/0x160
[    5.003775]
[    5.003775] stack backtrace:
[    5.003783] CPU: 0 PID: 7 Comm: kworker/u8:0 Tainted: G        W
     5.14.9-01225-g45da36cc6fcc-dirty #1
[    5.003797] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    5.003808] Workqueue: events_unbound deferred_probe_work_func
[    5.003831] [<c01119b0>] (unwind_backtrace) from [<c010c020>]
(show_stack+0x10/0x14)
[    5.003860] [<c010c020>] (show_stack) from [<c0e76ab0>]
(dump_stack_lvl+0x58/0x70)
[    5.003887] [<c0e76ab0>] (dump_stack_lvl) from [<c0188dd4>]
(check_noncircular+0xf4/0x168)
[    5.003917] [<c0188dd4>] (check_noncircular) from [<c018cc78>]
(__lock_acquire+0x1698/0x3208)
[    5.003938] [<c018cc78>] (__lock_acquire) from [<c018f274>]
(lock_acquire+0x13c/0x418)
[    5.003955] [<c018f274>] (lock_acquire) from [<c0e88c18>]
(__mutex_lock+0x94/0x97c)
[    5.003974] [<c0e88c18>] (__mutex_lock) from [<c0e8951c>]
(mutex_lock_nested+0x1c/0x24)
[    5.003991] [<c0e8951c>] (mutex_lock_nested) from [<c06aecdc>]
(regulator_lock_dependent+0x40/0x294)
[    5.004019] [<c06aecdc>] (regulator_lock_dependent) from
[<c06b26cc>] (regulator_enable+0x2c/0xec)
[    5.004039] [<c06b26cc>] (regulator_enable) from [<c07ce850>]
(panel_simple_resume+0x38/0x1f4)
[    5.004062] [<c07ce850>] (panel_simple_resume) from [<c080698c>]
(__rpm_callback+0x3c/0x108)
[    5.004082] [<c080698c>] (__rpm_callback) from [<c0806ac0>]
(rpm_callback+0x68/0x70)
[    5.004098] [<c0806ac0>] (rpm_callback) from [<c08065e4>]
(rpm_resume+0x604/0x7f4)
[    5.004114] [<c08065e4>] (rpm_resume) from [<c0806838>]
(__pm_runtime_resume+0x64/0x90)
[    5.004131] [<c0806838>] (__pm_runtime_resume) from [<c07ce69c>]
(panel_simple_prepare+0x2c/0x50)
[    5.004149] [<c07ce69c>] (panel_simple_prepare) from [<c07ccfa0>]
(imx_ldb_encoder_enable+0x58/0x2b0)
[    5.004169] [<c07ccfa0>] (imx_ldb_encoder_enable) from [<c07043f8>]
(drm_atomic_helper_commit_modeset_enables+0x230/0x26c)
[    5.004194] [<c07043f8>] (drm_atomic_helper_commit_modeset_enables)
from [<c07c8bf8>] (imx_drm_atomic_commit_tail+0x3c/0x160)
[    5.004222] [<c07c8bf8>] (imx_drm_atomic_commit_tail) from
[<c07060a0>] (commit_tail+0x9c/0x18c)
[    5.004244] [<c07060a0>] (commit_tail) from [<c07062f0>]
(drm_atomic_helper_commit+0x158/0x18c)
[    5.004266] [<c07062f0>] (drm_atomic_helper_commit) from
[<c073b678>] (drm_client_modeset_commit_atomic+0x23c/0x288)
[    5.004290] [<c073b678>] (drm_client_modeset_commit_atomic) from
[<c073b794>] (drm_client_modeset_commit_locked+0x60/0x1d0)
[    5.004311] [<c073b794>] (drm_client_modeset_commit_locked) from
[<c073b928>] (drm_client_modeset_commit+0x24/0x40)
[    5.004330] [<c073b928>] (drm_client_modeset_commit) from
[<c070c474>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0xc8)
[    5.004353] [<c070c474>]
(__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c070c508>]
(drm_fb_helper_set_par+0x38/0x68)
[    5.004373] [<c070c508>] (drm_fb_helper_set_par) from [<c0677938>]
(fbcon_init+0x2bc/0x550)
[    5.004395] [<c0677938>] (fbcon_init) from [<c06d7144>]
(visual_init+0xbc/0x104)
[    5.004419] [<c06d7144>] (visual_init) from [<c06d8574>]
(do_bind_con_driver+0x1c8/0x3b0)
[    5.004440] [<c06d8574>] (do_bind_con_driver) from [<c06d8ab8>]
(do_take_over_console+0x134/0x1f0)
[    5.004462] [<c06d8ab8>] (do_take_over_console) from [<c067557c>]
(do_fbcon_takeover+0x60/0xc0)
[    5.004484] [<c067557c>] (do_fbcon_takeover) from [<c066da40>]
(register_framebuffer+0x1c8/0x2e8)
[    5.004503] [<c066da40>] (register_framebuffer) from [<c070be0c>]
(__drm_fb_helper_initial_config_and_unlock+0x3c8/0x614)
[    5.004522] [<c070be0c>]
(__drm_fb_helper_initial_config_and_unlock) from [<c070c744>]
(drm_fbdev_client_hotplug+0xf8/0x194)
[    5.004541] [<c070c744>] (drm_fbdev_client_hotplug) from
[<c070c87c>] (drm_fbdev_generic_setup+0x9c/0x194)
[    5.004559] [<c070c87c>] (drm_fbdev_generic_setup) from
[<c07c8b78>] (imx_drm_bind+0xe0/0x124)
[    5.004583] [<c07c8b78>] (imx_drm_bind) from [<c07f0ce4>]
(try_to_bring_up_master+0x15c/0x1a8)
[    5.004608] [<c07f0ce4>] (try_to_bring_up_master) from [<c07f0dc4>]
(__component_add+0x94/0x140)
[    5.004628] [<c07f0dc4>] (__component_add) from [<c07cc9dc>]
(imx_ldb_probe+0x32c/0x4e8)
[    5.004647] [<c07cc9dc>] (imx_ldb_probe) from [<c07fae98>]
(platform_probe+0x58/0xb8)
[    5.004670] [<c07fae98>] (platform_probe) from [<c07f8748>]
(really_probe+0x14c/0x314)
[    5.004690] [<c07f8748>] (really_probe) from [<c07f8990>]
(__driver_probe_device+0x80/0xe4)
[    5.004709] [<c07f8990>] (__driver_probe_device) from [<c07f8a24>]
(driver_probe_device+0x30/0xd4)
[    5.004728] [<c07f8a24>] (driver_probe_device) from [<c07f8d40>]
(__device_attach_driver+0x8c/0xb4)
[    5.004748] [<c07f8d40>] (__device_attach_driver) from [<c07f6b0c>]
(bus_for_each_drv+0x80/0xd0)
[    5.004767] [<c07f6b0c>] (bus_for_each_drv) from [<c07f8580>]
(__device_attach+0xec/0x160)
[    5.004785] [<c07f8580>] (__device_attach) from [<c07f77e0>]
(bus_probe_device+0x88/0x90)
[    5.004803] [<c07f77e0>] (bus_probe_device) from [<c07f7c9c>]
(deferred_probe_work_func+0x7c/0xac)
[    5.004820] [<c07f7c9c>] (deferred_probe_work_func) from
[<c0147cc0>] (process_one_work+0x2a0/0x7c0)
[    5.004845] [<c0147cc0>] (process_one_work) from [<c0148210>]
(worker_thread+0x30/0x510)
[    5.004865] [<c0148210>] (worker_thread) from [<c0151088>]
(kthread+0x154/0x17c)
[    5.004885] [<c0151088>] (kthread) from [<c010013c>]
(ret_from_fork+0x14/0x38)
[    5.004904] Exception stack(0xc20c9fb0 to 0xc20c9ff8)
[    5.004916] 9fa0:                                     00000000
00000000 00000000 00000000
[    5.004929] 9fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    5.004940] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    5.054205] Console: switching to colour frame buffer device 128x48
[    6.236262] imx-drm display-subsystem: [drm] fb0: imx-drm frame buffer device
[    6.251485] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    6.257459] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    6.263513] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    6.269228] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    6.275723] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    6.281932] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    6.288047] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    6.295155] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 1
