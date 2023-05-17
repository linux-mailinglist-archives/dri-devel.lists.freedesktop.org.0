Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93669707183
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330DA10E22A;
	Wed, 17 May 2023 19:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6A010E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:09:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f25d79f6bfso1394160e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684350541; x=1686942541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=huaxMu2yPsa+W+Dphwqdvi3R3kbSqOL8XYUyHgZBXNI=;
 b=y5J48RtfUhG782JdfsiJt796SQugTBGoIKbCVDTn5+5b8+/dwDv9IlCvmD/U6bOHqS
 kUkGlMzvAcY7RGoXlDyNubn5N6sDHwyXHMRyR/ejxo5W7I7e3GNmqidYBOBCXIHSD/zJ
 B5fBQ6HKv3i4WpEGf5VQGu/S7y/avfCUfVm78KufMTmIAdlwPXTQv1Z0LrJYKdww3BT4
 dUwKSDXHOSgKzPMoF3Rr/GCvTn8FfaYkfnprBV+MqnQ9Vi4QBnKVMJWCvRzPhssIpD0P
 MMRQfyCsXedFfR64N91jsMRL185KSGywugmamc+H0gfJRD5MfzrBno+C0siTPw0Wze3v
 xi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684350541; x=1686942541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=huaxMu2yPsa+W+Dphwqdvi3R3kbSqOL8XYUyHgZBXNI=;
 b=jfbmd1x4SEGmMn2sEwnF5C3Dpuh776F6fys2sNSAnc4mG7TxsSnqs7UrmLzyg88qms
 GeGqkOusBvMQJZC4xTfOeNadMiR4dwdLhIMNP6BWMOGgf3EH2MOja5sgqnPKaasyo85b
 vU8N/7/VQwYMTncoh1bun8atqmzmIdrxb5a2f7KrtcJCO29fMS8vPHK7Y75UBCIxObzI
 QgzFVOoCWwsoMm0GoeRRyIywkEKzafPZwpOlSKpKNVyknwgiDIGJegUJHdCDfaaD5UaT
 sYOfnOXjZZNKU0X5SOeZB218n+mVztwauhhYdQ4MVFVxZgna7iN//CsAJf8CDQoeRPob
 Vm9w==
X-Gm-Message-State: AC+VfDw6Th+BbF9+rSzkXXV7Tf4OAwUHNGO0BtSC6v0NDV6t5pB7UqTX
 5JF8kfsxcM/QWtkNvmVedIp95g==
X-Google-Smtp-Source: ACHHUZ56irov5Zpc/KBB1vmtqjYbdjCGlC3dGGkIVzITUpKg/G6jZZdmyhGq/5TEvQWENZUQ8oh02g==
X-Received: by 2002:a05:6512:507:b0:4f2:60da:7c97 with SMTP id
 o7-20020a056512050700b004f260da7c97mr537779lfb.36.1684350541323; 
 Wed, 17 May 2023 12:09:01 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 b12-20020ac2410c000000b004b5979f9ba8sm3422089lfi.210.2023.05.17.12.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 12:09:00 -0700 (PDT)
Message-ID: <88f04ec5-f41b-d918-56e7-642bf13fa795@linaro.org>
Date: Wed, 17 May 2023 21:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 5/6] drm/msm/a6xx: Use GMU_ALWAYS_ON_COUNTER
 for GMU-equipped GPUs in timestamp
Content-Language: en-US
To: Jonathan Marek <jonathan@marek.ca>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
 <20230517-topic-a7xx_prep-v1-5-7a964f2e99c2@linaro.org>
 <aaab25be-3403-518d-e639-c80b0930906a@marek.ca>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aaab25be-3403-518d-e639-c80b0930906a@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.05.2023 20:09, Jonathan Marek wrote:
> AFAIK GMU_ALWAYS_ON_COUNTER does not have the same value as CP_ALWAYS_ON_COUNTER (only the same frequency), so changing this would break userspace expecting to be able to compare the value returned by MSM_PARAM_TIMESTAMP with CP timestamp values.
FWIW A630 and A730 seem to work fine with this patch. Anything
in particular I should look out for?

Konrad
> 
> On 5/17/23 12:50 PM, Konrad Dybcio wrote:
>> Use the always-on counter provided by the GMU to skip having to
>> keep the GPU online.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 8707e8b6ac7e..d2a999b90589 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1664,12 +1664,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>         mutex_lock(&a6xx_gpu->gmu.lock);
>>   -    /* Force the GPU power on so we can read this register */
>> -    a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>> -
>> -    *value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
>> -
>> -    a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>> +    *value = gmu_read64(&a6xx_gpu->gmu,
>> +                REG_A6XX_GMU_ALWAYS_ON_COUNTER_L,
>> +                REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>         mutex_unlock(&a6xx_gpu->gmu.lock);
>>  
