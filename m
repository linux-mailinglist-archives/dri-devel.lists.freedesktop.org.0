Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96AE429B9D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 04:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7097C89F2A;
	Tue, 12 Oct 2021 02:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135D489F19
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 02:47:01 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so24085793otv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 19:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9joI6JDHuBK1+NM6CtSLlOqed391Z9ZIOMHBaaKusFA=;
 b=OCzzTPlji4T3XPnBk31wN+o/mhzpRvgRRljxJ+OfPvwPKg1dMEqZ7S8qJtCd+wwXRh
 lWJn4/z7IZRBlt6x6STdoEIP6+w/iIDzBPy5tsPbzk7M7uyjrF/pJr9Hj+xIZ2U/28zx
 iUb6cKJRQ/z4sB8FfeAa0bzZ+NpSzm+39SJgUIFsesG04rx3sjPxKDqxG2NkAcajUd/I
 pDkyAF5HD93HYHxGRbrgAdLncA2+0q0rFWXxSyVpBCPfTrUvQypOiemLsetKp198XGRc
 AE3BMVkZsB9NaHHhKmXHtliEYBpB6C+/8sPDgrhW7eb5HqL1oeC/Ns0FpLaXcZuqA80E
 r13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9joI6JDHuBK1+NM6CtSLlOqed391Z9ZIOMHBaaKusFA=;
 b=KfM6dQWPKC+nLZQYbUllupON4yxzdxwEmW1dCdBhQLSNHGTDNIQQ2fcryYL3rfoWWY
 W6NbuTtgoMvBnNEB0Xzhe0xIVdJQ/1XAZAo137OFtxljwZ7HoFpD2iTtfvgA7w9Qb4+L
 kR0+Ue2tsvDGJEoW7sZtd/U2VcSFDEQ0LbvJjDS/pvhWeOr7PTPBhW22NzA9zS9D3Y58
 /3iJNu9cXP+Ydh1VDQWV4Ga3jb6Su5RAG52gzdy1U7aK5Z5EVUFN5/TqpePPd8si+rNH
 Epaz36VL+w7VrHdOHneUpmtsS4tOv59R0OxUmAZ+ZBNL5RvPM/TRkzjdenT3iTJoATJ+
 f0gw==
X-Gm-Message-State: AOAM532O8xAd4GkdKdBjM2EP5NgY0zKWvpoMn4KzDtbwVDaqRXomJkLh
 7sKk/Qth1Z91PJSyTTikTf+qAw==
X-Google-Smtp-Source: ABdhPJzLvdDZiiG0IG1e/jpOdujT5p70twKJpudN9+1bKkCidEQuilkMLuzxpYixDt+uCOQoR5ObjA==
X-Received: by 2002:a05:6830:2372:: with SMTP id
 r18mr17270123oth.179.1634006820178; 
 Mon, 11 Oct 2021 19:47:00 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
 by smtp.gmail.com with ESMTPSA id n17sm2058459oic.21.2021.10.11.19.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 19:46:59 -0700 (PDT)
Date: Mon, 11 Oct 2021 21:46:57 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, dmitry.baryshkov@linaro.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: do not initialize combo phy until plugin
 interrupt
Message-ID: <YWT3IQz38zyebljD@yoga>
References: <1633535966-21005-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633535966-21005-1-git-send-email-khsieh@codeaurora.org>
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

On Wed 06 Oct 10:59 CDT 2021, Kuogee Hsieh wrote:

> Combo phy support both USB3 and DP simultaneously. USB3 is the
> master of combo phy so that USB3 should initialize and power on
> its phy before DP initialize its phy. At current implementation,
> DP driver initialize its phy happen earlier than  USB3 initialize
> its phy which cause timeout error at procedure of power up USB3 phy
> which prevent USB3 from working.

To me this is a problem with the QMP phy driver and shouldn't be hacked
around in the DP driver.

In particular if we're taking this route, this should clearly state what
the actual problem in the QMP phy is and why it's impossible to solve
this without hacking around in the DP driver.

