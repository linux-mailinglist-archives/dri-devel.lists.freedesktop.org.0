Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C38616A01
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A6510E513;
	Wed,  2 Nov 2022 17:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA86310E505
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 17:07:59 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k19so25555228lji.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kyXR4AZe5V/4jtBvgZTO2g/zo75HfHyox2eOY6fukfE=;
 b=EZ5fXZ/T6cQIHYqYts4/sZPyfhiduno9I7y7q8/Gg8zjZyRfdYhnPmqzR/YUgl9fJA
 dXgHI1h+v+vjpBV4M7n6PrB1YrjVvLjzpolgwesg3h5Z/22EEbL92IcMQE+gSHdlRkR5
 OIRbpGJySfksVOWgdifuCPFOBlmzqI0eL6jiMmh6exyiHBYN9e8BUNGCeOKm5Cpieors
 B0ZQ0zauWC/3gBeMv3Yl/V1W6qAd1WjY/sw50d82pkeoaUlUbDtgQeNFGTQi2IbpJjIL
 kcJ+WfGIZqnmaKiAoQO1T+7OvNN79ljYe1Ig7FBqNNVbyrX0eqkPWswRDPdDHFLzs8Ul
 BMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kyXR4AZe5V/4jtBvgZTO2g/zo75HfHyox2eOY6fukfE=;
 b=T9MHhBONrs2RUSaxus8toXKXM21skA4wA9vJ0WtH+jg5oK7Qz3cgJ1bHVpyb2Q82Of
 thC5gUBecYIdWbrEn3AIbKrQnXuQQFbj9ZT+GigjOKuY899jsSuq33ubMCKretJhsexW
 IbTQP0y60xF/GTcpiaS5zGUS59KgJKeIPr+YW83VN02XAnn6GZXJyc2POw5lMyCK5ECy
 cf27JR9njHilCpuIehCtqOCqEuTJ/Mtnxc0DiZ9crL3n9xRkkIjchUcaQOuTCTTNtssO
 4ifJb2HRDQ2RMDb36fP1w2nTo2IRHnaQEidb+Xw6uVzOVL81wjNANMS3ISqq2trHiW/k
 ropQ==
X-Gm-Message-State: ACrzQf1RT1nQpSv6crNG9Z6AvfGykv4pFxM9TJorcvrH3BKrl3JNGaUX
 9YtDWibaTCar396mYk9WqU+fhw==
X-Google-Smtp-Source: AMsMyM7l3cmc81phjhM94OiOlHQabL+MkoQsLl3UWuETm5HnK3TdXMpQFwwBLD2Q2msziF2Towml1w==
X-Received: by 2002:a05:651c:b0b:b0:277:5c0a:f016 with SMTP id
 b11-20020a05651c0b0b00b002775c0af016mr5714901ljr.173.1667408877872; 
 Wed, 02 Nov 2022 10:07:57 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a056512314f00b00497b198987bsm2075905lfi.26.2022.11.02.10.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 10:07:57 -0700 (PDT)
Message-ID: <863b4c93-1770-ecd4-9eb6-333b3e8ab7d2@linaro.org>
Date: Wed, 2 Nov 2022 20:07:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/msm/disp/dpu1: register crtc color management to
 first crtc in the list
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667300361-14572-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667300361-14572-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/11/2022 13:59, Kalyan Thota wrote:
> This patch does the following:
> 
> 1) Registers crtc color management to the first crtc in the list and
> attach to an encoder which is neither pluggable nor virtual
> 2) Pin 1 crtc to 1 encoder
> 3) Assign dspp block if crtc supports color processing.

