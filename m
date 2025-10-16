Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C2BE4FBF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 20:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5957E10E331;
	Thu, 16 Oct 2025 18:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="QA/e7noJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A6810E331
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 18:04:48 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so637052f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760637887; x=1761242687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zkLTaExTEdzbAJ6EJKxOF2X8hrjKCiyc7pBkHYli2iQ=;
 b=QA/e7noJ4pc9N1GhtZ1cv36zQahdWDqdObkcNLH5YhOb/OGnLoS+Yisp7C+6BX/5sQ
 FMXO6H4eSZFdDYqwMyhKz3leFWdWfFDVpvFT/JqD5yj4RGvh6v05ZCmEULASBgl8S804
 KeZMcJnzb3JhB08wta3NH1Tzo3fWg4fzA2yM8k0een9T/3p5RqAVGYr4LkTXX8CJlscY
 if2Q9UtCPEBqDwjtmNQyTkVVu5EIi1M2n5f4l45sqxtQm58xecXGIbjd/2jR0dQN/GUN
 +DAdyXZmU6O9BxSEf51nZdKbI6QJkr51n7ZrFxe7sXXbBnTsPrP33Hp/vSb+EywrT/y6
 sdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637887; x=1761242687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zkLTaExTEdzbAJ6EJKxOF2X8hrjKCiyc7pBkHYli2iQ=;
 b=QzTrdb7lBHhWT+pMI5eOxQwBCXnu1Cis/ET2idFmG6Ez682nNVLyQMN1/OTttWSQd4
 0EoKf/SYiZ1X0yUlxzmCff01hEl8gel/fqBCTkszDe10SAtrTsbmLvSf/1iNXv0pTUqu
 QdGPPmVQE4QvbebBvx2hg8RmJiTqUNCBibHooVSI6uxQlMnN7F3VZstyYpm6tzColok6
 8FxLpXh6fnm3Ya9ASteWsJmKHiN0UV4VLFYC6CK/yzQ7HVf11VSETPMP4VINt+Fzi5ui
 KELILs/P1LQ59ccIUx8lNV9McwFm8txPq3TIZKKBSW07jicnafO3ZVEpqWUkQPKNOFlm
 tCcQ==
X-Gm-Message-State: AOJu0YxMT8+ebx+X6i69kM3FcXWwCvAEbEGY81YTWjvG+vurZmMHWkRN
 Cgu5L/Ha0dOE9d7+utB2BRipX9bwnxI9BLxND4H/K9bl5jeti15mN0p+syBr3E8pcjk=
X-Gm-Gg: ASbGncsjk4UoQCXGN6NOwQW/WSqV+DBqwSSQf1jxu8j5IHwnFXue4m+MwM4pGLoqJY0
 Q5F02m8zQNZKOsJKc7OeSWVPCB7MayMkTtpoLNJynjAoEzTuRbiQ1qqJTwB03SyTOgLxIATZvIF
 iFdmlKov0/0r9I+9SMWEbRp9bLDvP5jyE4YZiDq6DfJ2/Hz+1I8XbOgTKSF1B85nDhIz7et0B5H
 DIbxHKryy9Mm+Egji6+QuK8/uLh806gzRozEr2ksq+znJHlcoeViB3m5qXp2/QGdXXAJGNLTufv
 NvTyGMpzSSF90JGw5lqJHLg78ox3pSWW4H6AqP7f85SN8quB4w1zzUZUTijkb+74YxLnvAB0F9G
 M7UEOWjIe1cCMcaV1MQePQajHjXnq/oIOSSxmR1Fjp6VEHMD7svse2rUGvFATMTryseMIwUafLr
 d7BUjfD7Lbp+ZnYZD30cvlVF86AJ8mkCzkdKqw
X-Google-Smtp-Source: AGHT+IF6fDTqOe1DUO8ET8IbW4n1qLUdo1gPw2BsfOvMkwAgj6AGCLBTY4vsv5KpnulSflLq9tnlZA==
X-Received: by 2002:a5d:5d81:0:b0:3e7:471c:1de3 with SMTP id
 ffacd0b85a97d-42704d8cd82mr691137f8f.14.1760637886437; 
 Thu, 16 Oct 2025 11:04:46 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e0e70sm35485198f8f.40.2025.10.16.11.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 11:04:45 -0700 (PDT)
Message-ID: <8c849523-6e15-4bc9-83e3-f78cb9d42d47@ursulin.net>
Date: Thu, 16 Oct 2025 19:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] dma-buf: protected fence ops by RCU
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251013143502.1655-4-christian.koenig@amd.com>
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


