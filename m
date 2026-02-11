Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCagLJijjGlhrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:43:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9393125C8C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6425C10E61A;
	Wed, 11 Feb 2026 15:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UVhLEOJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E7F10E087
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:43:15 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8c713a6a6f8so118129085a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770824594; x=1771429394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y4PXuACOt4MinSrlklQViseJiS6zxe0SlEXJ+9N6Plk=;
 b=UVhLEOJAV6ZTYf0IFh/icD/CeP7ayeXm5TXrnyqhuk5ucllbQRhy6OHaZcEgx4YXXk
 1YjclSx/75L4P/5Axo7wW0gnnL01N3OwlZoUjyGrBOILptJM5efwZeOvzlioZMU9WSMq
 KdUE6YqAgB6Lqd673XVOhgiykB4rCU806BieYv1WOw+e5Hes4ZF8RBkPJYUKUHj2+vsy
 xK09dUKMMzINfg3HZL9L5Hs5DCwDn6PHN7NQLlr04hT93I/vrG+1jK5/ZE1tgbi0k4O5
 mX8KqDwmhTW3O2qmAdSOgEMSeekS0x0S9SG0kI9XfYhsE1CJlPX5/fzwxwOBQ5aF8bRa
 zEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770824594; x=1771429394;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4PXuACOt4MinSrlklQViseJiS6zxe0SlEXJ+9N6Plk=;
 b=mwzFhogF/voL9KfGLrG4PvAq8yCYV6wrD+QDCJRjAt1R10K8Lscsr+uAJ2VfzHvoq+
 ySkcZaCIepRQps5/MgHo6Q/JL6wU+/CReGPU9y3W/JRV6ehtQod8zrhe5m5tCRdyIXsk
 uZF7mTIUZ3UumJK/HSRaBOr1cJwuq9gjYLJW2+0k6+KtpO0ptm68E7yiGVSY4B4Bn0zv
 ZrzfJfbXBp82PrJiqdIZZgbHWuqxFd4zUsJ2jyDdpw99Rm7nyrdmNg4VTvblrFs/GV6n
 oAaNIc+qxvIWxMRu0SVffwoteo85HVe+EDL65eMfQkHWKSGecV7F3lI2nlSeV765yNii
 kd9Q==
X-Gm-Message-State: AOJu0Yy7hdLclLXJIAJG86U1F1JHdiAuT/z3Wm6448T12VjmKJWFH52s
 pmdbf1HaAqS0ZpVcawUDAT1CJnMaSpQMYGey9E5Vbwx+Wz6EUId/CjJmqvXvUZFB
X-Gm-Gg: AZuq6aJs1Lxw1a3R/yuJly63SdTbuFRlwTIyFEVT3/GUAW1fubeombA53nb+uynfcG6
 E6xrHPdndHvCUgmJlHg/oRVkdGkJLBZUsRckHQxQgDdDN//zNHZixh3zRslxG7t7N0fyu46yGLm
 LifKG7Jj9M9MAk2Hhmntkgf44hmw6TV0pdnGzyzl0JoOOzfsIGVFflm25wi6+hZ/75XCAzKUbCM
 UKg3KKQTDigly23wAQOyUmSQ5UUJz1nWk6tN2K7siGmDhloYEmmFD3vd3iH8h7uAKpB791i+qNi
 1Mfx0ADSU06dBJU2WjzvpJZAN6bB5Yn59fBZ8IZ/T4H+Ox6iRWLQuiG8piV3EM7memLyFu3Y9Or
 c+B0TGt/KvyWj3wFnhTHXi8I9eUal81vDNoGO2YJZajlBSxx4S8vn9lGO6QV0VG63AABdsrbbOL
 XYx4ovIPGqHIZebWwvxRF+nvuhJSzDfk6wA37TnZ06/C1CyC+R/bSc0g==
X-Received: by 2002:ae9:f204:0:b0:8cb:1d7a:3f35 with SMTP id
 af79cd13be357-8cb1eeeb93bmr658545785a.6.1770824593972; 
 Wed, 11 Feb 2026 07:43:13 -0800 (PST)
Received: from [10.254.121.37] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb2b213ae0sm133642185a.45.2026.02.11.07.43.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:43:13 -0800 (PST)
Message-ID: <f357c2fc-3c72-42ac-b079-849222de4c6e@gmail.com>
Date: Wed, 11 Feb 2026 16:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
To: phasta@kernel.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
 <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <f1345723cc5a61cdec5a6f168f71a323b822b7e2.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9393125C8C
X-Rspamd-Action: no action

