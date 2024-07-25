Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2593C730
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D97F10E2F8;
	Thu, 25 Jul 2024 16:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jpe1mGGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE5F10E2D4;
 Thu, 25 Jul 2024 16:30:19 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2cb09dc1dafso19831a91.2; 
 Thu, 25 Jul 2024 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721925019; x=1722529819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqvKAlvP7Z8lcnYLBh5yBUxzuWtz3hdD5K20pkUXi/U=;
 b=jpe1mGGoEKjhmzvdxUVf6hNk9KcgifpjdlSNgoC5OrhJrnlDRJZQiBuC1uloqYGQTh
 hFFAjW2MB17EvD2Y5e7XJCYvGbWgVkf2wXL98h+Nrhp0NcSFm9Dldnj3/R1mwl8jfq7C
 PpwqbzQSvGRPFuHHoe7S3pJpU3VEpRgVN+Q43dKHaLU9X5ZWey1/WxG2KzTzJp6pwntb
 YV7Vq0Cf0oMsIAxlh/mOoHgcCS7yLo+NPLTWdklkxlzBf1mcSZZAd2dLOcciqAxr9PNv
 JsjlR1FynOUuFl9sR5AgPe/S8NS8Cuo65C+94LhwO9fw0UgDHvc5xzGb2En9QKYh0/JE
 XLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721925019; x=1722529819;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqvKAlvP7Z8lcnYLBh5yBUxzuWtz3hdD5K20pkUXi/U=;
 b=HI8I6vYZcIrL7XhqC5WWUd4pA7JmOJTspR2AjcTnFVbf0i+3sov0HF9zVUeW/Qs7Rd
 sU5WSRIRFGs7CkR9EpHEafC+xwwt1N0S9HvTcszE+v3r6NWp15cREfcR4KrZaBkhTaV1
 r2k5xJOn2gv/bwdRthNWYt2mDGEcrlCUZbNa7q0KmPcF2o8TIZPIECZHIcznl7l7ZGPQ
 Y4Kywiqw2ieAkqKy9m9m+Q8NWClrnCphAxENw3w9d0VZ2wGi1/dNWFP+MtHsXFYzVqTf
 U3VI+9eXrGWerhcn+/X6+p5IG9zKAwIP/fccq8Y6kXUPELlllJLB8ffwWLkEEoMH/ViD
 0TDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiJs1twHPFTvW7FlSaE14TGCbMOHL4D7k12OUf+SQEYcoDqivALLJj4Cb9YTVoW7voh893zJ31JmrNVMvtFJUQo3/uSUlTDfZfhSvx0fmc
X-Gm-Message-State: AOJu0Yx7NGu4z/kWypVxUmnSWIXSzmM5VZx02NjE72dxAJ5a6LEQUtnq
 PrwycHx4wqdMi//2ri1aj4zYvVoQjrH5/Gx130BQ0EtTWUXBtwHrBEwVTKt2NnEi7IE94FCx3vq
 VcIlk5OI8J0XgnfHCIozLBD2D3IQ=
X-Google-Smtp-Source: AGHT+IGNot3dlgzPtZPHKoYlRx+/UIYFStomC4sz+rkmSkY2tyPYTw4W0XohYhAM2UM/i8LOGQcxxuqUEbcU7zoHlS4=
X-Received: by 2002:a17:90a:66c4:b0:2c9:371c:ea9 with SMTP id
 98e67ed59e1d1-2cf237fc19amr3630818a91.21.1721925019046; Thu, 25 Jul 2024
 09:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240725032106.513746-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240725032106.513746-1-vitaly.prosyak@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Jul 2024 12:30:07 -0400
Message-ID: <CADnq5_NPmHX_1j9xifr-wk3VjB5j5_inmrrP8JknQ-49A2UqwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: Add error code parameter to drm_sched_start
To: vitaly.prosyak@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 alexander.deucher@amd.com, christian.koenig@amd.com, jesse.zhang@amd.com
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

On Wed, Jul 24, 2024 at 11:30=E2=80=AFPM <vitaly.prosyak@amd.com> wrote:
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> The current implementation of drm_sched_start uses a hardcoded -ECANCELED=
 to dispose of a job when