A clear identifier that the patch should be split.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 23 ++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 16 ++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 14 +++++++---
>   drivers/gpu/drm/msm/dp/dp_display.c         |  5 ++++
>   drivers/gpu/drm/msm/msm_drv.h               |  7 ++++-
>   7 files changed, 109 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4170fbe..14ff7ca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -18,6 +18,7 @@
>   #include <drm/drm_flip_work.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_mode.h>
> +#include <drm/drm_mode_object.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_vblank.h>
> @@ -553,6 +554,17 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
>   	spin_unlock_irqrestore(&dev->event_lock, flags);
>   }
>   
> +bool dpu_crtc_has_color_enabled(struct drm_crtc *crtc)
> +{
> +	u32 gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
> +	u32 degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
> +	u32 ctm_id = crtc->dev->mode_config.ctm_property->base.id;
> +
> +	return !!(find_prop_id(&crtc->base, gamma_id) ||
> +		  find_prop_id(&crtc->base, degamma_id) ||
> +		  find_prop_id(&crtc->base, ctm_id));
> +}
> +
>   enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
>   {
>   	struct drm_encoder *encoder;
> @@ -1575,6 +1587,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   {
>   	struct drm_crtc *crtc = NULL;
>   	struct dpu_crtc *dpu_crtc = NULL;
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   	int i;
>   
>   	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
> @@ -1604,7 +1618,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   
>   	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>   
> -	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +	if (dpu_kms->catalog->dspp && drm_crtc_index(crtc) == 0)

This would limit color management to first CRTC. As each CRTC can use 
not more than two LMs (and two DSPPs), we can support up to num_dspps / 
2 color-mgmt-enabled CRTCs.

A side note: ideally we need a way to change color mgtm enablement in 
runtime. Unfortunately with the current API this doesn't seem possible.

> +		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>   
>   	/* save user friendly CRTC name for later */
>   	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 539b68b..164208e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -240,6 +240,29 @@ static inline int dpu_crtc_frame_pending(struct drm_crtc *crtc)
>   }
>   
>   /**
> + * find_prop_id - find the property for the drm object
> + * @obj: Pointer to drm object
> + * @prop_id: Property id.
> + */
> +static inline struct drm_property *find_prop_id(struct drm_mode_object *obj,
> +					       uint32_t prop_id)
> +{
> +	int i;
> +
> +	for (i = 0; i < obj->properties->count; i++)
> +		if (obj->properties->properties[i]->base.id == prop_id)
> +			return obj->properties->properties[i];
> +
> +	return NULL;
> +}

Generic helper should go to drm core code.

> +
> +/**
> + * dpu_crtc_has_color_enabled - check if the crtc has color management enabled
> + * @crtc: Pointer to drm crtc object
> + */
> +bool dpu_crtc_has_color_enabled(struct drm_crtc *crtc);
> +
> +/**
>    * dpu_crtc_vblank - enable or disable vblanks for this crtc
>    * @crtc: Pointer to drm crtc object
>    * @en: true to enable vblanks, false to disable
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..f09b957 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode)
> +			struct drm_display_mode *mode,
> +			struct drm_crtc *crtc)
>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		if (dpu_kms->catalog->dspp &&
> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> +	if (dpu_crtc_has_color_enabled(crtc) &&
> +		(dpu_kms->catalog->dspp_count >= topology.num_lm))
>   			topology.num_dspp = topology.num_lm;

This is incorect. We should check if there are enough spare DSPPs, not 
if there are enough DSPPs at all. And no, telling that there is just a 
single CTM-enabled CRTC is not an answer.

> -	}
>   
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
> @@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state->crtc);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {
> @@ -2412,7 +2411,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   	struct drm_encoder *drm_enc = NULL;
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> -	int ret = 0;
> +	int ret = 0, intf_i;
>   
>   	dpu_enc = to_dpu_encoder_virt(enc);
>   
> @@ -2424,13 +2423,16 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	timer_setup(&dpu_enc->frame_done_timer,
>   			dpu_encoder_frame_done_timeout, 0);
>   
> +	intf_i = disp_info->h_tile_instance[0];
>   	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> +	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
>   		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> -				priv->dp[disp_info->h_tile_instance[0]]);
> +				priv->dp[intf_i]);
> +		disp_info->is_pluggable = msm_dp_is_pluggable(priv->dp[intf_i]);
> +	}

And DSI can be pluggable too. Please enumerate connector types here 
rather than doing that in DP driver.

>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>   			dpu_encoder_off_work);
> @@ -2455,6 +2457,28 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   
>   }
>   
> +bool dpu_encoder_is_pluggable(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return dpu_enc->disp_info.is_pluggable;
> +}
> +
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_VIRTUAL);
> +}
> +
>   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   		int drm_enc_mode)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..209adb4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -25,7 +25,8 @@
>    * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
>    *                      based on num_of_h_tiles
> - * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @is_cmd_mode:	Boolean to indicate if the CMD mode is requested
> + * @is_pluggable:	Boolean to indicate if the intf is pluggable
>    * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
>    *				 used instead of panel TE in cmd mode panels
>    * @dsc:		DSC configuration data for DSC-enabled displays
> @@ -35,6 +36,7 @@ struct msm_display_info {
>   	uint32_t num_of_h_tiles;
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>   	bool is_cmd_mode;
> +	bool is_pluggable;
>   	bool is_te_using_watchdog_timer;
>   	struct drm_dsc_config *dsc;
>   };
> @@ -128,6 +130,18 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
>   void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
>   
>   /**
> + * dpu_encoder_is_pluggable - get pluggable info from the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_pluggable(struct drm_encoder *drm_enc);
> +
> +/**
> + * dpu_encoder_is_virtual - find if the encoder is of type virtual.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc);
> +
> +/**
>    * dpu_encoder_init - initialize virtual encoder object
>    * @dev:        Pointer to drm device structure
>    * @disp_info:  Pointer to display information structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7a5fabc..2b9c316 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -807,9 +807,17 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   		priv->crtcs[priv->num_crtcs++] = crtc;
>   	}
>   
> -	/* All CRTCs are compatible with all encoders */
> -	drm_for_each_encoder(encoder, dev)
> -		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
> +	/* Pin 1 crtc for 1 encoder and crtc 0 for primary display as it has
> +	 * color management registered
> +	 */
> +	i = 1;
> +	drm_for_each_encoder(encoder, dev) {
> +		if ((!dpu_encoder_is_pluggable(encoder) &&
> +			!dpu_encoder_is_virtual(encoder)) || (num_encoders == 1))
> +			encoder->possible_crtcs = 1 << drm_crtc_index(priv->crtcs[0]);
> +		else
> +			encoder->possible_crtcs = 1 << drm_crtc_index(priv->crtcs[i++]);

This can be made much simpler. Allocate a single CRTC for each encoder, 
disallowing CRTC switching. Then allocate as many CTM-enabled for 
non-pluggable encoder-CRTC pairs as possible.

> +	}
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aef..5690ea3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1509,6 +1509,11 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return dp->wide_bus_en;
>   }
>   
> +bool msm_dp_is_pluggable(const struct msm_dp *dp_display)
> +{
> +	return (dp_display->connector_type == DRM_MODE_CONNECTOR_DisplayPort);
> +}
> +
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   {
>   	struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ea80846..b0d0546 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -331,7 +331,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> -
> +bool msm_dp_is_pluggable(const struct msm_dp *dp_display);
>   #else
>   static inline int __init msm_dp_register(void)
>   {
> @@ -365,6 +365,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return false;
>   }
>   
> +static inline bool msm_dp_is_pluggable(const struct msm_dp *dp_display)
> +{
> +	return false;
> +}
> +
>   #endif
>   
>   #ifdef CONFIG_DRM_MSM_MDP4

-- 
With best wishes
Dmitry

