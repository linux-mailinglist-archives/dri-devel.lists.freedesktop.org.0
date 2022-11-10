Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C1624ADD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 20:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ECD10E7FC;
	Thu, 10 Nov 2022 19:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E9B10E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 19:45:32 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s206so2927283oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 11:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvDbvV2wztBzEfjlgTKqJV15fLGvO1RAEwhRrtfCkVc=;
 b=k5kxuaeK+sUkrG3Bv8AqMmGJ2o4qumJ8qyBxlL8t1plUh0Hi2wVejPT/72DanZgH4f
 HULZNFTGVgk2hUGSMizeNCCrKFyze2sfHXlFbbWf67bwDEe6HE0spkhTrhLh9AgFWyhB
 fSqgzC2QgY6MB126Vfo+5wfBFGGsZRPl3CFNoXvlRnQfJRKYvv3x+9QBMySw74idJCkS
 9KjnJ4sdG8nlMJLMMY5Vc3qDo2eZLPwLRGPizLrIeIqbRO92MiJdpzpFGtl00TYYS8IF
 zPN5DgoxyEwRh6J+wHTsIbtdss0lToV0r0Ku045csr9WSkNH662pdpafn9X9FK0kbL1w
 t6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvDbvV2wztBzEfjlgTKqJV15fLGvO1RAEwhRrtfCkVc=;
 b=prBOSxYRmOM/TJb7xNoyJk3P+UClspS/RC7x4pXj6GX1cdrrBA4KLr6kPY+qsREq1S
 WGzPmrQO4s3I6gGfEmFWiH1XgrY6Pa4x9CfyxVF4HTH88mzsSELjMJWKCxwaOafqB6Ay
 PlvVSkGpDmFrdkeTAve7PMFSls7lHpbvSdmO/mB7DXeoe05hcJ1Xi0aU6e60/Tsu1OkT
 aLhyVThTIedN7Pznt9MyeHFj5i5d35xB/qZA/fLu/s1e7JzZIXS0M+QNj0uitCgy3Z7w
 vYZjfh+g7WRfy4sSdJ/x0vXl46/SrDeoygEAgQanflZzEPmoOKQVWwTmLeG0NnPlShQ0
 5t4Q==
X-Gm-Message-State: ACrzQf0sThdX+h8Bc+hf6ypMSXkt8+xFsm3Ov3UZHl6oxtD6Q0ZJ6QFg
 K4AiaEGc6wTSzgHmAxr++XQaTAqUh639mLLSoaz1j0ei
X-Google-Smtp-Source: AMsMyM5WdC5XHmlXC+77MK0YKOLASPHAhOX2HUt6VOV/rsZxDGF5mIRCvRFB7cn+wAve/oo1DIe1cCFB0aM4+xENlzs=
X-Received: by 2002:a05:6808:171b:b0:357:670f:9e4e with SMTP id
 bc27-20020a056808171b00b00357670f9e4emr2023536oib.46.1668109531454; Thu, 10
 Nov 2022 11:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20221109095010.141189-1-christian.koenig@amd.com>
