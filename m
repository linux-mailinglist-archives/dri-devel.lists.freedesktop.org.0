Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A5A496D5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7B910EC56;
	Fri, 28 Feb 2025 10:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xchn3jwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADF910EC57
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:17:55 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54838cd334cso2185060e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740737874; x=1741342674; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CqCAMLKDFMDmg/J9XlohF5SNVValJDhS7J4k1e5y8j8=;
 b=xchn3jwIBYXMm4Ra2xOUP7Q5sOktJZaQ7Pwb6eKIJhsAoWRPUtHlDQo/Co07eAwvgF
 i2mlwdsycnpX3r30rkLFdlzoTznr96qXq/enOrZKnuprYkRxVaRlomRCu6KJsWiKMBIK
 fQos+AetAaSNS5eREFzsKH8BHISmvv6WK7mexExv6Tt8hjvOK/0DF3moaq9uRcFfl/g2
 QrbOTkhuPttq+JY2LkxLtSnHSp4pz+Gn8SY4Sg6EWFfKYlr5pWt3MoS7mIFY5zJ+7wQb
 Twfynt6IcGk0gMaOab0dgpfL7MQA0x0CGA25GOcPb0do6gqagUTCeagmPbKnSyUYaJgU
 qtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740737874; x=1741342674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqCAMLKDFMDmg/J9XlohF5SNVValJDhS7J4k1e5y8j8=;
 b=WjrZz7lDK3OvKQUL0F2tavBa1SE/LARCkT6j/S1eXK7POndmISVoQt24ArK2Y1DYCH
 xAZaDvkdg/zWyJpVrqCraKXtSov01g6Nm7XgptNQgzcP0goVpBC8WfHU2ln2Tr0b0o1N
 WzYi7mN6FV13pHWHs5DurehRvM/9ioHw/8agyyH4S5wwaiQQFdczvV+FF2T2kYqgsY6S
 lBMNK29PHBE/mwHoThFQ2KbYJ03QNGeTL//0Up2sAu1GoeMzCzDgno5whYxoJ8KXdp3U
 28Zdy+ZQoG99kZJJSFwbcqz4dZ/HGIu7xG93f3WNBYSin0JsYM0AcrnR9UBEQ8UHKNQB
 onvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3etV/eCXs/QEEv035i5xpg0ZJg2YmCMmzzY7WJ0JXuoO6HWzAMV6J1nZhhU98xppUgjGibYEPOeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKYD5WP5Lj4Bve4ducmp68LGPHITHQgDM7KejJH6VwSUWISs4W
 4NSxJPMLErJblRkDICxkDQMKIu/XceqYYUzLcSBkKDoOerO2XPOkA7bWHrbjqdY=
X-Gm-Gg: ASbGnctkFlHOvjwSJKakGc0wTFqBpe7cbkifGg6uadXuYHQp+8vficgrkLyz/5iJyoT
 pNQoERy+3ZPrtO1xstYqibv+WMcQynYyIwyUg7PjlirOhR/0NB4853IqZ5BFEbRPRDDvMkQqdfC
 5hVGeHTJ5K4Z8hApFmwHq4AGtL+Jj2BCwmUV7FkzJ0lw7BDKWkWJ/M8PXI/DepUGH6vwFsdIYCI
 Uy1xkrktg1VjJ4berg6SXd5Eq45A/WNAL5CyDz52+TVg3K2K/J1CuQTm+fh2OueZAAhGStcLo7R
 SvdMt9XPBIGk0YH6PcmGgZhDAHr+5p7L4e5JZM6ZmFNuUOtNwnsUdofM5q/wF/UVkYDTznGh5/1
 UtkgPBg==
X-Google-Smtp-Source: AGHT+IF3N0HBb4ltf2zBecIFj5x7J4NwmcVlVNLZd7wW8E14jB9yl9ngbFhq5O6DA0Qg+LTZLwm3ww==
X-Received: by 2002:a05:6512:3d19:b0:545:ea9:1a19 with SMTP id
 2adb3069b0e04-5494c10c72bmr1255712e87.5.1740737873802; 
 Fri, 28 Feb 2025 02:17:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417b62asm441359e87.85.2025.02.28.02.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:17:52 -0800 (PST)
Date: Fri, 28 Feb 2025 12:17:49 +0200
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
Message-ID: <fje7r73olswfx5kbkvnlyvlhv3oqnj3ki26i2brb5fbuewfc3x@jsaz73zsd6rc>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
 <67jiudy4bopd3mzoylj47stuxwc5jdt63akxwn5qqo4dov47za@xcece4v2k3m5>
 <4c81f193-a1d0-4abc-8be5-07c862de8937@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c81f193-a1d0-4abc-8be5-07c862de8937@quicinc.com>
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

On Fri, Feb 28, 2025 at 01:43:12PM +0530, Akhil P Oommen wrote:
> On 2/28/2025 4:56 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 28, 2025 at 01:37:51AM +0530, Akhil P Oommen wrote:
> >> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>
> >> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> >>
> >> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
> >>  4 files changed, 43 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..1820c167fcee609deee3d49e7b5dd3736da23d99 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>  		gpu->ubwc_config.uavflagprd_inv = 2;
> >>  	}
> >>  
> >> +	if (adreno_is_a623(gpu)) {
> >> +		gpu->ubwc_config.highest_bank_bit = 16;
> > 
> > Just to doublecheck, the MDSS patch for QCS8300 used HBB=2, which
> > means 15. Is 16 correct here? Or might the be a mistake in the MDSS
> > patch?
> 
> https://patchwork.freedesktop.org/patch/632957/
> I see HBB=3 here.

Indeed. Excuse me for the noise.

> 
> -Akhil
> 
> > 
> >> +		gpu->ubwc_config.amsbc = 1;
> >> +		gpu->ubwc_config.rgb565_predicator = 1;
> >> +		gpu->ubwc_config.uavflagprd_inv = 2;
> >> +		gpu->ubwc_config.macrotile_mode = 1;
> >> +	}
> >> +
> >>  	if (adreno_is_a640_family(gpu))
> >>  		gpu->ubwc_config.amsbc = 1;
> >>  
> 

-- 
With best wishes
Dmitry
