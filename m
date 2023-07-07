Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB7C74A835
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1410E12B;
	Fri,  7 Jul 2023 00:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D510E4E2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 00:40:51 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b70bfc8db5so5954651fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 17:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688690449; x=1691282449;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=caCtxzCdioSZM20BV9njtI8LqLV4HbK9TzfZKIX/D+8=;
 b=NpCp6C39vRLqzNhjoLrSZl231ULplD2bva129qo+DPqFOeQ1jWM+ILKqmK/5Uphjbr
 ydeIdKSakcHVjCOOmmncdJ4emzXyS5Rn3ccUVqe6PPStQye/B5uU7bG8ZoBCI10ZMDoH
 sXXuOEFsAyYHwUfOFZ40ZmuCMnVNZsZMS9QbrydgATGRD4403OA+f/sXsBUyN2lwl2t8
 lIk0QIh8tG2gNHXVz4ap07xoGeENWSpqj4434GtsW3zuZf8pLelqy7/gcxjvq/iyGmQV
 GDYYHJy8567zJ0R9k7waNV9W+BJoOkuIJqZ6u7dy9s7yIFd6jp5NJOLAoy4kSUtn2Arp
 GT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688690449; x=1691282449;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=caCtxzCdioSZM20BV9njtI8LqLV4HbK9TzfZKIX/D+8=;
 b=fTBCzg9povdTq0HwNC6P6ua9e+pHkVr/mluDvr3w597SWRUhFK+tTPoeDnhuguuSkd
 QPAgZoaBoRvIWmSn7YEq8LkUMiMxyu7//IjRzcsMaCjLrCwieF9z9Yf1vDr99K7aJgSP
 KvkpvAf5lOAJn4i2BxfesUxBmLREHQvRBsO/TzL7vpMjZDiMQqJ4i5fTrM4HnwP6pb0x
 UX/LsFcKDsBx/HADpBZGnk/o6YSqFfFgkJzbTz5egDbfcKXckVwJEeav1kjuVlLhXIMT
 6qwq/mMLSxx8NHc19bMZovjSBOwVjGjKk4a9agfewqdffnL5juAVHEY6je+1d9r5L7o0
 Q2Pg==
X-Gm-Message-State: ABy/qLbZlGX1+2Ofnn8gArV3U1tc3nbhot4IBOOga7ESx4GYlqOK/oP0
 iWf7CI2cLOPGXZgBPYw5o3WKdw==
X-Google-Smtp-Source: APBJJlFLjZSItz4+EEgpANmuYA2UN5Ki56/Etd9V3Fc+BExDCF2PAOZoPbnIsbVABi2fsUQ56AwMnA==
X-Received: by 2002:a2e:a0d7:0:b0:2b6:d63d:cc1e with SMTP id
 f23-20020a2ea0d7000000b002b6d63dcc1emr2386746ljm.51.1688690449330; 
 Thu, 06 Jul 2023 17:40:49 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a2e2405000000b002b6ed0067c9sm535832ljk.116.2023.07.06.17.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 17:40:49 -0700 (PDT)
Message-ID: <8ee1601d-eb39-2d51-ae52-9bb897a96c07@linaro.org>
Date: Fri, 7 Jul 2023 02:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu device table
 entries
In-Reply-To: <20230706211045.204925-7-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> There are cases where there are differences due to SoC integration.
> Such as cache-coherency support, and (in the next patch) e-fuse to
> speedbin mappings.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
of_machine_is_compatible is rather used in extremely desperate
situations :/ I'm not sure this is the correct way to do this..

Especially since there's a direct correlation between GMU presence
and ability to do cached coherent.

The GMU mandates presence of RPMh (as most of what the GMU does is
talk to AOSS through its RSC).

To achieve I/O coherency, there must be some memory that both the
CPU and GPU (and possibly others) can access through some sort of
a negotiator/manager.

In our case, I believe that's LLC. And guess what that implies.
MEMNOC instead of BIMC. And guess what that implies. RPMh!

Now, we know GMU => RPMh, but does it work the other way around?

Yes. GMU wrapper was a hack because probably nobody in the Adreno team
would have imagined that somebody would be crazy enough to fork
multiple year old designs multiple times and release them as new
SoCs with updated arm cores and 5G..

(Except for A612 which has a "Reduced GMU" but that zombie still talks
to RPMh. And A612 is IO-coherent. So I guess it works anyway.)

Konrad

>  drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 3c531da417b9..e62bc895a31f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
> +	}, {
> +		.machine = "qcom,sm4350",
> +		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> +		.revn = 619,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a619_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a615_zap.mdt",
> +		.hwcg = a615_hwcg,
> +	}, {
> +		.machine = "qcom,sm6375",
> +		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> +		.revn = 619,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a619_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a615_zap.mdt",
> +		.hwcg = a615_hwcg,
>  	}, {
>  		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
>  		.revn = 619,
> @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
>  	/* identify gpu: */
>  	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
>  		const struct adreno_info *info = &gpulist[i];
> +		if (info->machine && !of_machine_is_compatible(info->machine))
> +			continue;
>  		if (adreno_cmp_rev(info->rev, rev))
>  			return info;
>  	}
> @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  		config.rev.minor, config.rev.patchid);
>  
>  	priv->is_a2xx = config.rev.core == 2;
> +	priv->has_cached_coherent =
> +		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>  
>  	gpu = info->init(drm);
>  	if (IS_ERR(gpu)) {
> @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> -	priv->has_cached_coherent =
> -		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> -		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e08d41337169..d5335b99c64c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
>  extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>  
>  struct adreno_info {
> +	const char *machine;
>  	struct adreno_rev rev;
>  	uint32_t revn;
>  	const char *fw[ADRENO_FW_MAX];
