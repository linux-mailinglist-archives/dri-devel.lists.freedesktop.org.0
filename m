Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A032A96D08C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892910E707;
	Thu,  5 Sep 2024 07:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GaRi9DEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933C210E707
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725521886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kn8kG/4qmeOtF/UtNdRZh0DW3KcAiskygHA+3zG1f6I=;
 b=GaRi9DEZXZmHE+kXvjUcyxzh2+o7yTmE7UxeRE/zKUwV2pi4K0aKCNvxnBWAnL5Bpfcq5X
 zBwB/7E47pUaMULYAWC3gBLkRexjB4ysQwef7eh7UVdnzp8DaR89E8OQraZ1BlsNGWZVYb
 ySn+lFwP0LplUCXCv6fOxJfRlGMrOaU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-jmcTz_o1OzGAlr3FrKjZQQ-1; Thu, 05 Sep 2024 03:38:05 -0400
X-MC-Unique: jmcTz_o1OzGAlr3FrKjZQQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-456916c1889so7408271cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 00:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725521885; x=1726126685;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tQPlr8sUNNPI7lsNhVIiK3zyFyq7qxKHpLTVoZPDjoY=;
 b=E2D5IeWZhFRntTQn/04CL4Wr7zaiq3K2ekrn2sAA7Df5oL1XRTWxFCkf/WGVkBo9s4
 bfyanykMTQ78X1AzLzrnEdb0C6fbMedub5V0oa9gFukeNfMrCU62hl28bDS6fdqt0opK
 HzklEdRCg3hBNYP8ESHCtH7xubI4gmFJ6CMshTEMPzZvKOu7RKWH+WjSNkGZ5MiGD41x
 xczlfKW61DDfcVTCR8JidHHJzmNvbNM3CdJO6O0bbNZfoDvSduvmGB0rNpwXpakY5oHT
 QhSVMoTN+2nevVZ1YI7PrlkVP9aZzZ71y+ATS8ZgRV+bJIoqbBuU5N+JCSEewv5eTNrW
 EyDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZjGOFBD1HW90jiwPFUikwEDhf4F+6Hn8rvsg4IO3r/ug1V2GgudMAQw7JpluCc3qgKZo/fKyPhV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi2pwz19MWqUmGvFD4bOd6ySfMNBRuLMGkE4e8vmeBe2bcPYoX
 JYjDiB4mtHNbE9O0rGKxYIb9D3XS7O2cDw/QBtYo139w/L1DB28sGvw33k8V9tDESEkEMTwwBaq
 oV6nWDJqV89TZg3fNNicT2v1pWqH9ga87WHnywFjotFxA4FTFddvfReVPkIpO+JSLqw==
X-Received: by 2002:a05:6214:54c6:b0:6c3:584c:c4b with SMTP id
 6a1803df08f44-6c3584c2960mr161288196d6.30.1725521885000; 
 Thu, 05 Sep 2024 00:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZTwDclU9sr2qoDoa9l2BVgHPH2YYWQstkUeeVWS4+5rpgfb18cdTFNKgGLPjzRJNAyy1Xqg==
X-Received: by 2002:a05:6214:54c6:b0:6c3:584c:c4b with SMTP id
 6a1803df08f44-6c3584c2960mr161288046d6.30.1725521884501; 
 Thu, 05 Sep 2024 00:38:04 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45801b572besm5131261cf.58.2024.09.05.00.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 00:38:04 -0700 (PDT)
Message-ID: <ccbf75a939b90fe9a41734fab038bc35f0963878.camel@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix teardown leaks with waitqueue
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Danilo
 Krummrich <dakr@redhat.com>
Date: Thu, 05 Sep 2024 09:38:01 +0200
In-Reply-To: <ZtidJ8S9THvzkQ-6@phenom.ffwll.local>
References: <20240903094446.29797-2-pstanner@redhat.com>
 <ZtidJ8S9THvzkQ-6@phenom.ffwll.local>
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

