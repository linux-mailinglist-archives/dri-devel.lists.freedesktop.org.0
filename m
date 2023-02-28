Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AE36A6080
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 21:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7629B10E067;
	Tue, 28 Feb 2023 20:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069BB10E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 20:40:21 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n2so14843191lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677616819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nLIa+SLDzFv4qAPTVCVsuQOCNXSAjx9BK8vZGNs3laI=;
 b=LUUVFY/tA6VSrTAel6MQ+Jw/Hot3EIAzLSbn2oRg1wYfgRA/7J4ydbZiUN2Y1cTomz
 2W2Nw8ss1GkQEIrOS1btzNDiCO2m06aLxiM1k25ObxGQBAFyWiZLLsFNB+At7xDEqKMY
 fOR7IukcfZJAwUgF39BwMMbTby3JqaXH0XxYUxWCAr/pwD4Ulfh3UJ6PTZzWyCK1u3rc
 huu0jK6k66znwvhyNIoQHl42FoqG1pTl9uKH4pO8dxPVRzvhsGuSx9M8gyqD0zXmn8/L
 LxsUtAr6+3iNfL4mrJ6K2C0+m1SvC5RWrMsvsX0fKaHj3vcBi5UfRkTDdiDb8DWY3SHR
 U0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677616819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLIa+SLDzFv4qAPTVCVsuQOCNXSAjx9BK8vZGNs3laI=;
 b=Gof86UWKtXozjjYr6enIp+fFh1HqBnENWpdtqRDNIX8coIcyM1/KKc5O4xlAY4SmGm
 jKOKqFWBEJnsF2x0o2uK4Hu/DQEFadAkhvTYvb7HKYLloun/RT5WoCoyWvlojG48Llxy
 3Ej/ec8eLnXw3ZSE8QEBnr2+hFw6BFim+u1WTVSRhMs4fS6yKd8Ie9M5jViPa0G88Lm/
 nJAPwLeMk2WVxpy90UtJUgcSRGTyDTRxx0k63mXCzp3W9Q52YmlZEPou3Ldg1uC0iOyE
 unFrNgvqnTxHUC9ltpZ0dkbV00D/sFaOkTjUqpNaD/E9fsRuMlFmMKwGldb3aadT+XQu
 Uh4g==
X-Gm-Message-State: AO0yUKVUzrm0HiTetoqljUTDnJN0OaKg9RiLQYUKWDYE5Bk5lra6sEvo
 ZtDIGwMZNpE7LBx2C/pf0bZXIA==
X-Google-Smtp-Source: AK7set+FKTIAiVv1ahQJeaUrgS2lDw/OWJBXpzMyPD1gx6ukpnzJJTaOHAdMm36tlT4eV8Mufznu7g==
X-Received: by 2002:ac2:4241:0:b0:4d8:8273:ec with SMTP id
 m1-20020ac24241000000b004d8827300ecmr1161495lfl.20.1677616819094; 
 Tue, 28 Feb 2023 12:40:19 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 w16-20020ac25990000000b004a9b9ccfbe6sm1467427lfn.51.2023.02.28.12.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:40:18 -0800 (PST)
Message-ID: <487a6890-4b8f-d541-e074-5d3ab7424678@linaro.org>
Date: Tue, 28 Feb 2023 21:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 04/15] drm/msm/a6xx: Extend and explain UBWC config
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-4-5be55a336819@linaro.org>
 <e19b5cd7-9125-a285-accc-ecf530804cfc@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e19b5cd7-9125-a285-accc-ecf530804cfc@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28.02.2023 21:23, Akhil P Oommen wrote:
> On 2/23/2023 5:36 PM, Konrad Dybcio wrote:
>> Rename lower_bit to hbb_lo and explain what it signifies.
>> Add explanations (wherever possible to other tunables).
>>
>> Sort the variable definition and assignment alphabetically.
> Sorting based on decreasing order of line length is more readable, isn't it?
I can do that.

>>
>> Port setting min_access_length, ubwc_mode and hbb_hi from downstream.
>> Set default values for all of the tunables to zero, as they should be.
>>
>> Values were validated against downstream and will be fixed up in
>> separate commits so as not to make this one even more messy.
>>
>> A618 remains untouched (left at hw defaults) in this patch.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 ++++++++++++++++++++++++++++-------
>>  1 file changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index c5f5d0bb3fdc..bdae341e0a7c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -786,39 +786,74 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -	u32 lower_bit = 2;
>> +	/* Unknown, introduced with A640/680 */
>>  	u32 amsbc = 0;
>> +	/*
>> +	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
>> +	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
>> +	 * write the lowest two bits of the remaining value as hbb_lo and the
>> +	 * one above it as hbb_hi to the hardware. The default values (when HBB is
>> +	 * not specified) are 0, 0.
>> +	 */
>> +	u32 hbb_hi = 0;
>> +	u32 hbb_lo = 0;
>> +	/* Whether the minimum access length is 64 bits */
>> +	u32 min_acc_len = 0;
>> +	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
>>  	u32 rgb565_predicator = 0;
>> +	/* Unknown, introduced with A650 family */
>>  	u32 uavflagprd_inv = 0;
>> +	/* Entirely magic, per-GPU-gen value */
>> +	u32 ubwc_mode = 0;
>>  
>>  	/* a618 is using the hw default values */
>>  	if (adreno_is_a618(adreno_gpu))
>>  		return;
>>  
>> -	if (adreno_is_a640_family(adreno_gpu))
>> +	if (adreno_is_a619(adreno_gpu)) {
>> +		/* HBB = 14 */
>> +		hbb_lo = 1;
>> +	}
>> +
>> +	if (adreno_is_a630(adreno_gpu)) {
>> +		/* HBB = 15 */
>> +		hbb_lo = 2;
>> +	}
>> +
>> +	if (adreno_is_a640_family(adreno_gpu)) {
>>  		amsbc = 1;
>> +		/* HBB = 15 */
>> +		hbb_lo = 2;
>> +	}
>>  
>>  	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>> -		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>> -		lower_bit = 3;
>>  		amsbc = 1;
>> +		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>> +		/* HBB = 16 */
>> +		hbb_lo = 3;
>>  		rgb565_predicator = 1;
>>  		uavflagprd_inv = 2;
>>  	}
>>  
>>  	if (adreno_is_7c3(adreno_gpu)) {
>> -		lower_bit = 1;
>>  		amsbc = 1;
>> +		/* HBB is unset in downstream DTS, defaulting to 0 */
> This is incorrect. For 7c3 hbb value is 14. So hbb_lo should be 1. FYI, hbb configurations were moved to the driver from DT in recent downstream kernels.
Right, seems to have happened with msm-5.10. Though a random kernel I
grabbed seems to suggest it's 15 and not 14?

https://github.com/sonyxperiadev/kernel/blob/aosp/K.P.1.0.r1/drivers/gpu/msm/adreno-gpulist.h#L1710

Konrad
> 
> -Akhil.
>>  		rgb565_predicator = 1;
>>  		uavflagprd_inv = 2;
>>  	}
>>  
>>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>> -		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
>> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>> -		uavflagprd_inv << 4 | lower_bit << 1);
>> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
>> +		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
>> +		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
>> +
>> +	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
>> +		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
>> +
>> +	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
>> +		  uavflagprd_inv << 4 | min_acc_len << 3 |
>> +		  hbb_lo << 1 | ubwc_mode);
>> +
>> +	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
>>  }
>>  
>>  static int a6xx_cp_init(struct msm_gpu *gpu)
>>
> 
