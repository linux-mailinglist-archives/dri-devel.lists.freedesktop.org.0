Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A1187788
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 02:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620CC6E03B;
	Tue, 17 Mar 2020 01:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CC56E03B;
 Tue, 17 Mar 2020 01:41:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 25so19750640wmk.3;
 Mon, 16 Mar 2020 18:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0+PP1S7pApaSGjyUxR4JBepODheqIWQisCay1PAGvY=;
 b=VZRevjFa+gL6XbVeoEGsv0kmq/A9up7PGCirYUDD/DTJPcTbh5xKhJljlddxH0PpBc
 QpRD0bfqGhJ5mpFp+YljOOGa6KCjRRCX3cvUh+p37ve+XsLPjsNdvpXVhVp/vQQJhInO
 cQ2oLLfvrRGjAu33Iyr347MBmT01+jIa42fVce5E6KrjPKAJYTVc31suxIchPGP1MH02
 IVPhEBbPUsJgsxO+45Dzw2P3etij5KoRg4oL4LPp0b5uBpRvTiU2Obu5t/TreDDpQZzw
 +URZo50obynot3ErHlrx4B2LFl3xZ15Qru7BT0J7OIVMRo+E/HbLLMJj5qWlerieRQpu
 54CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0+PP1S7pApaSGjyUxR4JBepODheqIWQisCay1PAGvY=;
 b=J5nM+zGCufy896qSZb5kdltvAXR8g0K/mO9ou6UMuYWr4BTiY1JgUL6oLFkINUxZHv
 qMTOH453ldV25zZyjjsOlG+0FZEiOyi5V+M0spYkvjxmy6dwQUh+buhzpu37rLYN6e3a
 ySwGKgJC4rj5gjdt4WdbMrDCjmAuR8HG31PdbW/Mvn7Z0UrkjclyD19YwMytTJvQqyYk
 TPnVy8Ig7wq6ABcu4DhcIb/8AjMmOcUDVqTz4kj3YhmuxrenfK/myni+qIOyDBZMHLNy
 f47bVvwGM7cD3ImIYqK5tkNM+8visJVVX2F2EP18FIi49VfP1K5EK+w7cec2NlV4eQYv
 3bsA==
X-Gm-Message-State: ANhLgQ3x2+N5L4LwV8OcNr5eqCvywvdEMhv8ZEnKlyBYctAfBf6ouFps
 eU2wR/0bNICNpBy5ricuw/MXvMqUo48Zs/g/VyM=
X-Google-Smtp-Source: ADFU+vs4BcD8iE1xi5u3RxBiEaeAdx2x/H6lPKsv6ZFJJRmb3jkWoPZNoghH3v3IswX2kvoOoDc4NLfDzaKmxUFoHnE=
X-Received: by 2002:a7b:ce0c:: with SMTP id m12mr2060882wmc.104.1584409298011; 
 Mon, 16 Mar 2020 18:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200307135438.9981-1-yuq825@gmail.com>
 <CA+E=qVc822KmCh9whPqZJfQT8xRR-ZVEai6pSp0MGOFduD0pyw@mail.gmail.com>
In-Reply-To: <CA+E=qVc822KmCh9whPqZJfQT8xRR-ZVEai6pSp0MGOFduD0pyw@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 17 Mar 2020 09:41:26 +0800
Message-ID: <CAKGbVbtP9qS7rt-uOMKNhFWsyUnmXPgKEkkpfT6aOf_nONdxBA@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: add trace point for tasks
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 12:36 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Sat, Mar 7, 2020 at 5:55 AM Qiang Yu <yuq825@gmail.com> wrote:
> >
> > track lima task start which can be combined with
> > dma_fence_signal to identify task execution time.
> >
> > example command to record:
> >
> > trace-cmd record -i \
> >   -e "lima:lima_task_submit" -e "lima:lima_task_run" \
> >   -e "*fence:*fence_signaled" -e "drm:drm_vblank_event" \
> >   -e "drm:drm_vblank_event_queued" sleep 4
>
> LGTM. Out of curiosity, is there any reason for not adding one more
> event for task completion?

Not concrete reason, as the comment, trace point when
dma_fence_signal act as the task completion event, so not add duplicate
one.

Regards,
Qiang

