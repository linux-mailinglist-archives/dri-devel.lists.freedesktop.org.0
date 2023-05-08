Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA1F6FACA4
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 13:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C3310E232;
	Mon,  8 May 2023 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317B10E232
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 11:26:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so28188468e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 04:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683545197; x=1686137197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lgp4w7UgtGPW6wmF4U1r9WAnrIsZUUpZz/2MD42UzYc=;
 b=ibUxcb63dNhxKPG6WlrwUfgo/nK6cepLMmXEXUV6yHciHB/+Ri1/Qq0xRTUdGjGald
 lR+MaSbckb3bISrb8QrdUthJJnoVMzEO9G2kV340N1nxQ4O+FJq9nMh0p+0SBBos9RS5
 VlrftkbpoA4dGhGzInVrpiJn66Lr2PWkeW223+C/vsbxN8l7p2DzS51h1clLeNdmCIKr
 ziQ2imDORby43gPJJ/DNzuEkaAR4rmnuMnguPdjvVawBX1ymPe07VhrfDQ646vEqm3Kz
 ZmlLn4lqGjr0Y/5glIa5RHVvj25gTrAZZu6IlZEmN3WpblFt5qcQdokey9FUJc8mX/pg
 ediw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683545197; x=1686137197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lgp4w7UgtGPW6wmF4U1r9WAnrIsZUUpZz/2MD42UzYc=;
 b=BBGKUjciz3F9N6ao5qozoWq0CdBR01Ar02pT+86wafpBh8ua3t5OdQ1EjptsjusNTR
 vYxoHDVVRh1Gb1Xx20C2yMF0QAfUDaLTDFS6ANu7jmm6Z/UkJ+nm/Gkkjv289ND5yBBA
 ufRXV5dDaT4rW3P7NhRxKocgCB3WrjjWPb/4ZyWkpxQ4jatU4rb7EIyalzSdZ7nx+Ie7
 lPctmU1Gj9MZr2/pXwBiC3q1z3SpZaFnIwSbtaF9EhHFZjILHDoLvMgkR/M38xBxQi+2
 GNnDEPNFBDdGAwpCBiK3OXfSM7wBkNMwG1rubgIsk4e0qHJjagcozm/SGIgZuwGfBOAe
 36LA==
X-Gm-Message-State: AC+VfDygEHAOha+KpSQkB8dZaH9U3za288uvDM/TcJM+HsTgPkv8OsgZ
 pIMpzlyUcILLP+wUlQtvmF1jdw==
X-Google-Smtp-Source: ACHHUZ4ICyUpFMfcjzB2NR90fEPuHFIHGyWmG7SwR4v7eU+z+qCKnFMg2I25yvCeCXT4byqsSvOqeA==
X-Received: by 2002:a05:6512:3985:b0:4ef:fb45:7037 with SMTP id
 j5-20020a056512398500b004effb457037mr5021723lfu.20.1683545196918; 
 Mon, 08 May 2023 04:26:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f4-20020ac25324000000b004b5979f9ba8sm1274886lfh.210.2023.05.08.04.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 04:26:36 -0700 (PDT)
Message-ID: <933ec58a-0f1f-93d2-9fe6-ab818de17bbd@linaro.org>
Date: Mon, 8 May 2023 14:26:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in INTF_SC7180_MASK
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230508-topic-hctl_en-v1-1-0f8b5df60ed5@linaro.org>
 <vonnkr34hogk3r54pg5wqw3xv5ood4zkdojehcr5stonvqev6u@nnezyvphwo5k>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <vonnkr34hogk3r54pg5wqw3xv5ood4zkdojehcr5stonvqev6u@nnezyvphwo5k>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 13:57, Marijn Suijten wrote:
> On 2023-05-08 12:29:32, Konrad Dybcio wrote:
>> DPU5 and newer targets enable this unconditionally. Move it from the
>> SC7280 mask to the SC7180 one.
>>
>> Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
> 
> The flag only exists since 591e34a091d17 ("drm/msm/disp/dpu1: add
> support for display for SC7280 target"), and I don't know how bad it is
> if it was lacking when SC7180 was added?

I think 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for 
SC7280 target") or 7e6ee55320f0 ("drm/msm/disp/dpu1: enable DATA_HCTL_EN 
for sc7280 target") would be more appropriate here.

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> I wonder if this needs any Reported-by/Suggested-by, given that I found
> the DATA_COMPRESS discrepancy for your SM6375 patch (which was using
> SC7280 to have the HCTL mask) and Dmitry pointing out that HCTL needs to
> be in SC7180 entirely.
> 
> Fortunately none of this affects cmdmode :)
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>> Depends on:
>> https://lore.kernel.org/linux-arm-msm/20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com/
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 27420fc863d6..7ea8fd69d5fd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -98,9 +98,12 @@
>>   #define INTF_SDM845_MASK (0)
>>   
>>   #define INTF_SC7180_MASK \
>> -	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>> +	(BIT(DPU_INTF_INPUT_CTRL) | \
>> +	 BIT(DPU_INTF_TE) | \
>> +	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>> +	 BIT(DPU_DATA_HCTL_EN))
>>   
>> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
>> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_INTF_DATA_COMPRESS)
>>   
>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>   			 BIT(DPU_WB_UBWC) | \
>>
>> ---
>> base-commit: c47189dee0decd9ecc1e65ae376ad6d4b0b7f1f2
>> change-id: 20230508-topic-hctl_en-3abb999a6c99
>>
>> Best regards,
>> -- 
>> Konrad Dybcio <konrad.dybcio@linaro.org>
>>

-- 
With best wishes
Dmitry

