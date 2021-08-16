Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DD3EDC9C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 19:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A7389E38;
	Mon, 16 Aug 2021 17:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F312C89E38
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 17:52:02 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id u1so4444776plr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aGcVbwp7D3wcK5fZ7iZV49ZDGmdfLQXktWsw3v/VBwE=;
 b=OCxsJXDOoFMfKwsfaAy2UCw19Hptc0ltRQafq/yUppY6Z6w6AXcaVhQCMW2nLYui5z
 weQgraKuGK1VEGcYO+x1nZt4mqJy6nMwxk5B5r0tRq4pQMPTC3VXJKjY82TEGu9FMs4u
 MEjPG4nvKWv4QWPau2NkJfY90IzCoVQBIiFqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aGcVbwp7D3wcK5fZ7iZV49ZDGmdfLQXktWsw3v/VBwE=;
 b=NnXhNPJGRP3NaUnXpnkWZUcjTJTNCAMrmpHvlR4W5mUb8/4lZoa/Wvjp+HV7A6R252
 +b0SjWGdwxR8yogc9v7hmoaoZAS5BUAfKYnK1gw4qqbpTQ2lj5tmk4NuuEGdoshD6vO8
 8JWXhMEOHSM/m0SrDf4a4mP+GXNnZj8uWqd1OI8W+O5Tlp+dwIPdsc+6Xn9HO9H0Cyqu
 kFVKv+dnjWHDJapOQQ6MJ1ssRMNqPksDozJCfNEWaSCweCUd6PbThbylpPikHMSe+3B9
 V0z5+RGmM2iF/8MKX9CLrrodXa5OWyy9lzePp+D3fQdX3kZkkz5VksDn3iNd4Z4QKAwI
 H/CQ==
X-Gm-Message-State: AOAM531F0OnPNtWHWCiuAmY0gNxo95dag28/wgFCAyc7wHi2feACbTk2
 3cOR1UTrc9QM+n6Rdv7GH5919g==
X-Google-Smtp-Source: ABdhPJwLz3PZJvaNlW8uPSKRihvQvE593CKTWnAmw5KlVtJqAKGeQc3gRX0SfuGiG1G1qWc6RHMxDQ==
X-Received: by 2002:a17:90a:5994:: with SMTP id
 l20mr281441pji.201.1629136321637; 
 Mon, 16 Aug 2021 10:52:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5cff:3a19:755c:1b91])
 by smtp.gmail.com with UTF8SMTPSA id x4sm35698pff.126.2021.08.16.10.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:52:01 -0700 (PDT)
Date: Mon, 16 Aug 2021 10:51:58 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
 dianders@chromium.org, khsieh@codeaurora.org, mkrishn@codeaurora.org
Subject: Re: [PATCH v1 1/2] drm/msm/dp: Add support for SC7280 eDP
Message-ID: <YRqlvuBPlcm/0r4s@google.com>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-2-git-send-email-sbillaka@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1628726882-27841-2-git-send-email-sbillaka@codeaurora.org>
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

