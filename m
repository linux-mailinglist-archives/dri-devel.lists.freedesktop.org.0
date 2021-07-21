Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943C3D11B3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFD66EB8D;
	Wed, 21 Jul 2021 14:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67006EB8D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:54:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id f17so2513825wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fJCUtp5Ezr2/nVbeDJg0rapyMRacEVyKOEH/JW/4NAI=;
 b=O+eXHk3oQOcusVLlyoqnjSS1k+k7fa32VC2aQw6tEzkjH9h9yoOyJMLw6GLIx5IfTy
 QxvuZfyViyxcKO8+4BZ4n+ccO7Z8zHa5KOl/wl1BH+TuDMwf9wLnQqZTWC4L6LtxRo43
 V+3cWseMnSysi68b6K/p9DjYUXx+u1Im5r5HlRuuuuFSgaoiKTQCc+VmarKHKgecpmsX
 QQXD16tvFTHvbU8WSGYAxaoXTf9o6tDV55f6DsrKth55WESm/kLvan3QuVUDg/9gtZ6N
 sofQNQ+7z9cm4tnxOOTiF9T1OGsT4UQd/OhZREWKCvLAHRrlgGdSxH+EG7xPA1Idxss+
 ZamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fJCUtp5Ezr2/nVbeDJg0rapyMRacEVyKOEH/JW/4NAI=;
 b=KQYjIUbLZ4ILlRmVJOXMuW6Mv7jLz6RpODt0Fi2l2zNNZypwr7j+djm88WwtMlIGOc
 4AKrca7P6BFhPpqmu11acreMT7JIs/ZFoUEPp04VNJdkl/K+DA5yH+scP/lNr6d12hxT
 8JTFhDLa+PadRzZVcFphOksfLGzyprbnOKQP8FvweYZsF5DAgqQR7LZ3mDeRiT1WrQcg
 tu8tolhQZZSAUgTfZWi7HTM4Ljdip0KbVrvnnl+tgFVjeo/LVEOhQnVHov6wEPVQUT+s
 8e5vMeU67KvxC9H6gyZ9dfVyifxM14vR86DeSPb1pAXDZO7EI5A4Xjw9couvxsEwU4A9
 qp7w==
X-Gm-Message-State: AOAM530fvyR4uAhPwcrsL3c41CXcy8yuA5ECBN8FeGLlqim9VmuiW/on
 2r4VMUIEtp4PyLGdi/4FyqWUjw/rVOM=
X-Google-Smtp-Source: ABdhPJztHB7RyvLI+4/Q/8HZFz5M8v7SRUompGqIdgWKc5sA3ODmCLrnpCBvl2Bkf5QXiPFJr1WYiQ==
X-Received: by 2002:a05:6000:18a9:: with SMTP id
 b9mr43385495wri.418.1626879297485; 
 Wed, 21 Jul 2021 07:54:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66?
 ([2a02:908:1252:fb60:9bcf:837a:d18c:dc66])
 by smtp.gmail.com with ESMTPSA id f11sm164808wmb.14.2021.07.21.07.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 07:54:57 -0700 (PDT)
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210721092133.2817-1-christian.koenig@amd.com>
 <20210721092133.2817-2-christian.koenig@amd.com>
 <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
 <a3b4026b-5133-1ed6-91d4-044d4caec604@gmail.com>
 <CAKMK7uFyN8CESxibfyCWqZvi7QHYhXK1-=r9cP82vZAYz7DMOg@mail.gmail.com>
 <0b9d79c9-69e3-1270-11eb-380e5c2f8ff9@gmail.com>
 <CAKMK7uGHrZqtfnMBcqvsnXeg=CF=-KQOVTQzXnFLXuGEV6kWVw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6aa0d210-3b26-153b-b1b7-255ff3e9891c@gmail.com>
