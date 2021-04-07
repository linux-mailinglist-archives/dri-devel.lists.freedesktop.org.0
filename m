Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384843570B3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 17:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DA16E93F;
	Wed,  7 Apr 2021 15:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EEA6E93B;
 Wed,  7 Apr 2021 15:44:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so18474604ote.6; 
 Wed, 07 Apr 2021 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WMA1IK2ppqOAEfkh+hmoE6gu1PfBNshlm+IlU/GPGLk=;
 b=vP/ZcjjtND1j4/KOYfrh2Kd3rP6Um8rLY9M0Z606Yf73X62G+mX/OcKMN8tVEdM9Q1
 6phindgRqiltxrtT9JXigHdJ3OGsO2NXK0RUPgVsO60FQxI/JDcYgGGSYR1F/QHmxTMC
 /s3MKWq3sSlUTwhcursOdb1t0B3kD6w2+Z5JjqrnXU7Yx08k5pY1Kv6pazCANnIJcomf
 9aqIo+TzqDWiI5aDkHZ4Fb0Uz82hpgB8i0pnrB+HRBrmyN28eMKhetSFcwyy5IuLDpty
 /c6hAnz9A1Bum4ek2kQkFH25qC/Sh3SC0pmUC+5X4kDy+TlSJaRMV1hcrojGp7rAGiF5
 OtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMA1IK2ppqOAEfkh+hmoE6gu1PfBNshlm+IlU/GPGLk=;
 b=lWJpYQMj45M31UG/DoIKpUZhhQQdN6Ua4jPi57D1Et9rnTutaprk67IRhv977mWZNM
 xgxqi4a0kajYynpS3mYS3Zsf6RbdqwQwvQs6WlU5cITJp2VZ5D1Kc4mojbIvNFRiF3aE
 qBQZCy1dukzEJ2tQk9wYgFeZFnr3qMFyQNtmiYn9qbqtfW3PGB5ke+Jz67fqjW66LF+Y
 e1uP8+HRhwtxTHuflmFqVmKnTKVQb169unrj6RQf2sOZZQ2zdRS9Or6p3RSvwpCG1Bl7
 UoTPwSPoCtBFSN7f5HuXa0JtwADOZermhF8Nb3c5DIVDuFxO3Wb3gWhPHhWyvU+dowD8
 LcUQ==
X-Gm-Message-State: AOAM5325bqFWwWBYI1QITKKY2yXgl6AMHURHwiBtf6Yf+0Rz0d/OHb4Z
 SrLxnocaj7/DJ1itLHL5UbsI8jSGNBu0pw0mEA/BxBGAW54=
X-Google-Smtp-Source: ABdhPJzRNfs/yU6QXgQPlcPmUAp7FJoO827Kvs7dNbaDYUffprpwb+kA7SCuC0BtcPVPjLBfWs/F2LHr5ZheNSu380A=
X-Received: by 2002:a9d:7288:: with SMTP id t8mr3650596otj.132.1617810296069; 
 Wed, 07 Apr 2021 08:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210407133105.39702-1-Roy.Sun@amd.com>
 <20210407133105.39702-2-Roy.Sun@amd.com>
In-Reply-To: <20210407133105.39702-2-Roy.Sun@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Apr 2021 11:44:45 -0400
Message-ID: <CADnq5_M1B91fZc9fBX4VRBnnMBG-poXYNvg_FMd-babRQAVS4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/scheduler: Change scheduled fence track
To: Roy Sun <Roy.Sun@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David M Nieto <david.nieto@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel since GPU scheduler is a shared component.

On Wed, Apr 7, 2021 at 9:31 AM Roy Sun <Roy.Sun@amd.com> wrote:
>
> Update the timestamp of scheduled fence on HW
> completion of the previous fences
>
> This allow more accurate tracking of the fence
> execution in HW
>
> Signed-off-by: David M Nieto <david.nieto@amd.com>
> Signed-off-by: Roy Sun <Roy.Sun@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de24d0a1..4e5d8d4af010 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -515,7 +515,7 @@ void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
>  EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>
>  /**
> - * drm_sched_resubmit_jobs_ext - helper to relunch certain number of jobs from mirror ring list
> + * drm_sched_resubmit_jobs_ext - helper to relunch certain number of jobs from pending list
>   *
>   * @sched: scheduler instance
>   * @max: job numbers to relaunch
> @@ -671,7 +671,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  static struct drm_sched_job *
>  drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  {
> -       struct drm_sched_job *job;
> +       struct drm_sched_job *job, *next;
>
>         /*
>          * Don't destroy jobs while the timeout worker is running  OR thread
> @@ -690,6 +690,13 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>         if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>                 /* remove job from pending_list */
>                 list_del_init(&job->list);
> +               /* account for the next fence in the queue */
> +               next = list_first_entry_or_null(&sched->pending_list,
> +                               struct drm_sched_job, list);
> +               if (next) {
> +                       next->s_fence->scheduled.timestamp =
> +                               job->s_fence->finished.timestamp;
> +               }
>         } else {
>                 job = NULL;
>                 /* queue timeout for next job */
> --
> 2.31.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
