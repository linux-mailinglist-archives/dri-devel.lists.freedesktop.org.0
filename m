Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1450BC38
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 17:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACDE10E3B8;
	Fri, 22 Apr 2022 15:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE34410E143
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 15:56:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id el3so6137840edb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xMb/6E6D8vYaEVYmHUTHLUaT7ebly6aMUjlVw/vTE1Y=;
 b=RUdk4w5ba2vvCZ1ir0NxVhJ20tgfJWllbtsYAHcEzg6cfNM/r406bNrmVq+tbx64zp
 9PwFMUdqyfuWRJTc5fk40en/QMQo40yt3s6fuU1usl47DV5vVrGmdmO09uscHUKUKJGB
 j25z/R7QxhtQyxjY9KJwtOwPaZi9XZu1Qj5ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xMb/6E6D8vYaEVYmHUTHLUaT7ebly6aMUjlVw/vTE1Y=;
 b=rZTMGjEK2sxXv1N8ggH7j1WcaacDYWXrc+QOBb/UijpCcXYnI+nzyFB8yBlsfkVOBS
 Dqv8BcH+8Fg2Bm4w9m00ZDr+al4hBgf7xEc5dsXsa1mGfNrVTgjrNu2632V6TQBkznhQ
 GzICddljWcQXR2OXxUxK5H9NSSHby6elIamjvD2d0CShGwRyMgrpxug5fOePNW56OtkC
 7jyM/GY8orOyyLIREmNer2LLAZUvj3ZdSYjmioBqUYSeO6MIU8fc53ueTe2dkr8ZLY8W
 UW8ZbG4vxcOQZBRrVLP5ej4Eh3w62a8nQ9H1OsNHPXCm8nAuHNLpkp6tenc9ExKDr/HA
 SCWA==
X-Gm-Message-State: AOAM531xCz3FEAokihG0sidiFQUZW6/WDfqgmovy/zYPVM/ykhPbqrc/
 RCBVxo4CcQe87PflyoKPk0e/Vf3ty9K/0Ft0aug=
X-Google-Smtp-Source: ABdhPJyKJzOhmJ3xKf8poErJ5sX0nGJ3eho+N6xCL7Swvqpxned/SDtKzIUh9jH2XnNrfHIZ25dywQ==
X-Received: by 2002:a05:6402:34cd:b0:424:793:9f65 with SMTP id
 w13-20020a05640234cd00b0042407939f65mr5571816edc.88.1650642974907; 
 Fri, 22 Apr 2022 08:56:14 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 z21-20020a170906435500b006e8669fae36sm870362ejm.189.2022.04.22.08.56.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:56:14 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id v12so4885924wrv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:56:13 -0700 (PDT)
X-Received: by 2002:a05:6000:1105:b0:20a:80b4:bcaf with SMTP id
 z5-20020a056000110500b0020a80b4bcafmr4285103wrw.679.1650642972904; Fri, 22
 Apr 2022 08:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 08:55:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWa8n0MJB8ks7bgrSj1Qop1Z5hvfEAOWtFcmsz38eR_w@mail.gmail.com>
