Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87314127F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 21:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97CB6F91D;
	Fri, 17 Jan 2020 20:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEB86F91D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 20:53:56 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z8so27467598ioh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oNt+9e1+N0Nir29x2cxpgj6OiqmSw8nDn++ZOimwebw=;
 b=f5+CECfNxRDqBkhiBRl7/RSsdXNjujlP9awhHaeLiXsdZz44CvxyHB9bAuhvaOCnRp
 063jBvxW8Zw854TYyVl9KU4tYMLbCrI++0hOfmqrHdOJKwl3lkW0+3k50RmXaLPmj+DP
 Y3L4YZae+kqAEzeSAMVO1xl9SjjIg+KWkxrQJJJNXdAyTRA/4AUcms48ywjPRm21MU6P
 KiGaLrUedV7ry3YgMS+CMxl5zh6uKePa7J/2VWSPFB9emxUzeRp2SF/T+ouewB17m3z4
 Taj/ZKx9eb3JO6wVW5DFVtlPlUIT3ZTqxoJIyuUfasmNEQccZn8fDmJ1hXa2jq/EK1Fk
 CcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oNt+9e1+N0Nir29x2cxpgj6OiqmSw8nDn++ZOimwebw=;
 b=m+h8XblZmATm+ILuT+koxeijApAq7hqr71vZEPIzc6tVMvttxij/YR1GZor/KZ9tkv
 WyusN2YQmarK5y5dP+GXLeLEEm6QpRpxr3xC2Fj3qEim2zm/Ly5827SBCh6xL0vdRO07
 24UdSesIXNKtyAg3pkOlpYShQF54tisONaPOyTSdt+jY6M6ZwaJn/lasNm/f7j2iULvu
 3Lgof9HeM4ILiB/YmIKvm29KW/bA2aHe8C9R6Xh4xHpeQsmPGqGEKab2zg13uR36DKNW
 5C3pCgHrzKzSMFcfH3BlXBDIgg6Mo1A6cmH8j6A9582jV183YIMQ4DNyqQLnHe+9orVG
 jVMg==
X-Gm-Message-State: APjAAAXQPM1yjLb1KI6ESMXiRwRvdQC7/49NRXx0WxN2ZNNPOZ3krjvl
 3HVj7LbZgMHW0GVEb5bVaecxxTj0e/QCa9+fYy/fLQ==
X-Google-Smtp-Source: APXvYqw/EodL9Vbb/8s+i3a5TvqhfSt6jTGuBM8otrNtjI8l4ZJr1aTfkZvuMtxGPK5hg2bbZj8hVHilfIDagbT0f2g=
X-Received: by 2002:a02:864b:: with SMTP id e69mr34342785jai.83.1579294436246; 
 Fri, 17 Jan 2020 12:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20200117205149.97262-1-lyude@redhat.com>
