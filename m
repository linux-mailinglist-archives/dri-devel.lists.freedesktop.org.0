Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448F0A48CC3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 00:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40210EBB5;
	Thu, 27 Feb 2025 23:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zBSXKMh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4646410EBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:27:05 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5494cb8c2e7so333439e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740698823; x=1741303623; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7WNTtnPyIuJT+/uJWKYo/FYFhAssVEsvM4kIc7boJOo=;
 b=zBSXKMh9w7pPYReJfENZNf+vdnFVylR4j+xrZP9aK3eKtWZUI57uEP6AKw355NT4yz
 Lm4SzU/XlV7/vxM7uQ9ITY/zrlGLi7LfaO3vFxJ2lAJk/Poy+HFfxsuLXH5MQLmxtIpZ
 2y7sBHvr7RCbfwTm3mrnY/MOyzz4lfPSCaOfylnUc9byBPkQNKXqUvybvpapnFN5jKuD
 IL3Y2hBln6WLOHC0+kp6zcBLwYrLf/eJ4aRnhPU2196XT7Gv8h8Rv0PBbUsgpjt5mcC0
 SZOqoC1ZtwtvUWeG//lJweggQcmLbbaCrcgaxht6ovsTN6hEhGV/aXBI3iuTE+W2cI+J
 QFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740698823; x=1741303623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WNTtnPyIuJT+/uJWKYo/FYFhAssVEsvM4kIc7boJOo=;
 b=Tc19JI6bnsa57IaWYismHWE6e4jO5f1k+Ew79s1dJkiipipwSXoMujWYrkJzlaxzVp
 roT9Zc4YievVjSdr7B35t2H0greq3VCCJGQHBRynBsCD/wdhuLvwhdGVRbZK/uIWdE1M
 6fNo+IKapZXA56yoT38XK1pnOL53biXVJOG85v4SzxS5Ma5bZa8E5j+EVVqKCFzD04++
 FjCAQN2tDTaAALW6YkWLIhrdS/gyjlQSk19Nxxxm60oib+XVmMfdnIk6J11DnRJkUNEW
 b26QDpJI4387FUsJkZvBznsqffa5DROt8lXeE4IxeT0y+xudY4Bacurd+SegCrQvrR8L
 mw8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/RRcV8/RxuO/X4BkELgxwPvpPuWLucNRj/3GzNZQ5heNf4zJaOIxzq1msQAS5T0KnYfkRPWb8Hsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCovidPDDkNqK6VSiSE/OePrp5Qiz1CPCjdhebFQTewpAVu3ne
 USCwIFMTO78jkoSGwsmkMgfSaE56frVYCS0c/blteBre+sLZpb0Lf1MSNuw9G+w=
X-Gm-Gg: ASbGncuHuDLEYO2svSZYE2ajiZIvFu6sbJFRa5VbaVlUml8973oaMaSeXboREJbGPOz
 74VITKD91do2teUDuypwtzzDCT2vcLKLfIBWbEwEXcfvotwEnaiw99AoNwvU7+Kzsd9ez/4QETi
 qi6kXEIruyh4vde233iuKz6OZ++1i8eqUuIY8jTFKQ9Yf34MbKRccz+us8T1UNRiqOm4gtO1FqD
 0bjOVoqLBN8ZmrN1oe8/ciynrg2AvCdcABNeD/j1GYac+KJa6eaJr+yUO6jy0JIx0Idplsvb3pF
 WjNxrUSOkYqli+pJAOqrtVvQNRVJWPErc3opdTYIVv10i/wTDRYl40i6ivRDMT0quooODFWGqdJ
 XbcNaiQ==
X-Google-Smtp-Source: AGHT+IHxjxlMLhD3oxVC5PDwEv4tONUbYy57JLfGirnQiWK4YcosMJV+1qf98e7hbSx7Q8klj5cPTw==
X-Received: by 2002:a05:6512:281d:b0:545:2950:5361 with SMTP id
 2adb3069b0e04-5494c129f93mr514211e87.5.1740698823331; 
 Thu, 27 Feb 2025 15:27:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be608sm299637e87.173.2025.02.27.15.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 15:27:01 -0800 (PST)
Date: Fri, 28 Feb 2025 01:26:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
Message-ID: <67jiudy4bopd3mzoylj47stuxwc5jdt63akxwn5qqo4dov47za@xcece4v2k3m5>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
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

On Fri, Feb 28, 2025 at 01:37:51AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..1820c167fcee609deee3d49e7b5dd3736da23d99 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  		gpu->ubwc_config.uavflagprd_inv = 2;
>  	}
>  
> +	if (adreno_is_a623(gpu)) {
> +		gpu->ubwc_config.highest_bank_bit = 16;

Just to doublecheck, the MDSS patch for QCS8300 used HBB=2, which
means 15. Is 16 correct here? Or might the be a mistake in the MDSS
patch?

> +		gpu->ubwc_config.amsbc = 1;
> +		gpu->ubwc_config.rgb565_predicator = 1;
> +		gpu->ubwc_config.uavflagprd_inv = 2;
> +		gpu->ubwc_config.macrotile_mode = 1;
> +	}
> +
>  	if (adreno_is_a640_family(gpu))
>  		gpu->ubwc_config.amsbc = 1;
>  
-- 
With best wishes
Dmitry
