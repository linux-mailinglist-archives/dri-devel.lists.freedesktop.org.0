Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8073A275DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F353110E34C;
	Tue,  4 Feb 2025 15:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="AFbumQLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA810E34C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:31:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43626213fffso42036215e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738683071; x=1739287871;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YO04QLH+X8zKP3vbuSZ62NP1UERnKX1EVSjge29Xk6E=;
 b=AFbumQLDqd9+r3lE9TZvay9Jwe0KpXuFHDOKsKxeLpR2JiWbc7AWy2DWJcwTMVUcEw
 0TDaiGCrvzmipO+jyJNVQTScmnhrCd7NFFiZDbah485Lm7/wJfFbK9rEGb8iy10CuThs
 Y4OVKDh1rMBz2OHBlH1VeyP+4MA9hLHU+nZnMSTorHyyXFhXmUpxx7i4iRLeFvHGevkF
 qfE4JHM7vuxKgVUtYpHI4TGR/K6mX4u2MgirOTLLaOg9UAunsO+ssvkIPpDSUUO1rExg
 3CUv+Pi2qxkdnxO6GpmZqQZrTNXwOn/mCImE8qoKc/DjVe6aTJFcXv+lQ9npcSig7ntP
 wk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738683071; x=1739287871;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YO04QLH+X8zKP3vbuSZ62NP1UERnKX1EVSjge29Xk6E=;
 b=WeTwbd1rFVK4yRDz/uQNReP8sS/UqD8XaDZT2DV/eGK8CwiuWLL1Sch4/kO/Xvhkgl
 0KkUMUZqWE8ayO9oK6FFhhkI+wDafOIRK3NqsdGBbzAq0N4wcvrsaiBno3nljjVQxG5i
 1eSDfo584wxM5+M77c7+PdhJTvqgDdhGI5oSpGzuz13nUIXsPjiaE5+c+B+AvlEOVoyD
 /qegeVodV0Nkq/S+La5X6e67QUeYpaMfDa5vua3jhjogznG8PAf4qgKHEUlyJQ0JMZiV
 pKIqSARKdxiDYTEFPZqCJVOHOGTDwVyvFKLEooLMbNHaENeHCCMWlM9aF36+rFKGZpLO
 +09w==
X-Gm-Message-State: AOJu0Yy5ReswzG6yQsbQjbagHrhQ52koHgIukyt4IHSzOkrg4AyMWgdL
 49VXQ3AfDWmT7N5KjGO8Al54Un4b39aviQL3CkavS4PS54fP7de1+wYbQSQ+80I=
X-Gm-Gg: ASbGnctvMa5NdT0L8Ehpkm20GbI5rLDiMcVlsm+ij+fTpbPQevZQbFyQBgu7MG/c+Oq
 Dt6aSOC7BmPmT5+f/DCgSnwAZ9Q4SbDtgX3EWlcAzZuWVOTGzE8bSIGWuJnpD4RDzboe744/5x8
 X1kbjPdjTww8yGY8vfCB8foXRT4C/ojhDbWQ/s4Ov8JrRlfsnDLT6Shs1nN6kcgx7EnRq6z8+3m
 h8Bhum7H/msxdZLnOMiN1FO7I7gMBfVgrOW7d7RbaFm77QtHYepEsAlza0qbDhzlBU5hct324cK
 msfNnXmc64cZ6X0qyiEKHUEZrh/k/kw=
X-Google-Smtp-Source: AGHT+IGyCOrMOzLOqDd5nklSWFy5dFMUUbqMYwM7tDC92GnRTMCdM70CAqKld747kDZSUFBqJ1B0DA==
X-Received: by 2002:a05:600c:3ac4:b0:436:185f:dfae with SMTP id
 5b1f17b1804b1-43905f6ab6amr24808885e9.6.1738683069360; 
 Tue, 04 Feb 2025 07:31:09 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de772sm191993285e9.13.2025.02.04.07.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:31:08 -0800 (PST)
Message-ID: <bfc03583-03b8-4fc4-98f8-3d6c7c9f95fc@ursulin.net>
Date: Tue, 4 Feb 2025 15:31:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] drm/sched: trace dependencies for gpu jobs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
 <20250131110328.706695-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250131110328.706695-6-pierre-eric.pelloux-prayer@amd.com>
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


