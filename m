Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F67E7624
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259D189E1A;
	Fri, 10 Nov 2023 00:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9E289E1A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:57:57 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4ac0d137835so640784e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699577876; x=1700182676; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DukClVk5jOpMQzoIDzI08rkM3v9ww6znid2Duj+48hk=;
 b=hKEq/thyad0Hmgn5QrIJf2UXw/yqXm0waeShfdt3ZP4W+x2EJ0D+r0+J7wcdketKin
 1AVdSUhTfxdYzJ8QxtPuAaeeKU80aF4WnFufaTgv+myHp6yAbVJDMwprnJWo49nKP3K/
 CZtzRpyxCY+RYyj6sF/2RWNRWdPkWg/mzSZ+OdbNNnwEzFjpYwhg8hDgUEqHEi2dnIx2
 f7L67QbFxekt/azVB2aiKfpmRohVIbKmVXsQRjg7sNX9vWxFF73M5mlThdwRbyWH2zSQ
 SdsMnMYhDrRNnL8iLVNbflzbUOr6iHvme/ec0VVP1iHYxRdc1tIMsYvfBoEj99zBOGaI
 jWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699577876; x=1700182676;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DukClVk5jOpMQzoIDzI08rkM3v9ww6znid2Duj+48hk=;
 b=VWQQw/XpTFMmdhksqq3aepsDb6uAt6GxVp5PZ8XL/2j7G7JXWJQCwrBEOheuFxKcwy
 htV10hnq/tIvi07iIPVgIECXtRiNyWHzKZYnXrC06qMaJOKLbkd6xwbNyb0s3k0190Z/
 7qCSclWTOKHRt5lNPxVAVMKn37ngO2UaELcGx0s20vedVH2ObOBgc24Q61EUqhMd3mXO
 ehg4S7M1wyNumhavrc2lnGLLqwWPig+u0ulWkdveG4ItReB7M2DZuhhbaadwBvMttdL1
 ArhmT8tczA/hdVkDa8yTuMA2XJh1vKYIXJNneLPlsjr1ctyNZ6NKCjPXRz8yvkKN307N
 S2bQ==
X-Gm-Message-State: AOJu0YyxGeHVSIOO+cF6awNAehrlNSKiDc+bcDDRybgUWtfvcrMLXu5D
 JzYa1LIRGqPWTTA4/i9OQSA=
X-Google-Smtp-Source: AGHT+IF4zIYRSHdUYINd+0xl76vsNfoebCj4rw8abVOgod8m2cZ1BYsaA20+rGRV5Uy6oDQz29KuOg==
X-Received: by 2002:a67:e0ce:0:b0:457:4645:a339 with SMTP id
 m14-20020a67e0ce000000b004574645a339mr6324183vsl.1.1699577875763; 
 Thu, 09 Nov 2023 16:57:55 -0800 (PST)
