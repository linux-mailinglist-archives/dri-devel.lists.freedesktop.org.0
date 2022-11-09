Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF9622B71
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0332910E4D1;
	Wed,  9 Nov 2022 12:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C55710E4D1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 12:22:43 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s24so25482229ljs.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6bYmj95aYxYd2nESG4KU3TCBJLsIJxzWeCnkVXkQyk=;
 b=WExzNggAGe5OKIJ9cMNb+sIkuEwrEYklRDwGbHbc6POJy5NVTauCp9Qv4hzYLx+DvI
 MzSpnT1HBuysb+BZEpZA8RfIaAhrjtINzt8VALikTn5AEe54xBpVZL9+mEC/atuMbl49
 RJ41v01RzSvDksCgvqu5Tas+S7B9vPn6LLWRxM71d9TyHywokPBkRYaEYQglgLZLjN/g
 TrV2GeO4TdFfBQW9R0cq2A46BL8T9GTw3pz5VyiKF6eLLeCNGPiDjTxHyZMZUCZNxlJs
 AJ5xOQ5/ARm/lbnwq1065Nkyrshxv3pCdxYxSCQMRsiJiru18G9PBo4rINlinOrFR/At
 1/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6bYmj95aYxYd2nESG4KU3TCBJLsIJxzWeCnkVXkQyk=;
 b=R6Yb1gKp1+XTildO+nIWaTHaXGUB3v8ghZ6W/oTSBeIvmIcu6/Z67BWscMS0YBDuEL
 Ho0yO1R0HLdNauMWv8uD1wcIajA+/775DtRezt1/ZUE+B8UCyvt4VvrDDbESv/1KPZf2
 tedag2254H5oOCbeSrVabZv99D+FXjONvCyBpdAeM2oovEOope9KX3NT+tmWv3ymJtVF
 IDd62H6lNWjIVnYAuaVCp9+7yfrDQSERL8QUvujTPcE/a2lN56mhb9NRhcjZWwHQa3NX
 6bLacKPA/gSvYMbc8/c1U9E9TmJtKoqNOYdl4yqOzMt96/k4t0Grdy6l6kidrGMpMLtI
 RtRA==
X-Gm-Message-State: ACrzQf1JsmI7m6sBBxbZ5hxRZYl8kTMj65JQjo1eRbA/vq5fr9J+7XUl
 Byj8AxN7Psn6vES3m0+E7Z2kug==
X-Google-Smtp-Source: AMsMyM7TUZsz21JDWX1Zkb+DNCX6wszIdVrI2ylvIfk3s6uy/4NlfcfXNr7abQyizceTJ/0qz2vl2w==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id
 k8-20020a2e92c8000000b0025d6ddfe71dmr20012719ljh.170.1667996561748; 
 Wed, 09 Nov 2022 04:22:41 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056512074b00b004947984b385sm2191397lfs.87.2022.11.09.04.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:22:41 -0800 (PST)
Message-ID: <e0c5b9b3-338a-f589-0883-066db5bcbf21@linaro.org>
Date: Wed, 9 Nov 2022 15:22:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/4] drm/msm/disp/dpu1: populate disp_info if an interface
 is external
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
 <1667996206-4153-2-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996206-4153-2-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 15:16, Kalyan Thota wrote:
> DRM encoder type is same for eDP and DP (DRM_MODE_ENCODER_TMDS)
> populate is_external information in the disp_info so as to
> differentiate between eDP and DP on the DPU encoder side.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 14 +++++++++++---
>   drivers/gpu/drm/msm/dp/dp_display.c         |  5 +++++
>   drivers/gpu/drm/msm/msm_drv.h               |  7 ++++++-
>   4 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..5d6ad1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2412,7 +2412,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   	struct drm_encoder *drm_enc = NULL;
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> -	int ret = 0;
> +	int ret = 0, intf_i;
>   
>   	dpu_enc = to_dpu_encoder_virt(enc);
>   
> @@ -2424,13 +2424,16 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
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
> +		disp_info->is_external = msm_dp_is_external(priv->dp[intf_i]);
> +	}

I will quite myself: "And DSI can be pluggable too. Please enumerate 
connector types here rather than doing that in DP driver."
Your s/pluggable/external/ doesn't fix the issue.

>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>   			dpu_encoder_off_work);
> @@ -2455,6 +2458,17 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>   
>   }
>   
> +bool dpu_encoder_is_external(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return dpu_enc->disp_info.is_external;
> +}
> +
>   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   		int drm_enc_mode)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..43f0d8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -25,16 +25,18 @@
>    * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
>    *                      based on num_of_h_tiles
> - * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @is_cmd_mode:        Boolean to indicate if the CMD mode is requested
> + * @is_external:        Boolean to indicate if the intf is external
>    * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> - *				 used instead of panel TE in cmd mode panels
> - * @dsc:		DSC configuration data for DSC-enabled displays
> + *                      used instead of panel TE in cmd mode panels
> + * @dsc:                DSC configuration data for DSC-enabled displays
>    */
>   struct msm_display_info {
>   	int intf_type;
>   	uint32_t num_of_h_tiles;
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>   	bool is_cmd_mode;
> +	bool is_external;
>   	bool is_te_using_watchdog_timer;
>   	struct drm_dsc_config *dsc;
>   };
> @@ -128,6 +130,12 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
>   void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
>   
>   /**
> + * dpu_encoder_is_external - find if the encoder is of type external
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_external(struct drm_encoder *drm_enc);
> +
> +/**
>    * dpu_encoder_init - initialize virtual encoder object
>    * @dev:        Pointer to drm device structure
>    * @disp_info:  Pointer to display information structure
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aef..0bbdcca5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1509,6 +1509,11 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return dp->wide_bus_en;
>   }
>   
> +bool msm_dp_is_external(const struct msm_dp *dp_display)
> +{
> +	return (dp_display->connector_type == DRM_MODE_CONNECTOR_DisplayPort);
> +}
> +
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   {
>   	struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ea80846..3b9f8d2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -331,7 +331,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> -
> +bool msm_dp_is_external(const struct msm_dp *dp_display);
>   #else
>   static inline int __init msm_dp_register(void)
>   {
> @@ -365,6 +365,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return false;
>   }
>   
> +static inline bool msm_dp_is_external(const struct msm_dp *dp_display)
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

