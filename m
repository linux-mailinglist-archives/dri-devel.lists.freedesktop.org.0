Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5A9D4FC8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16310E99C;
	Thu, 21 Nov 2024 15:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="L7kUzWJu";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="HRe5QYcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A6110E99C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732203030;
 bh=D8U2FOX8OuU/2qTqOHcjCz/
 xm20BwnOCB/PVM6dats4=; b=L7kUzWJuhbTFPJbgliM9B+ClFo+JFgVu4bRSBrGlbc6VLnPosR
 1v1P1AkkM9vIAjtxm7nWYCOSYKOCEv7LKM0LMSi3VR4yyW+Efr3kbZCoJvSeHmDHTgvo4VqV8uc
 PP6HDjieqiqTA6G+8/I5XpZwcjRRBhWZUnFGM3qzk6GVFkcFzO4S8toNsBSkFTxZywcoDpNtP3X
 1QoXdYVQZ/KdlWftbKwgXTXBuUj7edyEj/+HjDI2l3+MofHdlxuEANOp/xueHOfSCAk7UEWmbZq
 78syTO/E6LSyuP04PPa6Q9z8CFv9bZYHUxKmqPxh4gjaurhne/AsKkGuw1oCvMYw4sg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732203030; bh=D8U2FOX8OuU/2qTqOHcjCz/
 xm20BwnOCB/PVM6dats4=; b=HRe5QYcdN9NedXPkDhYc0LjamVzKL0vxaYzq/z8mv+16Nmep5h
 UCrd/MO5jU2RvSXxTIx/OjW0QFzOSfQt0jBQ==;
Message-ID: <43142c0e-d207-4499-ba2e-a35098f6877e@damsy.net>
Date: Thu, 21 Nov 2024 16:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/sched: cleanup gpu_scheduler trace events
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 steven.price@arm.com, mwen@igalia.com, mcanal@igalia.com,
 thomas.hellstrom@linux.intel.com
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
 <2fd4c566-0668-47c1-a9ba-0e76dde567e0@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <2fd4c566-0668-47c1-a9ba-0e76dde567e0@igalia.com>
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



Le 14/11/2024 à 12:50, Tvrtko Ursulin a écrit :
> 
> On 14/11/2024 10:01, Pierre-Eric Pelloux-Prayer wrote:
>> A fence uniquely identify a job, so this commits updates the places
>> where a kernel pointer was used as an identifier by:
>>
>>     "fence=(context:%llu, seqno:%lld)"
> 
> Any special reason for %lld? Planning to use like -1 for unknown or something?
>

Indeed, %llu is better.


> Btw in i915 we use fence=%llu:%llu which is more compact and IMO still readable so perhaps something 
> to consider.

I'll switch to "fence=%llu:%llu" unless others have concerns.

Thanks,
Pierre-Eric

> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 39 +++++++++++--------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/ 
>> gpu_scheduler_trace.h
>> index c4ec28540656..24358c4d5bbe 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>           TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>>           TP_ARGS(sched_job, entity),
>>           TP_STRUCT__entry(
>> -                 __field(struct drm_sched_entity *, entity)
>> -                 __field(struct dma_fence *, fence)
>>                    __string(name, sched_job->sched->name)
>>                    __field(uint64_t, id)
>>                    __field(u32, job_count)
>>                    __field(int, hw_job_count)
>>                    __string(dev, dev_name(sched_job->sched->dev))
>> +                 __field(uint64_t, fence_context)
>> +                 __field(uint64_t, fence_seqno)
>>                    ),
>>           TP_fast_assign(
>> -               __entry->entity = entity;
>>                  __entry->id = sched_job->id;
>> -               __entry->fence = &sched_job->s_fence->finished;
>>                  __assign_str(name);
>>                  __entry->job_count = spsc_queue_count(&entity->job_queue);
>>                  __entry->hw_job_count = atomic_read(
>>                      &sched_job->sched->credit_count);
>>                  __assign_str(dev);
>> +               __entry->fence_context = sched_job->s_fence->finished.context;
>> +               __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>> +
>>                  ),
>> -        TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>> -              __get_str(dev), __entry->entity, __entry->id,
>> -              __entry->fence, __get_str(name),
>> +        TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw 
>> job count:%d",
>> +              __get_str(dev), __entry->id,
>> +              __entry->fence_context, __entry->fence_seqno, __get_str(name),
>>                 __entry->job_count, __entry->hw_job_count)
>>   );
>> @@ -75,37 +76,41 @@ TRACE_EVENT(drm_sched_process_job,
>>           TP_PROTO(struct drm_sched_fence *fence),
>>           TP_ARGS(fence),
>>           TP_STRUCT__entry(
>> -            __field(struct dma_fence *, fence)
>> +            __field(uint64_t, fence_context)
>> +            __field(uint64_t, fence_seqno)
>>               ),
>>           TP_fast_assign(
>> -            __entry->fence = &fence->finished;
>> +            __entry->fence_context = fence->finished.context;
>> +            __entry->fence_seqno = fence->finished.seqno;
>>               ),
>> -        TP_printk("fence=%p signaled", __entry->fence)
>> +        TP_printk("fence=(context:%llu, seqno:%lld) signaled",
>> +              __entry->fence_context, __entry->fence_seqno)
>>   );
>>   TRACE_EVENT(drm_sched_job_wait_dep,
>>           TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
>>           TP_ARGS(sched_job, fence),
>>           TP_STRUCT__entry(
>> -                 __string(name, sched_job->sched->name)
>> +                 __field(uint64_t, fence_context)
>> +                 __field(uint64_t, fence_seqno)
>>                    __field(uint64_t, id)
>>                    __field(struct dma_fence *, fence)
>>                    __field(uint64_t, ctx)
>> -                 __field(unsigned, seqno)
>> +                 __field(uint64_t, seqno)
>>                    ),
>>           TP_fast_assign(
>> -               __assign_str(name);
>> +               __entry->fence_context = sched_job->s_fence->finished.context;
>> +               __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>>                  __entry->id = sched_job->id;
>>                  __entry->fence = fence;
>>                  __entry->ctx = fence->context;
>>                  __entry->seqno = fence->seqno;
>>                  ),
>> -        TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
>> -              __get_str(name), __entry->id,
>> -              __entry->fence, __entry->ctx,
>> -              __entry->seqno)
>> +        TP_printk("fence=(context:%llu, seqno:%lld), id=%llu, dependencies:{(context:%llu, seqno: 
>> %lld)}",
>> +              __entry->fence_context, __entry->fence_seqno, __entry->id,
>> +              __entry->ctx, __entry->seqno)
>>   );
>>   #endif
