Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E656C74DFD6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 22:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53AC10E2D3;
	Mon, 10 Jul 2023 20:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60D10E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 20:54:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so7756924e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689022444; x=1691614444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G13MU++Hl725dEif28QmMqrP2IERpf/MG7YmFR/Xwy4=;
 b=NLH+BfyIWjRPR682uKLEiGgUxBJuXKiXe08BGf4hxnCLHlIGx87daghOtT9KJ/ktDM
 iL55X76cT2x1pJub77gKLDir3k5/fi7vJuu5BvHtVkwYmDou+f6z3SEWxGFwXGhD+48Y
 HzIw5D3XaD88iSI3+oAtg5TVbYSDF4gA4LVTkMhOSUhu+QtnSBmu38uNzZ4vzDVLF5xp
 PkFZtFSt/NEoA07WdIXD2NECUIS/wGNdohoXtEg7wosH5FXetRsgv1+qCATRkbBXY3fX
 EdtLwMq13hMDsLsTuHlNeExPdw0m8k65/HAxrX0ukHuuO52Kn+Nj91Ur9M2c6Tbwo4aj
 ibgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689022444; x=1691614444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G13MU++Hl725dEif28QmMqrP2IERpf/MG7YmFR/Xwy4=;
 b=U+fx2hOudAkCg7a9e1BFwIraIxGCHNqrH2AuMUG28ftebEXE43MCoo50kvoh8o4xgy
 BWVbMGhggTidYH8TaOP7xLSHnVxYLewbjMarHN3sHFgtOaPUDeOEMAf6X7gXPcoZPV9j
 qIy82MCmH/+fxPC6T7W2yiiTZ003a5cArjR1T/p/ynNvZyFhfjM+eA99I971toMJ+/5k
 iExuVyv5rrbotaGn9XP8Hr0JNv3G6cLDIqN6eoebS5xsUYXMlNfmujQKCuB7M4/VP+EJ
 m3ESXPmIiGsyOB+0bgaqBtZCk2MrfkIr/7iJLm+XySvbDxQZ2r0hoSKDn/BR+FZEGzwk
 nUhA==
X-Gm-Message-State: ABy/qLZIT6H/rtHPkn4wsE3qTO2R9D76XxbCmYofcave0UZJiD5fRW+E
 0vIle51vvRspxFvdPBihVU5klw==
X-Google-Smtp-Source: APBJJlG84vjZD6EToeATX/q3/IrlfPeCZqyrgGIbuplyOgjCIDQQpFiAwqLDp/c7LCPj4C7FK5jvHw==
X-Received: by 2002:a05:6512:ba1:b0:4f3:80a3:b40a with SMTP id
 b33-20020a0565120ba100b004f380a3b40amr13107838lfv.69.1689022443890; 
 Mon, 10 Jul 2023 13:54:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05651211f000b004fbab80ecefsm44941lfs.145.2023.07.10.13.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 13:54:03 -0700 (PDT)
Message-ID: <d3f5cf11-e481-2c50-b712-f8832265e897@linaro.org>
Date: Mon, 10 Jul 2023 23:54:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 07/12] drm/msm/adreno: Move speedbin mapping
 to device table
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-8-robdclark@gmail.com>
 <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
 <CAF6AEGv2K9Ar8=96H2_=BJc=hqFNnh2M5fvbG5p5gjoAEfR=-A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGv2K9Ar8=96H2_=BJc=hqFNnh2M5fvbG5p5gjoAEfR=-A@mail.gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2023 22:56, Rob Clark wrote:
> On Thu, Jul 6, 2023 at 7:54 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 07/07/2023 00:10, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> This simplifies the code.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
>>>    drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
>>>    3 files changed, 92 insertions(+), 155 deletions(-)
>>
>>
>> Interesting hack, I'd say.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Minor nit below.
>>
>>>
>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> index d5335b99c64c..994ac26ce731 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -72,8 +72,33 @@ struct adreno_info {
>>>        u32 inactive_period;
>>>        const struct adreno_reglist *hwcg;
>>>        u64 address_space_size;
>>> +     /**
>>> +      * @speedbins: Optional table of fuse to speedbin mappings
>>> +      *
>>> +      * Consists of pairs of fuse, index mappings, terminated with
>>> +      * UINT_MAX sentinal.
>>> +      */
>>> +     uint32_t *speedbins;
>>
>> Would it be better to explicitly list this as pairs of uint32_t? And
>> then use braces in ADRENO_SPEEDBIN initialisation.
> 
> It would mean the sentinel would take 8 bytes instead of 4.. maybe
> that is over-thinking it, but it was the reason I just stuck with a
> flat table

Guessed so. But we are wasting so much memory already... I think that 
the paired structure would better reflect the data - it's not a flat 
list, but a list of nvmem <-> speedbin pairs.

> 
> BR,
> -R
> 
>>>    };
>>>
>>> +/*
>>> + * Helper to build a speedbin table, ie. the table:
>>> + *      fuse | speedbin
>>> + *      -----+---------
>>> + *        0  |   0
>>> + *       169 |   1
>>> + *       174 |   2
>>> + *
>>> + * would be declared as:
>>> + *
>>> + *     .speedbins = ADRENO_SPEEDBINS(
>>> + *                      0,   0,
>>> + *                      169, 1,
>>> + *                      174, 2
>>> + *                  ),
>>> + */
>>> +#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
>>> +
>>>    const struct adreno_info *adreno_info(struct adreno_rev rev);
>>>
>>>    struct adreno_gpu {
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

