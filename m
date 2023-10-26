Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169CE7D8A16
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE6F10E00B;
	Thu, 26 Oct 2023 21:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBE610E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 21:13:44 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-778a108ae49so201685185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698354823; x=1698959623; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P0Q78dRUDAj5RHVmkOI9qgqEUCYul32rpsou+U+Txko=;
 b=bUZmvOcxY9nmvTszRTWQorp+teKPAC6wUPBiudUPzN1gEtE53jZHsX3xFy6bulMw/k
 N/GeQHuQd5074rRXh0A1wqWHcbD/O+7yAK94WYLinMg0w191I8qxFx+UazPV99GH/2mn
 0KrYwI1EjicRv8lza9NkioWObnfL1StqQYOBih4RlwoLaMqoLNIdya/2sEfhWgg0dXwJ
 JvvjVuzep1zjPULGynMNHKC68RWjKHcX/SxKCdc9un+/dz4MymdcYKpsqrYGUxwteSUo
 1Crh8BrsLDkGAPXBDPZKQv8u+QO6SQZ+0Qx31v49O/wlJh3u6S4/RquUAZbZGQP7PlNi
 mySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354823; x=1698959623;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P0Q78dRUDAj5RHVmkOI9qgqEUCYul32rpsou+U+Txko=;
 b=fVVh16RsnkDVjdB5NYA607Uop3ecdxr8n50nnNnG/QS5tn399+1NAuAEuy0lMDfrjD
 wa7ckyTmtPvn5vRxadfVITQOSn2fZl2xEYPQlQCWnqBFdr+QrFIME2xEWHwR28mZrmOX
 X+Isp8PzUeefWghLs4Rmw8cYd6kvT3Xa1xOVi1sBs2SBzc2DDFL9cRmQpeIBSUj5l2DG
 V/0IdDkeYGLmorB9XGlgjQgLhUHD/uUd2F+znvyoEGaftn9hAklgkRuuBDmOPpYZssv7
 Gkbq8htJTb4Yy3+ZJgq7DEA1Am6Ai5z5MO/jm0uRKqhTu1crWzciq0I2ZquvVw9xlLhD
 LJIA==
X-Gm-Message-State: AOJu0Yxz0s74N9vHPJtAY7rPUn5f3hv79dD5SFIp5wlQSO6JAycXIn61
 Qs1BKDNVg+pFY1Q7ctqb6wY=
X-Google-Smtp-Source: AGHT+IHkqPCOXNnh6a93eDc81pWCPM9I9uK4EdDT+uaG1VP9usJ2p+EjY6MHa5SEy8Dw48w5zVpX2A==
X-Received: by 2002:a05:620a:29c6:b0:777:f6ad:783e with SMTP id
 s6-20020a05620a29c600b00777f6ad783emr1262662qkp.20.1698354822889; 
 Thu, 26 Oct 2023 14:13:42 -0700 (PDT)
