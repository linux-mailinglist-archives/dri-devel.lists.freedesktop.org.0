Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532E9A1FE2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DBB10E7E5;
	Thu, 17 Oct 2024 10:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EGhKSI9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896E10E7E5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729160873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tebt7uiQ9k6gjA4Un2SwZ3IBcgSZIZVhJKjyn+xnrL8=;
 b=EGhKSI9q8nXamqks/mwKZi9y4XttFm/NrHGzFQKyDWJTtORlgV4KsZsB6/zB6PbcPTd2Pa
 i9+WwjATPy8V3WmdUXmX4LH3GO0tuemSNr/5NZofqPfxJA+aBso+I5a1NycBw7K7gs4sud
 rNk3cZEBGcnWNh8Fxs1GD0377/N1Pi4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-3F1eENNYO5SQUOsr7_-g5A-1; Thu, 17 Oct 2024 06:27:52 -0400
X-MC-Unique: 3F1eENNYO5SQUOsr7_-g5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4315d98a873so2113865e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729160871; x=1729765671;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=taPEqCRPlji4jboR5825QX2km5EX+9qFg+JbCM/A+a8=;
 b=YeE4vsYPMUtxFrlMMmDkPm/st6y0b5k7XDwrX5Y/3ceLsuWqAwED1swD84RaxXTc/T
 zKcfANkX18WDAfrYBACrY3aNgFGvSv8M+WUikEI0KEEs3lSPVpAfLwDAYpUCpGM37Z9B
 2M5b0m/KRMmGAS3FlZnTzfMSc8ZpLU5nenOeCKbWFuzUqb20dgJKlThXM2N+mSnwyqGj
 sruh9CDIldTxv1m8mJ0AVF9CeltKkP0/oVuPPtutmzkP/O+tDynx1ZBFAijBZ0/yWhWa
 RPvTUoHbutQDZ6iq7MjUbng8e5uggpdMb+MZZwA1FC2OlplAxZ6c+2Jzl+9O3E9jl0Y6
 XEAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9WwszOHsKs8ziX3gY9Ou+dnZE4MNAmgU23ZMz1RXpM8vzviBsfnPyWxxKRMA/cD0nSpsl1qv0yog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3rTX3UkYwF/WYv2Kthz2gNVzT3hPRfKTp3VZWE5NvHLuCgqFr
 iLhVjV01SdsOjofRB3W+04ZpLiLxNT4TMQQ3j9Rz/n4NSDL9K81ikxLa/K0HP8D9zM/QTTQ374w
 Js405ptYW4el0GxrPuFgqgYnutWYw8FvODiN/6gWPY6LmoErfLJZQRpo7fWcmosTsTQ==
X-Received: by 2002:a05:600c:3552:b0:431:5a93:4e3c with SMTP id
 5b1f17b1804b1-4315a93522amr16640335e9.16.1729160871580; 
 Thu, 17 Oct 2024 03:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYOrLKmrJanJl2yz0E0oFd/rJ8qCIuWiY0cjGyTB0R1GhAHe0bUC6RFrLJUZEUoJvhA7qEXQ==
X-Received: by 2002:a05:600c:3552:b0:431:5a93:4e3c with SMTP id
 5b1f17b1804b1-4315a93522amr16640085e9.16.1729160871107; 
 Thu, 17 Oct 2024 03:27:51 -0700 (PDT)
Received: from dhcp-64-113.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c4de0esm21819805e9.38.2024.10.17.03.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 03:27:50 -0700 (PDT)
Message-ID: <d1a85318f0d657b413a6a16ff3e9845e15d4f52b.camel@redhat.com>
Subject: Re: [PATCH 4/5] drm/sched: Re-group and rename the entity run-queue
 lock
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Thu, 17 Oct 2024 12:27:48 +0200
In-Reply-To: <20241016122013.7857-5-tursulin@igalia.com>
References: <20241016122013.7857-1-tursulin@igalia.com>
 <20241016122013.7857-5-tursulin@igalia.com>
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

