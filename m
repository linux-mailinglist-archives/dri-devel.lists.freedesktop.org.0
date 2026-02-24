Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGrWMyrNnWnfSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:09:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A081898F6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC01E10E5C9;
	Tue, 24 Feb 2026 16:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="TSEbJjzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6D810E5C9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:09:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso46219555e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1771949349; x=1772554149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xEMwUsFe80O7FQT2pky6cbdem5vVaUv5gBoDleT5nkE=;
 b=TSEbJjzFeZkVAOcpLGx+FtJVQbN5yp3rR7sRisF8NothEOttHzh4LUtQYbDdnkfZcG
 y+VXQ7wv9tEHXg5VeBAqXE8q7yJl5sugHF7R0njLMpq05VYGbPoo60m2tA9oKHGXQS9J
 zDJXRGkHn6HprsHwTw4mBjKN9+8yW/ppVCpgfLPkx78INdpXijAlzJGlqfHodbAaFQ9O
 rNNS0u3ZQIZtgypegkpHst3oyLGIB4IjNAp6ZLfgxqHf+gRge/a+TZslqohkGYLDDfwP
 Ui5/GKmDuThFMuEfQWBe22y9cRusfdidOj+YKWmIR1jv1WH8wKJGydLBojqanrdVC/pS
 YJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771949349; x=1772554149;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xEMwUsFe80O7FQT2pky6cbdem5vVaUv5gBoDleT5nkE=;
 b=ne1cKlDThD7Vr7KEaYr0j7xYytFd3wL80rY0D/J2+E1Z8Ll1pdjMgItG/1RJsd9PDv
 ueKirbfVFCU7gCQFgxygiRX0eYnrtmXxVTchW+m6zMXRtbcpRDJI4Op/B74Nb+GlDVZJ
 J20dZE3CjKt2DKHCPE1rU/e842B0QnPlb7D0nJFgI0lDV9lHXQip6g2tb2q/gVs9v6Qh
 eAxjdxm6wvfGNCWBjWsYk0cfNLyBQ7yhRcOa+KhYJ0ahEo5yXkGGx5WY0fKsMPtcyCUW
 qH2LfC4JwzXkYfhnhuOyxu9QH+53r0552uu6U4tgWGIswtYR58aJ3R0O8fKGpty5dmWh
 kolg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1UJIgdSKcSFB4/XFnMpxHYGgsaBaGFFHlMuLbLafP3v+NOCl5P0debVKJ/3gtAcMut1Ffz9G5gMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTxYxsN5AepR9OXQ6rpJUt47YOrbulr/BZdtAqaiAALJiwLQfY
 W6N0uQCudwCboB/MM3y7XSnFQFfQGgqlnldEGYCPvyf4FmijKbx+jB5oPmt4rB9iXrSHAwgyk/R
 w4lAY9Q0=
X-Gm-Gg: AZuq6aIvJfrPq7Z1b21t5knBTwR4pxne05KUlQM74UH+xEYQFdJCDtfjAKS2DSrXAzH
 Tk42/ItZ/O9K1TG4v2Z2d4UjlX2kvNrKzZULGmnIcTriq8wyoFqBA+999xV7U+nKYpJvJrLJQ2+
 OEs9Ae2fC19iuuUMLmZhF7FnKfGDncLh4RC9mn9YeLE1lNgIxAGokClqy9sVcKHDrjLs6jIAZmw
 dIjonpJ10NSGz9V5RSdUKW0rq3wacbXxtGFHzfShqRrfa96zUcr8yEBKQPupqCFpInfAllA2jXs
 GyadPe7cg6JuXD4ZpxgvKdLuI2a/8bPvTw5I+C0UyGpsF2dQsAN/RVXZf7wfUEVR/fPJ5Bpkvof
 SrIDz3sZGLKozKGg/r8WGczkmqfmjzn6KVmsgO0EnD6eNrgnwLokn0b5Q1dhw1PLb2ykaSLcJss
 tn9NViiEq5n/qvSd+H1iaHBWH2Og/0ayJQTWF+V3DQJc7r
