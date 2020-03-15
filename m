Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED624185A16
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 05:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5926E119;
	Sun, 15 Mar 2020 04:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BFE6E102;
 Sun, 15 Mar 2020 04:36:55 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c145so20255344qke.12;
 Sat, 14 Mar 2020 21:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/RkqkHujpZQtnT+EYxYQT2pySo0jUlfSsGC7XrTgpk=;
 b=S7+OBA7BlZDSr47kPlrgH1sFYyEZShM5lidv5hCVQ7Uh30okGybF5xbuGNxYGUBnLZ
 gNXN5v+ZUYbRl4kVfLy46MCE/kKsMlazNTasO4XGi1vkZQYljPuPCT8MJU9OwQE4AyMj
 hRqORg2GoRZsho5EM85cdJpqEjvSXU1eG1Bu6fBxESc3vZe2GRftinreaJ/BaTW7zw0I
 30YWjrjL7dhpJ823B8r6rzEYd8CYo09gnXxdGLDyouehHwenc+1Xs8wSkk+4Yi9mMIzM
 +7vj8yx21eDwjbLPCzrnJ11OHtoRnmBf/DJIPDVQk1/d4yIKw1+8PJuXdlX4Lpge4RtU
 Y3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/RkqkHujpZQtnT+EYxYQT2pySo0jUlfSsGC7XrTgpk=;
 b=gTswsLfkXGmyluibSRD+Vjmq6CPZNVuvoP1IGgVCbakjIZtYx3xDdNMsUZygYlUpVw
 BGOYKK/aT+XQXCk6HYIpZ1o64vAV5S8rHMRkVTzkAYS8i9maeHuiNBboRCtzyoihwyWK
 ENq8ZxLA4DvFtJObF7KTeKHlZd/oQJG3qK8d33BX+IIcBvmlC+dLLcSesPz5C2C6VYGz
 WWmTMjurwf3upaIopkpND9JI0XocDqQmbid0VrEj0K8H7mvwKEpej/isg1J38EqdVyQ7
 KlKksZnDvSxci6LNqFELYoq6+71CZUMwW+cMAyGGSb3NFFPl+X0n+MM20u7puy205/JS
 OMKQ==
X-Gm-Message-State: ANhLgQ30enDBRXJ7M1KJ0HJmBn8sPrQQGfjGiod9q81Guy2WsnY5fAqS
 dMQqASArz/HUewGv7Fqsg70E8rqp5xIvFCbfetM=
X-Google-Smtp-Source: ADFU+vulfnKnHQfhibPwh9MnIjSvRYjyk3EtYOAtUXSJOIlLA+FXog1JZPhtVp/l0hS2qD6xltdpqq0WaFvB5R7meZU=
X-Received: by 2002:a05:620a:1136:: with SMTP id
 p22mr4316982qkk.131.1584247014244; 
 Sat, 14 Mar 2020 21:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200307135438.9981-1-yuq825@gmail.com>
In-Reply-To: <20200307135438.9981-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 14 Mar 2020 21:37:11 -0700
Message-ID: <CA+E=qVc822KmCh9whPqZJfQT8xRR-ZVEai6pSp0MGOFduD0pyw@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: add trace point for tasks
To: Qiang Yu <yuq825@gmail.com>
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

On Sat, Mar 7, 2020 at 5:55 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> track lima task start which can be combined with
> dma_fence_signal to identify task execution time.
>
> example command to record:
>
> trace-cmd record -i \
>   -e "lima:lima_task_submit" -e "lima:lima_task_run" \
>   -e "*fence:*fence_signaled" -e "drm:drm_vblank_event" \
>   -e "drm:drm_vblank_event_queued" sleep 4

LGTM. Out of curiosity, is there any reason for not adding one more
event for task completion?