> To avoid confliction of phy
> initialization between USB3 and DP, this patch have DP driver postpone
> phy initialization until plugin interrupt handler. DP driver only enable
> regulator, configure its HPD controller and enable interrupt so that it
> is able to receive HPD interrupts after completion of the initialization
> phase. DP driver will initialize and power up phy at plugin interrupt
> handler during normal operation so that both USB3 and DP are work
> simultaneously.
> 

What happens if I get a HPD before the USB driver probes?

Regards,
Bjorn

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 68 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 +++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 51 +++++++++++++++++++++-------
>  3 files changed, 84 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 5551a8d..4c5d507 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1378,7 +1378,25 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
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
> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
>  	struct dp_io *dp_io;
> @@ -1386,33 +1404,44 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
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
> -
>  	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>  	phy_init(phy);
> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> +}
>  
> -	return 0;
> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +	struct dp_io *dp_io;
> +	struct phy *phy;
> +
> +	if (!dp_ctrl) {
> +		DRM_ERROR("Invalid input data\n");
> +		return;
> +	}
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +	dp_io = &ctrl->parser->io;
> +	phy = dp_io->phy;
> +
> +	dp_catalog_ctrl_phy_reset(ctrl->catalog);
> +	phy_exit(phy);
>  }
>  
>  /**
> - * dp_ctrl_host_deinit() - Uninitialize DP controller
> + * dp_ctrl_irq_phy_exit() - disable dp irq and exit phy
>   * @dp_ctrl: Display Port Driver data
>   *
>   * Perform required steps to uninitialize DP controller
>   * and its resources.
>   */
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
>  	struct dp_io *dp_io;
> @@ -1866,23 +1895,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
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
> index cad25dd..44032ae 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -62,6 +62,11 @@ enum {
>  	EV_DISCONNECT_PENDING_TIMEOUT,
>  };
>  
> +enum {
> +	TYPE_eDP = 1,
> +	TYPE_DP,
> +};
> +
>  #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
>  #define DP_EVENT_Q_MAX	8
>  
> @@ -81,6 +86,7 @@ struct dp_display_private {
>  	int irq;
>  
>  	int id;
> +	int type;
>  
>  	/* state variables */
>  	bool core_initialized;
> @@ -121,31 +127,37 @@ struct dp_display_private {
>  
>  struct msm_dp_config { 
>  	phys_addr_t io_start[3];
> +	int type;
>  	size_t num_dp;
>  };
>  
>  static const struct msm_dp_config sc7180_dp_cfg = {
>  	.io_start = { 0x0ae90000 },
> +	.type = TYPE_DP,
>  	.num_dp = 1,
>  };
>  
>  static const struct msm_dp_config sc8180x_dp_cfg = {
>  	.io_start = { 0xae90000, 0xae98000, 0 },
> +	.type = TYPE_DP,
>  	.num_dp = 3,
>  };
>  
>  static const struct msm_dp_config sc8180x_edp_cfg = {
>  	.io_start = { 0, 0, 0xae9a000 },
>  	.num_dp = 3,
> +	.type = TYPE_eDP,
>  };
>  
>  static const struct msm_dp_config sc7280_edp_cfg = {
>  	.io_start = { 0xaea0000, 0 },
> +	.type = TYPE_eDP,
>  	.num_dp = 2,
>  };
>  
>  static const struct msm_dp_config sc7280_dp_cfg = { 
>  	.io_start = { 0, 0xae90000 },
> +	.type = TYPE_DP,
>  	.num_dp = 2,
>  };
>  
> @@ -392,7 +404,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>  	return rc;
>  }
>  
> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
> +static void dp_display_host_init(struct dp_display_private *dp)
>  {
>  	bool flip = false;
>  
> @@ -404,12 +416,21 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>  	if (dp->usbpd->orientation == ORIENTATION_CC2)
>  		flip = true;
>  
> -	dp_power_init(dp->power, flip);
> -	dp_ctrl_host_init(dp->ctrl, flip, reset);
> +	dp_power_init(dp->power, false);
> +	dp_ctrl_irq_enable(dp->ctrl, flip);
> +
> +	if (dp->type == TYPE_eDP)
> +		dp_ctrl_phy_init(dp->ctrl);
> +
>  	dp_aux_init(dp->aux);
>  	dp->core_initialized = true;
>  }
>  
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
> +{
> +	dp_ctrl_phy_init(dp->ctrl);
> +}
> +
>  static void dp_display_host_deinit(struct dp_display_private *dp)
>  {
>  	if (!dp->core_initialized) {
> @@ -417,7 +438,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>  		return;
>  	}
>  
> -	dp_ctrl_host_deinit(dp->ctrl);
> +	dp_ctrl_irq_phy_exit(dp->ctrl);
>  	dp_aux_deinit(dp->aux);
>  	dp_power_deinit(dp->power);
>  
> @@ -435,7 +456,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>  		goto end;
>  	}
>  
> -	dp_display_host_init(dp, false);
> +	dp_display_host_phy_init(dp);
>  
>  	rc = dp_display_process_hpd_high(dp);
>  end:
> @@ -646,9 +667,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  	if (state == ST_DISCONNECTED) {
>  		/* triggered by irq_hdp with sink_count = 0 */
>  		if (dp->link->sink_count == 0) {
> -			dp_ctrl_off_phy(dp->ctrl);
> +			dp_ctrl_phy_exit(dp->ctrl);
>  			hpd->hpd_high = 0;
> -			dp->core_initialized = false;
>  		}
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
> @@ -1040,7 +1060,7 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
>  static void dp_display_config_hpd(struct dp_display_private *dp)
>  {
>  
> -	dp_display_host_init(dp, true);
> +	dp_display_host_init(dp);
>  	dp_catalog_ctrl_hpd_config(dp->catalog);
>  
>  	/* Enable interrupt first time
> @@ -1222,7 +1242,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>  	return 0;
>  }
>  
> -static int dp_display_get_id(struct platform_device *pdev)
> +static int dp_display_get_id(struct platform_device *pdev,
> +				struct msm_dp_config *dp_cfg)
>  {
>  	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
>  	struct resource *res;
> @@ -1234,8 +1255,10 @@ static int dp_display_get_id(struct platform_device *pdev)
>  		return -EINVAL;
>  
>  	for (i = 0; i < cfg->num_dp; i++) {
> -		if (cfg->io_start[i] == res->start)
> +		if (cfg->io_start[i] == res->start) {
> +			*dp_cfg = *cfg;
>  			return i;
> +		}
>  	}
>  
>  	dev_err(&pdev->dev, "unknown displayport instance\n");
> @@ -1246,6 +1269,7 @@ static int dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
>  	struct dp_display_private *dp;
> +	struct msm_dp_config dp_cfg;
>  
>  	if (!pdev || !pdev->dev.of_node) {
>  		DRM_ERROR("pdev not found\n");
> @@ -1256,12 +1280,13 @@ static int dp_display_probe(struct platform_device *pdev)
>  	if (!dp)
>  		return -ENOMEM;
>  
> -	dp->id = dp_display_get_id(pdev);
> +	dp->id = dp_display_get_id(pdev, &dp_cfg);
>  	if (dp->id < 0)
>  		return -EINVAL;
>  
>  	dp->pdev = pdev;
>  	dp->name = "drm_dp";
> +	dp->type = dp_cfg.type;
>  
>  	rc = dp_init_sub_modules(dp);
>  	if (rc) {
> @@ -1314,7 +1339,7 @@ static int dp_pm_resume(struct device *dev)
>  	dp->hpd_state = ST_DISCONNECTED;
>  
>  	/* turn on dp ctrl/phy */
> -	dp_display_host_init(dp, true);
> +	dp_display_host_init(dp);
>  
>  	dp_catalog_ctrl_hpd_config(dp->catalog);
>  
> @@ -1531,7 +1556,7 @@ int msm_dp_display_enable(struct msm_drm_private *priv, struct drm_encoder *enco
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
