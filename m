Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE43D0F5F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43FF6E323;
	Wed, 21 Jul 2021 13:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23466E323
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:18:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so3412576wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IqGBmPTM0P4hMCX/gJa2G6e6OeTeO4c/MH/XJ+Dfc2g=;
 b=Cnqtq9LE4XWmt3YSJiTcvouVZ1iYuMvJ+RluBTmxCOb+ro62nh3JN7bKKkcsqfvhA7
 OkCX42T/Os+Rlgejda+6m065ft+08Z00twKJ33C3vGl2hJMDJcdxUokVDnMj3Dh59OQL
 kdSWlWb9Q5mnCGb5ndQy24zlVT5s2m7uLF6nMZbzFIGND43RF+MBd/9YxxKTR+kaZ4t7
 oMAxhzi6zoL0/sRjW3c9wS1ILOO7HjY7KYZXWtZkdrOAXT/KweVWqLc/ushLRLRUru31
 J7iH9KiXtSdI14bzZ7RJp6r1jygMBMOJTvAjCPmRFpCpqqMdsaZso2weqvPq7YyfETrg
 Q0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IqGBmPTM0P4hMCX/gJa2G6e6OeTeO4c/MH/XJ+Dfc2g=;
 b=eqO7WVaMeaoFK1ulS3niHnqYzaoX92we7qj5TRLglklf3TUZXDrxP3euG21TqORWol
 V+7jfJV9NyiLS8JvAQoBJy+TbbhnnarZfUfxMtnTjr0ra8e2JoQ01z/ff8F/Np6Yr3d2
 6/Dd1FU4ZhqZAlTgOKcNq+0mGwQs9cvd5WLw8f+fFGw83gpAVVdP1bMyKEnysjgg+al6
 VJC6dtJj+lmM2y8oSjO6Ii56TDsVRpuiFCf+ieWsDIY8whiKqwj2WocJ5zEjsnIMpV4C
 ZcWlZMnQpRlZetgwf8eIZ21kDPpGRfv5gWqlNt/VDf8XpyquBZECOwyyDjHCo/BxAUft
 2CbQ==
X-Gm-Message-State: AOAM5314kyn9ImLvEzmMxI4rLl8wLXHfprP68ECcaif18NhZYoyBrr4P
 xP8X3VO9vZ1vpeKg1XaNnkFYbHMGR1M=
X-Google-Smtp-Source: ABdhPJzjETeJ5dVr/KjPu+1+lflmC2QUuPTHFxu/Lmf2R2n3ZcCtk0dchvLnMrALSeEolnX+ELOhlQ==
X-Received: by 2002:a05:600c:3b92:: with SMTP id
 n18mr38157989wms.69.1626873533511; 
 Wed, 21 Jul 2021 06:18:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66?
 ([2a02:908:1252:fb60:9bcf:837a:d18c:dc66])
 by smtp.gmail.com with ESMTPSA id r19sm28466489wrr.32.2021.07.21.06.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 06:18:52 -0700 (PDT)
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210721092133.2817-1-christian.koenig@amd.com>
 <20210721092133.2817-2-christian.koenig@amd.com>
 <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a3b4026b-5133-1ed6-91d4-044d4caec604@gmail.com>
Date: Wed, 21 Jul 2021 15:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 21.07.21 um 13:52 schrieb Daniel Vetter:
> On Wed, Jul 21, 2021 at 11:21:33AM +0200, Christian König wrote:
>> That the caller doesn't need to keep a reference is rather
>> risky and not defensive at all.
>>
>> Especially dma_buf_poll got that horrible wrong, so better
>> remove that sentence and also clarify that the callback
>> might be called in atomic or interrupt context.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> I'm very vary of aspirational interface docs for cross-anything, it just
> means everyone does whatever they feel like. I think I get what you aim
> for here, but this needs more careful wording.

Yeah, I'm seeing the problems but I'm not really good at documenting 
things either.

>
>
>> ---
>>   drivers/dma-buf/dma-fence.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index ce0f5eff575d..1e82ecd443fa 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>    * @cb: the callback to register
>>    * @func: the function to call
>>    *
>> + * Add a software callback to the fence. The caller should keep a reference to
>> + * the fence.
> Instead of your "The caller should" what about:
>
> It is not required to hold rerence to @fence.

I'm not sure that is a good wording since it can be misinterpreted once 
more.

>   But since the fence can
> disappear as soon as @cb has returned callers generally must hold their
> own reference to prevent issues.
>
>
> With that or something similar that explains when we must do what and not
> vague "should" wording.

Ok if you want to avoid "should" then I would rather write:

The caller must make sure that there is a reference to the fence until 
the callback is called or removed.

Christian.

>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> + *
>>    * @cb will be initialized by dma_fence_add_callback(), no initialization
>>    * by the caller is required. Any number of callbacks can be registered
>>    * to a fence, but a callback can only be registered to one fence at a time.
>>    *
>> - * Note that the callback can be called from an atomic context.  If
>> - * fence is already signaled, this function will return -ENOENT (and
>> + * If fence is already signaled, this function will return -ENOENT (and
>>    * *not* call the callback).
>>    *
>> - * Add a software callback to the fence. Same restrictions apply to
>> - * refcount as it does to dma_fence_wait(), however the caller doesn't need to
>> - * keep a refcount to fence afterward dma_fence_add_callback() has returned:
>> - * when software access is enabled, the creator of the fence is required to keep
>> - * the fence alive until after it signals with dma_fence_signal(). The callback
>> - * itself can be called from irq context.
>> + * Note that the callback can be called from an atomic context or irq context.
>>    *
>>    * Returns 0 in case of success, -ENOENT if the fence is already signaled
>>    * and -EINVAL in case of error.
>> -- 
>> 2.25.1
>>

