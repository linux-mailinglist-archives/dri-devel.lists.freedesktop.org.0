Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D1979CCF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603410E2F4;
	Mon, 16 Sep 2024 08:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A9wAh9Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B31A10E2F4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726475521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfmZ7r+4kwU9DVbLoOZ4dYqtnh8vMlpqZa7ABre/L54=;
 b=A9wAh9ThSKhGjnuvvc1ctJncrwhWinhKNFGyuZHZMW1fJiLCoqVrSQT6zShG6d5N/4OQFG
 +31HnvIubBvaeGBuLgTB+dpsxv69EYT5nu83X8GPo54iP2jKXfciidxKAIVb92bc9Wn9zA
 BfRRreNOCWgOFjTIVeG9LhLqz5Ab2l8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-QtkaS6XSOxStxA6n_2giSA-1; Mon, 16 Sep 2024 04:31:19 -0400
X-MC-Unique: QtkaS6XSOxStxA6n_2giSA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cb89fbb8cso26899575e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 01:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726475478; x=1727080278;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d0Jt6i7I6Y3nd6kTg5Hxd+Fnuhmk7ooLU20QKU05hWk=;
 b=Ryn9IWwv1FZbmNolAWeJny2Gre0gOkJS/s5bCC0r9rN9pTYSpKe7SZh1qoKo8je5M3
 MyU+FNzRZJSxRHMO+SsfeA0PJklzNKFj+57XXIyzXD5D0/8sCQ70ATrBJD2DD/OQauCo
 3nKbtZTwrzTsmfoZvCH+OAAtI/UcTNSVJoojXBwCa4Rjht2E6clqdfBr6yKmATSWWFHQ
 ViJHQk8UlRYB1lbWu3KMxRD2MDxfc52Faqp/d/kF/csZRUgaWZdsI8KTr4ey+J/2PpA+
 4EiVOan/+4wNUJ7UbSZtCef7XQTPI3J6pheZxFnO2P3yq9TqAD8J0Kz3+UUdcQw3db1t
 3yaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe+oznQ8YTIa8ZxTPCwu5ed6FJY2SDNUpqpyVwRjch25MNiX6sU4t3YGBYz7pVIDTIFnzYy5/6fHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww4rk+7KoBB4ifgw12/XkQq12pxprkqv+WxNh9ddIAg67525qy
 IE6/vzEK5PIrRPbCjuPkTuFttCP6rTKDGTeePhLaDMECiopbuMS+2xtHq6jRtBmOzdUtEcNHQi2
 JbUuCg9+ywf3n2Q+VCI5dWLDDyRexSudmhN7nY9NuFdLenN47eNI5uo2RcVG4/xQI5qnbtsB5ow
 ==
X-Received: by 2002:a05:600c:548e:b0:42c:a802:a8cd with SMTP id
 5b1f17b1804b1-42cdb529fbamr93665265e9.11.1726475477555; 
 Mon, 16 Sep 2024 01:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7UfACTTjv5cjv3Sfxcsvn1GqN39pF9ZHXy2h+z7nZhP7GREPtDEIvyzjWoKu1R41TdIy2qQ==
X-Received: by 2002:a05:600c:548e:b0:42c:a802:a8cd with SMTP id
 5b1f17b1804b1-42cdb529fbamr93664655e9.11.1726475476531; 
 Mon, 16 Sep 2024 01:31:16 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d97:9600:c4de:e8e2:392:1c61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b054fc0sm104983855e9.7.2024.09.16.01.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:31:16 -0700 (PDT)
Message-ID: <1c9cb208dd2ecbbc6b3db44d2d047635c6da1ed5.camel@redhat.com>
Subject: Re: [PATCH] drm/scheduler: correct comments relate to scheduler
From: Philipp Stanner <pstanner@redhat.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, dri-devel@lists.freedesktop.org
Date: Mon, 16 Sep 2024 10:31:15 +0200
In-Reply-To: <20240915155223.2485535-1-shuicheng.lin@intel.com>
References: <20240915155223.2485535-1-shuicheng.lin@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

I would call the commit "drm/scheduler: Improve documentation"

On Sun, 2024-09-15 at 15:52 +0000, Shuicheng Lin wrote:
> function drm_sched_entity_push_job doesn't have return value,

s/function/Function

It's also nice to always terminate a function's name with its
parenthesis: drm_sched_entity_push_job()

