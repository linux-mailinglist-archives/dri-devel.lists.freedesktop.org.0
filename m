Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7193B717
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 20:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1810E79D;
	Wed, 24 Jul 2024 18:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WdhsmPW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5078610E79D;
 Wed, 24 Jul 2024 18:55:36 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70d2d7e692eso120606b3a.0; 
 Wed, 24 Jul 2024 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721847336; x=1722452136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8ZcPhyuuVkQylyVbSPVZY+MB/Sfwkm8yVypgbJEqJE=;
 b=WdhsmPW81BXJPvcmFV46jYePXR3oC21c5urO+VfuEuvHDEn+AUauWYIJHS+jsSAPj1
 UnqBAgjrAfHEW5G0tnzZWR/jS2bUKG/Mbsk+OlhmuRLlHWOKCL9E/DDVPpn11buU8ket
 KSKMPV1GSzfonflNhXoeIdf2DCrpT7t409Pg046hEG6fF5YtH3FrJWRXl0Gc/lZ0sNk/
 XoISyZ+xO6NtlcFF7S28QH9yaRqlx+8//odFb63FwLdV1F/6Il6iGW/l/TV6QuC2nDUX
 3ZesF2huz6zr3qeLrUfg6TPz5Uq6y9PAMcGN4WCJL8lotrs+wbgoGI/P9J/O8wjUKVeb
 1Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721847336; x=1722452136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8ZcPhyuuVkQylyVbSPVZY+MB/Sfwkm8yVypgbJEqJE=;
 b=uIeS4XN40R0MrRuNooJCZXVj3TaH8Wuwnl+lh2W1qw0v9f330GQ2cmtAijR4YG42A0
 gZrYxPOu5sStL1P4tVWqj5U2lCbN8rnzW6UG7GmvXaVEKyqQde9XscNBDlIrscWlXNi8
 XRLsqOGtFqa1jZNgOds+TnFmStnof6iTaHmRhZhZuGpKaNG4atdbcfo9d+kAAKtYA7ge
 dQ6NYcFt1vb16IRN0IKcZFRNJ+DyuCMoL8bwafOptixwTbNQia2Ks/ng5/d/bnN5pIGB
 1o/VOeg/AJ8KLzceL+8SVW0ehVtjZiG75FEsINXxRFQlup3Ls+MGXPYAg0/d15xFbDth
 tW4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHnEOdn8nrumUFskkY27BRGFvWojF2465ltgVjjcQSryCenpv7cZQg+cWPlqG2hRshvdDQh+5GCVdu2fZyJfJs+uovIetcFYaSzj2qIgZL
X-Gm-Message-State: AOJu0Yy45jq0602sLoUx14IlMSqACV6g033saXCPcg4icAyZhMvhOLoV
 HV0YRd6SG9ZdkBci+d7M0lRqDuJ6adYvXYjOhwnLpSVcHSh/QNdzHqAxxwDAzZInOqmejqy6goe
 zvQBLClpV9f7e2O57xRsdNfuSrxA=
X-Google-Smtp-Source: AGHT+IEZkTxiVgRL75Jo4/2DH2H2JytMia3rJQU5B7noVJxcYgAT01Hfhvmi6Cwpw2cLpo7oZbvdc8rYTmVic2oJD8Y=
X-Received: by 2002:a05:6a00:2e19:b0:704:1c78:4f8a with SMTP id
 d2e1a72fcca58-70eaa909c4fmr527100b3a.21.1721847335592; Wed, 24 Jul 2024
 11:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240724184340.183606-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240724184340.183606-1-vitaly.prosyak@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jul 2024 14:55:23 -0400
Message-ID: <CADnq5_Naa-ATqDemiVf4GFxP-YHEXy371oDafw_AwMcNObL3JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Add error code parameter to drm_sched_start
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

On Wed, Jul 24, 2024 at 2:43=E2=80=AFPM <vitaly.prosyak@amd.com> wrote:
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> The current implementation of drm_sched_start uses a hardcoded -ECANCELED=
 to dispose of a job when
> the parent/hw fence is NULL. This results in drm_sched_job_done being cal=
led with -ECANCELED for
> each job with a NULL parent in the pending list, making it difficult to d=
istinguish between recovery
> methods, whether a queue reset or a full GPU reset was used. To improve t=
his, we first try a soft
> recovery for timeout jobs and use the error code -ENODATA. If soft recove=
ry fails, we proceed with
> a queue reset, where the error code would still be -ENODATA for the job. =
Finally, for a full GPU
> reset, we use error codes -ECANCELED or -ETIME. This patch adds an error =
code parameter to
> drm_sched_start, allowing us to differentiate between queue reset and GPU=
 reset failures.
> This enables user mode and test applications to validate the expected cor=
rectness of the requested
> operation. After a successful queue reset, the only way to continue norma=
l operation is to call
> drm_sched_job_done with the specific error code -ENODATA.
>
> v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_dom=
ain and
>     amdgpu_device_unlock_reset_domain to allow user mode to track the que=
ue reset status
>     and distinguish between queue reset and GPU reset.
> v2: Christian suggested using the error codes -ENODATA for queue reset an=
d -ECANCELED or
>     -ETIME for GPU reset, returned to amdgpu_cs_wait_ioctl.
> v3: To meet the requirements, we introduce a new function drm_sched_start=
_ex with an additional
>     parameter to set dma_fence_set_error, allowing us to handle the speci=
fic error codes
>     appropriately and dispose of bad jobs with the selected error code de=
pending on whether
>     it was a queue reset or GPU reset.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++---
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 7e90c9f95611..5a534772335a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -671,13 +671,14 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched=
, struct drm_sched_job *bad)
>  EXPORT_SYMBOL(drm_sched_stop);
>
>  /**
> - * drm_sched_start - recover jobs after a reset
> + * drm_sched_start_ex - recover jobs after a reset
>   *
>   * @sched: scheduler instance
>   * @full_recovery: proceed with complete sched restart
> + * @error : err code for set dma_fence_set_error
>   *
>   */
> -void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery=
)
> +void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recov=
ery, int error)

How about calling this drm_sched_start_with_recovery_error() or
similar?  drm_sched_start_ex() is not super clear.

Also, add some information to the function documentation above to
describe when and why you'd want to specify separate error messages.
Something like in your patch description.

Alex

>  {
>         struct drm_sched_job *s_job, *tmp;
>         int r;
> @@ -704,7 +705,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched,=
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
> @@ -712,6 +713,18 @@ void drm_sched_start(struct drm_gpu_scheduler *sched=
, bool full_recovery)
>
>         drm_sched_wqueue_start(sched);
>  }
> +EXPORT_SYMBOL(drm_sched_start_ex);
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
> +       drm_sched_start_ex(sched, full_recovery, -ECANCELED);
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
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
>  void drm_sched_reset_karma(struct drm_sched_job *bad);
> --
> 2.25.1
>
