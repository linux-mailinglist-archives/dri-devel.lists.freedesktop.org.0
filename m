Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1C50C592
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 02:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C3A10E044;
	Sat, 23 Apr 2022 00:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D59C10E044
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 00:07:55 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t25so16898610lfg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y8t5diYG349ZuV7Fu5rF2fzW6twUu4D6A/dKUO2v1uQ=;
 b=hB4rxYPasm8ifPX5Tvhu5XaZR4ryfUFF4a234UiL3xhop2GGlgAcH++cxHp1r/1hA9
 1Qi+a7X/lPkIStSPVbQ325IS8YVxtsjDg1EsL/a3XdCGNyCgxqNWaFEbqzWVvJ1w/bwl
 KYV65VmRWO4jRAXtJfZYyB/9yf4Ks1fYo8hd0LmTfY+ytQxnbOBa2Xt4NGMAsL/VyIbl
 NpvsiLzP+ceNYh/rXYwPyvPCeKuDH1w4UbRtjd4eWxnlj1miR9a8c7Rl/16NZ6JgJ/f2
 E0b7eLiZ5Y47iC/mmwy6PdahtFf1pXweTSK5n9wsP/d16zCFNBcSJZW0UEpFwx4y+HOq
 Is8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y8t5diYG349ZuV7Fu5rF2fzW6twUu4D6A/dKUO2v1uQ=;
 b=dOLbiZQLPkDFJ+55xkiYflyeYIlzfrV5iT6nVA/mLaeujxJDe0Y9HNC6++KIjQ4z3u
 eZ2IXU9WxzVFXD89Q5LLg1KdJoq5Z/+Kf0djemgeb1AWpUteyMykN7ZPiwzS/obLYYRw
 gPf8Io62seTxX/9fHFzeMwfKQINtq4AbFktsqJbRdwA19rHwd8TRmhpHx0r89OUadd5O
 zrGkLLnLUGLWPO5XfqCa9xVW9FiBvYZ/6uRPGW5GokOF/qi/T286Rt1zKH6wp4Tf1Qe2
 Wqd14HZHzgrI6c9sONFZLA21JMTZqdObb8CdSCGHKitRloq1jdzZQ7nH2anwTxPA7ZGS
 WsKQ==
X-Gm-Message-State: AOAM5322vx/jq7RItc9TEgBASZqSPvrwjS5h+5Mu4JLanjo8y7VSQtt+
 /mIVCjhIb2+xlwztAu6Fqxv0Qw==
X-Google-Smtp-Source: ABdhPJysrBV3gbDdlaHLJUF6Z+RHtatxhPW8rEBCAeMBJSDEHgPSDxi4vJYGqZFziHiZ8gxBg0lS0w==
X-Received: by 2002:ac2:4e03:0:b0:44a:c82:35e7 with SMTP id
 e3-20020ac24e03000000b0044a0c8235e7mr4968341lfr.10.1650672473293; 
 Fri, 22 Apr 2022 17:07:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a196105000000b004718f60c025sm396522lfb.105.2022.04.22.17.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 17:07:52 -0700 (PDT)
