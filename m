Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744B446815
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 18:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61376EC22;
	Fri,  5 Nov 2021 17:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9D6EC24
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 17:47:00 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id g125so15662688oif.9
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yb57YzM6ALozNlIonxoB83ag0FViBRMkRYqu9vXV6Rw=;
 b=UczmCwJVlqaSeOIwCNaz3agl9JiA+4Ljg9RpDJ4ca/N4mqoAMzIoW1lkwRnu1bBHcE
 XWJkwD2x2+AKaJ+fImGoNtTaVIfVYf2F5qMi5BnGAfjGvscUx8CLvYXVWjFOUqlS0MNb
 QMwxP2DeU03TFrC3rAYeNC9i+NCL6WURk++j7kgK8Yl03VDtgs9hwK8KKrKoC0GamNPW
 2sz+Z03sxXMdPNKvu5Zlp2JH3XTmDJsZL4O6QgRw02WGEPgHOaWW+Jk7vLyVxcpFv5B8
 LgpzJuKqcCH+pN+Q0Tq43yse7HUGQVWaWT1SgqjFYE3j21EL5DRUutGc/mFEhUCNnYf/
 42gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yb57YzM6ALozNlIonxoB83ag0FViBRMkRYqu9vXV6Rw=;
 b=UZESoiKpAPzbs0CwmuwrTZMhqFBVepju77VJ77k2uXgKFIU+obMOHfZ2kJjY1L8eMR
 8qIG58/HYdgskwG6H9w4cbqhK7Df0LhovARvACW6z0qjyVimKAPnI+a5ox7YIJZzGQW+
 jrQnKHsAtDW4JK75kLVdGB2PHb6C8RCJNxZ9qzqg4hkGAmNwXswOGZo1vWvuv/ZqPnNN
 b83k/doiLfjNNufGVNpG3Y2gYfcSIvNpphGxm9Z6tm7zGQWme/60qnOwNcQDFJcLHP4z
 TcK+BANq7sRwYPE+UbgNwctzFMAm7iLvmF3Zyv4nnbLTADcNS3uyEt8E6hGLufZ9nnKQ
 0IIA==
X-Gm-Message-State: AOAM531HeUHyheGsZc4bmvy+y3/aoMlsUD+7x/L2cjks6afsB+yVZLUl
 woOVXwRbf29An3OEEf3nRhlE7Q==
X-Google-Smtp-Source: ABdhPJy7cJMU8ToxXUd7NPMoqActhGfMPpzQFIbE25jmptKBuOc+vJfJXceL4C8wOtVRxP3gYmO5oA==
X-Received: by 2002:a05:6808:301f:: with SMTP id
 ay31mr22843889oib.98.1636134419793; 
 Fri, 05 Nov 2021 10:46:59 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p190sm2608897ooa.1.2021.11.05.10.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:46:59 -0700 (PDT)
Date: Fri, 5 Nov 2021 10:48:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: do not initialize phy until plugin interrupt
 received
Message-ID: <YYVudQzp8Kxweewq@ripper>
References: <1636133291-10551-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636133291-10551-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 05 Nov 10:28 PDT 2021, Kuogee Hsieh wrote:

> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Combo phy supports both USB and DP simultaneously. There may has a
> possible conflict during phy initialization phase between USB and
> DP driver which may cause USB phy timeout when USB tries to power
> up its phy. This patch has the DP driver not initialize its phy
> during DP driver initialization phase. Instead DP driver only enable
> required regulators and clocks so that it is able to receive HPD
> interrupts after completion of initialization phase. DP driver will
> initialize its phy when HPD plug-in interrupt received.

Is this a hardware requirement, or is this a issue with the current
implementation of the QMP combo phy driver? We should not hack up the DP
driver to circumvent the latter.

Also, I don't suppose there's anything here that prevents the HPD to
come before the USB PHY is powered up? Even though that seems less
likely in practice...

> This patch also provides a positive side effects which balance regulator
> enable count since regulator only enabled at initialize phase and resume
> and disabled at followed suspend.
> 

Is this something that needs to be fixed separately, so that it can be
backported to stable kernels?

