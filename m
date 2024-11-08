Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27F9C1F01
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250710E9C3;
	Fri,  8 Nov 2024 14:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KJUiwOqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5810E9C3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:18:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so25764645e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 06:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731075521; x=1731680321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gk4V9DgopfM7+03Uw4CfaApbQyBiVJI5V+th+5xBZss=;
 b=KJUiwOqnaLWwB4pslPhBGETDviYvbsXErtwnS9E1+rVch3HGmc1h80bVTykL/OnFlb
 8inL0bMe7iEU14p8mTi5AXHD7NVH4aRHdyFbV8pI98j73/QWV/jhyt5WUwwlrFxyIJx3
 RZfZrsh+W2fAqVEkEMCokEQXrQaraC83fZyD7UiKnzQUxQycbT25oc33F/y0vEQ64bRm
 oeKN91GLq5CVJU67SM6fq/ECK7GkIShMUeSpLE0aNGEJfNDzFoqivZ6+Z7Wt5BbUE5Q1
 F0ruSjOhUICI3QKZwHWjk1nZd4kcaL997IVnfb24L/AexY+XaS/0CSlnBhbEawVs9qW7
 lRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731075521; x=1731680321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gk4V9DgopfM7+03Uw4CfaApbQyBiVJI5V+th+5xBZss=;
 b=bE/MgtnrJHTGDKv9ZCNxflV3X8p9uUyKeGxVgE1Cpxi8GewFSZRVuwIk+1cB9MWL2T
 Sav09EIxqKtx/GrXfJX2nFAVCum8dBOT1FgMXqxVbLubt25xDHT0ozr0FF3HU8eh2nsi
 SyxBUQEMD23aWyzObyku6Pp20ouIm3+E4NYnMWfagUD3VpJ39kYbZhArNaYYsal4ogYv
 8KyV+BSvhx4FF737xSgptTDX9TTJawynEcvuwUurqLzMK6e3XxJlHhXyuvTNCPQW0Yz3
 6TOuMcD3Q29iN/5ZHH6b83TWj5IP4Ag3IdoMfngjVQIU3OOtL2I29J7UzsIYAe+OCDda
 nA1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLHSL9EgMccNLaCDEwwiaOgp16EuusobNMjaRtsM9HVexk/jHq/3JRwHbyaLKBBO431cwaxNrAZQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZOZvi0m39/JDr+jbfkpwef8rXNl8N2D1KKUWkmIrUSv6s2fba
 X45PwINGmdzaTGB6v8u8E4MAC1zpXL3fiBk8gkvlJ6UBPb3dMvBw
X-Google-Smtp-Source: AGHT+IGoUC4cjBHE9sowRFaTqb95GuUUFC5MHLSlYHJnWqKVMgeE0zsdwHIh0dMgfF1pWm89/kJ7ig==
X-Received: by 2002:a5d:64c7:0:b0:37d:511b:aec1 with SMTP id
 ffacd0b85a97d-381f1884894mr2971984f8f.45.1731075520933; 
 Fri, 08 Nov 2024 06:18:40 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05620b4sm72554475e9.20.2024.11.08.06.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 06:18:40 -0800 (PST)
Message-ID: <f9d27c0a-084f-4b35-bd6c-af25a6bb830d@gmail.com>
Date: Fri, 8 Nov 2024 15:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled
To: Tvrtko Ursulin <tursulin@ursulin.net>, boris.brezillon@collabora.com,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, lionel.g.landwerlin@intel.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 simona@ffwll.ch
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <20241108094256.3717-2-christian.koenig@amd.com>
 <cce719d7-adc9-4f5b-803a-fd173d325806@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <cce719d7-adc9-4f5b-803a-fd173d325806@ursulin.net>
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

Am 08.11.24 um 14:01 schrieb Tvrtko Ursulin:
>
> On 08/11/2024 09:42, Christian König wrote:
>> The function silently assumed that signaling was already enabled for the
>> dma_fence_array. This meant that without enabling signaling first we 
>> would
>> never see forward progress.
>>
>> Fix that by falling back to testing each individual fence when signaling
>> isn't enabled yet.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>> b/drivers/dma-buf/dma-fence-array.c
>> index 46ac42bcfac0..01203796827a 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -103,10 +103,22 @@ static bool 
>> dma_fence_array_enable_signaling(struct dma_fence *fence)
>>   static bool dma_fence_array_signaled(struct dma_fence *fence)
>>   {
>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>> +    unsigned int i, num_pending;
>>   -    if (atomic_read(&array->num_pending) > 0)
>> +    num_pending = atomic_read(&array->num_pending);
>> +    if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, 
>> &array->base.flags)) {
>> +        if (!num_pending)
>> +            goto signal;
>>           return false;
>> +    }
>> +
>> +    for (i = 0; i < array->num_fences; ++i) {
>> +        if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
>> +            goto signal;
>> +    }
>> +    return false;
>
> Sampling num_pending (and decrementing) and test_bit from an unlocked 
> path makes one need to think if there are consequences, false 
> negatives, positives or something. Would it be fine to simplify like 
> the below?

Yeah I've played around with those ideas as well but came to the 
conclusion that neither of them are correct.

>
> static bool dma_fence_array_signaled(struct dma_fence *fence)
> {
>     struct dma_fence_array *array = to_dma_fence_array(fence);
>     unsigned int i;
>
>     if (atomic_read(&array->num_pending)) {
>         for (i = 0; i < array->num_fences; i++) {
>             if (!dma_fence_is_signaled(array->fences[i]))
>                 return false;

That's not correct. num_pending is not necessary equal to the number of 
fences in the array.

E.g. we have cases where num_pending is just 1 so that the 
dma_fence_array signals when *any* fence in it signals.

> }
>     }
>
>     dma_fence_array_clear_pending_error(array);
>     return true;
> }
>
> Or if the optimisation to not walk the array when signalling is 
> already enabled is deemed important, perhaps a less thinking inducing 
> way would be this:
...
> Decrementing locally cached num_pending in the loop I think does not 
> bring anything since when signalling is not enabled it will be stuck 
> at num_fences. So the loop walks the whole array versus bail on first 
> unsignalled, so latter even more efficient.

That is not for optimization but for correctness.

What the patch basically does is the following:
1. Grab the current value of num_pending.

2. Test if num_pending was potentially already modified because 
signaling is already enabled, if yes just test it and return the result.

3. If it wasn't modified go over the fences and see if we already have 
at least num_pending signaled.

I should probably add a code comment explaining that.

> In which case, should dma-fence-chain also be aligned to have the fast 
> path bail out?

Good point need to double check that code as well.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>>   +signal:
>>       dma_fence_array_clear_pending_error(array);
>>       return true;
>>   }