> Signed-off-by: Qiang Yu <yuq825@gmail.com>
> ---
>  drivers/gpu/drm/lima/Makefile     |  3 +-
>  drivers/gpu/drm/lima/lima_sched.c |  5 +++-
>  drivers/gpu/drm/lima/lima_sched.h |  1 +
>  drivers/gpu/drm/lima/lima_trace.c |  7 +++++
>  drivers/gpu/drm/lima/lima_trace.h | 50 +++++++++++++++++++++++++++++++
>  5 files changed, 64 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_trace.c
>  create mode 100644 drivers/gpu/drm/lima/lima_trace.h
>
> diff --git a/drivers/gpu/drm/lima/Makefile b/drivers/gpu/drm/lima/Makefile
> index a85444b0a1d4..6e7b788408e8 100644
> --- a/drivers/gpu/drm/lima/Makefile
> +++ b/drivers/gpu/drm/lima/Makefile
> @@ -14,6 +14,7 @@ lima-y := \
>         lima_sched.o \
>         lima_ctx.o \
>         lima_dlbu.o \
> -       lima_bcast.o
> +       lima_bcast.o \
> +       lima_trace.o
>
>  obj-$(CONFIG_DRM_LIMA) += lima.o
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index f295479e3733..98d0d410b7d7 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -3,7 +3,6 @@
>
>  #include <linux/kthread.h>
>  #include <linux/slab.h>
> -#include <linux/xarray.h>
>  #include <linux/vmalloc.h>
>
>  #include "lima_drv.h"
> @@ -12,6 +11,7 @@
>  #include "lima_mmu.h"
>  #include "lima_l2_cache.h"
>  #include "lima_gem.h"
> +#include "lima_trace.h"
>
>  struct lima_fence {
>         struct dma_fence base;
> @@ -177,6 +177,7 @@ struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *conte
>  {
>         struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
>
> +       trace_lima_task_submit(task);
>         drm_sched_entity_push_job(&task->base, &context->base);
>         return fence;
>  }
> @@ -251,6 +252,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
>         if (last_vm)
>                 lima_vm_put(last_vm);
>
> +       trace_lima_task_run(task);
> +
>         pipe->error = false;
>         pipe->task_run(pipe, task);
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> index e29f5e3b675b..e5db1919f446 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -6,6 +6,7 @@
>
>  #include <drm/gpu_scheduler.h>
>  #include <linux/list.h>
> +#include <linux/xarray.h>
>
>  struct lima_vm;
>
> diff --git a/drivers/gpu/drm/lima/lima_trace.c b/drivers/gpu/drm/lima/lima_trace.c
> new file mode 100644
> index 000000000000..ea1c7289bebc
> --- /dev/null
> +++ b/drivers/gpu/drm/lima/lima_trace.c
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
> +
> +#include "lima_sched.h"
> +
> +#define CREATE_TRACE_POINTS
> +#include "lima_trace.h"
> diff --git a/drivers/gpu/drm/lima/lima_trace.h b/drivers/gpu/drm/lima/lima_trace.h
> new file mode 100644
> index 000000000000..9308b948b69d
> --- /dev/null
> +++ b/drivers/gpu/drm/lima/lima_trace.h
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/* Copyright 2020 Qiang Yu <yuq825@gmail.com> */
> +
> +#if !defined(_LIMA_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _LIMA_TRACE_H_
> +
> +#include <linux/tracepoint.h>
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM lima
> +#define TRACE_INCLUDE_FILE lima_trace
> +
> +DECLARE_EVENT_CLASS(lima_task,
> +       TP_PROTO(struct lima_sched_task *task),
> +       TP_ARGS(task),
> +       TP_STRUCT__entry(
> +               __field(uint64_t, task_id)
> +               __field(unsigned int, context)
> +               __field(unsigned int, seqno)
> +               __string(pipe, task->base.sched->name)
> +               ),
> +
> +       TP_fast_assign(
> +               __entry->task_id = task->base.id;
> +               __entry->context = task->base.s_fence->finished.context;
> +               __entry->seqno = task->base.s_fence->finished.seqno;
> +               __assign_str(pipe, task->base.sched->name)
> +               ),
> +
> +       TP_printk("task=%llu, context=%u seqno=%u pipe=%s",
> +                 __entry->task_id, __entry->context, __entry->seqno,
> +                 __get_str(pipe))
> +);
> +
> +DEFINE_EVENT(lima_task, lima_task_submit,
> +            TP_PROTO(struct lima_sched_task *task),
> +            TP_ARGS(task)
> +);
> +
> +DEFINE_EVENT(lima_task, lima_task_run,
> +            TP_PROTO(struct lima_sched_task *task),
> +            TP_ARGS(task)
> +);
> +
> +#endif
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/lima
> +#include <trace/define_trace.h>
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
