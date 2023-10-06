Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02F7BC196
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 23:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8B10E574;
	Fri,  6 Oct 2023 21:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8619910E575
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 21:49:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50305abe5f0so3410439e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 14:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696628980; x=1697233780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vAdY1fRl3DInOj3arSz3of7krdMLZP31tdXdXtBXNTI=;
 b=uETjthK+lRKyL3uzeFyiYZ/m0GvrjTbJTWgkMySfd8y5wl60G7yDKnmGrtL4ew9Y/m
 y5BoVQlXapBP3puxi9PNIRNNEDFkmgxuF0U651+ImEJYNvsZSUaXVqhcLYqJR7YELdzF
 +lNPMQ+cCji5B6uS1WzzDY6anWj2wLpHhcX0LXoxu0aYUtKGP4mZZ0ZcUJ/OK/ik/qqu
 3xRxX80I0ysYLZD4GV+Iqcyd4w1H7et/esIpS38++RclVMDp2F4PMu3DTHDD7jZroMGs
 LOwI3Tv0IqgM4opZ2OStwTPvRuP/QMsbFSRnmCNxuwsLyUtx6EXT+yZc3z99H4NCwKUb
 oOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696628980; x=1697233780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vAdY1fRl3DInOj3arSz3of7krdMLZP31tdXdXtBXNTI=;
 b=jlFT7K0K+axnc/Pdw2veeP0lwiZ0Jfr7BF3JHeXYD4SteiHkEbPaKk5k6j2JhqB/fy
 GT0gznfVs50VARFZmTgTvIfqq1zmc4Z+kJnHP2v4m4Dk7/dg697i1AmInSX8JzqRECfG
 Evf6NqlK67LVKad9qLZa9hOpIDRN1qmCl332ifyRYZV4S2t+nspUX/jODzLIdzMwyQB+
 Bc7jKuXAG9Nyky+Ys1f3ngeHMFdP1Wvlk6+TXESn4AL5JiEtgBREqGPPyCp+BCEGf+x8
 bqAeYs6Zr/XmMN9I8gdEpejm/EfUIrdJOl+kkaJNe81NlL7QbiYPj5GX+4bG2pP0Q8XY
 /hsA==
X-Gm-Message-State: AOJu0Yw0aNH2Mc6cF7CevY4HKZmNiKKcqGCMK6S3FVClE+78+pcQNhWR
 w4jcNrPvheKoSC1UhcQ2kR003w==
X-Google-Smtp-Source: AGHT+IHSDksQs1icLJ4o9OSs1log1rpmAp9u8D0885ln/8F2Qn4RSmfENiTszCYRcV/vvccnhRHi9g==
X-Received: by 2002:a2e:3c12:0:b0:2b6:bb21:8d74 with SMTP id
 j18-20020a2e3c12000000b002b6bb218d74mr8429749lja.1.1696628980515; 
 Fri, 06 Oct 2023 14:49:40 -0700 (PDT)
Received: from [192.168.1.34] ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a05651c105c00b002c120b99f8csm934333ljm.134.2023.10.06.14.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 14:49:40 -0700 (PDT)
Message-ID: <69a74260-556c-4e34-8381-82677c335b97@linaro.org>
Date: Sat, 7 Oct 2023 00:49:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696628318-15095-1-git-send-email-quic_khsieh@quicinc.com>
 <1696628318-15095-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696628318-15095-6-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 00:38, Kuogee Hsieh wrote:
