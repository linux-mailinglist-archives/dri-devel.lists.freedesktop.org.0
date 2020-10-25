Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA752982C7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 18:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9616E9E9;
	Sun, 25 Oct 2020 17:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F16E9E8;
 Sun, 25 Oct 2020 17:39:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so9905057wrp.10;
 Sun, 25 Oct 2020 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUixt7kjjRYvk+Y9YAKueBUK8sv8y9L7VAY1elFnrtU=;
 b=jjKNU270tzovGUzFz/YHinq34ec6mXvydr0wzz01ZbytWTZ9SiIPQFauamh+pF9DjM
 ZZ7fKh3ItcPK9UGjffz5sfp1upKcPMLS53fCuwUvQLtu9VJ4jtxtdGo6RHlTYNLsUBkp
 5U46do46/nDWBqehQg3u55+d4Q03emExGs3Vh4FwucLa+bFsPtLeEhHsydEhoxbTvPck
 +82n4as7E+Uvctkyl0pkZWaUmj/gmU2GxH5lZrdz8FHkloEKMMKNPfPp8aWLtwfZ6WWn
 dIBhPlpbDDNkhSFmO6t2YjsCTRukEoJEISatwzt8ngdsiXBBiwl8lEr+lvXkyAgu1pHP
 FZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUixt7kjjRYvk+Y9YAKueBUK8sv8y9L7VAY1elFnrtU=;
 b=ShPLa8rY9Qgay08EJNk4/w8dcQ6BhpLBRecLY3puCjFwjHGYuJM3RcGthC1/FhFhmT
 FMD8ncWtUXHRt2EyqvImOfxVe8q8UilyDqQAV+noTPfS2lyoAEVl29sg05WKahxtRRrm
 7TpAvpX7Lxnu0yo4PSCieRc2aYRTnZqQhmkV+K/I/aL9V/ipTcoMrtoeYSki+f3s17/N
 mSykwAdBPOS38XGIPPh/0Qo6e4dZs+XQ7j0sLzV/ON74oAA2ImGK1QKkMr7T2qGIf67+
 0vbW0gkVeNd2FjyiPXjARUDV80KE03Cc77oRuXS2Ig095dWks3Vo6hpySqTuMDrd2SJO
 gQ4Q==
X-Gm-Message-State: AOAM533rO6bHHtK4a57qAOvnO+3X0X0gmamfG7DL6e69Oci2L4yVyQXi
 NXzDGUO2CNuyYUcnX+sxRwITLoZVFkhJKJP9PgA=
X-Google-Smtp-Source: ABdhPJwD5StHUGXMfpUoENpCVOeSGT7bdoImJSwK66yINOD5nnL8hvvYQqttjrvEYgP7LyvfE55hiu2y0qqfDUgZjgM=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr13786817wrg.83.1603647558171; 
 Sun, 25 Oct 2020 10:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
In-Reply-To: <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 25 Oct 2020 10:39:06 -0700
Message-ID: <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 1:06 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-10-20, 07:13, Rob Clark wrote:
> > On Tue, Oct 20, 2020 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 20-10-20, 12:56, Daniel Vetter wrote:
> > > > Yeah that's bad practice. Generally you shouldn't need to hold locks
> > > > in setup/teardown code, since there's no other thread which can
> > > > possible hold a reference to anything your touching anymore. Ofc
> > > > excluding quickly grabbing/dropping a lock to insert/remove objects
> > > > into lists and stuff.
> > > >
> > > > The other reason is that especially with anything related to sysfs or
> > > > debugfs, the locking dependencies you're pulling in are enormous: vfs
> > > > locks pull in mm locks (due to mmap) and at that point there's pretty
> > > > much nothing left you're allowed to hold while acquiring such a lock.
> > > > For simple drivers this is no issue, but for fancy drivers (like gpu
> > > > drivers) which need to interact with core mm) this means your
> > > > subsystem is a major pain to use.
> > > >
> > > > Usually the correct fix is to only hold your subsystem locks in
> > > > setup/teardown when absolutely required, and fix any data
> > > > inconsistency issues by reordering your setup/teardown code: When you
> > > > register as the last step and unregister as the first step, there's no
> > > > need for any additional locking. And hence no need to call debugfs
> > > > functions while holding your subsystem locks.
> > > >
> > > > The catch phrase I use for this is "don't solve object lifetime issues
> > > > with locking". Instead use refcounting and careful ordering in
> > > > setup/teardown code.
> > >
> > > This is exactly what I have done in the OPP core, the locks were taken
> > > only when really necessary, though as we have seen now I have missed
> > > that at a single place and that should be fixed as well. Will do that,
> > > thanks.
> >
> > I do have an easy enough way to repro the issue, so if you have a
> > patch I can certainly test it.
>
> Does this fix it for you ? There is one more place still left where we
> are taking the opp_table_lock while adding stuff to debugfs and that's
> not that straight forward to fix. But I didn't see that path in your
> circular dependency trace, so who knows :)

