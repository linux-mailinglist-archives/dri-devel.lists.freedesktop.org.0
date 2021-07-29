Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DA3D9E5C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9286ECBD;
	Thu, 29 Jul 2021 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF006ECB8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:24:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b7so5601974wri.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NodFcoBwcNkgj8qIefgAdW9Y4l0Gxe8cQ+RquSN5vqI=;
 b=LgAEU8YmPev9Dm2qYtpOZw1mj0Rlar/a1L+s5JneNPbUm6tE3KhAoTtS74BaboP01A
 hn9fSExUzoffnSRUWBy7dKO9tLc8mEGSeVSxWMdknbiBxIZfqAtkIv1oZ1q2GGaUAscv
 Pru78DreO7SERE2pwlkGVySmC2F4wDN8FDJ/Du4JzNOGzpJSKMIAve2/RXRwtFwd7iRr
 C51i1vcPfsUO3HUmpyaJJUo/0Xui+BrHg77NZSKCq70rDb0Iy66TAT/e4az7SDtBQdD+
 6IMYCQjHz15Oq3iCjTZ4F7Gea6DAPq9NNSJIUEn1f10sIV7mw3AoQ/6fTP3LBUUyUxTy
 fTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NodFcoBwcNkgj8qIefgAdW9Y4l0Gxe8cQ+RquSN5vqI=;
 b=ZEdxp8DPbiI1aRjMqm+5bgOA4xR7zlI7kptfeSSx3h7rAOvApxMhqm1uVr+BDnHb4n
 37ZJyobC1X8reBdQmL6UYjylTMIkqo7JiNB18JAW24tBnYkiwGP2Cs1fxzlsebten4Lc
 W54wRLcXVVvsboulg1/8XysB1dOv4oFxxW9WEfk1L8W6sxUUWfalI7ad5Fjp8qGaljiT
 TYzIR0zohX4/7FZqVjQYkAT3g4avH9hBnPgQlwwIw3Uj7sFeC8cAaMLowasO4nHNwTiw
 QBLr6X1ZBRSlltbl9MGD/rUbcGPwrQLXgqPKfn+L8G1Oy+pS24xg1yasAeFL3r0HqUri
 pWlA==
X-Gm-Message-State: AOAM530L9mutk8CaUKZZQkjolUwqbrVoUXBKuTwgFz+kbGHt/zTnGVdA
 Z98RVyeBAkZnw5JWuNnVlNpfd3U/4Xk=
X-Google-Smtp-Source: ABdhPJygc3XtktrPtQBa1obWqx2RKca2LZnMqXHNGpirfr8dOwqLy9Z9mFXHnRV4uCFhVk+J/YL+ug==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr3209343wru.45.1627543474766; 
 Thu, 29 Jul 2021 00:24:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4b10:6e80:f619:9837?
 ([2a02:908:1252:fb60:4b10:6e80:f619:9837])
 by smtp.gmail.com with ESMTPSA id a16sm2316537wrx.7.2021.07.29.00.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:24:34 -0700 (PDT)
Subject: Re: [PATCH 2/3] dma-buf: nuke DMA_FENCE_TRACE macros
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-2-christian.koenig@amd.com>
 <YQJXHzWtCxFHXFAV@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3cadc3b4-60a8-0acc-ad31-db66804b7981@gmail.com>
Date: Thu, 29 Jul 2021 09:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQJXHzWtCxFHXFAV@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, gustavo@padovan.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.07.21 um 09:22 schrieb Daniel Vetter:
> On Thu, Jul 29, 2021 at 09:03:29AM +0200, Christian König wrote:
>> Only the DRM GPU scheduler, radeon and amdgpu where using them and they depend
>> on a non existing config option to actually emit some code.
>>
>> Nuke them and clean up the dma_fence_signal* return value.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> So i915 is very much become a horror show of wheel reinventing (and we're
> trying to fix that), but there's some legit hand-rolled use-cases for
> having the return value of dma_fence_signal. We're not using that right
> now because hand-rollled nonsense, but can you perhaps keep that part?

