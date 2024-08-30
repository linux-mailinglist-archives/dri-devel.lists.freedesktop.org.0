Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF896682E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93A810EABF;
	Fri, 30 Aug 2024 17:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N+o3FxrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBCC10EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:39:47 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f3fea6a0a9so19385511fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039585; x=1725644385; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o9RLqmZuPgkSZGcw3aqWvhJSnLmhE6YOvXyNpIJT4cs=;
 b=N+o3FxrXTWtyF0TgM0Z+ZPQE8bEiZK4Wfq7ViP8TNf/BC6BB+q1ER6ymjFZa8Tgx5/
 /FVgp9vUrKTamcYkhXTFqrtHY15f6JKdIW6KAM27XyqB8G9qaD5EiHkI8bB1K+2LrvZM
 PdvPzIQKTCoLHcPf0NvEE8W+nCjcEweLm8DrbbMe/K4X+qLePWubZ2No12VsIQwjEiQn
 aOH58ZI2gZoJcvN3AjS/KnX6CQDkI774a0UB/6FIIBXcu5bpW6LSsWNLKDVo+4YadUt6
 E4bljVFQKNIyUHst2URPDd9JZUTHrnEU+Bvy/4Nc2vRfX2alRjiYQRmU8KOGwFrgXDi8
 SQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039585; x=1725644385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9RLqmZuPgkSZGcw3aqWvhJSnLmhE6YOvXyNpIJT4cs=;
 b=c1x4Xi/BwieH/g+ZHASkrgpB98wK8XFhIRnF7L/zX6YTtYxBrCEUYZCb1agEp+xjB5
 LEQh29d5srXmTVIcyH7uL5GDiHSMI8/+9T9FyVvWEZZkdiVRnFmzC4S1e866A3FwlETm
 jp+YXEgJB3FAi7KIYOJawqLutixljHWAZLD9vyLiiMRxGP51hcpShEqTC6fb86S2hOVN
 V85rv1n2PP0hZztvSTY8CP68e14/NGaR10cBK+jtv/aR5XnZGRAS98ZlftuAICAUIQAR
 RLMBekb7gZhtPuXiP/OxXVFTsTXxC5hSojkSD53Bj06IxJPAwW7Dttl+bA3b8uM6Zo9C
 Uyiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUARYpX1ho04LlnVTbhhblHkeHSc0a0ULV73A094Vjz1e/wgAxJdOJbTbAgwLAYukZX//e+iq3nZcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXlyMN+9m9+CKX9yJeiDbTjxG05M7qpFZoyIr1f7rcXdr/Gwvp
 0zNvjfKsiToaI3unMBrMUDWDQpBigNmZ4BcERkEr2Pu2Tl/Mki3kqjUrghnkPqo=
X-Google-Smtp-Source: AGHT+IF6eoaBd3HfbZeeshXOGgUNf1X6KWPZzAHPqGgbnCdZT/fK0C7fYa4u01FRCsQjwzF8NT9EEw==
X-Received: by 2002:a2e:a587:0:b0:2ef:290e:4a30 with SMTP id
 38308e7fff4ca-2f61e0adff2mr11666591fa.16.1725039584657; 
 Fri, 30 Aug 2024 10:39:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f61517190dsm7568951fa.78.2024.08.30.10.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:39:44 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:39:42 +0300
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
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 21/21] drm/msm/dpu: Set possible clones for all encoders
Message-ID: <mg6wfuvfsdbewoacnd3vuidlgslbfmx5nhvy7ulwxolevt56at@ae2x3jd34d24>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-21-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-21-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:42PM GMT, Jessica Zhang wrote:
> Set writeback encoders as possible clones for non-writeback encoders and
> vice versa.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++++--
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 47b5a5994234..aad659e6d35b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2352,6 +2352,33 @@ static int dpu_encoder_virt_add_phys_encs(
>  	return 0;
>  }
>  

Docs should go here.

> +uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
> +{
> +	struct drm_encoder *curr;
> +	int type = drm_enc->encoder_type;
> +	uint32_t clone_mask = drm_encoder_mask(drm_enc);
> +
> +	/*
> +	 * Set writeback as possible clones of real-time encoders and real-time
> +	 * encoders as clones of writeback.
> +	 *
> +	 * Writeback encoders can't be clones of each other and real-time
> +	 * encoders can't be clones of each other.
> +	 */
> +	drm_for_each_encoder(curr, drm_enc->dev) {
> +		if (type == DRM_MODE_ENCODER_VIRTUAL &&
> +				curr->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +		if (type != DRM_MODE_ENCODER_VIRTUAL &&
> +				curr->encoder_type != DRM_MODE_ENCODER_VIRTUAL)

Align to opening brackets.

> +			continue;
> +
> +		clone_mask |= drm_encoder_mask(curr);
> +	}
> +
> +	return clone_mask;
> +}
> +
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
>  				 struct msm_display_info *disp_info)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 7ab5f9380bf5..70eda127488a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -98,6 +98,13 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
>   */
>  void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
>  
> +/**
> + * dpu_encoder_get_clones - set possible_clones for DPU encoder
> + * @drm_enc:        DRM encoder pointer
> + * Returns:         possible_clones mask
> + */
> +uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
> +
>  /**
>   * dpu_encoder_init - initialize virtual encoder object
>   * @dev:        Pointer to drm device structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 87526d3c224a..1a82aa61d217 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -793,8 +793,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>  		return ret;
>  
>  	num_encoders = 0;
> -	drm_for_each_encoder(encoder, dev)
> +	drm_for_each_encoder(encoder, dev) {
>  		num_encoders++;
> +		if (catalog->cwb_count > 0)
> +			encoder->possible_clones = dpu_encoder_get_clones(encoder);
> +	}
>  
>  	max_crtc_count = min(catalog->mixer_count, num_encoders);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