Received: from [192.168.2.14]
 (bras-base-toroon0964w-grc-76-76-65-20-140.dsl.bell.ca. [76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 y19-20020ad457d3000000b0066d1d860cd1sm2532859qvx.19.2023.11.09.16.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:57:55 -0800 (PST)
Message-ID: <e2ec5036-81bd-490b-bdc2-fc215e14b8b1@gmail.com>
Date: Thu, 9 Nov 2023 19:57:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH drm-misc-next v6] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
References: <20231110001638.71750-1-dakr@redhat.com>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20231110001638.71750-1-dakr@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oOhOyPgoTezSESlsGaIESgyn"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oOhOyPgoTezSESlsGaIESgyn
Content-Type: multipart/mixed; boundary="------------tLUShj34RXgfSenCiDzxFe0g";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <e2ec5036-81bd-490b-bdc2-fc215e14b8b1@gmail.com>
Subject: Re: [PATCH drm-misc-next v6] drm/sched: implement dynamic job-flow
 control
References: <20231110001638.71750-1-dakr@redhat.com>
In-Reply-To: <20231110001638.71750-1-dakr@redhat.com>

--------------tLUShj34RXgfSenCiDzxFe0g
Content-Type: multipart/mixed; boundary="------------Nc98jHbo1HELFfi06ZVNoyyc"

--------------Nc98jHbo1HELFfi06ZVNoyyc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-09 19:16, Danilo Krummrich wrote:
> Currently, job flow control is implemented simply by limiting the numbe=
r
> of jobs in flight. Therefore, a scheduler is initialized with a credit
> limit that corresponds to the number of jobs which can be sent to the
> hardware.
>=20
> This implies that for each job, drivers need to account for the maximum=

> job size possible in order to not overflow the ring buffer.
>=20
> However, there are drivers, such as Nouveau, where the job size has a
> rather large range. For such drivers it can easily happen that job
> submissions not even filling the ring by 1% can block subsequent
> submissions, which, in the worst case, can lead to the ring run dry.
>=20
> In order to overcome this issue, allow for tracking the actual job size=

> instead of the number of jobs. Therefore, add a field to track a job's
> credit count, which represents the number of credits a job contributes
> to the scheduler's credit limit.
>=20
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> Changes in V2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - fixed up influence on scheduling fairness due to consideration of a=
 job's
>     size
>     - If we reach a ready entity in drm_sched_select_entity() but can't=
 actually
>       queue a job from it due to size limitations, just give up and go =
to sleep
>       until woken up due to a pending job finishing, rather than contin=
ue to try
>       other entities.
>   - added a callback to dynamically update a job's credits (Boris)
>   - renamed 'units' to 'credits'
>   - fixed commit message and comments as requested by Luben
>=20
> Changes in V3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - rebased onto V7 of the "DRM scheduler changes for Xe" series by Mat=
t
>   - move up drm_sched_can_queue() instead of adding a forward declarati=
on
>     (Boris)
>   - add a drm_sched_available_credits() helper (Boris)
>   - adjust control flow in drm_sched_rq_select_entity_fifo() to Luben's=
 proposal
>   - re-phrase a few comments and fix a typo (Luben)
>   - change naming of all structures credit fields and function paramete=
rs to the
>     following scheme
>     - drm_sched_job::credits
>     - drm_gpu_scheduler::credit_limit
>     - drm_gpu_scheduler::credit_count
>     - drm_sched_init(..., u32 credit_limit, ...)
>     - drm_sched_job_init(..., u32 credits, ...)
>   - add proper documentation for the scheduler's job-flow control mecha=
nism
>=20
> Changes in V4:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - address Lubens comments regarding documentation
>   - switch to drm_WARN() variants
>   - WARN_ON() drivers passing in zero job credits for both drm_sched_jo=
b_init()
>     and the update_job_credits() callback
>   - don't retry with another runq if job doesn't fit on the ring to pre=
vent
>     priority inversion
>   - rebase onto drm-misc-next (will probably land before Matt's series)=

>=20
> Changes in V5:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - fix panfrost, lima and etnaviv build
>   - add proposed comments regarding how the code avoids runq priority i=
nversion
>   - address Lubens feedback regarding wording
>   - rebase onto latest drm-misc-next (XE scheduler patches)
>=20
> Changes in V6:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - rebase due to conflicts introduced meanwhile
>   - drm_sched_job_init(): fail with EINVAL, rather than WARN() if job->=
credits
>     is zero
>   - drm_sched_can_queue: truncate job->credits if they exceed the sched=
uler's
>     credit limit to guarantee forward progress
>=20
> Patch also available in [1].
>=20
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/sched-cre=
dits/
> ---
>  Documentation/gpu/drm-mm.rst                  |   6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |   2 +-
>  drivers/gpu/drm/lima/lima_device.c            |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 168 ++++++++++++++----=

>  drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
>  include/drm/gpu_scheduler.h                   |  28 ++-
>  14 files changed, 173 insertions(+), 51 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rs=
t
> index 602010cb6894..acc5901ac840 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,6 +552,12 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
> =20
> +Flow Control
> +------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Flow Control
> +
>  Scheduler Function References
>  -----------------------------
> =20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> index 1f357198533f..62bb7fc7448a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, st=
ruct amdgpu_vm *vm,
>  	if (!entity)
>  		return 0;
> =20
> -	return drm_sched_job_init(&(*job)->base, entity, owner);
> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>  }
> =20
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu=
/drm/etnaviv/etnaviv_gem_submit.c
> index 2416c526f9b0..3d0f8d182506 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev=
, void *data,
> =20
>  	ret =3D drm_sched_job_init(&submit->sched_job,
>  				 &ctx->sched_entity[args->pipe],
> -				 submit->ctx);
> +				 1, submit->ctx);
>  	if (ret)
>  		goto err_submit_put;
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> index 9276756e1397..5105d290e72e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1917,7 +1917,7 @@ static int etnaviv_gpu_rpm_suspend(struct device =
*dev)
>  	u32 idle, mask;
> =20
>  	/* If there are any jobs in the HW queue, we're not idle */
> -	if (atomic_read(&gpu->sched.hw_rq_count))
> +	if (atomic_read(&gpu->sched.credit_count))
>  		return -EBUSY;
> =20
>  	/* Check whether the hardware (except FE and MC) is idle */
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/=
lima_device.c
> index 02cef0cea657..0bf7105c8748 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -514,7 +514,7 @@ int lima_device_suspend(struct device *dev)
> =20
>  	/* check any task running */
>  	for (i =3D 0; i < lima_pipe_num; i++) {
> -		if (atomic_read(&ldev->pipe[i].base.hw_rq_count))
> +		if (atomic_read(&ldev->pipe[i].base.credit_count))
>  			return -EBUSY;
>  	}
> =20
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> index aa030e1f7cda..c3bf8cda8498 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *ta=
sk,
>  	for (i =3D 0; i < num_bos; i++)
>  		drm_gem_object_get(&bos[i]->base.base);
> =20
> -	err =3D drm_sched_job_init(&task->base, &context->base, vm);
> +	err =3D drm_sched_job_init(&task->base, &context->base, 1, vm);
>  	if (err) {
>  		kfree(task->bos);
>  		return err;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> index 99744de6c05a..c002cabe7b9c 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct dr=
m_device *dev,
>  		return ERR_PTR(ret);
>  	}
> =20
> -	ret =3D drm_sched_job_init(&submit->base, queue->entity, queue);
> +	ret =3D drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>  	if (ret) {
>  		kfree(submit->hw_fence);
>  		kfree(submit);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/=
nouveau/nouveau_sched.c
> index 7e64b5ef90fb..1b2cc3f2e1c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
> =20
>  	}
> =20
> -	ret =3D drm_sched_job_init(&job->base, &entity->base, NULL);
> +	ret =3D drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>  	if (ret)
>  		goto err_free_chains;
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/=
panfrost/panfrost_drv.c
> index b834777b409b..54d1c19bea84 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -274,7 +274,7 @@ static int panfrost_ioctl_submit(struct drm_device =
*dev, void *data,
> =20
>  	ret =3D drm_sched_job_init(&job->base,
>  				 &file_priv->sched_entity[slot],
> -				 NULL);
> +				 1, NULL);
>  	if (ret)
>  		goto out_put_job;
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> index 6d89e24322db..f9446e197428 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -963,7 +963,7 @@ int panfrost_job_is_idle(struct panfrost_device *pf=
dev)
> =20
>  	for (i =3D 0; i < NUM_JOB_SLOTS; i++) {
>  		/* If there are any jobs in the HW queue, we're not idle */
> -		if (atomic_read(&js->queue[i].sched.hw_rq_count))
> +		if (atomic_read(&js->queue[i].sched.credit_count))
>  			return false;
>  	}
> =20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/=
gpu/drm/scheduler/gpu_scheduler_trace.h
> index 3143ecaaff86..f8ed093b7356 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			   __assign_str(name, sched_job->sched->name);
>  			   __entry->job_count =3D spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count =3D atomic_read(
> -				   &sched_job->sched->hw_rq_count);
> +				   &sched_job->sched->credit_count);
>  			   ),
>  	    TP_printk("entity=3D%p, id=3D%llu, fence=3D%p, ring=3D%s, job cou=
nt:%u, hw job count:%d",
>  		      __entry->entity, __entry->id,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 8f5e466bd582..a196019c5ba4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -48,6 +48,30 @@
>   * through the jobs entity pointer.
>   */
> =20
> +/**
> + * DOC: Flow Control
> + *
> + * The DRM GPU scheduler provides a flow control mechanism to regulate=
 the rate
> + * in which the jobs fetched from scheduler entities are executed.
> + *
> + * In this context the &drm_gpu_scheduler keeps track of a driver spec=
ified
> + * credit limit representing the capacity of this scheduler and a cred=
it count;
> + * every &drm_sched_job carries a driver specified number of credits.
> + *
> + * Once a job is executed (but not yet finished), the job's credits co=
ntribute
> + * to the scheduler's credit count until the job is finished. If by ex=
ecuting
> + * one more job the scheduler's credit count would exceed the schedule=
r's
> + * credit limit, the job won't be executed. Instead, the scheduler wil=
l wait
> + * until the credit count has decreased enough to not overflow its cre=
dit limit.
> + * This implies waiting for previously executed jobs.
> + *
> + * Optionally, drivers may register a callback (update_job_credits) pr=
ovided by
> + * struct drm_sched_backend_ops to update the job's credits dynamicall=
y. The
> + * scheduler executes this callback every time the scheduler considers=
 a job for
> + * execution and subsequently checks whether the job fits the schedule=
r's credit
> + * limit.
> + */
> +
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> @@ -75,6 +99,51 @@ int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for enti=
ties on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin=
, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO (default).");
>  module_param_named(sched_policy, drm_sched_policy, int, 0444);
> =20
> +static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched=
)
> +{
> +	u32 credits;
> +
> +	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
> +					      atomic_read(&sched->credit_count),
> +					      &credits));
> +
> +	return credits;
> +}
> +
> +/**
> + * drm_sched_can_queue -- Can we queue more to the hardware?
> + * @sched: scheduler instance
> + * @entity: the scheduler entity
> + *
> + * Return true if we can push at least one more job from @entity, fals=
e
> + * otherwise.
> + */
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *s_job;
> +
> +	s_job =3D to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +	if (!s_job)
> +		return false;
> +
> +	if (sched->ops->update_job_credits) {
> +		s_job->credits =3D sched->ops->update_job_credits(s_job);
> +
> +		drm_WARN(sched, !s_job->credits,
> +			 "Jobs with zero credits bypass job-flow control.\n");

That's fine.

> +	}
> +
> +	/* If a job exceeds the credit limit, truncate it to the credit limit=

> +	 * itself to guarantee forward progress.
> +	 */
> +	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
> +		     "Jobs may not exceed the credit limit, truncate.\n"))
> +		s_job->credits =3D sched->credit_limit;
> +
> +	return drm_sched_available_credits(sched) >=3D s_job->credits;
> +}
> +
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_=
node *a,
>  							    const struct rb_node *b)
>  {
> @@ -186,12 +255,18 @@ void drm_sched_rq_remove_entity(struct drm_sched_=
rq *rq,
>  /**
>   * drm_sched_rq_select_entity_rr - Select an entity which could provid=
e a job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   *
> - * Try to find a ready entity, returns NULL if none found.
> + * Try to find the next ready entity.
> + *
> + * Return an entity if one is found; return an error-pointer (!NULL) i=
f an
> + * entity was ready, but the scheduler had insufficient credits to acc=
ommodate
> + * its job; return NULL, if no ready entity was found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> +			      struct drm_sched_rq *rq)
>  {
>  	struct drm_sched_entity *entity;
> =20
> @@ -201,6 +276,14 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq =
*rq)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> +				/* If we can't queue yet, preserve the current
> +				 * entity in terms of fairness.
> +				 */
> +				if (!drm_sched_can_queue(sched, entity)) {
> +					spin_unlock(&rq->lock);
> +					return ERR_PTR(-ENOSPC);
> +				}
> +
>  				rq->current_entity =3D entity;
>  				reinit_completion(&entity->entity_idle);
>  				spin_unlock(&rq->lock);
> @@ -210,8 +293,15 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq =
*rq)
>  	}
> =20
>  	list_for_each_entry(entity, &rq->entities, list) {
> -
>  		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, preserve the current entity in
> +			 * terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity)) {
> +				spin_unlock(&rq->lock);
> +				return ERR_PTR(-ENOSPC);
> +			}
> +
>  			rq->current_entity =3D entity;
>  			reinit_completion(&entity->entity_idle);
>  			spin_unlock(&rq->lock);
> @@ -230,12 +320,18 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq=
 *rq)
