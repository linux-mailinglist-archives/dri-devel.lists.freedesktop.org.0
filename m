Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2279A7D8CAA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 03:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7410E846;
	Fri, 27 Oct 2023 01:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDBF10E846
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 01:03:49 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7788ebea620so114433585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 18:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698368628; x=1698973428; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g6vb7i7EjBBfxVZUgnIKI8x1Aa7jSHPDN78VTM6y2+E=;
 b=GW0EFrGsDPRRTdBpiMsKen3+HNLfoYx9eI8ZfAe1Oh7MnDED8Hk8oy5QrC1HWb9GhS
 9Xew5b/+dDhjLB/sbtydsUAJvXF0nVmQ1u0KgPmx+X5ybkXQYarrmN+w9MbARwv6Emap
 oFLpaNRDYB84tdHmfndnBeesnQwl6VfgnWqR9R2KzBxTKDUoLKbjY7vBH4B1/nTUO2lz
 IUCeFAsl94JtaCqJSumkksyOBUGxcYFiLFVuCxpgBg+xFuXN6EN7/8IwC163QpEp7F7u
 0qunzaFQFyYlbRo9m8U5+tgmXahJ62Fv3LiluMFPe56rv1Ty0vxLnxiu4ubW0GG9j+Bt
 mPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698368628; x=1698973428;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g6vb7i7EjBBfxVZUgnIKI8x1Aa7jSHPDN78VTM6y2+E=;
 b=uduXFfLQrVPZMoS9IU+bUcaxzPur80nFSrcLxneLVzpzffoxd/0hixXBgtTbKONtW+
 2vDlsEUruQrSBs7k2SqbVs571VbZGpTDfFRt1iwIxn1eSqPyY+9tIabXEqfqRdHp//uu
 qNLXgrWfVd6gTdLXh6Rf/u5rSU2QSYAoF7xTHGkGrcG+XZ0jQj94oUX4rdLrdtMJav3m
 lPLD6qLWI7jSX3QEvXoXtEmRKhpIQG8kJ+cJ7vNTP0ys0xE+oM/ucHpu5LkSAd2bdCyG
 iaeN8UeHpVFZKH9rz8Um3/sQD8rRRchCv3neBGGivlNHGYES5vQe6BrDlYvllgOghxeD
 OcPw==
X-Gm-Message-State: AOJu0YyGBPmhMGlPgfDjpMbhLDTJ8EjFbPdzkWhOzZqU3WhUc76sxpTl
 CXnHZrGI6xADpKE4IpORXwg=
X-Google-Smtp-Source: AGHT+IHgilnTejYmaqrQap3kzjbHrgGYk8FtV4ubpU3ZD5X978LdnxDDeu9xxyKS8gJNc6dSCSazug==
X-Received: by 2002:a05:620a:25c6:b0:775:7970:5e29 with SMTP id
 y6-20020a05620a25c600b0077579705e29mr1230206qko.40.1698368627864; 
 Thu, 26 Oct 2023 18:03:47 -0700 (PDT)
Received: from [192.168.2.14] ([64.231.246.137])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05620a448300b0076c701c3e71sm154293qkp.121.2023.10.26.18.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 18:03:47 -0700 (PDT)
Message-ID: <8c0abef0-e24b-419a-b3b5-78f112c6618b@gmail.com>
Date: Thu, 26 Oct 2023 21:03:38 -0400
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
 <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>
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
In-Reply-To: <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A3GL7pQZvUu0kFKZWlD73YQq"
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
--------------A3GL7pQZvUu0kFKZWlD73YQq
Content-Type: multipart/mixed; boundary="------------xTMo5JPvGv2EPPzltDFNYSm0";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net, luben.tuikov@amd.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <8c0abef0-e24b-419a-b3b5-78f112c6618b@gmail.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
References: <20231026161431.5934-1-dakr@redhat.com>
 <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>
In-Reply-To: <c95c4dbf-3d97-477a-9074-a4e6a4394189@gmail.com>

