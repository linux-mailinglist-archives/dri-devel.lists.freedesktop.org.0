Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A0984EB9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A10A10E8E0;
	Tue, 24 Sep 2024 23:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lgdk7yqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C74710E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:13:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f75129b3a3so62345751fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219637; x=1727824437; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tHM1WNclfP92QoOT8vEDVI0r+AEeBwG3aV5dAajpHLA=;
 b=lgdk7yqzkLO8i0RCPrTSnDRNF/B0I81/44zR9WniWy/ZYfm0zSp1Cqs2ckcZRPTipF
 9Rgbf9U66pmzX3W0rthwQke5AyXOaNRCj2Enc/4hiTVVNsrFXR9ypSL1gg4geRCj5fEB
 TI0ne9qTfOxRjVESvpwk+UOwbFqung9YiDv0XAl4XM22bP2auhUMkWJxeL4HXGZTd8XV
 4S3YtTX17bAq7WtwF8xhYnAomqKqqJ2Oib7gpSgL8Sl6Fxkzu1vh8iXuBBamiPGIK1ip
 hE0n8PyKAaV1cNAUslIuHCzVJ8EIvHe1g0TC8ZH/Vy5aWDSnd4JGCKmnf8hccpEHiNmN
 Tirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219637; x=1727824437;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHM1WNclfP92QoOT8vEDVI0r+AEeBwG3aV5dAajpHLA=;
 b=Z8T5BBdZML1DB436uPea137F1w5+Y25PAlrWet+mq+dXw66mgqGSIZejpxxKX9aQ/v
 /aJ7vreaZ/hUHJD7lRR1SAZAgV4UZseN96xb9kxxypJiULTDgYCzt9nMAkLGwfwP3QAK
 o2qxISqj0+AisAZEVcK5chcUUogd5itCUlGlLF0b4cfWhHHnb4tEiqQhZRBika7V4SXy
 Mlg2OzmIvohf+H56O1rlZBU0cnCas1JOEwUYetvdVy3fVJ65w10XGpY2/WcWBXB+HAu0
 fnvOBJLN1gYCXRRTqvDoH2xSVppyNhjX6BGhpC7OV80/1iClVjoFXa1i02yPHdabyaVX
 ZoTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiLDKmCpUxfjY71rwWcNmA+o85odKCZj+rbpx8/QaOsf1cqh4+4xkpVKrh55/HtVnzDH2KsDaLXFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4iDUmFs/9G8VRhqgsEmuLXHNzQXd9KQO4RaoDtkm7dfdMVw6g
 W1QAD0NtcbI/k1mKzwYfDGcaPtVyTP22ZbwQMYNwARZw4853cAFHj8IuHa6PfMc=
X-Google-Smtp-Source: AGHT+IEpjPEwakEsY3T0I8yD2AZ7yjkBOntEWLY/ypvLz7ZY0nBCAwDHHoRMk3Rati1gYbJqTsTSRw==
X-Received: by 2002:a05:651c:1548:b0:2f7:5519:710d with SMTP id
 38308e7fff4ca-2f91ca429bfmr3663931fa.33.1727219636636; 
 Tue, 24 Sep 2024 16:13:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b760sm3452701fa.104.2024.09.24.16.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:13:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:13:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>  3 files changed, 183 insertions(+), 123 deletions(-)
> 
> @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
>  	}
>  }
>  
> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> +				 struct msm_display_topology *topology,
> +				 struct drm_atomic_state *state,
> +				 const struct drm_display_mode *adj_mode)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i, intf_count = 0, num_dsc = 0;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct msm_display_info *disp_info;
> +	struct drm_framebuffer *fb;
> +	struct msm_drm_private *priv;
> +	int i;
>  
>  	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>  		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> +			topology->num_intf++;
>  
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>  	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +		topology->num_dsc += 2;
>  
> -	return (num_dsc > 0) && (num_dsc > intf_count);
> -}
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return;
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return;
>  
> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> -{
> -	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int index = dpu_enc->disp_info.h_tile_instance[0];
> +	disp_info = &dpu_enc->disp_info;
>  
> -	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> -		return msm_dsi_get_dsc_config(priv->dsi[index]);
> +	priv = drm_enc->dev->dev_private;
>  
> -	return NULL;
> +	/*
> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +	 * earlier.
> +	 */
> +	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> +		fb = conn_state->writeback_job->fb;
> +
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> +			topology->needs_cdm = true;
> +	} else if (disp_info->intf_type == INTF_DP) {
> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> +			topology->needs_cdm = true;
> +	}

Just to note, the needs_cdm is not enough once you introduce CWB
support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
don't have), but this doesn't get reflected in the topology.

>  }
>  
-- 
With best wishes
Dmitry