Nope, I suspect any creation of debugfs files will be problematic.

(btw, _add_opp_dev_unlocked() looks like it should be called
_add_opp_dev_locked()?)

It does look like 'struct opp_table' is already refcnt'd, so I suspect
you could replace holding opp_table_lock while calling into debugfs
with holding a reference to the opp_table instead?

BR,
-R

[  +0.074543] ======================================================
[  +0.006347] WARNING: possible circular locking dependency detected
[  +0.006349] 5.4.72 #14 Not tainted
[  +0.003501] ------------------------------------------------------
[  +0.006350] chrome/1865 is trying to acquire lock:
[  +0.004922] ffffffdd34921750 (opp_table_lock){+.+.}, at:
_find_opp_table+0x34/0x74
[  +0.007779]
              but task is already holding lock:
[  +0.005989] ffffff81f0fc71a8 (reservation_ww_class_mutex){+.+.}, at:
submit_lock_objects+0x70/0x1ec
[  +0.001132] fscrypt: AES-256-CTS-CBC using implementation "cts-cbc-aes-ce"
[  +0.008156]
              which lock already depends on the new lock.

[  +0.000002]
              the existing dependency chain (in reverse order) is:
[  +0.000002]
              -> #4 (reservation_ww_class_mutex){+.+.}:
[  +0.000009]        __mutex_lock_common+0xec/0xc0c
[  +0.000004]        ww_mutex_lock_interruptible+0x5c/0xc4
[  +0.000003]        msm_gem_fault+0x2c/0x124
[  +0.000005]        __do_fault+0x40/0x16c
[  +0.000003]        handle_mm_fault+0x7cc/0xd98
[  +0.000005]        do_page_fault+0x230/0x3b4
[  +0.000003]        do_translation_fault+0x5c/0x78
[  +0.000004]        do_mem_abort+0x4c/0xb4
[  +0.000006]        el0_da+0x1c/0x20
[  +0.069917]
              -> #3 (&mm->mmap_sem){++++}:
[  +0.005548]        __might_fault+0x70/0x98
[  +0.004209]        compat_filldir+0xf8/0x48c
[  +0.004394]        dcache_readdir+0x70/0x1dc
[  +0.004394]        iterate_dir+0xd4/0x180
[  +0.004119]        __arm64_compat_sys_getdents+0xa0/0x19c
[  +0.005549]        el0_svc_common+0xa8/0x178
[  +0.004394]        el0_svc_compat_handler+0x2c/0x40
[  +0.005007]        el0_svc_compat+0x8/0x10
[  +0.004205]
              -> #2 (&sb->s_type->i_mutex_key#3){++++}:
