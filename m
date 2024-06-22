Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDB913364
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 13:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3471F10E0C1;
	Sat, 22 Jun 2024 11:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r/0tc3j8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8910E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 11:36:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57d1d45ba34so3094618a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719056185; x=1719660985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=u6wfr0S9+fsOlMf3RkRBuzql0gOh9CqWkH+b8NMxbmM=;
 b=r/0tc3j8piOIaMR8MAORwELfIyzhpR/QJa15WBzyr5mD5Nb5DOFjkhslwIZiy6JzF3
 9f94pkn1yhDQV5C69vxB5uK1gbqcBAc9oL6ik36djp6KEzbAaJE+SV772JgjtP58gE5m
 lPDRaN3jcRUhKkH2iRxJgiGWJ8e6OwZLkz+QIWBvfzkVk4hkRJb5dVahXsJvd0u8bzH4
 gy+WKHi9mHoQm+u12x6G3Ffs9gEDKIiXZOqJIp9FtC0NLNhqOYcAR5vu28MOqJ4SGKX2
 LINlFiHCNCw4ZE49i7TEIq3e4yaqzanXfhGheHdiSNrmP4hkH3HuNP0Ezhxk+1OnZ6FU
 88jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719056185; x=1719660985;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6wfr0S9+fsOlMf3RkRBuzql0gOh9CqWkH+b8NMxbmM=;
 b=tg3PK2lvDR0sJtFrgi6PH8C26G+t6HNbsTWS3O910GaCqoHZofUkR2ijf+Neu6YttE
 ek2YwUOdbRyVl2N3nTJ2VZiHXaZLPZ4WNFw4sk0ay+V4xqz+ljopFwk23upnlYe8uCb+
 whg3VkSPK1pFJ2Pra7xDiE7sLMPJcxF3YYDdthJvDMwcXRwv0/dSPXN0sb1M2SLjxCjP
 RBFu7qfcM4nIWVTuQ9a44hgfjH9PbJ/YCM4ooOxyCABsgbP0bT04fR/Q24iK0Eqz+1WJ
 ykS3SZ6QqoMHeG/yXUpXhEfzBfqXeN20oPoNe4Cc5BWEWA3xoD2kZtFIl6bKsiJ5WoZQ
 8jNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+je5lEzboEsFTiGWqxbzy//BEdxnCUzCUFYT/gSxSIC6LwSuU6Xbqx9kmqTP6T/3xM8MLlkpVmrrbSGuChj7Vwjc49BL9TEuVVP7iYCUd
X-Gm-Message-State: AOJu0Yx7041yiIy+/u3r8oxcTaM/nHvesq8KcxZgFjILKx5yMyJ9zJU5
 qqwJ8eH82mFMGl6k4nhqSrd0sPOxDz9TU5WUnipKv4K6Nl8IXiSGYscNoIQgl8k=
X-Google-Smtp-Source: AGHT+IGiyxyJo9S45AX2gFdLrwEPplMh594cnMlpnEEDnPdXzZGClOfjS3xMNoFgxGj0WVyeWcI7/g==
X-Received: by 2002:a50:cd99:0:b0:57d:59c:8e03 with SMTP id
 4fb4d7f45d1cf-57d07e66c94mr5933483a12.7.1719056184801; 
 Sat, 22 Jun 2024 04:36:24 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30466608sm2264555a12.49.2024.06.22.04.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jun 2024 04:36:24 -0700 (PDT)
Message-ID: <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
Date: Sat, 22 Jun 2024 13:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: Add A306A support
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 20240618164303.66615-1-robdclark@gmail.com
References: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 20.06.2024 11:52 PM, Barnabás Czémán wrote:
> From: Otto Pflüger <otto.pflueger@abscue.de>
> 
> Add support for Adreno 306A GPU what is found in MSM8917 SoC.
> This GPU marketing name is Adreno 308.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> [use internal name of the GPU, reword the commit message]
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
> Changes in v2:
> - Rebase on https://patchwork.freedesktop.org/series/127393/
> - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> index 0de8465b6cf0..61aeac5054a2 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
>  		.gmem  = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
> +		.family = ADRENO_3XX,
> +		.revn  = 308,

Double space

> +		.fw = {
> +			[ADRENO_FW_PM4] = "a300_pm4.fw",
> +			[ADRENO_FW_PFP] = "a300_pfp.fw",
> +		},
> +		.gmem  = SZ_128K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init  = a3xx_gpu_init,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(
>  			0x03020000,
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 5273dc849838..b46ff49f47cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a);
> +	} else if (adreno_is_a306a(adreno_gpu)) {
> +		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
> +		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010);
> +		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010);
>  	} else if (adreno_is_a320(adreno_gpu)) {
>  		/* Set up 16 deep read/write request queues: */
>  		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010);
> @@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
>  
>  	/* Enable Clock gating: */
> -	if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
> +	if (adreno_is_a305b(adreno_gpu) ||
> +	    adreno_is_a306(adreno_gpu) ||
> +	    adreno_is_a306a(adreno_gpu))
>  		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
>  	else if (adreno_is_a320(adreno_gpu))
>  		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
> @@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
>  
>  	/* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
> -	if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
> -			adreno_is_a320(adreno_gpu)) {
> +	if (adreno_is_a305(adreno_gpu) ||
> +	    adreno_is_a306(adreno_gpu) ||
> +	    adreno_is_a306a(adreno_gpu) ||
> +	    adreno_is_a320(adreno_gpu)) {
>  		gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
>  				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
>  				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b8ee9320a315..3b361a077688 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -292,6 +292,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
>  	return adreno_is_revn(gpu, 307);
>  }
>  
> +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
> +{
> +	/* a306a marketing name is a308 */

"marketing name is a308" could use a (), but it's me being picky..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

> +	return adreno_is_revn(gpu, 308);
> +}
> +
>  static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
>  {
>  	return adreno_is_revn(gpu, 320);
> 
> ---
> base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> change-id: 20240528-a306a-48e173724d6c
> prerequisite-message-id: <20240618164303.66615-1-robdclark@gmail.com>
> prerequisite-patch-id: b26cd6e5aa23ea623fec94f938a06d1e3359de55
> prerequisite-patch-id: 301e8fe4c2687a4606ee7debce95a5ada732e27f
> prerequisite-patch-id: 24a5654d9b52079c010b0594d8599d84af1659c7
> prerequisite-patch-id: b09a3d28d04b7ebe968e05835ebf8397c27f8d7d
> prerequisite-patch-id: a74556e25862c22f0ec543b8a7c7d92cb2e55099

b4 is amazing

Konrad
