Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F7835448
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 04:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A16910E035;
	Sun, 21 Jan 2024 03:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544010E035;
 Sun, 21 Jan 2024 03:05:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40ea5654271so8879115e9.0; 
 Sat, 20 Jan 2024 19:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705806291; x=1706411091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8c7Bt3byd9RTRdaOa3TR1Whczb8x0dQJ8VIo3/hb8M=;
 b=aGRgpEZ/KVjnq6KGHQME1p2ykz7NmWb1p32WIOZocGC+qPzWsYFP6XWLSbNAGvYlrC
 vfMWZSrJweaJeg1Gn9z8SYUnkDFk9QhH/Q5Iz5tmubsEb+Z3BLJB+lO3i08A/JCtvzv9
 zzfhI5F1aRLXJIRiYJUDgFvgQTc7zMl++nXN+eoEW66k0Qa+hyM8Lxf2T7neqrKwky9y
 ohmcyPnCEsFlg3rlfxDAZzfQCu5ZynA+6BFwK88VfAtWDs+S8Zcsq5RWuFPb+Q0zGGrA
 PzY6bBf7esChx/xelNqWzRQKbgmRZriBi/2x02qKX0Vs78GoAiIovWcJEcClwiaRUDGO
 ha8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705806291; x=1706411091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8c7Bt3byd9RTRdaOa3TR1Whczb8x0dQJ8VIo3/hb8M=;
 b=VY/E9F3gKGXQBL+ooEQE0AGNUgdHF1i+BhZ9K4yLIbEhNBA57/2EFBC1qtHrqAmXU5
 2dD4OEOgHrFtK0yHmie7L5YqE6blTkRNF51BWCGj8wbLXNBe15L1fLlD7nTcd4Z0nrkq
 ECTiq+wKwNaQ7OU3QI7Kw3K+oBgxuX0AuaYY16hVZySYXYuSDIV7suYSTF/g5bSSr8tb
 QMTJjeOSlL8lLzzFan/KYI8gN7oOC4nhOeRUKL7pxMskZ2p1WpQPu3dCrdYcPnUW5RLh
 LP6sl5fyrngjGf6K3c94Yhup9OM5oxSe5EjzYiCeKyxkwZoxLx21S5nEZ2NJX/DK+IkW
 eh5w==
X-Gm-Message-State: AOJu0YwkwvL/Uam9Mb/yGpzJxn/wQRYPeLCFhD8OwXdF3YQq/WwTSKan
 uqmfFmKkaFU3KDlu6BmTGGcV+Cc5MsqCeOphDVii85Ixgtltr7KMJd3QwctQVmjsd+35rppGM1Z
 WJDJtbyv53kIhumwtV31jzZ8muVs=
X-Google-Smtp-Source: AGHT+IGF6PbGDBCI59WdnM2lX1xWzGACoC59QUKYUf/NiCcUc7xtWgtcQqS0L0ZFODfR59NAxkkeynLlfp9wSytyiY0=
X-Received: by 2002:a05:600c:4513:b0:40d:5575:a197 with SMTP id
 t19-20020a05600c451300b0040d5575a197mr1147431wmo.12.1705806290932; Sat, 20
 Jan 2024 19:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
 <CAKGbVbv-4e7w8_8AGvFd358j-QcG8KJ1zdUZ3kit9odSCatZ5w@mail.gmail.com>
