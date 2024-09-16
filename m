Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5397A1E7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 14:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8FF10E07C;
	Mon, 16 Sep 2024 12:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PWqfQAL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE62410E07C;
 Mon, 16 Sep 2024 12:11:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-374c180d123so1801791f8f.3; 
 Mon, 16 Sep 2024 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726488693; x=1727093493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BZ24RKYITUYrsIkT9gg5Xsnw+bKUjCCZKSDK38oFNWo=;
 b=PWqfQAL2gKV9G33HVSvKJ3+uNAY5A0PW40LxCKobojZnU53D+B51rK1ycCWfaIyWNI
 +eer4oHWdj+MnOZt9jnDZ+3lKsrkfbbR1lPKa5/mrawQNJ7u1QQnG2C3wbLD0CJ5uVl9
 hRxfxeuG+ToKPrWp3wdvi4VcpIXdWSDn1c6+yH25q5VrpaE/oXEvkPfFv/H38Pw/RwsM
 e6TfkhfFN9KaWoINvr1Py7lsNCOLbF+13FwaK3+S2LDEgsTGVoxdeU7E4f2A98b5L7AV
 Ga0HlP3Xo4sxh3ghTg7B7jfLdFtWr94aIWj/OdvEknkwlmLVQ81y0pQdFnJa+uSmIWqg
 NCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726488693; x=1727093493;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BZ24RKYITUYrsIkT9gg5Xsnw+bKUjCCZKSDK38oFNWo=;
 b=bAFBrnvWOFzH7Z5CvTlTscE09vJpmdMbV0YNx4bgBJaOfFl4F15lgJtdgZnXivN2J7
 EMe5NU+CGxM/QUkllTZGF3ds4sG10pWcMQkuh6idZVblpD8l8zabByCw+EDn1BiDuuES
 +M/obyaM9/LDukJ4B0etwjRHLsxVK4FY9ew2Ow92AQje+eSbCKfALn1owTkQPK2a2EGs
 sEltzCTsFFybONiOzoLRdtZb99uLyjFYIfzUeuUKIUKDNKgWG7BlijCImUZYCqroQoFj
 Z1tqZBtChOI3bp4xYo6qr/fxBcJOA5JJB/cjkooScUn3LE/mDs9YHbavozWFoFyyaqbZ
 MPOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ/WIeSWZDxx6IVFiJf3bwnEHs7DVGzVv8uTZeMUfXHYK4zfzy3sABytRu8nhPXthBSmBL1PbJ@lists.freedesktop.org,
 AJvYcCVug3Ul1+siQ6WLZZ11WOHVr8bU9qFbk1XdkpxA1aJktAlSr88UqJbM5tVChoj7YntB3lWNXmPR/130@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz10Tl+rObDSDI3yqXWMRLHz3hQ+uBEyB2OhQVGc9tL5pAgDIb1
 ZR2mRSZSn83dAbY5SUZ7Rr/RYwIyLgJjkHE1RWvz3PPOuWjC7DeH8sHabhJo
X-Google-Smtp-Source: AGHT+IH2qHxMTv12AWcl+E3z2lCBq/qVPF/lP9JSG2jKfY4drk4RUVqWELfMSdeTrLXhRiwDh1IHHA==
X-Received: by 2002:a05:6000:1546:b0:374:b5af:710c with SMTP id
 ffacd0b85a97d-378d61f0d6cmr7364826f8f.26.1726488692723; 
 Mon, 16 Sep 2024 05:11:32 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780471fsm7111877f8f.95.2024.09.16.05.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 05:11:30 -0700 (PDT)
Message-ID: <5d69f9cb-719f-45b6-ba94-071825230c77@gmail.com>
Date: Mon, 16 Sep 2024 14:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
 <20240913160559.49054-9-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240913160559.49054-9-tursulin@igalia.com>
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

Am 13.09.24 um 18:05 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Having removed one re-lock cycle on the entity->lock in a patch titled
> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
> larger refactoring we can do the same optimisation on the rq->lock.
> (Currently both drm_sched_rq_add_entity() and
> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>
> To achieve this we rename drm_sched_rq_add_entity() to
> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
> held, and also add the same expectation to
> drm_sched_rq_update_fifo_locked().
>
> Finally, to align drm_sched_rq_update_fifo_locked(),
> drm_sched_rq_add_entity_locked() and
> drm_sched_rq_remove_fifo_locked() function signatures, we add rq as a
> parameter to the latter.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  8 ++++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 34 +++++++++++-------------
>   include/drm/gpu_scheduler.h              |  7 ++---
>   3 files changed, 26 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index d982cebc6bee..c48f17faef41 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -517,6 +517,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   		if (next) {
>   			spin_lock(&entity->lock);
>   			drm_sched_rq_update_fifo_locked(entity,
> +							entity->rq,
>   							next->submit_ts);
>   			spin_unlock(&entity->lock);
>   		}
> @@ -618,11 +619,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   		sched = rq->sched;
>   
>   		atomic_inc(sched->score);
> -		drm_sched_rq_add_entity(rq, entity);
> +
> +		spin_lock(&rq->lock);
> +		drm_sched_rq_add_entity_locked(rq, entity);
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
> index 18a952f73ecb..c0d3f6ac3ae3 100644
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
> @@ -203,25 +201,23 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>   }
>   
>   /**
> - * drm_sched_rq_add_entity - add an entity
> + * drm_sched_rq_add_entity_locked - add an entity
>    *
>    * @rq: scheduler run queue
>    * @entity: scheduler entity
>    *
>    * Adds a scheduler entity to the run queue.
>    */
> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -			     struct drm_sched_entity *entity)
> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
> +				    struct drm_sched_entity *entity)
>   {
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
> @@ -235,6 +231,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity)

The naming of drm_sched_rq_add_entity_locked() and 
drm_sched_rq_add_entity_locked() don't match up any more.

I suggest to either remove the _locked postfix or always add it.

Apart from that I'm not completely happy with the change, but it looks 
like it doesn't add any additional complexity.

Christian.

>   {
> +	lockdep_assert_held(&entity->lock);
> +
>   	if (list_empty(&entity->list))
>   		return;
>   
> @@ -247,7 +245,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   		rq->current_entity = NULL;
>   
>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity);
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	spin_unlock(&rq->lock);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 80198e6cf537..30686961a379 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -591,12 +591,13 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
>   				    struct drm_sched_entity *entity);
>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>   
> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -			     struct drm_sched_entity *entity);
> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
> +				    struct drm_sched_entity *entity);
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +				     struct drm_sched_rq *rq, ktime_t ts);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,

