Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB8483007
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 11:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7A10E16D;
	Mon,  3 Jan 2022 10:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC9F10E16D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 10:48:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k18so32370576wrg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zNvluKhSnfznTFgZd/DzNbiOZINPjknrMYkH/aiSj5k=;
 b=bPCuPge07vgRl/ryVQ3ydyERbApX8fClQV7edx4QiXGFSNaj+2uxS1PHFOa5MpVG1y
 IzDb5JqEpHz5KYZdYW/nHwPx6e7ULzoZxGwAK4EuFqkkIiJa81YL7JWNd2xtkHd7hZxe
 oqwxurEcbJO2+kjxwQmJXjamr1d/xQ7ydnzOFcQDEs0vEmI/3NaFVl9z/ZiJfe5C6bs3
 oOCO0Edx8vYP6EPu2gC81q1Vi07csjdQiJyNoHug6OzLqQIGi+S60PPVY5VF0PcOMuQU
 h1z5oqV5SAJx6TgIKoslYYR552/K/QwQpNUiAfWCtJgLwknEZbjofCsaXnSyYxhy3sHp
 tNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zNvluKhSnfznTFgZd/DzNbiOZINPjknrMYkH/aiSj5k=;
 b=2K9yWcXz8hl59YOJtyOntHuwuLP/weOq94H5R2ft1PDAeUaPIGb/P5dtbivawWFErw
 zvX5gO8BEMxGqYJ1E4IRJbMP+VkdNEtCwMIEwTdTv1JF8/9iE5sKPuTwMyMAaKrRL5v6
 7+qD/emxVX6OIUY2BRecOk09W4swrpR/G6xWCIzHniAR3p+KvgNlrf1a0uWcTzgN63a+
 LuoPovCLSr01ve30gvTB5vJXGXbzNFf9dv3/3cPyb8iSnWXQoUcNekMa8/78i/XEIad5
 Al+unfiMZAEvQHKlpVZQ26LeR2hJ12GQdx3TAtyYZscR8UDbhJ052wM0VndA0Z/HaP/I
 TMqg==
X-Gm-Message-State: AOAM5336AbvSHBSq3AWitfWW3eicHqBmv22j5oD1TtEdoNBKuE8HZnXk
 2pLzvUCI+OKTMRYrfSMed9A=
X-Google-Smtp-Source: ABdhPJzxPnBioebcbtglVNixcsM7Cru8AK90mLUEP9A8EjaCxrAFqjEnSQEQzGdrRAXqf8THxy7BNw==
X-Received: by 2002:adf:fe11:: with SMTP id n17mr37167884wrr.643.1641206906856; 
 Mon, 03 Jan 2022 02:48:26 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:4bf5:8542:f955:f736?
 ([2a02:908:1252:fb60:4bf5:8542:f955:f736])
 by smtp.gmail.com with ESMTPSA id p1sm36712207wrr.75.2022.01.03.02.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 02:48:26 -0800 (PST)
Subject: Re: [PATCH 01/24] dma-buf: add dma_resv_replace_fences
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-2-christian.koenig@amd.com>
 <YcOTKYkEcu7MG2sY@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b73ac88f-bb34-ed56-226f-6f3077365b75@gmail.com>