In-Reply-To: <20221109095010.141189-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 14:45:19 -0500
Message-ID: <CADnq5_MhR8EET3pKs5cgzXf4iyBfVvnANEjmcwK-SbE=PgE8og@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/amd/amdgpu revert "implement tdr advanced mode"
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
Cc: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some comments on patch 3.  With that addressed, the series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Nov 9, 2022 at 4:50 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This reverts commit e6c6338f393b74ac0b303d567bb918b44ae7ad75.
>
> This feature basically re-submits one job after another to
> figure out which one was the one causing a hang.
>
> This is obviously incompatible with gang-submit which requires
> that multiple jobs run at the same time. It's also absolutely
> not helpful to crash the hardware multiple times if a clean
> recovery is desired.
>
> For testing and debugging environments we should rather disable
> recovery alltogether to be able to inspect the state with a hw
> debugger.
>
> Additional to that the sw implementation is clearly buggy and causes
> reference count issues for the hardware fence.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 103 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c     |  58 ++----------
>  include/drm/gpu_scheduler.h                |   3 -
>  4 files changed, 10 insertions(+), 156 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 5b9f992e4607..0da55fd97df8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5077,94 +5077,6 @@ static int amdgpu_device_suspend_display_audio(str=
uct amdgpu_device *adev)
>         return 0;
>  }
>
> -static void amdgpu_device_recheck_guilty_jobs(
> -       struct amdgpu_device *adev, struct list_head *device_list_handle,
> -       struct amdgpu_reset_context *reset_context)
> -{
> -       int i, r =3D 0;
> -
> -       for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> -               struct amdgpu_ring *ring =3D adev->rings[i];
> -               int ret =3D 0;
> -               struct drm_sched_job *s_job;
> -
> -               if (!ring || !ring->sched.thread)
> -                       continue;
> -
> -               s_job =3D list_first_entry_or_null(&ring->sched.pending_l=
ist,
> -                               struct drm_sched_job, list);
> -               if (s_job =3D=3D NULL)
> -                       continue;
> -
> -               /* clear job's guilty and depend the folowing step to dec=
ide the real one */
> -               drm_sched_reset_karma(s_job);
> -               drm_sched_resubmit_jobs_ext(&ring->sched, 1);
> -
> -               if (!s_job->s_fence->parent) {
> -                       DRM_WARN("Failed to get a HW fence for job!");
> -                       continue;
> -               }
> -
> -               ret =3D dma_fence_wait_timeout(s_job->s_fence->parent, fa=
lse, ring->sched.timeout);
> -               if (ret =3D=3D 0) { /* timeout */
> -                       DRM_ERROR("Found the real bad job! ring:%s, job_i=
d:%llx\n",
> -                                               ring->sched.name, s_job->=
id);
> -
> -
> -                       amdgpu_fence_driver_isr_toggle(adev, true);
> -
> -                       /* Clear this failed job from fence array */
> -                       amdgpu_fence_driver_clear_job_fences(ring);
> -
> -                       amdgpu_fence_driver_isr_toggle(adev, false);
> -
> -                       /* Since the job won't signal and we go for
> -                        * another resubmit drop this parent pointer
> -                        */
> -                       dma_fence_put(s_job->s_fence->parent);
> -                       s_job->s_fence->parent =3D NULL;
> -
> -                       /* set guilty */
> -                       drm_sched_increase_karma(s_job);
> -                       amdgpu_reset_prepare_hwcontext(adev, reset_contex=
t);
> -retry:
> -                       /* do hw reset */
> -                       if (amdgpu_sriov_vf(adev)) {
> -                               amdgpu_virt_fini_data_exchange(adev);
> -                               r =3D amdgpu_device_reset_sriov(adev, fal=
se);
> -                               if (r)
> -                                       adev->asic_reset_res =3D r;
> -                       } else {
> -                               clear_bit(AMDGPU_SKIP_HW_RESET,
> -                                         &reset_context->flags);
> -                               r =3D amdgpu_do_asic_reset(device_list_ha=
ndle,
> -                                                        reset_context);
> -                               if (r && r =3D=3D -EAGAIN)
> -                                       goto retry;
> -                       }
> -
> -                       /*
> -                        * add reset counter so that the following
> -                        * resubmitted job could flush vmid
> -                        */
> -                       atomic_inc(&adev->gpu_reset_counter);
> -                       continue;
> -               }
> -
> -               /* got the hw fence, signal finished fence */
> -               atomic_dec(ring->sched.score);
> -               dma_fence_get(&s_job->s_fence->finished);
> -               dma_fence_signal(&s_job->s_fence->finished);
> -               dma_fence_put(&s_job->s_fence->finished);
> -
> -               /* remove node from list and free the job */
> -               spin_lock(&ring->sched.job_list_lock);
> -               list_del_init(&s_job->list);
> -               spin_unlock(&ring->sched.job_list_lock);
> -               ring->sched.ops->free_job(s_job);
> -       }
> -}
> -
>  static inline void amdgpu_device_stop_pending_resets(struct amdgpu_devic=
e *adev)
>  {
>         struct amdgpu_ras *con =3D amdgpu_ras_get_context(adev);
> @@ -5185,7 +5097,6 @@ static inline void amdgpu_device_stop_pending_reset=
s(struct amdgpu_device *adev)
>
>  }
>
> -
>  /**
>   * amdgpu_device_gpu_recover - reset the asic and recover scheduler
>   *
> @@ -5208,7 +5119,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device =
*adev,
>         int i, r =3D 0;
>         bool need_emergency_restart =3D false;
>         bool audio_suspended =3D false;
> -       int tmp_vram_lost_counter;
>         bool gpu_reset_for_dev_remove =3D false;
>
>         gpu_reset_for_dev_remove =3D
> @@ -5354,7 +5264,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device =
*adev,
>                 amdgpu_device_stop_pending_resets(tmp_adev);
>         }
>
> -       tmp_vram_lost_counter =3D atomic_read(&((adev)->vram_lost_counter=
));
>         /* Actual ASIC resets if needed.*/
>         /* Host driver will handle XGMI hive reset for SRIOV */
>         if (amdgpu_sriov_vf(adev)) {
> @@ -5379,18 +5288,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device=
 *adev,
>         /* Post ASIC reset for all devs .*/
>         list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
>
> -               /*
> -                * Sometimes a later bad compute job can block a good gfx=
 job as gfx
> -                * and compute ring share internal GC HW mutually. We add=
 an additional
> -                * guilty jobs recheck step to find the real guilty job, =
it synchronously
> -                * submits and pends for the first job being signaled. If=
 it gets timeout,
> -                * we identify it as a real guilty job.
> -                */
> -               if (amdgpu_gpu_recovery =3D=3D 2 &&
> -                       !(tmp_vram_lost_counter < atomic_read(&adev->vram=
_lost_counter)))
> -                       amdgpu_device_recheck_guilty_jobs(
> -                               tmp_adev, device_list_handle, reset_conte=
xt);
> -
>                 for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
>                         struct amdgpu_ring *ring =3D tmp_adev->rings[i];
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 8e97e95aca8c..a6820603214f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -519,7 +519,7 @@ module_param_named(compute_multipipe, amdgpu_compute_=
multipipe, int, 0444);
>   * DOC: gpu_recovery (int)
>   * Set to enable GPU recovery mechanism (1 =3D enable, 0 =3D disable). T=
he default is -1 (auto, disabled except SRIOV).
>   */
> -MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (2 =3D ad=
vanced tdr mode, 1 =3D enable, 0 =3D disable, -1 =3D auto)");
> +MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 =3D en=
able, 0 =3D disable, -1 =3D auto)");
>  module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>
>  /**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 68317d3a7a27..e77e1fd16732 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -355,27 +355,6 @@ static void drm_sched_job_timedout(struct work_struc=
t *work)
>         }
>  }
>
> - /**
> -  * drm_sched_increase_karma - Update sched_entity guilty flag
> -  *
> -  * @bad: The job guilty of time out
> -  *
> -  * Increment on every hang caused by the 'bad' job. If this exceeds the=
 hang
> -  * limit of the scheduler then the respective sched entity is marked gu=
ilty and
> -  * jobs from it will not be scheduled further
> -  */
> -void drm_sched_increase_karma(struct drm_sched_job *bad)
> -{
> -       drm_sched_increase_karma_ext(bad, 1);
> -}
> -EXPORT_SYMBOL(drm_sched_increase_karma);
> -
> -void drm_sched_reset_karma(struct drm_sched_job *bad)
> -{
> -       drm_sched_increase_karma_ext(bad, 0);
> -}
> -EXPORT_SYMBOL(drm_sched_reset_karma);
> -
>  /**
>   * drm_sched_stop - stop the scheduler
>   *
> @@ -516,32 +495,15 @@ EXPORT_SYMBOL(drm_sched_start);
>   *
>   */
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
> -{
> -       drm_sched_resubmit_jobs_ext(sched, INT_MAX);
> -}
> -EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> -
> -/**
> - * drm_sched_resubmit_jobs_ext - helper to relunch certain number of job=
s from mirror ring list
> - *
> - * @sched: scheduler instance
> - * @max: job numbers to relaunch
> - *
> - */
> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int ma=
x)
>  {
>         struct drm_sched_job *s_job, *tmp;
>         uint64_t guilty_context;
>         bool found_guilty =3D false;
>         struct dma_fence *fence;
> -       int i =3D 0;
>
>         list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) =
{
>                 struct drm_sched_fence *s_fence =3D s_job->s_fence;
>
> -               if (i >=3D max)
> -                       break;
> -
>                 if (!found_guilty && atomic_read(&s_job->karma) > sched->=
hang_limit) {
>                         found_guilty =3D true;
>                         guilty_context =3D s_job->s_fence->scheduled.cont=
ext;
> @@ -551,7 +513,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_sched=
uler *sched, int max)
>                         dma_fence_set_error(&s_fence->finished, -ECANCELE=
D);
>
>                 fence =3D sched->ops->run_job(s_job);
> -               i++;
>
>                 if (IS_ERR_OR_NULL(fence)) {
>                         if (IS_ERR(fence))
> @@ -567,7 +528,7 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_sched=
uler *sched, int max)
>                 }
>         }
>  }
> -EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> +EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>
>  /**
>   * drm_sched_job_init - init a scheduler job
> @@ -1082,13 +1043,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sch=
ed)
>  EXPORT_SYMBOL(drm_sched_fini);
>
>  /**
> - * drm_sched_increase_karma_ext - Update sched_entity guilty flag
> + * drm_sched_increase_karma - Update sched_entity guilty flag
>   *
>   * @bad: The job guilty of time out
> - * @type: type for increase/reset karma
>   *
> + * Increment on every hang caused by the 'bad' job. If this exceeds the =
hang
> + * limit of the scheduler then the respective sched entity is marked gui=
lty and
> + * jobs from it will not be scheduled further
>   */
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
> +void drm_sched_increase_karma(struct drm_sched_job *bad)
>  {
>         int i;
>         struct drm_sched_entity *tmp;
> @@ -1100,10 +1063,7 @@ void drm_sched_increase_karma_ext(struct drm_sched=
_job *bad, int type)
>          * corrupt but keep in mind that kernel jobs always considered go=
od.
>          */
>         if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
> -               if (type =3D=3D 0)
> -                       atomic_set(&bad->karma, 0);
> -               else if (type =3D=3D 1)
> -                       atomic_inc(&bad->karma);
> +               atomic_inc(&bad->karma);
>
>                 for (i =3D DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY=
_KERNEL;
>                      i++) {
> @@ -1114,7 +1074,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_=
job *bad, int type)
>                                 if (bad->s_fence->scheduled.context =3D=
=3D
>                                     entity->fence_context) {
>                                         if (entity->guilty)
> -                                               atomic_set(entity->guilty=
, type);
> +                                               atomic_set(entity->guilty=
, 1);
>                                         break;
>                                 }
>                         }
> @@ -1124,4 +1084,4 @@ void drm_sched_increase_karma_ext(struct drm_sched_=
job *bad, int type)
>                 }
>         }
>  }
> -EXPORT_SYMBOL(drm_sched_increase_karma_ext);
> +EXPORT_SYMBOL(drm_sched_increase_karma);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 289a33e80639..156601fd7053 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -497,10 +497,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sche=
d);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_jo=
b *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery=
);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int ma=
x);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
> -void drm_sched_reset_karma(struct drm_sched_job *bad);
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
>  bool drm_sched_dependency_optimized(struct dma_fence* fence,
>                                     struct drm_sched_entity *entity);
>  void drm_sched_fault(struct drm_gpu_scheduler *sched);
> --
> 2.34.1
>