On 13/10/2025 14:48, Christian König wrote:
> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 65 +++++++++++++++++++++++++++----------
>   include/linux/dma-fence.h   | 18 ++++++++--
>   2 files changed, 62 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 51ee13d005bc..982f2b2a62c0 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -498,6 +498,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>   signed long
>   dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   {
> +	const struct dma_fence_ops *ops;
>   	signed long ret;
>   
>   	if (WARN_ON(timeout < 0))
> @@ -509,15 +510,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   
>   	dma_fence_enable_sw_signaling(fence);
>   
> -	if (trace_dma_fence_wait_start_enabled()) {
> -		rcu_read_lock();
> -		trace_dma_fence_wait_start(fence);
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	trace_dma_fence_wait_start(fence);
> +	if (ops->wait) {
> +		/*
> +		 * Implementing the wait ops is deprecated and not supported for
> +		 * issuer independent fences, so it is ok to use the ops outside
> +		 * the RCU protected section.
> +		 */
> +		rcu_read_unlock();
> +		ret = ops->wait(fence, intr, timeout);
> +	} else {
>   		rcu_read_unlock();
> -	}
> -	if (fence->ops->wait)
> -		ret = fence->ops->wait(fence, intr, timeout);
> -	else
>   		ret = dma_fence_default_wait(fence, intr, timeout);
> +	}
>   	if (trace_dma_fence_wait_end_enabled()) {
>   		rcu_read_lock();
>   		trace_dma_fence_wait_end(fence);
> @@ -538,6 +545,7 @@ void dma_fence_release(struct kref *kref)
>   {
>   	struct dma_fence *fence =
>   		container_of(kref, struct dma_fence, refcount);
> +	const struct dma_fence_ops *ops;
>   
>   	rcu_read_lock();
>   	trace_dma_fence_destroy(fence);
> @@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
>   		spin_unlock_irqrestore(fence->lock, flags);
>   	}
>   
> -	rcu_read_unlock();
> -
> -	if (fence->ops->release)
> -		fence->ops->release(fence);
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->release)
> +		ops->release(fence);
>   	else
>   		dma_fence_free(fence);
> +	rcu_read_unlock();

I had it like this back in May you were worried release callback can 
sleep. So I gather since then you figured out no one sleeps or takes a 
sleeping lock?

I went through them all and it seems that could be (almost) so.

There is only vgem_fence_release() which calls timer_delete_sync(), and 
while __timer_delete_sync() has a comment saying 
del_timer_wait_running() has a sleeping slow path I think this is only 
due spinlocks becoming sleeping locks.

Due this PREEMPT_RT might be a problem for the RCU approach in general, 
not just for vgem.

Possibly if you enable it you would start seeing warnings fire for 
sleeping while preemption disabled. Something to double check in case I 
got confused.

Hm actually, do you even need to move the RCU section around the 
.release() and .wait() if the premise of the series is drivers who 
specify those will not be protected?

Regards,

Tvrtko

>   }
>   EXPORT_SYMBOL(dma_fence_release);
>   
> @@ -593,6 +601,7 @@ EXPORT_SYMBOL(dma_fence_free);
>   
>   static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
>   	bool was_set;
>   
>   	lockdep_assert_held(fence->lock);
> @@ -603,14 +612,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return false;
>   
> -	if (!was_set && fence->ops->enable_signaling) {
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (!was_set && ops->enable_signaling) {
>   		trace_dma_fence_enable_signal(fence);
>   
> -		if (!fence->ops->enable_signaling(fence)) {
> +		if (!ops->enable_signaling(fence)) {
> +			rcu_read_unlock();
>   			dma_fence_signal_locked(fence);
>   			return false;
>   		}
>   	}
> +	rcu_read_unlock();
>   
>   	return true;
>   }
> @@ -983,8 +996,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>    */
>   void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>   {
> -	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> -		fence->ops->set_deadline(fence, deadline);
> +	const struct dma_fence_ops *ops;
> +
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +		ops->set_deadline(fence, deadline);
> +	rcu_read_unlock();
>   }
>   EXPORT_SYMBOL(dma_fence_set_deadline);
>   
> @@ -1024,7 +1042,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>   
>   	kref_init(&fence->refcount);
> -	fence->ops = ops;
> +	/*
> +	 * At first glance it is counter intuitive to protect a constant
> +	 * function pointer table by RCU, but this allows modules providing the
> +	 * function table to unload by waiting for an RCU grace period.
> +	 */
> +	RCU_INIT_POINTER(fence->ops, ops);
>   	INIT_LIST_HEAD(&fence->cb_list);
>   	fence->lock = lock;
>   	fence->context = context;
> @@ -1104,11 +1127,14 @@ EXPORT_SYMBOL(dma_fence_init64);
>    */
>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>   			 "RCU protection is required for safe access to returned string");
>   
> +	ops = rcu_dereference(fence->ops);
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return ops->get_driver_name(fence);
>   	else
>   		return "detached-driver";
>   }
> @@ -1136,11 +1162,14 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>    */
>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>   			 "RCU protection is required for safe access to returned string");
>   
> +	ops = rcu_dereference(fence->ops);
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return ops->get_driver_name(fence);
>   	else
>   		return "signaled-timeline";
>   }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..38421a0c7c5b 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -66,7 +66,7 @@ struct seq_file;
>    */
>   struct dma_fence {
>   	spinlock_t *lock;
> -	const struct dma_fence_ops *ops;
> +	const struct dma_fence_ops __rcu *ops;
>   	/*
>   	 * We clear the callback list on kref_put so that by the time we
>   	 * release the fence it is unused. No one should be adding to the
> @@ -418,13 +418,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {
> +		rcu_read_unlock();
>   		dma_fence_signal_locked(fence);
>   		return true;
>   	}
> +	rcu_read_unlock();
>   
>   	return false;
>   }
> @@ -448,13 +454,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {
> +		rcu_read_unlock();
>   		dma_fence_signal(fence);
>   		return true;
>   	}
> +	rcu_read_unlock();
>   
>   	return false;
>   }