Message-ID: <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
Date: Sat, 23 Apr 2022 03:07:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/04/2022 02:45, Kuogee Hsieh wrote:
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
> 
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
> 
> To break this circular locking, this patch have safe mode added at
> dp_connector_get_mode() which is executed under drm thread context.
> Therefore no lock acquired required for &dev->mode_config.mutex while
> adding fail safe mode since it has been hold by drm thread already.
> 
> ======================================================
>   WARNING: possible circular locking dependency detected
>   5.15.35-lockdep #6 Tainted: G        W
>   ------------------------------------------------------
>   frecon/429 is trying to acquire lock:
>   ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
> dp_panel_add_fail_safe_mode+0x4c/0xa0
> 
>   but task is already holding lock:
>   ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at: lock_crtcs+0xb4/0x124
> 
>   which lock already depends on the new lock.
> 
>   the existing dependency chain (in reverse order) is:
> 
>   -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
>          __mutex_lock_common+0x174/0x1a64
>          mutex_lock_nested+0x98/0xac
>          lock_crtcs+0xb4/0x124
>          msm_atomic_commit_tail+0x330/0x748
>          commit_tail+0x19c/0x278
>          drm_atomic_helper_commit+0x1dc/0x1f0
>          drm_atomic_commit+0xc0/0xd8
>          drm_atomic_helper_set_config+0xb4/0x134
>          drm_mode_setcrtc+0x688/0x1248
>          drm_ioctl_kernel+0x1e4/0x338
>          drm_ioctl+0x3a4/0x684
>          __arm64_sys_ioctl+0x118/0x154
>          invoke_syscall+0x78/0x224
>          el0_svc_common+0x178/0x200
>          do_el0_svc+0x94/0x13c
>          el0_svc+0x5c/0xec
>          el0t_64_sync_handler+0x78/0x108
>          el0t_64_sync+0x1a4/0x1a8
> 
>   -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
>          __mutex_lock_common+0x174/0x1a64
>          ww_mutex_lock+0xb8/0x278
>          modeset_lock+0x304/0x4ac
>          drm_modeset_lock+0x4c/0x7c
>          drmm_mode_config_init+0x4a8/0xc50
>          msm_drm_init+0x274/0xac0
>          msm_drm_bind+0x20/0x2c
>          try_to_bring_up_master+0x3dc/0x470
>          __component_add+0x18c/0x3c0
>          component_add+0x1c/0x28
>          dp_display_probe+0x954/0xa98
>          platform_probe+0x124/0x15c
>          really_probe+0x1b0/0x5f8
>          __driver_probe_device+0x174/0x20c
>          driver_probe_device+0x70/0x134
>          __device_attach_driver+0x130/0x1d0
>          bus_for_each_drv+0xfc/0x14c
>          __device_attach+0x1bc/0x2bc
>          device_initial_probe+0x1c/0x28
>          bus_probe_device+0x94/0x178
>          deferred_probe_work_func+0x1a4/0x1f0
>          process_one_work+0x5d4/0x9dc
>          worker_thread+0x898/0xccc
>          kthread+0x2d4/0x3d4
>          ret_from_fork+0x10/0x20
> 
>   -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
>          ww_acquire_init+0x1c4/0x2c8
>          drm_modeset_acquire_init+0x44/0xc8
>          drm_helper_probe_single_connector_modes+0xb0/0x12dc
>          drm_mode_getconnector+0x5dc/0xfe8
>          drm_ioctl_kernel+0x1e4/0x338
>          drm_ioctl+0x3a4/0x684
>          __arm64_sys_ioctl+0x118/0x154
>          invoke_syscall+0x78/0x224
>          el0_svc_common+0x178/0x200
>          do_el0_svc+0x94/0x13c
>          el0_svc+0x5c/0xec
>          el0t_64_sync_handler+0x78/0x108
>          el0t_64_sync+0x1a4/0x1a8
> 
>   -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
>          __lock_acquire+0x2650/0x672c
>          lock_acquire+0x1b4/0x4ac
>          __mutex_lock_common+0x174/0x1a64
>          mutex_lock_nested+0x98/0xac
>          dp_panel_add_fail_safe_mode+0x4c/0xa0
>          dp_hpd_plug_handle+0x1f0/0x280
>          dp_bridge_enable+0x94/0x2b8
>          drm_atomic_bridge_chain_enable+0x11c/0x168
>          drm_atomic_helper_commit_modeset_enables+0x500/0x740
>          msm_atomic_commit_tail+0x3e4/0x748
>          commit_tail+0x19c/0x278
>          drm_atomic_helper_commit+0x1dc/0x1f0
>          drm_atomic_commit+0xc0/0xd8
>          drm_atomic_helper_set_config+0xb4/0x134
>          drm_mode_setcrtc+0x688/0x1248
>          drm_ioctl_kernel+0x1e4/0x338
>          drm_ioctl+0x3a4/0x684
>          __arm64_sys_ioctl+0x118/0x154
>          invoke_syscall+0x78/0x224
>          el0_svc_common+0x178/0x200
>          do_el0_svc+0x94/0x13c
>          el0_svc+0x5c/0xec
>          el0t_64_sync_handler+0x78/0x108
>          el0t_64_sync+0x1a4/0x1a8
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  6 ------
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 23 +++++++++++++----------
>   2 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 92cd50f..01453db 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -555,12 +555,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>   
>   	mutex_unlock(&dp->event_mutex);
>   
> -	/*
> -	 * add fail safe mode outside event_mutex scope
> -	 * to avoid potiential circular lock with drm thread
> -	 */
> -	dp_panel_add_fail_safe_mode(dp->dp_display.connector);
> -
>   	/* uevent will complete connection part */
>   	return 0;
>   };
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 1aa9aa8c..23fee42 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -151,15 +151,6 @@ static int dp_panel_update_modes(struct drm_connector *connector,
>   	return rc;
>   }
>   
> -void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
> -{
> -	/* fail safe edid */
> -	mutex_lock(&connector->dev->mode_config.mutex);
> -	if (drm_add_modes_noedid(connector, 640, 480))
> -		drm_set_preferred_mode(connector, 640, 480);
> -	mutex_unlock(&connector->dev->mode_config.mutex);
> -}
> -
>   int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	struct drm_connector *connector)
>   {
> @@ -216,7 +207,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   			goto end;
>   		}
>   
> -		dp_panel_add_fail_safe_mode(connector);
> +		/* fail safe edid */
> +		mutex_lock(&connector->dev->mode_config.mutex);
> +		if (drm_add_modes_noedid(connector, 640, 480))
> +			drm_set_preferred_mode(connector, 640, 480);
> +		mutex_unlock(&connector->dev->mode_config.mutex);
>   	}
>   
>   	if (panel->aux_cfg_update_done) {
> @@ -266,6 +261,14 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * add fail safe mode (640x480) here
> +	 * since we are executed in drm_thread context,
> +	 * no mode_config.mutex acquired required
> +	 */
> +	if (drm_add_modes_noedid(connector, 640, 480))
> +		drm_set_preferred_mode(connector, 640, 480);
> +
>   	if (dp_panel->edid)
>   		return dp_panel_update_modes(connector, dp_panel->edid);
>   
Also, wouldn't calling get_modes() several times make cause adding more 
and more 640x480 modes to the modes list?


-- 
With best wishes
Dmitry