>  /**
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a=
 job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   *
> - * Find oldest waiting ready entity, returns NULL if none found.
> + * Find oldest waiting ready entity.
> + *
> + * Return an entity if one is found; return an error-pointer (!NULL) i=
f an
> + * entity was ready, but the scheduler had insufficient credits to acc=
ommodate
> + * its job; return NULL, if no ready entity was found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_rq *rq)
>  {
>  	struct rb_node *rb;
> =20
> @@ -245,6 +341,14 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_r=
q *rq)
> =20
>  		entity =3D rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, preserve the current entity in
> +			 * terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity)) {
> +				spin_unlock(&rq->lock);
> +				return ERR_PTR(-ENOSPC);
> +			}
> +
>  			rq->current_entity =3D entity;
>  			reinit_completion(&entity->entity_idle);
>  			break;
> @@ -302,7 +406,7 @@ static void drm_sched_job_done(struct drm_sched_job=
 *s_job, int result)
>  	struct drm_sched_fence *s_fence =3D s_job->s_fence;
>  	struct drm_gpu_scheduler *sched =3D s_fence->sched;
> =20
> -	atomic_dec(&sched->hw_rq_count);
> +	atomic_sub(s_job->credits, &sched->credit_count);
>  	atomic_dec(sched->score);
> =20
>  	trace_drm_sched_process_job(s_fence);
> @@ -525,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched=
, struct drm_sched_job *bad)
>  					      &s_job->cb)) {
>  			dma_fence_put(s_job->s_fence->parent);
>  			s_job->s_fence->parent =3D NULL;
> -			atomic_dec(&sched->hw_rq_count);
> +			atomic_sub(s_job->credits, &sched->credit_count);
>  		} else {
>  			/*
>  			 * remove job from pending_list.
> @@ -586,7 +690,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sche=
d, bool full_recovery)
>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>  		struct dma_fence *fence =3D s_job->s_fence->parent;
> =20
> -		atomic_inc(&sched->hw_rq_count);
> +		atomic_add(s_job->credits, &sched->credit_count);
> =20
>  		if (!full_recovery)
>  			continue;
> @@ -667,6 +771,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   * drm_sched_job_init - init a scheduler job
>   * @job: scheduler job to init
>   * @entity: scheduler entity to use
> + * @credits: the number of credits this job contributes to the schedul=
ers
> + * credit limit
>   * @owner: job owner for debugging
>   *
>   * Refer to drm_sched_entity_push_job() documentation
> @@ -684,7 +790,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   */
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> -		       void *owner)
> +		       u32 credits, void *owner)
>  {
>  	if (!entity->rq) {
>  		/* This will most likely be followed by missing frames
> @@ -695,7 +801,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		return -ENOENT;
>  	}
> =20
> +	if (unlikely(!credits))
> +		return -EINVAL;
> +

This will most likely result in bad user experience (read: blank screen),=

and debugging this would be really hard without something to go by
in the kernel log.

(This was exactly the case with amdgpu when 56e449603f0ac5
("drm/sched: Convert the GPU scheduler to variable number of run-queues")=
=20
was being worked on and merged. Without the drm_err() on missing rq in
the lines immediately before the hunk above returning -ENOENT, there
was no indication why setting up an fb was failing very early on (blank s=
creen).)

So it is best to print a "[drm] *ERROR* "-equivalent string in the logs,
so that we can make a note of this, without relying on drivers, old and n=
ew, logging
that drm_sched_job_init() failed.

Regards,
Luben

>  	job->entity =3D entity;
> +	job->credits =3D credits;
>  	job->s_fence =3D drm_sched_fence_alloc(entity, owner);
>  	if (!job->s_fence)
>  		return -ENOMEM;
> @@ -907,21 +1017,10 @@ void drm_sched_job_cleanup(struct drm_sched_job =
*job)
>  }
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
> =20
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - *
> - * Return true if we can push more jobs to the hw, otherwise false.
> - */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> -{
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> -}
> -
>  /**
>   * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
>   * @sched: scheduler instance
> + * @entity: the scheduler entity
>   *
>   * Wake up the scheduler if we can queue jobs.
>   */
> @@ -929,7 +1028,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sc=
hed,
>  		      struct drm_sched_entity *entity)
>  {
>  	if (drm_sched_entity_is_ready(entity))
> -		if (drm_sched_can_queue(sched))
> +		if (drm_sched_can_queue(sched, entity))
>  			drm_sched_run_job_queue(sched);
>  }
> =20
> @@ -938,7 +1037,11 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *s=
ched,
>   *
>   * @sched: scheduler instance
>   *
> - * Returns the entity to process or NULL if none are found.
> + * Return an entity to process or NULL if none are found.
> + *
> + * Note, that we break out of the for-loop when "entity" is non-null, =
which can
> + * also be an error-pointer--this assures we don't process lower prior=
ity
> + * run-queues. See comments in the respectively called functions.
>   */
>  static struct drm_sched_entity *
>  drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> @@ -946,19 +1049,16 @@ drm_sched_select_entity(struct drm_gpu_scheduler=
 *sched)
>  	struct drm_sched_entity *entity;
>  	int i;
> =20
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
> +			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
> +			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>  		if (entity)
>  			break;
>  	}
> =20
> -	return entity;
> +	return IS_ERR(entity) ? NULL : entity;
>  }
> =20
>  /**
> @@ -1094,7 +1194,7 @@ static void drm_sched_run_job_work(struct work_st=
ruct *w)
> =20
>  	s_fence =3D sched_job->s_fence;
> =20
> -	atomic_inc(&sched->hw_rq_count);
> +	atomic_add(sched_job->credits, &sched->credit_count);
>  	drm_sched_job_begin(sched_job);
> =20
>  	trace_drm_run_job(sched_job, entity);
> @@ -1129,7 +1229,7 @@ static void drm_sched_run_job_work(struct work_st=
ruct *w)
>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq=
 is
>   *	       allocated and used
>   * @num_rqs: number of runqueues, one for each priority, up to DRM_SCH=
ED_PRIORITY_COUNT
> - * @hw_submission: number of hw submissions that can be in flight
> + * @credit_limit: the number of credits this scheduler can hold from a=
ll jobs
>   * @hang_limit: number of times to allow a job to hang before dropping=
 it
>   * @timeout: timeout value in jiffies for the scheduler
>   * @timeout_wq: workqueue to use for timeout work. If NULL, the system=
_wq is
> @@ -1143,14 +1243,14 @@ static void drm_sched_run_job_work(struct work_=
struct *w)
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
> +		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
>  	int i, ret;
> =20
>  	sched->ops =3D ops;
> -	sched->hw_submission_limit =3D hw_submission;
> +	sched->credit_limit =3D credit_limit;
>  	sched->name =3D name;
>  	sched->timeout =3D timeout;
>  	sched->timeout_wq =3D timeout_wq ? : system_wq;
> @@ -1199,7 +1299,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
>  	spin_lock_init(&sched->job_list_lock);
> -	atomic_set(&sched->hw_rq_count, 0);
> +	atomic_set(&sched->credit_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>  	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>  	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> index 712675134c04..9d2ac23c29e3 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -418,7 +418,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *=
file_priv,
>  	job->file =3D file_priv;
> =20
>  	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue]=
,
> -				 v3d_priv);
> +				 1, v3d_priv);
>  	if (ret)
>  		goto fail;
> =20
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 09916c84703f..1d60eab747de 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -321,6 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct d=
ma_fence *f);
>   * @sched: the scheduler instance on which this job is scheduled.
>   * @s_fence: contains the fences for the scheduling of job.
>   * @finish_cb: the callback for the finished fence.
> + * @credits: the number of credits this job contributes to the schedul=
er
>   * @work: Helper to reschdeule job kill to different context.
>   * @id: a unique id assigned to each job scheduled on the scheduler.
>   * @karma: increment on every hang caused by this job. If this exceeds=
 the hang
> @@ -340,6 +341,8 @@ struct drm_sched_job {
>  	struct drm_gpu_scheduler	*sched;
>  	struct drm_sched_fence		*s_fence;
> =20
> +	u32				credits;
> +
>  	/*
>  	 * work is used only after finish_cb has been used and will not be
>  	 * accessed anymore.
> @@ -463,13 +466,27 @@ struct drm_sched_backend_ops {
>           * and it's time to clean it up.
>  	 */
>  	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @update_job_credits: Called when the scheduler is considering this=

