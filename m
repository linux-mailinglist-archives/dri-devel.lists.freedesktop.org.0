Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8BB3C541
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D8C10E219;
	Fri, 29 Aug 2025 22:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VeC96OkG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D5C10E219
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 22:43:42 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e970e624b7cso1537047276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756507421; x=1757112221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udiKLVNkIDA74KaNKsNLED3CYr951WL3Mof5I/6GvIs=;
 b=VeC96OkG6napWV+zHMG2Aw75j11ny9KhYY0jFPyUTdM/MoRleJfmamy6pe6Vu5WZMo
 Z3wNKcjTLcw5c28NP13hmuzop8rZ0ZYFvE350LClReqmvjJkekv1tsy+by+7x9pzqwAY
 Foye2d9OM6vkFxYib78gT8j0GaYtr36BKrxGiwg2cmdapjCdGJSYJFk5cT3wVBIzvYsV
 T4mLwtcWtKViMCYMp0CkZz0iOY1RLm0YTCyf4K0pQPYGu/Z/VAnj/NRmKBF9nUg5JwKl
 KvG2rz24MsCkuWVC41DRvohxFGTr2DD25kloW9AlrGqjIytklGUDEvfaQGJxSDPR76YO
 Z83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756507421; x=1757112221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udiKLVNkIDA74KaNKsNLED3CYr951WL3Mof5I/6GvIs=;
 b=EqI6Zk4yFMiV7/TpQCTmse6/J3n1l3Tpn8ACDshX+ybwoXuCwCbFpVJUnl7VsGhvtr
 6v7flSRanjPzIvM0TqFFJxvaeJWFTsnlJvTmxLY0dmKbve2vQa/96I1WFm+UypSVAV3M
 YonzUj9nNjrvyaqmNvUOmIERzV7mZFS1uS6xDPN+KM1Z3hghiaZ3PldeFAChaLe7ZBDz
 c8Nl1Sms9QDkJ62U/cw9d2joSKA/aCBTZtIBpSsDMHNECdVO0mw3t9Bfk0gf3qGN4MZu
 x6fpPuFoZM5u5CkJNhuEO1j/UDoLh/oKRD69U2eIcButrjk8p8sgWEy1ozkrZkQyMsu/
 oesA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6upCh7uUbOKnL+Kxd94zboWlBwUBNJSn/pxYQaJLnqxsqnVtUhOmTLcg/7KMKT2hRKlEOB+AVA04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDG05i00LnCf/2pd05gOelb1nTv3ilWQsQ3LKTSVgHWV44vEcK
 IAXFmKKX/4gzPsYGJqBAF7OmpTyGs8x52qK/Ap/lG5LS/2SCdM2ji8Cn1pHb4hW+85aCg3mhXbX
 PJOUbAOfDZFW0eIMIQQPkjNPM41Jysko=
X-Gm-Gg: ASbGncuidyCba3kzw/JhV76sIYB9xoQe/6GBW+LV36cAAKL50ea0B6TVN54buLDYAcE
 x1h2KyKylrjzASMyK8sxw2gq60Y1S1fbPNXhQCmnC42OEhvD5oxEeLBYLNvjck4Hmd4waD+z/8D
 k7iA6cdxlGFvX36mcEqfem7S8WO1Dy6jnpynfU7+cBg0L6u35opXeCJwQyFwBGYnVfInThE4BxV
 FkDv9UZ8OdxDjL3UBoy+5tAIjY9zUc494soWZqF
X-Google-Smtp-Source: AGHT+IG7+qrK10j2OniIUuE6HYEwMQmZ44Ww1i+O+Xzn42Xt0t77rSw2hX1Ufver3FsgGcbygrcesYnK1tIHq9EWZxc=
X-Received: by 2002:a05:690c:9308:b0:71b:fdc2:e2f5 with SMTP id
 00721157ae682-72273c07007mr8660787b3.12.1756507421394; Fri, 29 Aug 2025
 15:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250828200532.3534201-1-olvaffe@gmail.com>
 <20250829100021.361578c5@fedora>
