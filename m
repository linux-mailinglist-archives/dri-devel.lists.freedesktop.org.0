Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5E38B3E9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C746F4A5;
	Thu, 20 May 2021 16:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299106F4A5;
 Thu, 20 May 2021 16:01:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gb17so8100336ejc.8;
 Thu, 20 May 2021 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=imwdyaKKV+NTp3FXAevAFcHpCToqH3iOS9Vt3SE6cTE=;
 b=XBiHCka5uBHuz5fn0Z4r0qzSTdFtAIT7vSNFN52Xm4iLwLfjuvEAe9LOaTuP5pmFKx
 KecdhBkcsesCEzeLN5jY21HTxjnuzhI5b1Am95hg+/n4PgSIOY0UHLQpqsQihdkcWXV1
 wuLKGfkcuwHCWPJ2BLgZ30k88QmJheHEex6rPb/rErpvhfBS04PSAYZBASK2esYVfy6x
 zzOPLbOjaDpswhkgU+OlqR3ppMAX5q4uSWKZube+RUpAi4diGO+rzVP6K5fky1Er+gju
 h9fNgcQ/nIgyauKeJFJfn0W5kiL3KiMHo32joM9Pji1fjEjxzh79jljdi/VxcTR3uLa1
 jf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=imwdyaKKV+NTp3FXAevAFcHpCToqH3iOS9Vt3SE6cTE=;
 b=RthiNwFaCG9uaAONf2WUsRW5u5bOcfbcxMJ1lE7Wv8A45izimE2cPYLLA1PmWVr4Hr
 OX211KOUJ0N80Aq2I28Yk5vEtQ3pQTOk3rrvl4Qr5xbJq9S+BKAx7jL4NThhSoefUWYI
 kuWXlEm5EJziAI1vU67PjzrHSKw41M+/nLH/v5AVjrEHtlPROTfE7stq8SpwXr4cvW4r
 wEisVojtDeT2ycEI5RCmtoVHEhML6Y5XV/t1MGeCu4LOtHaGP83u1yqDlmanos7qDS5c
 W60fsChytbcz2WJg3V6Q4Hrt4kQulr/iCIOGn07GKAK+vWO1XeWXsG6Soj6MytBcavYn
 G+Bg==
X-Gm-Message-State: AOAM530noCqNwh1AIPwXgoEvZT2ttwsmt6etrF3ssDvrK4K5uCYNHK4n
 b870PP4wdFLJLL3JXHFFMKI=
X-Google-Smtp-Source: ABdhPJxeDIFokndYejULm3Ge/2ATpBq0kBTh/yX8nSrUPqbj4W3Ug8DZwfF2ngl9h024wyPYc34BXQ==
X-Received: by 2002:a17:907:2d0d:: with SMTP id
 gs13mr5570681ejc.266.1621526501621; 
 Thu, 20 May 2021 09:01:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id i19sm1573470ejd.114.2021.05.20.09.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 09:01:41 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost fence op
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
Date: Thu, 20 May 2021 18:01:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 16:54 schrieb Rob Clark:
> On Thu, May 20, 2021 at 7:11 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 20.05.21 um 16:07 schrieb Rob Clark:
>>> On Wed, May 19, 2021 at 11:47 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Uff, that looks very hardware specific to me.
>>> Howso?  I'm not sure I agree.. and even if it was not useful for some
>>> hw, it should be useful for enough drivers (and harm no drivers), so I
>>> still think it is a good idea
>>>
>>> The fallback plan is to go the i915 route and stop using atomic
>>> helpers and do the same thing inside the driver, but that doesn't help
>>> any of the cases where you have a separate kms and gpu driver.
>> Yeah, that's certainly not something we want.
>>
>>>> As far as I can see you can also implement completely inside the backend
>>>> by starting a timer on enable_signaling, don't you?
>>> Not really.. I mean, the fact that something waited on a fence could
>>> be a useful input signal to gpu freq governor, but it is entirely
>>> insufficient..
>>>
>>> If the cpu is spending a lot of time waiting on a fence, cpufreq will
>>> clock down so you spend less time waiting.  And no problem has been
>>> solved.  You absolutely need the concept of a missed deadline, and a
>>> timer doesn't give you that.
>> Ok then I probably don't understand the use case here.
>>
>> What exactly do you try to solve?
> Basically situations where you are ping-ponging between GPU and CPU..
> for example if you are double buffering instead of triple buffering,
> and doing vblank sync'd pageflips.  The GPU, without any extra signal,
> could get stuck at 30fps and a low gpu freq, because it ends up idle
> while waiting for an extra vblank cycle for the next back-buffer to
> become available.  Whereas if it boosted up to a higher freq and
> stopped missing a vblank deadline, it would be less idle due to
> getting the next back-buffer sooner (due to not missing a vblank
> deadline).

Ok the is the why, but what about the how?

How does it help to have this boost callback and not just start a time 
on enable signaling and stop it when the signal arrives?

Regards,
Christian.

>
> BR,
> -R
>
>> Thanks,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> Christian.
>>>>
>>>> Am 19.05.21 um 20:38 schrieb Rob Clark:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> Add a way to hint to the fence signaler that a fence waiter has missed a
>>>>> deadline waiting on the fence.
>>>>>
>>>>> In some cases, missing a vblank can result in lower gpu utilization,
>>>>> when really we want to go in the opposite direction and boost gpu freq.
>>>>> The boost callback gives some feedback to the fence signaler that we
>>>>> are missing deadlines, so it can take this into account in it's freq/
>>>>> utilization calculations.
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>>     include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
>>>>>     1 file changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 9f12efaaa93a..172702521acc 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
>>>>>         signed long (*wait)(struct dma_fence *fence,
>>>>>                             bool intr, signed long timeout);
>>>>>
>>>>> +     /**
>>>>> +      * @boost:
>>>>> +      *
>>>>> +      * Optional callback, to indicate that a fence waiter missed a deadline.
>>>>> +      * This can serve as a signal that (if possible) whatever signals the
>>>>> +      * fence should boost it's clocks.
>>>>> +      *
>>>>> +      * This can be called in any context that can call dma_fence_wait().
>>>>> +      */
>>>>> +     void (*boost)(struct dma_fence *fence);
>>>>> +
>>>>>         /**
>>>>>          * @release:
>>>>>          *
>>>>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>>>>>         return ret < 0 ? ret : 0;
>>>>>     }
>>>>>
>>>>> +/**
>>>>> + * dma_fence_boost - hint from waiter that it missed a deadline
>>>>> + *
>>>>> + * @fence: the fence that caused the missed deadline
>>>>> + *
>>>>> + * This function gives a hint from a fence waiter that a deadline was
>>>>> + * missed, so that the fence signaler can factor this in to device
>>>>> + * power state decisions
>>>>> + */
>>>>> +static inline void dma_fence_boost(struct dma_fence *fence)
>>>>> +{
>>>>> +     if (fence->ops->boost)
>>>>> +             fence->ops->boost(fence);
>>>>> +}
>>>>> +
>>>>>     struct dma_fence *dma_fence_get_stub(void);
>>>>>     u64 dma_fence_context_alloc(unsigned num);
>>>>>
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