> Currently DP driver is executed independent of PM runtime framework.
> This leads msm eDP panel can not being detected by edp_panel driver during
> generic_edp_panel_probe() due to AUX DPCD read failed at edp panel driver.
> Incorporate PM runtime framework into DP driver so that host controller's
> power and clocks are enable/disable through PM runtime mechanism.
> Once PM runtime framework is incorporated into DP driver, waking up device
> from power up path is not necessary. Hence remove it.
> 
> After incorporating pm_runtime framework into eDP/DP driver, dp_pm_suspend()
> to handle power off both DP phy and controller during suspend and
> dp_pm_resume() to handle power on both DP phy and controller during resume
> are not necessary. Therefore both dp_pm_suspend() and dp_pm_resume() are
> dropped and replace with dp_pm_runtime_suspend() and dp_pm_runtime_resume()
> respectively.
> 
> Please noted that there are different implementations between external DP
> and eDP. For external DP, DP controller and HPD block are initialized with
> HPD irq enabled after dp_pm_runtime_resume() and then start waiting for HPD
> plugin interrupt. Once HDP plugin interrupt received, dp_hpd_plugin_handle()
> will initialize PHY immediately followed by link training.
> For eDP, eDP controller, HPD block and PHY are initialized with HPD irq
> disabled after dp_pm_runtime_resume() since HPD interrupt is not required.

Ugh. Your original comment in the email was easier to parse. Can we just 
have it instead? And I thought that it would be a better fit for the 
source code comment rather than for the commit message.

