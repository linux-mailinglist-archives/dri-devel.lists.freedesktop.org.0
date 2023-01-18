Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C671B6710D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E510E647;
	Wed, 18 Jan 2023 02:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99A910E646
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:09:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b4so28213981edf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h45c9opw5hKGTCcB/tsugF5F/flaauP/hx3l+Kv0DkI=;
 b=qkUVWE0bjBEHwI+TsqkgN6PQjtBXdQX9NeH3pCU/bBD7EHfUOyrc+IdUK8xo2bWcat
 vPznoNnvIg131hDNEXpeeYhdLkOypEZYx0VfhysCdQ8O9MlK97mg8GLJJCgw6Nf46gPD
 WgCer7blIAQsvg25hdKRenSPbecbty3jDnczXRh8db5U/Wequ3Zj5oHp1qKSQzAcyxnh
 D1lk2bqe+7wOUV0+R4DufB9gD73vKGVeZa+ff5VK8q1lJCLMbSkA4GYCSIdwKoEsYGV3
 RdznFyYeYt34ESAUiyEpM0Z+KPt2dkUNbnRvHEXgOuNTUXuCi6XHhAenPO3uvF9o3esL
 Dp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h45c9opw5hKGTCcB/tsugF5F/flaauP/hx3l+Kv0DkI=;
 b=nlFiqIyzQlqdeK+edtG+K0W+7yh62/QDNK8puqJ408TxFMYisv+JkgLvCx6d0HZXUQ
 yWv1XerTyWKSk0WTK0pHd5uYcKdTcPv2DVG7+hdTDOhUtGBiLJkXue/7ts/3bSHS+x62
 +eazK2noh1YFfnuX5Zj4KtYeBczw257gF8XxU6TwnQzFHIfvClVKIm2HR2EpDAfqG5OI
 8gsDEhyjd/IBjPMV8RZTjYKidfJaSCCeBRK36zAmikIKobo6UvXdg8fnx5T6YtEsJy+L
 lFF1LlmTVTb3+8jgWBK53N6qAnRokbJp9SATPbijYPZvCLEI47+cqKrr4dXgt8h/P0/8
 I45w==
X-Gm-Message-State: AFqh2kpe6g0cJ/pCesgDT+wIiAtH+wcl5Yx/7k5zxX5BtmoknnELyzx2
 etDe41M2UwS27v6WElLGBZXm8A==
X-Google-Smtp-Source: AMrXdXtYjWmMMXEO/y8EdQeWfRAezze5JZBQBsGcTw8ytazGrXWb3uQ2XuTWBKoHk50l+XCgwEI+bg==
X-Received: by 2002:a05:6402:5305:b0:499:8849:5fb6 with SMTP id
 eo5-20020a056402530500b0049988495fb6mr5465692edb.30.1674007768210; 
 Tue, 17 Jan 2023 18:09:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r8-20020aa7c148000000b0046951b43e84sm13495464edp.55.2023.01.17.18.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 18:09:27 -0800 (PST)
Message-ID: <80a826c0-1d4d-fd0f-5ae6-06ceaaf4abd7@linaro.org>
Date: Wed, 18 Jan 2023 04:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to sc8280xp_regdma
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
 <785376c2-26de-10c4-c7a0-22ebb2c086fd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <785376c2-26de-10c4-c7a0-22ebb2c086fd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 04:08, Abhinav Kumar wrote:
> 
> 
> On 1/17/2023 6:04 PM, Dmitry Baryshkov wrote:
>> SC8280XP configuration missed the reg_dma configuration. We do not use
>> regdma for now, but let's put the correct pointer anyway.
>>
>> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 4375e72a9aab..3d0fbc1746e2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg 
>> sc8280xp_dpu_cfg = {
>>       .intf = sc8280xp_intf,
>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>       .vbif = sdm845_vbif,
>> +    .reg_dma_count = 1,
> 
> Lets stick to the convention of the rest of the entries and use ARRAY_SIZE.

regdma is not an array, so all platforms use 1 here. We should probably 
change this, as some of newer platforms seem to have two regdma blocks, 
but I haven't taken a look into that.

> 
>> +    .dma_cfg = &sc8280xp_regdma,
>>       .perf = &sc8280xp_perf_data,
>>       .mdss_irqs = IRQ_SC8280XP_MASK,
>>   };

-- 
With best wishes
Dmitry