In-Reply-To: <CAKGbVbv-4e7w8_8AGvFd358j-QcG8KJ1zdUZ3kit9odSCatZ5w@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 21 Jan 2024 11:04:38 +0800
Message-ID: <CAKGbVbugkHADEw_EigJmrVJzc4NSaHRpvL-3HRdw6U_=5B5u7Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
 latency
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 9:43=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> On Wed, Jan 17, 2024 at 11:12=E2=80=AFAM Erico Nunes <nunes.erico@gmail.c=
om> wrote:
> >
> > There are several unexplained and unreproduced cases of rendering
> > timeouts with lima, for which one theory is high IRQ latency coming fro=
m
> > somewhere else in the system.
> > This kind of occurrence may cause applications to trigger unnecessary
> > resets of the GPU or even applications to hang if it hits an issue in
> > the recovery path.
> > Panfrost already does some special handling to account for such
> > "spurious timeouts", it makes sense to have this in lima too to reduce
> > the chance that it hit users.
> >
> > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> > ---
> >  drivers/gpu/drm/lima/lima_sched.c | 32 ++++++++++++++++++++++++++-----
> >  drivers/gpu/drm/lima/lima_sched.h |  2 ++
> >  2 files changed, 29 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index 66317296d831..9449b81bcd5b 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> >  /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
> >
> > +#include <linux/hardirq.h>
> >  #include <linux/iosys-map.h>
> >  #include <linux/kthread.h>
> >  #include <linux/slab.h>
> > @@ -223,10 +224,7 @@ static struct dma_fence *lima_sched_run_job(struct=
 drm_sched_job *job)
> >
> >         task->fence =3D &fence->base;
> >
> > -       /* for caller usage of the fence, otherwise irq handler
> > -        * may consume the fence before caller use it
> > -        */
> > -       dma_fence_get(task->fence);
> > +       task->done_fence =3D dma_fence_get(task->fence);
> >
> >         pipe->current_task =3D task;
> >
> > @@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_timedout=
_job(struct drm_sched_job *job
> >         struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
> >         struct lima_sched_task *task =3D to_lima_task(job);
> >         struct lima_device *ldev =3D pipe->ldev;
> > +       struct lima_ip *ip =3D pipe->processor[0];
> > +
> > +       /*
> > +        * If the GPU managed to complete this jobs fence, the timeout =
is
> > +        * spurious. Bail out.
> > +        */
> > +       if (dma_fence_is_signaled(task->done_fence)) {
> > +               DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> > +               return DRM_GPU_SCHED_STAT_NOMINAL;
> > +       }
> > +
> You may just remove this check and left the check after sync irq.
>
After more thinking, this is only for handling spurious timeouts more
efficiently, not for totally reliable timeout handling. So this check shoul=
d
be OK.

> > +       /*
> > +        * Lima IRQ handler may take a long time to process an interrup=
t
> > +        * if there is another IRQ handler hogging the processing.
> > +        * In order to catch such cases and not report spurious Lima jo=
b
> > +        * timeouts, synchronize the IRQ handler and re-check the fence
> > +        * status.
> > +        */
> > +       synchronize_irq(ip->irq);
> This should be done after drm_sched_stop() to prevent drm scheduler
> run more jobs. And we need to disable interrupt of GP/PP for no more
> running job triggered fresh INT.
This is OK too. We just need to solve reliable timeout handling after
drm_sched_stop() in another patch.

>
> PP may have more than one IRQ, so we need to wait on all of them.
>
> > +
> > +       if (dma_fence_is_signaled(task->done_fence)) {
> > +               DRM_WARN("%s unexpectedly high interrupt latency\n", li=
ma_ip_name(ip));
> > +               return DRM_GPU_SCHED_STAT_NOMINAL;
> > +       }
> >
> >         if (!pipe->error)
> > -               DRM_ERROR("lima job timeout\n");
> > +               DRM_ERROR("%s lima job timeout\n", lima_ip_name(ip));
> >
> >         drm_sched_stop(&pipe->base, &task->base);
> >
> > diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/l=
ima_sched.h
> > index 6a11764d87b3..34050facb110 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.h
> > +++ b/drivers/gpu/drm/lima/lima_sched.h
> > @@ -29,6 +29,8 @@ struct lima_sched_task {
> >         bool recoverable;
> >         struct lima_bo *heap;
> >
> > +       struct dma_fence *done_fence;
> > +
> >         /* pipe fence */
> >         struct dma_fence *fence;
> >  };
> > --
> > 2.43.0
> >