On Wed, 2024-10-16 at 13:20 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> When writing to a drm_sched_entity's run-queue, writers are protected
> through the lock drm_sched_entity.rq_lock. This naming, however,
> frequently collides with the separate internal lock of struct
> drm_sched_rq, resulting in uses like this:
>=20
> =09spin_lock(&entity->rq_lock);
> =09spin_lock(&entity->rq->lock);
>=20
> Rename drm_sched_entity.rq_lock to improve readability. While at it,
> re-order that struct's members to make it more obvious what the lock
> protects.
>=20
> v2:
> =C2=A0* Rename some rq_lock straddlers in kerneldoc, improve commit text.
> (Philipp)
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 28 ++++++++++++---------=
-
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++++++---------
> =C2=A03 files changed, 26 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index b72cba292839..c013c2b49aa5 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -105,7 +105,7 @@ int drm_sched_entity_init(struct drm_sched_entity
> *entity,
> =C2=A0=09/* We start in an idle state. */
> =C2=A0=09complete_all(&entity->entity_idle);
> =C2=A0
> -=09spin_lock_init(&entity->rq_lock);
> +=09spin_lock_init(&entity->lock);
> =C2=A0=09spsc_queue_init(&entity->job_queue);
> =C2=A0
> =C2=A0=09atomic_set(&entity->fence_seq, 0);
> @@ -133,10 +133,10 @@ void drm_sched_entity_modify_sched(struct
> drm_sched_entity *entity,
> =C2=A0{
> =C2=A0=09WARN_ON(!num_sched_list || !sched_list);
> =C2=A0
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09entity->sched_list =3D sched_list;
> =C2=A0=09entity->num_sched_list =3D num_sched_list;
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> =C2=A0
> @@ -244,10 +244,10 @@ static void drm_sched_entity_kill(struct
> drm_sched_entity *entity)
> =C2=A0=09if (!entity->rq)
> =C2=A0=09=09return;
> =C2=A0
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09entity->stopped =3D true;
> =C2=A0=09drm_sched_rq_remove_entity(entity->rq, entity);
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09/* Make sure this entity is not used by the scheduler at the
> moment */
> =C2=A0=09wait_for_completion(&entity->entity_idle);
> @@ -396,9 +396,9 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
> =C2=A0void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 enum drm_sched_priority priority)
> =C2=A0{
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09entity->priority =3D priority;
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_set_priority);
> =C2=A0
> @@ -515,10 +515,10 @@ struct drm_sched_job
> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> =C2=A0
> =C2=A0=09=09next =3D to_drm_sched_job(spsc_queue_peek(&entity-
> >job_queue));
> =C2=A0=09=09if (next) {
> -=09=09=09spin_lock(&entity->rq_lock);
> +=09=09=09spin_lock(&entity->lock);
> =C2=A0=09=09=09drm_sched_rq_update_fifo_locked(entity,
> =C2=A0=09=09=09=09=09=09=09next-
> >submit_ts);
> -=09=09=09spin_unlock(&entity->rq_lock);
> +=09=09=09spin_unlock(&entity->lock);
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> @@ -559,14 +559,14 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0=09if (fence && !dma_fence_is_signaled(fence))
> =C2=A0=09=09return;
> =C2=A0
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09sched =3D drm_sched_pick_best(entity->sched_list, entity-
> >num_sched_list);
> =C2=A0=09rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
> =C2=A0=09if (rq !=3D entity->rq) {
> =C2=A0=09=09drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0=09=09entity->rq =3D rq;
> =C2=A0=09}
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09if (entity->num_sched_list =3D=3D 1)
> =C2=A0=09=09entity->sched_list =3D NULL;
> @@ -605,9 +605,9 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09=09struct drm_sched_rq *rq;
> =C2=A0
> =C2=A0=09=09/* Add the entity to the run queue */
> -=09=09spin_lock(&entity->rq_lock);
> +=09=09spin_lock(&entity->lock);
> =C2=A0=09=09if (entity->stopped) {
> -=09=09=09spin_unlock(&entity->rq_lock);
> +=09=09=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09=09=09DRM_ERROR("Trying to push to a killed
> entity\n");
> =C2=A0=09=09=09return;
> @@ -621,7 +621,7 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> =C2=A0=09=09=09drm_sched_rq_update_fifo_locked(entity,
> submit_ts);
> =C2=A0
> -=09=09spin_unlock(&entity->rq_lock);
> +=09=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09=09drm_sched_wakeup(sched);
> =C2=A0=09}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 07ee386b8e4b..2670bf9f34b2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -176,7 +176,7 @@ void drm_sched_rq_update_fifo_locked(struct
> drm_sched_entity *entity, ktime_t ts
> =C2=A0=09 * for entity from within concurrent
> drm_sched_entity_select_rq and the
> =C2=A0=09 * other to update the rb tree structure.
> =C2=A0=09 */
> -=09lockdep_assert_held(&entity->rq_lock);
> +=09lockdep_assert_held(&entity->lock);
> =C2=A0
> =C2=A0=09spin_lock(&entity->rq->lock);
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index b6d095074c19..8ef33765b3b8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -96,14 +96,22 @@ struct drm_sched_entity {
> =C2=A0=09 */
> =C2=A0=09struct list_head=09=09list;
> =C2=A0
> +=09/**
> +=09 * @lock:
> +=09 *
> +=09 * Lock protecting the run-queue (@rq) to which this entity
> belongs,
> +=09 * @priority and the list of schedulers (@sched_list,
> @num_sched_list).
> +=09 */
> +=09spinlock_t=09=09=09lock;
> +
> =C2=A0=09/**
> =C2=A0=09 * @rq:
> =C2=A0=09 *
> =C2=A0=09 * Runqueue on which this entity is currently scheduled.
> =C2=A0=09 *
> =C2=A0=09 * FIXME: Locking is very unclear for this. Writers are
> protected by
> -=09 * @rq_lock, but readers are generally lockless and seem to
> just race
> -=09 * with not even a READ_ONCE.
> +=09 * @lock, but readers are generally lockless and seem to
> just race with
> +=09 * not even a READ_ONCE.
> =C2=A0=09 */
> =C2=A0=09struct drm_sched_rq=09=09*rq;
> =C2=A0
> @@ -136,17 +144,10 @@ struct drm_sched_entity {
> =C2=A0=09 * @priority:
> =C2=A0=09 *
> =C2=A0=09 * Priority of the entity. This can be modified by calling
> -=09 * drm_sched_entity_set_priority(). Protected by &rq_lock.
> +=09 * drm_sched_entity_set_priority(). Protected by &lock.

Should be '@lock'.

I fixed it on my branch.

P.

> =C2=A0=09 */
> =C2=A0=09enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 priority;
> =C2=A0
> -=09/**
> -=09 * @rq_lock:
> -=09 *
> -=09 * Lock to modify the runqueue to which this entity belongs.
> -=09 */
> -=09spinlock_t=09=09=09rq_lock;
> -
> =C2=A0=09/**
> =C2=A0=09 * @job_queue: the list of jobs of this entity.
> =C2=A0=09 */

