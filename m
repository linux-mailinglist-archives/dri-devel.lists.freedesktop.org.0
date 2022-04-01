Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D54EFC65
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 23:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E310E188;
	Fri,  1 Apr 2022 21:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D45310E1CE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 21:52:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y36so4376401lfa.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 14:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fwiPcePwyWDNqZciaQWCNtWnB3BuhnpqBpShl9WOXyA=;
 b=htJuUB2q3lz8f+8SfEoDD7kXI4Tp5oPWQ12vaLoCeBxyc0kHpf70KpIWE93NFYl6kb
 1HsLVEt3oiJd40d1NEg3an3DQFqKw/UsSCayKLr8ck58rI8KK2fZu5XgZWgTSK2erRQ1
 hZVaZRKC5v5TqiFn8HhZruK+0AMihEXJ+HfGewvtEPVkn1Qjr1zgAVFwETd0sWNZl1Qt
 epeykIL+Q+ZaNJK09Xt/YfFCwtGGD5C4U1H5Qf6rBaRQaX7XSngYzfx5dIvsEeqiA5Xf
 ahv6TgVgQFzfTtr/2mL4xmyPJCsgikxE2TTtSzgxybkbC/MFBxWpf1I0HDrEd1cQ/V6T
 8Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fwiPcePwyWDNqZciaQWCNtWnB3BuhnpqBpShl9WOXyA=;
 b=tzozwhLT+rFAPfH/yecN71CFv1LbaVu3YvW4WCv9EMOmoPTmx0tbq0BUlocVGywf4r
 PkUUFHQ/Mx2DcXt7SRdUYwOEhg1SibgHboGWKXM7KbzdWCC2gXpE8tvA2htvYWyus0fe
 ne6ouE10/aUIhXTnoSJuB3pMglhwWFJWeXh+5h2EzfbhLwzsI2dLCKxoZ08TXQFEriAD
 r8DDy5c83SHSvXu3ASbPznNbzA+3FalsTwUbmiBVur82RmH4tWCFXOfRg8ynsPC6Zq+b
 ybCJSQ6ix7HWSHZ49a33KV9UVzj4t+HPuAHTjGkrm/VbkWHMf4JdwBsjnuryI/HEHFFh
 UE2A==
X-Gm-Message-State: AOAM532m4J5pXLwIOuY78kqZyuaQKsxSHEN+sT9RqPJG7qXGTHArPQM1
 OnF7G3+ES4BML34QxEnJiwMZ5w==
X-Google-Smtp-Source: ABdhPJxNRGiA9PUOku8RiNabGMpnBh2xPoC51vkZT9lWkIsfmjkGmgEW4gZxzlxUQeUdZ3PhxYrIvQ==
X-Received: by 2002:a19:3801:0:b0:444:150b:9ef5 with SMTP id
 f1-20020a193801000000b00444150b9ef5mr14599579lfa.523.1648849936538; 
 Fri, 01 Apr 2022 14:52:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k18-20020ac24572000000b0044ae25d47d7sm208132lfm.143.2022.04.01.14.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 14:52:16 -0700 (PDT)
Message-ID: <ed7d894f-1a3d-7561-cf5f-d1be22b917d1@linaro.org>
Date: Sat, 2 Apr 2022 00:52:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 4/4] drm/msm/dp: enable widebus feature for display
 port
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1645824192-29670-1-git-send-email-quic_khsieh@quicinc.com>
 <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2022 00:23, Kuogee Hsieh wrote:
