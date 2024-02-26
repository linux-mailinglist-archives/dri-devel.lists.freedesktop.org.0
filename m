Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC0866828
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0079F10ED2B;
	Mon, 26 Feb 2024 02:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hmudsbjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF9A10ED2A;
 Mon, 26 Feb 2024 02:27:33 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so3669422a12.0; 
 Sun, 25 Feb 2024 18:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708914452; x=1709519252; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SJWYCcqgnpqF6Dxnb+Ge90tzni2h/OwaE02TejkxMz0=;
 b=hmudsbjzxSfir0YNbEJcWEGMqBULIDooTZbS4pfrfONDySiN5EitWQ4HAJjbXZ0Ark
 K7CMCg+x8yAAmPn5j2SuVvSC3SNbf/RbG9Zcg64TTseiBsHurVDPVqscYCbwCoPFHCJC
 COkjc1ujoSbwM1Lv+wmiJPV3nDKiF+953nvyV6WmLoHzNyKm/s1/RkEt8ov1fWvo7c2w
 73lhatfchwUiR7pAhwQrPQF2GlasAP6DpYbWmuzKL75STz74/Gx9fbS0I6uvD1C5TpLL
 biMHnkptN505E+QCPKQw/KPTu/4AJQid6yezhFiUYPG1YTlXqTFM6SlUg7rVeldhgo4X
 EfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708914452; x=1709519252;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SJWYCcqgnpqF6Dxnb+Ge90tzni2h/OwaE02TejkxMz0=;
 b=Xj5yhNeI63nbd+7fRfdyFIey9f33blOsVBgvN34i8VRPeQ4U0KUZ62Rh2v6oPqdCTi
 SS7qzCNs1e1jUNqFTKARrhvC2fcRg/znIdrWRJbZk19tT+NG6Fc3efM5QT9wh+V7rAqN
 9z2IYqp4cqBi4p4k8/EaYgbZ2PpIpKbj8TUYU2l6s+0nxT4zuHLQGVkeOj015yWEkQ0Y
 t5niFYpgqwGsqr/rcw8vaLXn5AtdN4BXNQnYqUEWe0DOpPFHgT3TwmjCwDGwYAP3NqEJ
 4qzS8GSIlu8uSbJ6zYe/ZXi2tHNXhm+Hww6AxA76K9L0FqXVVkNor5dpzLpSpvGlTaI4
 zbZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhbk2arBE+bJPn+IKirre1KpVOMjdoDxDYVSj95XA31ByFYQ8PllxqwbVd4NLGFjM1c9horIHJiOZC9Vn+AZCHaZ+K42V4mvQPjZOtHU4K
X-Gm-Message-State: AOJu0YyzQbKccD7ivaW1zWJzDWRWdo/pCo5t630eviR4ignF3gHpf9gr
 ZaswNkwMi915InhEcSBsME82tDZE3DwqMWusdCQYkt2hQx5CCcbZ3aD5ZyTpW75oFnclcFKXw2W
 gxKnAngXm8o/rsXJFVfv8TsS4GiNV5z6FN1w=
X-Google-Smtp-Source: AGHT+IGzapjI6nEpfa1RVs8yy77ySRHS4waGHcE4ObnUQiKjrsmy2r1HNSC76w/DkyYiM6Mj2LYx7mrP/rLRxnNXNss=
X-Received: by 2002:a17:906:4a52:b0:a42:fc5c:16 with SMTP id
 a18-20020a1709064a5200b00a42fc5c0016mr2666648ejv.51.1708914451805; Sun, 25
 Feb 2024 18:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20240222144536.4382-1-dakr@redhat.com>
 <CAPM=9ty7ALfg6-ebdQdjeVdGgm2dVQYE0+yHeJ8+YCsZvAL+1g@mail.gmail.com>
 <ZdjPJ82blpddolwi@cassiopeiae>
In-Reply-To: <ZdjPJ82blpddolwi@cassiopeiae>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 26 Feb 2024 12:27:20 +1000
Message-ID: <CAPM=9tznED8pT-YJHytDBJBpQLHHh0Cq=cO1nWgTcTXgdERwOA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: use dedicated wq for fence uevents work
To: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org, lyude@redhat.com, kherbst@redhat.com, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 24 Feb 2024 at 03:01, Danilo Krummrich <dakr@redhat.com> wrote:
>
> On Fri, Feb 23, 2024 at 10:14:53AM +1000, Dave Airlie wrote:
> > On Fri, 23 Feb 2024 at 00:45, Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > Using the kernel global workqueue to signal fences can lead to
> > > unexpected deadlocks. Some other work (e.g. from a different driver)
> > > could directly or indirectly depend on this fence to be signaled.
> > > However, if the WQ_MAX_ACTIVE limit is reached by waiters, this can
> > > prevent the work signaling the fence from running.
> > >
> > > While this seems fairly unlikely, it's potentially exploitable.
> >
> > LGTM
> >
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> >
> > probably should go into drm-misc-fixes?
>
> Yes, however, 39126abc5e20 went in through drm-fixes directly it seems, since
> it's not in drm-misc-fixes.
>
> Guess you want me to cherry-pick 39126abc5e20 to drm-misc-fixes rather than take
> this one through drm-fixes as well?