--------------xTMo5JPvGv2EPPzltDFNYSm0
Content-Type: multipart/mixed; boundary="------------0PZrsqdyB6SoxbG7brVmqC09"

--------------0PZrsqdyB6SoxbG7brVmqC09
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-26 17:13, Luben Tuikov wrote:
> On 2023-10-26 12:13, Danilo Krummrich wrote:
>> Currently, job flow control is implemented simply by limiting the numb=
er
>> of jobs in flight. Therefore, a scheduler is initialized with a credit=

>> limit that corresponds to the number of jobs which can be sent to the
>> hardware.
>>
>> This implies that for each job, drivers need to account for the maximu=
m
>> job size possible in order to not overflow the ring buffer.
>>
>> However, there are drivers, such as Nouveau, where the job size has a
>> rather large range. For such drivers it can easily happen that job
>> submissions not even filling the ring by 1% can block subsequent
>> submissions, which, in the worst case, can lead to the ring run dry.
>>
>> In order to overcome this issue, allow for tracking the actual job siz=
e
>> instead of the number of jobs. Therefore, add a field to track a job's=

>> credit count, which represents the number of credits a job contributes=

>> to the scheduler's credit limit.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>> Changes in V2:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>   - fixed up influence on scheduling fairness due to consideration of =
a job's
>>     size
>>     - If we reach a ready entity in drm_sched_select_entity() but can'=
t actually
>>       queue a job from it due to size limitations, just give up and go=
 to sleep