Received: from [192.168.2.14] (bas2-toronto12-64-231-246-137.dsl.bell.ca.
 [64.231.246.137]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05620a0c1a00b007678973eaa1sm33008qki.127.2023.10.26.14.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 14:13:42 -0700 (PDT)
Message-ID: <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>
Date: Thu, 26 Oct 2023 17:13:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net, luben.tuikov@amd.com
References: <20231026161431.5934-1-dakr@redhat.com>
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
In-Reply-To: <20231026161431.5934-1-dakr@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ThTZPHx3ZGPAx6s6duAwdnip"
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
--------------ThTZPHx3ZGPAx6s6duAwdnip
Content-Type: multipart/mixed; boundary="------------fxDQHoNeZBgV0jGiFo2v3lfg";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net, luben.tuikov@amd.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
References: <20231026161431.5934-1-dakr@redhat.com>
In-Reply-To: <20231026161431.5934-1-dakr@redhat.com>

--------------fxDQHoNeZBgV0jGiFo2v3lfg
Content-Type: multipart/mixed; boundary="------------R0A2UafXb0XIYisKKEbTZ2AN"

--------------R0A2UafXb0XIYisKKEbTZ2AN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-26 12:13, Danilo Krummrich wrote:
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
> This patch is based on V7 of the "DRM scheduler changes for Xe" series.=
 [1]
> provides a branch based on drm-misc-next, with the named series and thi=
s patch
> on top of it.
>=20
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/sched-cre=
dits/
> ---
>  Documentation/gpu/drm-mm.rst                  |   6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |   4 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 142 ++++++++++++++----=

>  drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
>  include/drm/gpu_scheduler.h                   |  33 +++-
>  12 files changed, 152 insertions(+), 49 deletions(-)
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
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> index 23a6276f1332..cdcb37ff62c3 100644
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
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> index 409e4256f6e7..b79e0672b94f 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fenc=
e *f,
>  		container_of(cb, struct drm_sched_entity, cb);
> =20
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +	drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>  }
> =20
>  /**
> @@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job=
 *sched_job)
>  		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
> =20
> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +		drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 246213963928..3cc3dc0091fc 100644
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
> + * Optionally, drivers can register a callback (update_job_credits) pr=
ovided by

"can" --> "may".

> + * struct drm_sched_backend_ops to update the job's credits dynamicall=
y. The
> + * scheduler will execute this callback every time the scheduler consi=
ders a job

No future tense, "will execute" --> "executes", because when this patch l=
ands,
it all becomes present reality. See below for a reworded paragraph.

> + * for execution and subsequently checks whether the job fits the sche=
duler's
> + * credit limit.

This here is a good explanation of what update_job_credits() does, but th=
e one
where this callback is defined in the scheduler ops is not very clear (se=
e further down
into the patch).

I think we shouldn't use the word "update" as we don't really have any "u=
pdate" code,
a la,
	if old value !=3D new value, then
		old value =3D new value # update it
in the code using this new sched op.

Perhaps it should be a "get_job_credits()" as this is how this function i=
s used
in drm_sched_can_queue().

Perhaps this adds some clarity:

* Optionally, drivers may register a sched ops callback, get_job_credits(=
), which
* returns the number of credits the job passed as an argument would take =
when
* submitted to driver/hardware. The scheduler executes this callback ever=
y time it
* considers a job for execution in order to check if the job's credits fi=
t
* into the scheduler's credit limit.

(FWIW, it may be doing some "update" into the driver/firmware/hardware, b=
ut DRM
has no visibility or care for that, since DRM is using it simply as "tell=
 me
the number or credits this job would take.")

> + */
> +
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> @@ -75,6 +99,46 @@ int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
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
> +	WARN_ON(check_sub_overflow(sched->credit_limit,
> +				   atomic_read(&sched->credit_count),
> +				   &credits));
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

We don't have this gating logic at the moment, and I don't think
we need it.

At the current state of the code, we don't care if there's jobs
in the incoming queue or not.

The only thing we should check here for is the credit availability
for _this job_, as you do in the code below.

> +
> +	if (sched->ops->update_job_credits) {
> +		u32 credits =3D sched->ops->update_job_credits(s_job);
> +
> +		if (credits)
> +			s_job->credits =3D credits;
> +	}
> +
> +	WARN_ON(s_job->credits > sched->credit_limit);
> +
> +	return drm_sched_available_credits(sched) >=3D s_job->credits;
> +}
> +
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_=
node *a,
>  							    const struct rb_node *b)
>  {
> @@ -186,12 +250,14 @@ void drm_sched_rq_remove_entity(struct drm_sched_=
rq *rq,
>  /**
>   * drm_sched_rq_select_entity_rr - Select an entity which could provid=
e a job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> +			      struct drm_sched_rq *rq)
>  {
>  	struct drm_sched_entity *entity;
> =20
> @@ -201,6 +267,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq =
*rq)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> +				/* If we can't queue yet, preserve the current
> +				 * entity in terms of fairness.
> +				 */
> +				if (!drm_sched_can_queue(sched, entity))
> +					goto out;
> +
>  				rq->current_entity =3D entity;
>  				reinit_completion(&entity->entity_idle);
>  				spin_unlock(&rq->lock);
> @@ -210,8 +282,13 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq =
*rq)
>  	}
> =20
>  	list_for_each_entry(entity, &rq->entities, list) {
> -
>  		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, preserve the current entity in
> +			 * terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity))
> +				goto out;
> +
>  			rq->current_entity =3D entity;
>  			reinit_completion(&entity->entity_idle);
>  			spin_unlock(&rq->lock);
> @@ -222,20 +299,22 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq=
 *rq)
