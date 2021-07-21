Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9783D104F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC706EB8C;
	Wed, 21 Jul 2021 13:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5E36EB8C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:57:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so3471124wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Fhtk5M12DmbIkihPXMLfQx/tm4k1sftM8n7f1NBpaZU=;
 b=IwWJyQAPBF0NgPAlzGyhjilB6BrYOWa5JAZATYZzHoQeuUdvNm6rqPfZrIuFkJ0T44
 pCLwq4IwXK/veSUqOadtidhSOilyfJzSHynpQl7+4zZGI746ppx4UFYcNihRs/tihoOE
 5WNPrJ+2A5BSXPumFqks/8aGwVz6sAPNAqr45bfVDE83br1oGDPQcD55mSZO8DbYS2Cb
 jETlzw6sptJB9PwW3xVwHwrvhrOa+fVIFKKlDuzg7qioC0gTsk7hbcyTb7r61poUNdSg
 mwr7mLHtf4SomuQyxz1ZmYiwZIsBGKqRJAK7k7U1vybhJ3KK0ljPgncjqsdbGRVOIrUj
 Inig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Fhtk5M12DmbIkihPXMLfQx/tm4k1sftM8n7f1NBpaZU=;
 b=KpqGg26hRalg5aAPRoRsvHp47gmsHYyUTBbBDB2nAkh79TyhqjQEH5dsNlv6cNO9+Y
 8z1iSCuaLdbRRJAcq/pqsILv2kLi5e3Qq9EoBE6Nu45c6yxP6eZ/KxuVGos0IZvpoTlW
 1Qtlmr2KWLBYnZyVXgJqunMokyJ8JkTY1AAFpF0mQJiRwi3ug/kTe5fKYd0PvIpuF2ez
 U/tZXIXAImFgZGaWCKf1HSFk5JK00XJNu44b4hMRrHE6jsJmxvF7iALHaxwZqaSLFJr2
 xWFXuTzLd0tYovBVyLIryEF9aZS7mt6dyGZ5eMLIlR5Euyom9JK0XDLIvoaveOTW7jfM
 AUSw==
X-Gm-Message-State: AOAM532LevK0bC7oPBOHrZMINnkYgnURh4VTfou/kl9aS1JVqAFmyDqD
 6UNFGViKbVCYwVBds7IJCt77p3pL1TE=
X-Google-Smtp-Source: ABdhPJwEZ7NzKmO28o7g54kFD6gWfkWYfqeeG+ftU+itiypxpLPdX99WjQ1MQL7mPEke6QDy1m8Dcw==
X-Received: by 2002:a1c:9dd6:: with SMTP id g205mr38081911wme.82.1626875820233; 
 Wed, 21 Jul 2021 06:57:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66?
 ([2a02:908:1252:fb60:9bcf:837a:d18c:dc66])
 by smtp.gmail.com with ESMTPSA id o3sm26810189wrw.56.2021.07.21.06.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 06:56:59 -0700 (PDT)
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210721092133.2817-1-christian.koenig@amd.com>
 <20210721092133.2817-2-christian.koenig@amd.com>
 <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
 <a3b4026b-5133-1ed6-91d4-044d4caec604@gmail.com>
 <CAKMK7uFyN8CESxibfyCWqZvi7QHYhXK1-=r9cP82vZAYz7DMOg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0b9d79c9-69e3-1270-11eb-380e5c2f8ff9@gmail.com>
Date: Wed, 21 Jul 2021 15:56:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFyN8CESxibfyCWqZvi7QHYhXK1-=r9cP82vZAYz7DMOg@mail.gmail.com>
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

Am 21.07.21 um 15:36 schrieb Daniel Vetter:
> On Wed, Jul 21, 2021 at 3:18 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 21.07.21 um 13:52 schrieb Daniel Vetter:
>>> On Wed, Jul 21, 2021 at 11:21:33AM +0200, Christian König wrote:
>>>> That the caller doesn't need to keep a reference is rather
>>>> risky and not defensive at all.
>>>>
>>>> Especially dma_buf_poll got that horrible wrong, so better
>>>> remove that sentence and also clarify that the callback
>>>> might be called in atomic or interrupt context.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> I'm very vary of aspirational interface docs for cross-anything, it just
>>> means everyone does whatever they feel like. I think I get what you aim
>>> for here, but this needs more careful wording.
>> Yeah, I'm seeing the problems but I'm not really good at documenting
>> things either.
>>
>>>
>>>> ---
>>>>    drivers/dma-buf/dma-fence.c | 13 +++++--------
>>>>    1 file changed, 5 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index ce0f5eff575d..1e82ecd443fa 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>>>     * @cb: the callback to register
>>>>     * @func: the function to call
>>>>     *
>>>> + * Add a software callback to the fence. The caller should keep a reference to
>>>> + * the fence.
>>> Instead of your "The caller should" what about:
>>>
>>> It is not required to hold rerence to @fence.
>> I'm not sure that is a good wording since it can be misinterpreted once
>> more.
>>
>>>    But since the fence can
>>> disappear as soon as @cb has returned callers generally must hold their
>>> own reference to prevent issues.
>>>
>>>
>>> With that or something similar that explains when we must do what and not
>>> vague "should" wording.
>> Ok if you want to avoid "should" then I would rather write:
>>
>> The caller must make sure that there is a reference to the fence until
>> the callback is called or removed.
> Yeah but is that really the case? If you never remove the callback
> yourself and instead just wait until the cb is called, then that
> should be safe? Assuming you don't look at the fence afterwards at
> all. It's just that in practice there's tons of reasons why you might
> need to bail out and remove the cb, and at that point you can race and
> need your own reference, or things go boom.
>
> So there's no unconditional requirement to hold a reference.

Yeah and exactly because of this I want to document that you *must* keep 
a reference around because people tend to get this stuff wrong if you 
are not strict about it and it works in some cases but not others.

Christian.

> -Daniel
>
>> Christian.
>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>>> + *
>>>>     * @cb will be initialized by dma_fence_add_callback(), no initialization
>>>>     * by the caller is required. Any number of callbacks can be registered
>>>>     * to a fence, but a callback can only be registered to one fence at a time.
>>>>     *
>>>> - * Note that the callback can be called from an atomic context.  If
>>>> - * fence is already signaled, this function will return -ENOENT (and
>>>> + * If fence is already signaled, this function will return -ENOENT (and
>>>>     * *not* call the callback).
>>>>     *
>>>> - * Add a software callback to the fence. Same restrictions apply to
>>>> - * refcount as it does to dma_fence_wait(), however the caller doesn't need to
>>>> - * keep a refcount to fence afterward dma_fence_add_callback() has returned:
>>>> - * when software access is enabled, the creator of the fence is required to keep
>>>> - * the fence alive until after it signals with dma_fence_signal(). The callback
>>>> - * itself can be called from irq context.
>>>> + * Note that the callback can be called from an atomic context or irq context.
>>>>     *
>>>>     * Returns 0 in case of success, -ENOENT if the fence is already signaled
>>>>     * and -EINVAL in case of error.
>>>> --
>>>> 2.25.1
>>>>
>

