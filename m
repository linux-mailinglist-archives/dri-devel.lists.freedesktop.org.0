Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F208A54A9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D5F11262D;
	Mon, 15 Apr 2024 14:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UGMJUbHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A355D11263B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:38:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41550858cabso20476185e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713191938; x=1713796738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7mBLr8dU5roN8PFG/4+0xLSLo7YcEd0M0iQo1U2TLyQ=;
 b=UGMJUbHIq0RXD7kQciep5OFvrDzh6B46qLA4Vbv43A3yJfb7xgsHVr7vMmBMrauwAa
 iraQZoTFE3WGCbsMtWVDPonIc/v73ttkRxBd5Jl2eNqD5JzfsEQJ3/jaDsirWGcBJ4Ga
 I/IW8TuREHVGWFBTst0rpIFwWZHaYyPBIJ/6luBzkKSQgU8ACi+srnxHLKRoSzbrWWNH
 4rMluSKUm1tq3GFF3dvKvF8Eo7Ev88xpdMusnTYmUU00DU40itTLMmsvmoInX1x4Slky
 NiYpPh8kjBJUwONjCWYe2T6rrs1uup/nprcfpDRAZBx6MQV/KyLc5kVSfooINVA7u+nb
 4N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713191938; x=1713796738;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7mBLr8dU5roN8PFG/4+0xLSLo7YcEd0M0iQo1U2TLyQ=;
 b=RRgLnZGE2MMHEnBnE5k4XVnix66au6pVqGhb6vweLYmJtFfLr5xh+JkSLbKhKVNIuT
 otqz6hN2Ny6CUldGdBNdXEMyTDL9DEAK1Lh8Ac7OP3lIuS41h3kQ9G8SxIWzS2z+105o
 SkWqRIxDgu6T79YznJfwoUVS8sRaS32zvvCLRfbpcr4d7QzPQ6wVti5U9T62HvZ6Pi1v
 63DXTKFiVnlVEA8ZvWv6frNhnkQl55Slt8TRFzD5lDUMMnT2gTsBMQcZcBK6WN6MrT/G
 FjrFB+d5sGyspKxLwnFeWzw26RQ3agHyHSGdfqkFbo0CJGQ9H1ieSO/IQ5CZJiibPi2y
 VR3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrrbFUTneSoWhWAx/2vh8esMNjPOvT0lylq7rNXvSZPJTxIfy47waK76pYO7s/vlJPPY/4lSVMPIWmRa0scRJJEI7XjsCvGZ0Pj4OfoPu+
X-Gm-Message-State: AOJu0YzCc1wDyTN8/dzvq/K+IbQYFRlpoCNtjqZ8fjKCB1O5xTU8ikFX
 UYVwJnivPMfOSHEewAVL4RIPvINY7KxKTmVVhoxsOVGLeQ016h2y
X-Google-Smtp-Source: AGHT+IHY0qlSJ5S39beKoM6S33mlsos/J3U9eWS6gzFsHDtqOyFVi5Ta2ZCN5wNPUjg/ZeB6PeZsOg==
X-Received: by 2002:a05:6000:bce:b0:343:79b4:5371 with SMTP id
 dm14-20020a0560000bce00b0034379b45371mr6248118wrb.69.1713191937701; 
 Mon, 15 Apr 2024 07:38:57 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a5d680d000000b003433bf6651dsm12324806wru.75.2024.04.15.07.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 07:38:57 -0700 (PDT)
Message-ID: <9a7b61a0-5a74-451f-81d2-b633ac5b1b98@gmail.com>
Date: Mon, 15 Apr 2024 16:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: stop pooling cached NUMA pages v2
To: Felix Kuehling <felix.kuehling@amd.com>, Alexander.Deucher@amd.com,
 Rajneesh.Bhardwaj@amd.com, Steven.Roberts@amd.com,
 dri-devel@lists.freedesktop.org
References: <20240415134821.1919-1-christian.koenig@amd.com>
 <4b04b1d7-2215-42ae-a65a-eb8103bb847e@amd.com>
 <345a958f-dde4-4211-850c-7b23ddd71b0b@gmail.com>
 <214a8afb-b338-4470-879a-c172efb4e9a8@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <214a8afb-b338-4470-879a-c172efb4e9a8@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.04.24 um 16:32 schrieb Felix Kuehling:
