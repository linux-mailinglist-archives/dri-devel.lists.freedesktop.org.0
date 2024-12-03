Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E745F9E1CC6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 13:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1118110E1B6;
	Tue,  3 Dec 2024 12:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IL11j3w6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391FD10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 12:53:03 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ffc357ea33so58132221fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 04:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733230381; x=1733835181; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cgOp9XciNPobuDZogrWrTiS66ohIUz+olcA2lkcJj8w=;
 b=IL11j3w638APmpMd+6PhZOX0meaArgcGYR6MSGSclkVeVBtoz2oM/uVOUC8fIG+JnG
 98c7yHbNYoQ7Vrr4sWeJGVv/QWp3AAPC6CDKa2cPtqiHpuIinvqGmdsah8EEo+aYYP5p
 Uh85rcyhdmbMVEZDijSkmgu6VIzMpXALdu0sXYD4zFgyqrEPh7ol3JTxZllKUEQiIoR7
 IidAryG6JEMfVChWIqLYKj36H1X6NB270TujDKMxIrwrD6wVKNT2aQBUt5USJDnI/LB5
 KrJMAdjQztq18J/McwDk4l3FBZCpG2CqtYQutfs0ZQh9V1tPj02T2qpVtoKPU67owF/p
 Yjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733230381; x=1733835181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgOp9XciNPobuDZogrWrTiS66ohIUz+olcA2lkcJj8w=;
 b=HRKy94rTdhqRpkYyFHtHkJqkmY4UUdO/5quXKVtkNsbpbEqaBx2Ap3AnZpRZlafOrU
 wdKkL2/iQg/J0tJFTA5XwKqUyqBj4SH7bl/9LCN9LtIvDXts/jlBFTOLAYoG7M0VXqCE
 o4Gb3p7Jpzs/PCcIqkYqZIrXh3jP0C4+9NfDi6GGKG2LSy2Bc/wr1uc5RyKXknLyCfL/
 qdnvUeOOivDdJt6wV0/n2GLnZUOLm3LeUb1trPVJ+C90p5n7vFPwf+OPMuR1cYH7O5th
 OL5J3HlbPLHVkeuB/H4zrUC6t530srkv7cTGkeRZnzZoyFK9p8JbZI5F+Od4vGIDnAEu
 /jWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfLcktAG164up8FTvtZtJzQpWJuZmgHUO5VKEEE6Nyan5VVO2ECQn3mdTOZA4y9Uv7EH9XN25abeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXtOPiRyd9xUPqX83KJR8nZoH+GuPhiQ0XO56RLgLM/+KtSJz9
 FX786XY9e+oZ1KzCnR5yCeHnwkCVLJNPnlKUVDH+Pc19GwwU39WMkN07BdNizAs=
X-Gm-Gg: ASbGncscYnT8/JCSWgoNYZjWIh2BM1KdpujcaV8xIean71N0G3VTNFBIBSBDDqQZP7X
 Jh1nLcemmj3rbSE2z3vjj5CABnbYhpisRljmvBmLBrGipSHHhu5bfQ16EOzlmq550cxfb+LmonN
 pEw5aj9UGj6LfkupVlxSm+qfrcjyzrAkj0UIr1Eon0pPx8CENdnhD8IcWbFx2y0rSlFfd+bEt5z
 c3HQt5jXrKtvjry+C8r/+1lZ5soJIHFgQU5p0Z+tPtw4Qkw36VCTm99RWeWljONL6qEEo+DlU6f
 yLZPFA91uBRfRpMzTTWmUnsmKW3btw==
X-Google-Smtp-Source: AGHT+IEpNqcECccRh4l7n5a+xTcPnLC8zwWnHNryhKJgbaE6P1ez0VKjp2pUHX9jWAZQKmTS2jZ21g==
X-Received: by 2002:a05:651c:2204:b0:2ff:b7ff:53b1 with SMTP id
 38308e7fff4ca-30009caa37cmr15651031fa.25.1733230381206; 
 Tue, 03 Dec 2024 04:53:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-300142fffaasm330231fa.10.2024.12.03.04.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 04:52:59 -0800 (PST)
Date: Tue, 3 Dec 2024 14:52:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203095920.505018-2-dpiliaiev@igalia.com>
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

On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.

Could you please spend more words, describing what it is and why is it
necessary for those extensions. For a5xx+ it looks like some kind of an
internal address (what kind of?). For a4xx I'm completely lost.

> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 50c490b492f0..f1b18a6663f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>  
>  	/* Disable L2 bypass to avoid UCHE out of bounds errors */
> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>  
>  	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>  			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  	if (ret)
>  		goto fail;
>  
> +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
> +
>  	if (!gpu->aspace) {
>  		/* TODO we think it is possible to configure the GPU to
>  		 * restrict access to VRAM carveout.  But the required
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ee89db72e36e..caf2c0a7a29f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>  
>  	/* Disable L2 bypass in the UCHE */
> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>  
>  	/* Set the GMEM VA range (0 to gpu->gmem) */
>  	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->ubwc_config.macrotile_mode = 0;
>  	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>  
> +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
> +
>  	return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..0ae29a7c8a4d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	/* Disable L2 bypass in the UCHE */
>  	if (adreno_is_a7xx(adreno_gpu)) {
> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>  	} else {
> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>  	}
>  
>  	if (!(adreno_is_a650_family(adreno_gpu) ||
> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		}
>  	}
>  
> +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
> +
>  	if (gpu->aspace)
>  		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>  				a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 076be0473eb5..774ff6eacb9f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  	case MSM_PARAM_MACROTILE_MODE:
>  		*value = adreno_gpu->ubwc_config.macrotile_mode;
>  		return 0;
> +	case MSM_PARAM_UCHE_TRAP_BASE:
> +		*value = adreno_gpu->uche_trap_base;
> +		return 0;
>  	default:
>  		DBG("%s: invalid param: %u", gpu->name, param);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71f420f8b3a..9bd38dda4308 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -253,6 +253,8 @@ struct adreno_gpu {
>  	bool gmu_is_wrapper;
>  
>  	bool has_ray_tracing;
> +
> +	u64 uche_trap_base;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>  
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index b916aab80dde..2342cb90857e 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>  
>  /* For backwards compat.  The original support for preemption was based on
>   * a single ring per priority level so # of priority levels equals the #
> -- 
> 2.46.2
> 

-- 
With best wishes
Dmitry
