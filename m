Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614CE3989FD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871996EC8E;
	Wed,  2 Jun 2021 12:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0226EC8C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:47:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g8so3707046ejx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=lSWMgvQ9fgqFep8qsYjP05VwMF9L/pAStNKl3cWmxUc=;
 b=VXac/RP+AvrKuvulQ2Hon5Np03QI3dFBdHM/u5jgkSIxaCsQOK7BmuAPmA3zWPVA5h
 eN2icJzDhiijlUp5+GKZIJYQkrcgj9lUD95lBOF91vPvDYhbuGh6QH2/v5IjKEuGbdZN
 Gj5jZIuoJZFyhqjwlJrlqS7NFZwKL/PANPHQK8HaYJUjo4oD77o4AjIO/wOc1lVxhM4o
 s5ThKwu4iDEkTLiRa8Owwna/XIKmAzwpWBq6z6NTop1qNNtRCYKqhqZ78io7ixVDE2+/
 eiLGxAFOcrExmHm6A6904FGZY+aZRHqqm/eYv5L1L5KTwkknbDzI4mPNLb/Ne3XirvxW
 EMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lSWMgvQ9fgqFep8qsYjP05VwMF9L/pAStNKl3cWmxUc=;
 b=umP58RojjFYwtbtYYWEnIcOGuqN8Ulrpzcer1fhkg7EQXBkeLQlgO/I8ZirVrGgy2c
 aF4XS4TSkZhiL8LXuS1tLfKR7aqKlN1HLwZ7NsAs0v9rzWv2XPJ78TcmrV4iVYjm/2Rc
 Qio1l0ahsSSxHgimWrgH79HYY/AlHB5QT4cNTutHl1UiUlLjV/VNT9PvAfKCu+eUxMc+
 tR6AU2zJGfSpz3Ebq19wbA/GrANSnjzDmdILqQfiYWefUdNFXbOHxUcivg8lryn08oBu
 APsSnDDEIPi+5HbKLVbS5H6Mz4tU5beqgisVYBujcMuq5o+1HR/ZA4IKZzJ/6QXtEPqE
 tXcQ==
X-Gm-Message-State: AOAM533gp/v7siJS/rIjzJg14LhKey54C31AoTE6hQz/EbRaLUnoV9B7
 +aitCtoKHHdcjXyfH0adqC7ITXj3L7k=
X-Google-Smtp-Source: ABdhPJww5jCGxU1Rhm5eDYS3Ec3SjtBevNm7GiwFSYMWZqG8cJphS9lrs60OuesKsf0CpzwVrEUiyA==
X-Received: by 2002:a17:906:1591:: with SMTP id
 k17mr34725754ejd.401.1622638047023; 
 Wed, 02 Jun 2021 05:47:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id dy19sm1306251edb.68.2021.06.02.05.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:47:26 -0700 (PDT)
Subject: Re: [PATCH 2/7] dma-buf: add SPDX header and fix style in dma-resv.c
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-2-christian.koenig@amd.com>
 <YLd6761iGBs2MYsw@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9f0d39d3-400e-8744-e80f-6e1b45eeabff@gmail.com>
Date: Wed, 2 Jun 2021 14:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLd6761iGBs2MYsw@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 14:34 schrieb Daniel Vetter:
> On Wed, Jun 02, 2021 at 01:17:09PM +0200, Christian König wrote:
>> No functional change.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Maybe add the checkpatch warnings you're fixing here to the commit
> message. I didn't know that initcalls should be at the bottom ...

Well dma_resv_lockdep() had some tab/space mixup and moving it around 
was the easiest way to fix that in the editor :)

Moving it to the end seemed logical to me.

Christian.