Date: Mon, 3 Jan 2022 11:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOTKYkEcu7MG2sY@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.12.21 um 22:05 schrieb Daniel Vetter:
> On Tue, Dec 07, 2021 at 01:33:48PM +0100, Christian König wrote:
>> This function allows to replace fences from the shared fence list when
>> we can gurantee that the operation represented by the original fence has
>> finished or no accesses to the resources protected by the dma_resv
>> object any more when the new fence finishes.
>>
>> Then use this function in the amdkfd code when BOs are unmapped from the
>> process.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c                    | 43 ++++++++++++++++
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
>>   include/linux/dma-resv.h                      |  2 +
>>   3 files changed, 52 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 4deea75c0b9c..a688dbded3d3 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -284,6 +284,49 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_shared_fence);
>>   
>> +/**
>> + * dma_resv_replace_fences - replace fences in the dma_resv obj
>> + * @obj: the reservation object
>> + * @context: the context of the fences to replace
>> + * @replacement: the new fence to use instead
>> + *
>> + * Replace fences with a specified context with a new fence. Only valid if the
>> + * operation represented by the original fences is completed or has no longer
>> + * access to the resources protected by the dma_resv object when the new fence
>> + * completes.
>> + */
>> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>> +			     struct dma_fence *replacement)
>> +{
>> +	struct dma_resv_list *list;
>> +	struct dma_fence *old;
>> +	unsigned int i;
>> +
>> +	dma_resv_assert_held(obj);
>> +
>> +	write_seqcount_begin(&obj->seq);
>> +
>> +	old = dma_resv_excl_fence(obj);
>> +	if (old->context == context) {
>> +		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
>> +		dma_fence_put(old);
>> +	}
>> +
>> +	list = dma_resv_shared_list(obj);
>> +	for (i = 0; list && i < list->shared_count; ++i) {
>> +		old = rcu_dereference_protected(list->shared[i],
>> +						dma_resv_held(obj));
>> +		if (old->context != context)
>> +			continue;
>> +
>> +		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
>> +		dma_fence_put(old);
> Since the fences are all guaranteed to be from the same context, maybe we
> should have a WARN_ON(__dma_fence_is_later()); here just to be safe?

First of all happy new year!

Then to answer your question, no :)

This here is the case where we replace an preemption fence with a VM 
page table update fence. So both fences are not from the same context.

But since you ask that means that I somehow need to improve the 
documentation.

Regards,
Christian.

>
> With that added:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> +	}
>> +
>> +	write_seqcount_end(&obj->seq);
>> +}
>> +EXPORT_SYMBOL(dma_resv_replace_fences);
>> +
>>   /**
>>    * dma_resv_add_excl_fence - Add an exclusive fence.
>>    * @obj: the reservation object
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 71acd577803e..b558ef0f8c4a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -236,53 +236,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
>>   static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>>   					struct amdgpu_amdkfd_fence *ef)
>>   {
>> -	struct dma_resv *resv = bo->tbo.base.resv;
>> -	struct dma_resv_list *old, *new;
>> -	unsigned int i, j, k;
>> +	struct dma_fence *replacement;
>>   
>>   	if (!ef)
>>   		return -EINVAL;
>>   
>> -	old = dma_resv_shared_list(resv);
>> -	if (!old)
>> -		return 0;
>> -
>> -	new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
>> -	if (!new)
>> -		return -ENOMEM;
>> -
>> -	/* Go through all the shared fences in the resevation object and sort
>> -	 * the interesting ones to the end of the list.
>> +	/* TODO: Instead of block before we should use the fence of the page
>> +	 * table update and TLB flush here directly.
>>   	 */
>> -	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
>> -		struct dma_fence *f;
>> -
>> -		f = rcu_dereference_protected(old->shared[i],
>> -					      dma_resv_held(resv));
>> -
>> -		if (f->context == ef->base.context)
>> -			RCU_INIT_POINTER(new->shared[--j], f);
>> -		else
>> -			RCU_INIT_POINTER(new->shared[k++], f);
>> -	}
>> -	new->shared_max = old->shared_max;
>> -	new->shared_count = k;
>> -
>> -	/* Install the new fence list, seqcount provides the barriers */
>> -	write_seqcount_begin(&resv->seq);
>> -	RCU_INIT_POINTER(resv->fence, new);
>> -	write_seqcount_end(&resv->seq);
>> -
>> -	/* Drop the references to the removed fences or move them to ef_list */
>> -	for (i = j; i < old->shared_count; ++i) {
>> -		struct dma_fence *f;
>> -
>> -		f = rcu_dereference_protected(new->shared[i],
>> -					      dma_resv_held(resv));
>> -		dma_fence_put(f);
>> -	}
>> -	kfree_rcu(old, rcu);
>> -
>> +	replacement = dma_fence_get_stub();
>> +	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
>> +				replacement);
>> +	dma_fence_put(replacement);
>>   	return 0;
>>   }
>>   
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index eebf04325b34..e0be34265eae 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -457,6 +457,8 @@ void dma_resv_init(struct dma_resv *obj);
>>   void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>> +			     struct dma_fence *fence);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>>   			unsigned *pshared_count, struct dma_fence ***pshared);
>> -- 
>> 2.25.1
>>

