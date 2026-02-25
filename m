Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD7RM+ISn2nWYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:18:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD11996E5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F1410E22C;
	Wed, 25 Feb 2026 15:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="usGM0BoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409D10E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:18:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so41766765e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772032732; x=1772637532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0duHEWtI6kL/XWFNZl4sr8GMAyb2xz6UvQc7MNO8wek=;
 b=usGM0BoTt5fYLXP/6EK88Cmw5AxN2IXP0GiB2UvxGVciYLNh6EdCvcXh3/o+XL85ID
 UiVVMKfM6DbMbhiH+ahrvEG4LMr5l/6Z9EIzaamWxkF8n4tSAzfi/CjHlbHzfpaDnO4c
 EQgEmvIxnlXUuTSM45Irl2JjHluOGzuVEbU+Ru0X14ikw+eOGuhjH9hpKf2UTOmD17Mt
 1qI/1BG9mA38bFyDjVv7+7GyBakZ8TRNGhDc26kD6TSk9+aa5/nFdozMwALUkM65gPWs
 b35o0JsRSAx4c+Q5gbiqP1X5VdXyR3cdyUptibLRPk1Rp4TMkBuEJVB3baj1sb807o8/
 sWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772032732; x=1772637532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0duHEWtI6kL/XWFNZl4sr8GMAyb2xz6UvQc7MNO8wek=;
 b=rhUJaUFY0KAKhM3P0ma+Sx11/Bmr6jRFQ+1adxnV2E8EYq6jTeR4Gg/6nX4hgND1tD
 f7u04uIX9xNWrpfo+3sE3zmCkqL7U357rDI8BT3+fAwgc+yOT+WaXXjLp/G2o18viL+r
 4qFGlY8lPRBX/W+S8KeT+ni4IJ7n/sucb4yDybdA+WM0/jPqAHUEpCGqMDfrrJHfXKrk
 ofyGyXe/+Ww7UMmDp4PaPN2mzkppt1y2Cs6cFerYZr3UBaseRC8pnwBwWNiDPIwnqqWZ
 f4dRA4hsAnmcaZUrFXeKL922zgQ1WdIN2eFMK+W1LG3POi1g1lD5DtQqVGshMEetbCIp
 pN+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp6UZPS1EeOvwmp54iiShG3oQc+XCZOFG5+CYo0k3RGLSemCOxG9fVllTnPbZq3B5ek83ApYi22pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1xCJDRedBbqGRvMYk2RyHzkcBYXX4x+CYQgl6QIWud1/D6WRJ
 k1OxG8f0/k8tgSUASUQMM8P6JMn0rPX2EmZRLVy0tky3TACz/o8/E3usQdU+T1CAUHM=
X-Gm-Gg: ATEYQzyLimu/xqeLK/lxHrLxkC/TRkIOffw8JMjdQfHonJ2/RLj95gpP5sPxbyzeVm7
 D8oFG69l9WYlOFqyk0C/ghA2wDXEscDk7LBGjBeCN4vVVZ/cp1Hhl//6CAV0p3wqHTJ/np0vpRw
 9ItcK3Usi74PWrMrETgJibmxkf+MsrxGMf2rKzQCNlmycvxsE6Can4MnluBRDE+6pb39YcDsExS
 BkMpXkhJW4A/iurzseoS1mnkirFI5Q4KsNxq9Q1rswxRpnAc4EX1J6hAv54EiEZlyT29Wq4ufG9
 YoiUJjOlwrnpxUOMRj9YY6rLe4H7gmu71gx7mib1iGXyN+bCK3dUw7wttUr+qj1i5E45trHvYMB
 O0rHvJz3xa09SJcAZLVvhqCvlW4WEp+nSpcNwWgiJRnIGey07oqD/jq6vWQTsZBmKv303sUGDDv
 6wSxqu7WEmhJyJdc5c0FqdgQVZ9ibAu9epn5ZRWxiiYXYJ
X-Received: by 2002:a05:600c:6815:b0:47e:e946:3a72 with SMTP id
 5b1f17b1804b1-483c21a10c5mr13759935e9.27.1772032731307; 
 Wed, 25 Feb 2026 07:18:51 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd739087sm74940165e9.14.2026.02.25.07.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:18:48 -0800 (PST)
