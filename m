Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB6AD9737
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 23:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5440E10E9BE;
	Fri, 13 Jun 2025 21:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nhvB1Swl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2310010EA62;
 Fri, 13 Jun 2025 21:15:34 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-31305ee3281so345697a91.0; 
 Fri, 13 Jun 2025 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749849333; x=1750454133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJeMTJLsPpoZ526pz4G9wjeN6mu4hd8USxzTK4H8xRE=;
 b=nhvB1SwlH3prvAFBpDYrzecGeZw4fjw5qR/iLBDtztDEw/8h4Z4q8GYOraElANXTRA
 kd0DhTTBmR89jhbUk94AhJA7uJHxGwEsl+VbRWb0tZ+eEoDwyuQaAGwvy79rP2XO9mnx
 H/b4T81lzFLbhyBUMAZJLujTUyUMpKj39P2lG2CyVrAiRqmTijsAy1IKHwffsrS3EgEU
 h0QoNSux/cB6mFL2jHB3CgzIq7ZITQIofJfnCH/BPpS/iPGmCA8wNUuH4KtoySO8M9AF
 1SeCsq44EeN/L00F2RwvoqT6pNAnTacV0Om/5PSAYpoWNqtFB/nAKhKinenOZ9Xuiy+k
 0elA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749849333; x=1750454133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJeMTJLsPpoZ526pz4G9wjeN6mu4hd8USxzTK4H8xRE=;
 b=i56mfZ0TcRhoZMCSM1I6bKhl6/csDaxo0i6iNXvxIlUEAzEBima0aCfTvQfDarDo2d
 qyPlcj3vwKVpRNFG1EqhZKAbA8Yq3u7nytlFMMGcWPZ8m7qu/jsLHPOrKkL/JmV9g7BV
 CKHoFeOxt6fOXZByXOXNyKzl32aMHNwMNrX4dq9CVUbNQjyLwIMXxOc1UvVdocE5MZ6w
 nmUvvdhgMOANTvepfWc5mAuin64jL/e6mEphX5R2vebPqKz8LpdkAYyQywZRbyAIircn
 RItpqtfCpUc8CSXj6qvVLfrFstedE1YFhU/p2AR30z0rgcGpFJD1Bu+B/YuEWd6hP58d
 BYLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+tVtEZxqPTDrURhsflAq+yTk7DdrwLeN1t+6Mtr13u/yJzqzfdkCCrRrRMhmtPlttQHzGs9V1dA4=@lists.freedesktop.org,
 AJvYcCWmxtVn7AwH4FqH30lwn0VZZcpcQP3cF7nbkEqkCn1KpST1NYwCptkHr4jGXR5wq13qaz357JPzFQ/V@lists.freedesktop.org,
 AJvYcCXEzbUu9oLU6ftTPFmLG/HJAbnvTg54asdoatMztUAQAvvNjhZyg5mv9UYTPsd+99+vjR/HrMPx@lists.freedesktop.org,
 AJvYcCXdLDldP/EAuucoOdudpeLX9crHVD6tlvcFemVX8ZT15532Gt1qqOzNEDCApbeu/qP5MC3lfiZvAFcl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS4+qVpIcpGwjRveEkFosMZwZ1sQnRBzd9FAKnWcJ/e6hEF9lR
 aiPpMQyeeaiSME9F+GJF3WBzExELGrLB0BCwnMXiY48cmsJ4UhnYxnWyWktFsRPlXCpYMuqlFp/
 wkuHPSuK9Le+NJN3vy50AtVxBlU32Ms0=
X-Gm-Gg: ASbGncscJhWOmbeiyh3u9BlHSZCp27pqSHmc1Hxdu/+9mJPRLfi7yZlioNlNVgvAJ/e
 eiOl8CqywGopYX8H9SWHejIVWa86CGUiPvaPOlKl0Atu1f2Fhu2azkTy4VlbbLtZbJtCGMDCmno
 lpAZDsyUA5ZgT7qV4X2clepJKpgGIcnq/TvI1PW/Q58LbZ