>  			break;
>  	}
> =20
> +out:
>  	spin_unlock(&rq->lock);
> -
>  	return NULL;
>  }
> =20
>  /**
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a=
 job to run
>   *
> + * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
>   *
>   * Find oldest waiting ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> +				struct drm_sched_rq *rq)
>  {
>  	struct rb_node *rb;
> =20
> @@ -245,6 +324,15 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_r=
q *rq)
> =20
>  		entity =3D rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, don't pick another entity
> +			 * which's job might fit and wait until we got space for

			 * whose job might not fit and wait until we get space for
Three fixes:                 ^              ^                         ^

> +			 * this one in terms of fairness.

                         * this one in terms of credit availability.

It's not the "fairness", it's the number of credits we check for in drm_s=
ched_can_queue() below.

> +			 */
> +			if (!drm_sched_can_queue(sched, entity)) {
> +				rb =3D NULL;
> +				break;
> +			}
> +

That's good.

>  			rq->current_entity =3D entity;
>  			reinit_completion(&entity->entity_idle);
>  			break;
> @@ -266,18 +354,6 @@ static void drm_sched_run_job_queue(struct drm_gpu=
_scheduler *sched)
>  		queue_work(sched->submit_wq, &sched->work_run_job);
>  }
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
>   * drm_sched_select_entity - Select next entity to process
>   *
> @@ -291,14 +367,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler =
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
> @@ -353,7 +426,7 @@ static void drm_sched_job_done(struct drm_sched_job=
 *s_job, int result)