Regards,
Bjorn

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 97 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++-------
>  3 files changed, 119 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 7ec155d..e0e5dc9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1364,7 +1364,41 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>  	return ret;
>  }
>  
> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	if (!dp_ctrl) {
> +		DRM_ERROR("Invalid input data\n");
> +		return;
> +	}
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	ctrl->dp_ctrl.orientation = flip;
> +
> +	dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> +}
> +
> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	if (!dp_ctrl) {
> +		DRM_ERROR("Invalid input data\n");
> +		return;
> +	}
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +}
> +
> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
>  	struct dp_io *dp_io;
> @@ -1372,34 +1406,24 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>  
>  	if (!dp_ctrl) {
>  		DRM_ERROR("Invalid input data\n");
> -		return -EINVAL;
> +		return;
>  	}
>  
>  	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>  	dp_io = &ctrl->parser->io;
>  	phy = dp_io->phy;
>  
> -	ctrl->dp_ctrl.orientation = flip;
> -
> -	if (reset)
> -		dp_catalog_ctrl_reset(ctrl->catalog);
> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>  
> -	DRM_DEBUG_DP("flip=%d\n", flip);
>  	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>  	phy_init(phy);
> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
>  
> -	return 0;
> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>  }
>  
> -/**
> - * dp_ctrl_host_deinit() - Uninitialize DP controller
> - * @dp_ctrl: Display Port Driver data
> - *
> - * Perform required steps to uninitialize DP controller
> - * and its resources.
> - */
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
>  	struct dp_io *dp_io;
> @@ -1414,10 +1438,14 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>  	dp_io = &ctrl->parser->io;
>  	phy = dp_io->phy;
>  
> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
> +	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>  	phy_exit(phy);
>  
> -	DRM_DEBUG_DP("Host deinitialized successfully\n");
> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>  }
>  
>  static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
> @@ -1895,8 +1923,14 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>  		return ret;
>  	}
>  
> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	phy_power_off(phy);
>  
> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	/* aux channel down, reinit phy */
>  	phy_exit(phy);
>  	phy_init(phy);
> @@ -1905,23 +1939,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>  	return ret;
>  }
>  
> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
> -{
> -	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
> -	struct phy *phy;
> -
> -	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> -
> -	dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -	phy_exit(phy);
> -
> -	DRM_DEBUG_DP("DP off phy done\n");
> -}
> -
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
> @@ -1949,10 +1966,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>  		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>  	}
>  
> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	phy_power_off(phy);
> -	phy_exit(phy);
>  
> -	DRM_DEBUG_DP("DP off done\n");
> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2363a2d..c1e4b1b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -19,12 +19,9 @@ struct dp_ctrl {
>  	u32 pixel_rate;
>  };
>  
> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
> @@ -34,4 +31,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>  			struct dp_power *power, struct dp_catalog *catalog,
>  			struct dp_parser *parser);
>  
> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip);
> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e41dd40..17d2d5c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -84,6 +84,7 @@ struct dp_display_private {
>  
>  	/* state variables */
>  	bool core_initialized;
> +	bool phy_initialized;
>  	bool hpd_irq_on;
>  	bool audio_supported;
>  
> @@ -387,7 +388,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>  	return rc;
>  }
>  
> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
> +static void dp_display_host_init(struct dp_display_private *dp)
>  {
>  	bool flip = false;
>  
> @@ -400,12 +401,37 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>  	if (dp->usbpd->orientation == ORIENTATION_CC2)
>  		flip = true;
>  
> -	dp_power_init(dp->power, flip);
> -	dp_ctrl_host_init(dp->ctrl, flip, reset);
> +	dp_power_init(dp->power, false);
> +	dp_ctrl_irq_enable(dp->ctrl, flip);
> +
> +	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
> +		dp_ctrl_phy_init(dp->ctrl);
> +
>  	dp_aux_init(dp->aux);
>  	dp->core_initialized = true;
>  }
>  
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
> +{
> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +			dp->core_initialized, dp->phy_initialized);
> +	if (dp->phy_initialized == false) {
> +		dp_ctrl_phy_init(dp->ctrl);
> +		dp->phy_initialized = true;
> +	}
> +}
> +
> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> +{
> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +			dp->core_initialized, dp->phy_initialized);
> +
> +	if (dp->phy_initialized == true) {
> +		dp_ctrl_phy_exit(dp->ctrl);
> +		dp->phy_initialized = false;
> +	}
> +}
> +
>  static void dp_display_host_deinit(struct dp_display_private *dp)
>  {
>  	if (!dp->core_initialized) {
> @@ -413,7 +439,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>  		return;
>  	}
>  
> -	dp_ctrl_host_deinit(dp->ctrl);
> +	dp_ctrl_irq_disable(dp->ctrl);
>  	dp_aux_deinit(dp->aux);
>  	dp_power_deinit(dp->power);
>  
> @@ -424,7 +450,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>  {
>  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>  
> -	dp_display_host_init(dp, true);
> +	dp_display_host_phy_init(dp);
>  
>  	return dp_display_process_hpd_high(dp);
>  }
> @@ -551,7 +577,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>  		dp->hpd_state = ST_DISCONNECTED;
>  
>  		if (ret == -ECONNRESET) { /* cable unplugged */
> -			dp->core_initialized = false;
> +			dp->phy_initialized = false;
>  		}
>  
>  	} else {
> @@ -623,9 +649,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  	if (state == ST_DISCONNECTED) {
>  		/* triggered by irq_hdp with sink_count = 0 */
>  		if (dp->link->sink_count == 0) {
> -			dp_ctrl_off_phy(dp->ctrl);
> +			dp_display_host_phy_exit(dp);
>  			hpd->hpd_high = 0;
> -			dp->core_initialized = false;
>  		}
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
> @@ -716,7 +741,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>  
>  	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>  	if (ret == -ECONNRESET) { /* cable unplugged */
> -		dp->core_initialized = false;
> +		dp->phy_initialized = false;
>  	}
>  	DRM_DEBUG_DP("hpd_state=%d\n", state);
>  
> @@ -918,12 +943,19 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>  
>  	dp_display->audio_enabled = false;
>  
> -	/* triggered by irq_hpd with sink_count = 0 */
>  	if (dp->link->sink_count == 0) {
> +		/*
> +		 * irq_hpd with sink_count = 0
> +		 * hdmi unplugged out of dongle
> +		 */
>  		dp_ctrl_off_link_stream(dp->ctrl);
>  	} else {
> +		/*
> +		 * unplugged interrupt
> +		 * dongle unplugged out of DUT
> +		 */
>  		dp_ctrl_off(dp->ctrl);
> -		dp->core_initialized = false;
> +		dp_display_host_phy_exit(dp);
>  	}
>  
>  	dp_power_panel_on(dp->power, false);
> @@ -1059,7 +1091,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  static void dp_display_config_hpd(struct dp_display_private *dp)
>  {
>  
> -	dp_display_host_init(dp, true);
> +	dp_display_host_init(dp);
>  	dp_catalog_ctrl_hpd_config(dp->catalog);
>  
>  	/* Enable interrupt first time
> @@ -1338,7 +1370,7 @@ static int dp_pm_resume(struct device *dev)
>  	dp->hpd_state = ST_DISCONNECTED;
>  
>  	/* turn on dp ctrl/phy */
> -	dp_display_host_init(dp, true);
> +	dp_display_host_init(dp);
>  
>  	dp_catalog_ctrl_hpd_config(dp->catalog);
>  
> @@ -1346,12 +1378,15 @@ static int dp_pm_resume(struct device *dev)
>  	 * set sink to normal operation mode -- D0
>  	 * before dpcd read
>  	 */
> -	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> -
>  	if (dp_catalog_link_is_connected(dp->catalog)) {
> +		dp_display_host_phy_init(dp);
> +
> +		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  		sink_count = drm_dp_read_sink_count(dp->aux);
>  		if (sink_count < 0)
>  			sink_count = 0;
> +
> +		dp_display_host_phy_exit(dp);
>  	}
>  
>  	dp->link->sink_count = sink_count;
> @@ -1399,6 +1434,8 @@ static int dp_pm_suspend(struct device *dev)
>  		dp_display_host_deinit(dp);
>  	}
>  
> +	dp_display_host_phy_exit(dp);
> +
>  	dp->hpd_state = ST_SUSPENDED;
>  
>  	/* host_init will be called at pm_resume */
> @@ -1473,7 +1510,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>  		enable_irq(dp->irq);
>  		dp_hpd_connect(dp->usbpd, true);
>  	} else {
> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, dp->id * 10);
> +		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>  	}
>  }
>  
> @@ -1567,7 +1604,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>  	state =  dp_display->hpd_state;
>  
>  	if (state == ST_DISPLAY_OFF)
> -		dp_display_host_init(dp_display, true);
> +		dp_display_host_phy_init(dp_display);
>  
>  	dp_display_enable(dp_display, 0);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
