Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E974A816
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4969610E4E1;
	Fri,  7 Jul 2023 00:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870710E4E1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 00:25:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso1909579e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 17:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688689516; x=1691281516;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ISNWfiziC/fCHUfhM1uO2ChG2cqjI+CEt+Uldre4VA=;
 b=oAe+gule0x9OwXDwUfdzt/J2cwTgjtUox0gVySo9ntOMXxkbChnwumhambf3Is4T6p
 D8VyTDaOkYmj1beVmTht5jP3bZSW81Y5Uxc4mXHGvA25/fxgOyxKZEesGudq0ktkW+5f
 Xdu1bxOgPfVSSSaHTOPMGppjLXv+t+yAmhZWCWOjmOurYSkqrf4VoFVTEomdbsfTcsiZ
 Lqp2dW/zuY7epIUH3x7Wcio2N6PO6/pLipjCjHxBYI4F5DN68JH51lIFnBb+odC93GNI
 gnpx/uyDiHTQ6RbnZ44prXc7x36oAZLHIh4WFZFagY0uVVPZ5Pr0mPnLPdgMldob4Db7
 wyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688689516; x=1691281516;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ISNWfiziC/fCHUfhM1uO2ChG2cqjI+CEt+Uldre4VA=;
 b=KB6an1cR1bpNqr19Evr+6pI/fVcax0noOB4ZKIKBjQLQiDPLvonEadvBdJu0h4jdwX
 jMvn//j4okWKQwX7pIcgkRAkRtlwZeiGJQLGKlj54TuxcVRs3v4JJcRhwGZ7oGxf6218
 CKiQojNhx01uIhxd0VL+uMfX7N8fdGMBON+EoK+jYl4v60S4tESrSaseWmmgNb40T2u5
 H/K7ysLVQiDdRJlehanp1puQ7sKl57YSoUanx4HwGcNB6+9hcWP7LZdU0MBQAi0oRAVl
 eW2gJOBp6d9fkcdzgbJjEcFQON1me32/zLkqWnklNf+bFzV+jQe8UWP+9HbsvqCDHB+X
 l00w==
X-Gm-Message-State: ABy/qLZA6enLla4VL5s1AE+Zbk8RUe6BXdLYTqPUVpIOTJZMryLD3P1p
 7vNLUq6Rj7ayYCLMx+MXRPWIjQ==
X-Google-Smtp-Source: APBJJlFFCe9u7xgg0aMRiy7y0tw5Jds0LwiVZR4YL/IiFed6Y/HwxD3Mpoz3LP/kS2u7rUK+vQ2D1A==
X-Received: by 2002:a05:6512:2094:b0:4fb:7532:35aa with SMTP id
 t20-20020a056512209400b004fb753235aamr2597932lfr.28.1688689516033; 
 Thu, 06 Jul 2023 17:25:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a19f518000000b004fbae60b970sm450448lfb.68.2023.07.06.17.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 17:25:15 -0700 (PDT)
Message-ID: <4cdceddb-033a-6301-163e-89d27152e242@linaro.org>
Date: Fri, 7 Jul 2023 02:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying
 GPU
In-Reply-To: <20230706211045.204925-13-robdclark@gmail.com>
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
> Since the revision becomes an opaque identifier with future GPUs, move
> away from treating different ranges of bits as having a given meaning.
> This means that we need to explicitly list different patch revisions in
> the device table.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
[...]

>  
> -	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
> +	/*
> +	 * Note that we wouldn't have been able to get this far if there is not
> +	 * a device table entry for this chip_id
> +	 */
Why error-check it then?

> +	info = adreno_find_info(config->chip_id);
> +	if (WARN_ON(!info))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (info->revn == 510)
>  		nr_rings = 1;
[...]

>  
> -	chipid = adreno_gpu->rev.core << 24;
> -	chipid |= adreno_gpu->rev.major << 16;
> -	chipid |= adreno_gpu->rev.minor << 12;
> -	chipid |= adreno_gpu->rev.patchid << 8;
> +	/* Note that the GMU has a slightly different layout for

/*
 * Note

You've almost joined the good side :D
> +	 * chip_id, for whatever reason, so a bit of massaging
> +	 * is needed.  The upper 16b are the same, but minor and
> +	 * patchid are packed in four bits each with the lower
> +	 * 8b unused:
> +	 */
[...]