>  	struct drm_sched_fence *s_fence =3D s_job->s_fence;
>  	struct drm_gpu_scheduler *sched =3D s_fence->sched;
> =20
> -	atomic_dec(&sched->hw_rq_count);
> +	atomic_sub(s_job->credits, &sched->credit_count);
>  	atomic_dec(sched->score);
> =20
>  	trace_drm_sched_process_job(s_fence);
> @@ -576,7 +649,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched=
, struct drm_sched_job *bad)
>  					      &s_job->cb)) {
>  			dma_fence_put(s_job->s_fence->parent);
>  			s_job->s_fence->parent =3D NULL;
> -			atomic_dec(&sched->hw_rq_count);
> +			atomic_sub(s_job->credits, &sched->credit_count);
>  		} else {
>  			/*
>  			 * remove job from pending_list.
> @@ -637,7 +710,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sche=
d, bool full_recovery)
>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>  		struct dma_fence *fence =3D s_job->s_fence->parent;
> =20
> -		atomic_inc(&sched->hw_rq_count);
> +		atomic_add(s_job->credits, &sched->credit_count);
> =20
>  		if (!full_recovery)
>  			continue;
> @@ -718,6 +791,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   * drm_sched_job_init - init a scheduler job
>   * @job: scheduler job to init
>   * @entity: scheduler entity to use
> + * @credits: the number of credits this job contributes to the schedul=
ers
> + * credit limit
>   * @owner: job owner for debugging
>   *
>   * Refer to drm_sched_entity_push_job() documentation
> @@ -735,7 +810,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   */
>  int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
> -		       void *owner)
> +		       u32 credits, void *owner)
>  {
>  	if (!entity->rq) {
>  		/* This will most likely be followed by missing frames
> @@ -752,6 +827,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		return -ENOMEM;
> =20
>  	INIT_LIST_HEAD(&job->list);
> +	job->credits =3D credits ? credits : 1;
> =20
>  	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> =20
> @@ -961,12 +1037,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> + * @entity: the scheduler entity
>   *
>   * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
> +				   struct drm_sched_entity *entity)
>  {
> -	if (drm_sched_can_queue(sched))
> +	if (drm_sched_can_queue(sched, entity))
>  		drm_sched_run_job_queue(sched);
>  }
> =20
> @@ -1104,7 +1182,7 @@ static void drm_sched_run_job_work(struct work_st=
ruct *w)
> =20
>  	s_fence =3D sched_job->s_fence;
> =20
> -	atomic_inc(&sched->hw_rq_count);
> +	atomic_add(sched_job->credits, &sched->credit_count);
>  	drm_sched_job_begin(sched_job);
> =20
>  	trace_drm_run_job(sched_job, entity);
> @@ -1139,7 +1217,7 @@ static void drm_sched_run_job_work(struct work_st=
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
> @@ -1153,14 +1231,14 @@ static void drm_sched_run_job_work(struct work_=
struct *w)
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,
> +		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
>  	int i, ret;
> =20
>  	sched->ops =3D ops;
> -	sched->hw_submission_limit =3D hw_submission;
> +	sched->credit_limit =3D credit_limit;
>  	sched->name =3D name;
>  	if (submit_wq) {
>  		sched->submit_wq =3D submit_wq;
> @@ -1211,7 +1289,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
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
> index 2e94ce788c71..8479e5302f7b 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *=
file_priv,
>  	job->free =3D free;
> =20
>  	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue]=
,
> -				 v3d_priv);
> +				 1, v3d_priv);
>  	if (ret)
>  		goto fail;
> =20
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e5a6166eb152..a911b3f5917e 100644
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
> @@ -463,13 +466,29 @@ struct drm_sched_backend_ops {
>           * and it's time to clean it up.
>  	 */
>  	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @update_job_credits: Called once the scheduler is considering this=

> +	 * job for execution.
> +	 *

This whole paragraph isn't very clear of what update_job_credits does.
Perhaps a simple and straightforward name would be more clear:
	get_job_credits: Returns the number of credits this job would
		take.

> +	 * Drivers may use this to update the job's submission credits, which=
 is
> +	 * useful to e.g. deduct the number of native fences which have been
> +	 * signaled meanwhile.
> +	 *
> +	 * The callback must either return the new number of submission credi=
ts
> +	 * for the given job, or zero if no update is required.

The word "update" is confusing here and it implies that DRM should keep t=
rack
of the previous value this function had returned.

Perhaps we can just say:
	* This callback returns the number of credits this job would take if pus=
hed
	* to the driver/hardware. It returns 0, if this job would take no credit=
s.

Else, driver writers would have to deduce what to return here by looking =
at
drm_sched_can_queue() which effectively does:
	s_job->credits =3D sched->ops->update_job_credits(s_job).

> +	 *
> +	 * This callback is optional.
> +	 */
> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>  };
> =20

The rest is good--thanks for the changes!

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
> @@ -478,7 +497,6 @@ struct drm_sched_backend_ops {
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
> @@ -502,13 +520,13 @@ struct drm_sched_backend_ops {
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
> @@ -530,14 +548,14 @@ struct drm_gpu_scheduler {
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
>  		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
> +		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
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
> @@ -559,7 +577,8 @@ void drm_sched_entity_modify_sched(struct drm_sched=
_entity *entity,
> =20
>  void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
> +				   struct drm_sched_entity *entity);
>  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);

--=20
Regards,
Luben

--------------R0A2UafXb0XIYisKKEbTZ2AN
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

--------------R0A2UafXb0XIYisKKEbTZ2AN--

--------------fxDQHoNeZBgV0jGiFo2v3lfg--

--------------ThTZPHx3ZGPAx6s6duAwdnip
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZTrWhQUDAAAAAAAKCRBMFUeUMaM0ryou
AP0aFqBdMNTMnY6YgDmxO10Ud1hCLE6vm1fLIH342wy14gEA5tCypQr1Tywe6tiMebZYuC/Ba+w4
oqClW5iExWxNqgM=
=SJrF
-----END PGP SIGNATURE-----

--------------ThTZPHx3ZGPAx6s6duAwdnip--
