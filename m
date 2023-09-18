Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDDD7A4B59
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4E210E03B;
	Mon, 18 Sep 2023 14:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E8810E013
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695049027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjiZHjNcOi9b8p8EQZjOhlKNOs+BaJ+nJLyfKOIspIc=;
 b=PivTDya5Yip4rdxyIjtmuV3djgSOYlyL65lJOO3Agqjh1SvRe+fiAHSezwONHpeAUZ7uHl
 EDS6DnlZjUpilJc4uOaqBCvjlcUXYoNGJBW2uSZU8pQ8EBLNyMizi5S1yUDif/CeNJpejn
 xWliiIhrQChdNMJrzlydFrD0pPXk7WA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-C47fWYHgN9iF7Xd-nt7spA-1; Mon, 18 Sep 2023 10:57:04 -0400
X-MC-Unique: C47fWYHgN9iF7Xd-nt7spA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5009796123dso5508682e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695049022; x=1695653822;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HjiZHjNcOi9b8p8EQZjOhlKNOs+BaJ+nJLyfKOIspIc=;
 b=jTZSLDnuhQVDcD7Qy0PhRYAXUNoQXkbABcjH9qJyqQNAuPAyqGrz65s+Mz0cItI/AS
 fNVLr6eXjnstLG2u8RhrpjnQzRdAiRkZ/McZQ2xqO+PTmIt15oeQXoBfL4W2GJsPGIo7
 8hVnjIBxRrElSDl9Mp/4me5Mv6oQjPQiYpFRtMh+ylxtEOvnhytnxhROwUN3suXwee5m
 hL+60uPCn7UtHfDhc8RobDhfwuyBr79/sAbDl9wJLsfFe0OSFK46KzwMnoJqyF6vBW4d
 b51DHrnpO/BVPD7S4DSwTm3arUbZ1IgIbvtOhDI2VZ13bFl9VlaX62qQM4d6yjxJ5CSh
 d4IA==
X-Gm-Message-State: AOJu0Yxambl9eB9WYdkeV5PmPgTbiylmxHsmPbBn5qqmmdUWpwkb5GXE
 GFqclcRccK0Xu9G0XBTuJVKSix19gROvy4Mv57KAlSTWyqdgqlsMKI6pZvpjjstebQTlcuzP8B3
 xVaFemHHhww63c6SLpcD9tyMv1/q2
X-Received: by 2002:a05:6512:33c8:b0:502:a942:d7a8 with SMTP id
 d8-20020a05651233c800b00502a942d7a8mr9615140lfg.69.1695049022642; 
 Mon, 18 Sep 2023 07:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0e2OQkRtabz0ktmkTqwFeDgkgpJYCTAhcVpKYm6LZ+6QDBalU/W4pJHOFX+dlodepUbIdhw==
X-Received: by 2002:a05:6512:33c8:b0:502:a942:d7a8 with SMTP id
 d8-20020a05651233c800b00502a942d7a8mr9615119lfg.69.1695049022231; 
 Mon, 18 Sep 2023 07:57:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a056402048800b0052ea9ad21bdsm6185834edv.72.2023.09.18.07.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 07:57:01 -0700 (PDT)
Message-ID: <7aced2f9-1db1-8e22-f635-842e300d420c@redhat.com>
Date: Mon, 18 Sep 2023 16:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
 <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
 <ZQB57X3TI2m2cECE@DUT025-TGLU.fm.intel.com>
 <be7fe6bd-0744-b33e-71b0-2c66eaa39382@redhat.com>
 <9bbaa40e-d839-10c6-5a5e-c9cfb36c578f@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <9bbaa40e-d839-10c6-5a5e-c9cfb36c578f@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/18/23 13:03, Christian König wrote:
> Am 16.09.23 um 19:52 schrieb Danilo Krummrich:
>> On 9/12/23 16:47, Matthew Brost wrote:
>>> On Tue, Sep 12, 2023 at 11:57:30AM +0200, Christian König wrote:
>>>> Am 12.09.23 um 04:16 schrieb Matthew Brost:
>>>>> Wait for pending jobs to be complete before signaling queued jobs. This
>>>>> ensures dma-fence signaling order correct and also ensures the entity is
>>>>> not running on the hardware after drm_sched_entity_flush or
>>>>> drm_sched_entity_fini returns.
>>>>
>>>> Entities are *not* supposed to outlive the submissions they carry and we
>>>> absolutely *can't* wait for submissions to finish while killing the entity.
>>>>
>>>> In other words it is perfectly expected that entities doesn't exists any
>>>> more while the submissions they carried are still running on the hardware.
>>>>
>>>> I somehow better need to document how this working and especially why it is
>>>> working like that.
>>>>
>>>> This approach came up like four or five times now and we already applied and
>>>> reverted patches doing this.
>>>>
>>>> For now let's take a look at the source code of drm_sched_entity_kill():
>>>>
>>>>         /* The entity is guaranteed to not be used by the scheduler */
>>>>          prev = rcu_dereference_check(entity->last_scheduled, true);
>>>>          dma_fence_get(prev);
>>>>
>>>>          while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue))))
>>>> {
>>>>                  struct drm_sched_fence *s_fence = job->s_fence;
>>>>
>>>>                  dma_fence_get(&s_fence->finished);
>>>>                  if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
>>>> drm_sched_entity_kill_jobs_cb))
>>>>                          drm_sched_entity_kill_jobs_cb(NULL,
>>>> &job->finish_cb);
>>>>
>>>>                  prev = &s_fence->finished;
>>>>          }
>>>>          dma_fence_put(prev);
>>>>
>>>> This ensures the dma-fence signaling order by delegating signaling of the
>>>> scheduler fences into callbacks.
>>>>
>>>
>>> Thanks for the explaination, this code makes more sense now. Agree this
>>> patch is not correct.
>>>
>>> This patch really is an RFC for something Nouveau needs, I can delete
>>> this patch in the next rev and let Nouveau run with a slightly different
>>> version if needed.
>>
>> Maybe there was a misunderstanding, I do not see any need for this in Nouveau.
>>
>> Instead, what I think we need is a way to wait for the pending_list being empty
>> (meaning all jobs on the pending_list are freed) before we call drm_sched_fini().
>>
>> Currently, if we call drm_sched_fini() there might still be pending jobs on the
>> pending_list (unless the driver implements something driver specific).
>> drm_sched_fini() stops the scheduler work though, hence pending jobs will never be
>> freed up leaking their memory.
>>
>> This might also be true for existing drivers, but since they call drm_sched_fini()
>> from their driver remove callback, this race is extremely unlikely. However, it
>> definitely is an issue for drivers using the single entitiy policy calling
>> drm_sched_fini() from a context where it is much more likely pending jobs still
>> exist.
> 
> Yeah, that's exactly one of the reasons why I want to get away from the idea that the scheduler is necessary for executing the commands.
> 
> What this component should do is to push jobs to the hardware and not overview their execution, that's the job of the driver.

While, generally, I'd agree, I think we can't really get around having something that
frees the job once it's fence got signaled. This "something" could be the driver, but
once it ends up being the same code over and over again for every driver, we're probably
back letting the scheduler do it instead in a common way.

> 
> In other words drivers should be able to call drm_sched_fini() while there are jobs still pending on the hardware.

Unless we have a better idea on how to do this, I'd, as mentioned, suggest to have something
like drm_sched_teardown() and/or drm_sched_teardown_timeout() waiting for pending jobs.

> 
> Also keep in mind that you *can't* wait for all hw operations to finish in your flush or file descriptor close callback or you create un-killable processes.

Right, that's why in Nouveau I try to wait for the channel (ring) being idle and if this didn't
work in a "reasonable" amount of time, I kill the fence context, signalling all fences with an
error code, and wait for the scheduler being idle, which comes down to only wait for all free_job()
callbacks to finish, since all jobs are signaled already.