> 
> Changes in v6:
> -- delete dp_power_client_deinit(dp->power);
> -- remove if (!dp->dp_display.is_edp) condition checkout at dp_hpd_plug_handle()
> -- remove if (!dp->dp_display.is_edp) condition checkout at dp_hpd_unplug_handle()
> -- add IRQF_NO_AUTOEN to devm_request_irq()
> -- add enable_irq() and disable_irq() to pm_runtime_resume() and pm_runtime_suspend()
> -- del dp->hpd_state = ST_DISCONNECTED from dp_bridge_hpd_disable()
> 
> Changes in v5:
> -- remove pm_runtime_put_autosuspend feature, use pm_runtime_put_sync() directly
> -- squash add pm_runtime_force_suspend()/resume() patch into this patch
> 
> Changes in v4:
> -- reworded commit text to explain why pm_framework is required for edp panel
> -- reworded commit text to explain autosuspend is choiced
> -- delete EV_POWER_PM_GET and PM_EV_POWER_PUT from changes #3
> -- delete dp_display_pm_get() and dp_display_pm_Put() from changes #3
> -- return value from pm_runtime_resume_and_get() directly
> -- check return value of devm_pm_runtime_enable()
> -- delete pm_runtime_xxx from dp_display_remove()
> -- drop dp_display_host_init() from EV_HPD_INIT_SETUP
> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
> -- delete ST_SUSPENDED state
> -- rewording commit text to add more details regrading the purpose
>     of this change
> 
> Changes in v3:
> -- incorporate removing pm_runtime_xx() from dp_pwer.c to this patch
> -- use pm_runtime_resume_and_get() instead of pm_runtime_get()
> -- error checking pm_runtime_resume_and_get() return value
> -- add EV_POWER_PM_GET and PM_EV_POWER_PUT to handle HPD_GPIO case
> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
> -- replace dp_pm_resume() with pm_runtime_force_resume()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c     |   5 ++
>   drivers/gpu/drm/msm/dp/dp_display.c | 167 ++++++++++++------------------------
>   drivers/gpu/drm/msm/dp/dp_power.c   |  16 ----
>   drivers/gpu/drm/msm/dp/dp_power.h   |  11 ---
>   4 files changed, 60 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 8e3b677..10b6eeb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -291,6 +291,10 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   		return -EINVAL;
>   	}
>   
> +	ret = pm_runtime_resume_and_get(dp_aux->dev);
> +	if (ret)
> +		return  ret;
> +
>   	mutex_lock(&aux->mutex);
>   	if (!aux->initted) {
>   		ret = -EIO;
> @@ -364,6 +368,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   
>   exit:
>   	mutex_unlock(&aux->mutex);
> +	pm_runtime_put_sync(dp_aux->dev);
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 89fad67..384a86c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -49,7 +49,6 @@ enum {
>   	ST_CONNECTED,
>   	ST_DISCONNECT_PENDING,
>   	ST_DISPLAY_OFF,
> -	ST_SUSPENDED,
>   };
>   
>   enum {
> @@ -310,10 +309,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>   	struct msm_drm_private *priv = dev_get_drvdata(master);
>   
> -	/* disable all HPD interrupts */
> -	if (dp->core_initialized)
> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> -
>   	kthread_stop(dp->ev_tsk);
>   
>   	of_dp_aux_depopulate_bus(dp->aux);
> @@ -558,7 +553,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
> -	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> +	if (state == ST_DISPLAY_OFF) {
>   		mutex_unlock(&dp->event_mutex);
>   		return 0;
>   	}
> @@ -575,6 +570,12 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>   		return 0;
>   	}
>   
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		return ret;
> +	}
> +
>   	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
>   	if (ret) {	/* link train failed */
>   		dp->hpd_state = ST_DISCONNECTED;
> @@ -657,6 +658,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   			dp->dp_display.connector_type, state);
>   
>   	/* uevent will complete disconnection part */
> +	pm_runtime_put_sync(&dp->pdev->dev);
>   	mutex_unlock(&dp->event_mutex);
>   	return 0;
>   }
> @@ -672,7 +674,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
> -	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> +	if (state == ST_DISPLAY_OFF) {
>   		mutex_unlock(&dp->event_mutex);
>   		return 0;
>   	}
> @@ -1085,7 +1087,6 @@ static int hpd_event_thread(void *data)
>   
>   		switch (todo->event_id) {
>   		case EV_HPD_INIT_SETUP:
> -			dp_display_host_init(dp_priv);
>   			break;
>   		case EV_HPD_PLUG_INT:
>   			dp_hpd_plug_handle(dp_priv, todo->data);
> @@ -1177,7 +1178,9 @@ static int dp_display_request_irq(struct dp_display_private *dp)
>   	}
>   
>   	rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
> -			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
> +			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
> +			      "dp_display_isr", dp);
> +
>   	if (rc < 0) {
>   		DRM_ERROR("failed to request IRQ%u: %d\n",
>   				dp->irq, rc);
> @@ -1263,6 +1266,10 @@ static int dp_display_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, &dp->dp_display);
>   
> +	rc = devm_pm_runtime_enable(&pdev->dev);
> +	if (rc)
> +		goto err;
> +
>   	rc = dp_display_request_irq(dp);
>   	if (rc)
>   		goto err;
> @@ -1285,7 +1292,6 @@ static int dp_display_remove(struct platform_device *pdev)
>   	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
>   
>   	component_del(&pdev->dev, &dp_display_comp_ops);
> -	dp_power_client_deinit(dp->power);
>   	dp_display_deinit_sub_modules(dp);
>   
>   	platform_set_drvdata(pdev, NULL);
> @@ -1293,109 +1299,39 @@ static int dp_display_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int dp_pm_resume(struct device *dev)
> +static int dp_pm_runtime_suspend(struct device *dev)
>   {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_dp *dp_display = platform_get_drvdata(pdev);
> -	struct dp_display_private *dp;
> -	int sink_count = 0;
> -
> -	dp = container_of(dp_display, struct dp_display_private, dp_display);
> -
> -	mutex_lock(&dp->event_mutex);
> -
> -	drm_dbg_dp(dp->drm_dev,
> -		"Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> -		dp->dp_display.connector_type, dp->core_initialized,
> -		dp->phy_initialized, dp_display->power_on);
> -
> -	/* start from disconnected state */
> -	dp->hpd_state = ST_DISCONNECTED;
> -
> -	/* turn on dp ctrl/phy */
> -	dp_display_host_init(dp);
> -
> -	if (dp_display->is_edp)
> -		dp_catalog_ctrl_hpd_enable(dp->catalog);
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>   
> -	if (dp_catalog_link_is_connected(dp->catalog)) {
> -		/*
> -		 * set sink to normal operation mode -- D0
> -		 * before dpcd read
> -		 */
> -		dp_display_host_phy_init(dp);
> -		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> -		sink_count = drm_dp_read_sink_count(dp->aux);
> -		if (sink_count < 0)
> -			sink_count = 0;
> +	disable_irq(dp->irq);
>   
> +	if (dp->dp_display.is_edp) {
>   		dp_display_host_phy_exit(dp);
> +		dp_catalog_ctrl_hpd_disable(dp->catalog);
>   	}
> -
> -	dp->link->sink_count = sink_count;
> -	/*
> -	 * can not declared display is connected unless
> -	 * HDMI cable is plugged in and sink_count of
> -	 * dongle become 1
> -	 * also only signal audio when disconnected
> -	 */
> -	if (dp->link->sink_count) {
> -		dp->dp_display.link_ready = true;
> -	} else {
> -		dp->dp_display.link_ready = false;
> -		dp_display_handle_plugged_change(dp_display, false);
> -	}
> -
> -	drm_dbg_dp(dp->drm_dev,
> -		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
> -		dp->dp_display.connector_type, dp->link->sink_count,
> -		dp->dp_display.link_ready, dp->core_initialized,
> -		dp->phy_initialized, dp_display->power_on);
> -
> -	mutex_unlock(&dp->event_mutex);
> +	dp_display_host_deinit(dp);
>   
>   	return 0;
>   }
>   
> -static int dp_pm_suspend(struct device *dev)
> +static int dp_pm_runtime_resume(struct device *dev)
>   {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_dp *dp_display = platform_get_drvdata(pdev);
> -	struct dp_display_private *dp;
> -
> -	dp = container_of(dp_display, struct dp_display_private, dp_display);
> -
> -	mutex_lock(&dp->event_mutex);
> -
> -	drm_dbg_dp(dp->drm_dev,
> -		"Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
> -		dp->dp_display.connector_type, dp->core_initialized,
> -		dp->phy_initialized, dp_display->power_on);
> -
> -	/* mainlink enabled */
> -	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
> -		dp_ctrl_off_link_stream(dp->ctrl);
> -
> -	dp_display_host_phy_exit(dp);
> -
> -	/* host_init will be called at pm_resume */
> -	dp_display_host_deinit(dp);
> -
> -	dp->hpd_state = ST_SUSPENDED;
> -
> -	drm_dbg_dp(dp->drm_dev,
> -		"After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> -		dp->dp_display.connector_type, dp->core_initialized,
> -		dp->phy_initialized, dp_display->power_on);
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>   
> -	mutex_unlock(&dp->event_mutex);
> +	dp_display_host_init(dp);
> +	if (dp->dp_display.is_edp) {
> +		dp_catalog_ctrl_hpd_enable(dp->catalog);
> +		dp_display_host_phy_init(dp);
> +	}
>   
> +	enable_irq(dp->irq);
>   	return 0;
>   }
>   
>   static const struct dev_pm_ops dp_pm_ops = {
> -	.suspend = dp_pm_suspend,
> -	.resume =  dp_pm_resume,
> +	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                                pm_runtime_force_resume)
>   };
>   
>   static struct platform_driver dp_display_driver = {
> @@ -1478,10 +1414,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>   
>   	if (aux_bus && dp->is_edp) {
> -		dp_display_host_init(dp_priv);
> -		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
> -		dp_display_host_phy_init(dp_priv);
> -
>   		/*
>   		 * The code below assumes that the panel will finish probing
>   		 * by the time devm_of_dp_aux_populate_ep_devices() returns.
> @@ -1583,6 +1515,11 @@ void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		dp_hpd_plug_handle(dp_display, 0);
>   
>   	mutex_lock(&dp_display->event_mutex);
> +	if (pm_runtime_resume_and_get(&dp_display->pdev->dev)) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		mutex_unlock(&dp_display->event_mutex);
> +		return;
> +	}
>   
>   	state = dp_display->hpd_state;
>   	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> @@ -1647,10 +1584,9 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>   	mutex_lock(&dp_display->event_mutex);
>   
>   	state = dp_display->hpd_state;
> -	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
> -		mutex_unlock(&dp_display->event_mutex);
> -		return;
> -	}
> +	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED)
> +		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
> +			   dp->connector_type, state);
>   
>   	dp_display_disable(dp_display);
>   
> @@ -1663,6 +1599,8 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>   	}
>   
>   	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
> +
> +	pm_runtime_put_sync(&dp_display->pdev->dev);
>   	mutex_unlock(&dp_display->event_mutex);
>   }
>   
> @@ -1702,6 +1640,12 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>   	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
>   	mutex_lock(&dp->event_mutex);
> +	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> +		DRM_ERROR("failed to start power\n");
> +		mutex_unlock(&dp->event_mutex);
> +		return;
> +	}
> +
>   	dp_catalog_ctrl_hpd_enable(dp->catalog);
>   
>   	/* enable HDP interrupts */
> @@ -1723,6 +1667,8 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>   	dp_catalog_ctrl_hpd_disable(dp->catalog);
>   
>   	dp_display->internal_hpd = false;
> +
> +	pm_runtime_put_sync(&dp->pdev->dev);
>   	mutex_unlock(&dp->event_mutex);
>   }
>   
> @@ -1737,13 +1683,10 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>   	if (dp_display->internal_hpd)
>   		return;
>   
> -	if (!dp->core_initialized) {
> -		drm_dbg_dp(dp->drm_dev, "not initialized\n");
> -		return;
> -	}
> -
> -	if (!dp_display->link_ready && status == connector_status_connected)
> +	if (!dp_display->link_ready && status == connector_status_connected) {
> +		dp->hpd_state = ST_DISCONNECTED;

Why? What has changed in this patch so that we have to set the 
hpd_state? Also shouldn't this be handled in the event handler instead?

>   		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> -	else if (dp_display->link_ready && status == connector_status_disconnected)
> +	} else if (dp_display->link_ready && status == connector_status_disconnected) {
>   		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +	}
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 5cb84ca..863c766 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -152,20 +152,9 @@ int dp_power_client_init(struct dp_power *dp_power)
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
> -	pm_runtime_enable(power->dev);
> -
>   	return dp_power_clk_init(power);
>   }
>   
> -void dp_power_client_deinit(struct dp_power *dp_power)
> -{
> -	struct dp_power_private *power;
> -
> -	power = container_of(dp_power, struct dp_power_private, dp_power);
> -
> -	pm_runtime_disable(power->dev);
> -}
> -
>   int dp_power_init(struct dp_power *dp_power)
>   {
>   	int rc = 0;
> @@ -173,11 +162,7 @@ int dp_power_init(struct dp_power *dp_power)
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
> -	pm_runtime_get_sync(power->dev);
> -
>   	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> -	if (rc)
> -		pm_runtime_put_sync(power->dev);
>   
>   	return rc;
>   }
> @@ -189,7 +174,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
>   	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> -	pm_runtime_put_sync(power->dev);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> index a3dec20..55ada51 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> @@ -81,17 +81,6 @@ int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
>   int dp_power_client_init(struct dp_power *power);
>   
>   /**
> - * dp_power_clinet_deinit() - de-initialize clock and regulator modules
> - *
> - * @power: instance of power module
> - * return: 0 for success, error for failure.
> - *
> - * This API will de-initialize the DisplayPort's clocks and regulator
> - * modules.
> - */
> -void dp_power_client_deinit(struct dp_power *power);
> -
> -/**
>    * dp_power_get() - configure and get the DisplayPort power module data
>    *
>    * @parser: instance of parser module

-- 
With best wishes
Dmitry

