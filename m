Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9398404C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0286910E673;
	Tue, 24 Sep 2024 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZNDsne2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642CF10E673;
 Tue, 24 Sep 2024 08:20:30 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3770320574aso3488701f8f.2; 
 Tue, 24 Sep 2024 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727166028; x=1727770828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lAs0tQNVU81RZjY2m2CdbBUGrZw8dwtP0YvHoLvIJI8=;
 b=ZNDsne2oVI30c+BK+GXYPSzPH606PiRqm+wABpJTkGKDtcvg8l/ejpXNhRtjtgd/oC
 bZAVgUrNWCouZ0LJhvhBFeUdL1oAoOlpLXfOf1Rg1EtjSXh2AopANUTwenx/CH59bwk7
 SSO+Xo37ALMJ7xe5RXfrHjLU/ZYgNJI5KHlybFuoqYLRdRavuA2WYiZ8K3dfaybFIPEl
 lCNmSd7Z71k4OxlFcmX3S0Uu9JC9QThFqtH1Og1uUk2TL3zQFNQAg0Pvi6f+CEoH4DP9
 t7hePRVeUwGNh4gixoEY1AcTEcRezxJQEWVVN3SQNaDy8f9ttF3jJM4xSOHQr3dGpq/w
 MK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727166028; x=1727770828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAs0tQNVU81RZjY2m2CdbBUGrZw8dwtP0YvHoLvIJI8=;
 b=LEj5hDtuPrMecBRJct7ZHv0ydOFSYIUArPQn2D44uFimubU4FYOinSCsZSFRIXTKeO
 eZb49fgOz5cTPPI+euL9SZmoTrTfNB8QyQUgv4WtQU4HGwWzsqlDlo1PM2kmAIUFx/9Q
 Ky5Mom5dtEJDdgXOXfi5DLgvjki1/s56QIBN+8uuoWvlQ97jR+eDvjtUqUgLH90BRSym
 xOOxIp44FkJqQj/kc9vI8fXcwzJt9K1w1c2c8p0NX5ZlWkjAqmD027gG7KaQ4cD5f9JJ
 0cEhBvdoNMnYvCD3p3QnsJK6OCSvyru3vs8rFd0CMTBy74BpPdpcWOrZJVKAaZwXvNWA
 UGmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK3sMGTv8o0ing3txjYPOJ8GSYHq86JRfBV5VaenZn+mUzHKR1XhFWSIJdI2RtnFabNDGTy5fAF9U1@lists.freedesktop.org,
 AJvYcCXxynSwkI2s0tGre5o0Oqa2pjsRf51Xa+l+L+8MjVwDBRyRwcwj3AvtE21lkkD8m22gc2pkJmr7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPnx2DMgAS4feMxxJ+S34aUT+ZF7xupC0Ni2mKitSiX9WQ820+
 e8zrXjTVGgm1cnnAlND6qB0eqnIm12DqAixTH/k4HzniH3WzLVn0
X-Google-Smtp-Source: AGHT+IGyjoBXga/f8OePC7IeD+AJNPVVchaM++LgEa4wmNZ36NPYY9eLILJY7Ik2hBQg0pz7ZJREkg==
X-Received: by 2002:a05:6000:18c9:b0:374:c30c:3be with SMTP id
 ffacd0b85a97d-37a43160c4dmr6852514f8f.30.1727166028275; 
 Tue, 24 Sep 2024 01:20:28 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2c1f80sm909829f8f.44.2024.09.24.01.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 01:20:27 -0700 (PDT)
Message-ID: <478b066b-af6c-43a2-9e0e-a19344893bc0@gmail.com>
Date: Tue, 24 Sep 2024 10:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240916173007.118-1-tursulin@igalia.com>
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

Am 16.09.24 um 19:30 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Having removed one re-lock cycle on the entity->lock in a patch titled
> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
> larger refactoring we can do the same optimisation on the rq->lock.
> (Currently both drm_sched_rq_add_entity() and
> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>
> To achieve this we make drm_sched_rq_update_fifo_locked() and
> drm_sched_rq_add_entity() expect the rq->lock to be held.
>
> We also align drm_sched_rq_update_fifo_locked(),
> drm_sched_rq_add_entity() and
> drm_sched_rq_remove_fifo_locked() function signatures, by adding rq as a
> parameter to the latter.
>
> v2:
>   * Fix after rebase of the series.
>   * Avoid naming incosistency between drm_sched_rq_add/remove. (Christian)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 29 ++++++++++++------------
>   include/drm/gpu_scheduler.h              |  3 ++-
>   3 files changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index d982cebc6bee..8ace1f1ea66b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -515,9 +515,14 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   
>   		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>   		if (next) {
> +			struct drm_sched_rq *rq;
> +
>   			spin_lock(&entity->lock);
> -			drm_sched_rq_update_fifo_locked(entity,
> +			rq = entity->rq;
> +			spin_lock(&rq->lock);
> +			drm_sched_rq_update_fifo_locked(entity, rq,
>   							next->submit_ts);
> +			spin_unlock(&rq->lock);
>   			spin_unlock(&entity->lock);
>   		}
>   	}
> @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		sched = rq->sched;
>   
>   		atomic_inc(sched->score);
> +
> +		spin_lock(&rq->lock);
>   		drm_sched_rq_add_entity(rq, entity);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo_locked(entity, submit_ts);
> +			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>   
> +		spin_unlock(&rq->lock);
>   		spin_unlock(&entity->lock);
>   
>   		drm_sched_wakeup(sched, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 18a952f73ecb..5c83fb92bb89 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -153,17 +153,18 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>   	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>   }
>   
> -static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> +					    struct drm_sched_rq *rq)
>   {
> -	struct drm_sched_rq *rq = entity->rq;
> -
>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>   		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>   		RB_CLEAR_NODE(&entity->rb_tree_node);
>   	}
>   }
>   
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +				     struct drm_sched_rq *rq,
> +				     ktime_t ts)
>   {
>   	/*
>   	 * Both locks need to be grabbed, one to protect from entity->rq change
> @@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts
>   	 * other to update the rb tree structure.
>   	 */
>   	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
>   
> -	spin_lock(&entity->rq->lock);
> -
> -	drm_sched_rq_remove_fifo_locked(entity);
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	entity->oldest_job_waiting = ts;
>   
> -	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>   		      drm_sched_entity_compare_before);
> -
> -	spin_unlock(&entity->rq->lock);
>   }
>   
>   /**
> @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   			     struct drm_sched_entity *entity)
>   {
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
>   	if (!list_empty(&entity->list))
>   		return;
>   
> -	spin_lock(&rq->lock);
> -
>   	atomic_inc(rq->sched->score);
>   	list_add_tail(&entity->list, &rq->entities);
> -
> -	spin_unlock(&rq->lock);
>   }
>   
>   /**
> @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity)
>   {
> +	lockdep_assert_held(&entity->lock);
> +
>   	if (list_empty(&entity->list))
>   		return;
>   
> @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   		rq->current_entity = NULL;
>   
>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity);
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	spin_unlock(&rq->lock);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 80198e6cf537..b21806d5a8eb 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +				     struct drm_sched_rq *rq, ktime_t ts);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,

