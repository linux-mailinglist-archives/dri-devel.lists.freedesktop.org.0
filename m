Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8208B4B9966
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAA710E943;
	Thu, 17 Feb 2022 06:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30410E942
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 06:45:15 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p22so8119354lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 22:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K6bs6/iCSZiGxiwBSczb+8zd5wjuxocgfhBW0GfNUhk=;
 b=DWCueZwKTPPSDWOiRftL9dknwvVq0PQeKvQvGHq5XRkKs4llWG1w0NRyP1ECkD2Axv
 u+Br6TFR+B4pjaQiMN1RZ4kX7lxxe8wX+iVRg2EoWRRJ1x00gZ1mG41SgS7FOVKJfyYh
 q859w83JaXY5uPFkdDG64vB+6MAI8A/sY9p67VDE8MKyVyWD614LFwFqBoWZtvswwYYY
 tOl0Zlm5+jk3hHHd36uqzWBaiJHTeb7jFNJ0opEpjxcg+vwL32JbfJiawdbW+eaQJUkL
 EGu+WK9VfqDPUOtPwwdaRvlVedyty6InCFXCmOorLQxcQTgR+B644ADXqhKb3dbaYjaq
 23TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K6bs6/iCSZiGxiwBSczb+8zd5wjuxocgfhBW0GfNUhk=;
 b=x3JBcKlVdKuQol9zKGVzsgGk/snpAWFDsOlXABDwHp6h21Juf7lwn0jOtUyDYuESFH
 TM89tzG7Tofj81WTR2y1By4X4FYXHo6bg72wTCyBAO7QlrfJNvfqAipZ941/FhLb7zdY
 cZJmu478bz3+EqlS1Jz4G9xCQ7DVNnF3xLwVbJlkXbttjCgLbgDZXlFP0bWMEQ87jkpP
 uvYamRys3PxrMakj0sEpkxBSrNkuKA8ULPeN3Mp3EyE6ou0lK8+sNaDv7igaDmZQ+nrt
 sHlEY6Tm9FPFT0mUBUd5iTPpU+/d52zdbGgFfbuh3t79zsRvIyKM2T2Or+1goe1S1guT
 qH5Q==
X-Gm-Message-State: AOAM533UEHNmrkRVZ0kYZVdzyQtpC19+tX0kVSk6u82kV4LVotwGNWSE
 4PX+XJnFsFnzba+91NNCaLzsWUcBSAxZjg==
X-Google-Smtp-Source: ABdhPJyETuH9sxF0JE+G3VIHmvqnJl8QZwULc+AfbrzbjD6B9zGTM/sjtZG/+ygZuBIvd9YyqQRrbQ==
X-Received: by 2002:a05:6512:b1c:b0:43c:6f79:c41c with SMTP id
 w28-20020a0565120b1c00b0043c6f79c41cmr1115362lfu.595.1645080313785; 
 Wed, 16 Feb 2022 22:45:13 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t11sm1425423ljd.19.2022.02.16.22.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 22:45:13 -0800 (PST)
Message-ID: <60fb6ee2-f43a-a559-c586-851d67e2a96d@linaro.org>
Date: Thu, 17 Feb 2022 09:45:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7 4/4] drm/msm/dp: enable widebus feature for display port
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1645049106-30481-1-git-send-email-quic_khsieh@quicinc.com>
 <1645049106-30481-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1645049106-30481-5-git-send-email-quic_khsieh@quicinc.com>
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