On 2/11/26 11:06, Philipp Stanner wrote:
> On Tue, 2026-02-10 at 11:01 +0100, Christian König wrote:
>> At first glance it is counter intuitive to protect a constant function
>> pointer table by RCU, but this allows modules providing the function
>> table to unload by waiting for an RCU grace period.
> 
> I think that someone who does not already have a deep understanding
> about dma-buf and fences will have much trouble understanding *why*
> this patch is in the log and *what it achieves*.
> 
> Good commit messages are at least as important as good code. In
> drm/sched for example I've been trying so many times to figure out why
> certain hacks and changes were implemented, but all that git-blame ever
> gave me was one liners, often hinting at some driver internal work
> around ._.

How about something like this:

The fence ops of a dma_fence currently need to life as long as the dma_fence is alive.

This means that the module who originally issued a dma_fence can't unload unless all of them are freed up.

As first step to solve this issue protect the fence ops by RCU.

While it is counter intuitive to protect a constant function pointer table by RCU it allows modules to wait for an RCU grace period to make sure that nobody is executing their functions any more.


> 
>>
>> v2: make one the now duplicated lockdep warnings a comment instead.
>> v3: Add more documentation to ->wait and ->release callback.
>> v4: fix typo in documentation
>> v5: rebased on drm-tip
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>>  include/linux/dma-fence.h   | 29 ++++++++++++++--
>>  2 files changed, 73 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index e05beae6e407..de9bf18be3d4 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>>  signed long
>>  dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>  {
>> +	const struct dma_fence_ops *ops;
>>  	signed long ret;
>>  
>>  	if (WARN_ON(timeout < 0))
>> @@ -533,15 +534,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>  
>>  	dma_fence_enable_sw_signaling(fence);
>>  
>> -	if (trace_dma_fence_wait_start_enabled()) {
> 
> Why can wait_start_enabled() be removed? Is that related to the life
> time decoupling or is it a separate topic?

It isn't removed, I've just removed the "if (trace_dma_fence_wait_start_enabled())" optimization which is used by the tracing subsystem as self-patching code (longer story).

The trace_dma_fence_wait_start() trace point function is still called a few lines below.

>> -		rcu_read_lock();
>> -		trace_dma_fence_wait_start(fence);
>> +	rcu_read_lock();
>> +	ops = rcu_dereference(fence->ops);
>> +	trace_dma_fence_wait_start(fence);
>> +	if (ops->wait) {
>> +		/*
>> +		 * Implementing the wait ops is deprecated and not supported for
>> +		 * issuer independent fences, so it is ok to use the ops outside
> 
> s/issuer/issuers of

Fixed.

> And how do we know that this here is an independent fence?
> What even is an "independent fence" – one with internal spinlock?

I rephrased the sentence a bit to make that more clearer:

                /*
                 * Implementing the wait ops is deprecated and not supported for
                 * issuers of fences who wants them to be independent of their
                 * module after they signal, so it is ok to use the ops outside
                 * the RCU protected section.
                 */


> 
>> +		 * the RCU protected section.
>> +		 */
>> +		rcu_read_unlock();
>> +		ret = ops->wait(fence, intr, timeout);
>> +	} else {
>>  		rcu_read_unlock();
>> -	}
>> -	if (fence->ops->wait)
>> -		ret = fence->ops->wait(fence, intr, timeout);
>> -	else
>>  		ret = dma_fence_default_wait(fence, intr, timeout);
>> +	}
> 
> The git diff here looks awkward. Do you use git format-patch --
> histogram?

Nope, what's the matter?

>>  	if (trace_dma_fence_wait_end_enabled()) {
>>  		rcu_read_lock();
>>  		trace_dma_fence_wait_end(fence);

>>  
>> @@ -1049,7 +1067,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>  	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>  
>>  	kref_init(&fence->refcount);
>> -	fence->ops = ops;
>> +	/*
>> +	 * At first glance it is counter intuitive to protect a constant
>> +	 * function pointer table by RCU, but this allows modules providing the
>> +	 * function table to unload by waiting for an RCU grace period.
> 
> Maybe add a sentence like "Fences can live longer than the module which
> issued them."

Going to use the same as the commit message here as soon as we synced up on that.

> 
>> +	 */
>> +	RCU_INIT_POINTER(fence->ops, ops);
>>  	INIT_LIST_HEAD(&fence->cb_list);
>>  	fence->lock = lock;
>>  	fence->context = context;
>> @@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>>   */
>>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>  {
>> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> -			 "RCU protection is required for safe access to returned string");
>> +	const struct dma_fence_ops *ops;
>>  
>> +	/* RCU protection is required for safe access to returned string */
>> +	ops = rcu_dereference(fence->ops);
>>  	if (!dma_fence_test_signaled_flag(fence))
>> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
>> +		return (const char __rcu *)ops->get_driver_name(fence);
>>  	else
>>  		return (const char __rcu *)"detached-driver";
>>  }
>> @@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>>   */
>>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>  {
>> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>> -			 "RCU protection is required for safe access to returned string");
>> +	const struct dma_fence_ops *ops;
>>  
>> +	/* RCU protection is required for safe access to returned string */
>> +	ops = rcu_dereference(fence->ops);
>>  	if (!dma_fence_test_signaled_flag(fence))
>> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
>> +		return (const char __rcu *)ops->get_driver_name(fence);
>>  	else
>>  		return (const char __rcu *)"signaled-timeline";
>>  }
> 
> Did we make any progress in our conversation about removing those two
> functions and callbacks? They're only used by i915.