[  +0.006708]        down_write+0x54/0x16c
[  +0.004034]        start_creating+0x68/0x128
[  +0.004392]        debugfs_create_dir+0x28/0x114
[  +0.004747]        opp_debug_register+0x8c/0xc0
[  +0.004657]        _add_opp_dev_unlocked+0x5c/0x70
[  +0.004920]        _add_opp_dev+0x38/0x58
[  +0.004118]        _opp_get_opp_table+0xdc/0x1ac
[  +0.004745]        dev_pm_opp_get_opp_table_indexed+0x24/0x30
[  +0.005899]        dev_pm_opp_of_add_table_indexed+0x48/0x84
[  +0.005813]        of_genpd_add_provider_onecell+0xc0/0x1b8
[  +0.005724]        rpmhpd_probe+0x240/0x268
[  +0.004307]        platform_drv_probe+0x90/0xb0
[  +0.004654]        really_probe+0x134/0x2ec
[  +0.004304]        driver_probe_device+0x64/0xfc
[  +0.004746]        __device_attach_driver+0x8c/0xa4
[  +0.005008]        bus_for_each_drv+0x90/0xd8
[  +0.004481]        __device_attach+0xc0/0x148
[  +0.004480]        device_initial_probe+0x20/0x2c
[  +0.004832]        bus_probe_device+0x34/0x94
[  +0.004482]        device_add+0x1fc/0x3b0
[  +0.004121]        of_device_add+0x3c/0x4c
[  +0.004206]        of_platform_device_create_pdata+0xb8/0xfc
[  +0.005811]        of_platform_bus_create+0x1e4/0x368
[  +0.005185]        of_platform_populate+0x70/0xbc
[  +0.004833]        devm_of_platform_populate+0x58/0xa0
[  +0.005283]        rpmh_rsc_probe+0x36c/0x3cc
[  +0.004481]        platform_drv_probe+0x90/0xb0
[  +0.004657]        really_probe+0x134/0x2ec
[  +0.004305]        driver_probe_device+0x64/0xfc
[  +0.004745]        __device_attach_driver+0x8c/0xa4
[  +0.005007]        bus_for_each_drv+0x90/0xd8
[  +0.004480]        __device_attach+0xc0/0x148
[  +0.004481]        device_initial_probe+0x20/0x2c
[  +0.004833]        bus_probe_device+0x34/0x94
[  +0.004481]        device_add+0x1fc/0x3b0
[  +0.004119]        of_device_add+0x3c/0x4c
[  +0.004206]        of_platform_device_create_pdata+0xb8/0xfc
[  +0.005811]        of_platform_bus_create+0x1e4/0x368
[  +0.005185]        of_platform_bus_create+0x230/0x368
[  +0.005185]        of_platform_populate+0x70/0xbc
[  +0.004836]        of_platform_default_populate_init+0xa8/0xc0
[  +0.005986]        do_one_initcall+0x1c8/0x3fc
[  +0.004572]        do_initcall_level+0xb4/0x10c
[  +0.004657]        do_basic_setup+0x30/0x48
[  +0.004304]        kernel_init_freeable+0x124/0x1a4
[  +0.005009]        kernel_init+0x14/0x104
[  +0.004119]        ret_from_fork+0x10/0x18
[  +0.004205]
              -> #1 (&opp_table->lock){+.+.}:
