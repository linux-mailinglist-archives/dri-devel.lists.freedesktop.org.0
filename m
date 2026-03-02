Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF+mI5PCpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:02:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6BF1DD6F1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ADC10E57F;
	Mon,  2 Mar 2026 17:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="f7TYh9/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D1410E576
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 17:02:03 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-65f980cea07so6665724a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772470922; x=1773075722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bKMuMJCSdxxmw3RSD5uAPmfVmq1uYJz0WuSv/dBgVQs=;
 b=f7TYh9/GjDCezFVckFQrx/40sFzJ4RVSKJAiUHibYBPzw5HpP81aMqnisgeechQ6cV
 L1c/2ZyNrOdHFg3zID/xuIAhDK9q+w8ykUoWanwlu/r9g7i5TSJZ1o4USo/mbTaQB6p5
 AFwfZrXxUK6/LzOovPlH4Sd5IozmvxOF0QipdtzAddLRNX7uYUG3Sv/wHjUQRWI/M2nM
 oMllLZlWz/17pv2QTfHKnbA17p1fk5G9J0TmpjRW9dxN8ehWwOJymE21h+h9Dj88F9+V
 Atwub+bc9lfOuXvF4AdaG8RlkHJcYB2Jt0zJFz9WbcWm2Qv0YyMhJDMzGxZEjyRL24I3
 Zf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772470922; x=1773075722;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKMuMJCSdxxmw3RSD5uAPmfVmq1uYJz0WuSv/dBgVQs=;
 b=Ly2ZWrK6s1J8dweuPdVJqDG4vIF35f7XbYbsk51bSMN23vSOiN0hlZQDlmtpP87WvX
 1oS7F+ztjFUMRY8j+9Pj7hHrzrqU3uaofQBfej3u17tPmFWRGWc4GHI9RwdHMBEMwmKh
 T/hN3BgAbbhWRV4v0L/a2A9bjJ9Jcn9eyzI9nRPIvJpO3aR5hYSQhkOe8Qcpo5PJBqXo
 p2NLS3F4FNw3tXki0oB84B72+Ue5jNOAzA53bXCKZQWowAfdMZuhQp2aWHSBv/m0cY5a
 Quwf9dEgSU+Mpid06Y8fMrBh5NsWglLWZraIn6myWR1fvQu8B+zDCepOrk/Aw0YgBOzY
 8Bkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWISJcDBN10vI4XJbCpLp1z870SZ3VyBv3EYJiyovb4nuNngv+qN768JiOVk3E+I8Dk3oZRUVcMi9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNW2FjPYVvXnCYcR0iHozdRxOkPFsaOfmmFnx+QqYxfbcAKYlW
 axeBvx4jG8NYD1tgKfxpNcuDs033RZg7ZYlYUFbvv1gsoxrzgTaBtz9OjQ4a8KdLTIM=
X-Gm-Gg: ATEYQzxXAuoDEL4Kvq0Y+w3BddOBygB+sqf2H2/nH5tsboK2qSehodWzDXisapzDhrC
 eo9nHNsFPdpqRiSWwKt4IPaAmhnab8utMzVVlvQEKEvr/fFam+v77qjnJEX2nC3pn3jq4EwWsZ8
 Nri/FrSiiu6rwGY3u7tmfnMscdMOv4HWaEbl+CzpkpP9ga52ZiFEDY4Ogn+EEE5vzrkLHtFh0ZS
 kjkCbwJ8sZJjF8lKeIKCyOqXGZvHTzU6LEDmGhZT73Sxl5HBkg3bT6kCmAUxtSi5FgYQZ/RU+M3
 jfAcu3c1FaoTo6d736GHZc5R/7XcckNKy3MvEXeoqVtWlx4Wof/GQI3LFp8G75VthC2rdOT4yZX
 wICpELEEd0qhJdl8yzhdD/eqPTx5+rppBHO1waZj7ucNi2bWbJdThK9U4I6O0S32009H/KR6CmL
 9re/AuOkm0hKceUPlyLbwfRcRsJmyrsNCxSw0my2+CjAHS
X-Received: by 2002:a17:907:7fac:b0:b93:cae3:5832 with SMTP id
 a640c23a62f3a-b93cae3ae31mr47113266b.22.1772470922107; 
 Mon, 02 Mar 2026 09:02:02 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac84863sm499538966b.29.2026.03.02.09.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:02:01 -0800 (PST)
Message-ID: <86ef0e02-ac40-4bd4-bfcb-173d4312acb2@ursulin.net>
Date: Mon, 2 Mar 2026 17:02:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/ttm: Be more aggressive when allocating below
 protection limit
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
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
 <20260302-dmemcg-aggressive-protect-v5-5-ffd3a2602309@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260302-dmemcg-aggressive-protect-v5-5-ffd3a2602309@gmx.de>
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
X-Rspamd-Queue-Id: 3E6BF1DD6F1
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ursulin.net:dkim,ursulin.net:mid]
X-Rspamd-Action: no action