Date: Wed, 21 Jul 2021 16:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGHrZqtfnMBcqvsnXeg=CF=-KQOVTQzXnFLXuGEV6kWVw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.07.21 um 16:37 schrieb Daniel Vetter:
> On Wed, Jul 21, 2021 at 3:57 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 21.07.21 um 15:36 schrieb Daniel Vetter:
>>> On Wed, Jul 21, 2021 at 3:18 PM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 21.07.21 um 13:52 schrieb Daniel Vetter:
>>>>> On Wed, Jul 21, 2021 at 11:21:33AM +0200, Christian König wrote:
>>>>>> That the caller doesn't need to keep a reference is rather
>>>>>> risky and not defensive at all.
>>>>>>
>>>>>> Especially dma_buf_poll got that horrible wrong, so better
>>>>>> remove that sentence and also clarify that the callback
>>>>>> might be called in atomic or interrupt context.
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> I'm very vary of aspirational interface docs for cross-anything, it just
>>>>> means everyone does whatever they feel like. I think I get what you aim
>>>>> for here, but this needs more careful wording.
>>>> Yeah, I'm seeing the problems but I'm not really good at documenting
>>>> things either.
>>>>
>>>>>> ---
>>>>>>     drivers/dma-buf/dma-fence.c | 13 +++++--------
>>>>>>     1 file changed, 5 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>>> index ce0f5eff575d..1e82ecd443fa 100644
>>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>>> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>>>>>      * @cb: the callback to register
>>>>>>      * @func: the function to call
>>>>>>      *
>>>>>> + * Add a software callback to the fence. The caller should keep a reference to
>>>>>> + * the fence.
>>>>> Instead of your "The caller should" what about:
>>>>>
>>>>> It is not required to hold rerence to @fence.
>>>> I'm not sure that is a good wording since it can be misinterpreted once
>>>> more.
>>>>
>>>>>     But since the fence can
>>>>> disappear as soon as @cb has returned callers generally must hold their
>>>>> own reference to prevent issues.
>>>>>
>>>>>
>>>>> With that or something similar that explains when we must do what and not
>>>>> vague "should" wording.
>>>> Ok if you want to avoid "should" then I would rather write:
>>>>
>>>> The caller must make sure that there is a reference to the fence until
>>>> the callback is called or removed.
>>> Yeah but is that really the case? If you never remove the callback
>>> yourself and instead just wait until the cb is called, then that
>>> should be safe? Assuming you don't look at the fence afterwards at
>>> all. It's just that in practice there's tons of reasons why you might
>>> need to bail out and remove the cb, and at that point you can race and
>>> need your own reference, or things go boom.
>>>
>>> So there's no unconditional requirement to hold a reference.
>> Yeah and exactly because of this I want to document that you *must* keep
>> a reference around because people tend to get this stuff wrong if you
>> are not strict about it and it works in some cases but not others.
> Well I think docs should explain why/when you must hold a reference,
> like "must hold a reference if", but also explain that the call itself
> doesn't really require it's own reference that you need to drop in the
> callback. Hence the distinction of what's strictly needed, and what's
> needed in most practical cases.

But exactly that is what I want to avoid here.

Not holding a reference you drop when the callback is signaled puts that 
burden onto the driver instead and that is not really defensive either.

When you install a callback on an object it is good practice to making 
sure that you have a reference to the object and keep that reference 
alive until you can be sure that the callback won't be called any more.

Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> Christian.
>>>>
>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>
>>>>>> + *
>>>>>>      * @cb will be initialized by dma_fence_add_callback(), no initialization
>>>>>>      * by the caller is required. Any number of callbacks can be registered
>>>>>>      * to a fence, but a callback can only be registered to one fence at a time.
>>>>>>      *
>>>>>> - * Note that the callback can be called from an atomic context.  If
>>>>>> - * fence is already signaled, this function will return -ENOENT (and
>>>>>> + * If fence is already signaled, this function will return -ENOENT (and
>>>>>>      * *not* call the callback).
>>>>>>      *
>>>>>> - * Add a software callback to the fence. Same restrictions apply to
>>>>>> - * refcount as it does to dma_fence_wait(), however the caller doesn't need to
>>>>>> - * keep a refcount to fence afterward dma_fence_add_callback() has returned:
>>>>>> - * when software access is enabled, the creator of the fence is required to keep
>>>>>> - * the fence alive until after it signals with dma_fence_signal(). The callback
>>>>>> - * itself can be called from irq context.
>>>>>> + * Note that the callback can be called from an atomic context or irq context.
>>>>>>      *
>>>>>>      * Returns 0 in case of success, -ENOENT if the fence is already signaled
>>>>>>      * and -EINVAL in case of error.
>>>>>> --
>>>>>> 2.25.1
>>>>>>
>

