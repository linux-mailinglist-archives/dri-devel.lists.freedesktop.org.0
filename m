Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52292B823F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 17:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AB56E461;
	Wed, 18 Nov 2020 16:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ED26E466;
 Wed, 18 Nov 2020 16:54:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so2899931wrx.5;
 Wed, 18 Nov 2020 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRC18BPjIRSp+WKzOprfvIGvlzXIwQasx/NgtSHjnkk=;
 b=Q8KI6auyYw+UQli3mVHJeio/LFpZnQ27Z1be5V/OcH7ukM9lSVHWDVEkR0hR9QSVmK
 o5pSPDu+hJL5sEuNj1mPfSZbqyA8qCUk7RX+RCk6HO9Z1hJYBy5hH7fwjAXccs59oVwD
 KvgsctcaTF1nr601C/clBMZLpTgS22UHH95JC12lfak7cOO2keB7fx66eKXWUl3VfmuJ
 GVxbxt1Cw8xjQUfHeeBUJKu9D5Rm/KQvHUcVgNN1M1z+bbAT68VaB46sJ0qcw8rUHz7N
 dvalvk3hQ6sUQvcdiWxfx47PGVfIMYuoozxc0ymckwqMKEvTvl54CqdDkCPmYcfe3BgT
 SPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRC18BPjIRSp+WKzOprfvIGvlzXIwQasx/NgtSHjnkk=;
 b=h69WMOhBMR+wENU/LAvh8Wo6eKCUltYasUp5O3JPC/MPidlmNLPk9GCo9Cm3DenSmA
 NdIt9eqv8U16o98iqtNTK1tLVyN9H+GYbO/4WWUCz2Y2JWDN0640nZQoH7idUngSO/mB
 g7tiRHyWxuAYsx88R3L+ouoRxTfiKPVuSd+cHn4jhi8pNrcv1O48cQ6F1EdZNufYBOwP
 2hajdi8YRci/8Wyo1IuFNu0QWOierqE9jH45PlOp3nDxw1ypMEyY4Fnv2OBCaxllRfPf
 9YNHjaovaVKJhyyNkKFhw5GMa+LisOMiWK+e028KchaVZYLSqF2rl0Ds+yy91jklpPWy
 rqFA==
X-Gm-Message-State: AOAM530HU20fJHde/gW3M7xDco4qv0Lt1QDpCBsttF9E79oBRPzJTDGa
 /KSzPQnD3lTATPmfwF2aRPdHbEC6r7svQNBqxk8=
X-Google-Smtp-Source: ABdhPJx7J/nWVt/7mDAkYU5tVhA9/oefvE19ZHtWgOVv1eCf8/ND7KUlio0HKQcR25pGwCP3X7bhz5ZE+g481zVolts=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr6113163wrb.132.1605718451974; 
 Wed, 18 Nov 2020 08:54:11 -0800 (PST)
MIME-Version: 1.0
References: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
 <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
In-Reply-To: <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 18 Nov 2020 08:53:57 -0800
Message-ID: <CAF6AEGv=-h7GFj5LR97FkeBBn+gk6TNS5hZkwBwufpE4yO7GyA@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 9:28 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-20, 09:02, Rob Clark wrote:
> > With that on top of the previous patch,
>
> Don't you still have this ? Which fixed the lockdep in the remove path.
>
> https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/
>
> To make it clear you need these patches to fix the OPP stuff:
>
> //From 5.10-rc3 (the one from the above link).
> commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")
>
> //Below two from linux-next
> commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
> commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")
>
> This matches the diff I gave you earlier.
>

no, I did not have all three, only "opp: Allocate the OPP table
outside of opp_table_lock" plus the fixup.  But with all three:

[   27.072188] ======================================================
[   27.078542] WARNING: possible circular locking dependency detected
[   27.084897] 5.10.0-rc2+ #1 Not tainted
[   27.088750] ------------------------------------------------------
[   27.095103] chrome/1897 is trying to acquire lock:
[   27.100031] ffffffdb14e4aa88 (opp_table_lock){+.+.}-{3:3}, at:
_find_opp_table+0x38/0x78
[   27.108379]
[   27.108379] but task is already holding lock:
[   27.114373] ffffff8e2c8f91b0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
submit_lock_objects+0x70/0x1ec
[   27.124212]
[   27.124212] which lock already depends on the new lock.
[   27.124212]
[   27.132604]
[   27.132604] the existing dependency chain (in reverse order) is:
[   27.140290]
[   27.140290] -> #4 (reservation_ww_class_mutex){+.+.}-{3:3}:
[   27.147544]        lock_acquire+0x23c/0x30c
[   27.151848]        __mutex_lock_common+0xdc/0xbc4
[   27.156685]        ww_mutex_lock_interruptible+0x84/0xec
[   27.162142]        msm_gem_fault+0x30/0x138
[   27.166443]        __do_fault+0x44/0x184
[   27.170479]        handle_mm_fault+0x754/0xc50
[   27.175053]        do_page_fault+0x230/0x354
[   27.179444]        do_translation_fault+0x40/0x54
[   27.184277]        do_mem_abort+0x44/0xac
[   27.188402]        el0_sync_compat_handler+0x15c/0x190
[   27.193680]        el0_sync_compat+0x144/0x180
[   27.198244]
[   27.198244] -> #3 (&mm->mmap_lock){++++}-{3:3}:
[   27.204435]        lock_acquire+0x23c/0x30c
[   27.208738]        __might_fault+0x60/0x80
[   27.212951]        compat_filldir+0x118/0x4d0
[   27.217434]        dcache_readdir+0x74/0x1e0
[   27.221825]        iterate_dir+0xd4/0x198
[   27.225947]        __arm64_compat_sys_getdents+0x6c/0x168
[   27.231495]        el0_svc_common+0xa4/0x174
[   27.235886]        do_el0_svc_compat+0x20/0x30
[   27.240461]        el0_sync_compat_handler+0x124/0x190
[   27.245746]        el0_sync_compat+0x144/0x180
[   27.250310]
[   27.250310] -> #2 (&sb->s_type->i_mutex_key#2){++++}-{3:3}:
[   27.257569]        lock_acquire+0x23c/0x30c
[   27.261877]        down_write+0x80/0x1dc
[   27.265912]        simple_recursive_removal+0x48/0x238
[   27.271193]        debugfs_remove+0x5c/0x78
[   27.275502]        opp_debug_remove_one+0x18/0x20
[   27.280343]        _opp_kref_release+0x40/0x74
[   27.284917]        dev_pm_opp_put_unlocked+0x44/0x64
[   27.290015]        _opp_remove_all_static+0x5c/0x90
[   27.295029]        dev_pm_opp_remove_table+0x70/0x90
[   27.300129]        dev_pm_opp_of_remove_table+0x14/0x1c
[   27.305504]        msm_dsi_host_destroy+0xd8/0x108
[   27.310434]        dsi_destroy+0x40/0x58
[   27.314469]        dsi_bind+0x8c/0x16c
[   27.318329]        component_bind_all+0xf4/0x20c
[   27.323081]        msm_drm_init+0x180/0x588
[   27.327382]        msm_drm_bind+0x1c/0x24
[   27.331503]        try_to_bring_up_master+0x160/0x1a8
[   27.336696]        component_master_add_with_match+0xc4/0x108
[   27.342597]        msm_pdev_probe+0x214/0x2a4
[   27.347076]        platform_drv_probe+0x94/0xb4
[   27.351739]        really_probe+0x138/0x348
[   27.356041]        driver_probe_device+0x80/0xb8
[   27.360788]        device_driver_attach+0x50/0x70
[   27.365621]        __driver_attach+0xb4/0xc8
[   27.370012]        bus_for_each_dev+0x80/0xc8
[   27.374495]        driver_attach+0x28/0x30
[   27.378712]        bus_add_driver+0x100/0x1d4
[   27.383188]        driver_register+0x68/0xfc
[   27.387579]        __platform_driver_register+0x48/0x50
[   27.392957]        msm_drm_register+0x64/0x68
[   27.397434]        do_one_initcall+0x1ac/0x3e4
[   27.402011]        do_initcall_level+0xa0/0xb8
[   27.406583]        do_initcalls+0x58/0x94
[   27.410704]        do_basic_setup+0x28/0x30
[   27.415008]        kernel_init_freeable+0x190/0x1d0
[   27.420024]        kernel_init+0x18/0x10c
[   27.424146]        ret_from_fork+0x10/0x18
[   27.428362]
[   27.428362] -> #1 (&opp_table->lock){+.+.}-{3:3}:
[   27.434725]        lock_acquire+0x23c/0x30c
[   27.439028]        __mutex_lock_common+0xdc/0xbc4
[   27.443862]        mutex_lock_nested+0x50/0x58
[   27.448436]        _find_opp_table_unlocked+0x44/0xb4
[   27.453626]        _opp_get_opp_table+0x3c/0x280
[   27.458375]        dev_pm_opp_get_opp_table_indexed+0x14/0x1c
[   27.464281]        of_genpd_add_provider_onecell+0xd8/0x1c0
[   27.470019]        rpmhpd_probe+0x244/0x26c
[   27.474323]        platform_drv_probe+0x94/0xb4
[   27.478985]        really_probe+0x138/0x348
[   27.483287]        driver_probe_device+0x80/0xb8
[   27.488033]        __device_attach_driver+0x90/0xa8
[   27.493047]        bus_for_each_drv+0x84/0xcc
[   27.497524]        __device_attach+0xc0/0x148
[   27.502007]        device_initial_probe+0x18/0x20
[   27.506840]        bus_probe_device+0x38/0x98
[   27.511317]        device_add+0x214/0x3c8
[   27.515443]        of_device_add+0x3c/0x48
[   27.519654]        of_platform_device_create_pdata+0xac/0xec
[   27.525473]        of_platform_bus_create+0x1cc/0x348
[   27.530664]        of_platform_populate+0x78/0xc8
[   27.535496]        devm_of_platform_populate+0x5c/0xa4
[   27.540779]        rpmh_rsc_probe+0x370/0x3d0
[   27.545253]        platform_drv_probe+0x94/0xb4
[   27.549916]        really_probe+0x138/0x348
[   27.554223]        driver_probe_device+0x80/0xb8
[   27.558971]        __device_attach_driver+0x90/0xa8
[   27.563988]        bus_for_each_drv+0x84/0xcc
[   27.568465]        __device_attach+0xc0/0x148
[   27.572942]        device_initial_probe+0x18/0x20
[   27.577778]        bus_probe_device+0x38/0x98
[   27.582263]        fw_devlink_resume+0xdc/0x110
[   27.586930]        of_platform_default_populate_init+0xb8/0xd0
[   27.592923]        do_one_initcall+0x1ac/0x3e4
[   27.597489]        do_initcall_level+0xa0/0xb8
[   27.602051]        do_initcalls+0x58/0x94
[   27.606175]        do_basic_setup+0x28/0x30
[   27.610472]        kernel_init_freeable+0x190/0x1d0
[   27.615493]        kernel_init+0x18/0x10c
[   27.619616]        ret_from_fork+0x10/0x18
[   27.623823]
[   27.623823] -> #0 (opp_table_lock){+.+.}-{3:3}:
[   27.630006]        check_noncircular+0x12c/0x134
[   27.634757]        __lock_acquire+0x2288/0x2b2c
[   27.639419]        lock_acquire+0x23c/0x30c
[   27.643727]        __mutex_lock_common+0xdc/0xbc4
[   27.648566]        mutex_lock_nested+0x50/0x58
[   27.653133]        _find_opp_table+0x38/0x78
[   27.657520]        dev_pm_opp_find_freq_exact+0x2c/0xdc
[   27.662890]        a6xx_gmu_resume+0xcc/0xed0
[   27.667372]        a6xx_pm_resume+0x140/0x174
[   27.671849]        adreno_resume+0x24/0x2c
[   27.676070]        pm_generic_runtime_resume+0x2c/0x3c
[   27.681351]        __rpm_callback+0x74/0x114
[   27.685741]        rpm_callback+0x30/0x84
[   27.689865]        rpm_resume+0x3c8/0x4f0
[   27.693989]        __pm_runtime_resume+0x80/0xa4
[   27.698742]        msm_gpu_submit+0x60/0x228
[   27.703136]        msm_ioctl_gem_submit+0xba0/0xc1c
[   27.708158]        drm_ioctl_kernel+0xa0/0x11c
[   27.712724]        drm_ioctl+0x240/0x3dc
[   27.716762]        drm_compat_ioctl+0xd4/0xe4
[   27.721244]        __arm64_compat_sys_ioctl+0xc4/0xf8
[   27.726435]        el0_svc_common+0xa4/0x174
[   27.730827]        do_el0_svc_compat+0x20/0x30
[   27.735395]        el0_sync_compat_handler+0x124/0x190
[   27.740675]        el0_sync_compat+0x144/0x180
[   27.745240]
[   27.745240] other info that might help us debug this:
[   27.745240]
[   27.753459] Chain exists of:
[   27.753459]   opp_table_lock --> &mm->mmap_lock -->
reservation_ww_class_mutex
[   27.753459]
[   27.765342]  Possible unsafe locking scenario:
[   27.765342]
[   27.771422]        CPU0                    CPU1
[   27.776085]        ----                    ----
[   27.780747]   lock(reservation_ww_class_mutex);
[   27.785413]                                lock(&mm->mmap_lock);
[   27.791591]                                lock(reservation_ww_class_mutex);
[   27.798833]   lock(opp_table_lock);
[   27.802428]
[   27.802428]  *** DEADLOCK ***
[   27.802428]
[   27.808506] 3 locks held by chrome/1897:
[   27.812540]  #0: ffffff8e05f91138 (&dev->struct_mutex){+.+.}-{3:3},
at: msm_ioctl_gem_submit+0x238/0xc1c
[   27.822295]  #1: ffffff8e1ebd2670
(reservation_ww_class_acquire){+.+.}-{0:0}, at:
msm_ioctl_gem_submit+0x978/0xc1c
[   27.832930]  #2: ffffff8e2c8f91b0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
submit_lock_objects+0x70/0x1ec
[   27.843216]
[   27.843216] stack backtrace:
[   27.847702] CPU: 5 PID: 1897 Comm: chrome Not tainted 5.10.0-rc2+ #1
[   27.854235] Hardware name: Google Lazor (rev1+) with LTE (DT)
[   27.860142] Call trace:
[   27.862662]  dump_backtrace+0x0/0x1b4
[   27.866426]  show_stack+0x1c/0x24
[   27.869847]  dump_stack+0xdc/0x158
[   27.873349]  print_circular_bug+0x308/0x338
[   27.877647]  check_noncircular+0x12c/0x134
[   27.881858]  __lock_acquire+0x2288/0x2b2c
[   27.885984]  lock_acquire+0x23c/0x30c
[   27.889753]  __mutex_lock_common+0xdc/0xbc4
[   27.894054]  mutex_lock_nested+0x50/0x58
[   27.898086]  _find_opp_table+0x38/0x78
[   27.901946]  dev_pm_opp_find_freq_exact+0x2c/0xdc
[   27.906784]  a6xx_gmu_resume+0xcc/0xed0
[   27.910734]  a6xx_pm_resume+0x140/0x174
[   27.914684]  adreno_resume+0x24/0x2c
[   27.918363]  pm_generic_runtime_resume+0x2c/0x3c
[   27.923113]  __rpm_callback+0x74/0x114
[   27.926975]  rpm_callback+0x30/0x84
[   27.930565]  rpm_resume+0x3c8/0x4f0
[   27.934154]  __pm_runtime_resume+0x80/0xa4
[   27.938373]  msm_gpu_submit+0x60/0x228
[   27.942233]  msm_ioctl_gem_submit+0xba0/0xc1c
[   27.946713]  drm_ioctl_kernel+0xa0/0x11c
[   27.950749]  drm_ioctl+0x240/0x3dc
[   27.954256]  drm_compat_ioctl+0xd4/0xe4
[   27.958207]  __arm64_compat_sys_ioctl+0xc4/0xf8
[   27.962871]  el0_svc_common+0xa4/0x174
[   27.966731]  do_el0_svc_compat+0x20/0x30
[   27.970766]  el0_sync_compat_handler+0x124/0x190
[   27.975516]  el0_sync_compat+0x144/0x180
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
