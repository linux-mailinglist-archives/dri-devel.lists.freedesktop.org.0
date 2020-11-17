Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E562B6AF8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541F189C9B;
	Tue, 17 Nov 2020 17:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DCD89C80;
 Tue, 17 Nov 2020 17:02:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so23922298wrt.4;
 Tue, 17 Nov 2020 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kVFQinOKMiYmTxL0+565PS4DxruCttuUvzhQYxw/2c=;
 b=Jq6oHZMvC6sT2f4R/ngI08BLuabDYAqtQEnIzkn1YcysmoYmQV1WDR0qjgV64upQCK
 q00RfNTFRdVG++YQABWcCGqJniDO0f48pZ0oCLdOE9Qc48oXF0MwwOXWn9yuntYWuKXG
 hSLs3oUcZEEPT00/nbPDCHbibZZhjdKgICY/2m3eF3n4JitnNHkaBuiJzT7JlqvGbpi8
 gcFMqHPOmvX3JT8CR7AZ5eAocfr+VAexeTYOi3cG9RtGc4lI2/2/vFxmFpILVA6c3O8t
 +BB6e9U/H85S9AhNWGRhs3tgmiOH4b7FCmlQUx1Cw5XYxQxs6SWJVyzcFaVohySyjgWU
 Z24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kVFQinOKMiYmTxL0+565PS4DxruCttuUvzhQYxw/2c=;
 b=HIwHFfnk0ayUux2ebOcM9SwkEnEaJ9RHqM9wrRKemdlVp5no8n0SW4OGbIJyrkTdVb
 qL8V3ClGjVfS4NTiTXC5GQ8K11NnTXl5HaVweCX1Di+sp44mCocPyUNJZ9nkOlLfLcC4
 NUkycoiM9sjhwK6DSEsXw27P+95dHwJrdRqOfbbWmj6soVyg4Vc7HYwkLXEuHuxqWBtO
 pYsexqEoqbBmadfszIEht4aBt39DMvBGFqN4bqnYQIGSUeEI7IK7b4wGHXw79Ag7ZkEw
 5wF2xUh68Ecdc7Kyl/0CoOt3ZX8HbpNOjSOqQ6z2QrcWC8W83hx0m9wsxsZ/kaYaVT3e
 hcNQ==
X-Gm-Message-State: AOAM530PnttYtjGA0Phvlmv+yZArOrFCtmhNbvgh1NRNglKzW57KzUvq
 WsHVacHp20A5Z4vJ1NXVxzz6uxEOuvGvwOJkpis=
X-Google-Smtp-Source: ABdhPJwdMHdz3n2rRDIdUpXiehyFfSuLp/8Fzfb5+62LsN6Nu7GcB5g8m0LJDHUt2Sx8FL/m8PocgkzWtVReCj1eBt8=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr542812wrb.132.1605632575890; 
 Tue, 17 Nov 2020 09:02:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
In-Reply-To: <20201106071621.j732gt4nqifjrccd@vireshk-i7>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Nov 2020 09:02:41 -0800
Message-ID: <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
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

On Thu, Nov 5, 2020 at 11:16 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-11-20, 11:24, Rob Clark wrote:
> > On Tue, Nov 3, 2020 at 7:04 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 03-11-20, 08:50, Rob Clark wrote:
> > > > sorry, it didn't apply cleanly (which I guess is due to some other
> > > > dependencies that need to be picked back to v5.4 product kernel), and
> > > > due to some other things I'm in middle of debugging I didn't have time
> > > > yet to switch to v5.10-rc or look at what else needs to
> > > > cherry-picked..
> > > >
> > > > If you could, pushing a branch with this patch somewhere would be a
> > > > bit easier to work with (ie. fetch && cherry-pick is easier to deal
> > > > with than picking things from list)
> > >
> > > It has been in linux-next for a few days. Here is the HEAD to pick
> > > from. There are few patches there since rc1.
> > >
> > > commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")
> > >
> >
> > sorry for the delay, with that cherry-picked, I'm getting a whole lot of:
>
> Ahh, sorry about that and thanks for reporting it. Here is the fix:
>
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index c718092757d9..6b7f0066942d 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -112,8 +112,6 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
>         struct opp_table *opp_table;
>         struct device_node *opp_table_np;
>
> -       lockdep_assert_held(&opp_table_lock);
> -
>         opp_table_np = of_get_parent(opp_np);
>         if (!opp_table_np)
>                 goto err;
> @@ -121,12 +119,15 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
>         /* It is safe to put the node now as all we need now is its address */
>         of_node_put(opp_table_np);
>
> +       mutex_lock(&opp_table_lock);
>         list_for_each_entry(opp_table, &opp_tables, node) {
>                 if (opp_table_np == opp_table->np) {
>                         _get_opp_table_kref(opp_table);
> +                       mutex_unlock(&opp_table_lock);
>                         return opp_table;
>                 }
>         }
> +       mutex_unlock(&opp_table_lock);
>
>  err:
>         return ERR_PTR(-ENODEV);
>