I was considering that for the unit tests as well, but then though "nah, 
not if no drivers uses it".

But can I make that a bool while at it? E.g. true for was signaled and 
false for already signaled like we have for the callbacks?

Thanks,
Christian.

>
> Other pieces lgtm.
> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-fence.c               | 44 +++++------------------
>>   drivers/dma-buf/st-dma-fence.c            | 12 ++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 10 +-----
>>   drivers/gpu/drm/radeon/radeon_fence.c     | 24 +++----------
>>   drivers/gpu/drm/scheduler/sched_fence.c   | 18 ++--------
>>   include/linux/dma-fence.h                 | 32 +++--------------
>>   6 files changed, 23 insertions(+), 117 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index ce0f5eff575d..21cba0f74e69 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -350,12 +350,9 @@ void __dma_fence_might_wait(void)
>>    *
>>    * Unlike dma_fence_signal_timestamp(), this function must be called with
>>    * &dma_fence.lock held.
>> - *
>> - * Returns 0 on success and a negative error value when @fence has been
>> - * signalled already.
>>    */
>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> -				      ktime_t timestamp)
>> +void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> +				       ktime_t timestamp)
>>   {
>>   	struct dma_fence_cb *cur, *tmp;
>>   	struct list_head cb_list;
>> @@ -364,7 +361,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>   
>>   	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>   				      &fence->flags)))
>> -		return -EINVAL;
>> +		return;
>>   
>>   	/* Stash the cb_list before replacing it with the timestamp */
>>   	list_replace(&fence->cb_list, &cb_list);
>> @@ -377,8 +374,6 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>   		INIT_LIST_HEAD(&cur->node);
>>   		cur->func(fence, cur);
>>   	}
>> -
>> -	return 0;
>>   }
>>   EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>>   
>> @@ -393,23 +388,14 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>>    * can only go from the unsignaled to the signaled state and not back, it will
>>    * only be effective the first time. Set the timestamp provided as the fence
>>    * signal timestamp.
>> - *
>> - * Returns 0 on success and a negative error value when @fence has been
>> - * signalled already.
>>    */
>> -int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>> +void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>>   {
>>   	unsigned long flags;
>> -	int ret;
>> -
>> -	if (!fence)
>> -		return -EINVAL;
>>   
>>   	spin_lock_irqsave(fence->lock, flags);
>> -	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
>> +	dma_fence_signal_timestamp_locked(fence, timestamp);
>>   	spin_unlock_irqrestore(fence->lock, flags);
>> -
>> -	return ret;
>>   }
>>   EXPORT_SYMBOL(dma_fence_signal_timestamp);
>>   
>> @@ -425,13 +411,10 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp);
>>    *
>>    * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
>>    * held.
>> - *
>> - * Returns 0 on success and a negative error value when @fence has been
>> - * signalled already.
>>    */
>> -int dma_fence_signal_locked(struct dma_fence *fence)
>> +void dma_fence_signal_locked(struct dma_fence *fence)
>>   {
>> -	return dma_fence_signal_timestamp_locked(fence, ktime_get());
>> +	dma_fence_signal_timestamp_locked(fence, ktime_get());
>>   }
>>   EXPORT_SYMBOL(dma_fence_signal_locked);
>>   
>> @@ -444,28 +427,19 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
>>    * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>    * can only go from the unsignaled to the signaled state and not back, it will
>>    * only be effective the first time.
>> - *
>> - * Returns 0 on success and a negative error value when @fence has been
>> - * signalled already.
>>    */
>> -int dma_fence_signal(struct dma_fence *fence)
>> +void dma_fence_signal(struct dma_fence *fence)
>>   {
>>   	unsigned long flags;
>> -	int ret;
>>   	bool tmp;
>>   
>> -	if (!fence)
>> -		return -EINVAL;
>> -
>>   	tmp = dma_fence_begin_signalling();
>>   
>>   	spin_lock_irqsave(fence->lock, flags);
>> -	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
>> +	dma_fence_signal_timestamp_locked(fence, ktime_get());
>>   	spin_unlock_irqrestore(fence->lock, flags);
>>   
>>   	dma_fence_end_signalling(tmp);
>> -
>> -	return ret;
>>   }
>>   EXPORT_SYMBOL(dma_fence_signal);
>>   
>> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
>> index c8a12d7ad71a..e89001d8873f 100644
>> --- a/drivers/dma-buf/st-dma-fence.c
>> +++ b/drivers/dma-buf/st-dma-fence.c
>> @@ -122,21 +122,13 @@ static int test_signaling(void *arg)
>>   		goto err_free;
>>   	}
>>   
>> -	if (dma_fence_signal(f)) {
>> -		pr_err("Fence reported being already signaled\n");
>> -		goto err_free;
>> -	}
>> -
>> +	dma_fence_signal(f);
>>   	if (!dma_fence_is_signaled(f)) {
>>   		pr_err("Fence not reporting signaled\n");
>>   		goto err_free;
>>   	}
>>   
>> -	if (!dma_fence_signal(f)) {
>> -		pr_err("Fence reported not being already signaled\n");
>> -		goto err_free;
>> -	}
>> -
>> +	dma_fence_signal(f);
>>   	err = 0;
>>   err_free:
>>   	dma_fence_put(f);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index d4547d195173..397872779c31 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -246,7 +246,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>>   	struct amdgpu_fence_driver *drv = &ring->fence_drv;
>>   	struct amdgpu_device *adev = ring->adev;
>>   	uint32_t seq, last_seq;
>> -	int r;
>>   
>>   	do {
>>   		last_seq = atomic_read(&ring->fence_drv.last_seq);
>> @@ -278,12 +277,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>>   		if (!fence)
>>   			continue;
>>   
>> -		r = dma_fence_signal(fence);
>> -		if (!r)
>> -			DMA_FENCE_TRACE(fence, "signaled from irq context\n");
>> -		else
>> -			BUG();
>> -
>> +		dma_fence_signal(fence);
>>   		dma_fence_put(fence);
>>   		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>>   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> @@ -673,8 +667,6 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>>   	if (!timer_pending(&ring->fence_drv.fallback_timer))
>>   		amdgpu_fence_schedule_fallback(ring);
>>   
>> -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", ring->idx);
>> -
>>   	return true;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
>> index 18f2c2e0dfb3..3f351d222cbb 100644
>> --- a/drivers/gpu/drm/radeon/radeon_fence.c
>> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
>> @@ -176,18 +176,11 @@ static int radeon_fence_check_signaled(wait_queue_entry_t *wait, unsigned mode,
>>   	 */
>>   	seq = atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq);
>>   	if (seq >= fence->seq) {
>> -		int ret = dma_fence_signal_locked(&fence->base);
>> -
>> -		if (!ret)
>> -			DMA_FENCE_TRACE(&fence->base, "signaled from irq context\n");
>> -		else
>> -			DMA_FENCE_TRACE(&fence->base, "was already signaled\n");
>> -
>> +		dma_fence_signal_locked(&fence->base);
>>   		radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>   		__remove_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
>>   		dma_fence_put(&fence->base);
>> -	} else
>> -		DMA_FENCE_TRACE(&fence->base, "pending\n");
>> +	}
>>   	return 0;
>>   }
>>   
>> @@ -422,8 +415,6 @@ static bool radeon_fence_enable_signaling(struct dma_fence *f)
>>   	fence->fence_wake.func = radeon_fence_check_signaled;
>>   	__add_wait_queue(&rdev->fence_queue, &fence->fence_wake);
>>   	dma_fence_get(f);
>> -
>> -	DMA_FENCE_TRACE(&fence->base, "armed on ring %i!\n", fence->ring);
>>   	return true;
>>   }
>>   
>> @@ -441,11 +432,7 @@ bool radeon_fence_signaled(struct radeon_fence *fence)
>>   		return true;
>>   
>>   	if (radeon_fence_seq_signaled(fence->rdev, fence->seq, fence->ring)) {
>> -		int ret;
>> -
>> -		ret = dma_fence_signal(&fence->base);
>> -		if (!ret)
>> -			DMA_FENCE_TRACE(&fence->base, "signaled from radeon_fence_signaled\n");
>> +		dma_fence_signal(&fence->base);
>>   		return true;
>>   	}
>>   	return false;
>> @@ -550,7 +537,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
>>   {
>>   	uint64_t seq[RADEON_NUM_RINGS] = {};
>>   	long r;
>> -	int r_sig;
>>   
>>   	/*
>>   	 * This function should not be called on !radeon fences.
>> @@ -567,9 +553,7 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool intr, long timeo
>>   		return r;
>>   	}
>>   
>> -	r_sig = dma_fence_signal(&fence->base);
>> -	if (!r_sig)
>> -		DMA_FENCE_TRACE(&fence->base, "signaled from fence_wait\n");
>> +	dma_fence_signal(&fence->base);
>>   	return r;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 69de2c76731f..3736746c47bd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -50,26 +50,12 @@ static void __exit drm_sched_fence_slab_fini(void)
>>   
>>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
>>   {
>> -	int ret = dma_fence_signal(&fence->scheduled);
>> -
>> -	if (!ret)
>> -		DMA_FENCE_TRACE(&fence->scheduled,
>> -				"signaled from irq context\n");
>> -	else
>> -		DMA_FENCE_TRACE(&fence->scheduled,
>> -				"was already signaled\n");
>> +	dma_fence_signal(&fence->scheduled);
>>   }
>>   
>>   void drm_sched_fence_finished(struct drm_sched_fence *fence)
>>   {
>> -	int ret = dma_fence_signal(&fence->finished);
>> -
>> -	if (!ret)
>> -		DMA_FENCE_TRACE(&fence->finished,
>> -				"signaled from irq context\n");
>> -	else
>> -		DMA_FENCE_TRACE(&fence->finished,
>> -				"was already signaled\n");
>> +	dma_fence_signal(&fence->finished);
>>   }
>>   
>>   static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 6ffb4b2c6371..027db23fd4e3 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -370,11 +370,11 @@ static inline void dma_fence_end_signalling(bool cookie) {}
>>   static inline void __dma_fence_might_wait(void) {}
>>   #endif
>>   
>> -int dma_fence_signal(struct dma_fence *fence);
>> -int dma_fence_signal_locked(struct dma_fence *fence);
>> -int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> -				      ktime_t timestamp);
>> +void dma_fence_signal(struct dma_fence *fence);
>> +void dma_fence_signal_locked(struct dma_fence *fence);
>> +void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>> +void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> +				       ktime_t timestamp);
>>   signed long dma_fence_default_wait(struct dma_fence *fence,
>>   				   bool intr, signed long timeout);
>>   int dma_fence_add_callback(struct dma_fence *fence,
>> @@ -590,26 +590,4 @@ struct dma_fence *dma_fence_get_stub(void);
>>   struct dma_fence *dma_fence_allocate_private_stub(void);
>>   u64 dma_fence_context_alloc(unsigned num);
>>   
>> -#define DMA_FENCE_TRACE(f, fmt, args...) \
>> -	do {								\
>> -		struct dma_fence *__ff = (f);				\
>> -		if (IS_ENABLED(CONFIG_DMA_FENCE_TRACE))			\
>> -			pr_info("f %llu#%llu: " fmt,			\
>> -				__ff->context, __ff->seqno, ##args);	\
>> -	} while (0)
>> -
>> -#define DMA_FENCE_WARN(f, fmt, args...) \
>> -	do {								\
>> -		struct dma_fence *__ff = (f);				\
>> -		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
>> -			 ##args);					\
>> -	} while (0)
>> -
>> -#define DMA_FENCE_ERR(f, fmt, args...) \
>> -	do {								\
>> -		struct dma_fence *__ff = (f);				\
>> -		pr_err("f %llu#%llu: " fmt, __ff->context, __ff->seqno,	\
>> -			##args);					\
>> -	} while (0)
>> -
>>   #endif /* __LINUX_DMA_FENCE_H */
>> -- 
>> 2.25.1
>>

