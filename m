Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FA74A96E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 05:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7BA10E506;
	Fri,  7 Jul 2023 03:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DC810E506
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 03:45:45 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b698937f85so22469591fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 20:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688701544; x=1691293544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=awm4uTN2w0+nFKrnOj6qeSkOmbP/+y1Yw1WjpMGgZlI=;
 b=cdfJdKJrUq2Gyf9E0pwWA3Smkz9TWlki9TN62koG4OUb7bxo+PRA0+nKUchr8PJ7uO
 etWsJRtJwcYaauzN8p93YeawrQ2gvt3SkyZJTEQbiZnTqKOYeTDEoX/uHTvDK1QipY/i
 +Rxgu+ng3TWy9MOFqZlndj5xWDK/P9rsRDzt8DzGUn3xsHGRmrVRCyZbblJ1OtuyZQZH
 q72g5gFVUmdLN3fSVJJwUzr+TNbN3RD7etBVdKeZ8nMqNmj5As4p2LtnPVbqobYobpsk
 cH7nlt6MJJkhbMuOkAOEjLvCpheC1zJxsentkJqeg4WRfBBvjTorcxuQ6FbCFuwyo2sE
 sWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688701544; x=1691293544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=awm4uTN2w0+nFKrnOj6qeSkOmbP/+y1Yw1WjpMGgZlI=;
 b=VfkKFXc/r5hJVEwzqeiHj/fF4eTnaFKyoFWFCEzFsVMzJyRKHTa6laYVl8jfXhvIqX
 sY9rrmTNee0iH2OjIHPz5vZfiIgvUQNn990R3Q43hxQmBP0sWbbTKB+xy15j3GOmuS7P
 FFt1xlki4BqU1H1cz6scjpyZfP7Xr6H+dwZTiY/Fn8CqyjuTnmYdggwQlz9JKWWlTTMu
 bDkxetNaYd4afNciU+8vxxp250wgEy0cjfAVysaHR4erv2NvnbTQ/BdvRXS9W6yJPubf
 D/NT/vtklotqWdVuHLsYzgrtJ7AxxvtszE6rmdx7cbcz/ccAy5whb9esWOCHgGjkaBvM
 qpOg==
X-Gm-Message-State: ABy/qLbDz7urjxWCoNiJVnVOmXfxcRE3IOK5Y7IV2giIzd/9XRCaOxDd
 +s+mGm05E3R/82g10tB+jivk5w==
X-Google-Smtp-Source: APBJJlGj4frn071DAA8E8xMGMq9NhYes8UxNxU5z1k+gMPlF0Q+IjYvLCKJv60EclOvCTyTHJUnzfg==
X-Received: by 2002:a05:6512:ea0:b0:4f8:752f:df48 with SMTP id
 bi32-20020a0565120ea000b004f8752fdf48mr3778582lfb.29.1688701543691; 
 Thu, 06 Jul 2023 20:45:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k2-20020ac24562000000b004fb12e0c3eesm493986lfm.193.2023.07.06.20.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 20:45:43 -0700 (PDT)
