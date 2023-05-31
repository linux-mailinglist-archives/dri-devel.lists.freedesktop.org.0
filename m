Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2F718B32
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 22:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B8110E34A;
	Wed, 31 May 2023 20:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB95D10E069
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 20:30:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f4bd608cf4so7433086e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565012; x=1688157012;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQgUcowRTpgM21EsPox6YeLFNMwnI6ZyngiZGliqXT8=;
 b=Kj8jEKibX5Z/6EA3vEu2XTtwzpSJ8zwWFOoQkcg4qlMNuilugqWbgkXaBFF2VPJXnk
 CbMP/hYNsfDqOBLkbVpZXHYgfxmID5Ang1P4uu2LXXyTbd6wtho+qlUki8L/lkR0F4FX
 Z0Bk1MqVVHUJ96of+zVvOJMQxG+AGfyKFUcpXn1oOyiNMJUAq6z3JBFCmLxlQYBtcNgd
 DWTVujtAEmdfytPOEi+tLEzEccnCzwOieCQDt6JQrB1aDjkphF2CRlbVReiFnyinBfiS
 +M1duTu8wuznzD59qBaTtaLJdeD2uEoTr8dkFsOiouB1fCpcrmYn/iWWm8ouRqbJMLHs
 hkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565012; x=1688157012;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wQgUcowRTpgM21EsPox6YeLFNMwnI6ZyngiZGliqXT8=;
 b=iPzi44EV+XwrMGxYFTmh69r+Ez3SewkFLW+1TheN922dY72kQoMR9EwtWDds/P6pR0
 tFTs2cBPAVMkk3G2Uik6ryzteimFS++yVBdzcmlJzwQ2xV8EqHrgMg3ZLC676up4m43/
 xw9wsfIBJi54XSqLgVbfuux6iR/s8OTqH1XHbW8pUqpoemB7j3m3kGoOfL+gMzJ7+2ud
 iIvW5gTPj5VuzjIzADy6Y5fGcp07m58n6+RSH897Pfx9PSELfkFHiW30jeT1hdVcCapR
 ENGjY4+ZWAu13TbTRDvjKHe4S2ZCvbcyl4On3j2WEmRY5xhwsZ4RW1/6ndJ7rzCMxTSN
 ZRcA==
X-Gm-Message-State: AC+VfDygr/kvyp7FVRs/CoU2uA+gCYcBS1vybhnCIO63tT2DznufkRWH
 0nCsNpaoBnqTmTo0a3l2lpGqUw==
X-Google-Smtp-Source: ACHHUZ4Q5v3xgwvV8resVsZl4z1giMzO+8GCrXfRosgXBlBGukhaQdcxLC8DRiLNi7PhO3R+kVl0rA==
X-Received: by 2002:ac2:411a:0:b0:4f4:2b7d:592a with SMTP id
 b26-20020ac2411a000000b004f42b7d592amr68565lfi.38.1685565012564; 
 Wed, 31 May 2023 13:30:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 q6-20020ac25146000000b004eff6dd9072sm840680lfd.111.2023.05.31.13.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 13:30:11 -0700 (PDT)
Message-ID: <57ffc7d9-c767-df36-d91f-8949993b1cdf@linaro.org>
Date: Wed, 31 May 2023 22:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
 <20230531030945.4109453-2-quic_bjorande@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/msm/adreno: Add Adreno A690 support
In-Reply-To: <20230531030945.4109453-2-quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Steev Klimaszewski <steev@kali.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.05.2023 05:09, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Couple of additional nits that you may or may not incorporate:

[...]

> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
It would be cool if we could stop adding uppercase hex outside preprocessor
defines..


[...]
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
typo



-- Questions to Rob that don't really concern this patch --

> +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
Rob, I'll be looking into reworking these into dynamic tables.. would you
be okay with two more additions (A730, A740) on top of this before I do that?
The number of these funcs has risen quite a bit and we're abusing the fact
that so far there's a 1-1 mapping of SoC-Adreno (at the current state of
mainline, not in general)..

> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
Also something I'll be looking into in the near future..

> @@ -531,6 +562,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		adreno_7c3_build_bw_table(&msg);
>  	else if (adreno_is_a660(adreno_gpu))
>  		a660_build_bw_table(&msg);
> +	else if (adreno_is_a690(adreno_gpu))
> +		a690_build_bw_table(&msg);
>  	else
>  		a6xx_build_bw_table(&msg);
I think changing the is_adreno_... to switch statements with a gpu_model
var would make it easier to read.. Should I also rework that?

Konrad

>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8cff86e9d35c..e5a865024e94 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] = {
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
> +	}, {
> +		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
> +		.revn = 690,
> +		.name = "A690",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a660_sqe.fw",
> +			[ADRENO_FW_GMU] = "a690_gmu.bin",
> +		},
> +		.gmem = SZ_4M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a690_zap.mdt",
> +		.hwcg = a690_hwcg,
> +		.address_space_size = SZ_16G,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index f62612a5c70f..ac9c429ca07b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>  	u32 value;
>  };
>  
> -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
>  
>  struct adreno_info {
>  	struct adreno_rev rev;
> @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>  	return gpu->revn == 660;
>  }
>  
> +static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 690;
> +};
> +
>  /* check for a615, a616, a618, a619 or any derivatives */
>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  {
> @@ -280,13 +285,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  
>  static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>  {
> -	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
> +	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
>  }
>  
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
> +	return gpu->revn == 650 || gpu->revn == 620  || adreno_is_a660_family(gpu);
>  }
>  
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