In-Reply-To: <20200117205149.97262-1-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 17 Jan 2020 15:53:20 -0500
Message-ID: <CAMavQK+QSbf++fEPu9WfyGR2+2QrbRN_x1f40Sz6kjw4wUP5vg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/dp_mst: Remove VCPI while disabling topology
 mgr"
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 3:51 PM Lyude Paul <lyude@redhat.com> wrote:
>
> This reverts commit 64e62bdf04ab8529f45ed0a85122c703035dec3a.
>
> This commit ends up causing some lockdep splats due to trying to grab the
> payload lock while holding the mgr's lock:
>
> [   54.010099]
> [   54.011765] ======================================================
> [   54.018670] WARNING: possible circular locking dependency detected
> [   54.025577] 5.5.0-rc6-02274-g77381c23ee63 #47 Not tainted
> [   54.031610] ------------------------------------------------------
> [   54.038516] kworker/1:6/1040 is trying to acquire lock:
> [   54.044354] ffff888272af3228 (&mgr->payload_lock){+.+.}, at:
> drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
> [   54.054957]
> [   54.054957] but task is already holding lock:
> [   54.061473] ffff888272af3060 (&mgr->lock){+.+.}, at:
> drm_dp_mst_topology_mgr_set_mst+0x3c/0x2e4
> [   54.071193]
> [   54.071193] which lock already depends on the new lock.
> [   54.071193]
> [   54.080334]
> [   54.080334] the existing dependency chain (in reverse order) is:
> [   54.088697]
> [   54.088697] -> #1 (&mgr->lock){+.+.}:
> [   54.094440]        __mutex_lock+0xc3/0x498
> [   54.099015]        drm_dp_mst_topology_get_port_validated+0x25/0x80
> [   54.106018]        drm_dp_update_payload_part1+0xa2/0x2e2
> [   54.112051]        intel_mst_pre_enable_dp+0x144/0x18f
> [   54.117791]        intel_encoders_pre_enable+0x63/0x70
> [   54.123532]        hsw_crtc_enable+0xa1/0x722
> [   54.128396]        intel_update_crtc+0x50/0x194
> [   54.133455]        skl_commit_modeset_enables+0x40c/0x540
> [   54.139485]        intel_atomic_commit_tail+0x5f7/0x130d
> [   54.145418]        intel_atomic_commit+0x2c8/0x2d8
> [   54.150770]        drm_atomic_helper_set_config+0x5a/0x70
> [   54.156801]        drm_mode_setcrtc+0x2ab/0x833
> [   54.161862]        drm_ioctl+0x2e5/0x424
> [   54.166242]        vfs_ioctl+0x21/0x2f
> [   54.170426]        do_vfs_ioctl+0x5fb/0x61e
> [   54.175096]        ksys_ioctl+0x55/0x75
> [   54.179377]        __x64_sys_ioctl+0x1a/0x1e
> [   54.184146]        do_syscall_64+0x5c/0x6d
> [   54.188721]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   54.194946]
> [   54.194946] -> #0 (&mgr->payload_lock){+.+.}:
> [   54.201463]
> [   54.201463] other info that might help us debug this:
> [   54.201463]
> [   54.210410]  Possible unsafe locking scenario:
> [   54.210410]
> [   54.217025]        CPU0                    CPU1
> [   54.222082]        ----                    ----
> [   54.227138]   lock(&mgr->lock);
> [   54.230643]                                lock(&mgr->payload_lock);
> [   54.237742]                                lock(&mgr->lock);
> [   54.244062]   lock(&mgr->payload_lock);
> [   54.248346]
> [   54.248346]  *** DEADLOCK ***
> [   54.248346]
> [   54.254959] 7 locks held by kworker/1:6/1040:
> [   54.259822]  #0: ffff888275c4f528 ((wq_completion)events){+.+.},
> at: worker_thread+0x455/0x6e2
> [   54.269451]  #1: ffffc9000119beb0
> ((work_completion)(&(&dev_priv->hotplug.hotplug_work)->work)){+.+.},
> at: worker_thread+0x455/0x6e2
> [   54.282768]  #2: ffff888272a403f0 (&dev->mode_config.mutex){+.+.},
> at: i915_hotplug_work_func+0x4b/0x2be
> [   54.293368]  #3: ffffffff824fc6c0 (drm_connector_list_iter){.+.+},
> at: i915_hotplug_work_func+0x17e/0x2be
> [   54.304061]  #4: ffffc9000119bc58 (crtc_ww_class_acquire){+.+.},
> at: drm_helper_probe_detect_ctx+0x40/0xfd
> [   54.314855]  #5: ffff888272a40470 (crtc_ww_class_mutex){+.+.}, at:
> drm_modeset_lock+0x74/0xe2
> [   54.324385]  #6: ffff888272af3060 (&mgr->lock){+.+.}, at:
> drm_dp_mst_topology_mgr_set_mst+0x3c/0x2e4
> [   54.334597]
> [   54.334597] stack backtrace:
> [   54.339464] CPU: 1 PID: 1040 Comm: kworker/1:6 Not tainted
> 5.5.0-rc6-02274-g77381c23ee63 #47
> [   54.348893] Hardware name: Google Fizz/Fizz, BIOS
> Google_Fizz.10139.39.0 01/04/2018
> [   54.357451] Workqueue: events i915_hotplug_work_func
> [   54.362995] Call Trace:
> [   54.365724]  dump_stack+0x71/0x9c
> [   54.369427]  check_noncircular+0x91/0xbc
> [   54.373809]  ? __lock_acquire+0xc9e/0xf66
> [   54.378286]  ? __lock_acquire+0xc9e/0xf66
> [   54.382763]  ? lock_acquire+0x175/0x1ac
> [   54.387048]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
> [   54.393177]  ? __mutex_lock+0xc3/0x498
> [   54.397362]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
> [   54.403492]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
> [   54.409620]  ? drm_dp_dpcd_access+0xd9/0x101
> [   54.414390]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
> [   54.420517]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
> [   54.426645]  ? intel_digital_port_connected+0x34d/0x35c
> [   54.432482]  ? intel_dp_detect+0x227/0x44e
> [   54.437056]  ? ww_mutex_lock+0x49/0x9a
> [   54.441242]  ? drm_helper_probe_detect_ctx+0x75/0xfd
> [   54.446789]  ? intel_encoder_hotplug+0x4b/0x97
> [   54.451752]  ? intel_ddi_hotplug+0x61/0x2e0
> [   54.456423]  ? mark_held_locks+0x53/0x68
> [   54.460803]  ? _raw_spin_unlock_irqrestore+0x3a/0x51
> [   54.466347]  ? lockdep_hardirqs_on+0x187/0x1a4
> [   54.471310]  ? drm_connector_list_iter_next+0x89/0x9a
> [   54.476953]  ? i915_hotplug_work_func+0x206/0x2be
> [   54.482208]  ? worker_thread+0x4d5/0x6e2
> [   54.486587]  ? worker_thread+0x455/0x6e2
> [   54.490966]  ? queue_work_on+0x64/0x64
> [   54.495151]  ? kthread+0x1e9/0x1f1
> [   54.498946]  ? queue_work_on+0x64/0x64
> [   54.503130]  ? kthread_unpark+0x5e/0x5e
> [   54.507413]  ? ret_from_fork+0x3a/0x50
>
> The proper fix for this is probably cleanup the VCPI allocations when we're
> enabling the topology, or on the first payload allocation. For now though,
> let's just revert.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 64e62bdf04ab ("drm/dp_mst: Remove VCPI while disabling topology mgr")
> Cc: Sean Paul <sean@poorly.run>

