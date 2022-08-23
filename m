Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C3259DB1C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 14:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698C814A435;
	Tue, 23 Aug 2022 12:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFAB10E6AF;
 Tue, 23 Aug 2022 12:15:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id d21so7690087eje.3;
 Tue, 23 Aug 2022 05:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xK7ohMnfCenxta6mji2jwemk2kn8T/cd3bcIEPTsRFs=;
 b=c4i8nHpAIHqE24Ql9b5+hwe8tiX4K4NLHL1y2a1+56sEWc5Yvqx1w1h2MfOuX376q+
 Pco7XEBwcTowHfe0HgV/SWrcl2n7gNfNyLlxI9fvmqBeG4BOG0bTb/ROJ/WJtTOocXrn
 7SN9rxwS7fWrF22oHkiGChB39J9iz6D4bcZnvAHlCEz5yGpSM3ZAcESvhCTyEZXCEpNQ
 hXuKyGeBF8HE/9Ne6QZfPv8f8ua1YhGoa6TJCC7+7uNcP2urNB8pNY0sTw20euyCV3G5
 K34N20LuV70UNNFQ2tshp51LSg2kWf3ss3t66KiS9AFkBbDzgMO2a+C0BgH3Olo4UeGs
 UFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xK7ohMnfCenxta6mji2jwemk2kn8T/cd3bcIEPTsRFs=;
 b=mocDDjeHJbmUsPACVoXu+oxC+uNfHcZoZ7i57G9xmXIYOOWdkrgTZi4ME7Cx3oml6f
 8qgza+wyrBWIdRmyO3EIwaFBMKkRroWH08pJhVZ68Np1FmeUsOleLcHrxEN3Wd6+5ci2
 EN3FY/iMnqGX+8ZTkpnP/lxnsUgBsG1gRpeTOVhPGO5/5prNZEpv1Iz4AkhArXa4T68t
 Cm6e11d0eK3HxUM1TDj7yfBvpuGjManabPpTKlf+0Hb37k3QDedcPw4wPD7PvhJBhYeT
 rCea7Qe42idlzjFGyuTQH21i03uV17LBqVgpvV6Qix/sjxog7BrLopdHZ2Y5IEHi3zYH
 4evg==
X-Gm-Message-State: ACgBeo2vgQgpPF8moByupRNsL2PBmK7bgrP5dKzU1bwa89VwVl5qY9F3
 jhEV7R5x8hrP+ZHbazTt8tQ=
X-Google-Smtp-Source: AA6agR4u0/RgTshl0joLSVh9+snIl2D4zRGhmBa55w1NAWT12bsPsh7f7Vf8OJMcjKwQbMWD3awX4Q==
X-Received: by 2002:a17:907:3f9d:b0:73d:a90f:197d with SMTP id
 hr29-20020a1709073f9d00b0073da90f197dmr620058ejc.460.1661256917676; 
 Tue, 23 Aug 2022 05:15:17 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ad4.dip0.t-ipconnect.de.
 [79.194.10.212]) by smtp.gmail.com with ESMTPSA id
 n1-20020a1709061d0100b0073d6093ac93sm5025243ejh.16.2022.08.23.05.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 05:15:16 -0700 (PDT)
Message-ID: <ae6aa412-326c-46e3-4cde-8870ded748b8@gmail.com>
Date: Tue, 23 Aug 2022 14:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
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
Cc: Li Yunxiang <Yunxiang.Li@amd.com>, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.08.22 um 22:09 schrieb Andrey Grodzovsky:
> Poblem: Given many entities competing for same rq on
> same scheduler an uncceptabliy long wait time for some
> jobs waiting stuck in rq before being picked up are
> observed (seen using  GPUVis).
> The issue is due to Round Robin policy used by scheduler
> to pick up the next entity for execution. Under stress
> of many entities and long job queus within entity some
> jobs could be stack for very long time in it's entity's
> queue before being popped from the queue and executed
> while for other entites with samller job queues a job
> might execute ealier even though that job arrived later
> then the job in the long queue.
>
> Fix:
> Add FIFO selection policy to entites in RQ, chose next enitity
> on rq in such order that if job on one entity arrived
> ealrier then job on another entity the first job will start
> executing ealier regardless of the length of the entity's job
> queue.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>   drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>   include/drm/gpu_scheduler.h              |  8 +++
>   3 files changed, 71 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6b25b2f4f5a3..3bb7f69306ef 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> +	sched_job->submit_ts = ktime_get();
> +
>   
>   	/* first job wakes up scheduler */
>   	if (first) {
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 68317d3a7a27..c123aa120d06 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -59,6 +59,19 @@
>   #define CREATE_TRACE_POINTS
>   #include "gpu_scheduler_trace.h"
>   
> +
> +
> +int drm_sched_policy = -1;
> +
> +/**
> + * DOC: sched_policy (int)
> + * Used to override default entites scheduling policy in a run queue.
> + */
> +MODULE_PARM_DESC(sched_policy,
> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");

Well we don't really have an autodetect at the moment, so I would drop that.

> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +
> +
>   #define to_drm_sched_job(sched_job)		\
>   		container_of((sched_job), struct drm_sched_job, queue_node)
>   
> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   }
>   
>   /**
> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>    *
>    * @rq: scheduler run queue to check.
>    *
> - * Try to find a ready entity, returns NULL if none found.
> + * Try to find a ready entity, in round robin manner.
> + *
> + * Returns NULL if none found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   {
>   	struct drm_sched_entity *entity;
>   
> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>   	return NULL;
>   }
>   
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
> + *
> + * Returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +	struct drm_sched_entity *tmp, *entity = NULL;
> +	ktime_t oldest_ts = KTIME_MAX;
> +	struct drm_sched_job *sched_job;
> +
> +	spin_lock(&rq->lock);
> +
> +	list_for_each_entry(tmp, &rq->entities, list) {
> +
> +		if (drm_sched_entity_is_ready(tmp)) {
> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
> +
> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
> +				oldest_ts = sched_job->submit_ts;
> +				entity = tmp;
> +			}
> +		}
> +	}
> +
> +	if (entity) {
> +		rq->current_entity = entity;
> +		reinit_completion(&entity->entity_idle);
> +	}

That should probably be a separate function or at least outside of this 
here.

Apart from that totally straight forward implementation. Any idea how 
much extra overhead that is?

Regards,
Christian.

> +
> +	spin_unlock(&rq->lock);
> +	return entity;
> +}
> +
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   
>   	/* Kernel run queue has higher priority than normal run queue*/
>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
> +		entity = drm_sched_policy != 1 ?
> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
> +
>   		if (entity)
>   			break;
>   	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..95865881bfcf 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -314,6 +314,14 @@ struct drm_sched_job {
>   
>   	/** @last_dependency: tracks @dependencies as they signal */
>   	unsigned long			last_dependency;
> +
> +       /**
> +	* @submit_ts:
> +	*
> +	* Marks job submit time
> +	*/
> +       ktime_t				submit_ts;
> +
>   };
>   
>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,