>>       until woken up due to a pending job finishing, rather than conti=
nue to try
>>       other entities.
>>   - added a callback to dynamically update a job's credits (Boris)
>>   - renamed 'units' to 'credits'
>>   - fixed commit message and comments as requested by Luben
>>
>> Changes in V3:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>   - rebased onto V7 of the "DRM scheduler changes for Xe" series by Ma=
tt
>>   - move up drm_sched_can_queue() instead of adding a forward declarat=
ion
>>     (Boris)
>>   - add a drm_sched_available_credits() helper (Boris)
>>   - adjust control flow in drm_sched_rq_select_entity_fifo() to Luben'=
s proposal
>>   - re-phrase a few comments and fix a typo (Luben)
>>   - change naming of all structures credit fields and function paramet=
ers to the
>>     following scheme
>>     - drm_sched_job::credits
>>     - drm_gpu_scheduler::credit_limit
>>     - drm_gpu_scheduler::credit_count
>>     - drm_sched_init(..., u32 credit_limit, ...)
>>     - drm_sched_job_init(..., u32 credits, ...)
>>   - add proper documentation for the scheduler's job-flow control mech=
anism
>>
>> This patch is based on V7 of the "DRM scheduler changes for Xe" series=
=2E [1]
>> provides a branch based on drm-misc-next, with the named series and th=
is patch
>> on top of it.
>>
>> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/sched-cr=
edits/
>> ---
>>  Documentation/gpu/drm-mm.rst                  |   6 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>>  drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>>  drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
>>  drivers/gpu/drm/scheduler/sched_entity.c      |   4 +-
>>  drivers/gpu/drm/scheduler/sched_main.c        | 142 ++++++++++++++---=
-
>>  drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
>>  include/drm/gpu_scheduler.h                   |  33 +++-
>>  12 files changed, 152 insertions(+), 49 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.r=
st
>> index 602010cb6894..acc5901ac840 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -552,6 +552,12 @@ Overview
>>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>     :doc: Overview
>> =20
>> +Flow Control
>> +------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Flow Control
>> +
>>  Scheduler Function References
>>  -----------------------------
>> =20
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_job.c
>> index 1f357198533f..62bb7fc7448a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, s=
truct amdgpu_vm *vm,
>>  	if (!entity)
>>  		return 0;
>> =20
>> -	return drm_sched_job_init(&(*job)->base, entity, owner);
>> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>>  }
>> =20
>>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gp=
u/drm/etnaviv/etnaviv_gem_submit.c
>> index 2416c526f9b0..3d0f8d182506 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> @@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *de=
v, void *data,
>> =20
>>  	ret =3D drm_sched_job_init(&submit->sched_job,
>>  				 &ctx->sched_entity[args->pipe],
>> -				 submit->ctx);
>> +				 1, submit->ctx);
>>  	if (ret)
>>  		goto err_submit_put;
>> =20
>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/=
lima_sched.c
>> index 23a6276f1332..cdcb37ff62c3 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *t=
ask,
>>  	for (i =3D 0; i < num_bos; i++)
>>  		drm_gem_object_get(&bos[i]->base.base);
>> =20
>> -	err =3D drm_sched_job_init(&task->base, &context->base, vm);
>> +	err =3D drm_sched_job_init(&task->base, &context->base, 1, vm);
>>  	if (err) {
>>  		kfree(task->bos);
>>  		return err;
>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/ms=
m/msm_gem_submit.c
>> index 99744de6c05a..c002cabe7b9c 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct d=
rm_device *dev,
>>  		return ERR_PTR(ret);
>>  	}
>> =20
>> -	ret =3D drm_sched_job_init(&submit->base, queue->entity, queue);
>> +	ret =3D drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>>  	if (ret) {
>>  		kfree(submit->hw_fence);
>>  		kfree(submit);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm=
/nouveau/nouveau_sched.c
>> index 7e64b5ef90fb..1b2cc3f2e1c7 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
>> =20
>>  	}
>> =20
>> -	ret =3D drm_sched_job_init(&job->base, &entity->base, NULL);
>> +	ret =3D drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>>  	if (ret)
>>  		goto err_free_chains;
>> =20
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm=
/panfrost/panfrost_drv.c
>> index b834777b409b..54d1c19bea84 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -274,7 +274,7 @@ static int panfrost_ioctl_submit(struct drm_device=
 *dev, void *data,
>> =20
>>  	ret =3D drm_sched_job_init(&job->base,
>>  				 &file_priv->sched_entity[slot],
>> -				 NULL);
>> +				 1, NULL);
>>  	if (ret)
>>  		goto out_put_job;
>> =20
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers=
/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 3143ecaaff86..f8ed093b7356 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>  			   __assign_str(name, sched_job->sched->name);
>>  			   __entry->job_count =3D spsc_queue_count(&entity->job_queue);
>>  			   __entry->hw_job_count =3D atomic_read(
>> -				   &sched_job->sched->hw_rq_count);
>> +				   &sched_job->sched->credit_count);
>>  			   ),
>>  	    TP_printk("entity=3D%p, id=3D%llu, fence=3D%p, ring=3D%s, job co=
unt:%u, hw job count:%d",
>>  		      __entry->entity, __entry->id,
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/dr=
m/scheduler/sched_entity.c
>> index 409e4256f6e7..b79e0672b94f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fen=
ce *f,
>>  		container_of(cb, struct drm_sched_entity, cb);
>> =20
>>  	drm_sched_entity_clear_dep(f, cb);
>> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
>> +	drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>>  }
>> =20
>>  /**
>> @@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_jo=
b *sched_job)
>>  		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>>  			drm_sched_rq_update_fifo(entity, submit_ts);
>> =20
>> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
>> +		drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
>>  	}
>>  }
>>  EXPORT_SYMBOL(drm_sched_entity_push_job);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/=
scheduler/sched_main.c
>> index 246213963928..3cc3dc0091fc 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -48,6 +48,30 @@
>>   * through the jobs entity pointer.
>>   */
>> =20
>> +/**
>> + * DOC: Flow Control
>> + *
>> + * The DRM GPU scheduler provides a flow control mechanism to regulat=
e the rate
>> + * in which the jobs fetched from scheduler entities are executed.
>> + *
>> + * In this context the &drm_gpu_scheduler keeps track of a driver spe=
cified
>> + * credit limit representing the capacity of this scheduler and a cre=
dit count;
>> + * every &drm_sched_job carries a driver specified number of credits.=

>> + *
>> + * Once a job is executed (but not yet finished), the job's credits c=
ontribute
>> + * to the scheduler's credit count until the job is finished. If by e=
xecuting
>> + * one more job the scheduler's credit count would exceed the schedul=
er's
>> + * credit limit, the job won't be executed. Instead, the scheduler wi=
ll wait
>> + * until the credit count has decreased enough to not overflow its cr=
edit limit.
>> + * This implies waiting for previously executed jobs.
>> + *
>> + * Optionally, drivers can register a callback (update_job_credits) p=
rovided by
>=20
> "can" --> "may".
>=20
>> + * struct drm_sched_backend_ops to update the job's credits dynamical=
ly. The
>> + * scheduler will execute this callback every time the scheduler cons=
iders a job
>=20
> No future tense, "will execute" --> "executes", because when this patch=
 lands,
> it all becomes present reality. See below for a reworded paragraph.
>=20
>> + * for execution and subsequently checks whether the job fits the sch=
eduler's
>> + * credit limit.
>=20
> This here is a good explanation of what update_job_credits() does, but =
the one
> where this callback is defined in the scheduler ops is not very clear (=
see further down
> into the patch).
>=20
> I think we shouldn't use the word "update" as we don't really have any =
"update" code,
> a la,
> 	if old value !=3D new value, then
> 		old value =3D new value # update it
> in the code using this new sched op.
>=20
> Perhaps it should be a "get_job_credits()" as this is how this function=
 is used
> in drm_sched_can_queue().
>=20
> Perhaps this adds some clarity:
>=20
> * Optionally, drivers may register a sched ops callback, get_job_credit=
s(), which
> * returns the number of credits the job passed as an argument would tak=
e when
> * submitted to driver/hardware. The scheduler executes this callback ev=
ery time it
> * considers a job for execution in order to check if the job's credits =
fit
> * into the scheduler's credit limit.
>=20
> (FWIW, it may be doing some "update" into the driver/firmware/hardware,=
 but DRM
> has no visibility or care for that, since DRM is using it simply as "te=
ll me
> the number or credits this job would take.")
>=20
>> + */
>> +
>>  #include <linux/wait.h>
>>  #include <linux/sched.h>
>>  #include <linux/completion.h>
>> @@ -75,6 +99,46 @@ int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
>>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for ent=
ities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robi=
n, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO (default).");
>>  module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> =20
>> +static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sche=
d)
>> +{
>> +	u32 credits;
>> +
>> +	WARN_ON(check_sub_overflow(sched->credit_limit,
>> +				   atomic_read(&sched->credit_count),
>> +				   &credits));
>> +
>> +	return credits;
>> +}
>> +
>> +/**
>> + * drm_sched_can_queue -- Can we queue more to the hardware?
>> + * @sched: scheduler instance
>> + * @entity: the scheduler entity
>> + *
>> + * Return true if we can push at least one more job from @entity, fal=
se
>> + * otherwise.
>> + */
>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>> +				struct drm_sched_entity *entity)
>> +{
>> +	struct drm_sched_job *s_job;
>> +
>> +	s_job =3D to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> +	if (!s_job)
>> +		return false;
>=20
> We don't have this gating logic at the moment, and I don't think
> we need it.
>=20
> At the current state of the code, we don't care if there's jobs
> in the incoming queue or not.
>=20
> The only thing we should check here for is the credit availability
> for _this job_, as you do in the code below.

I see it now--never mind.

(I would've probably added a comment--something like
/* Incoming queue empty--nothing to schedule, return false. */
as it circles all the way back to where we pick the next job to schedule.=
)

So, I ported this patch to drm-misc-next and then to 6.6-rc7 and ran
with it. All is good.

I think this patch is ready to go in after addressing the cosmetic fixes
to comments and clarity--if you also feel the same way.

Thanks! Great job!

Regards,
Luben


>=20
>> +
>> +	if (sched->ops->update_job_credits) {
>> +		u32 credits =3D sched->ops->update_job_credits(s_job);
>> +
>> +		if (credits)
>> +			s_job->credits =3D credits;
>> +	}
>> +
>> +	WARN_ON(s_job->credits > sched->credit_limit);
>> +
>> +	return drm_sched_available_credits(sched) >=3D s_job->credits;
>> +}
>> +
>>  static __always_inline bool drm_sched_entity_compare_before(struct rb=
_node *a,
>>  							    const struct rb_node *b)
>>  {
>> @@ -186,12 +250,14 @@ void drm_sched_rq_remove_entity(struct drm_sched=
_rq *rq,
>>  /**
>>   * drm_sched_rq_select_entity_rr - Select an entity which could provi=
de a job to run
>>   *
>> + * @sched: the gpu scheduler
>>   * @rq: scheduler run queue to check.
>>   *
>>   * Try to find a ready entity, returns NULL if none found.
>>   */
>>  static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>> +			      struct drm_sched_rq *rq)
>>  {
>>  	struct drm_sched_entity *entity;
>> =20
>> @@ -201,6 +267,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq=
 *rq)
>>  	if (entity) {
>>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>>  			if (drm_sched_entity_is_ready(entity)) {
>> +				/* If we can't queue yet, preserve the current
>> +				 * entity in terms of fairness.
>> +				 */
>> +				if (!drm_sched_can_queue(sched, entity))
>> +					goto out;
>> +
>>  				rq->current_entity =3D entity;
>>  				reinit_completion(&entity->entity_idle);
>>  				spin_unlock(&rq->lock);
>> @@ -210,8 +282,13 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq=
 *rq)
>>  	}
>> =20
>>  	list_for_each_entry(entity, &rq->entities, list) {
>> -
>>  		if (drm_sched_entity_is_ready(entity)) {
>> +			/* If we can't queue yet, preserve the current entity in
>> +			 * terms of fairness.
>> +			 */
>> +			if (!drm_sched_can_queue(sched, entity))
>> +				goto out;
>> +
>>  			rq->current_entity =3D entity;
>>  			reinit_completion(&entity->entity_idle);
>>  			spin_unlock(&rq->lock);
>> @@ -222,20 +299,22 @@ drm_sched_rq_select_entity_rr(struct drm_sched_r=
q *rq)
>>  			break;
>>  	}
>> =20
>> +out:
>>  	spin_unlock(&rq->lock);
>> -
>>  	return NULL;
>>  }
>> =20
>>  /**
>>   * drm_sched_rq_select_entity_fifo - Select an entity which provides =
a job to run
>>   *
>> + * @sched: the gpu scheduler
>>   * @rq: scheduler run queue to check.
>>   *
>>   * Find oldest waiting ready entity, returns NULL if none found.
>>   */
>>  static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>> +				struct drm_sched_rq *rq)
>>  {
>>  	struct rb_node *rb;
>> =20
>> @@ -245,6 +324,15 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_=
rq *rq)
>> =20
>>  		entity =3D rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>  		if (drm_sched_entity_is_ready(entity)) {
>> +			/* If we can't queue yet, don't pick another entity
>> +			 * which's job might fit and wait until we got space for
>=20
> 			 * whose job might not fit and wait until we get space for
> Three fixes:                 ^              ^                         ^=

>=20
>> +			 * this one in terms of fairness.
>=20
>                          * this one in terms of credit availability.
>=20
> It's not the "fairness", it's the number of credits we check for in drm=
_sched_can_queue() below.
>=20
>> +			 */
>> +			if (!drm_sched_can_queue(sched, entity)) {
>> +				rb =3D NULL;
>> +				break;
>> +			}
>> +
>=20
> That's good.
>=20
>>  			rq->current_entity =3D entity;
>>  			reinit_completion(&entity->entity_idle);
>>  			break;
>> @@ -266,18 +354,6 @@ static void drm_sched_run_job_queue(struct drm_gp=
u_scheduler *sched)
>>  		queue_work(sched->submit_wq, &sched->work_run_job);
>>  }
>> =20
>> -/**
>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>> - * @sched: scheduler instance
>> - *
>> - * Return true if we can push more jobs to the hw, otherwise false.
>> - */
>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>> -{
>> -	return atomic_read(&sched->hw_rq_count) <
>> -		sched->hw_submission_limit;
>> -}
>> -
>>  /**
>>   * drm_sched_select_entity - Select next entity to process
>>   *
>> @@ -291,14 +367,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler=
 *sched)
>>  	struct drm_sched_entity *entity;
>>  	int i;
>> =20
>> -	if (!drm_sched_can_queue(sched))
>> -		return NULL;
>> -
>>  	/* Kernel run queue has higher priority than normal run queue*/
>>  	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_MIN; i--) {=

>>  		entity =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO ?
>> -			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
>> -			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
>> +			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>> +			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>>  		if (entity)
>>  			break;
>>  	}
>> @@ -353,7 +426,7 @@ static void drm_sched_job_done(struct drm_sched_jo=
b *s_job, int result)
>>  	struct drm_sched_fence *s_fence =3D s_job->s_fence;
>>  	struct drm_gpu_scheduler *sched =3D s_fence->sched;
>> =20
>> -	atomic_dec(&sched->hw_rq_count);
>> +	atomic_sub(s_job->credits, &sched->credit_count);
>>  	atomic_dec(sched->score);
>> =20
>>  	trace_drm_sched_process_job(s_fence);
>> @@ -576,7 +649,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sche=
d, struct drm_sched_job *bad)
>>  					      &s_job->cb)) {
>>  			dma_fence_put(s_job->s_fence->parent);
>>  			s_job->s_fence->parent =3D NULL;
>> -			atomic_dec(&sched->hw_rq_count);
>> +			atomic_sub(s_job->credits, &sched->credit_count);
>>  		} else {
>>  			/*
>>  			 * remove job from pending_list.
>> @@ -637,7 +710,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sch=
ed, bool full_recovery)
>>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>  		struct dma_fence *fence =3D s_job->s_fence->parent;
>> =20
>> -		atomic_inc(&sched->hw_rq_count);
>> +		atomic_add(s_job->credits, &sched->credit_count);
>> =20
>>  		if (!full_recovery)
>>  			continue;
>> @@ -718,6 +791,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>   * drm_sched_job_init - init a scheduler job
>>   * @job: scheduler job to init
>>   * @entity: scheduler entity to use
>> + * @credits: the number of credits this job contributes to the schedu=
lers
>> + * credit limit
>>   * @owner: job owner for debugging
>>   *
>>   * Refer to drm_sched_entity_push_job() documentation
>> @@ -735,7 +810,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>   */
>>  int drm_sched_job_init(struct drm_sched_job *job,
>>  		       struct drm_sched_entity *entity,
>> -		       void *owner)
>> +		       u32 credits, void *owner)
>>  {
>>  	if (!entity->rq) {
>>  		/* This will most likely be followed by missing frames
>> @@ -752,6 +827,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>  		return -ENOMEM;
>> =20
>>  	INIT_LIST_HEAD(&job->list);
>> +	job->credits =3D credits ? credits : 1;
>> =20
>>  	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>> =20
>> @@ -961,12 +1037,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>>  /**
>>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>   * @sched: scheduler instance
>> + * @entity: the scheduler entity
>>   *
>>   * Wake up the scheduler if we can queue jobs.
>>   */
>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>> +				   struct drm_sched_entity *entity)
>>  {
>> -	if (drm_sched_can_queue(sched))
>> +	if (drm_sched_can_queue(sched, entity))
>>  		drm_sched_run_job_queue(sched);
>>  }
>> =20
>> @@ -1104,7 +1182,7 @@ static void drm_sched_run_job_work(struct work_s=
truct *w)
>> =20
>>  	s_fence =3D sched_job->s_fence;
>> =20
>> -	atomic_inc(&sched->hw_rq_count);
>> +	atomic_add(sched_job->credits, &sched->credit_count);
>>  	drm_sched_job_begin(sched_job);
>> =20
>>  	trace_drm_run_job(sched_job, entity);
>> @@ -1139,7 +1217,7 @@ static void drm_sched_run_job_work(struct work_s=
truct *w)
>>   * @submit_wq: workqueue to use for submission. If NULL, an ordered w=
q is
>>   *	       allocated and used
>>   * @num_rqs: number of runqueues, one for each priority, up to DRM_SC=
HED_PRIORITY_COUNT
>> - * @hw_submission: number of hw submissions that can be in flight
>> + * @credit_limit: the number of credits this scheduler can hold from =
all jobs
>>   * @hang_limit: number of times to allow a job to hang before droppin=
g it
>>   * @timeout: timeout value in jiffies for the scheduler
>>   * @timeout_wq: workqueue to use for timeout work. If NULL, the syste=
m_wq is
>> @@ -1153,14 +1231,14 @@ static void drm_sched_run_job_work(struct work=
_struct *w)
>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  		   const struct drm_sched_backend_ops *ops,
>>  		   struct workqueue_struct *submit_wq,
>> -		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,
>> +		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>  		   atomic_t *score, const char *name, struct device *dev)
>>  {
>>  	int i, ret;
>> =20
>>  	sched->ops =3D ops;
>> -	sched->hw_submission_limit =3D hw_submission;
>> +	sched->credit_limit =3D credit_limit;
>>  	sched->name =3D name;
>>  	if (submit_wq) {
>>  		sched->submit_wq =3D submit_wq;
>> @@ -1211,7 +1289,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sch=
ed,
>>  	init_waitqueue_head(&sched->job_scheduled);
>>  	INIT_LIST_HEAD(&sched->pending_list);
>>  	spin_lock_init(&sched->job_list_lock);
>> -	atomic_set(&sched->hw_rq_count, 0);
>> +	atomic_set(&sched->credit_count, 0);
>>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>  	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>  	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_g=
em.c
>> index 2e94ce788c71..8479e5302f7b 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file =
*file_priv,
>>  	job->free =3D free;
>> =20
>>  	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue=
],
>> -				 v3d_priv);
>> +				 1, v3d_priv);
>>  	if (ret)
>>  		goto fail;
>> =20
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h=

