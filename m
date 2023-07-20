Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E975B544
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 19:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4383210E5EB;
	Thu, 20 Jul 2023 17:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B7710E5E2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 17:11:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so1653690e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689873084; x=1690477884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bALuSQOEaIXV7+8g1kPlEIEXPY6havyGO8belxbKINE=;
 b=QM+Bk2/Ep503vHxFU8hlMOEKrBdsf2QJ5ANYqnZh42ITGinI8GBXKbTrrxD6zGYeu7
 10HHp1LKK6rHEXKzoHqGBXXAWEAxt4Ql9azpLo33NnKNSX8fMH7WKRQZcyi0afkOapKl
 Qoy7bPCufCiIvnbBN4bU82vxImNCcUOFdMJw9dlHTz92SQVN2eFmbkKJ7mSEyuQ1dss7
 3K4KQDTdz364IpO+9GYipvo4LE7O1z/0psgrMbi5h7gHfC1DEuXsUMdJ2nbeI4Z7q5m4
 ZqFhplW+oC9hQKkgVZerbV72KjJPuu4ZYpGT+03zFJgiZ8tbBgZGlnJ9rTSjLae473Ud
 2WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689873084; x=1690477884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bALuSQOEaIXV7+8g1kPlEIEXPY6havyGO8belxbKINE=;
 b=VqYrsCNLgiO3MtKgcPs9t0ay7nOphxvwH93LbXWNAH9FyIOjNiIm21Mg/Rz8UdgwRH
 RjY4ncbqKIFdNhqvs4g41icpmhQhbj88k5JEfAFubsmfz2TLGvqmtxXZIqhu62uRWqNC
 3CI4r81ol6FFzEyFRSz/q2z5efr5LzRZf0dIbmAua57v6wrKVse621lrqLAONl/Cjbv+
 lTiTLlRR2QdSDR1oX1wldHb4f8jq2yegx5EWJ739gSNuuY5Bfj+9lUsiBdozfRg8hD0e
 eiuN/DZNjG+rgYBpzYMeGzAunuiIvhtpcWUL/TRCHWSXn1ICHRx7oDFUeipitcRDT82L
 jmVg==
X-Gm-Message-State: ABy/qLbtSmX3vUGI++cH3KXJPGKx78Ec34Nq2HDGmocdOIpDg/9mRV2h
 ua/G9FxtIskNmQqk+9J++cpezQ==
X-Google-Smtp-Source: APBJJlGOiKHsb1V0MVEKlaWuSBLsg+MjtKiZQvBXh+G+6GT0IskQ2rgyrt8zPoyO3+O22tAEZL2Zrw==
X-Received: by 2002:a19:2d05:0:b0:4fa:5e76:7ad4 with SMTP id
 k5-20020a192d05000000b004fa5e767ad4mr2564840lfj.10.1689873083816; 
 Thu, 20 Jul 2023 10:11:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020ac25a46000000b004fdc0023a50sm286045lfn.232.2023.07.20.10.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 10:11:23 -0700 (PDT)
Message-ID: <5f903395-9e5a-d4bc-067a-91256588c661@linaro.org>
Date: Thu, 20 Jul 2023 20:11:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm: Check for the GPU IOMMU during bind
To: Rob Clark <robdclark@gmail.com>
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
 <CAF6AEGs89FRmFsENLkP-Dg1ZJN2LzCfxY2-+do9jH9b8L-XZxg@mail.gmail.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGs89FRmFsENLkP-Dg1ZJN2LzCfxY2-+do9jH9b8L-XZxg@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, Jordan Crouse <jorcrous@amazon.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/07/2023 18:52, Rob Clark wrote:
> On Thu, Jul 6, 2023 at 11:55 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
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
>>
>> I see the following problem with the current code. We have two different
>> instances than can access memory: MDP/DPU and GPU. And each of them can
>> either have or miss the MMU.
>>
>> For some time I toyed with the idea of determining whether the allocated
>> BO is going to be used by display or by GPU, but then I abandoned it. We
>> can have display BOs being filled by GPU, so handling it this way would
>> complicate things a lot.
> 
> There is MSM_BO_SCANOUT .. but it wouldn't completely surprise me if
> it isn't used in some place where it should somewhere or other.  But
> that is the hint that contiguous allocation should be used if the
> display doesn't support some sort of iommu.  (Using a GPU without some
> sort of mmu/iommu isn't something sane to do.. the only reason the
> support for that exists at all is to aid bringup.  I wouldn't call
> that a "supported" configuration.)
> 
>> This actually rings a tiny bell in my head with the idea of splitting
>> the display and GPU parts to two different drivers, but I'm not sure
>> what would be the overall impact.
> 
> Userspace does have better support for split display/gpu these days
> than it did when drm/msm was first merged.  It _might_ just work if
> one device only advertised DRIVER_RENDER and the other
> MODESET/ATOMIC.. but I'd be a bit concerned about breaking things.  I
> guess you could try some sort of kconfig knob to have two "msm"
> devices and see what breaks, but I'm a bit skeptical that we could
> make this the default anytime soon.

Thanks. Yes, breaking userspace would be a bad thing. I do not know if 
we should consider a single GPU+KMS driver to be an ABI and thus set in 
stone.

> 
> For now, just addressing the only-display and only-gpu cases
> (continuing with the single device arrangement when you have both
> display and gpu), maybe split up drm_dev_alloc() and drm_dev_init() so
> that we could use drm_device::driver_features to mask out
> DRIVER_RENDER if needed.

Yep. I'll continue following that path.

> 
> BR,
> -R
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
>>    if (!gpu_has_iommu)
>>      return false;
>>
>>    if (have_display_part && !display_has_mmu())
>>      return false;
>>
>>    return true;
>> }
>>
>> What do you think.
>>
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>>> index 9f0c184b02a0..f33f94acd1b9 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>> @@ -126,7 +126,7 @@ struct msm_drm_private {
>>>        struct msm_gpu *gpu;
>>>
>>>        /* gpu is only set on open(), but we need this info earlier */
>>> -     bool is_a2xx;
>>> +     bool has_gpu_iommu;
>>>        bool has_cached_coherent;
>>>
>>>        struct drm_fb_helper *fbdev;
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

