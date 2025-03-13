Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F34A5F048
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C3510E072;
	Thu, 13 Mar 2025 10:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Ox0k6OUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C89110E839
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:08:32 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so592026f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1741860511; x=1742465311;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7kE3JcUtYSd0GRSzqpPo//q/5qu2KjWxCoyea7D1jEY=;
 b=Ox0k6OUJOYfq8VF2p2Y+jcfDfu/tacxFtyBHD77DHS1toeA88Fp5HuvMLmE6kIh38e
 fcNWAny5Mkifyq+3wCVUqB4LZ4hAmtdiX/HN8FrDZ29PkTXY7q5R1Q5cYCzo6T4/Av8j
 8Hsg1wKcb5qKCMXm90xB68YAbsQ0Dmyb9A3SfLXFoByHZpq5gvdRAyRU0KrfA1Wl0+MD
 yagjYTzffsV+GYxf37mCRzJiPKNrN7RvCdu8RQr3Q8Ct1oVfTuTmHetScXgUBnu8/u0/
 wq1lyPmrjilfcpCvIidWOtTgt+4gVarb70SUPPi3pCKuag4ylIm2vqD8K0zUaxwwNNAR
 e7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741860511; x=1742465311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7kE3JcUtYSd0GRSzqpPo//q/5qu2KjWxCoyea7D1jEY=;
 b=DtcQFccZCsGVDSKx33IBAmO3GenClkdeBD5q5JIT5pvS1O416pHTwNIzHfiYXLTRZO
 P2MiBbg+MMBhssuqu4VN/oB01oa+NWimJKIj8RY1RqhVh6DQhAY4dppTFQBAcDDZJuxr
 /xH7xGXdlRQShKzFvi0TzkQcXWaT6c+LusVYwSAasVZHvALnADVLmvZZP+Grqs3iShXA
 oY7+4joMJErbxTFv2qMX79iL2g2HLY8/pdKbuKzTCWplHmbJDecmx+J/OhX9tp2ehI6K
 XjHHQYVSzPu8+wvcCXnf5uq3HTPYBjDR3OFTKYVm5X7M4CMSr/3PYCIhz2EmGNiEyph1
 jeYQ==
X-Gm-Message-State: AOJu0YxVIHx7y/qlbqnIuA1tYARcXYIax3ZhVF7eGl6qgBTzuHCqikB4
 TqzlwNGWPRJQ3e/Qr9GJ7PD54INWM6OQcrTg1rgkRdDAI7tECPOOrabRRLGwuuA=
X-Gm-Gg: ASbGncsQSZuEeg9UiKLkKqdmeU+qcfqslEelyySnU7H+sz8XzknKIuS3XyRH6H9Isek
 6JxEjlB7/nXIz19CGCngJu0iIXEwafzC0kdc6Zq0EkLUjtfCO4UpMZh0xGz1OfomVQ93u2Y3tud
 fumW1He/NoXNBGW2UOAAHMoHCXP+abzba4wawMsruofO+k+wk5nS+WquSYIvyt5IqhqP6ITsvqM
 jzDLcwymhUsfxxjo/jfcpzCdRHygxoEd71GBJh+X7bHqge9pzcv6oR3QOeRzcOw/oMNg0ltBnMz
 epj1bEi8IKEoKpqTQ8pUBb5MuUABMrjHQ2GpLqpNsQjjztHk1jGntEvY78lb
X-Google-Smtp-Source: AGHT+IE3V8y7/n//oMXFoucT31ml+gNQcei6mxWF6KuYlGXfqkkpPJTUNhIKvZMgXcLp83kxfHPbEQ==
X-Received: by 2002:a05:6000:402a:b0:390:e535:8758 with SMTP id
 ffacd0b85a97d-39132d2afc2mr17732820f8f.9.1741860510554; 
 Thu, 13 Mar 2025 03:08:30 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm1565975f8f.47.2025.03.13.03.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 03:08:30 -0700 (PDT)
Message-ID: <945d134f-8790-4aa9-a33f-61aee0ed1a4a@ursulin.net>
Date: Thu, 13 Mar 2025 10:08:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/sched: Fix outdated comments referencing thread
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250305155326.153596-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250305155326.153596-2-phasta@kernel.org>
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