On 02/03/2026 12:37, Natalie Vock wrote:
> When the cgroup's memory usage is below the low/min limit and allocation
> fails, try evicting some unprotected buffers to make space. Otherwise,
> application buffers may be forced to go into GTT even though usage is
> below the corresponding low/min limit, if other applications filled VRAM
> with their allocations first.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 52 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 53c4de4bcc1e3..86f99237f6490 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -494,6 +494,10 @@ struct ttm_bo_alloc_state {
>   	struct dmem_cgroup_pool_state *charge_pool;
>   	/** @limit_pool: Which pool limit we should test against */
>   	struct dmem_cgroup_pool_state *limit_pool;
> +	/** @only_evict_unprotected: If only unprotected BOs, i.e. BOs whose cgroup
> +	 *  is exceeding its dmem low/min protection, should be considered for eviction
> +	 */
> +	bool only_evict_unprotected;
>   };
>   
>   /**
> @@ -598,8 +602,12 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>   	evict_walk.walk.arg.trylock_only = true;
>   	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>   
> -	/* One more attempt if we hit low limit? */
> -	if (!lret && evict_walk.hit_low) {
> +	/* If we failed to find enough BOs to evict, but we skipped over
> +	 * some BOs because they were covered by dmem low protection, retry
> +	 * evicting these protected BOs too, except if we're told not to
> +	 * consider protected BOs at all.
> +	 */
> +	if (!lret && evict_walk.hit_low && !state->only_evict_unprotected) {
>   		evict_walk.try_low = true;
>   		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>   	}
> @@ -620,7 +628,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>   	} while (!lret && evict_walk.evicted);
>   
>   	/* We hit the low limit? Try once more */
> -	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
> +	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
> +			!state->only_evict_unprotected) {
>   		evict_walk.try_low = true;
>   		goto retry;
>   	}
> @@ -730,7 +739,7 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>   				 struct ttm_resource **res,
>   				 struct ttm_bo_alloc_state *alloc_state)
>   {
> -	bool may_evict;
> +	bool may_evict, below_low;
>   	int ret;
>   
>   	may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> @@ -749,9 +758,42 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>   		return ret;
>   	}
>   
> +	/*
> +	 * cgroup protection plays a special role in eviction.
> +	 * Conceptually, protection of memory via the dmem cgroup controller
> +	 * entitles the protected cgroup to use a certain amount of memory.
> +	 * There are two types of protection - the 'low' limit is a
> +	 * "best-effort" protection, whereas the 'min' limit provides a hard
> +	 * guarantee that memory within the cgroup's allowance will not be
> +	 * evicted under any circumstance.
> +	 *
> +	 * To faithfully model this concept in TTM, we also need to take cgroup
> +	 * protection into account when allocating. When allocation in one
> +	 * place fails, TTM will default to trying other places first before
> +	 * evicting.
> +	 * If the allocation is covered by dmem cgroup protection, however,
> +	 * this prevents the allocation from using the memory it is "entitled"
> +	 * to. To make sure unprotected allocations cannot push new protected
> +	 * allocations out of places they are "entitled" to use, we should
> +	 * evict buffers not covered by any cgroup protection, if this
> +	 * allocation is covered by cgroup protection.
> +	 *
> +	 * Buffers covered by 'min' protection are a special case - the 'min'
> +	 * limit is a stronger guarantee than 'low', and thus buffers protected
> +	 * by 'low' but not 'min' should also be considered for eviction.
> +	 * Buffers protected by 'min' will never be considered for eviction
> +	 * anyway, so the regular eviction path should be triggered here.
> +	 * Buffers protected by 'low' but not 'min' will take a special
> +	 * eviction path that only evicts buffers covered by neither 'low' or
> +	 * 'min' protections.
> +	 */
> +	may_evict |= dmem_cgroup_below_min(NULL, alloc_state->charge_pool);

It may make sense to group the two lines which "calculate" may_evict 
together. which would probably mean also pulling two lines below to 
before try charge, so that the whole logical block is not split.

> +	below_low = dmem_cgroup_below_low(NULL, alloc_state->charge_pool);
> +	alloc_state->only_evict_unprotected = !may_evict && below_low;

Would it work to enable may_evict also if below_low is true, and assign 
below_low directly to only_evict_unprotected? I mean along the lines of:

may_evict = force_space && place->mem_type != TTM_PL_SYSTEM;
may_evict |= dmem_cgroup_below_min(NULL, alloc_state->charge_pool);
alloc_state->only_evict_unprotected = dmem_cgroup_below_low(NULL, 
alloc_state->charge_pool);

It would allow the if condition below to be simpler. Evict callback 
would remain the same I guess.

And maybe only_evict_unprotected could be renamed to "try_low" to align 
with the naming in there? Then in the callback the condition would be like:

  	/* We hit the low limit? Try once more */
	if (!lret && evict_walk.hit_low &&
	    !(evict_walk.try_low | state->try_low))
  		evict_walk.try_low = true;
  		goto retry;

Give or take.. Would that be more readable eg. obvious? Although I am 
endlessly confused how !try_low ends up being try_low = true in this 
condition so maybe I am mixing something up. You get my gist though? 
Unifying the naming and logic for easier understanding in essence if you 
can find some workable way in this spirit I think it is worth thinking 
about it.

Regards,

Tvrtko

> +
>   	ret = ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
>   	if (ret) {
> -		if (ret == -ENOSPC && may_evict)
> +		if (ret == -ENOSPC && (may_evict || below_low))
>   			ret = -EBUSY;
>   		return ret;
>   	}
> 

