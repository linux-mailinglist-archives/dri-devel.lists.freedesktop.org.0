Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D19E83DC
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 07:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34F810E430;
	Sun,  8 Dec 2024 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uAPC8y2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B3110E239
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 06:25:18 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so3907440e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733639117; x=1734243917; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv4ZZLZ8246YBWnXODcwZp0cvCag8q8Zfn9GevZqfKI=;
 b=uAPC8y2hvZU40eVY7FNIHZEr1a72iUMOIHkPQyVDUL8hlLxNQlqc+Zys0UPbqHIxcB
 bWeC6iARois59JTvQvs2MTOQRd4Gte1d5TUePT4MkBdb255OrvbGZSKdCcsXiqzZV+gc
 XMRRFMvZJqbv08+Vb24aJZ9rsaDpGU55L+G5oltFqrq664wRaSUIc5ieZGOUJAqvnW08
 Y+IWipUqoYy+Zg4J1ugJhcYR2jCsGOuCQBi8wGAEyJtzqVj+8hOX/wBlta9iCpnyIEdm
 bMrg2128k++kwdyTupucI5AknTC3psIA1aFt1YdJhvaWh6TMYu5YP5GeQ3I7vW+o5blc
 mCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733639117; x=1734243917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yv4ZZLZ8246YBWnXODcwZp0cvCag8q8Zfn9GevZqfKI=;
 b=rBQsVtZBvWaRWpB9lpU16VU3wbmdhufJnoTgUnnhXcCtD0TclsChQFJtBeHgxC97zN
 t8d4jSlK/zpZQEMYIwBKpS0pgIFoN+d4JrTYgGtESBpUYjgWDfHiguBpvT6bmpsV1Dx5
 8L6STC0Go896KN0nG5QZs48aDZrC0Y4+u684/ynYcJLgZpSNtZogUqcTmyeTu3zfSzCY
 Ha5+6kKEMxnbJci3aBaZLhmbWPbn6JPDA77cPmapVf27v/HFLbzregOAKwYq+FsFHdJT
 cQEpAvXe31E5SgD0avhVPfyJrBBGnv70hYlvPRffQrXghsKk0tKrB/FVTm7x0KOGz2KO
 ORuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRJjqI4Pd68drj91KiSS2LxA5BkLDZRAbP8WkALiAmUn79ug+v5rEptexsJRrDkVk8wFkD234O6Q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyl3IoCRufpAx/UVcV7+BAqMcepb5TOIUC9IpgiS1S64C9gQKW
 oOA51rgwCHRX6GmhYehTJkbHjG9r0YBxlC9sCkhagJ+JaCGUEsMRggjOJL9fA7g=
X-Gm-Gg: ASbGncs5au1vV2Jh8EBPwHeAr4vtud126oPBiwkBjTadsgjctIvcjg80ulSK0Nm6/+v
 68V9FmGT0pRYN6us0WDw1lwZ1ev2FBLqrRDnvTrV8ZO1f7EeTYdmPX6OgRpHbu/Nfe6k9zTaRQv
 /8iORKIYsTi7eOXXougjAHUyx4FBlmyLjQdf0dDKRmJYrJNFb17gJ1mKfUI+IS+U0ohu0aDM2Uk
 MXvt95FzlyF1qmVe3x9ayZKuOXBcAMvHszPZtOY9dI6Kh7fNw7liAUfNdJfweWQG96O9mHvfGxl
 Y/1qPIUpkdhYlx9n0xqikxtEt2mOIA==
X-Google-Smtp-Source: AGHT+IGa1+MAojS5l8TzrI/MuTB4uRPj9iAMmq7CXItu4qXq8cd0Vcz5ffDdDRwGNtUlkqf4/FMk3g==
X-Received: by 2002:a05:6512:691:b0:53e:1ee1:25b3 with SMTP id
 2adb3069b0e04-53e2c2bc74dmr2506384e87.27.1733639116847; 
 Sat, 07 Dec 2024 22:25:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54019f8afdesm246135e87.165.2024.12.07.22.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 22:25:15 -0800 (PST)
Date: Sun, 8 Dec 2024 08:25:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 38/45] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <ce67owjhtxwa3oy6fmmkmosqzzojny2ajofjjnk3lessly7t2b@artmywxh6hzq>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-38-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-38-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:09PM -0800, Abhinav Kumar wrote:
> Initiliaze a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports. Replace the opencoded instances of max_stream
> with the newly introduced API to centralize the usage.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 26 +++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_drv.h               | 14 ++++++++++++++

Split into two commits

>  4 files changed, 59 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 92b5ee390788d16e85e195a664417896a2bf1cae..618a5b6f8222882ed8c972a78a26f8c25ca389a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 8b251f87a0520da0807b9b7aed17493990e41627..359de04abf4bbead3daa5e8b357a3c34216e3e65 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -636,7 +636,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>  		if (!priv->dp[i])
> @@ -659,6 +660,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);

Is there any reason for this not being a part of the DPU catalog? DPU
can support required number of DPMST streams even if DP doesn't

> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +
> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 80df79a7c2077d49184cdeb7b801bf0699ff4ece..eafec9ab4f83cb44e861687e7550748b4d9b7ece 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -432,7 +432,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
> +	if (msm_dp_get_mst_max_stream(dp_display) <= DEFAULT_STREAM_COUNT ||
> +	    !msm_dp_panel_read_mst_cap(dp->panel)) {
>  		rc = msm_dp_panel_read_edid(dp->panel, connector);
>  		if (rc)
>  			goto end;
> @@ -457,7 +458,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> -	if (dp->max_stream > DEFAULT_STREAM_COUNT && msm_dp_panel_read_mst_cap(dp->panel))
> +	if (msm_dp_get_mst_max_stream(dp_display) > DEFAULT_STREAM_COUNT &&
> +	    msm_dp_panel_read_mst_cap(dp->panel))
>  		msm_dp_display_mst_init(dp);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> @@ -977,7 +979,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>  
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_get_mst_max_stream(&dp->msm_dp_display));
>  
>  	return rc;
>  }
> @@ -1444,6 +1446,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>  	return connector_type;
>  }
>  
> +int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display)
> +{
> +	struct msm_dp_display_private *dp_priv;
> +
> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp_priv->max_stream;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);
> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> @@ -1745,12 +1761,12 @@ void msm_dp_display_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_d
>  		return;
>  	}
>  
> -	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT)
> +	if (msm_dp_get_mst_max_stream(dp) > DEFAULT_STREAM_COUNT)
>  		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_panel);
>  	else
>  		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  
> -	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT) {
> +	if (msm_dp_get_mst_max_stream(dp) > DEFAULT_STREAM_COUNT) {
>  		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
>  							  msm_dp_display->max_stream);
>  		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 1616a4682795f6b9b30cc0bef2baf448ccc62bc0..12b50a797772f574122481cd8a1c7c88aacb8250 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -372,6 +372,10 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display);
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -388,6 +392,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