Reviewed-by: Sean Paul <sean@poorly.run>

> Cc: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 4b74193b89ce..0c585f2bbb69 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3481,7 +3481,6 @@ static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_count)
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state)
>  {
>         int ret = 0;
> -       int i = 0;
>         struct drm_dp_mst_branch *mstb = NULL;
>
>         mutex_lock(&mgr->lock);
> @@ -3542,22 +3541,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>                 /* this can fail if the device is gone */
>                 drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
>                 ret = 0;
> -               mutex_lock(&mgr->payload_lock);
>                 memset(mgr->payloads, 0, mgr->max_payloads * sizeof(struct drm_dp_payload));
>                 mgr->payload_mask = 0;
>                 set_bit(0, &mgr->payload_mask);
> -               for (i = 0; i < mgr->max_payloads; i++) {
> -                       struct drm_dp_vcpi *vcpi = mgr->proposed_vcpis[i];
> -
> -                       if (vcpi) {
> -                               vcpi->vcpi = 0;
> -                               vcpi->num_slots = 0;
> -                       }
> -                       mgr->proposed_vcpis[i] = NULL;
> -               }
>                 mgr->vcpi_mask = 0;
> -               mutex_unlock(&mgr->payload_lock);
> -
>                 mgr->payload_id_table_cleared = false;
>         }
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