On 31/01/2025 11:03, Pierre-Eric Pelloux-Prayer wrote:
> Trace the fence dependencies similarly to how we print fences:
> 
>   ... , dependencies:{fence=606:38006}
> 
> This allows tools to analyze the dependencies between the jobs (previously
> it was only possible for fences traced by drm_sched_job_wait_dep).
> 
> Since drm_sched_job and drm_run_job use the same base event class,
> the caller of trace_drm_run_job have to pass a dep_count of 0 (which
> is ignored because dependencies are only considered at submit time).
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 59 ++++++++++++++++---
>   drivers/gpu/drm/scheduler/sched_entity.c      |  8 ++-
>   drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
>   3 files changed, 58 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 3cdd8d8f8021..ca19cd9a146a 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -26,15 +26,41 @@
>   
>   #include <linux/stringify.h>
>   #include <linux/types.h>
> +#include <linux/trace_seq.h>
>   #include <linux/tracepoint.h>
>   
>   #undef TRACE_SYSTEM
>   #define TRACE_SYSTEM gpu_scheduler
>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>   
> +#ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> +#define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> +/* Similar to trace_print_array_seq but for fences. */
> +static inline const char *__print_dma_fence_array(struct trace_seq *p, const void *buf, int count)
> +{
> +	const char *ret = trace_seq_buffer_ptr(p);
> +	u64 *fences = (u64 *) buf;
> +	const char *prefix = "";
> +
> +	trace_seq_putc(p, '{');
> +	for (int i = 0; i < count; i++) {
> +		u64 context = fences[2 * i], seqno = fences[2 * i + 1];
> +
> +		trace_seq_printf(p, "%sfence=%llu:%llu",
> +				 prefix, context, seqno);
> +		prefix = ",";
> +	}
> +	trace_seq_putc(p, '}');
> +	trace_seq_putc(p, 0);
> +
> +	return ret;
> +}
> +#endif
> +
>   DECLARE_EVENT_CLASS(drm_sched_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity),
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, dep_count),
>   	    TP_STRUCT__entry(
>   			     __field(uint64_t, id)
>   			     __string(name, sched_job->sched->name)
> @@ -43,9 +69,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			     __string(dev, dev_name(sched_job->sched->dev))
>   			     __field(uint64_t, fence_context)
>   			     __field(uint64_t, fence_seqno)
> +			     __field(int, n_deps)
> +			     __dynamic_array(u64, deps, dep_count * 2)
>   			     ),
>   
>   	    TP_fast_assign(
> +			   unsigned long idx;
> +			   struct dma_fence *fence;
> +			   u64 *dyn_arr;
>   			   __entry->id = sched_job->id;
>   			   __assign_str(name);
>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
> @@ -54,22 +85,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			   __assign_str(dev);
>   			   __entry->fence_context = sched_job->s_fence->finished.context;
>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -
> +			   __entry->n_deps = dep_count;
> +			   if (dep_count) {
> +				dyn_arr = __get_dynamic_array(deps);
> +				xa_for_each(&sched_job->dependencies, idx, fence) {
> +					dyn_arr[2 * idx] = fence->context;
> +					dyn_arr[2 * idx + 1] = fence->seqno;
> +				}
> +			   }
>   			   ),
> -	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
> +	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, dependencies:%s",
>   		      __get_str(dev), __entry->id,
>   		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
> -		      __entry->job_count, __entry->hw_job_count)
> +		      __entry->job_count, __entry->hw_job_count,
> +		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps))
>   );
>   
>   DEFINE_EVENT(drm_sched_job, drm_sched_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity)
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
> +		     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, dep_count)
>   );
>   
>   DEFINE_EVENT(drm_sched_job, drm_run_job,
> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity)
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
> +	    	     unsigned int dep_count),
> +	    TP_ARGS(sched_job, entity, 0)
>   );
>   
>   TRACE_EVENT(drm_sched_process_job,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 69bcf0e99d57..0ce3a82fe6fd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -592,7 +592,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	bool first;
>   	ktime_t submit_ts;
>   
> -	trace_drm_sched_job(sched_job, entity);
> +	if (trace_drm_sched_job_enabled()) {
> +		unsigned long index, n = 0;
> +		void *f;
> +
> +		xa_for_each(&sched_job->dependencies, index, f) { n++; }
> +		trace_drm_sched_job(sched_job, entity, n);
> +	}
I wonder if it would be good enough to simply trace dependencies one by 
one in drm_sched_job_add_dependency and drop all the array magic/support 
code?

In which case that was the drm_sched_job_depdency tracepoint I hinted in 
my reply to 4/7.

I know you are at v7 but as we are going towards the stable ABI route I 
am thinking it is worth discussing this option.

We could even leave the separate "wait dep" vs "add dep" and have a set 
like:

drm_sched_job_add_dependency
drm_sched_job_queue
drm_sched_job_wait_dependency
drm_sched_job_run
drm_sched_job_done

By tracing them one by one we remove the complications from the kernel 
side and let the userspace parse multiple lines. Shouldn't be a problem 
for there.

Regards,

Tvrtko

>   	atomic_inc(entity->rq->sched->score);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ad306d3d7282..c645f07ebe26 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1214,7 +1214,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	atomic_add(sched_job->credits, &sched->credit_count);
>   	drm_sched_job_begin(sched_job);
>   
> -	trace_drm_run_job(sched_job, entity);
> +	trace_drm_run_job(sched_job, entity, 0);
>   	fence = sched->ops->run_job(sched_job);
>   	complete_all(&entity->entity_idle);
>   	drm_sched_fence_scheduled(s_fence, fence);
