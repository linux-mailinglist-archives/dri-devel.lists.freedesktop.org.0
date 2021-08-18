Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E43F0593
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C236E5BF;
	Wed, 18 Aug 2021 14:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78606E5BF;
 Wed, 18 Aug 2021 14:02:17 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so3718600otf.6; 
 Wed, 18 Aug 2021 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6i47uf3ifoP6J6j6sZ1ePcG/O7SltkCEk8sMyJY8PIo=;
 b=pM+II3j8CIkaXLgKcQfdftrjTNhUNxn6YaWk20fC3kCqp2Z25OdpuKCposwPGTtD9J
 b5lcfi39J8n2qvE2c3NG8wN/4n91BtJvs198RyNt4nsFQUeakZbHubLeHEmgROP1wcZ7
 uJpwvxvGCmVJXB33K1HGQsBb2Uky2IetRZ+4rsM+tOTn9IV+BaiC0mJomGQgVSzgFZun
 c9qNniyuWtydc8TjYt6dUKNROKYPdfnUGdId5mya3YuM/ztICJL9Q2h3dtRubyxkYSUr
 dFXlC2x9BaNCEu7uOY9xAwT6hYv9FdCol9fLD2vV5qcnffRSk18TgJ+XUqlbzfC8HySR
 Rogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6i47uf3ifoP6J6j6sZ1ePcG/O7SltkCEk8sMyJY8PIo=;
 b=b/DvME8naIN6FhW2HWnhF5hB5gbd8IH6D0wiFF8P92kTie6+N34Ic/8ADwpS/Ql77p
 dyJ3uuA4QUfpngu4FHHGYHNKqTJVkJgaxog79VQuPp1Qm12DKElAcnpFB9h/UXn4Y0Sr
 t/lc9Ap2z0twORo++O9ms7w9THcyTeW+FNic7HwEnPm9rJlGswu4x+YRC2m/BgVBfWe+
 oHhdinkpF1WbuaMMspk6Kj6b4XwN/dnX7f0/K/2IHbiE6ihJhd/ecMmoHJW+y4tH4KfG
 GhCMf4vBpSnbQ0wA1k4ES+Q8vi7JEnK/ATOmulsbc/3AR0/O5fiCMXXL5zZ8SQ4+linh
 A+Cg==
X-Gm-Message-State: AOAM533h6OoVTU/Cwr3E3SoKPFT/Y5PwFWLUl/XOc68lIJoMU3AupuHH
 0qhHuDizNMOnxiTYj3u/Kq/xRRrKa48Kk9Z2JSY=
X-Google-Smtp-Source: ABdhPJywvaR8Vo2HIdi0kSEpwl//IQn2iCSl4eJlw8fkzVtM2YcDT1+c2LcCkv5yMAhzZepDsHD6eMzApzmLi193TFY=
X-Received: by 2002:a05:6830:138d:: with SMTP id
 d13mr7113480otq.311.1629295336994; 
 Wed, 18 Aug 2021 07:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
In-Reply-To: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Aug 2021 10:02:06 -0400
Message-ID: <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Jingwen Chen <Jingwen.Chen2@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu" <monk.liu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
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

+ dri-devel

Since scheduler is a shared component, please add dri-devel on all
scheduler patches.

On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>
> [Why]
> for bailing job, this commit will delete it from pending list thus the
> bailing job will never have a chance to be resubmitted even in advance
> tdr mode.
>
> [How]
> after embeded hw_fence into amdgpu_job is done, the race condition that
> this commit tries to work around is completely solved.So revert this
> commit.
> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> v2:
> add dma_fence_get/put() around timedout_job to avoid concurrent delete
> during processing timedout_job
>
> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a953693b45..f9b9b3aefc4a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  {
>         struct drm_gpu_scheduler *sched;
>         struct drm_sched_job *job;
> +       struct dma_fence *fence;
>         enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>
>         sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>
>         if (job) {
>                 /*
> -                * Remove the bad job so it cannot be freed by concurrent
> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -                * is parked at which point it's safe.
> +                * Get job->s_fence->parent here to avoid concurrent delete during
> +                * processing timedout_job
>                  */
> -               list_del_init(&job->list);
> +               fence = dma_fence_get(job->s_fence->parent);
>                 spin_unlock(&sched->job_list_lock);
>
>                 status = job->sched->ops->timedout_job(job);
> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>                         job->sched->ops->free_job(job);
>                         sched->free_guilty = false;
>                 }
> +               dma_fence_put(fence);
>         } else {
>                 spin_unlock(&sched->job_list_lock);
>         }
> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>
>         kthread_park(sched->thread);
>
> -       /*
> -        * Reinsert back the bad job here - now it's safe as
> -        * drm_sched_get_cleanup_job cannot race against us and release the
> -        * bad job at this point - we parked (waited for) any in progress
> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> -        * now until the scheduler thread is unparked.
> -        */
> -       if (bad && bad->sched == sched)
> -               /*
> -                * Add at the head of the queue to reflect it was the earliest
> -                * job extracted.
> -                */
> -               list_add(&bad->list, &sched->pending_list);
> -
>         /*
>          * Iterate the job list from later to  earlier one and either deactive
>          * their HW callbacks or remove them from pending list if they already
> --
> 2.25.1
>