Message-ID: <CAD=FV=WWa8n0MJB8ks7bgrSj1Qop1Z5hvfEAOWtFcmsz38eR_w@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
> controller are directly dependent on panel power. As eDP display can be
> assumed as always connected, the controller driver can skip the eDP
> connect and disconnect interrupts. Any disruption in the link status
> will be indicated via the IRQ_HPD interrupts.
>
> So, the eDP controller driver can just enable the IRQ_HPD and replug
> interrupts. The DP controller driver still needs to enable all the
> interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comment explaining the interrupt status register
>
> Changes in v8:
>   - add comment explaining the interrupt status return
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 16 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index fac815f..df9670d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -569,10 +569,6 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>
>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>
> -       /* enable HPD plug and unplug interrupts */
> -       dp_catalog_hpd_config_intr(dp_catalog,
> -               DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, true);
> -
>         /* Configure REFTIMER and enable it */
>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
> @@ -599,13 +595,21 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
> -       int isr = 0;
> +       int isr, mask;
>
>         isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
>                                  (isr & DP_DP_HPD_INT_MASK));
> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
>
> -       return isr;
> +       /*
> +        * We only want to return interrupts that are unmasked to the caller.
> +        * However, the interrupt status field also contains other
> +        * informational bits about the HPD state status, so we only mask
> +        * out the part of the register that tells us about which interrupts
> +        * are pending.
> +        */
> +       return isr & (mask | ~DP_DP_HPD_INT_MASK);
>  }
>
>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 055681a..dea4de9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -683,7 +683,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>         dp_display_handle_plugged_change(&dp->dp_display, false);
>
>         /* enable HDP plug interrupt to prepare for next plugin */
> -       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
> +       if (!dp->dp_display.is_edp)
> +               dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
>
>         DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
>                         dp->dp_display.connector_type, state);
> @@ -1096,6 +1097,13 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>         dp_display_host_init(dp);
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> +       /* Enable plug and unplug interrupts only for external DisplayPort */
> +       if (!dp->dp_display.is_edp)
> +               dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               true);
> +
>         /* Enable interrupt first time
>          * we are leaving dp clocks on during disconnect
>          * and never disable interrupt
> @@ -1381,6 +1389,12 @@ static int dp_pm_resume(struct device *dev)
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
>
> +       if (!dp->dp_display.is_edp)
> +               dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               true);
> +
>         if (dp_catalog_link_is_connected(dp->catalog)) {
>                 /*
>                  * set sink to normal operation mode -- D0
> @@ -1659,6 +1673,9 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>                 return;
>         }
>
> +       if (dp->is_edp)
> +               dp_hpd_plug_handle(dp_display, 0);

So I finally got a chance to test and unfortunately this is getting a
lockdep error. :( Here's the crawl with my current set of patches
(which, admittedly is on the chromeos-5.15 tree) instead of pure
upstream. I avoid the errors with this (sorry for the whitespace
damage, but it's really just a one-line change):

--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -582,7 +582,8 @@ static int dp_hpd_plug_handle(struct
dp_display_private *dp, u32 data)
         * add fail safe mode outside event_mutex scope
         * to avoid potiential circular lock with drm thread
         */
-       dp_panel_add_fail_safe_mode(dp->dp_display.connector);
+       if (!dp->dp_display.is_edp)
+               dp_panel_add_fail_safe_mode(dp->dp_display.connector);

        /* uevent will complete connection part */
        return 0;

That's a bit gross, but at least shows the problem. It's not a
_terrible_ fix because the failsafe modes don't make sense for eDP,
right? That being said, why are we hacking this in here? Shouldn't
this be in the core? ...or at least we should just be providing them
in get_modes()?

FWIW: the error was:

======================================================
 WARNING: possible circular locking dependency detected
 5.15.35-lockdep #6 Tainted: G        W
 ------------------------------------------------------
 frecon/429 is trying to acquire lock:
 ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