On 05/03/2025 15:53, Philipp Stanner wrote:
> The GPU scheduler's comments refer to a "thread" at various places.
> Those are leftovers from commit a6149f039369 ("drm/sched: Convert drm
> scheduler to use a work queue rather than kthread").
> 
> Replace all references to kthreads.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>    - Speak consistently about work items. (Danilo)
>    - Remove Fixes: tags. (Danilo)
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  8 ++++----
>   drivers/gpu/drm/scheduler/sched_main.c   | 24 +++++++++++++-----------
>   include/drm/gpu_scheduler.h              | 10 +++++-----
>   3 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 87f88259ddf6..f9811420c787 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -538,10 +538,10 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   		return;
>   
>   	/*
> -	 * Only when the queue is empty are we guaranteed that the scheduler
> -	 * thread cannot change ->last_scheduled. To enforce ordering we need
> -	 * a read barrier here. See drm_sched_entity_pop_job() for the other
> -	 * side.
> +	 * Only when the queue is empty are we guaranteed that
> +	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
> +	 * enforce ordering we need a read barrier here. See
> +	 * drm_sched_entity_pop_job() for the other side.
>   	 */
>   	smp_rmb();
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c634993f1346..c97655aa7ab4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -389,7 +389,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
>    *
> - * Finish the job's fence and wake up the worker thread.
> + * Finish the job's fence and resubmit the work items.
>    */
>   static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   {
> @@ -549,9 +549,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   
>   	if (job) {
>   		/*
> -		 * Remove the bad job so it cannot be freed by concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -		 * is parked at which point it's safe.
> +		 * Remove the bad job so it cannot be freed by a concurrent
> +		 * &struct drm_sched_backend_ops.free_job. It will be
> +		 * reinserted after the scheduler's work items have been
> +		 * cancelled, at which point it's safe.
>   		 */
>   		list_del_init(&job->list);
>   		spin_unlock(&sched->job_list_lock);
> @@ -597,10 +598,10 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   
>   	/*
>   	 * Reinsert back the bad job here - now it's safe as
> -	 * drm_sched_get_finished_job cannot race against us and release the
> +	 * drm_sched_get_finished_job() cannot race against us and release the
>   	 * bad job at this point - we parked (waited for) any in progress
> -	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
> -	 * now until the scheduler thread is unparked.
> +	 * (earlier) cleanups and drm_sched_get_finished_job() will not be
> +	 * called now until the scheduler's work items are submitted again.
>   	 */
>   	if (bad && bad->sched == sched)
>   		/*
> @@ -613,7 +614,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   	 * Iterate the job list from later to  earlier one and either deactive
>   	 * their HW callbacks or remove them from pending list if they already
>   	 * signaled.
> -	 * This iteration is thread safe as sched thread is stopped.
> +	 * This iteration is thread safe as the scheduler's work items have been
> +	 * cancelled.
>   	 */
>   	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
>   					 list) {
> @@ -678,9 +680,9 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>   	struct drm_sched_job *s_job, *tmp;
>   
>   	/*
> -	 * Locking the list is not required here as the sched thread is parked
> -	 * so no new jobs are being inserted or removed. Also concurrent
> -	 * GPU recovers can't run in parallel.
> +	 * Locking the list is not required here as the scheduler's work items
> +	 * are currently not running, so no new jobs are being inserted or
> +	 * removed. Also concurrent GPU recovers can't run in parallel.
>   	 */
>   	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>   		struct dma_fence *fence = s_job->s_fence->parent;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 50928a7ae98e..d8bfd46c1117 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -192,7 +192,7 @@ struct drm_sched_entity {
>   	 * @last_scheduled:
>   	 *
>   	 * Points to the finished fence of the last scheduled job. Only written
> -	 * by the scheduler thread, can be accessed locklessly from
> +	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
>   	 * drm_sched_job_arm() if the queue is empty.
>   	 */
>   	struct dma_fence __rcu		*last_scheduled;
> @@ -426,14 +426,14 @@ struct drm_sched_backend_ops {
>   	 * Drivers typically issue a reset to recover from GPU hangs, and this
>   	 * procedure usually follows the following workflow:
>   	 *
> -	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
> -	 *    scheduler thread and cancel the timeout work, guaranteeing that
> -	 *    nothing is queued while we reset the hardware queue
> +	 * 1. Stop the scheduler using drm_sched_stop(). This will cancel the
> +	 *    scheduler's work items, guaranteeing that nothing is queued while
> +	 *    we reset the hardware queue.
>   	 * 2. Try to gracefully stop non-faulty jobs (optional)
>   	 * 3. Issue a GPU reset (driver-specific)
>   	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
>   	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> -	 *    jobs can be queued, and the scheduler thread is unblocked
> +	 *    jobs can be queued, and the scheduler's work items are resubmitted.
>   	 *
>   	 * Note that some GPUs have distinct hardware queues but need to reset
>   	 * the GPU globally, which requires extra synchronization between the

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

