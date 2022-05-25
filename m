Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6D533AB9
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 12:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B391710ECAA;
	Wed, 25 May 2022 10:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113310EB1F;
 Wed, 25 May 2022 10:38:55 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ck4so36525802ejb.8;
 Wed, 25 May 2022 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W5JzJsJwP88oawILv+IlIHtyqfyhk00ztKXLTFFA6Ik=;
 b=Yqc5ZS/xUr5ImHFsCUWHBG9Ieo7TBg8oz+wxW/wYWROlja8/lgKYkiPZ0Az0aAFbAi
 aTjXmo3vxRAokNNNraN5ZGZI3cmKyqdkhsMDK34oZDEbfaBEXH/Qb/8Vf1OxFGbYv3UW
 fm5aet+OyGFzBS1snU0/2jv0/CwnJ0xvIPFhyStWoFBXzIyfWPIFaTvXXO+CmXf/xxGq
 L0mwHR20vfIIztw/y1GUcbtFJScce3Inf/eYRUOVEOqZP7KZCdcE6oPd1swAZ8huJY1v
 v7vDNM5s4RTDaiV3PpgAM0NGnO96hXxEXuqCyxZsU1bmfPKqznyiR1l1uYv3xtk+p8GO
 g77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W5JzJsJwP88oawILv+IlIHtyqfyhk00ztKXLTFFA6Ik=;
 b=L30s32wX8omjlVLX3aeZT++zkxE40ax3hm0uT6xpR+RUonnIApRKKS00KRo//v7A1p
 gskVii762eW/FLOoktMgkUUdeXoZHe2mADYN1gye/dMxMpaxDWInJZ1rZF1gobbYACGx
 lh/k5vcQxRzBkkanrK33OFeJR8wJHJQpOIppeItIbbhDSAeonfoMQmq4YCB22KBbhXcs
 6vV9XnK/NSmf4cRgif1VPlrUMJJ9rVc0JPMoxbXXs6Fefc1c9L7H64RebLVogSN3D8X3
 BenG9+09Oa6YWXCdDc6j/281Y2gM2BoTj2j971MoaLbU7gVyl/gdYQaISCI87jSx6hn9
 /gEA==
X-Gm-Message-State: AOAM532M3pTyttVXIzhqXU2KJiLQj2y9TVchUqjW1H6kBLgC54zuf/zs
 2w1OR9fHsrfYxQkVzKWmewcNydqM2j0=
X-Google-Smtp-Source: ABdhPJzPbqRSm1Lq1vHWEi0uUwoBIGqZ5KHquiXJhA1TchFs01d462GXXpd/BP9Wf8g0geOYGYPfbg==
X-Received: by 2002:a17:906:6a26:b0:6ff:a5d:88b8 with SMTP id
 qw38-20020a1709066a2600b006ff0a5d88b8mr4922445ejc.6.1653475133528; 
 Wed, 25 May 2022 03:38:53 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bdaa.dip0.t-ipconnect.de.
 [87.176.189.170]) by smtp.gmail.com with ESMTPSA id
 z16-20020a50e690000000b0042bc7635534sm687537edm.62.2022.05.25.03.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 03:38:52 -0700 (PDT)
Message-ID: <419c9bff-4292-3062-b7f2-efeb64b9e79f@gmail.com>
Date: Wed, 25 May 2022 12:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
 <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
 <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
 <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.22 um 11:35 schrieb Lionel Landwerlin:
> On 25/05/2022 12:26, Lionel Landwerlin wrote:
>> On 25/05/2022 11:24, Christian König wrote:
>>> Am 25.05.22 um 08:47 schrieb Lionel Landwerlin:
>>>> On 09/02/2022 20:26, Christian König wrote:
>>>>> It is illegal to add a dma_fence_chain as timeline point. Flatten out
>>>>> the fences into a dma_fence_array instead.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_syncobj.c | 61 
>>>>> ++++++++++++++++++++++++++++++++---
>>>>>   1 file changed, 56 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>>>>> b/drivers/gpu/drm/drm_syncobj.c
>>>>> index c313a5b4549c..7e48dcd1bee4 100644
>>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>>> @@ -853,12 +853,57 @@ drm_syncobj_fd_to_handle_ioctl(struct 
>>>>> drm_device *dev, void *data,
>>>>>                       &args->handle);
>>>>>   }
>>>>>   +
>>>>> +/*
>>>>> + * Try to flatten a dma_fence_chain into a dma_fence_array so 
>>>>> that it can be
>>>>> + * added as timeline fence to a chain again.
>>>>> + */
>>>>> +static int drm_syncobj_flatten_chain(struct dma_fence **f)
>>>>> +{
>>>>> +    struct dma_fence_chain *chain = to_dma_fence_chain(*f);
>>>>> +    struct dma_fence *tmp, **fences;
>>>>> +    struct dma_fence_array *array;
>>>>> +    unsigned int count;
>>>>> +
>>>>> +    if (!chain)
>>>>> +        return 0;
>>>>> +
>>>>> +    count = 0;
>>>>> +    dma_fence_chain_for_each(tmp, &chain->base)
>>>>> +        ++count;
>>>>> +
>>>>> +    fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
>>>>> +    if (!fences)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    count = 0;
>>>>> +    dma_fence_chain_for_each(tmp, &chain->base)
>>>>> +        fences[count++] = dma_fence_get(tmp);
>>>>> +
>>>>> +    array = dma_fence_array_create(count, fences,
>>>>> +                       dma_fence_context_alloc(1),
>>>>
>>>>
>>>> Hi Christian,
>>>>
>>>>
>>>> Sorry for the late answer to this.
>>>>
>>>>
>>>> It appears this commit is trying to remove the warnings added by 
>>>> "dma-buf: Warn about dma_fence_chain container rules"
>>>
>>> Yes, correct. We are now enforcing some rules with warnings and this 
>>> here bubbled up.
>>>
>>>>
>>>> But the context allocation you added just above is breaking some 
>>>> tests. In particular igt@syncobj_timeline@transfer-timeline-point
>>>>
>>>> That test transfer points into the timeline at point 3 and expects 
>>>> that we'll still on the previous points to complete.
>>>
>>> Hui what? I don't understand the problem you are seeing here. What 
>>> exactly is the test doing?
>>>
>>>>
>>>> In my opinion we should be reusing the previous context number if 
>>>> there is one and only allocate if we don't have a point.
>>>
>>> Scratching my head what you mean with that. The functionality 
>>> transfers a synchronization fence from one timeline to another.
>>>
>>> So as far as I can see the new point should be part of the timeline 
>>> of the syncobj we are transferring to.
>>>
>>>> If the application wants to not depend on previous points for wait 
>>>> operations, it can reset the syncobj prior to adding a new point.
>>>
>>> Well we should never lose synchronization. So what happens is that 
>>> when we do the transfer all the fences of the source are flattened 
>>> out into an array. And that array is then added as new point into 
>>> the destination timeline.
>>
>>
>> In this case would be broken :
>>
>>
>> syncobjA <- signal point 1
>>
>> syncobjA <- import syncobjB point 1 into syncobjA point 2
>>
>> syncobjA <- query returns 0
>>
>>
>> -Lionel
>
>
> Err... Let's double check with my colleagues.
>
> It seems we're running into a test failure in IGT with this patch, but 
> now I have doubts that it's where the problem lies.

Yeah, exactly that's what I couldn't understand as well.

What you describe above should still work fine.

Thanks for taking a look into this,
Christian.

>
>
> -Lionel
>
>
>>
>>
>>>
>>> Where exactly is the problem?
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>
>>>>
>>>> Cheers,
>>>>
>>>>
>>>> -Lionel
>>>>
>>>>
>>>>
>>>>> +                       1, false);
>>>>> +    if (!array)
>>>>> +        goto free_fences;
>>>>> +
>>>>> +    dma_fence_put(*f);
>>>>> +    *f = &array->base;
>>>>> +    return 0;
>>>>> +
>>>>> +free_fences:
>>>>> +    while (count--)
>>>>> +        dma_fence_put(fences[count]);
>>>>> +
>>>>> +    kfree(fences);
>>>>> +    return -ENOMEM;
>>>>> +}
>>>>> +
>>>>>   static int drm_syncobj_transfer_to_timeline(struct drm_file 
>>>>> *file_private,
>>>>>                           struct drm_syncobj_transfer *args)
>>>>>   {
>>>>>       struct drm_syncobj *timeline_syncobj = NULL;
>>>>> -    struct dma_fence *fence;
>>>>>       struct dma_fence_chain *chain;
>>>>> +    struct dma_fence *fence;
>>>>>       int ret;
>>>>>         timeline_syncobj = drm_syncobj_find(file_private, 
>>>>> args->dst_handle);
>>>>> @@ -869,16 +914,22 @@ static int 
>>>>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>>>>                        args->src_point, args->flags,
>>>>>                        &fence);
>>>>>       if (ret)
>>>>> -        goto err;
>>>>> +        goto err_put_timeline;
>>>>> +
>>>>> +    ret = drm_syncobj_flatten_chain(&fence);
>>>>> +    if (ret)
>>>>> +        goto err_free_fence;
>>>>> +
>>>>>       chain = dma_fence_chain_alloc();
>>>>>       if (!chain) {
>>>>>           ret = -ENOMEM;
>>>>> -        goto err1;
>>>>> +        goto err_free_fence;
>>>>>       }
>>>>> +
>>>>>       drm_syncobj_add_point(timeline_syncobj, chain, fence, 
>>>>> args->dst_point);
>>>>> -err1:
>>>>> +err_free_fence:
>>>>>       dma_fence_put(fence);
>>>>> -err:
>>>>> +err_put_timeline:
>>>>>       drm_syncobj_put(timeline_syncobj);
>>>>>         return ret;
>>>>
>>>>
>>>
>>
>

