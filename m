Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39047EE6FB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B261510E663;
	Thu, 16 Nov 2023 18:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168EA10E663
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:46:20 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ce2b6cb933so610024a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700160379; x=1700765179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Ij6FJmmatflmja8mN17GVCK+m9WuOEzoMab7pNTpHo=;
 b=bRwv5ZAs9U8WfFaZLHEeSb62fvSe0l6EhP+5xOyq/rEPLNwHDPve3KPwa4hDLOagod
 FbN5gbB5PzAZXKnbxXKRV0vxix1Qtf+r37lTrzVZz59zGJszXCVl8B4cHS00c4lUhfNo
 v81YeVQq5azM22wsugJ7JYjm61joiDvDplwKtEvzB2DbmLdJ8cpBqWlKJZyLkGYpT4Xs
 2GNND0czYwCY1VTwkJqzT8sm5ijwiNiYP1PMnA/JjcXFHGSxk2GNlUq4vCwrhFN+RrM+
 Q/S3CF5++TQLYiIHAsJmqTV4VVwdVCwFcH2cKN9+jZmgBxrEpCyNFRhCi44rKafWBPpk
 xLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700160379; x=1700765179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Ij6FJmmatflmja8mN17GVCK+m9WuOEzoMab7pNTpHo=;
 b=PVP+NG8TyqmBIfpQ9djo34wzZ1moGEMzOmIyzPSW91+g1SBFgSmFZX5H/hSbwTQjud
 5Ftf4Q9qn1i/I2ZhMsY22JIDZjS1ywk58FbCq/qSbFjGerTyqJXew1AOfRJxibevdit1
 uD39tRTYmXTtg1Y7j1fa7Q7semCs5gc6EnoYcVNRiAkMhWK/2Tqs70pmXMqHryY5U5vW
 MJVOTfwnBoA+UApTytxv+vAWBC++gDEbIFDijRRSEO/evdJODnJ0HmQazuswbZJOTb3i
 9oYgiWWPI6HCxmJvloC43mPyKrVFfrwBw0mtVj59DplLW4ZKd8gGKrC4fgzOAaA2ETqP
 9JIg==
X-Gm-Message-State: AOJu0YxsefQuaTi9HZnoX60mcRNeOVBGxHAZNUskPWZolwUA0IVwfE3M
 V/N5PQa/7ZpgckmRfzCjboj7ssr4So7+sG4aRgc=
X-Google-Smtp-Source: AGHT+IF4jnYF56TYbVAwmAHUvx3WWOMa0LR+VIgKPVJpxX9+FG07R5njqnvnnJiv2m0pnCSVnbo3SVW1dQFoUATAcF0=
X-Received: by 2002:a05:6871:328e:b0:1ef:bf3a:3bed with SMTP id
 mp14-20020a056871328e00b001efbf3a3bedmr22981253oac.46.1700160379205; Thu, 16
 Nov 2023 10:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20231116141547.206695-1-christian.koenig@amd.com>
 <20231116141547.206695-2-christian.koenig@amd.com>
In-Reply-To: <20231116141547.206695-2-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 13:46:08 -0500
Message-ID: <CADnq5_P=JYoz7KQ-SW7qVJVdEDx3yPxgiX+qeauUSfEq-8DQsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/scheduler: improve timedout_job wording a bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: matthew.brost@intel.com, ltuikov89@gmail.com,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 dakr@redhat.com, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 9:32=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Drop the reference to the deprecated re-submission of jobs.
>
> Mention that it isn't the job which times out, but the hardware fence.
> Mention that drivers can try a context based reset as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/drm/gpu_scheduler.h | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1d60eab747de..ac1d7222f5b2 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -418,8 +418,8 @@ struct drm_sched_backend_ops {
>         struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>
>         /**
> -        * @timedout_job: Called when a job has taken too long to execute=
,
> -        * to trigger GPU recovery.
> +        * @timedout_job: Called when a hardware fence didn't signal in a
> +        * configurable amount of time to trigger GPU recovery.
>          *
>          * This method is called in a workqueue context.
>          *
> @@ -430,9 +430,8 @@ struct drm_sched_backend_ops {
>          *    scheduler thread and cancel the timeout work, guaranteeing =
that
>          *    nothing is queued while we reset the hardware queue
>          * 2. Try to gracefully stop non-faulty jobs (optional)
> -        * 3. Issue a GPU reset (driver-specific)
> -        * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> -        * 5. Restart the scheduler using drm_sched_start(). At that poin=
t, new
> +        * 3. Issue a GPU or context reset (driver-specific)
> +        * 4. Restart the scheduler using drm_sched_start(). At that poin=
t, new
>          *    jobs can be queued, and the scheduler thread is unblocked
>          *
>          * Note that some GPUs have distinct hardware queues but need to =
reset
> @@ -448,16 +447,14 @@ struct drm_sched_backend_ops {
>          * 2. Try to gracefully stop non-faulty jobs on all queues impact=
ed by
>          *    the reset (optional)
>          * 3. Issue a GPU reset on all faulty queues (driver-specific)
> -        * 4. Re-submit jobs on all schedulers impacted by the reset usin=
g
> -        *    drm_sched_resubmit_jobs()
> -        * 5. Restart all schedulers that were stopped in step #1 using
> +        * 4. Restart all schedulers that were stopped in step #1 using
>          *    drm_sched_start()
>          *
>          * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
>          * and the underlying driver has started or completed recovery.
>          *
>          * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> -        * available, i.e. has been unplugged.
> +        * available, i.e. has been unplugged or failed to recover.
>          */
>         enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sch=
ed_job);
>
> --
> 2.34.1
>