X-Received: by 2002:a05:600c:c4a5:b0:483:7783:5382 with SMTP id
 5b1f17b1804b1-483a95e6b64mr191933505e9.27.1771949348294; 
 Tue, 24 Feb 2026 08:09:08 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75df90sm7650265e9.14.2026.02.24.08.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 08:09:07 -0800 (PST)
Message-ID: <3e820754-681c-4def-8e70-e1b88ed092e5@ursulin.net>
Date: Tue, 24 Feb 2026 16:09:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/ttm: Make a helper for attempting allocation
 in a place
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
 <20251110-dmemcg-aggressive-protect-v3-3-219ffcfc54e9@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251110-dmemcg-aggressive-protect-v3-3-219ffcfc54e9@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmx.de,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:email,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: 18A081898F6
X-Rspamd-Action: no action


On 10/11/2025 12:37, Natalie Vock wrote:
> ttm_bo_alloc_place is a new helper function to make an attempt at
> allocating a bo's resource in a specific place. It also makes decisions
> on whether eviction should be attempted: If -ENOSPC is returned,
> allocation should not be retried.

At first I thought the new helper will get used from more than one call 
site but it seems that is not the case? No objections to extract some 
code to be clear, just that when I see a patch title of "making a 
helper" I expect something different.

Is there any functional difference here or it is just prep to enable 
easier extending in the following patch? If no functional difference it 
is good to state that in the commit message. If functional difference 
please explain what and why.

Also please explain that the patch is only adding a new struct parameter 
as a preparation for it being extended.

> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 98 +++++++++++++++++++++++++++++++++-----------
>   1 file changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e70..829d994798835 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -489,6 +489,11 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
>   	return ret;
>   }
>   
> +struct ttm_bo_alloc_state {
> +	/** @limit_pool: Which pool limit we should test against */
> +	struct dmem_cgroup_pool_state *limit_pool;
> +};
> +
>   /**
>    * struct ttm_bo_evict_walk - Parameters for the evict walk.
>    */
> @@ -504,12 +509,13 @@ struct ttm_bo_evict_walk {
>   	/** @evicted: Number of successful evictions. */
>   	unsigned long evicted;
>   
> -	/** @limit_pool: Which pool limit we should test against */
> -	struct dmem_cgroup_pool_state *limit_pool;
>   	/** @try_low: Whether we should attempt to evict BO's with low watermark threshold */
>   	bool try_low;
>   	/** @hit_low: If we cannot evict a bo when @try_low is false (first pass) */
>   	bool hit_low;
> +
> +	/** @alloc_state: */
> +	struct ttm_bo_alloc_state *alloc_state;
>   };
>   
>   static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
> @@ -518,8 +524,9 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>   		container_of(walk, typeof(*evict_walk), walk);
>   	s64 lret;
>   
> -	if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resource->css,
> -					      evict_walk->try_low, &evict_walk->hit_low))
> +	if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state->limit_pool,
> +					      bo->resource->css, evict_walk->try_low,
> +					      &evict_walk->hit_low))
>   		return 0;
>   
>   	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
> @@ -561,7 +568,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>   			      struct ttm_operation_ctx *ctx,
>   			      struct ww_acquire_ctx *ticket,
>   			      struct ttm_resource **res,
> -			      struct dmem_cgroup_pool_state *limit_pool)
> +			      struct ttm_bo_alloc_state *state)
>   {
>   	struct ttm_bo_evict_walk evict_walk = {
>   		.walk = {
> @@ -574,7 +581,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>   		.place = place,
>   		.evictor = evictor,
>   		.res = res,
> -		.limit_pool = limit_pool,
> +		.alloc_state = state,
>   	};
>   	s64 lret;
>   
> @@ -688,6 +695,47 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   	return ret;
>   }
>   
> +
> +/**
> + * ttm_bo_alloc_at_place - Attempt allocating a BO's backing store in a place
> + *
> + * @bo: The buffer to allocate the backing store of
> + * @place: The place to attempt allocation in
> + * @ctx: ttm_operation_ctx associated with this allocation
> + * @force_space: If we should evict buffers to force space
> + * @res: On allocation success, the resulting struct ttm_resource.
> + * @alloc_state: Object holding allocation state such as charged cgroups.
> + *
> + * Returns:
> + * -EBUSY: No space available, but allocation should be retried with eviction.

With or after eviction?

> + * -ENOSPC: No space available, allocation should not be retried.
> + * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.

-EAGAIN cannot get out from ttm_resource_alloc()? In the current 
codebase or only with this patch?

> + *
> + */
> +static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
> +				 const struct ttm_place *place,
> +				 struct ttm_operation_ctx *ctx,
> +				 bool force_space,
> +				 struct ttm_resource **res,
> +				 struct ttm_bo_alloc_state *alloc_state)

