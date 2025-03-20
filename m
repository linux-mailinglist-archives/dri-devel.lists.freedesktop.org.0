Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499FCA6A413
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF05B10E5D8;
	Thu, 20 Mar 2025 10:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="UVvv/z5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A923410E5D8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:49:44 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so276368f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1742467783; x=1743072583;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RbL7ptMHboU5raC7wJPf694evtUl0i0LartgtD6KB7M=;
 b=UVvv/z5VK/m5uz1uKGdmpueJmUfgcVauqRFswfs5NF//4iPgUlEzEuYV21oSSYSfCm
 G6n+s2ZMCZ4Q4+Slv9Oj4h/cCpLqv5++oIzNI6AbrmUB52z1NtTweMJZ1FD903i5xm7T
 amSkHusLjQHB5eC2jE7uwew2cnlCpGduy3ShmnCVfsc+ucwzn3fUrhVAQ+ib1hElyLUw
 9fbX24yrm7J6FYPESIOgrPbn/laR8wwW0IIDufT0/SrVWywOeXEDlKDG1DrAqYBlwgWK
 d4nGZzO1O3ZiHlw1sLoc4cyiE57tjbMUXO2Rc5x7Q2mUGsDJ+wd/IlTYOTI/DSJdJ3zG
 sd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742467783; x=1743072583;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RbL7ptMHboU5raC7wJPf694evtUl0i0LartgtD6KB7M=;
 b=fkFlGX+wBrgfIIECnDdkn3+3BeAjgy9zEm/WM1E3cpSqyX/YdkqNsHDbUyiuX9FsXk
 P/CYoeV0HBsJB/wwxClaye4wwa2fUl1/t2n2b3LC/vyKgFPgYxKR0jG3SnkWawrb/CMB
 vF5c8QGjHomKpIyTPZRV3onplmd2uPmiu6fEBuLB1dIsWyrENIkeemccDmnx/B/F1eSu
 K6MTiTgsLLuHHqyegFZpcYLum/XB9O/g3AQzVcTnDqfU4uFWcWeTzTCiZ1JtVuIXyqa/
 EC/W/3SCBxlCHHp3pLltal8h7kUVKnT1/ggG2qNQKkLjUENaWSYuWhuXrGzjKUWPVuJJ
 znsg==
X-Gm-Message-State: AOJu0YylswolYd+V4vXd9RsESHtJYIJZ8ozietx/9TMQYf8bSePss0VX
 QNBM8eHBZ2CYD7rNAl5s8HII0pxA3bciqdBhuzoYor9GE7nJU7tO/Sn+oa73D5k=
X-Gm-Gg: ASbGncuOlZxSP8/J9q+nYLOkqcX/JDVsYpFjhTKlBN8YvnedimveB7nqRzePcmu5KqY
 arTSu1Id/vVMyIBMOWcZQszSKJ3yUrRwnUZ7qf2ICIimDY9xvwbbsCNhjTaGTW5UrKiLcBLY8XJ
 AS+ruQIeF12V7NGzSoJN+cEiW/0WQLQB2rhTBOKYTCs5Dwtnb2kEHVypilzl76SFG20IYyre20k
 sRpUKymSHHrbSPml8sksvA+JVci7+QyYc3IJnIvoghX4nyDIODc6t6NjtNWLsXNe0UKHaSZZc6V
 ZOZhR3fOwpizuc2k8mlbsEcmHcGE54ijf/6wqyWVYXjj/nQXUO3P/sRrX+sZ
X-Google-Smtp-Source: AGHT+IEnd/XYyPpHLCbPZRoXCgp4GXYzB0emXATpl/Q2SPWPwd/46wT5KAZg21WIOJ+niGjQcFthDw==
X-Received: by 2002:a5d:5982:0:b0:399:71d4:a2 with SMTP id
 ffacd0b85a97d-399739c1524mr6566540f8f.14.1742467782662; 
 Thu, 20 Mar 2025 03:49:42 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdafsm23605824f8f.62.2025.03.20.03.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:49:42 -0700 (PDT)
Message-ID: <c6d5c64b-11ea-453a-b7fe-4071dd11d7ea@ursulin.net>
Date: Thu, 20 Mar 2025 10:49:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/10] drm/sched: cleanup event names
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <20250320095818.40622-8-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250320095818.40622-8-pierre-eric.pelloux-prayer@amd.com>
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


On 20/03/2025 09:58, Pierre-Eric Pelloux-Prayer wrote:
> All events now start with the same prefix (drm_sched_job_).
> 
> drm_sched_job_wait_dep was misleading because it wasn't waiting
> at all. It's now replaced by trace_drm_sched_job_unschedulable,
> which is only traced if the job cannot be scheduled.
> For moot dependencies, nothing is traced.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 8 ++++----
>   drivers/gpu/drm/scheduler/sched_entity.c        | 8 ++++----
>   drivers/gpu/drm/scheduler/sched_main.c          | 4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 38cdd659a286..4ce53e493fef 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -63,17 +63,17 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
>   );
>   
> -DEFINE_EVENT(drm_sched_job, drm_sched_job,
> +DEFINE_EVENT(drm_sched_job, drm_sched_job_queue,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>   	    TP_ARGS(sched_job, entity)
>   );
>   
> -DEFINE_EVENT(drm_sched_job, drm_run_job,
> +DEFINE_EVENT(drm_sched_job, drm_sched_job_run,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>   	    TP_ARGS(sched_job, entity)
>   );
>   
> -TRACE_EVENT(drm_sched_process_job,
> +TRACE_EVENT(drm_sched_job_done,
>   	    TP_PROTO(struct drm_sched_fence *fence),
>   	    TP_ARGS(fence),
>   	    TP_STRUCT__entry(
> @@ -112,7 +112,7 @@ TRACE_EVENT(drm_sched_job_add_dep,
>   		  __entry->ctx, __entry->seqno)
>   );
>   
> -TRACE_EVENT(drm_sched_job_wait_dep,
> +TRACE_EVENT(drm_sched_job_unschedulable,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),
>   	    TP_STRUCT__entry(
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 047e42cfb129..0bad247f783e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -470,10 +470,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   
>   	while ((entity->dependency =
>   			drm_sched_job_dependency(sched_job, entity))) {
> -		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
> -
> -		if (drm_sched_entity_add_dependency_cb(entity))
> +		if (drm_sched_entity_add_dependency_cb(entity)) {
> +			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
>   			return NULL;
> +		}
>   	}
>   
>   	/* skip jobs from entity that marked guilty */
> @@ -579,7 +579,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	bool first;
>   	ktime_t submit_ts;
>   
> -	trace_drm_sched_job(sched_job, entity);
> +	trace_drm_sched_job_queue(sched_job, entity);
>   
>   	if (trace_drm_sched_job_add_dep_enabled()) {
>   		struct dma_fence *entry;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 501eae13acb3..85c2111e5500 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -401,7 +401,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   	atomic_sub(s_job->credits, &sched->credit_count);
>   	atomic_dec(sched->score);
>   
> -	trace_drm_sched_process_job(s_fence);
> +	trace_drm_sched_job_done(s_fence);
>   
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence, result);
> @@ -1221,7 +1221,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	atomic_add(sched_job->credits, &sched->credit_count);
>   	drm_sched_job_begin(sched_job);
>   
> -	trace_drm_run_job(sched_job, entity);
> +	trace_drm_sched_job_run(sched_job, entity);
>   	fence = sched->ops->run_job(sched_job);
>   	complete_all(&entity->entity_idle);
>   	drm_sched_fence_scheduled(s_fence, fence);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