On Wed, 2024-09-04 at 19:47 +0200, Simona Vetter wrote:
> On Tue, Sep 03, 2024 at 11:44:47AM +0200, Philipp Stanner wrote:
> > The GPU scheduler currently does not ensure that its pending_list
> > is
> > empty before performing various other teardown tasks in
> > drm_sched_fini().
> >=20
> > If there are still jobs in the pending_list, this is problematic
> > because
> > after scheduler teardown, no one will call backend_ops.free_job()
> > anymore. This would, consequently, result in memory leaks.
> >=20
> > One way to solves this is to implement a waitqueue that
> > drm_sched_fini()
> > blocks on until the pending_list has become empty.
> >=20
> > Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once
> > the
> > pending_list becomes empty. Wait in drm_sched_fini() for that to
> > happen.
> >=20
> > Suggested-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > Hi all,
> >=20
> > since the scheduler has many stake holders, I want this solution
> > discussed as an RFC first.
> >=20
> > This version here has IMO the advantage (and disadvantage...) that
> > it
> > blocks infinitly if the driver messed up the clean up, so problems
> > might become more visible than the refcount solution I proposed in
> > parallel.
>=20
> Very quick comment because I'm heading out for the r4l conference,
> but
> maybe I can discuss this there with Danilo a bit.
>=20
> Maybe we should do step 0 first, and document the current rules? The
> kerneldoc isn't absolute zero anymore, but it's very, very bare-
> bones.
> Then get that acked and merged, which is a very good way to make sure
> we're actually standing on common ground.

Yes, documentation is definitely also on my TODO list. I wanted to send
out something clarifying the objects' lifetimes (based on Christian's
previous series [1]) quite soon.

>=20
> Then maybe step 0.5 would be to add runtime asserts to enforce the
> rules,
> like if you tear down the scheduler and there's stuff in flight, you
> splat
> on a WARN_ON.
>=20
> With that foundation there should be a lot clearer basis to discuss
> whether there is an issue, and what a better design could look like.

I mean, I'm quite sure that there are teardown issues. But we could
indeed make them visible first through documentation (and a FIXME tag)
and after establishing consensus through merging that go on as you
suggested.