dp_panel_add_fail_safe_mode+0x4c/0xa0

 but task is already holding lock:
 ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at: lock_crtcs+0xb4/0x124

 which lock already depends on the new lock.


 the existing dependency chain (in reverse order) is:

 -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
        __mutex_lock_common+0x174/0x1a64
        mutex_lock_nested+0x98/0xac
        lock_crtcs+0xb4/0x124
        msm_atomic_commit_tail+0x330/0x748
        commit_tail+0x19c/0x278
        drm_atomic_helper_commit+0x1dc/0x1f0
        drm_atomic_commit+0xc0/0xd8
        drm_atomic_helper_set_config+0xb4/0x134
        drm_mode_setcrtc+0x688/0x1248
        drm_ioctl_kernel+0x1e4/0x338
        drm_ioctl+0x3a4/0x684
        __arm64_sys_ioctl+0x118/0x154
        invoke_syscall+0x78/0x224
        el0_svc_common+0x178/0x200
        do_el0_svc+0x94/0x13c
        el0_svc+0x5c/0xec
        el0t_64_sync_handler+0x78/0x108
        el0t_64_sync+0x1a4/0x1a8

 -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
        __mutex_lock_common+0x174/0x1a64
        ww_mutex_lock+0xb8/0x278
        modeset_lock+0x304/0x4ac
        drm_modeset_lock+0x4c/0x7c
        drmm_mode_config_init+0x4a8/0xc50
        msm_drm_init+0x274/0xac0
        msm_drm_bind+0x20/0x2c
        try_to_bring_up_master+0x3dc/0x470
        __component_add+0x18c/0x3c0
        component_add+0x1c/0x28
        dp_display_probe+0x954/0xa98
        platform_probe+0x124/0x15c
        really_probe+0x1b0/0x5f8
        __driver_probe_device+0x174/0x20c
        driver_probe_device+0x70/0x134
        __device_attach_driver+0x130/0x1d0
        bus_for_each_drv+0xfc/0x14c
        __device_attach+0x1bc/0x2bc
        device_initial_probe+0x1c/0x28
        bus_probe_device+0x94/0x178
        deferred_probe_work_func+0x1a4/0x1f0
        process_one_work+0x5d4/0x9dc
        worker_thread+0x898/0xccc
        kthread+0x2d4/0x3d4
        ret_from_fork+0x10/0x20

 -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
        ww_acquire_init+0x1c4/0x2c8
        drm_modeset_acquire_init+0x44/0xc8
        drm_helper_probe_single_connector_modes+0xb0/0x12dc
        drm_mode_getconnector+0x5dc/0xfe8
        drm_ioctl_kernel+0x1e4/0x338
        drm_ioctl+0x3a4/0x684
        __arm64_sys_ioctl+0x118/0x154
        invoke_syscall+0x78/0x224
        el0_svc_common+0x178/0x200
        do_el0_svc+0x94/0x13c
        el0_svc+0x5c/0xec
        el0t_64_sync_handler+0x78/0x108
        el0t_64_sync+0x1a4/0x1a8

 -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
        __lock_acquire+0x2650/0x672c
        lock_acquire+0x1b4/0x4ac
        __mutex_lock_common+0x174/0x1a64
        mutex_lock_nested+0x98/0xac
        dp_panel_add_fail_safe_mode+0x4c/0xa0
        dp_hpd_plug_handle+0x1f0/0x280
        dp_bridge_enable+0x94/0x2b8
        drm_atomic_bridge_chain_enable+0x11c/0x168
        drm_atomic_helper_commit_modeset_enables+0x500/0x740
        msm_atomic_commit_tail+0x3e4/0x748
        commit_tail+0x19c/0x278
        drm_atomic_helper_commit+0x1dc/0x1f0
        drm_atomic_commit+0xc0/0xd8
        drm_atomic_helper_set_config+0xb4/0x134
        drm_mode_setcrtc+0x688/0x1248
        drm_ioctl_kernel+0x1e4/0x338
        drm_ioctl+0x3a4/0x684
        __arm64_sys_ioctl+0x118/0x154
        invoke_syscall+0x78/0x224
        el0_svc_common+0x178/0x200
        do_el0_svc+0x94/0x13c
        el0_svc+0x5c/0xec
        el0t_64_sync_handler+0x78/0x108
        el0t_64_sync+0x1a4/0x1a8

 other info that might help us debug this:

 Chain exists of:
   &dev->mode_config.mutex --> crtc_ww_class_mutex --> &kms->commit_lock[i]

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&kms->commit_lock[i]);
                                lock(crtc_ww_class_mutex);
                                lock(&kms->commit_lock[i]);
   lock(&dev->mode_config.mutex);

  *** DEADLOCK ***

 3 locks held by frecon/429:
  #0: ffffffc00e197ab0 (crtc_ww_class_acquire){+.+.}-{0:0}, at:
drm_modeset_acquire_init+0x44/0xc8
  #1: ffffff808dc3c588 (crtc_ww_class_mutex){+.+.}-{3:3}, at:
modeset_lock+0x18c/0x4ac
  #2: ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at:
lock_crtcs+0xb4/0x124

 stack backtrace:
 CPU: 5 PID: 429 Comm: frecon Tainted: G        W
5.15.35-lockdep #6 9ba2ecd8f15354021fe165873da3aaa99f5b6798
 Hardware name: Google Herobrine (rev1+) (DT)
 Call trace:
  dump_backtrace+0x0/0x3c4
  show_stack+0x20/0x2c
  dump_stack_lvl+0x78/0x9c
  dump_stack+0x18/0x44
  print_circular_bug+0x17c/0x1a8
  check_noncircular+0x260/0x30c
  __lock_acquire+0x2650/0x672c
  lock_acquire+0x1b4/0x4ac
  __mutex_lock_common+0x174/0x1a64
  mutex_lock_nested+0x98/0xac
  dp_panel_add_fail_safe_mode+0x4c/0xa0
  dp_hpd_plug_handle+0x1f0/0x280
  dp_bridge_enable+0x94/0x2b8
  drm_atomic_bridge_chain_enable+0x11c/0x168
  drm_atomic_helper_commit_modeset_enables+0x500/0x740
  msm_atomic_commit_tail+0x3e4/0x748
  commit_tail+0x19c/0x278
  drm_atomic_helper_commit+0x1dc/0x1f0
  drm_atomic_commit+0xc0/0xd8
  drm_atomic_helper_set_config+0xb4/0x134
  drm_mode_setcrtc+0x688/0x1248
  drm_ioctl_kernel+0x1e4/0x338
  drm_ioctl+0x3a4/0x684
  __arm64_sys_ioctl+0x118/0x154
  invoke_syscall+0x78/0x224
  el0_svc_common+0x178/0x200
  do_el0_svc+0x94/0x13c
  el0_svc+0x5c/0xec
  el0t_64_sync_handler+0x78/0x108
  el0t_64_sync+0x1a4/0x1a8
