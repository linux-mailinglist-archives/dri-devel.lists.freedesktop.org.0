Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B19732B5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764FA10E776;
	Tue, 10 Sep 2024 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XWGJS2ed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8A110E776
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725963951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Af91neSnoKeSPTqFdFG3VguB60Fl3nQXSCmBnflb2LA=;
 b=XWGJS2edFvoE2Q5ehNmG22QkBqProgfGggCssWCoNpDTNX1y4vS1Cumtx5iPBchKgn1X2E
 KGmzRc7TNjq5WfSBESDb2Q7rMmgX80oAlQ08VLa09Rb020QzIhlQX2MFUZ82Rqi5qUTaEJ
 e5EeOqBw+2+vJFj8QDygdGCQCaxglkc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-LWZIN1K0PiKJRElzrACj0Q-1; Tue, 10 Sep 2024 06:25:50 -0400
X-MC-Unique: LWZIN1K0PiKJRElzrACj0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374c25d886aso2531447f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 03:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725963949; x=1726568749;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JwZykFWSzOCqgLm6KAJ8UV3K9fw//XrwsPkTnPOteFQ=;
 b=N6np2IEmTDhMyuuiCCZEMOwTDbNnnH9QeNLqF3VeQb/luTN0BZMR2m9/RuJrvtRlQf
 308mGMYQnAo+I9PBiZeWXQEdsIHeZvRMiYIL9k16kUKZPrTuSchAMre57f/thgOPmDJl
 iXEPbcZUz+ob/9r1neMIszXqkBZRtOKAql29oVzVdBk5BNFiuXa4vu74ZUxeM7btPXdk
 JAFr8AGDd+ODO7GDp3F2wTqnw26cf1WleU4cDHqnKmXSnfB4RB2qMt/ZODVQM8sSCnFF
 QGl0DhY7Fcgjw5y/JkU+Wna7f0oIa6uZs+LvGy8AojOOLC71K19q7o8/l8jOkMHZOggT
 0BiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTzyPbCuOk6P9Bgw+mhPaYpJt2bhQlQfR2vI7EQCgx1EDWaHhu91UynNoZgxUUDrxvPtA2CwrKmao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6irAPFkaxvApSdTJuH3MAAIx9+UXFr7RPKV0E0hLIVTcASBpH
 RJLS7GYx2fBCW6tTA5Xda4jfq+Xid/PyVDU/NFqVoDyTXBDizpPC/npCxsTFC4jGBDE9VW38HE8
 CE5NefHmWdP83mF/iWr98j4fy6M+RlUWVEhONub4IPtstPF5pwZmZR3mHNqFC+C0vsQ==
X-Received: by 2002:adf:fac4:0:b0:374:c287:2af9 with SMTP id
 ffacd0b85a97d-3788967a59dmr8317889f8f.46.1725963949335; 
 Tue, 10 Sep 2024 03:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbNeFlPBtk5q1x1bSfmPvw9Kg9+MaGUs+PJkEOcDsAAn5oDcb6wiIr6Svwyf9+i9EJWQDXAQ==
X-Received: by 2002:adf:fac4:0:b0:374:c287:2af9 with SMTP id
 ffacd0b85a97d-3788967a59dmr8317866f8f.46.1725963948775; 
 Tue, 10 Sep 2024 03:25:48 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dba:4b00:6ba1:ad1b:2dfb:e2a2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a1absm8615889f8f.1.2024.09.10.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 03:25:48 -0700 (PDT)
Message-ID: <5be10361b0b77f2eaf54c52367b5c4e3934443ab.camel@redhat.com>
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Tue, 10 Sep 2024 12:25:47 +0200
In-Reply-To: <20240909171937.51550-9-tursulin@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
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

On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Having removed one re-lock cycle on the entity->lock in a patch
> titled
> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
> larger refactoring we can do the same optimisation on the rq->lock
> (Currently both drm_sched_rq_add_entity() and
> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>=20
> To achieve this we rename drm_sched_rq_add_entity() to
> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
> held, and also add the same expectation to
> drm_sched_rq_update_fifo_locked().
>=20
> For more stream-lining we also add the run-queue as an explicit
> parameter
> to drm_sched_rq_remove_fifo_locked() to avoid both callers and callee
> having to dereference entity->rq.

Why is dereferencing it a problem?

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c |=C2=A0 7 ++--
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 41 +++++++++++=
++---------
> --
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++--
> =C2=A03 files changed, 31 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index b4c4f9923e0b..2102c726d275 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -614,11 +614,14 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09=09sched =3D rq->sched;
> =C2=A0
> =C2=A0=09=09atomic_inc(sched->score);
> -=09=09drm_sched_rq_add_entity(rq, entity);
> +
> +=09=09spin_lock(&rq->lock);
> +=09=09drm_sched_rq_add_entity_locked(rq, entity);
> =C2=A0
> =C2=A0=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -=09=09=09drm_sched_rq_update_fifo_locked(entity,
> submit_ts);
> +=09=09=09drm_sched_rq_update_fifo_locked(entity, rq,
> submit_ts);
> =C2=A0
> +=09=09spin_unlock(&rq->lock);
> =C2=A0=09=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09=09drm_sched_wakeup(sched, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 937e7d1cfc49..1ccd2aed2d32 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -153,41 +153,44 @@ static __always_inline bool
> drm_sched_entity_compare_before(struct rb_node *a,
> =C2=A0=09return ktime_before(ent_a->oldest_job_waiting, ent_b-
> >oldest_job_waiting);
> =C2=A0}
> =C2=A0
> -static inline void drm_sched_rq_remove_fifo_locked(struct
> drm_sched_entity *entity)
> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity
> *entity,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)

So here we'd add a new function parameter that still doesn't allow for
getting rid of 'entity' as a parameter.

The API gets larger that way and readers will immediately wonder why
sth is passed as a separate variable that could also be obtained
through the pointer.

> =C2=A0{
> -=09struct drm_sched_rq *rq =3D entity->rq;
> -
> =C2=A0=09if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> =C2=A0=09=09rb_erase_cached(&entity->rb_tree_node, &rq-
> >rb_tree_root);
> =C2=A0=09=09RB_CLEAR_NODE(&entity->rb_tree_node);
> =C2=A0=09}
> =C2=A0}
> =C2=A0
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> *entity, ktime_t ts)
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> *entity,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t ts)