[  +0.005815]        __mutex_lock_common+0xec/0xc0c
[  +0.004832]        mutex_lock_nested+0x40/0x50
[  +0.004570]        _add_opp_dev+0x2c/0x58
[  +0.004119]        _opp_get_opp_table+0xdc/0x1ac
[  +0.004745]        dev_pm_opp_get_opp_table_indexed+0x24/0x30
[  +0.005899]        dev_pm_opp_of_add_table_indexed+0x48/0x84
[  +0.005814]        of_genpd_add_provider_onecell+0xc0/0x1b8
[  +0.005721]        rpmhpd_probe+0x240/0x268
[  +0.004306]        platform_drv_probe+0x90/0xb0
[  +0.004656]        really_probe+0x134/0x2ec
[  +0.004305]        driver_probe_device+0x64/0xfc
[  +0.004745]        __device_attach_driver+0x8c/0xa4
[  +0.005007]        bus_for_each_drv+0x90/0xd8
[  +0.004481]        __device_attach+0xc0/0x148
[  +0.004481]        device_initial_probe+0x20/0x2c
[  +0.004832]        bus_probe_device+0x34/0x94
[  +0.004481]        device_add+0x1fc/0x3b0
[  +0.004119]        of_device_add+0x3c/0x4c
[  +0.004206]        of_platform_device_create_pdata+0xb8/0xfc
[  +0.005810]        of_platform_bus_create+0x1e4/0x368
[  +0.005197]        of_platform_populate+0x70/0xbc
[  +0.004832]        devm_of_platform_populate+0x58/0xa0
[  +0.005284]        rpmh_rsc_probe+0x36c/0x3cc
[  +0.004480]        platform_drv_probe+0x90/0xb0
[  +0.004658]        really_probe+0x134/0x2ec
[  +0.004301]        driver_probe_device+0x64/0xfc
[  +0.004745]        __device_attach_driver+0x8c/0xa4
[  +0.005007]        bus_for_each_drv+0x90/0xd8
[  +0.004480]        __device_attach+0xc0/0x148
[  +0.004481]        device_initial_probe+0x20/0x2c
[  +0.004831]        bus_probe_device+0x34/0x94
[  +0.004482]        device_add+0x1fc/0x3b0
[  +0.004118]        of_device_add+0x3c/0x4c
[  +0.004214]        of_platform_device_create_pdata+0xb8/0xfc
[  +0.005817]        of_platform_bus_create+0x1e4/0x368
[  +0.005186]        of_platform_bus_create+0x230/0x368
[  +0.005188]        of_platform_populate+0x70/0xbc
[  +0.004832]        of_platform_default_populate_init+0xa8/0xc0
[  +0.005987]        do_one_initcall+0x1c8/0x3fc
[  +0.004569]        do_initcall_level+0xb4/0x10c
[  +0.004657]        do_basic_setup+0x30/0x48
[  +0.004305]        kernel_init_freeable+0x124/0x1a4
[  +0.005008]        kernel_init+0x14/0x104
[  +0.004119]        ret_from_fork+0x10/0x18
[  +0.004206]
              -> #0 (opp_table_lock){+.+.}:
[  +0.005640]        __lock_acquire+0xee4/0x2450
[  +0.004570]        lock_acquire+0x1cc/0x210
[  +0.004305]        __mutex_lock_common+0xec/0xc0c
[  +0.004833]        mutex_lock_nested+0x40/0x50
[  +0.004570]        _find_opp_table+0x34/0x74
[  +0.004393]        dev_pm_opp_find_freq_exact+0x2c/0xdc
[  +0.005372]        a6xx_gmu_resume+0xc8/0xecc
[  +0.004480]        a6xx_pm_resume+0x148/0x200
[  +0.004482]        adreno_resume+0x28/0x34
[  +0.004209]        pm_generic_runtime_resume+0x34/0x48
[  +0.005283]        __rpm_callback+0x70/0x10c
[  +0.004393]        rpm_callback+0x34/0x8c
[  +0.004119]        rpm_resume+0x414/0x550
[  +0.004119]        __pm_runtime_resume+0x7c/0xa0
[  +0.004746]        msm_gpu_submit+0x60/0x1c0
[  +0.004394]        msm_ioctl_gem_submit+0xadc/0xb60
[  +0.005010]        drm_ioctl_kernel+0x9c/0x118
[  +0.004569]        drm_ioctl+0x27c/0x408
[  +0.004034]        drm_compat_ioctl+0xcc/0xdc
[  +0.004483]        __se_compat_sys_ioctl+0x100/0x206c
[  +0.005186]        __arm64_compat_sys_ioctl+0x20/0x2c
[  +0.005187]        el0_svc_common+0xa8/0x178
[  +0.004393]        el0_svc_compat_handler+0x2c/0x40
[  +0.005009]        el0_svc_compat+0x8/0x10
[  +0.004205]
              other info that might help us debug this:

[  +0.008213] Chain exists of:
                opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex

[  +0.011780]  Possible unsafe locking scenario:

