Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4174A7D1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 01:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7AF10E4DE;
	Thu,  6 Jul 2023 23:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BE810E4DE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 23:36:39 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so19825921fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 16:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688686597; x=1691278597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=euv7f8ARheGaXwXtLBu6U1xCp5/neqPph2hJsSKAGew=;
 b=GQ1FLWdE9yyutJdKSwxHIwSQdWOECEyGgwOvo2G2c1kFxXZVWNcBpwaynqC5w8VHX7
 zYHZu4MpUuHUECLFL8yx4iU32R4n79N22k6jTHZZE/cNa1JXSWS3OBd0uRe0YYZ2vGYr
 vLO4xP19xFxjAu2PSHoyhx0gLusOgCaBr5LwCsDSAReWws/AbcAXy5doOD4em1aAe2pG
 qyUyQXlydwB3pewV8ccXgdKf4kre5BWb0qG8uIpStKQo0wxJyXkVLSCfbnKj1pspKf7k
 Gd+1Rlu1pW2JmAMCqF3DhSeCLNuJkoHydpiArUigH5RdyW4OTNs83B7AOSsmQOugOlxP
 4bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688686597; x=1691278597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=euv7f8ARheGaXwXtLBu6U1xCp5/neqPph2hJsSKAGew=;
 b=SpSJtDdcdpqz4VfLY0ADeOuE4GC9UPgdaDoy2ecV1bZbjwajjT0b4a5g1mK+CzcP5e
 Yu8wSPZc0EHsFX7J8OaIZ2YNTGFxi1cRhokZWp6KSvrNFeaKjWBF5lyHHQey9LXi5WJc
 LmDqyUXaY5AQHH2IcVfAlgjhsck5KX+oXcnaBErRKYqfBTgGwzITZp8cSPuCv0p9YbVN
 hGhMZ1JML630Q3m30443N/Vkm0NQXI+y0XPvC74gDouTOccypc8p/piIIUIaiAGKPJbo
 l4EXsotv3+RLhBLgad9CMAziz52O8Dv6yS9xEkFFnLHtEngw6gT1jLsCbGqv3Vn1eFiP
 G2bA==
X-Gm-Message-State: ABy/qLZQRkACqEv8JR3n4or7GNivXVkUnbVS3JvOLvkiqvzg+yRPrIRt
 Ox4FxOAJp4zXWOy6dTTR7QYKUw==
X-Google-Smtp-Source: APBJJlEb4r0Si3qmIELvkjgrzxV6DfOmQPvSXJ6TMr0KbjjeAXJS2eldVA1fX9NSscBGYsac1lHkpQ==
X-Received: by 2002:a2e:9f42:0:b0:2b6:e625:ba55 with SMTP id
 v2-20020a2e9f42000000b002b6e625ba55mr2671815ljk.41.1688686596997; 
 Thu, 06 Jul 2023 16:36:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a2e8e8f000000b002b6eeb204a1sm517906ljk.83.2023.07.06.16.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:36:36 -0700 (PDT)
Message-ID: <1ecc63d0-db62-c8aa-74b7-36ad2eff89a1@linaro.org>
Date: Fri, 7 Jul 2023 01:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/12] drm/msm/adreno: Add helper for formating chip-id
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-11-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-11-robdclark@gmail.com>
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
> This is used in a few places, including one that is parsed by userspace
> tools.  So let's standardize it a bit better.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Userspace parsed this weird string instead of the hex-based chipid?

weird^2

Konrad
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
>  3 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index dcd6363ac7b0..fd2e183bce60 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -661,14 +661,12 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  	info = adreno_info(config.rev);
>  
>  	if (!info) {
> -		dev_warn(drm->dev, "Unknown GPU revision: %u.%u.%u.%u\n",
> -			config.rev.core, config.rev.major,
> -			config.rev.minor, config.rev.patchid);
> +		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
> +			ADRENO_CHIPID_ARGS(config.rev));
>  		return -ENXIO;
>  	}
>  
> -	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
> -		config.rev.minor, config.rev.patchid);
> +	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
>  
>  	priv->is_a2xx = info->family < ADRENO_3XX;
>  	priv->has_cached_coherent =
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 75ff7fb46099..1a982a926f21 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -847,10 +847,9 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  	if (IS_ERR_OR_NULL(state))
>  		return;
>  
> -	drm_printf(p, "revision: %d (%d.%d.%d.%d)\n",
> -			adreno_gpu->info->revn, adreno_gpu->rev.core,
> -			adreno_gpu->rev.major, adreno_gpu->rev.minor,
> -			adreno_gpu->rev.patchid);
> +	drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
> +			adreno_gpu->info->revn,
> +			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
>  	/*
>  	 * If this is state collected due to iova fault, so fault related info
>  	 *
> @@ -921,10 +920,9 @@ void adreno_dump_info(struct msm_gpu *gpu)
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	int i;
>  
> -	printk("revision: %d (%d.%d.%d.%d)\n",
> -			adreno_gpu->info->revn, adreno_gpu->rev.core,
> -			adreno_gpu->rev.major, adreno_gpu->rev.minor,
> -			adreno_gpu->rev.patchid);
> +	printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
> +			adreno_gpu->info->revn,
> +			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
>  
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct msm_ringbuffer *ring = gpu->rb[i];
> @@ -1105,9 +1103,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		speedbin = 0xffff;
>  	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>  
> -	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> -			rev->core, rev->major, rev->minor,
> -			rev->patchid);
> +	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
> +			ADRENO_CHIPID_ARGS(config->rev));
>  	if (!gpu_name)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 2fa14dcd4e40..73e7155f164c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -66,6 +66,12 @@ struct adreno_rev {
>  #define ADRENO_REV(core, major, minor, patchid) \
>  	((struct adreno_rev){ core, major, minor, patchid })
>  
> +/* Helper for formating the chip_id in the way that userspace tools like
> + * crashdec expect.
> + */
> +#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
> +#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
> +
>  struct adreno_gpu_funcs {
>  	struct msm_gpu_funcs base;
>  	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