> the parent/hw fence is NULL. This results in drm_sched_job_done being cal=
led with -ECANCELED for
> each job with a NULL parent in the pending list, making it difficult to d=
istinguish between recovery
> methods, whether a queue reset or a full GPU reset was used.
>
> To improve this, we first try a soft recovery for timeout jobs and use th=
e error code -ENODATA.
> If soft recovery fails, we proceed with a queue reset, where the error co=
de remains -ENODATA for
> the job. Finally, for a full GPU reset, we use error codes -ECANCELED or =
-ETIME. This patch adds
> an error code parameter to drm_sched_start, allowing us to differentiate =
between queue reset and
> GPU reset failures. This enables user mode and test applications to valid=
ate the expected
> correctness of the requested operation. After a successful queue reset, t=
he only way to continue
> normal operation is to call drm_sched_job_done with the specific error co=
de -ENODATA.
>
> v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_dom=
ain and
>     amdgpu_device_unlock_reset_domain to allow user mode to track the que=
ue reset status and distinguish
>     between queue reset and GPU reset.
> v2: Christian suggested using the error codes -ENODATA for queue reset an=
d -ECANCELED or -ETIME for GPU
>     reset, returned to amdgpu_cs_wait_ioctl.
> v3: To meet the requirements, we introduce a new function drm_sched_start=
_ex with an additional parameter
>     to set dma_fence_set_error, allowing us to handle the specific error =
codes appropriately and dispose
>     of bad jobs with the selected error code depending on whether it was =
a queue reset or GPU reset.
> v4: Alex suggested using a new name, drm_sched_start_with_recovery_error,=
 which more accurately describes
>     the function's purpose. Additionally, it was recommended to add docum=
entation details about the new method.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 30 +++++++++++++++++++++++---
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 7e90c9f95611..c42449358b3f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -671,13 +671,24 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched=
, struct drm_sched_job *bad)
>  EXPORT_SYMBOL(drm_sched_stop);
>
>  /**
> - * drm_sched_start - recover jobs after a reset
> + * drm_sched_start_with_recovery_error - recover jobs after a reset with
> + * custom error
>   *
>   * @sched: scheduler instance
>   * @full_recovery: proceed with complete sched restart
> + * @error : err code for set dma_fence_set_error
> + *
> + * Starts the scheduler and allows setting a custom dma_fence_set_error,
> + * which can be used to identify the recovery mechanism actually used.
>   *
> + * For example:
> + * - If a soft or queue reset was used, dma_fence_set_error is set to -E=
NODATA.
> + * - If an entire GPU reset was used, the error code is set to -ECANCELE=
D.
> + *
> + * This approach enables user mode and test applications to know which
> + * recovery method was used for a given bad job.
>   */
> -void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery=
)
> +void drm_sched_start_with_recovery_error(struct drm_gpu_scheduler *sched=
, bool full_recovery, int error)
>  {
>         struct drm_sched_job *s_job, *tmp;
>         int r;
> @@ -704,7 +715,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched,=
 bool full_recovery)
>                                 DRM_DEV_ERROR(sched->dev, "fence add call=
back failed (%d)\n",
>                                           r);
>                 } else
> -                       drm_sched_job_done(s_job, -ECANCELED);
> +                       drm_sched_job_done(s_job, error);
>         }
>
>         if (full_recovery)
> @@ -712,6 +723,19 @@ void drm_sched_start(struct drm_gpu_scheduler *sched=
, bool full_recovery)
>
>         drm_sched_wqueue_start(sched);
>  }
> +EXPORT_SYMBOL(drm_sched_start_with_recovery_error);
> +
> +/**
> + * drm_sched_start - recover jobs after a reset
> + *
> + * @sched: scheduler instance
> + * @full_recovery: proceed with complete sched restart
> + *
> + */
> +void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery=
)
> +{
> +       drm_sched_start_with_recovery_error(sched, full_recovery, -ECANCE=
LED);
> +}
>  EXPORT_SYMBOL(drm_sched_start);
>
>  /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..444fa6761590 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -580,6 +580,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *=
sched);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_jo=
b *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery=
);
> +void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recov=
ery, int error);

drm_sched_start_with_recovery_error()

Alex

>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
>  void drm_sched_reset_karma(struct drm_sched_job *bad);
> --
> 2.25.1
>
