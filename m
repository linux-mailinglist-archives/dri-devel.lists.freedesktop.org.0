Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30497510A9D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 22:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBA110E54B;
	Tue, 26 Apr 2022 20:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEBD10E54B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 20:35:29 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y3so18033281ejo.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IC6Od0klXqlGiMnd1esod6/n0v5qSB1AOo3OlCW54XI=;
 b=GNTsYQJN36xWzCf1JNUO9Iz6uE63qa8h6qB65DXRmu/HWyMk/PpyNOZOtTbCTmCp9F
 jIUZ6RpZ4SM9pjK5O9gz7Bby/c6yVAMT1jxKxOyjGY6nYCf+PNYtUvsDd0ulfOe/E+Mu
 KJocXpxHUoVRISRp2e6FW7IpzANa6+x9pFF1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IC6Od0klXqlGiMnd1esod6/n0v5qSB1AOo3OlCW54XI=;
 b=xMyx/0Z6KMfEX1SZaKS2VyTgz9z+J83O05SHNkUeJUGAVzxfWbKOQ5XRe0N5dnpJ+l
 9LNyRSnldAkLHSnKZS/b90ktuPvNCWYrM05JK8PV4M41GgeR/zCgizz0pgzPDKXrwf/R
 VjIciaTegVUu1kYWEqazDkKfJNwh4nQrDT3BtUwKl4Nc93hAGxikwiWyKIbSQMJcI9z7
 FddmWb/WI9P5xBcfPP1CRwWcwT3iGw7RMtEIP45aaiVDT8afaYSLBtRiVNDpQw2aDsAx
 cIXpcHz/1MB8DK+EgJO3uqDX9DmDjWJFzVDgSaZORqgDgHiSH6WzZS+vKHbhxtvBxJLY
 3Dqw==
X-Gm-Message-State: AOAM531QpIfUQbjfozCpqr8oOL8pmcXX3wZRY2k8IFDhE1DqTNVwEBw7
 WKc+2cGf80NhTOwLOVi59ylH8h94hs0B6AvScE8=
X-Google-Smtp-Source: ABdhPJwDB/aHdjrU98dE6N9tsdOMQ+/VoLiwrrLELKiDVhcB/PgpNzN0YFzlxObOD3YWGiuVpTvKsA==
X-Received: by 2002:a17:907:6da4:b0:6f3:83c3:9c9f with SMTP id
 sb36-20020a1709076da400b006f383c39c9fmr14861307ejc.205.1651005327234; 
 Tue, 26 Apr 2022 13:35:27 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 22-20020a508e16000000b00425c9d1704bsm5878805edw.4.2022.04.26.13.35.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:35:26 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id s21so12349101wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:35:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:20a:a4b0:dbc8 with SMTP id
 i11-20020a0560001acb00b0020aa4b0dbc8mr19232274wry.513.1651005325037; Tue, 26
 Apr 2022 13:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <1651005021-3069-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1651005021-3069-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Apr 2022 13:35:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdT5RyO5=Jq-qEgW8dobxd7+f50-ie-tA3-yb5w0Awtg@mail.gmail.com>