> Widebus feature will transmit two pixel data per pixel clock to interface.
> This feature now is required to be enabled to easy migrant to higher
> resolution applications in future. However since some legacy chipsets
> does not support this feature, this feature is enabled by setting
> wide_bus_en flag to true within msm_dp_desc struct.
> 
> changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
> 
> Changes in v3:
> -- split patch into 3 patches
> -- enable widebus feature base on chip hardware revision
> 
> Changes in v5:
> -- DP_INTF_CONFIG_DATABUS_WIDEN
> 
> Changes in v6:
> -- static inline bool msm_dp_wide_bus_enable() in msm_drv.h
> 
> Changes in v7:
> -- add Tested-by
> 
> Changes in v9:
> -- add wide_bus_en to msm_dp_desc
> 
> Changes in v10:
> -- add wide_bus_en boolean to dp_catalog struc to avoid passing it as parameter
> 
> Changes in v11:
> -- add const to dp_catalog_hw_revision()
> -- add const to msm_dp_wide_bus_available()
> 
> Changes in v12:
> -- dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> -- msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +++-
>   drivers/gpu/drm/msm/dp/dp_catalog.c         | 34 +++++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_catalog.h         |  2 ++
>   drivers/gpu/drm/msm/dp/dp_ctrl.c            |  7 +++++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h            |  1 +
>   drivers/gpu/drm/msm/dp/dp_display.c         | 21 ++++++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_display.h         |  2 ++
>   drivers/gpu/drm/msm/msm_drv.h               |  6 +++++
>   8 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9a8d992..5356d50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2138,8 +2138,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> +	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
>   		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
> +		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(dpu_enc->dp);
> +	}
>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>   			dpu_encoder_off_work);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 6ae9b29..85f9c39 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -24,6 +24,8 @@
>   #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
>   #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
>   
> +#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
> +
>   #define DP_INTERRUPT_STATUS1 \
>   	(DP_INTR_AUX_I2C_DONE| \
>   	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
> @@ -80,7 +82,7 @@ static inline void dp_write_aux(struct dp_catalog_private *catalog,
>   	writel(data, catalog->io->dp_controller.aux.base + offset);
>   }
>   
> -static inline u32 dp_read_ahb(struct dp_catalog_private *catalog, u32 offset)
> +static inline u32 dp_read_ahb(const struct dp_catalog_private *catalog, u32 offset)
>   {
>   	return readl_relaxed(catalog->io->dp_controller.ahb.base + offset);
>   }
> @@ -483,6 +485,22 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
>   }
>   
>   /**
> + * dp_catalog_hw_revision() - retrieve DP hw revision
> + *
> + * @dp_catalog: DP catalog structure
> + *
> + * Return: DP controller hw revision
> + *
> + */
> +u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> +{
> +	const struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
> +}
> +
> +/**
>    * dp_catalog_ctrl_reset() - reset DP controller
>    *
>    * @dp_catalog: DP catalog structure
> @@ -743,6 +761,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
> +	u32 reg;
>   
>   	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
>   				dp_catalog->total);
> @@ -751,7 +770,18 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>   	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
>   				dp_catalog->width_blanking);
>   	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
> -	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
> +
> +	reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
> +
> +	if (dp_catalog->wide_bus_en)
> +		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
> +	else
> +		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
> +
> +
> +	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", dp_catalog->wide_bus_en, reg);
> +
> +	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6965afa..383af42 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -70,6 +70,7 @@ struct dp_catalog {
>   	enum dp_catalog_audio_sdp_type sdp_type;
>   	enum dp_catalog_audio_header_type sdp_header;
>   	u32 audio_data;
> +	bool wide_bus_en;
>   };
>   
>   /* Debug module */
> @@ -95,6 +96,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid);
>   int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
> +u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index c724cb0..b714c5c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1799,6 +1799,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   	int ret = 0;
>   	bool mainlink_ready = false;
>   	struct dp_ctrl_private *ctrl;
> +	unsigned long pixel_rate_orig;
>   
>   	if (!dp_ctrl)
>   		return -EINVAL;
> @@ -1807,6 +1808,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   
>   	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   
> +	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
> +	if (dp_ctrl->wide_bus_en)
> +		ctrl->dp_ctrl.pixel_rate >>= 1;
> +
>   	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
>   		ctrl->link->link_params.rate,
>   		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
> @@ -1846,7 +1851,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_config_msa(ctrl->catalog,
>   		ctrl->link->link_params.rate,
> -		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
> +		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
>   
>   	dp_ctrl_setup_tr_unit(ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2363a2d..a0a5fbb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,6 +17,7 @@ struct dp_ctrl {
>   	bool orientation;
>   	atomic_t aborted;
>   	u32 pixel_rate;
> +	bool wide_bus_en;
>   };
>   
>   int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..9927454 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,12 +115,15 @@ struct dp_display_private {
>   	struct dp_event event_list[DP_EVENT_Q_MAX];
>   	spinlock_t event_lock;
>   
> +	bool wide_bus_en;
> +
>   	struct dp_audio *audio;
>   };
>   
>   struct msm_dp_desc {
>   	phys_addr_t io_start;
>   	unsigned int connector_type;
> +	bool wide_bus_en;
>   };
>   
>   struct msm_dp_config {
> @@ -137,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>   
>   static const struct msm_dp_config sc7280_dp_cfg = {
>   	.descs = (const struct msm_dp_desc[]) {
> -		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> +		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>   	},
>   	.num_descs = 2,
>   };
> @@ -808,6 +811,10 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error_ctrl;
>   	}
>   
> +	/* populate wide_bus_en to differernt layers */
> +	dp->ctrl->wide_bus_en = dp->wide_bus_en;
> +	dp->catalog->wide_bus_en = dp->wide_bus_en;
> +
>   	return rc;
>   
>   error_ctrl:
> @@ -1251,6 +1258,7 @@ static int dp_display_probe(struct platform_device *pdev)
>   	dp->pdev = pdev;
>   	dp->name = "drm_dp";
>   	dp->dp_display.connector_type = desc->connector_type;
> +	dp->wide_bus_en = desc->wide_bus_en;
>   
>   	rc = dp_init_sub_modules(dp);
>   	if (rc) {
> @@ -1437,6 +1445,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>   }
>   
> +bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> +{
> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	return dp->wide_bus_en;
> +}
> +
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   {
>   	struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index e3adcd5..b718cc9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -24,6 +24,8 @@ struct msm_dp {
>   
>   	hdmi_codec_plugged_cb plugged_cb;
>   
> +	bool wide_bus_en;
> +
>   	u32 max_pclk_khz;
>   
>   	u32 max_dp_lanes;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d7574e6..376a524 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -399,6 +399,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
> +bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>   
>   #else
>   static inline int __init msm_dp_register(void)
> @@ -449,6 +450,11 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>   {
>   }
>   
> +static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> +{
> +	return false;
> +}
> +
>   #endif
>   
>   void __init msm_mdp_register(void);


-- 
With best wishes
Dmitry
