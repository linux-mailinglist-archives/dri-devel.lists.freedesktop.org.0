Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4AD79A9B4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 17:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F1510E320;
	Mon, 11 Sep 2023 15:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F22E10E322
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 15:30:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-502a25ab777so4613279e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694446210; x=1695051010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IewnJfJyIc3JF1ZmFRQB+j/PW2AOwYNqv6ATRNcWgHA=;
 b=jsMQiMldfC9bVmyQm7A6iP8W0huNvkxeLaqyN46orqt416NFqMY21LK8URtDX+OXux
 +kXjHPxC80z0bZ0DQ5zhSm2pMySHSHa0YMSB907GieMXtAXs4USVdUjXev5JH+NSHaD2
 wZ1tr6xCH5hQocgDha+VdCz/qkRnTzY0srqGW9uTGKVZxjs9pOLbkih/2LqLz1Rxt0hk
 iahRCShFyNPYBq4tj0ZX/XeHy++a5Syjhdt47XkRjbr4Df9rBvQl/+6etiiAPtQtpsWY
 267n0rqTyJPK9Bh5hO/uca1fS54zF9XGJ+HxY6LrkZzGB9pwmltTwqu1EeUe/A/aAsr1
 hW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694446210; x=1695051010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IewnJfJyIc3JF1ZmFRQB+j/PW2AOwYNqv6ATRNcWgHA=;
 b=tm6kskBgx0XPOWSX8KlxAcX32e+kMeJyUEHlZbeVxTvdKxhJk3R2CcYIDx2m7QVYUU
 G7hhCloapeisl7WrP2vvYEpzTVX3HhHXBbNZh3O1DFty+ghsbby4kG6MuSOvUbkIinm7
 fh+OKpXlVxJKJWXsdc0+qD06LAPxOAJrLLuFOeUiamiJtdno7tMrQyNA2ANyMyQVsXPu
 18PSPKgY+7eJAcgPxnQbX6iNerHCFeyGuXsat/VAHIhCxHQl+1o+lxzmblwd4/ftMdws
 2WZhbS2uw3cTnMag1poMIaIOYgVEjWsEa1B2FZm+t21iC+j4pKGDgojhQIH5x95RAi1t
 w4kw==
X-Gm-Message-State: AOJu0YzPmUiKFzF7Fj3JYo/HYq/VSwzk1rZHGQaCKoxsWT6FcrxqYXwR
 Lt7MENwv0+YQ/0+AxqjMSq1/Vw==
X-Google-Smtp-Source: AGHT+IGk3bVe3SE1qLDOb/MT3TwaHl4EvuUcgJ1iHxbI55reTaiI7wcaDe1/Z2ro+fK9iZ8cENhnaw==
X-Received: by 2002:a05:6512:1592:b0:4fb:fe97:5e35 with SMTP id
 bp18-20020a056512159200b004fbfe975e35mr11258000lfb.47.1694446210474; 
 Mon, 11 Sep 2023 08:30:10 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b00500a4679148sm1383886lfn.20.2023.09.11.08.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 08:30:09 -0700 (PDT)
Message-ID: <e95c5633-8a36-4500-8414-70b7b201a85e@linaro.org>
Date: Mon, 11 Sep 2023 18:30:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] drm/msm/a6xx: Add skeleton A7xx support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
 <20230628-topic-a7xx_drmmsm-v3-5-4ee67ccbaf9d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-5-4ee67ccbaf9d@linaro.org>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2023 15:55, Konrad Dybcio wrote:
> A7xx GPUs are - from kernel's POV anyway - basically another generation
> of A6xx. They build upon the A650/A660_family advancements, skipping some
> writes (presumably more values are preset correctly on reset), adding
> some new ones and changing others.
> 
> One notable difference is the introduction of a second shadow, called BV.
> To handle this with the current code, allocate it right after the current
> RPTR shadow.
> 
> BV handling and .submit are mostly based on Jonathan Marek's work.
> 
> All A7xx GPUs are assumed to have a GMU.
> A702 is not an A7xx-class GPU, it's a weird forked A610.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  95 +++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 451 ++++++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |   1 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  10 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.h    |   2 +
>   5 files changed, 478 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 03fa89bf3e4b..75984260898e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -200,9 +200,10 @@ int a6xx_gmu_wait_for_idle(struct a6xx_gmu *gmu)
>   
>   static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>   {
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	u32 mask, reset_val, val;
>   	int ret;
> -	u32 val;
> -	u32 mask, reset_val;
>   
>   	val = gmu_read(gmu, REG_A6XX_GMU_CM3_DTCM_START + 0xff8);
>   	if (val <= 0x20010004) {
> @@ -218,7 +219,11 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>   	/* Set the log wptr index
>   	 * note: downstream saves the value in poweroff and restores it here
>   	 */
> -	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
> +	if (adreno_is_a7xx(adreno_gpu))
> +		gmu_write(gmu, REG_A6XX_GMU_GENERAL_9, 0);
> +	else
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
> +
>   
>   	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
>   
> @@ -518,7 +523,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	if (IS_ERR(pdcptr))
>   		goto err;
>   
> -	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) ||
> +	    adreno_is_a660_family(adreno_gpu) ||
> +	    adreno_is_a7xx(adreno_gpu))
>   		pdc_in_aop = true;
>   	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))
>   		pdc_address_offset = 0x30090;
> @@ -550,7 +557,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
>   
>   	/* Load RSC sequencer uCode for sleep and wakeup */
> -	if (adreno_is_a650_family(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu) ||
> +	    adreno_is_a7xx(adreno_gpu)) {
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xeaaae5a0);
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xe1a1ebab);
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e0a581);
> @@ -635,11 +643,18 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   /* Set up the idle state for the GMU */
>   static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
>   {
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +
>   	/* Disable GMU WB/RB buffer */
>   	gmu_write(gmu, REG_A6XX_GMU_SYS_BUS_CONFIG, 0x1);
>   	gmu_write(gmu, REG_A6XX_GMU_ICACHE_CONFIG, 0x1);
>   	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
>   
> +	/* A7xx knows better by default! */
> +	if (adreno_is_a7xx(adreno_gpu))
> +		return;
> +
>   	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL, 0x9c40400);
>   
>   	switch (gmu->idle_level) {
> @@ -702,7 +717,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>   	u32 itcm_base = 0x00000000;
>   	u32 dtcm_base = 0x00040000;
>   
> -	if (adreno_is_a650_family(adreno_gpu))
> +	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
>   		dtcm_base = 0x10004000;
>   
>   	if (gmu->legacy) {
> @@ -751,14 +766,22 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   {
>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	u32 fence_range_lower, fence_range_upper;
>   	int ret;
>   	u32 chipid;
>   
> -	if (adreno_is_a650_family(adreno_gpu)) {
> +	/* Vote veto for FAL10 */
> +	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu)) {
>   		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
>   		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
>   	}
>   
> +	/* Turn on TCM (Tightly Coupled Memory) retention */
> +	if (adreno_is_a7xx(adreno_gpu))
> +		a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
> +	else
> +		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
> +
>   	if (state == GMU_WARM_BOOT) {
>   		ret = a6xx_rpmh_start(gmu);
>   		if (ret)
> @@ -768,9 +791,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   			"GMU firmware is not loaded\n"))
>   			return -ENOENT;
>   
> -		/* Turn on register retention */
> -		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
> -
>   		ret = a6xx_rpmh_start(gmu);
>   		if (ret)
>   			return ret;
> @@ -780,6 +800,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   			return ret;
>   	}
>   
> +	/* Clear init result to make sure we are getting a fresh value */
>   	gmu_write(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, 0);
>   	gmu_write(gmu, REG_A6XX_GMU_CM3_BOOT_CONFIG, 0x02);
>   
> @@ -787,8 +808,18 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_ADDR, gmu->hfi.iova);
>   	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_INFO, 1);
>   
> +	if (adreno_is_a7xx(adreno_gpu)) {
> +		fence_range_upper = 0x32;
> +		fence_range_lower = 0x8a0;
> +	} else {
> +		fence_range_upper = 0xa;
> +		fence_range_lower = 0xa0;
> +	}
> +
>   	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
> -		(1 << 31) | (0xa << 18) | (0xa0));
> +		  BIT(31) |
> +		  FIELD_PREP(GENMASK(30, 18), fence_range_upper) |
> +		  FIELD_PREP(GENMASK(17, 0), fence_range_lower));

This fails on arm32 because of the missing #include <linux/bitfields.h>

>   
>   	/*
>   	 * Snapshots toggle the NMI bit which will result in a jump to the NMI

-- 
With best wishes
Dmitry