[  +0.006082]        CPU0                    CPU1
[  +0.004660]        ----                    ----
[  +0.004656]   lock(reservation_ww_class_mutex);
[  +0.004657]                                lock(&mm->mmap_sem);
[  +0.006079]                                lock(reservation_ww_class_mutex);
[  +0.007237]   lock(opp_table_lock);
[  +0.003592]
               *** DEADLOCK ***

[  +0.006084] 3 locks held by chrome/1865:
[  +0.004031]  #0: ffffff81edecc0d8 (&dev->struct_mutex){+.+.}, at:
msm_ioctl_gem_submit+0x264/0xb60
[  +0.009198]  #1: ffffff81d0000870
(reservation_ww_class_acquire){+.+.}, at:
msm_ioctl_gem_submit+0x8e8/0xb60
[  +0.010086]  #2: ffffff81f0fc71a8
(reservation_ww_class_mutex){+.+.}, at: submit_lock_objects+0x70/0x1ec
[  +0.009735]
              stack backtrace:
[  +0.004482] CPU: 0 PID: 1865 Comm: chrome Not tainted 5.4.72 #14
[  +0.006173] Hardware name: Google Lazor (rev1+) with LTE (DT)
[  +0.005899] Call trace:
[  +0.002515]  dump_backtrace+0x0/0x158
[  +0.003768]  show_stack+0x20/0x2c
[  +0.003407]  dump_stack+0xc8/0x160
[  +0.003506]  print_circular_bug+0x2c4/0x2c8
[  +0.004305]  check_noncircular+0x1a8/0x1b0
[  +0.004206]  __lock_acquire+0xee4/0x2450
[  +0.004032]  lock_acquire+0x1cc/0x210
[  +0.003768]  __mutex_lock_common+0xec/0xc0c
[  +0.004305]  mutex_lock_nested+0x40/0x50
[  +0.004033]  _find_opp_table+0x34/0x74
[  +0.003855]  dev_pm_opp_find_freq_exact+0x2c/0xdc
[  +0.004833]  a6xx_gmu_resume+0xc8/0xecc
[  +0.003943]  a6xx_pm_resume+0x148/0x200
[  +0.003944]  adreno_resume+0x28/0x34
[  +0.003681]  pm_generic_runtime_resume+0x34/0x48
[  +0.004745]  __rpm_callback+0x70/0x10c
[  +0.003854]  rpm_callback+0x34/0x8c
[  +0.003592]  rpm_resume+0x414/0x550
[  +0.003592]  __pm_runtime_resume+0x7c/0xa0
[  +0.004207]  msm_gpu_submit+0x60/0x1c0
[  +0.003855]  msm_ioctl_gem_submit+0xadc/0xb60
[  +0.004481]  drm_ioctl_kernel+0x9c/0x118
[  +0.004031]  drm_ioctl+0x27c/0x408
[  +0.003504]  drm_compat_ioctl+0xcc/0xdc
[  +0.003945]  __se_compat_sys_ioctl+0x100/0x206c
[  +0.004658]  __arm64_compat_sys_ioctl+0x20/0x2c
[  +0.004659]  el0_svc_common+0xa8/0x178
[  +0.003855]  el0_svc_compat_handler+0x2c/0x40
[  +0.004480]  el0_svc_compat+0x8/0x10

> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 2483e765318a..4cc0fb716381 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1181,6 +1181,10 @@ static void _opp_table_kref_release(struct kref *kref)
>         struct opp_device *opp_dev, *temp;
>         int i;
>
> +       /* Drop the lock as soon as we can */
> +       list_del(&opp_table->node);
> +       mutex_unlock(&opp_table_lock);
> +
>         _of_clear_opp_table(opp_table);
>
>         /* Release clk */
> @@ -1208,10 +1212,7 @@ static void _opp_table_kref_release(struct kref *kref)
>
>         mutex_destroy(&opp_table->genpd_virt_dev_lock);
>         mutex_destroy(&opp_table->lock);
> -       list_del(&opp_table->node);
>         kfree(opp_table);
> -
> -       mutex_unlock(&opp_table_lock);
>  }
>
>  void dev_pm_opp_put_opp_table(struct opp_table *opp_table)
>
> --
> viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