Maybe you did not write this but I am curious and thinking out loud 
here. The documentation for struct ttm_operation_ctx among other things 
says:

"""
  * Context for TTM operations like changing buffer placement or general 
memory
  * allocation.
"""

Hence I am wondering if the new alloc_state couldn't simply go in there? 
Which would make the function prototype identical to the existing 
ttm_bo_alloc_resource and is also already passed through the relevant 
call chains. Which raises another question - why did 
ttm_bo_evict_alloc() need to have struct dmem_cgroup_pool_state as a 
separate argument and why it couldn't be passed in the context?

> +{
> +	bool may_evict;
> +	int ret;
> +
> +	may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> +
> +	ret = ttm_resource_alloc(bo, place, res,
> +				 force_space ? &alloc_state->limit_pool : NULL);
> +
> +	if (ret) {
> +		if ((ret == -ENOSPC || ret == -EAGAIN) && may_evict)
> +			ret = -EBUSY;
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * ttm_bo_alloc_resource - Allocate backing store for a BO
>    *
> @@ -713,7 +761,9 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   				 bool force_space,
>   				 struct ttm_resource **res)
>   {
> +	struct ttm_bo_alloc_state alloc_state = {0};

= {}; is usually enough.

Any particular reason to move this and the manager outside of the loop?

>   	struct ttm_device *bdev = bo->bdev;
> +	struct ttm_resource_manager *man;
>   	struct ww_acquire_ctx *ticket;
>   	int i, ret;
>   
> @@ -724,9 +774,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   
>   	for (i = 0; i < placement->num_placement; ++i) {
>   		const struct ttm_place *place = &placement->placement[i];
> -		struct dmem_cgroup_pool_state *limit_pool = NULL;
> -		struct ttm_resource_manager *man;
> -		bool may_evict;
>   
>   		man = ttm_manager_type(bdev, place->mem_type);
>   		if (!man || !ttm_resource_manager_used(man))
> @@ -736,25 +783,26 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   				    TTM_PL_FLAG_FALLBACK))
>   			continue;
>   
> -		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> -		ret = ttm_resource_alloc(bo, place, res, force_space ? &limit_pool : NULL);
> -		if (ret) {
> -			if (ret != -ENOSPC && ret != -EAGAIN) {
> -				dmem_cgroup_pool_state_put(limit_pool);
> -				return ret;
> -			}
> -			if (!may_evict) {
> -				dmem_cgroup_pool_state_put(limit_pool);
> -				continue;
> -			}
> +		ret = ttm_bo_alloc_at_place(bo, place, ctx, force_space,
> +				res, &alloc_state);
>   
> +		if (ret == -ENOSPC) {
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +			continue;

I always disliked the TTM eviction logic and now I remember why. It 
requires a brain size of a small planet to figure out the flow.. :) I'd 
say this change makes it more readable.

> +		} else if (ret == -EBUSY) {
>   			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
> -						 ticket, res, limit_pool);
> -			dmem_cgroup_pool_state_put(limit_pool);
> -			if (ret == -EBUSY)
> +						 ticket, res, &alloc_state);
> +
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +
> +			if (ret) {
> +				if (ret != -ENOSPC && ret != -EBUSY)
> +					return ret;
>   				continue;

Is this a functional change and why? Before only EBUSY went to the next 
placement. Now ENOSPC does as well.

Regards,

Tvrtko

> -			if (ret)
> -				return ret;
> +			}
> +		} else if (ret) {
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +			return ret;
>   		}
>   
>   		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
> 