Message-ID: <CAD=FV=WdT5RyO5=Jq-qEgW8dobxd7+f50-ie-tA3-yb5w0Awtg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: remove fail safe mode related code
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 26, 2022 at 1:30 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
>
> After review all possibilities methods and as discussed on
> https://patchwork.freedesktop.org/patch/483155/, supporting EDID
> compliance tests in the driver is quite hacky. As seen with other
> vendor drivers, supporting these will be much easier with IGT. Hence
> removing all the related fail safe code for it so that no possibility
> of circular lock will happen.
>
> ======================================================
>  WARNING: possible circular locking dependency detected
>  5.15.35-lockdep #6 Tainted: G        W
>  ------------------------------------------------------
>  frecon/429 is trying to acquire lock:
>  ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
> dp_panel_add_fail_safe_mode+0x4c/0xa0
>
>  but task is already holding lock:
>  ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at: lock_crtcs+0xb4/0x124
>
>  which lock already depends on the new lock.
>
>  the existing dependency chain (in reverse order) is:
>
>  -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
>         __mutex_lock_common+0x174/0x1a64
>         mutex_lock_nested+0x98/0xac
>         lock_crtcs+0xb4/0x124
>         msm_atomic_commit_tail+0x330/0x748
>         commit_tail+0x19c/0x278
>         drm_atomic_helper_commit+0x1dc/0x1f0
>         drm_atomic_commit+0xc0/0xd8
>         drm_atomic_helper_set_config+0xb4/0x134
>         drm_mode_setcrtc+0x688/0x1248
>         drm_ioctl_kernel+0x1e4/0x338
>         drm_ioctl+0x3a4/0x684
>         __arm64_sys_ioctl+0x118/0x154
>         invoke_syscall+0x78/0x224
>         el0_svc_common+0x178/0x200
>         do_el0_svc+0x94/0x13c
>         el0_svc+0x5c/0xec
>         el0t_64_sync_handler+0x78/0x108
>         el0t_64_sync+0x1a4/0x1a8
>
>  -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
>         __mutex_lock_common+0x174/0x1a64
>         ww_mutex_lock+0xb8/0x278
>         modeset_lock+0x304/0x4ac
>         drm_modeset_lock+0x4c/0x7c
>         drmm_mode_config_init+0x4a8/0xc50
>         msm_drm_init+0x274/0xac0
>         msm_drm_bind+0x20/0x2c
>         try_to_bring_up_master+0x3dc/0x470
>         __component_add+0x18c/0x3c0
>         component_add+0x1c/0x28
>         dp_display_probe+0x954/0xa98
>         platform_probe+0x124/0x15c
>         really_probe+0x1b0/0x5f8
>         __driver_probe_device+0x174/0x20c
>         driver_probe_device+0x70/0x134
>         __device_attach_driver+0x130/0x1d0
>         bus_for_each_drv+0xfc/0x14c
>         __device_attach+0x1bc/0x2bc
>         device_initial_probe+0x1c/0x28
>         bus_probe_device+0x94/0x178
>         deferred_probe_work_func+0x1a4/0x1f0
>         process_one_work+0x5d4/0x9dc
>         worker_thread+0x898/0xccc
>         kthread+0x2d4/0x3d4
>         ret_from_fork+0x10/0x20
>
>  -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
>         ww_acquire_init+0x1c4/0x2c8
>         drm_modeset_acquire_init+0x44/0xc8
>         drm_helper_probe_single_connector_modes+0xb0/0x12dc
>         drm_mode_getconnector+0x5dc/0xfe8
>         drm_ioctl_kernel+0x1e4/0x338
>         drm_ioctl+0x3a4/0x684
>         __arm64_sys_ioctl+0x118/0x154
>         invoke_syscall+0x78/0x224
>         el0_svc_common+0x178/0x200
>         do_el0_svc+0x94/0x13c
>         el0_svc+0x5c/0xec
>         el0t_64_sync_handler+0x78/0x108
>         el0t_64_sync+0x1a4/0x1a8
>
>  -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
>         __lock_acquire+0x2650/0x672c
>         lock_acquire+0x1b4/0x4ac
>         __mutex_lock_common+0x174/0x1a64
>         mutex_lock_nested+0x98/0xac
>         dp_panel_add_fail_safe_mode+0x4c/0xa0
>         dp_hpd_plug_handle+0x1f0/0x280
>         dp_bridge_enable+0x94/0x2b8
>         drm_atomic_bridge_chain_enable+0x11c/0x168
>         drm_atomic_helper_commit_modeset_enables+0x500/0x740
>         msm_atomic_commit_tail+0x3e4/0x748
>         commit_tail+0x19c/0x278
>         drm_atomic_helper_commit+0x1dc/0x1f0
>         drm_atomic_commit+0xc0/0xd8
>         drm_atomic_helper_set_config+0xb4/0x134
>         drm_mode_setcrtc+0x688/0x1248
>         drm_ioctl_kernel+0x1e4/0x338
>         drm_ioctl+0x3a4/0x684
>         __arm64_sys_ioctl+0x118/0x154
>         invoke_syscall+0x78/0x224
>         el0_svc_common+0x178/0x200
>         do_el0_svc+0x94/0x13c
>         el0_svc+0x5c/0xec
>         el0t_64_sync_handler+0x78/0x108
>         el0t_64_sync+0x1a4/0x1a8
>
> Changes in v2:
> -- re text commit title
> -- remove all fail safe mode
>
> Changes in v3:
> -- remove dp_panel_add_fail_safe_mode() from dp_panel.h

I don't see this part. I think you lost a bunch of chunks of your
change between v2 and v3. Can you double-check?


> -- add Fixes
>
> Changes in v4:
> --  to=dianders@chromium.org
>
> Fixes: 8b2c181 ("drm/msm/dp: add fail safe mode outside of event_mutex context")

This is the wrong number of digits for Fixes. It should be 8b2c181e3dcf