Actually they are mostly used by the trace points and debugfs, so we certainly can't remove them.

But I'm really wondering why the heck i915 is using them?

>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 9c4d25289239..6bf4feb0e01f 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -67,7 +67,7 @@ struct seq_file;
>>   */
>>  struct dma_fence {
>>  	spinlock_t *lock;
>> -	const struct dma_fence_ops *ops;
>> +	const struct dma_fence_ops __rcu *ops;
>>  	/*
>>  	 * We clear the callback list on kref_put so that by the time we
>>  	 * release the fence it is unused. No one should be adding to the
>> @@ -220,6 +220,10 @@ struct dma_fence_ops {
>>  	 * timed out. Can also return other error values on custom implementations,
>>  	 * which should be treated as if the fence is signaled. For example a hardware
>>  	 * lockup could be reported like that.
>> +	 *
>> +	 * Implementing this callback prevents the fence from detaching after
>> +	 * signaling and so it is mandatory for the module providing the
> 
> s/mandatory/necessary ?

Fixed.

> 
>> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
>>  	 */
>>  	signed long (*wait)(struct dma_fence *fence,
>>  			    bool intr, signed long timeout);
>> @@ -231,6 +235,13 @@ struct dma_fence_ops {
>>  	 * Can be called from irq context.  This callback is optional. If it is
>>  	 * NULL, then dma_fence_free() is instead called as the default
>>  	 * implementation.
>> +	 *
>> +	 * Implementing this callback prevents the fence from detaching after
>> +	 * signaling and so it is mandatory for the module providing the
> 
> same

Fixed.

> 
>> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
>> +	 *
>> +	 * If the callback is implemented the memory backing the dma_fence
>> +	 * object must be freed RCU safe.
>>  	 */
>>  	void (*release)(struct dma_fence *fence);
>>  
>> @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
>>  static inline bool
>>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>>  {
>> +	const struct dma_fence_ops *ops;
>> +
>>  	if (dma_fence_test_signaled_flag(fence))
>>  		return true;
>>  
>> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> +	rcu_read_lock();
>> +	ops = rcu_dereference(fence->ops);
>> +	if (ops->signaled && ops->signaled(fence)) {
> 
> Maybe you can educate me a bit about RCU here – couldn't this still
> race? If the ops were unloaded before you take rcu_read_lock(),
> rcu_dereference() would give you an invalid pointer here since you
> don't check for !ops, no?

Perfectly correct thinking, yes.

But the check for !ops is added in patch #2 when we actually start to set ops = NULL when the fence signals.

I intentionally separated that because it is basically the second step in making the solution to detach the fence ops from the module by RCU work.

We could merge the two patches together, but I think the separation actually makes sense should anybody start to complain about the additional RCU overhead.

Thanks,
Christian.

> 
> 
>> +		rcu_read_unlock();
>>  		dma_fence_signal_locked(fence);
>>  		return true;
>>  	}
>> +	rcu_read_unlock();
>>  
>>  	return false;
>>  }
>> @@ -484,13 +501,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>  static inline bool
>>  dma_fence_is_signaled(struct dma_fence *fence)
>>  {
>> +	const struct dma_fence_ops *ops;
>> +
>>  	if (dma_fence_test_signaled_flag(fence))
>>  		return true;
>>  
>> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> +	rcu_read_lock();
>> +	ops = rcu_dereference(fence->ops);
>> +	if (ops->signaled && ops->signaled(fence)) {
> 
> same
> 
> 
> Danke,
> P.
> 
>> +		rcu_read_unlock();
>>  		dma_fence_signal(fence);
>>  		return true;
>>  	}
>> +	rcu_read_unlock();
>>  
>>  	return false;
>>  }
> 

