Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A2A74BA38
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8DD10E624;
	Fri,  7 Jul 2023 23:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797210E61F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:54:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso3850539e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688774054; x=1691366054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PLnx/P9gxfVU2KuGk2enTM15zHtanOp8tHlH1fAp/Ps=;
 b=EU5Hg3MpFMER9hSfL/f35o8rQEjzer+weiz6R9ZiRSlP4+oqmectRbH19f3Ix2hy1E
 CAScG+FAelnVZ6t8/Iz+ylVmnw+9tXRMhTADxEQ2Q9D7KI63Sr1sG9hrb8t/x8Ozw5Pc
 VCtkncG7KSSRS6IrdhVZk/OHKBd1daFWfscr0ut8X7VkF+Fi0tCRhwSv+ZwpmTB18WvL
 87bPhntRi5UKHxjob+7Ntglw8cEN8xtLTNMWkKjWKLwfQ/5bXfhB1pCQNBsk0he+3uxS
 BOdc8IpZrVb4GeprilsVTcTABRadrFl/jDDIcq/b25m7dvEOYj8M2WTvXCNLBkYdv+ZJ
 mcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688774054; x=1691366054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PLnx/P9gxfVU2KuGk2enTM15zHtanOp8tHlH1fAp/Ps=;
 b=Yoy3nNqi71EFxEvOWHXfrJz6SfPLlNAQlTvXh3nlAoxVpI6CwNZ4Ytr9CeiKtwv7J1
 ssOAtpHNqIq02myYwtaSoMIwvEGb05M8QelJmNJsUwOPiGtepdKVLaNUTJBnzsIGktb0
 4LzIe5si7H8Itk4efWEG690BOeTe3qEgGUtQ6zifV+h6k60uexm+wIndFBzCYHgEsKXL
 m8jEsbGLZYy3V0kXwRCv6rLYduu5z9p4Bo5enWjbSz1hONJ1HL0l64vj0FzQhmBz8ZG9
 oLuNKavtmW6zyDLAlt90ay9svhVcdDw4HsqYTN3bLoCzGbyAfU8sOV4UC08fIjjgA1Fz
 5V8Q==
X-Gm-Message-State: ABy/qLZc5SkUbbUTc21DypGRDMs+YFslDIFiyo3+p+Qy6VKST17j1UxZ
 aJJlRbg/miMZqC2+bsZrfHA/jw==
X-Google-Smtp-Source: APBJJlFYMVdmjufZ4oqNOruQl5sUMys+Lg2FXEg2zrDAD9EG+Qi0EBoaJ7iSbqZ7lhgJvjXE6SpLGA==
X-Received: by 2002:a19:7106:0:b0:4f8:69f8:47a0 with SMTP id
 m6-20020a197106000000b004f869f847a0mr4565515lfc.29.1688774054539; 
 Fri, 07 Jul 2023 16:54:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w14-20020ac254ae000000b004fb744ccb83sm841507lfk.298.2023.07.07.16.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 16:54:13 -0700 (PDT)
Message-ID: <37561518-8878-f084-513d-fa594305cf6b@linaro.org>
Date: Sat, 8 Jul 2023 02:54:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 09/12] drm/msm/adreno: Add adreno family
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-10-robdclark@gmail.com>
 <c41b8ce0-8149-911b-0c6e-f963c830ac92@linaro.org>
 <688c5dc3-ad46-2dfe-e418-c1b1cba767b8@linaro.org>
 <CAF6AEGtGcyUNfFfEWPti5U+=z0hZ9Sj57u5SGpObXwz14QcZ4g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGtGcyUNfFfEWPti5U+=z0hZ9Sj57u5SGpObXwz14QcZ4g@mail.gmail.com>
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

