Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19574A7A7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 01:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0C510E121;
	Thu,  6 Jul 2023 23:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2E310E121
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 23:27:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso1348611e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688686069; x=1691278069;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Rc4nEMPiLbzgMMqamf1zMVRPsKfUKUaVx1ZW+XaV+U=;
 b=aH8n5Qd9MK1ANni6dLQxRqCRToB9JSQaIxNTBqd4tfGdAAKgKYbzjnt+b///uWAVSi
 GQKtUZhYr4qRhidQEtnu+Vyh6q5qBT7U7eUmntyMDnXg76nRyPR7GERZ4sn3wbTxcJBG
 zcHgQDBeNWu7o62iK5Fm+Gy6ditfSFR0UjH2T39ob2qQ2lFBFQA1JZZkD/OVlyZkIgun
 Q8d7VB27w/EVkfZYx4oiuvpk019+rrGe9lYHbcF1OC5jeOUdMRQOIAyo1xLqVuRd30Li
 zWmU0IiEhBLhlTSwLcFbyFJn330gDpAyoFFDln1t1BUOlvk6a0lt15ZZopiY1Ea2Hmie
 5DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688686069; x=1691278069;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Rc4nEMPiLbzgMMqamf1zMVRPsKfUKUaVx1ZW+XaV+U=;
 b=DD5mk4SmcGIs/SPak4C/dCpAhyoesuHPGLhkmGxag/8lZNUTk7j7+DH8fTsvMRSD9/
 vlqpyDPdLIOXthfcfLJrQrYMSO3olIH5i9ALMxYlciOGSW5rjxF4oa3gEJ+L4RxXsVMQ
 N9/Gp7Io5uAwrbcDsWjMgYz7IlGUSB8Z4cBlCar1iJc4LO8X95OAXkN3jGZynPhooZZG
 JEQjcb8H9hfEz03uVW71J96GIpA39HjCi9CmKxkBxCQw/pnBypdy53T/7E+J9GbulsnV
 Q/bZkmpmLFUVvQTdEmXfzzDdGmvc8AdnTeyFdbaFwEWG/6xM2VbtnL9Bfn+LnMapUCuD
 5QAQ==
X-Gm-Message-State: ABy/qLaO99WdfcQughCq2yZepUfVJPPzpTAllo+1CiHNaV4rf6pIAmjL
 E5vAr5VOnqFDT+aAOhL6A67x1A==
X-Google-Smtp-Source: APBJJlEDtOM82nO7hOxZ9Ss1rbG8HFdGBF5zph2N6UBqW/8EUNAFOSfGksJg7EkQHZ4oceUCRdtNdA==
X-Received: by 2002:a05:6512:e9d:b0:4fb:7f45:bcb6 with SMTP id
 bi29-20020a0565120e9d00b004fb7f45bcb6mr2253466lfb.16.1688686068600; 
 Thu, 06 Jul 2023 16:27:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 16-20020ac24830000000b004faeedbb29dsm438893lft.64.2023.07.06.16.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:27:48 -0700 (PDT)
Message-ID: <66dfebe7-1c6a-5bd3-b893-fa43dd5e92ae@linaro.org>
Date: Fri, 7 Jul 2023 01:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/12] drm/msm/adreno: Use quirk identify hw_apriv
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-5-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-5-robdclark@gmail.com>
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
> Rather than just open coding a list of gpu-id matches.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5ba8b5aca502..6f8c4381fa4a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2489,8 +2489,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	/* Quirk data */
>  	adreno_gpu->info = info;
>  
> -	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
> -		adreno_gpu->base.hw_apriv = true;
> +	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 326912284a95..f469f951a907 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -302,6 +302,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a650_zap.mdt",
>  		.hwcg = a650_hwcg,
> @@ -315,6 +316,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mdt",
>  		.hwcg = a660_hwcg,
> @@ -327,6 +329,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.hwcg = a660_hwcg,
>  		.address_space_size = SZ_16G,
> @@ -350,6 +353,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_4M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a690_zap.mdt",
>  		.hwcg = a690_hwcg,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index d31e2d37c61b..a7c4a2c536e3 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -32,6 +32,7 @@ enum {
>  #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
> +#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>  
>  struct adreno_rev {
>  	uint8_t  core;