> -		.rev   = ADRENO_REV(3, 0, 5, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x03000500),

0x03000512 for msm8226-v2
0x03000520 for msm8610

>  		.family = ADRENO_3XX,
>  		.revn  = 305,
>  		.fw = {
> @@ -66,7 +66,7 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(3, 0, 6, 0),
> +		.chip_ids = ADRENO_CHIP_IDS(0x03000600),
>  		.family = ADRENO_3XX,
>  		.revn  = 307,        /* because a305c is revn==306 */
>  		.fw = {
> @@ -77,7 +77,11 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(3, 2, ANY_ID, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(
> +			0x03020000,
> +			0x03020001,
> +			0x03020002
> +		),
>  		.family = ADRENO_3XX,
>  		.revn  = 320,
>  		.fw = {
> @@ -88,7 +92,11 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(3, 3, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(
> +			0x03030000,
drop, prototype broken hw
(I think there are also some specific codepaths for that junk,
let's rid them too)

> +			0x03030001,
v2 prod

> +			0x03030002
msm8974pro

> +		),
>  		.family = ADRENO_3XX,
>  		.revn  = 330,
>  		.fw = {
> @@ -99,7 +107,7 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(4, 0, 5, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
0x04000500 msm8939
0x04000510 msm8952 (unsupported today)

>  		.family = ADRENO_4XX,
>  		.revn  = 405,
>  		.fw = {
> @@ -110,7 +118,7 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a4xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(4, 2, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x04020000),
msm8992, ok

>  		.family = ADRENO_4XX,
>  		.revn  = 420,
>  		.fw = {
> @@ -121,7 +129,7 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a4xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(4, 3, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x04030000),
0x04030002 msm8994-v2.1, earlier revs are probably trash piles held
together with duct tape knowing the track record of that soc

>  		.family = ADRENO_4XX,
>  		.revn  = 430,
>  		.fw = {
> @@ -132,7 +140,7 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a4xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(5, 0, 6, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
msm8953 ok

>  		.family = ADRENO_5XX,
>  		.revn = 506,
>  		.fw = {
> @@ -150,7 +158,7 @@ static const struct adreno_info gpulist[] = {
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a506_zap.mdt",
>  	}, {
> -		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05000800),
630 ok

>  		.family = ADRENO_5XX,
>  		.revn = 508,
>  		.fw = {
> @@ -167,7 +175,7 @@ static const struct adreno_info gpulist[] = {
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a508_zap.mdt",
>  	}, {
> -		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05000900),
636 ok

>  		.family = ADRENO_5XX,
>  		.revn = 509,
>  		.fw = {
> @@ -185,7 +193,7 @@ static const struct adreno_info gpulist[] = {
>  		/* Adreno 509 uses the same ZAP as 512 */
>  		.zapfw = "a512_zap.mdt",
>  	}, {
> -		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05010000),
8976 ok

>  		.family = ADRENO_5XX,
>  		.revn = 510,
>  		.fw = {
> @@ -200,7 +208,7 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = 250,
>  		.init = a5xx_gpu_init,
>  	}, {
> -		.rev   = ADRENO_REV(5, 1, 2, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05010200),
660 ok

>  		.family = ADRENO_5XX,
>  		.revn = 512,
>  		.fw = {
> @@ -217,7 +225,7 @@ static const struct adreno_info gpulist[] = {
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a512_zap.mdt",
>  	}, {
> -		.rev = ADRENO_REV(5, 3, 0, 2),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05030002),
8996 final

0x05030004 8996pro

>  		.family = ADRENO_5XX,
>  		.revn = 530,
>  		.fw = {
> @@ -236,7 +244,7 @@ static const struct adreno_info gpulist[] = {
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a530_zap.mdt",
>  	}, {
> -		.rev = ADRENO_REV(5, 4, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
8998 final ok

>  		.family = ADRENO_5XX,
>  		.revn = 540,
>  		.fw = {
> @@ -254,7 +262,7 @@ static const struct adreno_info gpulist[] = {
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a540_zap.mdt",
>  	}, {
> -		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
sm6125 ok
sm6115 ok

[...]
>  	}, {
> -		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06030002),
my sources say that it should end in 1 for sdm845-v2 and newer

>  		.family = ADRENO_6XX_GEN1,
>  		.revn = 630,
>  		.fw = {
> @@ -370,7 +378,7 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a630_zap.mdt",
>  		.hwcg = a630_hwcg,
>  	}, {
> -		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06040001),
8150 ok

>  		.family = ADRENO_6XX_GEN2,
>  		.revn = 640,
>  		.fw = {
> @@ -388,7 +396,7 @@ static const struct adreno_info gpulist[] = {
>  			1, 1
>  		),
>  	}, {
> -		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06050002),
8250-v2.1 ok 

>  		.family = ADRENO_6XX_GEN3,
>  		.revn = 650,
>  		.fw = {
> @@ -410,7 +418,7 @@ static const struct adreno_info gpulist[] = {
>  			3, 2
>  		),
>  	}, {
> -		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06060001),
8350-v2 ok

>  		.family = ADRENO_6XX_GEN4,
>  		.revn = 660,
>  		.fw = {
> @@ -426,7 +434,7 @@ static const struct adreno_info gpulist[] = {
>  		.hwcg = a660_hwcg,
>  		.address_space_size = SZ_16G,
>  	}, {
> -		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
7280 ok

>  		.family = ADRENO_6XX_GEN4,
>  		.fw = {
>  			[ADRENO_FW_SQE] = "a660_sqe.fw",
> @@ -445,7 +453,7 @@ static const struct adreno_info gpulist[] = {
>  			190, 1
>  		),
>  	}, {
> -		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06080000),
8180 probably ok

>  		.family = ADRENO_6XX_GEN2,
>  		.revn = 680,
>  		.fw = {
> @@ -459,7 +467,7 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
>  	}, {
> -		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
> +		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
8280 probably ok

>  		.family = ADRENO_6XX_GEN4,
>  		.fw = {
>  			[ADRENO_FW_SQE] = "a660_sqe.fw",
> @@ -494,31 +502,16 @@ MODULE_FIRMWARE("qcom/a630_sqe.fw");
>  MODULE_FIRMWARE("qcom/a630_gmu.bin");
>  MODULE_FIRMWARE("qcom/a630_zap.mbn");
>  
[...]

> @@ -612,32 +604,34 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
>  
>  		if (sscanf(compat, "qcom,adreno-%u.%u", &r, &patch) == 2 ||
>  		    sscanf(compat, "amd,imageon-%u.%u", &r, &patch) == 2) {
> -			rev->core = r / 100;
> +			uint32_t core, major, minor;
> +
> +			core = r / 100;
>  			r %= 100;
> -			rev->major = r / 10;
> +			major = r / 10;
>  			r %= 10;
> -			rev->minor = r;
> -			rev->patchid = patch;
> +			minor = r;
> +
> +			*chipid = (core << 24) |
> +				(major << 16) |
> +				(minor << 8) |
> +				patch;
I think a define macro would be nice here

>  
>  			return 0;
>  		}
> +
> +		if (sscanf(compat, "qcom,adreno-%08x", chipid) == 1)
> +			return 0;
>  	}
>  
[...]

>  static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
>  {
> -	/* The order of args is important here to handle ANY_ID correctly */
> -	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
> +	return gpu->info->chip_ids[0] == 0x06030500;
>  }
I'm sorry, but this screams trouble.. and doesn't sound very maintainable :/


Apart from all these comments, I don't really see the point of this patch,
other than trying to tie together Qualcomm's almost-meaningless chipids on
a7xx into the picture..

Since they can't even be read back from the hardware, I don't think trying
to force them into the upstream kernel makes any sense.

On a different note, I think we could try to blockify Adreno definitions a
bit by splitting things into:

- Core GPU propeties (revision, fw name, GMEM size)

- G(P)MU properties

- Family data (quirks, reg presets in some config struct which could be a
  union of config structs per generation, hwcg, maybe protected regs ptr
  should also be moved there)

- Generation data (init function, a2xx and a6xx specifics)

- Speedbin LUTs matched against socid


or something like that.. there's a whole lot of duplicated data atm

Konrad
>  
>  static inline int adreno_is_a660(const struct adreno_gpu *gpu)
> @@ -358,8 +364,7 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
>  
>  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  {
> -	/* The order of args is important here to handle ANY_ID correctly */
> -	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
> +	return gpu->info->chip_ids[0] == 0x06090000;
>  };
>  /* check for a615, a616, a618, a619 or any a630 derivatives */
>  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