> The
> little pondering I've done I've come up with a few more ideas along
> similar lines.
>=20
> One comment below, kinda unrelated.
>=20
> >=20
> > Cheers,
> > P.
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 40
> > ++++++++++++++++++++++++++
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> > =C2=A02 files changed, 44 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7e90c9f95611..200fa932f289 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -564,6 +564,13 @@ static void drm_sched_job_timedout(struct
> > work_struct *work)
> > =C2=A0=09=09 * is parked at which point it's safe.
> > =C2=A0=09=09 */
> > =C2=A0=09=09list_del_init(&job->list);
> > +
> > +=09=09/*
> > +=09=09 * Inform tasks blocking in drm_sched_fini() that
> > it's now safe to proceed.
> > +=09=09 */
> > +=09=09if (list_empty(&sched->pending_list))
> > +=09=09=09wake_up(&sched->job_list_waitque);
> > +
> > =C2=A0=09=09spin_unlock(&sched->job_list_lock);
> > =C2=A0
> > =C2=A0=09=09status =3D job->sched->ops->timedout_job(job);
> > @@ -584,6 +591,15 @@ static void drm_sched_job_timedout(struct
> > work_struct *work)
> > =C2=A0=09=09drm_sched_start_timeout_unlocked(sched);
> > =C2=A0}
> > =C2=A0
> > +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +=09/*
> > +=09 * For list_empty() to work without a lock.
> > +=09 */
>=20
> So this is pretty far from the gold standard for documenting memory
> barrier semantics in lockless code. Ideally we have a comment for
> both
> sides of the barrier (you always need two, or there's no function
> barrier), pointing at each another, and explaining exactly what's
> being
> synchronized against what and how.
>=20
> I did years ago add a few missing barriers with that approach, see
> b0a5303d4e14 ("drm/sched: Barriers are needed for
> entity->last_scheduled"). Reading that patch again it feels a bit on
> the
> terse side of things (plus I noticed spelling issues now too, oops).

ACK, will do that properly once we role out the actual patch.


P.

>=20
> Cheers, Sima
>=20
> > +=09rmb();
> > +=09return list_empty(&sched->pending_list);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * drm_sched_stop - stop the scheduler
> > =C2=A0 *
> > @@ -659,6 +675,12 @@ void drm_sched_stop(struct drm_gpu_scheduler
> > *sched, struct drm_sched_job *bad)
> > =C2=A0=09=09}
> > =C2=A0=09}
> > =C2=A0
> > +=09/*
> > +=09 * Inform tasks blocking in drm_sched_fini() that it's now
> > safe to proceed.
> > +=09 */
> > +=09if (drm_sched_no_jobs_pending(sched))
> > +=09=09wake_up(&sched->job_list_waitque);
> > +
> > =C2=A0=09/*
> > =C2=A0=09 * Stop pending timer in flight as we rearm it in=C2=A0
> > drm_sched_start. This
> > =C2=A0=09 * avoids the pending timeout work in progress to fire
> > right away after
> > @@ -1085,6 +1107,12 @@ drm_sched_get_finished_job(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=09=09/* remove job from pending_list */
> > =C2=A0=09=09list_del_init(&job->list);
> > =C2=A0
> > +=09=09/*
> > +=09=09 * Inform tasks blocking in drm_sched_fini() that
> > it's now safe to proceed.
> > +=09=09 */
> > +=09=09if (list_empty(&sched->pending_list))
> > +=09=09=09wake_up(&sched->job_list_waitque);
> > +
> > =C2=A0=09=09/* cancel this job's TO timer */
> > =C2=A0=09=09cancel_delayed_work(&sched->work_tdr);
> > =C2=A0=09=09/* make the scheduled timestamp more accurate */
> > @@ -1303,6 +1331,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=09init_waitqueue_head(&sched->job_scheduled);
> > =C2=A0=09INIT_LIST_HEAD(&sched->pending_list);
> > =C2=A0=09spin_lock_init(&sched->job_list_lock);
> > +=09init_waitqueue_head(&sched->job_list_waitque);
> > =C2=A0=09atomic_set(&sched->credit_count, 0);
> > =C2=A0=09INIT_DELAYED_WORK(&sched->work_tdr,
> > drm_sched_job_timedout);
> > =C2=A0=09INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > @@ -1333,12 +1362,23 @@ EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0 * @sched: scheduler instance
> > =C2=A0 *
> > =C2=A0 * Tears down and cleans up the scheduler.
> > + *
> > + * Note that this function blocks until the fences returned by
> > + * backend_ops.run_job() have been signalled.
> > =C2=A0 */
> > =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > =C2=A0{
> > =C2=A0=09struct drm_sched_entity *s_entity;
> > =C2=A0=09int i;
> > =C2=A0
> > +=09/*
> > +=09 * Jobs that have neither been scheduled or which have
> > timed out are
> > +=09 * gone by now, but jobs that have been submitted through
> > +=09 * backend_ops.run_job() and have not yet terminated are
> > still pending.
> > +=09 *
> > +=09 * Wait for the pending_list to become empty to avoid
> > leaking those jobs.
> > +=09 */
> > +=09wait_event(sched->job_list_waitque,
> > drm_sched_no_jobs_pending(sched));
> > =C2=A0=09drm_sched_wqueue_stop(sched);
> > =C2=A0
> > =C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > i++) {
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 5acc64954a88..bff092784405 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -29,6 +29,7 @@
> > =C2=A0#include <linux/completion.h>
> > =C2=A0#include <linux/xarray.h>
> > =C2=A0#include <linux/workqueue.h>
> > +#include <linux/wait.h>
> > =C2=A0
> > =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> > =C2=A0
> > @@ -503,6 +504,8 @@ struct drm_sched_backend_ops {
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 timeout interval is over.
> > =C2=A0 * @pending_list: the list of jobs which are currently in the job
> > queue.
> > =C2=A0 * @job_list_lock: lock to protect the pending_list.
> > + * @job_list_waitque: a waitqueue for drm_sched_fini() to block on
> > until all
> > + *=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending jobs have been finished=
.
> > =C2=A0 * @hang_limit: once the hangs by a job crosses this limit then i=
t
> > is marked
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 guilty and it will no longer be considered for
> > scheduling.
> > =C2=A0 * @score: score to help loadbalancer pick a idle sched
> > @@ -532,6 +535,7 @@ struct drm_gpu_scheduler {
> > =C2=A0=09struct delayed_work=09=09work_tdr;
> > =C2=A0=09struct list_head=09=09pending_list;
> > =C2=A0=09spinlock_t=09=09=09job_list_lock;
> > +=09wait_queue_head_t=09=09job_list_waitque;
> > =C2=A0=09int=09=09=09=09hang_limit;
> > =C2=A0=09atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *score;
> > =C2=A0=09atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 _score;
> > --=20
> > 2.46.0
> >=20
>=20