In-Reply-To: <20250829100021.361578c5@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 29 Aug 2025 15:43:30 -0700
X-Gm-Features: Ac12FXw_fmpijziG28lSyisZ_EUbaH9OTC2ukYTDG5aMUwFtStQTYxDDoyaJoh8
Message-ID: <CAPaKu7TTwf9F20g3nqOk6Yns7zbgA9kaAonCFZJTko=9p_Q+hw@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: assign unique names to queues
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Aug 29, 2025 at 1:00=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 28 Aug 2025 13:05:32 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > Userspace relies on the ring field of gpu_scheduler tracepoints to
> > identify a drm_gpu_scheduler.  The value of the ring field is taken fro=
m
> > sched->name.
> >
> > Because we typically have multiple schedulers running in parallel in
> > each process, assign unique names to schedulers such that userspace can
> > distinguish them.
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>
> Two minor comments below.
>
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 32 ++++++++++++++++++-------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index ba5dc3e443d9c..26616b6cb110d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -360,6 +360,9 @@ struct panthor_queue {
> >       /** @entity: DRM scheduling entity used for this queue. */
> >       struct drm_sched_entity entity;
> >
> > +     /** @name: DRM scheduler name for this queue. */
> > +     char name[32];
> > +
> >       /**
> >        * @remaining_time: Time remaining before the job timeout expires=
.
> >        *
> > @@ -3308,9 +3311,10 @@ static u32 calc_profiling_ringbuf_num_slots(stru=
ct panthor_device *ptdev,
> >
> >  static struct panthor_queue *
> >  group_create_queue(struct panthor_group *group,
> > -                const struct drm_panthor_queue_create *args)
> > +                const struct drm_panthor_queue_create *args, u32 gid,
> > +                u32 qid)
> >  {
> > -     const struct drm_sched_init_args sched_args =3D {
> > +     struct drm_sched_init_args sched_args =3D {
> >               .ops =3D &panthor_queue_sched_ops,
> >               .submit_wq =3D group->ptdev->scheduler->wq,
> >               .num_rqs =3D 1,
> > @@ -3323,7 +3327,7 @@ group_create_queue(struct panthor_group *group,
> >               .credit_limit =3D args->ringbuf_size / sizeof(u64),
> >               .timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> >               .timeout_wq =3D group->ptdev->reset.wq,
> > -             .name =3D "panthor-queue",
> > +             .name =3D NULL, /* will point to queue->name */
> >               .dev =3D group->ptdev->base.dev,
> >       };
> >       struct drm_gpu_scheduler *drm_sched;
> > @@ -3398,6 +3402,11 @@ group_create_queue(struct panthor_group *group,
> >       if (ret)
> >               goto err_free_queue;
> >
> > +     /* assign a unique name */
> > +     snprintf(queue->name, sizeof(queue->name), "panthor-queue-%d-%d",=
 gid,
> > +              qid);
> > +     sched_args.name =3D queue->name;
>
> Should we plan ahead and have the pid in the name too?
Yes!  I intended for the name to be unique, but incorrectly assumed
that the group pool was global.

Since group pools are per-file, I will include file->client_id in the
names in v2.

>
> > +
> >       ret =3D drm_sched_init(&queue->scheduler, &sched_args);
> >       if (ret)
> >               goto err_free_queue;
> > @@ -3540,12 +3549,18 @@ int panthor_group_create(struct panthor_file *p=
file,
> >       memset(group->syncobjs->kmap, 0,
> >              group_args->queues.count * sizeof(struct panthor_syncobj_6=
4b));
> >
> > +     ret =3D xa_alloc(&gpool->xa, &gid, group,
> > +                    XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
> > +     if (ret)
> > +             goto err_put_group;
> > +
> >       for (i =3D 0; i < group_args->queues.count; i++) {
> > -             group->queues[i] =3D group_create_queue(group, &queue_arg=
s[i]);
> > +             group->queues[i] =3D
> > +                     group_create_queue(group, &queue_args[i], gid, i)=
;
>
> nit: the limit is 100 chars now, so I think we can have it on a single
> line.
>
> >               if (IS_ERR(group->queues[i])) {
> >                       ret =3D PTR_ERR(group->queues[i]);
> >                       group->queues[i] =3D NULL;
> > -                     goto err_put_group;
> > +                     goto err_erase_gid;
> >               }
> >
> >               group->queue_count++;
> > @@ -3553,10 +3568,6 @@ int panthor_group_create(struct panthor_file *pf=
ile,
> >
> >       group->idle_queues =3D GENMASK(group->queue_count - 1, 0);
> >
> > -     ret =3D xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_=
PER_POOL), GFP_KERNEL);
> > -     if (ret)
> > -             goto err_put_group;
> > -
> >       mutex_lock(&sched->reset.lock);
> >       if (atomic_read(&sched->reset.in_progress)) {
> >               panthor_group_stop(group);
> > @@ -3575,6 +3586,9 @@ int panthor_group_create(struct panthor_file *pfi=
le,
> >
> >       return gid;
> >
> > +err_erase_gid:
> > +     xa_erase(&gpool->xa, gid);
> > +
> >  err_put_group:
> >       group_put(group);
> >       return ret;
>