>
> > Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > ---
> >  drivers/gpu/drm/lima/Makefile     |  3 +-
> >  drivers/gpu/drm/lima/lima_sched.c |  5 +++-
> >  drivers/gpu/drm/lima/lima_sched.h |  1 +
> >  drivers/gpu/drm/lima/lima_trace.c |  7 +++++
> >  drivers/gpu/drm/lima/lima_trace.h | 50 +++++++++++++++++++++++++++++++
> >  5 files changed, 64 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/lima/lima_trace.c
> >  create mode 100644 drivers/gpu/drm/lima/lima_trace.h
> >
> > diff --git a/drivers/gpu/drm/lima/Makefile b/drivers/gpu/drm/lima/Makefile
> > index a85444b0a1d4..6e7b788408e8 100644
> > --- a/drivers/gpu/drm/lima/Makefile
> > +++ b/drivers/gpu/drm/lima/Makefile
> > @@ -14,6 +14,7 @@ lima-y := \
> >         lima_sched.o \
> >         lima_ctx.o \
> >         lima_dlbu.o \
> > -       lima_bcast.o
> > +       lima_bcast.o \
> > +       lima_trace.o
> >
> >  obj-$(CONFIG_DRM_LIMA) += lima.o
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index f295479e3733..98d0d410b7d7 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -3,7 +3,6 @@
> >
> >  #include <linux/kthread.h>
> >  #include <linux/slab.h>
> > -#include <linux/xarray.h>
> >  #include <linux/vmalloc.h>
> >
> >  #include "lima_drv.h"
> > @@ -12,6 +11,7 @@
> >  #include "lima_mmu.h"
> >  #include "lima_l2_cache.h"
> >  #include "lima_gem.h"
> > +#include "lima_trace.h"
> >
> >  struct lima_fence {
> >         struct dma_fence base;
> > @@ -177,6 +177,7 @@ struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *conte
> >  {
> >         struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
> >
> > +       trace_lima_task_submit(task);
> >         drm_sched_entity_push_job(&task->base, &context->base);
> >         return fence;
> >  }
> > @@ -251,6 +252,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
> >         if (last_vm)
> >                 lima_vm_put(last_vm);
> >
> > +       trace_lima_task_run(task);
> > +
> >         pipe->error = false;
> >         pipe->task_run(pipe, task);
> >
> > diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> > index e29f5e3b675b..e5db1919f446 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.h
> > +++ b/drivers/gpu/drm/lima/lima_sched.h
> > @@ -6,6 +6,7 @@
> >
> >  #include <drm/gpu_scheduler.h>
> >  #include <linux/list.h>
> > +#include <linux/xarray.h>
> >
> >  struct lima_vm;
> >
> > diff --git a/drivers/gpu/drm/lima/lima_trace.c b/drivers/gpu/drm/lima/lima_trace.c
> > new file mode 100644
> > index 000000000000..ea1c7289bebc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/lima/lima_trace.c
> > @@ -0,0 +1,7 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
> > +
> > +#include "lima_sched.h"
> > +
> > +#define CREATE_TRACE_POINTS
> > +#include "lima_trace.h"
> > diff --git a/drivers/gpu/drm/lima/lima_trace.h b/drivers/gpu/drm/lima/lima_trace.h
> > new file mode 100644
> > index 000000000000..9308b948b69d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/lima/lima_trace.h
> > @@ -0,0 +1,50 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
> > +
> > +#if !defined(_LIMA_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _LIMA_TRACE_H_
> > +
> > +#include <linux/tracepoint.h>
> > +
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM lima
> > +#define TRACE_INCLUDE_FILE lima_trace
> > +
> > +DECLARE_EVENT_CLASS(lima_task,
> > +       TP_PROTO(struct lima_sched_task *task),
> > +       TP_ARGS(task),
> > +       TP_STRUCT__entry(
> > +               __field(uint64_t, task_id)
> > +               __field(unsigned int, context)
> > +               __field(unsigned int, seqno)
> > +               __string(pipe, task->base.sched->name)
> > +               ),
> > +
> > +       TP_fast_assign(
> > +               __entry->task_id = task->base.id;
> > +               __entry->context = task->base.s_fence->finished.context;
> > +               __entry->seqno = task->base.s_fence->finished.seqno;
> > +               __assign_str(pipe, task->base.sched->name)
> > +               ),
> > +
> > +       TP_printk("task=%llu, context=%u seqno=%u pipe=%s",
> > +                 __entry->task_id, __entry->context, __entry->seqno,
> > +                 __get_str(pipe))
> > +);
> > +
> > +DEFINE_EVENT(lima_task, lima_task_submit,
> > +            TP_PROTO(struct lima_sched_task *task),
> > +            TP_ARGS(task)
> > +);
> > +
> > +DEFINE_EVENT(lima_task, lima_task_run,
> > +            TP_PROTO(struct lima_sched_task *task),
> > +            TP_ARGS(task)
> > +);
> > +
> > +#endif
> > +
> > +/* This part must be outside protection */
> > +#undef TRACE_INCLUDE_PATH
> > +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/lima
> > +#include <trace/define_trace.h>
> > --
> > 2.17.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
