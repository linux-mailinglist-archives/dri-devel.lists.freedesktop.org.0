Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276E8CEA8C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 21:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864D410F0F9;
	Fri, 24 May 2024 19:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vqlYeVgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDA810F1C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 19:59:55 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52965199234so1423786e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716580794; x=1717185594; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pGqE5XyK9AlS/gmdKLqCAwRJHada2L/EJpjnWwZ6tR8=;
 b=vqlYeVgGxgJ6wyChjNbUh0AtKciq/7RzinrFS3N3rZmnvLIMgDwqgjjpH4ZieIw2aC
 m+8QXFmu1AgrAMYrRHdSA1IP08d/lCAnjdtPrzdxkb8qBo8DRRCOncbz+OLrP0Kul5Gs
 /EXDKBkDP0EHVc4iRPefz9qZk9yYaUsYlKZ4XeJPQoccMnuWcViAXzRGcNCy85sVeN78
 MlC6VLrRoQr8qSGpLMx8eacNq2/tfBKFHsShOr/hOKP50s9jHpP++vRQ2CkyV0FlGe6H
 YQnt5QoyrogkwAWxMQHaiZ4i3SMbkfbx3t7v4nRaQys1fqpbf+8tLxYQpOuOT3k7FE/k
 7Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716580794; x=1717185594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGqE5XyK9AlS/gmdKLqCAwRJHada2L/EJpjnWwZ6tR8=;
 b=VG7Zffsk56LmU79diVKM5i3xWLaMOuNaCx5zj5Fzb4OOzBEVG+Lu7U4suHoLy4mAvE
 0cJ8q/94aoubhHPSIC/F9rodFx6MDmzFsGdfZ2K1F21wpwe3MQgHNVF3rpyXhCxvcYQc
 QHJuonV8/9GXuq9HsrLqZoAJt4ceodE7fAoHGhtv1LrW+fKcME9XL2IjZ+h0+ZqQNJHj
 DSTEDQAh6fmlG0+J2KoEXIZD7AVI1IcCxCGP14eY/u6xzQtfE+wwfBaZ9AqjS4DdwlqN
 /JLJZ3Kd+jCOpUQlrYlewJg/BHDVoiYSZr2Wxw6crhxwwkgStpAMuEEAwzmnH9e2vLvt
 lcBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYjeyoFtRV2jxwIV3IvYJPM9aUsQkwaIBF0nE+1cyrGgCMI/Tid0Ketb7tVGkZcPl3+GiwzqU7UYl1iy9gDQBBKGxHOA9yASKNq3j8MOHD
X-Gm-Message-State: AOJu0YzV81V3rJmqG1xdEdekYFFaZ1H9HjjP9xjKjdLUxjmPxPKMesiO
 YzqzGq+S+U+Zz040DFiq93UP9r7pNuEP+d9mJZVGklcAmntKC6uUjOdCj7aHBo8=
X-Google-Smtp-Source: AGHT+IEL67ua6xkBji7gqkELqzQgg8XINXWQr3e4sQgdtKPhKVbinyunp4c5rTphED3dpz4Em2Om/Q==
X-Received: by 2002:a05:6512:e96:b0:523:8c7a:5f6 with SMTP id
 2adb3069b0e04-529663e627dmr2661791e87.51.1716580793651; 
 Fri, 24 May 2024 12:59:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529711fa7fesm229631e87.264.2024.05.24.12.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 12:59:53 -0700 (PDT)
Date: Fri, 24 May 2024 22:59:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v4 1/5] drm/msm/dpu: fix video mode DSC for DSI
Message-ID: <7faghtnpcgrcgxvjo56undtf4un7kcxioxwlif2u63nppl435l@xwwkfxsqimvj>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
 <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-1-e61c05b403df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-1-e61c05b403df@linaro.org>
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

On Fri, May 24, 2024 at 09:18:21PM +0800, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add necessary DPU timing and control changes for DSC to work with DSI
> video mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          |  4 ++++
>  4 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..48cef6e79c70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -564,7 +564,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>  
> -static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>  {
>  	struct msm_drm_private *priv = drm_enc->dev->dev_private;
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 002e89cc1705..2167c46c1a45 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -334,6 +334,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   */
>  unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>  
> +/**
> + * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC config
> + *   used for this encoder.
> + * @drm_enc: Pointer to encoder structure
> + */
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
> +
>  /**
>   * dpu_encoder_get_drm_fmt - return DRM fourcc format
>   * @phys_enc: Pointer to physical encoder structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ef69c2f408c3..7047b607ca91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -115,6 +115,19 @@ static void drm_mode_to_intf_timing_params(
>  		timing->h_front_porch = timing->h_front_porch >> 1;
>  		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>  	}
> +
> +	/*
> +	 * for DSI, if compression is enabled, then divide the horizonal active
> +	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> +	 * is compressed into bits of 1 pixel.
> +	 */
> +	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +		struct drm_dsc_config *dsc =
> +		       dpu_encoder_get_dsc_config(phys_enc->parent);
> +		timing->width = timing->width * (dsc->bits_per_pixel >> 4) /

Here you are truncating fractional part of BPP. Please use
drm_dsc_get_bpp_int(), at least it will warn if there is a fractional
part. Or, even better, add a helper to calculate width * bpp / 64 / (bpc
* 3) and use it here and in dsi_adjust_pclk_for_compression()

> +				(dsc->bits_per_component * 3);
> +		timing->xres = timing->width;
> +	}
>  }
>  
>  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 225c1c7768ff..2cf1f8c116b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,6 +168,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>  
>  	data_width = p->width;
>  
> +	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
> +	if (p->compression_en && !dp_intf)
> +		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +

Separate commit, please

>  	hsync_data_start_x = hsync_start_x;
>  	hsync_data_end_x =  hsync_start_x + data_width - 1;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
