Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83499C8F4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15B10E433;
	Mon, 14 Oct 2024 11:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="df+0kViE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38DC10E433
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728905583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1dbj9NcsiScbjEZtc1Me2N+RpDJmI0+FG+tkvkntX0=;
 b=df+0kViEr/JwrqyxNvznUOPGcgzkdLOYK1aYFGQ7lrgnSltT+n3E1QY5v1RE0WFUUmtm2t
 lY9otyd3ApwKqL5uOfIdZtvUXOc/MNE8WJqMrbREnV+vbG2CMoxdLq7UfCXHghI4YQB1Wq
 6kdDVJvctv20yu7svbcfJaoGAFhL3mM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-wie-jJFUNpKdAp5nj_TJEg-1; Mon, 14 Oct 2024 07:33:02 -0400
X-MC-Unique: wie-jJFUNpKdAp5nj_TJEg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a9a01cba9f7so85987366b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728905580; x=1729510380;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h1dbj9NcsiScbjEZtc1Me2N+RpDJmI0+FG+tkvkntX0=;
 b=iiAPhKoXKbef5cOSDXPbeyDnr3d36KECMvJ3RVCjVNrhke7XOd89bUr13Vq4s+PXL0
 F3xcY9T7cgGwwfWfpo4ZBi2vgwLHkXuTPiLWNmtxHl+A1X+OF8SukUkFt3FNrVPJc52W
 kPs73FXhK+Ws4NirEwD88a22D4ZvAIAnzLqENicxkkSlvaeuM7r3Pg0ID3rYbDrheOG/
 qcGQqPzMLGEHXV5HdQjLJ/aNvhg7kw+JB0ocoumtfenO+RFzqhX0ny2a23Us5fUKxi68
 Uk5HQ5OIWSdBMfFMWG3UK2McJpdlwQoPfWzvOetpgRpJrtA2sN8ilLv7iR+2ULpDbmTp
 nJUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOXsZr3MMNHkUtrupbd+y7LDL3q18uHxEdVJKIDPJ2bFlIOEXw5o5PagjG7wFnpGkBB6t23Oh0b8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmgXlcFakrR4qMOxf19RMNCQhMwD8INU48eTtFn+4flrac1cDh
 tZdjBkaUE4SG7fz2Pvls0KZyOzX0tzhBS+d+MelkbgoXfeBcvMFl9PxNJIvan1BFT39yuuKr4+Z
 E6xzDzXInI4Y2aJul/ZbEh4JTshlp/uP4PFDhtjT82xL7sXLLxZOycJWwUsdYbcDQ7g==
X-Received: by 2002:a17:907:7ea0:b0:a99:4e35:9a25 with SMTP id
 a640c23a62f3a-a99e3e448b8mr805037166b.44.1728905580412; 
 Mon, 14 Oct 2024 04:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWb+PIO5nAsl2TsLkKHvB0oiHzF3/xlx+xefc+pPLbjkN055KpaS6NSyzNaISQ8Gs2vK0NEA==
X-Received: by 2002:a17:907:7ea0:b0:a99:4e35:9a25 with SMTP id
 a640c23a62f3a-a99e3e448b8mr805034866b.44.1728905580003; 
 Mon, 14 Oct 2024 04:33:00 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3?
 (200116b82d3798001d5778cfc1aeb0b3.dip.versatel-1u1.de.
 [2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80c1b7fsm579085766b.120.2024.10.14.04.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:32:59 -0700 (PDT)
Message-ID: <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Mon, 14 Oct 2024 13:32:57 +0200
In-Reply-To: <20241014104637.83209-2-tursulin@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
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

On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> In FIFO mode We can avoid dropping the lock only to immediately re-
> acquire
> by adding a new drm_sched_rq_update_fifo_locked() helper.
>=20

Please write detailed commit messages, as described here [1].
   1. Describe the problem: current state and why it's bad.
   2. Then, describe in imperative (present tense) form what the commit
      does about the problem.

Optionally, in between can be information about why it's solved this
way and not another etc.

Applies to the other patches, too.


[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
describe-your-changes

> v2:
> =C2=A0* Remove drm_sched_rq_update_fifo() altogether. (Christian)
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++----
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 6 +++---
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A03 files changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 2951fcc2e6b1..b72cba292839 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -514,8 +514,12 @@ struct drm_sched_job
> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> =C2=A0 struct drm_sched_job *next;
> =C2=A0
> =C2=A0 next =3D to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> - if (next)
> - drm_sched_rq_update_fifo(entity, next->submit_ts);
> + if (next) {
> + spin_lock(&entity->rq_lock);
> + drm_sched_rq_update_fifo_locked(entity,
> + next->submit_ts);
> + spin_unlock(&entity->rq_lock);
> + }
> =C2=A0 }
> =C2=A0
> =C2=A0 /* Jobs and entities might have different lifecycles. Since we're
> @@ -613,10 +617,11 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0 sched =3D rq->sched;
> =C2=A0
> =C2=A0 drm_sched_rq_add_entity(rq, entity);
> - spin_unlock(&entity->rq_lock);
> =C2=A0
> =C2=A0 if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> - drm_sched_rq_update_fifo(entity, submit_ts);
> + drm_sched_rq_update_fifo_locked(entity, submit_ts);
> +
> + spin_unlock(&entity->rq_lock);
> =C2=A0
> =C2=A0 drm_sched_wakeup(sched);
> =C2=A0 }
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index e32b0f7d7e94..bbd1630407e4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -169,14 +169,15 @@ static inline void
> drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
> =C2=A0 }
> =C2=A0}
> =C2=A0
> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> ktime_t ts)
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> *entity, ktime_t ts)

Since you touch function name / signature already, would you mind
writing a small doc string that also mentions the locking requirements
or lack of the same?

> =C2=A0{
> =C2=A0 /*
> =C2=A0 * Both locks need to be grabbed, one to protect from entity->rq
> change
> =C2=A0 * for entity from within concurrent drm_sched_entity_select_rq and
> the
> =C2=A0 * other to update the rb tree structure.
> =C2=A0 */

It seems to me that the comment above is now out of date, no?


Thx for your efforts,
P.

> - spin_lock(&entity->rq_lock);
> + lockdep_assert_held(&entity->rq_lock);
> +
> =C2=A0 spin_lock(&entity->rq->lock);
> =C2=A0
> =C2=A0 drm_sched_rq_remove_fifo_locked(entity);
> @@ -187,7 +188,6 @@ void drm_sched_rq_update_fifo(struct
> drm_sched_entity *entity, ktime_t ts)
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> =C2=A0
> =C2=A0 spin_unlock(&entity->rq->lock);
> - spin_unlock(&entity->rq_lock);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index e9f075f51db3..3658a6cb048e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -593,7 +593,7 @@ void drm_sched_rq_add_entity(struct drm_sched_rq
> *rq,
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0 struct drm_sched_entity *entity);
> =C2=A0
> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> ktime_t ts);
> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> *entity, ktime_t ts);
> =C2=A0
> =C2=A0int drm_sched_entity_init(struct drm_sched_entity *entity,
> =C2=A0 =C2=A0 enum drm_sched_priority priority,