Message-ID: <8c3db886-72d1-49c1-ac6c-7640af735e51@ursulin.net>
Date: Wed, 25 Feb 2026 15:18:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/ttm: Extract code for attempting allocation in
 a place
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
References: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
 <20260225-dmemcg-aggressive-protect-v4-3-de847ab35184@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260225-dmemcg-aggressive-protect-v4-3-de847ab35184@gmx.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,igalia.com:email]
X-Rspamd-Queue-Id: 11BD11996E5
X-Rspamd-Action: no action


On 25/02/2026 12:10, Natalie Vock wrote:
> Move all code for attempting allocation for a specific place to
> ttm_bo_alloc_place. With subsequent patches, this logic is going to get
> more complicated, so it helps readability to have this separate.
> 
> ttm_bo_alloc_at_place takes a pointer to a struct ttm_bo_alloc_state.
> This struct holds various state produced by the allocation (e.g. cgroup
> resource associated with the allocation) that the caller needs to keep
> track of (and potentially dispose of). This is just the limiting cgroup
> pool for now, but future patches will add more state needing to be tracked.
> 
> ttm_bo_alloc_at_place also communicates via return codes if eviction
> using ttm_bo_evict_alloc should be attempted. This is preparation for
> attempting eviction in more cases than just force_space being set.
> 
> No functional change intended.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 109 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 84 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index acb9197db8798..48dbaaa46824c 100644
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
> +	/** @alloc_state: State associated with the allocation attempt. */
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
> @@ -689,6 +696,58 @@ static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
>   	return dma_resv_reserve_fences(bo->base.resv, 1);
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
> + * -EBUSY: No space available, but allocation should be retried with ttm_bo_evict_alloc.
> + * -ENOSPC: No space available, allocation should not be retried.
> + * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
> + *
> + */
> +static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
> +				 const struct ttm_place *place,
> +				 struct ttm_operation_ctx *ctx,
> +				 bool force_space,
> +				 struct ttm_resource **res,
> +				 struct ttm_bo_alloc_state *alloc_state)
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
> +		/*
> +		 * -EAGAIN means the charge failed, which we treat like an
> +		 * allocation failure. Therefore, return an error code indicating
> +		 * the allocation failed - either -EBUSY if the allocation should
> +		 * be retried with eviction, or -ENOSPC if there should be no second
> +		 * attempt.
> +		 */
> +		if (ret == -EAGAIN)
> +			return may_evict ? -EBUSY : -ENOSPC;
> +
> +		if (ret == -ENOSPC && may_evict)
> +			return -EBUSY;
> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * ttm_bo_alloc_resource - Allocate backing store for a BO
>    *
> @@ -714,7 +773,9 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   				 bool force_space,
>   				 struct ttm_resource **res)
>   {
> +	struct ttm_bo_alloc_state alloc_state = {0};

= {};

>   	struct ttm_device *bdev = bo->bdev;
> +	struct ttm_resource_manager *man;

I don't mind if you pull the above two out of the loop too much, but I 
have to re-point it out since I am sure you know the principle of not 
making changes which are not strictly needed, especially if they are not 
a clear win on readability or something.

>   	struct ww_acquire_ctx *ticket;
>   	int i, ret;
>   
> @@ -725,9 +786,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   
>   	for (i = 0; i < placement->num_placement; ++i) {
>   		const struct ttm_place *place = &placement->placement[i];
> -		struct dmem_cgroup_pool_state *limit_pool = NULL;
> -		struct ttm_resource_manager *man;
> -		bool may_evict;
>   
>   		man = ttm_manager_type(bdev, place->mem_type);
>   		if (!man || !ttm_resource_manager_used(man))
> @@ -737,25 +795,26 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
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
> +				if (ret != -EBUSY)
> +					return ret;
>   				continue;
> -			if (ret)
> -				return ret;
> +			}

Would keeping the ret checks at one level of indentation look better? Eg 
like the current version:

if (ret == -EBUSY)
	continue;
else if (ret)
	return ret;

Up to you.

Btw, it is an interesting design that there are eviction errors which 
prevent trying the next placement. A bit surprising to me but it is out 
of scope here.

Anyway, I went back and forth a few times over the logic and it indeed 
looks to me that there are no functional changes. Thanks for improving 
the commit message as well, now it is completely clear what the patch is 
about. With or without the nitpicks:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> +		} else if (ret) {
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +			return ret;
>   		}
>   
>   		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
> 

