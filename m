Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05274B5CB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 19:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8A10E5CB;
	Fri,  7 Jul 2023 17:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCCD10E5CB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 17:27:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso3527742e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688750839; x=1691342839;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pie0TuI2jx2W3y8h1za0Cn+RvUBauG4amwyIpA5SmOA=;
 b=X00vIOV2FhhbwPlMjuxAVk83Z8e87CvT7IDRoto1igGEGTSZaJBg5TB3DMOWz4T2X1
 4EZBkAq4KAUjHG0Om2hDq/tLvQVMqVoTZfMSjxUA24acDg/cSryqGH4p5ZPLrI6r3L8t
 aHbklzy7lv5HzWxFw430mKS59ecL5nwDtcB8U6A3tOhspdfp2aJNKctMhBNhHElYhYab
 5eGUX2mY5PC6sE0ka6p2AMyulBmron46nNTFpzq3xlReyCApJe8cBFF+tOFN6lu4j1x1
 avaLq+YkxNneDKt+5evi/84tRs10m3up9wpEk+RazkMXIVhzlITgeEGa5scAhaBERujF
 jWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688750839; x=1691342839;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pie0TuI2jx2W3y8h1za0Cn+RvUBauG4amwyIpA5SmOA=;
 b=JvUo8YKZY7ptW+tg25D+LoFPdKV4djHwn3jJe67R2nRGVxW0l+p8M3xCUFIbQYnZVq
 i+MQztCii4GlZFL0pq0mGqx/lRMHEV2MhkQeEhioP2gSKE0p0jG648K8BY2v2Ako/qi2
 GxeBLmTd/LkrFtUEuGzj0aG7wLbyctwncFna3tJPPZwUNAQYOOVfvibY6oCchkDUkJP5
 gDOuOSO9FVKDBAkWf8oy5qnBkOtoB6OXug3jGqpL+SeT3F8aYBXbKAv9npLmDlmMAgl0
 TzIBx5iwKIwz/apDQkKJnbxpVV6VnHBVPkHvJQGbXoUN7rD65tDTtsez0Q5ALwmRJLEQ
 vGbg==
X-Gm-Message-State: ABy/qLaqAosNa9bksUk5cCuHqJIHpWB7SRDJ4oB0KMxE4cw8ohc98Wqr
 kAoj3verlQOkaRXnQ8dCfXV0Yw==
X-Google-Smtp-Source: APBJJlGgQ0wGNjCEyJhkPBqPKGqZ6eZBMe0jQXs1JyNCnpqaoR0cmVPsWC8RXhGdVuEkMLwMVl+efg==
X-Received: by 2002:ac2:5f92:0:b0:4fb:9075:4fca with SMTP id
 r18-20020ac25f92000000b004fb90754fcamr4290919lfe.11.1688750839465; 
 Fri, 07 Jul 2023 10:27:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a19c20f000000b004efae490c51sm752504lfc.240.2023.07.07.10.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 10:27:18 -0700 (PDT)
Message-ID: <cc153fa9-b9e0-f714-ce5b-1a4a0cb55cc7@linaro.org>
Date: Fri, 7 Jul 2023 20:27:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH] drm/msm: Check for the GPU IOMMU during bind
Content-Language: en-GB
To: freedreno@lists.freedesktop.org, Akhil P Oommen
 <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ricardo Ribalda <ribalda@chromium.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>,
 David Airlie <airlied@gmail.com>
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
 <20230707150307.vb4otu5e6hwoadyf@amazon.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230707150307.vb4otu5e6hwoadyf@amazon.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 18:03, Jordan Crouse wrote:
> On Thu, Jul 06, 2023 at 09:55:13PM +0300, Dmitry Baryshkov wrote:
>>
>> On 10/03/2023 00:20, Jordan Crouse wrote:
>>> While booting with amd,imageon on a headless target the GPU probe was
>>> failing with -ENOSPC in get_pages() from msm_gem.c.
>>>
>>> Investigation showed that the driver was using the default 16MB VRAM
>>> carveout because msm_use_mmu() was returning false since headless devices
>>> use a dummy parent device. Avoid this by extending the existing is_a2xx
>>> priv member to check the GPU IOMMU state on all platforms and use that
>>> check in msm_use_mmu().
>>>
>>> This works for memory allocations but it doesn't prevent the VRAM carveout
>>> from being created because that happens before we have a chance to check
>>> the GPU IOMMU state in adreno_bind.
>>>
>>> There are a number of possible options to resolve this but none of them are
>>> very clean. The easiest way is to likely specify vram=0 as module parameter
>>> on headless devices so that the memory doesn't get wasted.
>>
>> This patch was on my plate for quite a while, please excuse me for
>> taking it so long.
> 
> No worries. I'm also chasing a bunch of other stuff too.
> 
>> I see the following problem with the current code. We have two different
>> instances than can access memory: MDP/DPU and GPU. And each of them can
>> either have or miss the MMU.
>>
>> For some time I toyed with the idea of determining whether the allocated
>> BO is going to be used by display or by GPU, but then I abandoned it. We
>> can have display BOs being filled by GPU, so handling it this way would
>> complicate things a lot.
>>
>> This actually rings a tiny bell in my head with the idea of splitting
>> the display and GPU parts to two different drivers, but I'm not sure
>> what would be the overall impact.
> 
> As I now exclusively work on headless devices I would be 100% for this,
> but I'm sure that our laptop friends might not agree :)

I do not know here. This is probably a question to Rob, as he better 
understands the interaction between GPU and display parts of the userspace.

> 
>> More on the msm_use_mmu() below.
>>
>>>
>>> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
>>> ---
>>>
>>>    drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++++-
>>>    drivers/gpu/drm/msm/msm_drv.c              | 7 +++----
>>>    drivers/gpu/drm/msm/msm_drv.h              | 2 +-
>>>    3 files changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> index 36f062c7582f..4f19da28f80f 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> @@ -539,7 +539,11 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>>>        DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
>>>                config.rev.minor, config.rev.patchid);
>>>
>>> -     priv->is_a2xx = config.rev.core == 2;
>>> +     /*
>>> +      * A2xx has a built in IOMMU and all other IOMMU enabled targets will
>>> +      * have an ARM IOMMU attached
>>> +      */
>>> +     priv->has_gpu_iommu = config.rev.core == 2 || device_iommu_mapped(dev);
>>>        priv->has_cached_coherent = config.rev.core >= 6;
>>>
>>>        gpu = info->init(drm);
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index aca48c868c14..a125a351ec90 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -318,11 +318,10 @@ bool msm_use_mmu(struct drm_device *dev)
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>
>>>        /*
>>> -      * a2xx comes with its own MMU
>>> -      * On other platforms IOMMU can be declared specified either for the
>>> -      * MDP/DPU device or for its parent, MDSS device.
>>> +      * Return true if the GPU or the MDP/DPU or parent MDSS device has an
>>> +      * IOMMU
>>>         */
>>> -     return priv->is_a2xx ||
>>> +     return priv->has_gpu_iommu ||
>>>                device_iommu_mapped(dev->dev) ||
>>>                device_iommu_mapped(dev->dev->parent);
>>
>> I have a generic feeling that both old an new code is not fully correct.
>> Please correct me if I'm wrong:
>>
>> We should be using VRAM, if either of the blocks can not use remapped
>> memory. So this should have been:
>>
>> bool msm_use_mmu()
>> {
>>   if (!gpu_has_iommu)
>>     return false;
>>
>>   if (have_display_part && !display_has_mmu())
>>     return false;
>>
>>   return true;
>> }
>>
>> What do you think.
> 
> I would have to see (and try) the real code but that seems like it might
> be reasonable.

Sure, let me craft it then.

> I would like to hear from some of the a2xx users too
> because this mostly affects them. On 3xx and newer you've always had the
> option of not having a MMU for GPU or display but I can't think of any
> use cases where you wouldn't want it.

msm8974 doesn't have (working) IOMMU driver. I also think there was an 
issue somewhere around sdm630/660. And the wonderful msm8992/4, IIRC, 
also don't have one.

Also the headless mode was quite useful for bringing up platforms, as it 
allowed us to test GPU separately (and ofc. in some cases even w/o MMU).

I have both a2xx (only iMX for now) and a3xx for the tests here, on my 
desk.

-- 
With best wishes
Dmitry