> On 2024-04-15 10:08, Christian König wrote:
>> Am 15.04.24 um 15:53 schrieb Felix Kuehling:
>>> On 2024-04-15 9:48, Christian König wrote:
>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>>
>>>> We only pool write combined and uncached allocations because they
>>>> require extra overhead on allocation and release.
>>>>
>>>> If we also pool cached NUMA it not only means some extra unnecessary
>>>> overhead, but also that under memory pressure it can happen that
>>>> pages from the wrong NUMA node enters the pool and are re-used
>>>> over and over again.
>>>>
>>>> This can lead to performance reduction after running into memory
>>>> pressure.
>>>>
>>>> v2: restructure and cleanup the code a bit from the internal hack to
>>>>      test this.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Fixes: 4482d3c94d7f ("drm/ttm: add NUMA node id to the pool")
>>>> CC: stable@vger.kernel.org
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_pool.c | 38 
>>>> +++++++++++++++++++++++++---------
>>>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index 112438d965ff..6e1fd6985ffc 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -288,17 +288,23 @@ static struct ttm_pool_type 
>>>> *ttm_pool_select_type(struct ttm_pool *pool,
>>>>                             enum ttm_caching caching,
>>>>                             unsigned int order)
>>>>   {
>>>> -    if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
>>>> +    if (pool->use_dma_alloc)
>>>>           return &pool->caching[caching].orders[order];
>>>>     #ifdef CONFIG_X86
>>>>       switch (caching) {
>>>>       case ttm_write_combined:
>>>> +        if (pool->nid != NUMA_NO_NODE)
>>>> +            return &pool->caching[caching].orders[order];
>>>
>>> Doesn't this break USWC allocations on NUMA systems, where we set a 
>>> NUMA node for the default pool (at least we were planning to at some 
>>> point)?
>>
>> I don't think so, but I might have missed something. Why do you think 
>> that would break?
>>
>> I mean the idea is basically if the pool is associated with a NUMA id 
>> we should rather use this pool instead of the global one.
>>
>> And that is true for both cases, the default pool and the specialized 
>> ones.
>
> OK, I think I misunderstood what I was reading. It looked to me like 
> it would always use a "caching" pool if nid was set. But caching here 
> is a variable; each node still has specialized pools for write 
> combining etc.
>
> Then the concern you stated in the commit message "under memory 
> pressure it can happen that pages from the wrong NUMA node enters the 
> pool and are re-used over and over again" is still possible for 
> uncached and wc pages. Anyway, it's better than not having NUMA, I guess.

Yes, correct. But since KFD doesn't use USWC that much I don't think 
this will cause an issue.

If we really start to see issues with that we can always re-consider 
using __GFP_THIS_NODE.

>
> The patch is
>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

Thanks, going to push to drm-misc-fixes now.

Regards,
Christian.

>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>> +
>>>>           if (pool->use_dma32)
>>>>               return &global_dma32_write_combined[order];
>>>>             return &global_write_combined[order];
>>>>       case ttm_uncached:
>>>> +        if (pool->nid != NUMA_NO_NODE)
>>>> +            return &pool->caching[caching].orders[order];
>>>> +
>>>>           if (pool->use_dma32)
>>>>               return &global_dma32_uncached[order];
>>>>   @@ -566,11 +572,17 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>>> struct device *dev,
>>>>       pool->use_dma_alloc = use_dma_alloc;
>>>>       pool->use_dma32 = use_dma32;
>>>>   -    if (use_dma_alloc || nid != NUMA_NO_NODE) {
>>>> -        for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>> -            for (j = 0; j < NR_PAGE_ORDERS; ++j)
>>>> - ttm_pool_type_init(&pool->caching[i].orders[j],
>>>> -                           pool, i, j);
>>>> +    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>> +        for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>>> +            struct ttm_pool_type *pt;
>>>> +
>>>> +            /* Initialize only pool types which are actually used */
>>>> +            pt = ttm_pool_select_type(pool, i, j);
>>>> +            if (pt != &pool->caching[i].orders[j])
>>>> +                continue;
>>>> +
>>>> +            ttm_pool_type_init(pt, pool, i, j);
>>>> +        }
>>>>       }
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_pool_init);
>>>> @@ -599,10 +611,16 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>   {
>>>>       unsigned int i, j;
>>>>   -    if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
>>>> -        for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>> -            for (j = 0; j < NR_PAGE_ORDERS; ++j)
>>>> - ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>>> +    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>> +        for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>>> +            struct ttm_pool_type *pt;
>>>> +
>>>> +            pt = ttm_pool_select_type(pool, i, j);
>>>> +            if (pt != &pool->caching[i].orders[j])
>>>> +                continue;
>>>> +
>>>> +            ttm_pool_type_fini(pt);
>>>> +        }
>>>>       }
>>>>         /* We removed the pool types from the LRU, but we need to 
>>>> also make sure
>>