> +	 * job for execution.
> +	 *
> +	 * This callback returns the number of credits the job would take if
> +	 * pushed to the hardware. Drivers may use this to dynamically update=

> +	 * the job's credit count. For instance, deduct the number of credits=

> +	 * for already signalled native fences.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>  };
> =20
>  /**
>   * struct drm_gpu_scheduler - scheduler instance-specific data
>   *
>   * @ops: backend operations provided by the driver.
> - * @hw_submission_limit: the max size of the hardware queue.
> + * @credit_limit: the credit limit of this scheduler
> + * @credit_count: the current credit count of this scheduler
>   * @timeout: the time after which a job is removed from the scheduler.=

>   * @name: name of the ring for which this scheduler is being used.
>   * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_=
COUNT,
> @@ -478,7 +495,6 @@ struct drm_sched_backend_ops {
>   * @job_scheduled: once @drm_sched_entity_do_release is called the sch=
eduler
>   *                 waits on this wait queue until all the scheduled jo=
bs are
>   *                 finished.
> - * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
>   * @submit_wq: workqueue used to queue @work_run_job and @work_free_jo=
b
>   * @timeout_wq: workqueue used to queue @work_tdr
> @@ -502,13 +518,13 @@ struct drm_sched_backend_ops {
>   */
>  struct drm_gpu_scheduler {
>  	const struct drm_sched_backend_ops	*ops;
> -	uint32_t			hw_submission_limit;
> +	u32				credit_limit;
> +	atomic_t			credit_count;
>  	long				timeout;
>  	const char			*name;
>  	u32                             num_rqs;
>  	struct drm_sched_rq             **sched_rq;
>  	wait_queue_head_t		job_scheduled;
> -	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> @@ -530,14 +546,14 @@ struct drm_gpu_scheduler {
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
> +		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev);
> =20
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> -		       void *owner);
> +		       u32 credits, void *owner);
>  void drm_sched_job_arm(struct drm_sched_job *job);
>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>  				 struct dma_fence *fence);
>=20
> base-commit: f3123c2590005c5ff631653d31428e40cd10c618

--------------Nc98jHbo1HELFfi06ZVNoyyc
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------Nc98jHbo1HELFfi06ZVNoyyc--

--------------tLUShj34RXgfSenCiDzxFe0g--

--------------oOhOyPgoTezSESlsGaIESgyn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZU2AEgUDAAAAAAAKCRBMFUeUMaM0rzuk
AP9aoqax6iaZS+pzV8OVW/G550jkXWT8DG2pvpeGe1ZOIQD+Jypczob5SwX74q9VYzAX76d1CBBu
yXVCrgNw9ktZFQY=
=HcX2
-----END PGP SIGNATURE-----

--------------oOhOyPgoTezSESlsGaIESgyn--
