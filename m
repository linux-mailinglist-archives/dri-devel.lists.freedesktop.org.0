Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7CC638A8A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C03D10E762;
	Fri, 25 Nov 2022 12:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E016610E74C;
 Fri, 25 Nov 2022 12:46:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z18so6226631edb.9;
 Fri, 25 Nov 2022 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+bgi7f3JR0DWZOQubVbmHHeupq5WRhW3huMpC6kFZe0=;
 b=qdFwZ1fV1XfWWgv9yQMtXnLDI0ZwnsxnZ+uzKPHt0t3i424R1cZ9eWPXSUSV1nN3WU
 yV7MhG7w9PWyxQr8MBbHR2rHVbDERRdX/HMilXzD5h80vreonnSaAqvLrt+2in2fnuwU
 0PSxK87Bpx2DTTr14I6pCMx9Cc2jf4fpuG+egRjRzeGq0t1P5fQ42oLPb9mO1WhL/r8o
 81aezcDuc2BMteSXbgNu3wCrciXfa73RvJbkaV9wCaV9xThCcF1Xjj/k8yyBhvXrTQe3
 DIlof7mNkZp3y5D7HJsNAU6HJeOzaamf48hN0GpH74Za5tRKVstgy6KmtMNUu8Pd+EBI
 j+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+bgi7f3JR0DWZOQubVbmHHeupq5WRhW3huMpC6kFZe0=;
 b=aAF9fHMVj44DiFMxQd8U3D7CvM41RFNCb7DDpazbteLJrk2ovA+g8f+jvZGOWF9yfC
 vV9OqNFoQH+FsXnbfPG2X+eAsXUA1IQwoL8xuf/jJTuVpdkQFgUSJYbCutZwf8SZmCaJ
 5a/nTuXQnrz8x7znvOXvm1L1ElJ0DeFlHd6NliVTN4cwzj491dg+wSFIXrScsw6Krn9C
 uBvJdKcwyyncTwsjpgujGRiqsJ90cEwsvSs0LlPmm4rLLEI1fHzJaQC/34EakCbtSq2I
 fHA6IDH/HUxIJ64UcOer2FdsqlvwAmF0cfMV3nQLnctPRTZeVjw0Soq/od3w/x1mIEQK
 HeNw==
X-Gm-Message-State: ANoB5pltwVxqbCir2sjYF9UHuwXcuRWzAIBUKgvG5oqHKWeFCc251ENm
 +nXKzXBfJfijdXQjNXnpHibFx/SFv1Q=
X-Google-Smtp-Source: AA0mqf6N5r+og4tlDu/GKMmnVv1qWHz6JYRDymEQfel5ULDVvXHP9Mf8EcfmT3TuG5cNxH7U+0nUrw==
X-Received: by 2002:a05:6402:1a:b0:467:30ad:c4ca with SMTP id
 d26-20020a056402001a00b0046730adc4camr35211827edu.285.1669380404288; 
 Fri, 25 Nov 2022 04:46:44 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:24a6:d989:49bb:611a?
 ([2a02:908:1256:79a0:24a6:d989:49bb:611a])
 by smtp.gmail.com with ESMTPSA id
 ue5-20020a170907c68500b0079dbf06d558sm1520964ejc.184.2022.11.25.04.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 04:46:43 -0800 (PST)
Message-ID: <5d1d5a9d-7301-e53c-e051-a24c5629d887@gmail.com>
Date: Fri, 25 Nov 2022 13:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
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

Am 25.11.22 um 12:14 schrieb Tvrtko Ursulin:
>
> + Matt
>
> On 25/11/2022 10:21, Christian König wrote:
>> TTM is just wrapping core DMA functionality here, remove the mid-layer.
>> No functional change.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 5247d88b3c13..d409a77449a3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct 
>> drm_i915_gem_object *obj,
>>   static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
>>   {
>>       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> -    int err;
>> +    long err;
>>         WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
>>   -    err = ttm_bo_wait(bo, true, false);
>> -    if (err)
>> +    err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
>> +                    true, 15 * HZ);
>
> This 15 second stuck out a bit for me and then on a slightly deeper 
> look it seems this timeout will "leak" into a few of i915 code paths. 
> If we look at the difference between the legacy shmem and ttm backend 
> I am not sure if the legacy one is blocking or not - but if it can 
> block I don't think it would have an arbitrary timeout like this. Matt 
> your thoughts?

That's exactly the reason why I try to remove the ttm_bo_wait() as mid 
layer here. It hides the fact that we don't wait forever for BOs to 
become idle.

This is functional identical to the old code. If you want some other 
behavior feel free to note what's desired and I will implement it.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +    if (err < 0)
>>           return err;
>> +    if (err == 0)
>> +        return -EBUSY;
>>         err = i915_ttm_move_notify(bo);
>>       if (err)