> remove the return value description for it.
> Correct several other typo errors.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c |=C2=A0 8 +++-----
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
> =C2=A0include/linux/dma-resv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A04 files changed, 13 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..4d6a05fc35ca 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -51,7 +51,7 @@
> =C2=A0 * drm_sched_entity_set_priority(). For changing the set of
> schedulers
> =C2=A0 * @sched_list at runtime see drm_sched_entity_modify_sched().
> =C2=A0 *
> - * An entity is cleaned up by callind drm_sched_entity_fini(). See
> also
> + * An entity is cleaned up by calling drm_sched_entity_fini(). See
> also
> =C2=A0 * drm_sched_entity_destroy().
> =C2=A0 *
> =C2=A0 * Returns 0 on success or a negative error code on failure.
> @@ -370,7 +370,7 @@ static void drm_sched_entity_clear_dep(struct
> dma_fence *f,
> =C2=A0}
> =C2=A0
> =C2=A0/*
> - * drm_sched_entity_clear_dep - callback to clear the entities
> dependency and
> + * drm_sched_entity_wakeup - callback to clear the entities
> dependency and

While you're at it:

s/entities dependency/entity's dependency

> =C2=A0 * wake up scheduler
> =C2=A0 */
> =C2=A0static void drm_sched_entity_wakeup(struct dma_fence *f,
> @@ -389,7 +389,7 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
> =C2=A0 * @entity: scheduler entity
> =C2=A0 * @priority: scheduler priority
> =C2=A0 *
> - * Update the priority of runqueus used for the entity.
> + * Update the priority of runqueues used for the entity.
> =C2=A0 */
> =C2=A0void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 enum drm_sched_priority priority)
> @@ -574,8 +574,6 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0 * fence sequence number this function should be called with
> drm_sched_job_arm()
> =C2=A0 * under common lock for the struct drm_sched_entity that was set u=
p
> for
> =C2=A0 * @sched_job in drm_sched_job_init().
> - *
> - * Returns 0 for success, negative error code otherwise.
> =C2=A0 */
> =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> =C2=A0{
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index f093616fe53c..6e8c7651bd95 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -41,7 +41,7 @@
> =C2=A0 * 4. Entities themselves maintain a queue of jobs that will be
> scheduled on
> =C2=A0 *=C2=A0=C2=A0=C2=A0 the hardware.
> =C2=A0 *
> - * The jobs in a entity are always scheduled in the order that they
> were pushed.
> + * The jobs in an entity are always scheduled in the order that they
> were pushed.

"in the order in which they were ..."?

> =C2=A0 *
> =C2=A0 * Note that once a job was taken from the entities queue and pushe=
d
> to the
> =C2=A0 * hardware, i.e. the pending queue, the entity must not be
> referenced anymore
> @@ -1340,7 +1340,7 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
> =C2=A0=09=09list_for_each_entry(s_entity, &rq->entities, list)
> =C2=A0=09=09=09/*
> =C2=A0=09=09=09 * Prevents reinsertion and marks job_queue
> as idle,
> -=09=09=09 * it will removed from rq in
> drm_sched_entity_fini
> +=09=09=09 * it will be removed from rq in
> drm_sched_entity_fini

"from the rq"?

s/drm_sched_entity_fini/drm_sched_entity_fini()

> =C2=A0=09=09=09 * eventually
> =C2=A0=09=09=09 */
> =C2=A0=09=09=09s_entity->stopped =3D true;
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index a8d19b10f9b8..9e1b12ca84b9 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -33,11 +33,11 @@
> =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> =C2=A0
> =C2=A0/**
> - * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> + * DRM_SCHED_FENCE_DONT_PIPELINE - Prevent dependency pipelining
> =C2=A0 *
> =C2=A0 * Setting this flag on a scheduler fence prevents pipelining of
> jobs depending
> =C2=A0 * on this fence. In other words we always insert a full CPU round
> trip before
> - * dependen jobs are pushed to the hw queue.
> + * dependent jobs are pushed to the hw queue.
> =C2=A0 */
> =C2=A0#define DRM_SCHED_FENCE_DONT_PIPELINE=09DMA_FENCE_FLAG_USER_BITS
> =C2=A0
> @@ -71,7 +71,7 @@ enum drm_sched_priority {
> =C2=A0=09DRM_SCHED_PRIORITY_COUNT
> =C2=A0};
> =C2=A0
> -/* Used to chose between FIFO and RR jobs scheduling */
> +/* Used to choose between FIFO and RR jobs scheduling */

s/jobs scheduling/job-scheduling

> =C2=A0extern int drm_sched_policy;
> =C2=A0
> =C2=A0#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> @@ -198,7 +198,7 @@ struct drm_sched_entity {
> =C2=A0=09 *
> =C2=A0=09 * Points to the finished fence of the last scheduled job.
> Only written
> =C2=A0=09 * by the scheduler thread, can be accessed locklessly from
> -=09 * drm_sched_job_arm() iff the queue is empty.
> +=09 * drm_sched_job_arm() if the queue is empty.
> =C2=A0=09 */
> =C2=A0=09struct dma_fence __rcu=09=09*last_scheduled;
> =C2=A0
> @@ -247,7 +247,7 @@ struct drm_sched_entity {
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @current_entity: the entity which is to be scheduled.
> - * @rb_tree_root: root of time based priory queue of entities for
> FIFO scheduling
> + * @rb_tree_root: root of time based priority queue of entities for
> FIFO scheduling
> =C2=A0 *
> =C2=A0 * Run queue is a set of entities scheduling command submissions fo=
r
> =C2=A0 * one specific ring. It implements the scheduling policy that
> selects
> @@ -321,7 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> dma_fence *f);
> =C2=A0 * @s_fence: contains the fences for the scheduling of job.
> =C2=A0 * @finish_cb: the callback for the finished fence.
> =C2=A0 * @credits: the number of credits this job contributes to the
> scheduler
> - * @work: Helper to reschdeule job kill to different context.
> + * @work: Helper to reschedule job kill to different context.
> =C2=A0 * @id: a unique id assigned to each job scheduled on the scheduler=
.
> =C2=A0 * @karma: increment on every hang caused by this job. If this
> exceeds the hang
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 limit of the sch=
eduler then the job is marked guilty and
> will not
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 8d0e34dad446..a53a9b802108 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -105,10 +105,10 @@ enum dma_resv_usage {
> =C2=A0=09 * This should be used by submissions which don't want to
> participate in
> =C2=A0=09 * any implicit synchronization.
> =C2=A0=09 *
> -=09 * The most common case are preemption fences, page table
> updates, TLB
> +=09 * The most common cases are preemption fences, page table
> updates, TLB
> =C2=A0=09 * flushes as well as explicit synced user submissions.

Hm, would it make sense here to say "explicitly"?

> =C2=A0=09 *
> -=09 * Explicit synced user user submissions can be promoted to
> +=09 * Explicit synced user submissions can be promoted to

Same here

> =C2=A0=09 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed
> using
> =C2=A0=09 * dma_buf_import_sync_file() when implicit synchronization
> should
> =C2=A0=09 * become necessary after initial adding of the fence.


Thanks,
P.