Message-ID: <ab9f2c65-deb4-1762-4a32-a7046608311e@linaro.org>
Date: Fri, 7 Jul 2023 06:45:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 12/12] drm/msm/adreno: Switch to chip-id for
 identifying GPU
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-13-robdclark@gmail.com>
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
> Since the revision becomes an opaque identifier with future GPUs, move
> away from treating different ranges of bits as having a given meaning.
> This means that we need to explicitly list different patch revisions in
> the device table.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |   2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  11 +-
>   drivers/gpu/drm/msm/adreno/a5xx_power.c    |   2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  13 ++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   9 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 128 ++++++++++-----------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  16 +--
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  51 ++++----
>   8 files changed, 122 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 715436cb3996..8b4cdf95f445 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -145,7 +145,7 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_HLSQ, 0x00220000);
>   	/* Early A430's have a timing issue with SP/TP power collapse;
>   	   disabling HW clock gating prevents it. */
> -	if (adreno_is_a430(adreno_gpu) && adreno_gpu->rev.patchid < 2)
> +	if (adreno_is_a430(adreno_gpu) && adreno_patchid(adreno_gpu) < 2)
>   		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0);
>   	else
>   		gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0xAAAAAAAA);
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index f0803e94ebe5..70d2b5342cd9 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1744,6 +1744,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct platform_device *pdev = priv->gpu_pdev;
>   	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct adreno_info *info;
>   	struct a5xx_gpu *a5xx_gpu = NULL;
>   	struct adreno_gpu *adreno_gpu;
>   	struct msm_gpu *gpu;
> @@ -1770,7 +1771,15 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>   
>   	nr_rings = 4;
>   
> -	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
> +	/*
> +	 * Note that we wouldn't have been able to get this far if there is not
> +	 * a device table entry for this chip_id
> +	 */
> +	info = adreno_find_info(config->chip_id);
> +	if (WARN_ON(!info))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (info->revn == 510)
>   		nr_rings = 1;
>   
>   	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> index 0e63a1429189..7705f8010484 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> @@ -179,7 +179,7 @@ static void a540_lm_setup(struct msm_gpu *gpu)
>   
>   	/* The battery current limiter isn't enabled for A540 */
>   	config = AGC_LM_CONFIG_BCL_DISABLED;
> -	config |= adreno_gpu->rev.patchid << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
> +	config |= adreno_patchid(adreno_gpu) << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
>   
>   	/* For now disable GPMU side throttling */
>   	config |= AGC_LM_CONFIG_THROTTLE_DISABLE;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index f1bb20574018..a9ba547a120c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -790,10 +790,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
>   		(1 << 31) | (0xa << 18) | (0xa0));
>   
> -	chipid = adreno_gpu->rev.core << 24;
> -	chipid |= adreno_gpu->rev.major << 16;
> -	chipid |= adreno_gpu->rev.minor << 12;
> -	chipid |= adreno_gpu->rev.patchid << 8;
> +	/* Note that the GMU has a slightly different layout for
> +	 * chip_id, for whatever reason, so a bit of massaging
> +	 * is needed.  The upper 16b are the same, but minor and
> +	 * patchid are packed in four bits each with the lower
> +	 * 8b unused:
> +	 */
> +	chipid  = adreno_gpu->chip_id & 0xffff0000;
> +	chipid |= (adreno_gpu->chip_id << 4) & 0xf000; /* minor */
> +	chipid |= (adreno_gpu->chip_id << 8) & 0x0f00; /* patchid */

I'd beg for explicit FIELD_GET and FIELD_PREP here.

