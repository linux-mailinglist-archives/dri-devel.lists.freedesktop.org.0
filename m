Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7C74A90D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1ED410E4FC;
	Fri,  7 Jul 2023 02:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD82110E4FC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:34:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso2071597e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 19:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688697245; x=1691289245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=joFEIJYwJ9prgByPaM++zgy7OKURshJuMGk0XOkie38=;
 b=SU/Y9wMN3CrTHTtJpwCVq1VlnKEwCU1oJePIKRdl8/dkZnNZL8OU2EJ0ga+x7Lppti
 f/Bxi8wE7YfJfu+p24a+7scS3C8tQi/LAlYbnzifEAe6Y8wX4rbmADNymNlRPLO1R2Lg
 6iJF5HSbklny7oSGycx/RfMn2/f08H8z5UbD81J0WMGxSqF+xazzlTjfFH+ei+nJAzcY
 dTjHk7dkpa5BONloTZlhTwM3PK/Hh95e9hdaRgOn+GvV3Hh7E6jktF26fynJdQeK0QM4
 TUpyXmxyCBiX3IbelKcYxLLKdsXAJqZCK/LnZ0W5evw72ajNvr9Tl6R5n05kUYmfNwB0
 i4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688697245; x=1691289245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=joFEIJYwJ9prgByPaM++zgy7OKURshJuMGk0XOkie38=;
 b=cIwHEPgvGeR18xNTjpeGTgGf11nM7eLUbw+YsoJvF+pf27F50/H2FKpq4WU6TqFKSF
 AFyBl+YYQhr9yI2u42Q3YIOwDRV6oaEtfWeqgrrVUBofq8/6Op2kGj7mIh/fAeR9d5qg
 G4+PKldozwkY780m6OtWKjHxaZbiZijYm9A8u4ADfBoxV5zt2tgTTtEZeZofBUxXgje5
 /lpUfSWWYQLlKA6vaH838Nk17mpwk3V9VO6LRQoAvADHw/zf7dKbLwQULIPqdF2uRQbW
 PwBW3dY7lSG0HsBRXxD33GyvCF0Jo0rTuowupVZ8j9SZINzu/BRZ0lfVXG5IhdwIwfIh
 b87w==
X-Gm-Message-State: ABy/qLY5VNmw1IO/M1NhpCxLUL8y5GpykbnSdXifHXffwNZgUPchoHrK
 7S+lxyDZTzBsBuHrMBZq22B+Aw==
X-Google-Smtp-Source: APBJJlEQESvvNhG8j6F2bdX/BrwMLgd8oRj8YoKjkRJc2vCArcoq4RvrBIWVCj7DUGPBsd3CPjFSWw==
X-Received: by 2002:a05:6512:785:b0:4fb:8616:7a03 with SMTP id
 x5-20020a056512078500b004fb86167a03mr2619963lfr.4.1688697244848; 
 Thu, 06 Jul 2023 19:34:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t21-20020ac24c15000000b004f858249931sm487188lfq.93.2023.07.06.19.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:34:04 -0700 (PDT)
Message-ID: <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
Date: Fri, 7 Jul 2023 05:34:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-7-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> There are cases where there are differences due to SoC integration.
> Such as cache-coherency support, and (in the next patch) e-fuse to
> speedbin mappings.

I have the feeling that we are trying to circumvent the way DT works. 
I'd suggest adding explicit SoC-compatible strings to Adreno bindings 
and then using of_device_id::data and then of_device_get_match_data().

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>   2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 3c531da417b9..e62bc895a31f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>   		.init = a6xx_gpu_init,
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
>   	}, {
>   		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
>   		.revn = 619,
> @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
>   	/* identify gpu: */
>   	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
>   		const struct adreno_info *info = &gpulist[i];
> +		if (info->machine && !of_machine_is_compatible(info->machine))
> +			continue;
>   		if (adreno_cmp_rev(info->rev, rev))
>   			return info;
>   	}
> @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   		config.rev.minor, config.rev.patchid);
>   
>   	priv->is_a2xx = config.rev.core == 2;
> +	priv->has_cached_coherent =
> +		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>   
>   	gpu = info->init(drm);
>   	if (IS_ERR(gpu)) {
> @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   	if (ret)
>   		return ret;
>   
> -	priv->has_cached_coherent =
> -		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> -		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e08d41337169..d5335b99c64c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
>   extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>   
>   struct adreno_info {
> +	const char *machine;
>   	struct adreno_rev rev;
>   	uint32_t revn;
>   	const char *fw[ADRENO_FW_MAX];

-- 
With best wishes
Dmitry