X-Google-Smtp-Source: AGHT+IHMT3b9RhDq7DF8jswCxgr7d6mN06Y+VZ295k/pxhswWy2GEgZljwDgGAjGkhSqJ52I/CPau3enKG4QcEJoUN4=
X-Received: by 2002:a17:90b:1ccc:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-313f1de6397mr560326a91.7.1749849333444; Fri, 13 Jun 2025
 14:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
 <20250613184348.1761020-6-andrealmeid@igalia.com>
In-Reply-To: <20250613184348.1761020-6-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Jun 2025 17:15:22 -0400
X-Gm-Features: AX0GCFtXwnYDqJL1urtZKmWiIecz2HQesv_xT39ZwFVUqF0ZLp2XZp7Mg7Xy3no
Message-ID: <CADnq5_PsERbdVyLfQMAMDu4cdy9u7YWXXrT-_GGRJ5Tv55JZdg@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch, 
 Raag Jadav <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, 
 Xaver Hugl <xaver.hugl@gmail.com>, Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
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

On Fri, Jun 13, 2025 at 2:44=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> To notify userspace about which task (if any) made the device get in a
> wedge state, make use of drm_wedge_task_info parameter, filling it with
> the task PID and name.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

If you want the guilty state to be reliably correct for GC, you'll
need this patch:
https://lists.freedesktop.org/archives/amd-gfx/2025-June/125715.html
GC is pipelined, so the hardware will start working on subsequent jobs
before prior submissions are complete.  This can lead to subsequent
jobs causing a hang which gets attributed to a prior job.  With that
patch in place, the driver will force a fence wait between jobs from
different contexts to ensure they are serialized.

Alex

> ---
> v7:
>  - Remove struct cast, now we can use `info =3D &ti->task`
>  - Fix struct lifetime, move amdgpu_vm_put_task_info() after
>    drm_dev_wedged_event() call
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 17 +++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  8 ++++++--
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 8a0f36f33f13..67cff53678e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6363,8 +6363,21 @@ int amdgpu_device_gpu_recover(struct amdgpu_device=
 *adev,
>
>         atomic_set(&adev->reset_domain->reset_res, r);
>
> -       if (!r)
> -               drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVER=
Y_NONE, NULL);
> +       if (!r) {
> +               struct drm_wedge_task_info *info =3D NULL;
> +               struct amdgpu_task_info *ti =3D NULL;
> +
> +               if (job) {
> +                       ti =3D amdgpu_vm_get_task_info_pasid(adev, job->p=
asid);
> +                       if (ti)
> +                               info =3D &ti->task;
> +               }
> +
> +               drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVER=
Y_NONE, info);
> +
> +               if (ti)
> +                       amdgpu_vm_put_task_info(ti);
> +       }
>
>         return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index 0c1381b527fe..f061f691f556 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(stru=
ct drm_sched_job *s_job)
>  {
>         struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
>         struct amdgpu_job *job =3D to_amdgpu_job(s_job);
> +       struct drm_wedge_task_info *info =3D NULL;
>         struct amdgpu_task_info *ti;
>         struct amdgpu_device *adev =3D ring->adev;
>         int idx;
> @@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(st=
ruct drm_sched_job *s_job)
>         ti =3D amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>         if (ti) {
>                 amdgpu_vm_print_task_info(adev, ti);
> -               amdgpu_vm_put_task_info(ti);
> +               info =3D &ti->task;
>         }
>
>         /* attempt a per ring reset */
> @@ -164,13 +165,16 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(=
struct drm_sched_job *s_job)
>                         if (amdgpu_ring_sched_ready(ring))
>                                 drm_sched_start(&ring->sched, 0);
>                         dev_err(adev->dev, "Ring %s reset succeeded\n", r=
ing->sched.name);
> -                       drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE=
_RECOVERY_NONE, NULL);
> +                       drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE=
_RECOVERY_NONE, info);
>                         goto exit;
>                 }
>                 dev_err(adev->dev, "Ring %s reset failure\n", ring->sched=
.name);
>         }
>         dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>
> +       if (ti)
> +               amdgpu_vm_put_task_info(ti);
> +
>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>                 struct amdgpu_reset_context reset_context;
>                 memset(&reset_context, 0, sizeof(reset_context));
> --
> 2.49.0
>