>   
>   	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 77b23c004b94..ed075729ca09 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2344,10 +2344,13 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	/*
>   	 * We need to know the platform type before calling into adreno_gpu_init
>   	 * so that the hw_apriv flag can be correctly set. Snoop into the info
> -	 * and grab the revision number
> +	 * and grab the revision number.
> +	 *
> +	 * Note that we wouldn't have been able to get this far if there is not
> +	 * a device table entry for this chip_id

Having seen this note twice, shouldn't we explicitly pass adreno_info to 
our aNxx_gpu_init() functions and then further to adreno_gpu_init()?

>   	 */
> -	info = adreno_info(config->rev);
> -	if (!info)
> +	info = adreno_find_info(config->chip_id);
> +	if (WARN_ON(!info))
>   		return ERR_PTR(-EINVAL);
>   
>   	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fd2e183bce60..4a718ff33635 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -22,7 +22,7 @@ module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
>   
>   static const struct adreno_info gpulist[] = {
>   	{
> -		.rev   = ADRENO_REV(2, 0, 0, 0),
> +		.chip_ids = ADRENO_CHIP_IDS(0x02000000),

This begs to use bit masks, but see below

>   		.family = ADRENO_2XX_GEN1,
>   		.revn  = 200,
>   		.fw = {

[skipped]

> @@ -77,7 +77,11 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a3xx_gpu_init,
>   	}, {
> -		.rev   = ADRENO_REV(3, 2, ANY_ID, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(
> +			0x03020000,
> +			0x03020001,
> +			0x03020002

definitely a bitmask would help

> +		),
>   		.family = ADRENO_3XX,
>   		.revn  = 320,
>   		.fw = {

[skipped the rest]

> @@ -494,31 +502,16 @@ MODULE_FIRMWARE("qcom/a630_sqe.fw");
>   MODULE_FIRMWARE("qcom/a630_gmu.bin");
>   MODULE_FIRMWARE("qcom/a630_zap.mbn");
>   
> -static inline bool _rev_match(uint8_t entry, uint8_t id)
> -{
> -	return (entry == ANY_ID) || (entry == id);
> -}
> -
> -bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
> -{
> -
> -	return _rev_match(rev1.core, rev2.core) &&
> -		_rev_match(rev1.major, rev2.major) &&
> -		_rev_match(rev1.minor, rev2.minor) &&
> -		_rev_match(rev1.patchid, rev2.patchid);
> -}
> -
> -const struct adreno_info *adreno_info(struct adreno_rev rev)
> +const struct adreno_info *adreno_find_info(uint32_t chip_id)
>   {
> -	int i;
> -
>   	/* identify gpu: */
> -	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
> +	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
>   		const struct adreno_info *info = &gpulist[i];
>   		if (info->machine && !of_machine_is_compatible(info->machine))
>   			continue;
> -		if (adreno_cmp_rev(info->rev, rev))
> -			return info;
> +		for (int j = 0; info->chip_ids[j]; j++)
> +			if (info->chip_ids[j] == chip_id)
> +				return info;
>   	}
>   
>   	return NULL;
> @@ -598,12 +591,11 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>   	return NULL;
>   }
>   
> -static int find_chipid(struct device *dev, struct adreno_rev *rev)
> +static int find_chipid(struct device *dev, uint32_t *chipid)
>   {
>   	struct device_node *node = dev->of_node;
>   	const char *compat;
>   	int ret;
> -	u32 chipid;
>   
>   	/* first search the compat strings for qcom,adreno-XYZ.W: */
>   	ret = of_property_read_string_index(node, "compatible", 0, &compat);
> @@ -612,32 +604,34 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
>   
>   		if (sscanf(compat, "qcom,adreno-%u.%u", &r, &patch) == 2 ||
>   		    sscanf(compat, "amd,imageon-%u.%u", &r, &patch) == 2) {
> -			rev->core = r / 100;
> +			uint32_t core, major, minor;
> +
> +			core = r / 100;
>   			r %= 100;
> -			rev->major = r / 10;
> +			major = r / 10;
>   			r %= 10;
> -			rev->minor = r;
> -			rev->patchid = patch;
> +			minor = r;
> +
> +			*chipid = (core << 24) |
> +				(major << 16) |
> +				(minor << 8) |
> +				patch;

This starts to look realy crazy. I'd repeat my suggestion of moving 
towards of_device match data. This would result in some duplication, 
we'd have to explicitly list all supported compatibles in the 
of_match_table. But then we can drop all the CHIPID lists from device 
table and/or manual parsing of the chipid from the compat field.

This way we can have per-SoC overrides, etc.

>   
>   			return 0;
>   		}
> +
> +		if (sscanf(compat, "qcom,adreno-%08x", chipid) == 1)
> +			return 0;
>   	}
>   
>   	/* and if that fails, fall back to legacy "qcom,chipid" property: */
> -	ret = of_property_read_u32(node, "qcom,chipid", &chipid);
> +	ret = of_property_read_u32(node, "qcom,chipid", chipid);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
>   		return ret;
>   	}
>   
> -	rev->core = (chipid >> 24) & 0xff;
> -	rev->major = (chipid >> 16) & 0xff;
> -	rev->minor = (chipid >> 8) & 0xff;
> -	rev->patchid = (chipid & 0xff);
> -
>   	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
> -	dev_warn(dev, "Use compatible qcom,adreno-%u%u%u.%u instead.\n",
> -		rev->core, rev->major, rev->minor, rev->patchid);
>   
>   	return 0;
>   }
> @@ -651,22 +645,22 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   	struct msm_gpu *gpu;
>   	int ret;
>   
> -	ret = find_chipid(dev, &config.rev);
> +	ret = find_chipid(dev, &config.chip_id);
>   	if (ret)
>   		return ret;
>   
>   	dev->platform_data = &config;
>   	priv->gpu_pdev = to_platform_device(dev);
>   
> -	info = adreno_info(config.rev);
> +	info = adreno_find_info(config.chip_id);
>   
>   	if (!info) {
>   		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
> -			ADRENO_CHIPID_ARGS(config.rev));
> +			ADRENO_CHIPID_ARGS(config.chip_id));
>   		return -ENXIO;
>   	}
>   
> -	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
> +	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.chip_id));
>   
>   	priv->is_a2xx = info->family < ADRENO_3XX;
>   	priv->has_cached_coherent =
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1a982a926f21..1274609a74b1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -326,10 +326,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>   		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
>   		return 0;
>   	case MSM_PARAM_CHIP_ID:
> -		*value =  (uint64_t)adreno_gpu->rev.patchid |
> -			 ((uint64_t)adreno_gpu->rev.minor << 8) |
> -			 ((uint64_t)adreno_gpu->rev.major << 16) |
> -			 ((uint64_t)adreno_gpu->rev.core  << 24);
> +		*value = adreno_gpu->chip_id;
>   		if (!adreno_gpu->info->revn)
>   			*value |= ((uint64_t) adreno_gpu->speedbin) << 32;
>   		return 0;
> @@ -849,7 +846,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>   
>   	drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
>   			adreno_gpu->info->revn,
> -			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
> +			ADRENO_CHIPID_ARGS(adreno_gpu->chip_id));
>   	/*
>   	 * If this is state collected due to iova fault, so fault related info
>   	 *
> @@ -922,7 +919,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
>   
>   	printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
>   			adreno_gpu->info->revn,
> -			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
> +			ADRENO_CHIPID_ARGS(adreno_gpu->chip_id));
>   
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct msm_ringbuffer *ring = gpu->rb[i];
> @@ -1072,14 +1069,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	struct adreno_platform_config *config = dev->platform_data;
>   	struct msm_gpu_config adreno_gpu_config  = { 0 };
>   	struct msm_gpu *gpu = &adreno_gpu->base;
> -	struct adreno_rev *rev = &config->rev;
>   	const char *gpu_name;
>   	u32 speedbin;
>   	int ret;
>   
>   	adreno_gpu->funcs = funcs;
> -	adreno_gpu->info = adreno_info(config->rev);
> -	adreno_gpu->rev = *rev;
> +	adreno_gpu->info = adreno_find_info(config->chip_id);
> +	adreno_gpu->chip_id = config->chip_id;
>   
>   	/* Only handle the core clock when GMU is not in use (or is absent). */
>   	if (adreno_has_gmu_wrapper(adreno_gpu) ||
> @@ -1104,7 +1100,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>   
>   	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
> -			ADRENO_CHIPID_ARGS(config->rev));
> +			ADRENO_CHIPID_ARGS(config->chip_id));
>   	if (!gpu_name)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 73e7155f164c..18f53c7ab589 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -54,23 +54,15 @@ enum adreno_family {
>   #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>   #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>   
> -struct adreno_rev {
> -	uint8_t  core;
> -	uint8_t  major;
> -	uint8_t  minor;
> -	uint8_t  patchid;
> -};
> -
> -#define ANY_ID 0xff
> -
> -#define ADRENO_REV(core, major, minor, patchid) \
> -	((struct adreno_rev){ core, major, minor, patchid })
> -
>   /* Helper for formating the chip_id in the way that userspace tools like
>    * crashdec expect.
>    */
>   #define ADRENO_CHIPID_FMT "u.%u.%u.%u"
> -#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
> +#define ADRENO_CHIPID_ARGS(_c) \
> +	(((_c) >> 24) & 0xff), \
> +	(((_c) >> 16) & 0xff), \
> +	(((_c) >> 8)  & 0xff), \
> +	((_c) & 0xff)

So, we still have some meaning for chipid?

>   
>   struct adreno_gpu_funcs {
>   	struct msm_gpu_funcs base;
> @@ -87,7 +79,12 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>   
>   struct adreno_info {
>   	const char *machine;
> -	struct adreno_rev rev;
> +	/**
> +	 * @chipids: Table of matching chip-ids
> +	 *
> +	 * Terminated with 0 sentinal
> +	 */
> +	uint32_t *chip_ids;
>   	enum adreno_family family;
>   	uint32_t revn;
>   	const char *fw[ADRENO_FW_MAX];
> @@ -107,6 +104,8 @@ struct adreno_info {
>   	uint32_t *speedbins;
>   };
>   
> +#define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> +
>   /*
>    * Helper to build a speedbin table, ie. the table:
>    *      fuse | speedbin
> @@ -125,12 +124,12 @@ struct adreno_info {
>    */
>   #define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
>   
> -const struct adreno_info *adreno_info(struct adreno_rev rev);
> +const struct adreno_info *adreno_find_info(uint32_t chip_id);
>   
>   struct adreno_gpu {
>   	struct msm_gpu base;
> -	struct adreno_rev rev;
>   	const struct adreno_info *info;
> +	uint32_t chip_id;
>   	uint16_t speedbin;
>   	const struct adreno_gpu_funcs *funcs;
>   
> @@ -179,7 +178,7 @@ struct adreno_ocmem {
>   
>   /* platform config data (ie. from DT, or pdata) */
>   struct adreno_platform_config {
> -	struct adreno_rev rev;
> +	uint32_t chip_id;
>   };
>   
>   #define ADRENO_IDLE_TIMEOUT msecs_to_jiffies(1000)
> @@ -196,7 +195,15 @@ struct adreno_platform_config {
>   	__ret;                                             \
>   })
>   
> -bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
> +static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
> +{
> +	/* It is probably ok to assume legacy "adreno_rev" format
> +	 * for all a6xx devices, but probably best to limit this
> +	 * to older things.
> +	 */
> +	WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
> +	return gpu->chip_id & 0xff;
> +}
>   
>   static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
>   {
> @@ -252,7 +259,7 @@ static inline bool adreno_is_a330(const struct adreno_gpu *gpu)
>   
>   static inline bool adreno_is_a330v2(const struct adreno_gpu *gpu)
>   {
> -	return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
> +	return adreno_is_a330(gpu) && (adreno_patchid(gpu) > 0);
>   }
>   
>   static inline int adreno_is_a405(const struct adreno_gpu *gpu)
> @@ -342,8 +349,7 @@ static inline int adreno_is_a650(const struct adreno_gpu *gpu)
>   
>   static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
>   {
> -	/* The order of args is important here to handle ANY_ID correctly */
> -	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
> +	return gpu->info->chip_ids[0] == 0x06030500;

Ugh. The thing that bugs me isn't even the manual comparison of 
chip_ids[0], but the fact that these two platforms stand aside. I think 
at the end we should have a single mechanism for checking GPU's SKUs.

Or maybe we should get rid of that completely.

If we get rid of a single gpulist table and move individual GPU info 
definitions to aNxx_gpu.c, we can subclass a generic info structure with 
generation-specific data, for example generation-specific quirks, 
pointers to hcwg or VBIF registers, etc. And then instead of having 
adreno_is_foo all over the code we can migrate most of these checks to 
data in the gpu info data.

>   }
>   
>   static inline int adreno_is_a660(const struct adreno_gpu *gpu)
> @@ -358,8 +364,7 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
>   
>   static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>   {
> -	/* The order of args is important here to handle ANY_ID correctly */
> -	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
> +	return gpu->info->chip_ids[0] == 0x06090000;
>   };
>   /* check for a615, a616, a618, a619 or any a630 derivatives */
>   static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)

-- 
With best wishes
Dmitry