> -Daniel
>
>
>> ---
>>   drivers/dma-buf/dma-resv.c | 128 +++++++++++++++++++------------------
>>   1 file changed, 65 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 6ddbeb5dfbf6..87f5d82d992a 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -1,3 +1,4 @@
>> +// SPDX-License-Identifier: MIT
>>   /*
>>    * Copyright (C) 2012-2014 Canonical Ltd (Maarten Lankhorst)
>>    *
>> @@ -92,49 +93,6 @@ static void dma_resv_list_free(struct dma_resv_list *list)
>>   	kfree_rcu(list, rcu);
>>   }
>>   
>> -#if IS_ENABLED(CONFIG_LOCKDEP)
>> -static int __init dma_resv_lockdep(void)
>> -{
>> -	struct mm_struct *mm = mm_alloc();
>> -	struct ww_acquire_ctx ctx;
>> -	struct dma_resv obj;
>> -	struct address_space mapping;
>> -	int ret;
>> -
>> -	if (!mm)
>> -		return -ENOMEM;
>> -
>> -	dma_resv_init(&obj);
>> -	address_space_init_once(&mapping);
>> -
>> -	mmap_read_lock(mm);
>> -	ww_acquire_init(&ctx, &reservation_ww_class);
>> -	ret = dma_resv_lock(&obj, &ctx);
>> -	if (ret == -EDEADLK)
>> -		dma_resv_lock_slow(&obj, &ctx);
>> -	fs_reclaim_acquire(GFP_KERNEL);
>> -	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
>> -	i_mmap_lock_write(&mapping);
>> -	i_mmap_unlock_write(&mapping);
>> -#ifdef CONFIG_MMU_NOTIFIER
>> -	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
>> -	__dma_fence_might_wait();
>> -	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
>> -#else
>> -	__dma_fence_might_wait();
>> -#endif
>> -	fs_reclaim_release(GFP_KERNEL);
>> -	ww_mutex_unlock(&obj.lock);
>> -	ww_acquire_fini(&ctx);
>> -	mmap_read_unlock(mm);
>> -	
>> -	mmput(mm);
>> -
>> -	return 0;
>> -}
>> -subsys_initcall(dma_resv_lockdep);
>> -#endif
>> -
>>   /**
>>    * dma_resv_init - initialize a reservation object
>>    * @obj: the reservation object
>> @@ -196,9 +154,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
>>   	if (old && old->shared_max) {
>>   		if ((old->shared_count + num_fences) <= old->shared_max)
>>   			return 0;
>> -		else
>> -			max = max(old->shared_count + num_fences,
>> -				  old->shared_max * 2);
>> +		max = max(old->shared_count + num_fences, old->shared_max * 2);
>>   	} else {
>>   		max = max(4ul, roundup_pow_of_two(num_fences));
>>   	}
>> @@ -337,17 +293,17 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>>   
>>   /**
>> -* dma_resv_copy_fences - Copy all fences from src to dst.
>> -* @dst: the destination reservation object
>> -* @src: the source reservation object
>> -*
>> -* Copy all fences from src to dst. dst-lock must be held.
>> -*/
>> + * dma_resv_copy_fences - Copy all fences from src to dst.
>> + * @dst: the destination reservation object
>> + * @src: the source reservation object
>> + *
>> + * Copy all fences from src to dst. dst-lock must be held.
>> + */
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>   {
>>   	struct dma_resv_list *src_list, *dst_list;
>>   	struct dma_fence *old, *new;
>> -	unsigned i;
>> +	unsigned int i;
>>   
>>   	dma_resv_assert_held(dst);
>>   
>> @@ -356,7 +312,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>   
>>   retry:
>>   	if (src_list) {
>> -		unsigned shared_count = src_list->shared_count;
>> +		unsigned int shared_count = src_list->shared_count;
>>   
>>   		rcu_read_unlock();
>>   
>> @@ -373,6 +329,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>   
>>   		dst_list->shared_count = 0;
>>   		for (i = 0; i < src_list->shared_count; ++i) {
>> +			struct dma_fence __rcu **dst;
>>   			struct dma_fence *fence;
>>   
>>   			fence = rcu_dereference(src_list->shared[i]);
>> @@ -391,7 +348,8 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>   				continue;
>>   			}
>>   
>> -			rcu_assign_pointer(dst_list->shared[dst_list->shared_count++], fence);
>> +			dst = &dst_list->shared[dst_list->shared_count++];
>> +			rcu_assign_pointer(*dst, fence);
>>   		}
>>   	} else {
>>   		dst_list = NULL;
>> @@ -431,7 +389,7 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
>>    */
>>   int dma_resv_get_fences_rcu(struct dma_resv *obj,
>>   			    struct dma_fence **pfence_excl,
>> -			    unsigned *pshared_count,
>> +			    unsigned int *pshared_count,
>>   			    struct dma_fence ***pshared)
>>   {
>>   	struct dma_fence **shared = NULL;
>> @@ -533,9 +491,9 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
>>   			       bool wait_all, bool intr,
>>   			       unsigned long timeout)
>>   {
>> -	struct dma_fence *fence;
>> -	unsigned seq, shared_count;
>>   	long ret = timeout ? timeout : 1;
>> +	unsigned int seq, shared_count;
>> +	struct dma_fence *fence;
>>   	int i;
>>   
>>   retry:
>> @@ -565,8 +523,9 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
>>   			shared_count = fobj->shared_count;
>>   
>>   		for (i = 0; !fence && i < shared_count; ++i) {
>> -			struct dma_fence *lfence = rcu_dereference(fobj->shared[i]);
>> +			struct dma_fence *lfence;
>>   
>> +			lfence = rcu_dereference(fobj->shared[i]);
>>   			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>   				     &lfence->flags))
>>   				continue;
>> @@ -633,7 +592,7 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>>    */
>>   bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>   {
>> -	unsigned seq, shared_count;
>> +	unsigned int seq, shared_count;
>>   	int ret;
>>   
>>   	rcu_read_lock();
>> @@ -643,16 +602,16 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>   	seq = read_seqcount_begin(&obj->seq);
>>   
>>   	if (test_all) {
>> -		unsigned i;
>> -
>>   		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
>> +		unsigned int i;
>>   
>>   		if (fobj)
>>   			shared_count = fobj->shared_count;
>>   
>>   		for (i = 0; i < shared_count; ++i) {
>> -			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
>> +			struct dma_fence *fence;
>>   
>> +			fence = rcu_dereference(fobj->shared[i]);
>>   			ret = dma_resv_test_signaled_single(fence);
>>   			if (ret < 0)
>>   				goto retry;
>> @@ -681,3 +640,46 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(dma_resv_test_signaled_rcu);
>> +
>> +#if IS_ENABLED(CONFIG_LOCKDEP)
>> +static int __init dma_resv_lockdep(void)
>> +{
>> +	struct mm_struct *mm = mm_alloc();
>> +	struct ww_acquire_ctx ctx;
>> +	struct dma_resv obj;
>> +	struct address_space mapping;
>> +	int ret;
>> +
>> +	if (!mm)
>> +		return -ENOMEM;
>> +
>> +	dma_resv_init(&obj);
>> +	address_space_init_once(&mapping);
>> +
>> +	mmap_read_lock(mm);
>> +	ww_acquire_init(&ctx, &reservation_ww_class);
>> +	ret = dma_resv_lock(&obj, &ctx);
>> +	if (ret == -EDEADLK)
>> +		dma_resv_lock_slow(&obj, &ctx);
>> +	fs_reclaim_acquire(GFP_KERNEL);
>> +	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
>> +	i_mmap_lock_write(&mapping);
>> +	i_mmap_unlock_write(&mapping);
>> +#ifdef CONFIG_MMU_NOTIFIER
>> +	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
>> +	__dma_fence_might_wait();
>> +	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
>> +#else
>> +	__dma_fence_might_wait();
>> +#endif
>> +	fs_reclaim_release(GFP_KERNEL);
>> +	ww_mutex_unlock(&obj.lock);
>> +	ww_acquire_fini(&ctx);
>> +	mmap_read_unlock(mm);
>> +
>> +	mmput(mm);
>> +
>> +	return 0;
>> +}
>> +subsys_initcall(dma_resv_lockdep);
>> +#endif
>> -- 
>> 2.25.1
>>