> 
> Regards,
> Christian.
> 
>>
>>>
>>> Matt
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>>>>    drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
>>>>>    drivers/gpu/drm/scheduler/sched_main.c      | 50 ++++++++++++++++++---
>>>>>    include/drm/gpu_scheduler.h                 | 18 ++++++++
>>>>>    4 files changed, 70 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>> index fb5dad687168..7835c0da65c5 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>> @@ -1873,7 +1873,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
>>>>>        list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>>>            if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
>>>>>                /* remove job from ring_mirror_list */
>>>>> -            list_del_init(&s_job->list);
>>>>> +            drm_sched_remove_pending_job(s_job);
>>>>>                sched->ops->free_job(s_job);
>>>>>                continue;
>>>>>            }
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 1dec97caaba3..37557fbb96d0 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -104,9 +104,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>>        }
>>>>>        init_completion(&entity->entity_idle);
>>>>> +    init_completion(&entity->jobs_done);
>>>>> -    /* We start in an idle state. */
>>>>> +    /* We start in an idle and jobs done state. */
>>>>>        complete_all(&entity->entity_idle);
>>>>> +    complete_all(&entity->jobs_done);
>>>>>        spin_lock_init(&entity->rq_lock);
>>>>>        spsc_queue_init(&entity->job_queue);
>>>>> @@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>>>        /* Make sure this entity is not used by the scheduler at the moment */
>>>>>        wait_for_completion(&entity->entity_idle);
>>>>> +    /* Make sure all pending jobs are done */
>>>>> +    wait_for_completion(&entity->jobs_done);
>>>>> +
>>>>>        /* The entity is guaranteed to not be used by the scheduler */
>>>>>        prev = rcu_dereference_check(entity->last_scheduled, true);
>>>>>        dma_fence_get(prev);
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 689fb6686e01..ed6f5680793a 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_sched_resume_timeout);
>>>>> +/**
>>>>> + * drm_sched_add_pending_job - Add pending job to scheduler
>>>>> + *
>>>>> + * @job: scheduler job to add
>>>>> + * @tail: add to tail of pending list
>>>>> + */
>>>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
>>>>> +{
>>>>> +    struct drm_gpu_scheduler *sched = job->sched;
>>>>> +    struct drm_sched_entity *entity = job->entity;
>>>>> +
>>>>> +    lockdep_assert_held(&sched->job_list_lock);
>>>>> +
>>>>> +    if (tail)
>>>>> +        list_add_tail(&job->list, &sched->pending_list);
>>>>> +    else
>>>>> +        list_add(&job->list, &sched->pending_list);
>>>>> +    if (!entity->pending_job_count++)
>>>>> +        reinit_completion(&entity->jobs_done);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_sched_add_pending_job);
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_remove_pending_job - Remove pending job from` scheduler
>>>>> + *
>>>>> + * @job: scheduler job to remove
>>>>> + */
>>>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job)
>>>>> +{
>>>>> +    struct drm_gpu_scheduler *sched = job->sched;
>>>>> +    struct drm_sched_entity *entity = job->entity;
>>>>> +
>>>>> +    lockdep_assert_held(&sched->job_list_lock);
>>>>> +
>>>>> +    list_del_init(&job->list);
>>>>> +    if (!--entity->pending_job_count)
>>>>> +        complete_all(&entity->jobs_done);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_sched_remove_pending_job);
>>>>> +
>>>>>    static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>>>    {
>>>>>        struct drm_gpu_scheduler *sched = s_job->sched;
>>>>>        spin_lock(&sched->job_list_lock);
>>>>> -    list_add_tail(&s_job->list, &sched->pending_list);
>>>>> +    drm_sched_add_pending_job(s_job, true);
>>>>>        spin_unlock(&sched->job_list_lock);
>>>>>    }
>>>>> @@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>             * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>             * is parked at which point it's safe.
>>>>>             */
>>>>> -        list_del_init(&job->list);
>>>>> +        drm_sched_remove_pending_job(job);
>>>>>            spin_unlock(&sched->job_list_lock);
>>>>>            status = job->sched->ops->timedout_job(job);
>>>>> @@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>             * Add at the head of the queue to reflect it was the earliest
>>>>>             * job extracted.
>>>>>             */
>>>>> -        list_add(&bad->list, &sched->pending_list);
>>>>> +        drm_sched_add_pending_job(bad, false);
>>>>>        /*
>>>>>         * Iterate the job list from later to  earlier one and either deactive
>>>>> @@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>                 * Locking here is for concurrent resume timeout
>>>>>                 */
>>>>>                spin_lock(&sched->job_list_lock);
>>>>> -            list_del_init(&s_job->list);
>>>>> +            drm_sched_remove_pending_job(s_job);
>>>>>                spin_unlock(&sched->job_list_lock);
>>>>>                /*
>>>>> @@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>>            /* remove job from pending_list */
>>>>> -        list_del_init(&job->list);
>>>>> +        drm_sched_remove_pending_job(job);
>>>>>            /* cancel this job's TO timer */
>>>>>            cancel_delayed_work(&sched->work_tdr);
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index b7b818cd81b6..7c628f36fe78 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -233,6 +233,21 @@ struct drm_sched_entity {
>>>>>         */
>>>>>        struct completion        entity_idle;
>>>>> +    /**
>>>>> +     * @pending_job_count:
>>>>> +     *
>>>>> +     * Number of pending jobs.
>>>>> +     */
>>>>> +    unsigned int                    pending_job_count;
>>>>> +
>>>>> +    /**
>>>>> +     * @jobs_done:
>>>>> +     *
>>>>> +     * Signals when entity has no pending jobs, used to sequence entity
>>>>> +     * cleanup in drm_sched_entity_fini().
>>>>> +     */
>>>>> +    struct completion        jobs_done;
>>>>> +
>>>>>        /**
>>>>>         * @oldest_job_waiting:
>>>>>         *
>>>>> @@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
>>>>>    drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>                 unsigned int num_sched_list);
>>>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail);
>>>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job);
>>>>> +
>>>>>    #endif
>>>>
>>
> 