The function is still called _locked. That implies to the reader that
this function takes care of locking. But it doesn't anymore. Instead,

> =C2=A0{
> =C2=A0=09lockdep_assert_held(&entity->lock);
> +=09lockdep_assert_held(&rq->lock);
> =C2=A0
> -=09spin_lock(&entity->rq->lock);
> -
> -=09drm_sched_rq_remove_fifo_locked(entity);
> +=09drm_sched_rq_remove_fifo_locked(entity, rq);
> =C2=A0
> =C2=A0=09entity->oldest_job_waiting =3D ts;
> =C2=A0
> -=09rb_add_cached(&entity->rb_tree_node, &entity->rq-
> >rb_tree_root,
> +=09rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_befor=
e);
> -
> -=09spin_unlock(&entity->rq->lock);
> =C2=A0}
> =C2=A0
> =C2=A0void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> ktime_t ts)
> =C2=A0{
> +=09struct drm_sched_rq *rq;
> +
> =C2=A0=09/*
> =C2=A0=09 * Both locks need to be grabbed, one to protect from
> entity->rq change
> =C2=A0=09 * for entity from within concurrent
> drm_sched_entity_select_rq and the
> =C2=A0=09 * other to update the rb tree structure.
> =C2=A0=09 */
> =C2=A0=09spin_lock(&entity->lock);
> -=09drm_sched_rq_update_fifo_locked(entity, ts);
> +=09rq =3D entity->rq;
> +=09spin_lock(&rq->lock);
> +=09drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +=09spin_unlock(&rq->lock);

its caller, drm_sched_rq_update_fifo(), now takes care of the locking.
So if it all drm_sched_rq_update_fifo_locked() should be called
drm_sched_rq_update_fifo_unlocked().

If such a change is really being done, we have to go through the entire
scheduler and make sure that the suffix "_locked" is used consistently
throughout the scheduler. And even better, as consistent with the
kernel as possible.


To be honest folks, I don't think this entire "optimization" patch is
that much of a good idea. The scheduler has real, big problems, such as
race conditions, memory leaks and lack of documentation.

I think we should for the forseeable future dedicate our attention
towards solving those problems, instead of optimizing things.
Especially if the optimization might decrease readability as with the
naming here.


P.


> =C2=A0=09spin_unlock(&entity->lock);
> =C2=A0}
> =C2=A0
> @@ -210,25 +213,23 @@ static void drm_sched_rq_init(struct
> drm_gpu_scheduler *sched,
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * drm_sched_rq_add_entity - add an entity
> + * drm_sched_rq_add_entity_locked - add an entity
> =C2=A0 *
> =C2=A0 * @rq: scheduler run queue
> =C2=A0 * @entity: scheduler entity
> =C2=A0 *
> =C2=A0 * Adds a scheduler entity to the run queue.
> =C2=A0 */
> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)
> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)
> =C2=A0{
> +=09lockdep_assert_held(&rq->lock);
> +
> =C2=A0=09if (!list_empty(&entity->list))
> =C2=A0=09=09return;
> =C2=A0
> -=09spin_lock(&rq->lock);
> -
> =C2=A0=09atomic_inc(rq->sched->score);
> =C2=A0=09list_add_tail(&entity->list, &rq->entities);
> -
> -=09spin_unlock(&rq->lock);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -242,6 +243,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq
> *rq,
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0=09=09=09=09struct drm_sched_entity *entity)
> =C2=A0{
> +=09lockdep_assert_held(&entity->lock);
> +
> =C2=A0=09if (list_empty(&entity->list))
> =C2=A0=09=09return;
> =C2=A0
> @@ -254,7 +257,7 @@ void drm_sched_rq_remove_entity(struct
> drm_sched_rq *rq,
> =C2=A0=09=09rq->current_entity =3D NULL;
> =C2=A0
> =C2=A0=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -=09=09drm_sched_rq_remove_fifo_locked(entity);
> +=09=09drm_sched_rq_remove_fifo_locked(entity, rq);
> =C2=A0
> =C2=A0=09spin_unlock(&rq->lock);
> =C2=A0}
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 5a1e4c803b90..2ad33e2fe2d2 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -591,13 +591,14 @@ bool drm_sched_dependency_optimized(struct
> dma_fence* fence,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0 struct drm_sched_entity
> *entity);
> =C2=A0void drm_sched_fault(struct drm_gpu_scheduler *sched);
> =C2=A0
> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity);
> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0 struct drm_sched_entity
> *entity);
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0=09=09=09=09struct drm_sched_entity *entity);
> =C2=A0
> =C2=A0void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> ktime_t ts);
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> *entity, ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> *entity,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> ktime_t ts);
> =C2=A0
> =C2=A0int drm_sched_entity_init(struct drm_sched_entity *entity,
> =C2=A0=09=09=09=C2=A0 enum drm_sched_priority priority,

