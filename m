Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073AA860782
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 01:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449D710EAD1;
	Fri, 23 Feb 2024 00:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/zSF5WE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923510EAD1;
 Fri, 23 Feb 2024 00:15:07 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso472688e87.0; 
 Thu, 22 Feb 2024 16:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708647306; x=1709252106; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wbdYVnXWxtvDkIE4QvrbDuoRjpCKlqx/O5kI02G4D/E=;
 b=m/zSF5WEfxgEwmjWmS6eGQOoj5p+dVLlKC+krYhDfHWKntqUh/4bovZ8DRQ0nbE6Gd
 5pWPOJwBhON1K6Q+YmTf+h54Bb5MjC39/abrLxG9ytHkQLiAAvxycBYk92Qb1PXeyKjH
 aXOeHSZttW50dAar1OJladstNbm8QM3DKqUmOomRRyoRRZ67Pw3usXowT95kvHgxQXlG
 F+QLTVY1nxUPFukNhyDuFtR0mVhPRh4bD5r/hHZETZ9OmXXO5TNxG7ems5tuuAncO6n0
 VOclXsyJrfFiQKZWUS1hV+iMtxXmpXAWRjaRuks+aVuknWDl2dW3DCNARgZbIBesQWhE
 b+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708647306; x=1709252106;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wbdYVnXWxtvDkIE4QvrbDuoRjpCKlqx/O5kI02G4D/E=;
 b=HKybL9j/nrK5jbbLA2mSyFS4xbItQ57BwBD4Jgi6u5yiXNsMgUeN06ASC1fSdEpY98
 umYsfkr3Jpdd9Ze5GheY4UW364MY12JOoa9kb1tvVD+ILtL3bEz28Gun583uDMam432r
 xCd3dCXbds76iAzPktLjGGS3aPKhF454rZbbGR41IGSL8fQaY1hvb24oBGg3HBGNkUI+
 uBIJZt2L4iLz6DTKza2BxvSFeSZz8zyYlEkm0asUdunvC/k6MykM22iMrnjmdznfWHUV
 gm765CjT9hOg/FQL5Ou/ecVZ1HYZuYdHXX1O2lRw2Q/5zoQhcGf6aTjex9wUx8R5YEpM
 MNcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2uc8HFWYjVq/TnAbg0tIWCpE30pv2snntIwcuAffaqmnhl6SJ1hEzjlyTnU+kP4XdlLQ5eQUi6JG8K/AeUcgquhOgBcXbfVx+cI8yMzIe
X-Gm-Message-State: AOJu0YysjgdvgtlC570k5quDvkmWBdiwZzmUUO3ltl9+t4pKn2HhvHbv
 +DW7oQSBoWVX/paeJtmLCg3zvtWUsyhtFwSqyKbIzL1dzeugWyd6TtnC46Hmps3diEa8IMUrF2S
 t1mtGc2X88Q17BrmAib1E/8oTvzE=
X-Google-Smtp-Source: AGHT+IHDMTypQuGruPGCZIikYT3URiuAoz+L+hoOU3MA9akgTu6D+EAqg67te00SpbbudqPb7w6aetdZ9ikf6cayHLk=
X-Received: by 2002:ac2:4344:0:b0:512:a061:846f with SMTP id
 o4-20020ac24344000000b00512a061846fmr377646lfl.41.1708647305380; Thu, 22 Feb
 2024 16:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20240222144536.4382-1-dakr@redhat.com>
In-Reply-To: <20240222144536.4382-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Feb 2024 10:14:53 +1000
Message-ID: <CAPM=9ty7ALfg6-ebdQdjeVdGgm2dVQYE0+yHeJ8+YCsZvAL+1g@mail.gmail.com>
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

On Fri, 23 Feb 2024 at 00:45, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Using the kernel global workqueue to signal fences can lead to
> unexpected deadlocks. Some other work (e.g. from a different driver)
> could directly or indirectly depend on this fence to be signaled.
> However, if the WQ_MAX_ACTIVE limit is reached by waiters, this can
> prevent the work signaling the fence from running.
>
> While this seems fairly unlikely, it's potentially exploitable.

LGTM

Reviewed-by: Dave Airlie <airlied@redhat.com>

probably should go into drm-misc-fixes?

>
> Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to workqueue")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 +++++++++++--
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_fence.h |  2 ++
>  4 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 6f6c31a9937b..6be202081077 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -598,9 +598,15 @@ nouveau_drm_device_init(struct drm_device *dev)
>                 goto fail_alloc;
>         }
>
> +       drm->fence_wq = alloc_workqueue("nouveau_fence_wq", 0, WQ_MAX_ACTIVE);
> +       if (!drm->fence_wq) {
> +               ret = -ENOMEM;
> +               goto fail_sched_wq;
> +       }
> +
>         ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>         if (ret)
> -               goto fail_wq;
> +               goto fail_fence_wq;
>
>         ret = nouveau_cli_init(drm, "DRM", &drm->client);
>         if (ret)
> @@ -670,7 +676,9 @@ nouveau_drm_device_init(struct drm_device *dev)
>         nouveau_cli_fini(&drm->client);
>  fail_master:
>         nouveau_cli_fini(&drm->master);
> -fail_wq:
> +fail_fence_wq:
> +       destroy_workqueue(drm->fence_wq);
> +fail_sched_wq:
>         destroy_workqueue(drm->sched_wq);
>  fail_alloc:
>         nvif_parent_dtor(&drm->parent);
> @@ -725,6 +733,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
>
>         nouveau_cli_fini(&drm->client);
>         nouveau_cli_fini(&drm->master);
> +       destroy_workqueue(drm->fence_wq);
>         destroy_workqueue(drm->sched_wq);
>         nvif_parent_dtor(&drm->parent);
>         mutex_destroy(&drm->clients_lock);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 8a6d94c8b163..b43619a213a4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -261,6 +261,9 @@ struct nouveau_drm {
>         /* Workqueue used for channel schedulers. */
>         struct workqueue_struct *sched_wq;
>
> +       /* Workqueue used to signal fences. */
> +       struct workqueue_struct *fence_wq;
> +
>         /* context for accelerated drm-internal operations */
>         struct nouveau_channel *cechan;
>         struct nouveau_channel *channel;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 93f08f9479d8..c3ea3cd933cd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -174,7 +174,7 @@ static int
>  nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
>  {
>         struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
> -       schedule_work(&fctx->uevent_work);
> +       queue_work(fctx->wq, &fctx->uevent_work);
>         return NVIF_EVENT_KEEP;
>  }
>
> @@ -194,6 +194,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>         INIT_LIST_HEAD(&fctx->pending);
>         spin_lock_init(&fctx->lock);
>         fctx->context = chan->drm->runl[chan->runlist].context_base + chan->chid;
> +       fctx->wq = chan->drm->fence_wq;
>
>         if (chan == chan->drm->cechan)
>                 strcpy(fctx->name, "copy engine channel");
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 8bc065acfe35..bc13110bdfa4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -44,7 +44,9 @@ struct nouveau_fence_chan {
>         u32 context;
>         char name[32];
>
> +       struct workqueue_struct *wq;
>         struct work_struct uevent_work;
> +
>         struct nvif_event event;
>         int notify_ref, dead, killed;
>  };
>
> base-commit: 1f4c6f11a557642505e5f403e0dfabbaff9c529a
> --
> 2.43.0
>
