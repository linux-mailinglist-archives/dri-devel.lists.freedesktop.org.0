Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130C913E76
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35810E321;
	Sun, 23 Jun 2024 21:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aTfuP8fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE1910E321
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:21:34 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so4342956e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719177692; x=1719782492; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SKYxTmfDZ36i0fXszGUOUg0SnwJqotpaI2MGCB2scg0=;
 b=aTfuP8flTmrZtp9hKOEeJLifAXlTxrljBunWkCrSq/A8VTJs7qfUlE5oxl3lEe9Auy
 6qiVmz3nebckOBLSrHVvDPJeeLCE4QFdnDdPwD72VBX9o/AyAmXkxCcpnzm5F5JV3kBe
 fOJQSvfcm1p16DA3s9zZX8nxDKLCJpQ+21cQvFm+Y59iOW258KbAl5dl2k2kvYzLBj+j
 BSyV7KbvaoaKvgJ21rbDw3K4l3vQdKE/vOxIsDcnrvfMNmXQs0Lui2hpYHauCsUzYrGq
 ZFzU/NM0ZKDCTSzPjmRwNG3PJ6rDtwjawy+CZETEr9UhojDGGXbeAIriK69ISUAys8DV
 TOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719177692; x=1719782492;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKYxTmfDZ36i0fXszGUOUg0SnwJqotpaI2MGCB2scg0=;
 b=k+xFpBm6d96QeSwyDzTIRFvtNU1ilRoCqla/jCMUMJ7OS+VfYsCybyjhwfVxkkLmWX
 GKQZ/a8KIh2vqxEUAt64z7Ox9nEb7HAdmjS6N5gzkye7cm9JxfcuWZhjc/nigp8yBRVN
 mDsUgcGj3ZiMhbnuksJN78lI2DycmDEQ9nOTZUMamGAZ9RRU/UVLv5aXVqMosZObAyKa
 jw9c+te+n4dPCjRF95EyjXQovb+lQ/kkXLlrE5MV/jYcNgTYP08k6eBpokyhQmxXHC/B
 M3weVouqHVODuY5wViq9BSRNc8lZUpAL+9SSx8FANyDFmb4fYgldySYvlRBgGJthNyp9
 92zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTFrtg7wpWCZWlc4N3GcH69nBhNwSH1PvzSwUvEkh6r08H+gPmO8ZF+D5+6Ai+/OsXpuCaiLTfTC5GV4WQI4ZxKz2bMOuVGuaE6mQTCxIp
X-Gm-Message-State: AOJu0Yzs4Vk76z2zVZJDI4TRJJ8t9tAnzWM6RC9COv64iqjh3VDexHja
 Ogg2YfGHr1Z74dv8XFyxqw620/3HdXsjAYFzgGUhPQcc6Z2AM6fOqTqd6FrNntc=
X-Google-Smtp-Source: AGHT+IFJe95/Vj8GJSb3Ykh02gYRcCNqfVu+HysVCr/bgJDIAgB5sIvgaWb6pLRmDGFwK6+FB2214w==
X-Received: by 2002:a19:c514:0:b0:52c:8591:1f7b with SMTP id
 2adb3069b0e04-52ce061b07dmr2425891e87.24.1719177692178; 
 Sun, 23 Jun 2024 14:21:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdf5081f0sm478621e87.168.2024.06.23.14.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:21:31 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:21:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
Message-ID: <6pfetzw2my2wf465wsgg5cqhmkuqooi6fipm3huntl5gwthgyd@qukafeyyftvx>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623110753.141400-3-quic_akhilpo@quicinc.com>
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

On Sun, Jun 23, 2024 at 04:36:29PM GMT, Akhil P Oommen wrote:
> Add support in drm/msm driver for the Adreno X185 gpu found in
> Snapdragon X1 Elite chipset.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>  4 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0e3dfd4c2bc8..168a4bddfaf2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  	 */
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>  
> +	if (adreno_is_x185(adreno_gpu)) {
> +		chipid = 0x7050001;
>  	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
> -	if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> +	} else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
>  		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
>  		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
>  
> @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>  	if (!pri_count)
>  		return -EINVAL;
>  
> -	sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> -	if (IS_ERR(sec))
> -		return PTR_ERR(sec);
> +	/*
> +	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
> +	 * to regular mx rail if it is missing

Can we use compatibles / flags to detect this?

> +	 */
> +	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> +	if (PTR_ERR_OR_ZERO(sec) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(sec)) {
> +		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> +		if (IS_ERR(sec))
> +			return PTR_ERR(sec);
> +	}

The following code might be slightly more idiomatic:

	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
	if (IS_ERR(sec))
		return PTR_ERR(sec);


>  
>  	sec_count >>= 1;
>  	if (!sec_count)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 973872ad0474..97837f7f2a40 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1319,9 +1319,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  		count = ARRAY_SIZE(a660_protect);
>  		count_max = 48;
>  		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> -	} else if (adreno_is_a730(adreno_gpu) ||
> -		   adreno_is_a740(adreno_gpu) ||
> -		   adreno_is_a750(adreno_gpu)) {
> +	} else if (adreno_is_a7xx(adreno_gpu)) {
>  		regs = a730_protect;
>  		count = ARRAY_SIZE(a730_protect);
>  		count_max = 48;
> @@ -1891,7 +1889,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>  
>  	/* Set weights for bicubic filtering */
> -	if (adreno_is_a650_family(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>  			0x3fe05ff4);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index c3703a51287b..139c7d828749 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -568,6 +568,20 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a740_zap.mdt",
>  		.hwcg = a740_hwcg,
>  		.address_space_size = SZ_16G,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
> +		.family = ADRENO_7XX_GEN2,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen70500_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen70500_gmu.bin",
> +		},
> +		.gmem = 3 * SZ_1M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			  ADRENO_QUIRK_HAS_HW_APRIV,
> +		.init = a6xx_gpu_init,
> +		.hwcg = a740_hwcg,
> +		.address_space_size = SZ_16G,

Please rebase on top of https://lore.kernel.org/dri-devel/20240618164303.66615-1-robdclark@gmail.com/

>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>  		.family = ADRENO_7XX_GEN3,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..d9ea8e0f6ad5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -448,6 +448,11 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
>  	return gpu->info->chip_ids[0] == 0x43051401;
>  }
>  
> +static inline int adreno_is_x185(struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x43050c01;
> +}
> +
>  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
>  {
>  	if (WARN_ON_ONCE(!gpu->info))
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