On 08/07/2023 02:52, Rob Clark wrote:
> On Thu, Jul 6, 2023 at 8:16 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 07/07/2023 02:35, Konrad Dybcio wrote:
>>> On 6.07.2023 23:10, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Sometimes it is useful to know the sub-generation (or "family").  And in
>>>> any case, this helps us get away from infering the generation from the
>>>> numerical chip-id.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>> [...]
>>>
>>>>               .rev   = ADRENO_REV(5, 0, 8, ANY_ID),
>>>> +            .family = ADRENO_5XX,
>>>>               .revn = 508,
>>> 508 is from 530 fam
>>>
>>>>               .fw = {
>>>>                       [ADRENO_FW_PM4] = "a530_pm4.fw",
>>>> @@ -156,6 +168,7 @@ static const struct adreno_info gpulist[] = {
>>>>               .zapfw = "a508_zap.mdt",
>>>>       }, {
>>>>               .rev   = ADRENO_REV(5, 0, 9, ANY_ID),
>>>> +            .family = ADRENO_5XX,
>>>>               .revn = 509,
>>> 509 and 512 are from 540 fam
>>>
>>>>               .fw = {
>>>>                       [ADRENO_FW_PM4] = "a530_pm4.fw",
>>>> @@ -173,6 +186,7 @@ static const struct adreno_info gpulist[] = {
>>>>               .zapfw = "a512_zap.mdt",
>>>>       }, {
>>>>               .rev   = ADRENO_REV(5, 1, 0, ANY_ID),
>>>> +            .family = ADRENO_5XX,
>>>>               .revn = 510,
>>> 510 is 530ish but I think it's closer to 505 or whatever the
>>> 8953 gpu was called
>>
>> I'd say, there were following generations here:
>>
>> - a505 / a506 / a508
>> - a509 / a512
>> - a510
>> - a530
>> - a540
>>
>> Indeed a50x were close to a530 in some aspects and a509/512 being closer
>> to a540, but I don't think they were the same family.
> 
> As a practical matter, I chose to defer splitting a3xx/a4xx/a5xx into
> sub-generations, simply because we didn't have any use for that yet.
> For a2xx and a6xx there was a clear immediate use for (most of) it,
> and what isn't used falls out of usage of sub-generation
> classification we have in mesa, so I have a lot of confidence in the
> split.
> 
> We can try and map it all out for the other gens now.. or simply just
> wait until there is a use for it.  I'm not super against mapping it
> out better now, but didn't feel that there was any down side to just
> punting on that.  It would be easy enough to do follow-up patches that
> refactor the code and split out the subgen enums at the same time.

Sure. I think this can be coupled with split of the gpulist.

> 
> BR,
> -R
> 
>>>
>>> [...]
>>>
>>>> -    priv->is_a2xx = config.rev.core == 2;
>>>> +    priv->is_a2xx = info->family < ADRENO_3XX;
>>> is this variable even needed now that there are explicit family values?
>>>
>>> Konrad
>>>>       priv->has_cached_coherent =
>>>>               !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 2e62a7ce9f13..75ff7fb46099 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -1079,8 +1079,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>       u32 speedbin;
>>>>       int ret;
>>>>
>>>> +    adreno_gpu->funcs = funcs;
>>>> +    adreno_gpu->info = adreno_info(config->rev);
>>>> +    adreno_gpu->rev = *rev;
>>>> +
>>>>       /* Only handle the core clock when GMU is not in use (or is absent). */
>>>> -    if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
>>>> +    if (adreno_has_gmu_wrapper(adreno_gpu) ||
>>>> +        adreno_gpu->info->family < ADRENO_6XX_GEN1) {
>>>>               /*
>>>>                * This can only be done before devm_pm_opp_of_add_table(), or
>>>>                * dev_pm_opp_set_config() will WARN_ON()
>>>> @@ -1096,10 +1101,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>                       devm_pm_opp_set_clkname(dev, "core");
>>>>       }
>>>>
>>>> -    adreno_gpu->funcs = funcs;
>>>> -    adreno_gpu->info = adreno_info(config->rev);
>>>> -    adreno_gpu->rev = *rev;
>>>> -
>>>>       if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>>>               speedbin = 0xffff;
>>>>       adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index 6066cfaaea52..2fa14dcd4e40 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -29,6 +29,25 @@ enum {
>>>>       ADRENO_FW_MAX,
>>>>    };
>>>>
>>>> +/**
>>>> + * @enum adreno_family: identify generation and possibly sub-generation
>>>> + *
>>>> + * In some cases there are distinct sub-generations within a major revision
>>>> + * so it helps to be able to group the GPU devices by generation and if
>>>> + * necessary sub-generation.
>>>> + */
>>>> +enum adreno_family {
>>>> +    ADRENO_2XX_GEN1,  /* a20x */
>>>> +    ADRENO_2XX_GEN2,  /* a22x */
>>>> +    ADRENO_3XX,
>>>> +    ADRENO_4XX,
>>>> +    ADRENO_5XX,
>>>> +    ADRENO_6XX_GEN1,  /* a630 family */
>>>> +    ADRENO_6XX_GEN2,  /* a640 family */
>>>> +    ADRENO_6XX_GEN3,  /* a650 family */
>>>> +    ADRENO_6XX_GEN4,  /* a660 family */
>>>> +};
>>>> +
>>>>    #define ADRENO_QUIRK_TWO_PASS_USE_WFI              BIT(0)
>>>>    #define ADRENO_QUIRK_FAULT_DETECT_MASK             BIT(1)
>>>>    #define ADRENO_QUIRK_LMLOADKILL_DISABLE            BIT(2)
>>>> @@ -63,6 +82,7 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>>>>    struct adreno_info {
>>>>       const char *machine;
>>>>       struct adreno_rev rev;
>>>> +    enum adreno_family family;
>>>>       uint32_t revn;
>>>>       const char *fw[ADRENO_FW_MAX];
>>>>       uint32_t gmem;
>>>> @@ -188,14 +208,14 @@ static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>>>>    {
>>>>       if (WARN_ON_ONCE(!gpu->info))
>>>>               return false;
>>>> -    return (gpu->info->revn < 300);
>>>> +    return gpu->info->family < ADRENO_2XX_GEN2;
>>>>    }
>>>>
>>>>    static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>>>>    {
>>>>       if (WARN_ON_ONCE(!gpu->info))
>>>>               return false;
>>>> -    return (gpu->info->revn < 210);
>>>> +    return gpu->info->family == ADRENO_2XX_GEN1;
>>>>    }
>>>>
>>>>    static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
>>>> @@ -338,29 +358,31 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>>>>    /* check for a615, a616, a618, a619 or any a630 derivatives */
>>>>    static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>>>>    {
>>>> -    return adreno_is_revn(gpu, 630) ||
>>>> -            adreno_is_revn(gpu, 615) ||
>>>> -            adreno_is_revn(gpu, 616) ||
>>>> -            adreno_is_revn(gpu, 618) ||
>>>> -            adreno_is_revn(gpu, 619);
>>>> +    if (WARN_ON_ONCE(!gpu->info))
>>>> +            return false;
>>>> +    return gpu->info->family == ADRENO_6XX_GEN1;
>>>>    }
>>>>
>>>>    static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
>>>>    {
>>>> -    return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
>>>> +    if (WARN_ON_ONCE(!gpu->info))
>>>> +            return false;
>>>> +    return gpu->info->family == ADRENO_6XX_GEN4;
>>>>    }
>>>>
>>>>    /* check for a650, a660, or any derivatives */
>>>>    static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
>>>>    {
>>>> -    return adreno_is_revn(gpu, 650) ||
>>>> -            adreno_is_revn(gpu, 620) ||
>>>> -            adreno_is_a660_family(gpu);
>>>> +    if (WARN_ON_ONCE(!gpu->info))
>>>> +            return false;
>>>> +    return gpu->info->family >= ADRENO_6XX_GEN3;
>>>>    }
>>>>
>>>>    static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
>>>>    {
>>>> -    return adreno_is_a640(gpu) || adreno_is_a680(gpu);
>>>> +    if (WARN_ON_ONCE(!gpu->info))
>>>> +            return false;
>>>> +    return gpu->info->family == ADRENO_6XX_GEN2;
>>>>    }
>>>>
>>>>    u64 adreno_private_address_space_size(struct msm_gpu *gpu);
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