Nah don't ever cherry-pick, backmerge would be the correct thing, but
I'll just take it in through drm-fixes.

Dave.

>
> >
> > >
> > > Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to workqueue")
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 +++++++++++--
> > >  drivers/gpu/drm/nouveau/nouveau_drv.h   |  3 +++
> > >  drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
> > >  drivers/gpu/drm/nouveau/nouveau_fence.h |  2 ++
> > >  4 files changed, 18 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index 6f6c31a9937b..6be202081077 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -598,9 +598,15 @@ nouveau_drm_device_init(struct drm_device *dev)
> > >                 goto fail_alloc;
> > >         }
> > >
> > > +       drm->fence_wq = alloc_workqueue("nouveau_fence_wq", 0, WQ_MAX_ACTIVE);
> > > +       if (!drm->fence_wq) {
> > > +               ret = -ENOMEM;
> > > +               goto fail_sched_wq;
> > > +       }
> > > +
> > >         ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
> > >         if (ret)
> > > -               goto fail_wq;
> > > +               goto fail_fence_wq;
> > >
> > >         ret = nouveau_cli_init(drm, "DRM", &drm->client);
> > >         if (ret)
> > > @@ -670,7 +676,9 @@ nouveau_drm_device_init(struct drm_device *dev)
> > >         nouveau_cli_fini(&drm->client);
> > >  fail_master:
> > >         nouveau_cli_fini(&drm->master);
> > > -fail_wq:
> > > +fail_fence_wq:
> > > +       destroy_workqueue(drm->fence_wq);
> > > +fail_sched_wq:
> > >         destroy_workqueue(drm->sched_wq);
> > >  fail_alloc:
> > >         nvif_parent_dtor(&drm->parent);
> > > @@ -725,6 +733,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
> > >
> > >         nouveau_cli_fini(&drm->client);
> > >         nouveau_cli_fini(&drm->master);
> > > +       destroy_workqueue(drm->fence_wq);
> > >         destroy_workqueue(drm->sched_wq);
> > >         nvif_parent_dtor(&drm->parent);
> > >         mutex_destroy(&drm->clients_lock);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > index 8a6d94c8b163..b43619a213a4 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > @@ -261,6 +261,9 @@ struct nouveau_drm {
> > >         /* Workqueue used for channel schedulers. */
> > >         struct workqueue_struct *sched_wq;
> > >
> > > +       /* Workqueue used to signal fences. */
> > > +       struct workqueue_struct *fence_wq;
> > > +
> > >         /* context for accelerated drm-internal operations */
> > >         struct nouveau_channel *cechan;
> > >         struct nouveau_channel *channel;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > index 93f08f9479d8..c3ea3cd933cd 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > @@ -174,7 +174,7 @@ static int
> > >  nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
> > >  {
> > >         struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
> > > -       schedule_work(&fctx->uevent_work);
> > > +       queue_work(fctx->wq, &fctx->uevent_work);
> > >         return NVIF_EVENT_KEEP;
> > >  }
> > >
> > > @@ -194,6 +194,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
> > >         INIT_LIST_HEAD(&fctx->pending);
> > >         spin_lock_init(&fctx->lock);
> > >         fctx->context = chan->drm->runl[chan->runlist].context_base + chan->chid;
> > > +       fctx->wq = chan->drm->fence_wq;
> > >
> > >         if (chan == chan->drm->cechan)
> > >                 strcpy(fctx->name, "copy engine channel");
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > index 8bc065acfe35..bc13110bdfa4 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > @@ -44,7 +44,9 @@ struct nouveau_fence_chan {
> > >         u32 context;
> > >         char name[32];
> > >
> > > +       struct workqueue_struct *wq;
> > >         struct work_struct uevent_work;
> > > +
> > >         struct nvif_event event;
> > >         int notify_ref, dead, killed;
> > >  };
> > >
> > > base-commit: 1f4c6f11a557642505e5f403e0dfabbaff9c529a
> > > --
> > > 2.43.0
> > >
> >
>