With that on top of the previous patch,

[   26.378245] ======================================================
[   26.384595] WARNING: possible circular locking dependency detected
[   26.390947] 5.10.0-rc2+ #6 Not tainted
[   26.394804] ------------------------------------------------------
[   26.401155] chrome/1886 is trying to acquire lock:
[   26.406087] ffffffe5e264aa88 (opp_table_lock){+.+.}-{3:3}, at:
_find_opp_table+0x38/0x78
[   26.414436]
[   26.414436] but task is already holding lock:
[   26.420423] ffffffb0283935b0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
submit_lock_objects+0x70/0x1ec
[   26.430268]
[   26.430268] which lock already depends on the new lock.
[   26.430268]
[   26.438661]
[   26.438661] the existing dependency chain (in reverse order) is:
[   26.446343]
[   26.446343] -> #3 (reservation_ww_class_mutex){+.+.}-{3:3}:
[   26.453603]        lock_acquire+0x23c/0x30c
[   26.457910]        __mutex_lock_common+0xdc/0xbc4
[   26.462743]        ww_mutex_lock_interruptible+0x84/0xec
[   26.468203]        msm_gem_fault+0x30/0x138
[   26.472507]        __do_fault+0x44/0x184
[   26.476541]        handle_mm_fault+0x754/0xc50
[   26.481117]        do_page_fault+0x230/0x354
[   26.485507]        do_translation_fault+0x40/0x54
[   26.490338]        do_mem_abort+0x44/0xac
[   26.494469]        el0_sync_compat_handler+0x15c/0x190
[   26.499756]        el0_sync_compat+0x144/0x180
[   26.504328]
[   26.504328] -> #2 (&mm->mmap_lock){++++}-{3:3}:
[   26.510511]        lock_acquire+0x23c/0x30c
[   26.514813]        __might_fault+0x60/0x80
[   26.519034]        compat_filldir+0x118/0x4d0
[   26.523519]        dcache_readdir+0x74/0x1e0
[   26.527907]        iterate_dir+0xd4/0x198
[   26.532037]        __arm64_compat_sys_getdents+0x6c/0x168
[   26.537583]        el0_svc_common+0xa4/0x174
[   26.541970]        do_el0_svc_compat+0x20/0x30
[   26.546543]        el0_sync_compat_handler+0x124/0x190
[   26.551828]        el0_sync_compat+0x144/0x180
[   26.556399]
[   26.556399] -> #1 (&sb->s_type->i_mutex_key#2){++++}-{3:3}:
[   26.563660]        lock_acquire+0x23c/0x30c
[   26.567963]        down_write+0x80/0x1dc
[   26.571997]        simple_recursive_removal+0x48/0x238
[   26.577288]        debugfs_remove+0x5c/0x78
[   26.581592]        opp_debug_unregister+0x34/0x118
[   26.586521]        dev_pm_opp_put_opp_table+0xd0/0x14c
[   26.591802]        dev_pm_opp_put_clkname+0x40/0x54
[   26.596820]        msm_dsi_host_destroy+0xe0/0x108
[   26.601748]        dsi_destroy+0x40/0x58
[   26.605789]        dsi_bind+0x8c/0x16c
[   26.609648]        component_bind_all+0xf4/0x20c
[   26.614399]        msm_drm_init+0x180/0x588
[   26.618696]        msm_drm_bind+0x1c/0x24
[   26.622822]        try_to_bring_up_master+0x160/0x1a8
[   26.628014]        component_master_add_with_match+0xc4/0x108
[   26.633918]        msm_pdev_probe+0x214/0x2a4
[   26.638405]        platform_drv_probe+0x94/0xb4
[   26.643066]        really_probe+0x138/0x348
[   26.647365]        driver_probe_device+0x80/0xb8
[   26.652111]        device_driver_attach+0x50/0x70
[   26.656951]        __driver_attach+0xb4/0xc8
[   26.661340]        bus_for_each_dev+0x80/0xc8
[   26.665825]        driver_attach+0x28/0x30
[   26.670038]        bus_add_driver+0x100/0x1d4
[   26.674524]        driver_register+0x68/0xfc
[   26.678910]        __platform_driver_register+0x48/0x50
[   26.684284]        msm_drm_register+0x64/0x68
[   26.688766]        do_one_initcall+0x1ac/0x3e4
[   26.693341]        do_initcall_level+0xa0/0xb8
[   26.697910]        do_initcalls+0x58/0x94
[   26.702039]        do_basic_setup+0x28/0x30
[   26.706338]        kernel_init_freeable+0x190/0x1d0
[   26.711352]        kernel_init+0x18/0x10c
[   26.715481]        ret_from_fork+0x10/0x18
[   26.719692]
[   26.719692] -> #0 (opp_table_lock){+.+.}-{3:3}:
[   26.725883]        check_noncircular+0x12c/0x134
[   26.730627]        __lock_acquire+0x2288/0x2b2c
[   26.735284]        lock_acquire+0x23c/0x30c
[   26.739584]        __mutex_lock_common+0xdc/0xbc4
[   26.744426]        mutex_lock_nested+0x50/0x58
[   26.748998]        _find_opp_table+0x38/0x78
[   26.753395]        dev_pm_opp_find_freq_exact+0x2c/0xdc
[   26.758771]        a6xx_gmu_resume+0xcc/0xed0
[   26.763255]        a6xx_pm_resume+0x140/0x174
[   26.767741]        adreno_resume+0x24/0x2c
[   26.771956]        pm_generic_runtime_resume+0x2c/0x3c
[   26.777244]        __rpm_callback+0x74/0x114
[   26.781633]        rpm_callback+0x30/0x84
[   26.785759]        rpm_resume+0x3c8/0x4f0
[   26.789884]        __pm_runtime_resume+0x80/0xa4
[   26.794631]        msm_gpu_submit+0x60/0x228
[   26.799019]        msm_ioctl_gem_submit+0xba0/0xc1c
[   26.804038]        drm_ioctl_kernel+0xa0/0x11c
[   26.808608]        drm_ioctl+0x240/0x3dc
[   26.812653]        drm_compat_ioctl+0xd4/0xe4
[   26.817141]        __arm64_compat_sys_ioctl+0xc4/0xf8
[   26.822331]        el0_svc_common+0xa4/0x174
[   26.826718]        do_el0_svc_compat+0x20/0x30
[   26.831291]        el0_sync_compat_handler+0x124/0x190
[   26.836577]        el0_sync_compat+0x144/0x180
[   26.841148]
[   26.841148] other info that might help us debug this:
[   26.841148]
[   26.849361] Chain exists of:
[   26.849361]   opp_table_lock --> &mm->mmap_lock -->
reservation_ww_class_mutex
[   26.849361]
[   26.861249]  Possible unsafe locking scenario:
[   26.861249]
[   26.867334]        CPU0                    CPU1
[   26.871990]        ----                    ----
[   26.876647]   lock(reservation_ww_class_mutex);
[   26.881309]                                lock(&mm->mmap_lock);
[   26.887487]                                lock(reservation_ww_class_mutex);
[   26.894730]   lock(opp_table_lock);
[   26.898327]
[   26.898327]  *** DEADLOCK ***
[   26.898327]
[   26.904410] 3 locks held by chrome/1886:
[   26.908447]  #0: ffffffb005bd9138 (&dev->struct_mutex){+.+.}-{3:3},
at: msm_ioctl_gem_submit+0x238/0xc1c
[   26.918199]  #1: ffffffb02251fa70
(reservation_ww_class_acquire){+.+.}-{0:0}, at:
msm_ioctl_gem_submit+0x978/0xc1c
[   26.928843]  #2: ffffffb0283935b0
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
submit_lock_objects+0x70/0x1ec
[   26.939126]
[   26.939126] stack backtrace:
[   26.943612] CPU: 5 PID: 1886 Comm: chrome Not tainted 5.10.0-rc2+ #6
[   26.950137] Hardware name: Google Lazor (rev1+) with LTE (DT)
[   26.956039] Call trace:
[   26.958566]  dump_backtrace+0x0/0x1b4
[   26.962333]  show_stack+0x1c/0x24
[   26.965754]  dump_stack+0xdc/0x158
[   26.969251]  print_circular_bug+0x308/0x338
[   26.973550]  check_noncircular+0x12c/0x134
[   26.977762]  __lock_acquire+0x2288/0x2b2c
[   26.981889]  lock_acquire+0x23c/0x30c
[   26.985658]  __mutex_lock_common+0xdc/0xbc4
[   26.989961]  mutex_lock_nested+0x50/0x58
[   26.993994]  _find_opp_table+0x38/0x78
[   26.997852]  dev_pm_opp_find_freq_exact+0x2c/0xdc
[   27.002690]  a6xx_gmu_resume+0xcc/0xed0
[   27.006635]  a6xx_pm_resume+0x140/0x174
[   27.010580]  adreno_resume+0x24/0x2c
[   27.014259]  pm_generic_runtime_resume+0x2c/0x3c
[   27.019008]  __rpm_callback+0x74/0x114
[   27.022868]  rpm_callback+0x30/0x84
[   27.026455]  rpm_resume+0x3c8/0x4f0
[   27.030042]  __pm_runtime_resume+0x80/0xa4
[   27.034259]  msm_gpu_submit+0x60/0x228
[   27.038117]  msm_ioctl_gem_submit+0xba0/0xc1c
[   27.042604]  drm_ioctl_kernel+0xa0/0x11c
[   27.046637]  drm_ioctl+0x240/0x3dc
[   27.050139]  drm_compat_ioctl+0xd4/0xe4
[   27.054088]  __arm64_compat_sys_ioctl+0xc4/0xf8
[   27.058748]  el0_svc_common+0xa4/0x174
[   27.062606]  do_el0_svc_compat+0x20/0x30
[   27.066647]  el0_sync_compat_handler+0x124/0x190
[   27.071393]  el0_sync_compat+0x144/0x180

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