On 17/02/2022 01:05, Kuogee Hsieh wrote:
> Widebus feature will transmit two pixel data per pixel clock to interface.
> This feature now is required to be enabled to easy migrant to higher
> resolution applications in future. However since some legacy chipsets
> does not support this feature, this feature is enabled base on chip's
> hardware revision.
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
> -- fix Reported-bya issue
> -- fix static inline bool msm_dp_wide_bus_enable() at msm_drv.h
> 
> Changes in v7:
> -- add Tested-by
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +++-
>   drivers/gpu/drm/msm/dp/dp_catalog.c         | 34 +++++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_catalog.h         |  3 ++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c            | 13 +++++++----
>   drivers/gpu/drm/msm/dp/dp_ctrl.h            |  1 +
>   drivers/gpu/drm/msm/dp/dp_display.c         | 32 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_display.h         |  2 ++
>   drivers/gpu/drm/msm/dp/dp_panel.c           |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_panel.h           |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h               |  6 +++++
>   10 files changed, 90 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2b2dbb7..1e96cede 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2138,8 +2138,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> +	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
>   		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
> +		dpu_enc->wide_bus_en = msm_dp_wide_bus_enable(dpu_enc->dp);
> +	}
>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>   			dpu_encoder_off_work);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 6ae9b29..524eccc 100644
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
> +u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
> +}
> +
> +/**
>    * dp_catalog_ctrl_reset() - reset DP controller
>    *
>    * @dp_catalog: DP catalog structure
> @@ -739,10 +757,11 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
>   }
>   
>   /* panel related catalog functions */
> -int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> +int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en)
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
> +	if (wide_bus_en)
> +		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
> +	else
> +		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
> +
> +
> +	DRM_DEBUG_DP("wide_bus_en=%d reg=%x\n", wide_bus_en, reg);
> +
> +	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6965afa..2ba1ea4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -95,6 +95,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid);
>   int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
> +u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
> @@ -115,7 +116,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>   u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
>   
>   /* DP Panel APIs */
> -int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> +int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en);
>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>   				struct drm_display_mode *drm_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index c724cb0..b07574c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -154,7 +154,7 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>   	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>   }
>   
> -static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
> +static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl, bool wide_bus_en)
>   {
>   	u32 cc, tb;
>   
> @@ -167,7 +167,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>   		ctrl->panel->dp_mode.bpp);
>   	cc = dp_link_get_colorimetry_config(ctrl->link);
>   	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
> -	dp_panel_timing_cfg(ctrl->panel);
> +	dp_panel_timing_cfg(ctrl->panel, wide_bus_en);
>   }
>   
>   /*
> @@ -1799,6 +1799,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   	int ret = 0;
>   	bool mainlink_ready = false;
>   	struct dp_ctrl_private *ctrl;
> +	u32 pixel_rate_orig;
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
> @@ -1842,11 +1847,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   	 */
>   	reinit_completion(&ctrl->video_comp);
>   
> -	dp_ctrl_configure_source_params(ctrl);
> +	dp_ctrl_configure_source_params(ctrl, dp_ctrl->wide_bus_en);
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
> index 7cc4d21..8ecccf2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,6 +115,8 @@ struct dp_display_private {
>   	struct dp_event event_list[DP_EVENT_Q_MAX];
>   	spinlock_t event_lock;
>   
> +	bool wide_bus_en;
> +
>   	struct dp_audio *audio;
>   };
>   
> @@ -848,6 +850,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>   		return 0;
>   	}
>   
> +	dp->ctrl->wide_bus_en = dp->wide_bus_en;
> +
>   	rc = dp_ctrl_on_stream(dp->ctrl);
>   	if (!rc)
>   		dp_display->power_on = true;
> @@ -972,6 +976,7 @@ int dp_display_get_modes(struct msm_dp *dp,
>   		dp->connector, dp_mode);
>   	if (dp_mode->drm_mode.clock)
>   		dp->max_pclk_khz = dp_mode->drm_mode.clock;
> +
>   	return ret;
>   }
>   
> @@ -1437,6 +1442,28 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>   }
>   
> +bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
> +{
> +	struct dp_display_private *dp;
> +	u32 revision, major, minor;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	/* for the time being widebus only support on DP */
> +	if (dp_display->connector_type  == DRM_MODE_CONNECTOR_DisplayPort) {
> +		revision = dp_catalog_hw_revision(dp->catalog);
> +		major = ((revision >> 28) & 0x0ff);
> +		minor = ((revision >> 16) & 0x0fff);
> +
> +		DRM_DEBUG_DP("id=%d major=%d minor=%d\n", dp->id, major, minor);
> +
> +		if (major >= 1 && minor >= 2)
> +			return true;
> +	}

Please add an excplicit boolean to msm_dp_config instead. You can save 
it into dp_parser or dp_display, whichever works for you.

Having such function doesn't help to determine if wide bus is available 
on a random platform supported by this driver or not.

> +
> +	return false;
> +}
> +
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   {
>   	struct dp_display_private *dp;
> @@ -1460,6 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
>   	struct msm_drm_private *priv;
> +	struct dp_display_private *dp_priv;
>   	int ret;
>   
>   	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
> @@ -1468,6 +1496,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   	priv = dev->dev_private;
>   	dp_display->drm_dev = dev;
>   
> +	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
> +
>   	ret = dp_display_request_irq(dp_display);
>   	if (ret) {
>   		DRM_ERROR("request_irq failed, ret=%d\n", ret);
> @@ -1498,6 +1528,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	priv->bridges[priv->num_bridges++] = dp_display->bridge;
>   
> +	dp_priv->wide_bus_en = msm_dp_wide_bus_enable(dp_display);
> +
>   	return 0;
>   }
>   
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
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..71deb1e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -353,7 +353,7 @@ void dp_panel_dump_regs(struct dp_panel *dp_panel)
>   	dp_catalog_dump_regs(catalog);
>   }
>   
> -int dp_panel_timing_cfg(struct dp_panel *dp_panel)
> +int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en)
>   {
>   	u32 data, total_ver, total_hor;
>   	struct dp_catalog *catalog;
> @@ -404,7 +404,7 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>   
>   	catalog->dp_active = data;
>   
> -	dp_catalog_panel_timing_cfg(catalog);
> +	dp_catalog_panel_timing_cfg(catalog, wide_bus_en);
>   	panel->panel_on = true;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..5ec341a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -57,7 +57,7 @@ struct dp_panel {
>   
>   int dp_panel_init_panel_info(struct dp_panel *dp_panel);
>   int dp_panel_deinit(struct dp_panel *dp_panel);
> -int dp_panel_timing_cfg(struct dp_panel *dp_panel);
> +int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en);
>   void dp_panel_dump_regs(struct dp_panel *dp_panel);
>   int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   		struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d7574e6..4f9c24e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -399,6 +399,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display);
>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
> +bool msm_dp_wide_bus_enable(struct msm_dp *dp_display);
>   
>   #else
>   static inline int __init msm_dp_register(void)
> @@ -449,6 +450,11 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
>   {
>   }
>   
> +static inline bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
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
