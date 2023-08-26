Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E728E7894F1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 10:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598DE10E045;
	Sat, 26 Aug 2023 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B2610E045
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 08:59:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50078eba7afso2613817e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693040347; x=1693645147;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VMV0LkL6XTvk7F0cHIqMZf1QrNVpfMIvkj9fG41FagQ=;
 b=lgk2m4D5SV3fD/P2u4/1d+8AR6SPFpPi+2GPAd3p+2w4cKz0cR+4UosIMI/GZIwuiG
 32WstuPhV1vP1jVIZPJad66p7yFiwZe6qAuseRXmMNCWjqJ3GWKNjP0H2gGTHIcewCe7
 YrZvAbTwmF3C+Vi6Limdkzb8MihLQYT2aQNni5guI4Tk0994CuKSg+yQY+ZYQY1NRxr8
 603vcX7SftjJaZsKCRFS24pAiQqbtVirE4Ci4AigQjRhaXw1nkXmW/ZFUCAai0dw5EhQ
 OGzkuXdUa8DmlxtyHKY+zNd+lyPkCuGHHyZ2+1suZOUxANqqfoVI9weuDEbQuvZLdUg2
 iC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693040347; x=1693645147;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMV0LkL6XTvk7F0cHIqMZf1QrNVpfMIvkj9fG41FagQ=;
 b=H4qvKOvioBiRmdoxEUwHNk0/thI7vAhy/1fvgfgw04+h3pQy0PBMrpFWBpED2UtFTK
 v7lz8jh3+ocW2ULsvG3xLKAQ17+zALdFlP2K56OOwIVxVKE9wk1d1nSB1IUlXjnzAZAQ
 UPdnTpgmnZFipwF+vmxnYf3KfZ+DdIQ04w6QPP8BAxz9ReQzuoo/8l05sWO2ZcPVP0Zb
 jGXPjTMWtnVhohgdVNUvu4p1AUg+218T568WC9W2GiQ4Qxsij2BIefL1oOo7Een8FTo6
 rKK7F7wtWNKUuC5OrKKVHoJwnaUgnVBkKcSQe87Z6R9x0mp/zCJl/rZM71lilSNcPNQg
 XHxg==
X-Gm-Message-State: AOJu0Yxi77XqEj6rXkEU6XOmhFlyuYTnfF4/+ygJECxONNZTMPVg9BXn
 S/trxAfjQmi5VBaPmjG70cRmaw==
X-Google-Smtp-Source: AGHT+IGNz3iCa5gUvcXoBK3a6bk4ESqUsl3Vqx26TgGDafVng3nY3NLrZPaFN8CklqhDuZLTOwb8nA==
X-Received: by 2002:ac2:4c82:0:b0:4ff:87f6:6ee5 with SMTP id
 d2-20020ac24c82000000b004ff87f66ee5mr13340004lfl.10.1693040346718; 
 Sat, 26 Aug 2023 01:59:06 -0700 (PDT)
Received: from [192.168.1.101] (abyl74.neoplus.adsl.tpnet.pl. [83.9.31.74])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004fe0760354bsm631206lfq.275.2023.08.26.01.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Aug 2023 01:59:06 -0700 (PDT)
Message-ID: <83b9eb79-ba6d-4485-a945-c9a14bbd18d2@linaro.org>
Date: Sat, 26 Aug 2023 10:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Fix SM6375 GPU ID
To: Rob Clark <robdclark@gmail.com>
References: <20230825-topic-6375_gpu_id-v1-1-e24f46d7f139@linaro.org>
 <CAF6AEGsNr+5zaXqKRhyeY6NV+iRD+Yz8ftqiX6Z08esoyh=DzQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGsNr+5zaXqKRhyeY6NV+iRD+Yz8ftqiX6Z08esoyh=DzQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.08.2023 03:29, Rob Clark wrote:
> On Fri, Aug 25, 2023 at 2:11 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> SM6375 comes with a patchlevel=1. Fix the chipid up to reflect that.
>>
>> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 575e7c56219f..f2d9d34ed50f 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -331,7 +331,7 @@ static const struct adreno_info gpulist[] = {
>>                 ),
>>         }, {
>>                 .machine = "qcom,sm6375",
>> -               .chip_ids = ADRENO_CHIP_IDS(0x06010900),
>> +               .chip_ids = ADRENO_CHIP_IDS(0x06010901),
> 
> r-b, but maybe we should list both to be safe?  But unsure if any
> patchlevel=0 things are out there in the wild...
AFAICT only 1 for this soc

Konrad

I guess we could add
> it back in later if needed
> 
> BR,
> -
> 
>>                 .family = ADRENO_6XX_GEN1,
>>                 .revn = 619,
>>                 .fw = {
>>
>> ---
>> base-commit: 6269320850097903b30be8f07a5c61d9f7592393
>> change-id: 20230825-topic-6375_gpu_id-cf1596e2b147
>>
>> Best regards,
>> --
>> Konrad Dybcio <konrad.dybcio@linaro.org>
>>