On Thu, Aug 12, 2021 at 05:38:01AM +0530, Sankeerth Billakanti wrote:
> The eDP controller on SC7280 is similar to the eDP/DP controllers
> supported by the current driver implementation.
> 
> SC7280 supports one EDP and one DP controller which can operate
> concurrently.
> 
> The following are some required changes for the sc7280 sink:
> 1. Additional gpio configuration for backlight and pwm via pmic.
> 2. ASSR support programming on the sink.
> 3. SSC support programming on the sink.
> 
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c               | 19 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c            | 32 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_parser.c             | 31 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h             |  5 ++++
>  5 files changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b131fd37..1096c44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -856,9 +856,9 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
>  
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d2569da..06d5a2d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1244,7 +1244,9 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>  		struct dp_cr_status *cr, int *training_step)
>  {
>  	int ret = 0;
> +	u8 *dpcd = ctrl->panel->dpcd;
>  	u8 encoding = DP_SET_ANSI_8B10B;
> +	u8 ssc = 0, assr = 0;
>  	struct dp_link_info link_info = {0};
>  
>  	dp_ctrl_config_ctrl(ctrl);
> @@ -1254,9 +1256,21 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>  	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>  
>  	dp_aux_link_configure(ctrl->aux, &link_info);
> +
> +	if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {
> +		ssc = DP_SPREAD_AMP_0_5;
> +		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
> +	}
> +
>  	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>  				&encoding, 1);
>  
> +	if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP) {
> +		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
> +		drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
> +				&assr, 1);
> +	}
> +
>  	ret = dp_ctrl_link_train_1(ctrl, cr, training_step);
>  	if (ret) {
>  		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
> @@ -1328,9 +1342,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>  	struct dp_io *dp_io = &ctrl->parser->io;
>  	struct phy *phy = dp_io->phy;
>  	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
> +	u8 *dpcd = ctrl->panel->dpcd;
>  
>  	opts_dp->lanes = ctrl->link->link_params.num_lanes;
>  	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
> +	opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
>  	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>  					ctrl->link->link_params.rate * 1000);
>  
> @@ -1760,6 +1776,9 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>  	ctrl->link->link_params.num_lanes = ctrl->panel->link_info.num_lanes;
>  	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>  
> +	if (ctrl->dp_ctrl.pixel_rate == 0)
> +		return -EINVAL;
> +
>  	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
>  		ctrl->link->link_params.rate,
>  		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ee5bf64..a772290 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -117,8 +117,36 @@ struct dp_display_private {
>  	struct dp_audio *audio;
>  };
>  
> +struct msm_dp_config {
> +	phys_addr_t io_start[3];
> +	size_t num_dp;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +	.io_start = { 0x0ae90000 },
> +	.num_dp = 1,
> +};
> +
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +	.io_start = { 0xae90000, 0xae98000, 0 },
> +	.num_dp = 3,
> +};
> +
> +static const struct msm_dp_config sc8180x_edp_cfg = {
> +	.io_start = { 0, 0, 0xae9a000 },
> +	.num_dp = 3,
> +};
> +
> +static const struct msm_dp_config sc7280_edp_cfg = {
> +	.io_start = { 0xaea0000, 0 },
> +	.num_dp = 2,
> +};

This data isn't used anywhere, is there some patch missing?

And in case it is used (at some point), shouldn't at least the 'io_start'
addresses be specified in the device tree rather than the driver?

> +
>  static const struct of_device_id dp_dt_match[] = {
> -	{.compatible = "qcom,sc7180-dp"},
> +	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
> +	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_cfg },
>  	{}
>  };
>  
> @@ -1408,7 +1436,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>  
>  	dp_hpd_event_setup(dp);
>  
> -	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
>  }
>  
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3..c05fc0a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -248,6 +248,33 @@ static int dp_parser_clock(struct dp_parser *parser)
>  	return 0;
>  }
>  
> +static int dp_parser_gpio(struct dp_parser *parser)
> +{
> +	struct device *dev = &parser->pdev->dev;
> +	int ret;
> +
> +	parser->panel_bklt_gpio = devm_gpiod_get(dev, "panel-bklt",
> +			GPIOD_OUT_HIGH);
> +	if (IS_ERR(parser->panel_bklt_gpio)) {
> +		ret = PTR_ERR(parser->panel_bklt_gpio);
> +		parser->panel_bklt_gpio = NULL;
> +		DRM_ERROR("%s: cannot get panel-bklt gpio, %d\n", __func__, ret);
> +		goto fail;
> +	}
> +
> +	parser->panel_pwm_gpio = devm_gpiod_get(dev, "panel-pwm", GPIOD_OUT_HIGH);
> +	if (IS_ERR(parser->panel_pwm_gpio)) {
> +		ret = PTR_ERR(parser->panel_pwm_gpio);
> +		parser->panel_pwm_gpio = NULL;
> +		DRM_ERROR("%s: cannot get panel-pwm gpio, %d\n", __func__, ret);
> +		goto fail;
> +	}

Just setting the GPIOs to high on initialization and then leaving them
unattended doesn't look right. I saw Stephen already pointed towards
drivers/video/backlight/pwm_bl.c.

> +
> +	DRM_INFO("gpio on");
> +fail:
> +	return 0;

This function always returns 0, either the return type should be void, or it
should return a different value in the error case

> +}
> +
>  static int dp_parser_parse(struct dp_parser *parser)
>  {
>  	int rc = 0;
> @@ -269,6 +296,10 @@ static int dp_parser_parse(struct dp_parser *parser)
>  	if (rc)
>  		return rc;
>  
> +	rc = dp_parser_gpio(parser);
> +	if (rc)
> +		return rc;

The function never returns a non-zero value (see above).
