Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFB972CE3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E8B10E703;
	Tue, 10 Sep 2024 09:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MCPK+NlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0760010E703;
 Tue, 10 Sep 2024 09:08:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so4074146f8f.0; 
 Tue, 10 Sep 2024 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725959285; x=1726564085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZtzKB/i0pcGljqA0CAirV3MNU023tcsYdkJGarjCTZw=;
 b=MCPK+NlP9vIeIuR8jVmcZf27kp/iwMs7mmskhM+Zt6NXH+0sK8tQNuYO6wXtlDBFmV
 lkSB/z9WaB0HDWG0wvR3NdZY9kGDK+A93iQ9gtrxBOPQhRga7TnKrvp2tRh3Hdb13ZMe
 3vV2TW/5vyBxjW2angKU1tV7TUx8QVYZ5414euJl1wb2pYuJMeH7EC8v11mGNEImcRzT
 4UbCPAm0DjDQkExP5CY7xZwJUYehfH89aFPtcLShzOARIn2A4ta+ngrk+Wd9cx9qDRE8
 JXwnFAjr0PK7Poji3qnUyxxi4iO61siUHnc+EVwUYB2dvYdck7PGT9SB0SVemO+vROTC
 VfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725959285; x=1726564085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZtzKB/i0pcGljqA0CAirV3MNU023tcsYdkJGarjCTZw=;
 b=IfHWXR0ThhKL3QZHHlsH1gXHj78/PElDhLFhJ1iF7kolzmYy2SwfSO/xl3zxvfW1ak
 NG6mF2FcY96kaNi98ER02U+jJ36vU5FwswryfwlsnEAoJLjsozAsqpM1r3ti0Ze5Mo8W
 Sq2qvOiYWsRWT8wOATtlYQTO4WRoHSCr9As1SGOjhdxUeUb0avUsDIOygPD9bb4zIa8Q
 nVSGjmEraVZ35CNYa3CSRPaZLq/yoeYbU8M7AImYCBlrnyFAGT+x2ECxz3WRa1TlRCN3
 jHQcH8aWdmi++b23ehw0o8QvHp6elx8xqocyeIecTkKMrPQj1HRG1zq9f8kr2yO5TkCu
 LyaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAbGZp5QYxZ2Zcha0iis76tb3EUFdAoSi7yMWFNDJy36G/Su9hg1G9ZsOGFL4B4y0FrjotES7H@lists.freedesktop.org,
 AJvYcCUmdWlUivLc6mTRyjyhir31oyfRjlfTP26oPsZC7rblBrBh1PxyPc2XDU1n3Kvcu0UaQQ3nM95akInV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGztZfsmBTaFeKzIbHBKCzxdWx8PQIvy1/RUG7bYFPHMBm2mhA
 9XCx2PvQlN+YK8sThIzO53jDca7QSdcaqtkZp2zOkkegayetIJxH
X-Google-Smtp-Source: AGHT+IGNlmxpdxHc9oCz9IK1Bb0/53F+uFVjuke3f36rYpV5lsqxo1VYCtmCyWTPqr3hn+jkNTXbSQ==
X-Received: by 2002:a5d:66d1:0:b0:376:f482:8fdf with SMTP id
 ffacd0b85a97d-3789229b089mr7795241f8f.4.1725959284979; 
 Tue, 10 Sep 2024 02:08:04 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a2a5sm8258602f8f.17.2024.09.10.02.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:08:04 -0700 (PDT)
Message-ID: <cd0dcdf4-a001-4fc3-9803-3e8b85cbc89f@gmail.com>
Date: Tue, 10 Sep 2024 11:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240909171937.51550-9-tursulin@igalia.com>
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

Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Having removed one re-lock cycle on the entity->lock in a patch titled
> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
> larger refactoring we can do the same optimisation on the rq->lock.
> (Currently both drm_sched_rq_add_entity() and
> drm_sched_rq_update_fifo_locked() take and release the same lock.)

I think that goes into the wrong direction.

Probably better to move this here into drm_sched_rq_add_entity():

           if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
              drm_sched_rq_update_fifo_locked(entity, submit_ts);

We can then also drop adding the entity to the rr list when FIFO is in use.

Regards,
Christian.


>
> To achieve this we rename drm_sched_rq_add_entity() to
> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
> held, and also add the same expectation to
> drm_sched_rq_update_fifo_locked().
>
> For more stream-lining we also add the run-queue as an explicit parameter
> to drm_sched_rq_remove_fifo_locked() to avoid both callers and callee
> having to dereference entity->rq.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  7 ++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 41 +++++++++++++-----------
>   include/drm/gpu_scheduler.h              |  7 ++--
>   3 files changed, 31 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index b4c4f9923e0b..2102c726d275 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -614,11 +614,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
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
> index 937e7d1cfc49..1ccd2aed2d32 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -153,41 +153,44 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
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
>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>   {
> +	struct drm_sched_rq *rq;
> +
>   	/*
>   	 * Both locks need to be grabbed, one to protect from entity->rq change
>   	 * for entity from within concurrent drm_sched_entity_select_rq and the
>   	 * other to update the rb tree structure.
>   	 */
>   	spin_lock(&entity->lock);
> -	drm_sched_rq_update_fifo_locked(entity, ts);
> +	rq = entity->rq;
> +	spin_lock(&rq->lock);
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	spin_unlock(&rq->lock);
>   	spin_unlock(&entity->lock);
>   }
>   
> @@ -210,25 +213,23 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
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
> @@ -242,6 +243,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity)
>   {
> +	lockdep_assert_held(&entity->lock);
> +
>   	if (list_empty(&entity->list))
>   		return;
>   
> @@ -254,7 +257,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   		rq->current_entity = NULL;
>   
>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity);
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	spin_unlock(&rq->lock);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5a1e4c803b90..2ad33e2fe2d2 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -591,13 +591,14 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
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
>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +				     struct drm_sched_rq *rq, ktime_t ts);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,