>> index e5a6166eb152..a911b3f5917e 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -321,6 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct =
dma_fence *f);
>>   * @sched: the scheduler instance on which this job is scheduled.
>>   * @s_fence: contains the fences for the scheduling of job.
>>   * @finish_cb: the callback for the finished fence.
>> + * @credits: the number of credits this job contributes to the schedu=
ler
>>   * @work: Helper to reschdeule job kill to different context.
>>   * @id: a unique id assigned to each job scheduled on the scheduler.
>>   * @karma: increment on every hang caused by this job. If this exceed=
s the hang
>> @@ -340,6 +341,8 @@ struct drm_sched_job {
>>  	struct drm_gpu_scheduler	*sched;
>>  	struct drm_sched_fence		*s_fence;
>> =20
>> +	u32				credits;
>> +
>>  	/*
>>  	 * work is used only after finish_cb has been used and will not be
>>  	 * accessed anymore.
>> @@ -463,13 +466,29 @@ struct drm_sched_backend_ops {
>>           * and it's time to clean it up.
>>  	 */
>>  	void (*free_job)(struct drm_sched_job *sched_job);
>> +
>> +	/**
>> +	 * @update_job_credits: Called once the scheduler is considering thi=
s
>> +	 * job for execution.
>> +	 *
>=20
> This whole paragraph isn't very clear of what update_job_credits does.
> Perhaps a simple and straightforward name would be more clear:
> 	get_job_credits: Returns the number of credits this job would
> 		take.
>=20
>> +	 * Drivers may use this to update the job's submission credits, whic=
h is
>> +	 * useful to e.g. deduct the number of native fences which have been=

>> +	 * signaled meanwhile.
>> +	 *
>> +	 * The callback must either return the new number of submission cred=
its
>> +	 * for the given job, or zero if no update is required.
>=20
> The word "update" is confusing here and it implies that DRM should keep=
 track
> of the previous value this function had returned.
>=20
> Perhaps we can just say:
> 	* This callback returns the number of credits this job would take if p=
ushed
> 	* to the driver/hardware. It returns 0, if this job would take no cred=
its.
>=20
> Else, driver writers would have to deduce what to return here by lookin=
g at
> drm_sched_can_queue() which effectively does:
> 	s_job->credits =3D sched->ops->update_job_credits(s_job).
>=20
>> +	 *
>> +	 * This callback is optional.
>> +	 */
>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>>  };
>> =20
>=20
> The rest is good--thanks for the changes!
>=20
>>  /**
>>   * struct drm_gpu_scheduler - scheduler instance-specific data
>>   *
>>   * @ops: backend operations provided by the driver.
>> - * @hw_submission_limit: the max size of the hardware queue.
>> + * @credit_limit: the credit limit of this scheduler
>> + * @credit_count: the current credit count of this scheduler
>>   * @timeout: the time after which a job is removed from the scheduler=
=2E
>>   * @name: name of the ring for which this scheduler is being used.
>>   * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY=
_COUNT,
>> @@ -478,7 +497,6 @@ struct drm_sched_backend_ops {
>>   * @job_scheduled: once @drm_sched_entity_do_release is called the sc=
heduler
>>   *                 waits on this wait queue until all the scheduled j=
obs are
>>   *                 finished.
>> - * @hw_rq_count: the number of jobs currently in the hardware queue.
>>   * @job_id_count: used to assign unique id to the each job.
>>   * @submit_wq: workqueue used to queue @work_run_job and @work_free_j=
ob
>>   * @timeout_wq: workqueue used to queue @work_tdr
>> @@ -502,13 +520,13 @@ struct drm_sched_backend_ops {
>>   */
>>  struct drm_gpu_scheduler {
>>  	const struct drm_sched_backend_ops	*ops;
>> -	uint32_t			hw_submission_limit;
>> +	u32				credit_limit;
>> +	atomic_t			credit_count;
>>  	long				timeout;
>>  	const char			*name;
>>  	u32                             num_rqs;
>>  	struct drm_sched_rq             **sched_rq;
>>  	wait_queue_head_t		job_scheduled;
>> -	atomic_t			hw_rq_count;
>>  	atomic64_t			job_id_count;
>>  	struct workqueue_struct		*submit_wq;
>>  	struct workqueue_struct		*timeout_wq;
>> @@ -530,14 +548,14 @@ struct drm_gpu_scheduler {
>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  		   const struct drm_sched_backend_ops *ops,
>>  		   struct workqueue_struct *submit_wq,
>> -		   u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>> +		   u32 num_rqs, u32 credit_limit, unsigned hang_limit,
>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>  		   atomic_t *score, const char *name, struct device *dev);
>> =20
>>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>  int drm_sched_job_init(struct drm_sched_job *job,
>>  		       struct drm_sched_entity *entity,
>> -		       void *owner);
>> +		       u32 credits, void *owner);
>>  void drm_sched_job_arm(struct drm_sched_job *job);
>>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>  				 struct dma_fence *fence);
>> @@ -559,7 +577,8 @@ void drm_sched_entity_modify_sched(struct drm_sche=
d_entity *entity,
>> =20
>>  void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>> +				   struct drm_sched_entity *entity);
>>  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>=20

--------------0PZrsqdyB6SoxbG7brVmqC09
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

--------------0PZrsqdyB6SoxbG7brVmqC09--

--------------xTMo5JPvGv2EPPzltDFNYSm0--

--------------A3GL7pQZvUu0kFKZWlD73YQq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZTsMagUDAAAAAAAKCRBMFUeUMaM0r7qj
AQDySMW5JpwzN6fuvSfwQu4u7Ut2OSaBJn1tSsAn9vNYmwD/UBgqW+ZNP60K6NHG1CO/j9rFeogg
ovSEuTPt578AOwM=
=Xvsi
-----END PGP SIGNATURE-----

--------------A3GL7pQZvUu0kFKZWlD73YQq--
