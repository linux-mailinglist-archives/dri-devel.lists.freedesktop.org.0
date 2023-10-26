Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B78A7D867A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 18:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5611410E133;
	Thu, 26 Oct 2023 16:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699E910E131;
 Thu, 26 Oct 2023 16:09:28 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-66d76904928so7430366d6.2; 
 Thu, 26 Oct 2023 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698336567; x=1698941367; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6SXKBOE1eJu4Kkt0aTQrsh166slfKTr8SQel7LF09x8=;
 b=c5YotAnvTHhOq3QglRw5LxEROFbpk/MdZ/JApnDvXArQvsl3nMr0gJ0RgtFPxaPW6F
 M3I/c9g84fuOG9sWFOFFVxTHXQsFp6KcjY6e9ef1e1wOdwziJUBl1RrfRxnIMZXmkdvz
 oCOlihi/tp27/+6g6D8JtRKUy69ujbReFpCP0DU7UnfjKcFNkOzYzx6lXcYzIFK2fQxb
 MmlH+QbdmSiVJyVyoKfb1PPoPQ5+5hFC+AtcVTxeMfMgb914MMoZ7dZi2uLXZM1sfbLw
 LHvOreDbSpe5jQVeXYN5tVnEjMxzZZDGy70BR8Pwe4ZYeDqMSxFbg4+Elu2zC0fkPuoW
 cs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698336567; x=1698941367;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6SXKBOE1eJu4Kkt0aTQrsh166slfKTr8SQel7LF09x8=;
 b=bFvLbo2OVinbEbDxhhGlynMoZo0cGUBgxrZoUQ6Svp1NlU4RdhtAkGmxXI6mWLzxYU
 FQ2V4b+eIaCrYyoLiQuRU0TbELBm1R/PI+XH8h1A6kr3DUj440/LOG75rGockDGAVBVT
 aF+/lNSPFA87xXke3hqRrr2s93lhmC0U6BInT+TKO8nLmL0pD7U+vWB0KfybR2ZJGlfc
 IDgZWUe+dpldUOmyCGZ4G+5y5IGhKh/w9jCq12TlgAwJGy/3l5ArWdoYv0tUv+cC9uGU
 F2+mkg4ZY45pY7c8CtefxMpD6u0uoNgfCwifFJ7XqG72ZZYSNLSPPDfe6LYDnZPUV247
 qIVA==
X-Gm-Message-State: AOJu0Yww7dNQZ5T3cUvVp1tTYVEaUd30v21pYFsKjrvfVt38voeF3fbX
 OfQq1QOgnKrfVd0Ox6eyxWE=
X-Google-Smtp-Source: AGHT+IF1hIBIq3qOz5632/HHxjy899XfrqPHn+L0XmNE1Qe7xgnY2FcQHWVKSNEtnfiV3crN0LArKg==
X-Received: by 2002:a05:6214:1c46:b0:66d:5ea8:a7ba with SMTP id
 if6-20020a0562141c4600b0066d5ea8a7bamr106081qvb.1.1698336567099; 
 Thu, 26 Oct 2023 09:09:27 -0700 (PDT)
Received: from [192.168.2.14] ([64.231.246.137])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a0cc211000000b006624e9d51d9sm5291552qvh.76.2023.10.26.09.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 09:09:26 -0700 (PDT)
Message-ID: <1e26d74c-968e-41bb-a989-8e61c2afa726@gmail.com>
Date: Thu, 26 Oct 2023 12:09:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
To: Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20231023032251.164775-1-luben.tuikov@amd.com>
 <0b67a7c7-95d3-4f6c-9289-ba939fd65982@amd.com>
Content-Language: en-CA, en-US
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
In-Reply-To: <0b67a7c7-95d3-4f6c-9289-ba939fd65982@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wFxN0leZNSlSyB9SCAG2WyAA"
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
Cc: Matthew Brost <matthew.brost@intel.com>, ltuikov@yahoo.com,
 lima@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 nouveau@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wFxN0leZNSlSyB9SCAG2WyAA
Content-Type: multipart/mixed; boundary="------------QFfEMX0SiT2XqPJy7Z2TdzgS";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Emma Anholt <emma@anholt.net>, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 ltuikov@yahoo.com
Message-ID: <1e26d74c-968e-41bb-a989-8e61c2afa726@gmail.com>
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
References: <20231023032251.164775-1-luben.tuikov@amd.com>
 <0b67a7c7-95d3-4f6c-9289-ba939fd65982@amd.com>
In-Reply-To: <0b67a7c7-95d3-4f6c-9289-ba939fd65982@amd.com>

--------------QFfEMX0SiT2XqPJy7Z2TdzgS
Content-Type: multipart/mixed; boundary="------------Fnh462ke60BbFRLGTI6hMoU0"

--------------Fnh462ke60BbFRLGTI6hMoU0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I've pushed this commit as I got a verbal Acked-by from Christian in our =
kernel meeting this morning.

Matt, please rebase your patches to drm-misc-next.

Regards,
Luben

On 2023-10-26 11:20, Luben Tuikov wrote:
> Ping!
>=20
> On 2023-10-22 23:22, Luben Tuikov wrote:
>> The GPU scheduler has now a variable number of run-queues, which are s=
et up at
>> drm_sched_init() time. This way, each driver announces how many run-qu=
eues it
>> requires (supports) per each GPU scheduler it creates. Note, that run-=
queues
>> correspond to scheduler "priorities", thus if the number of run-queues=
 is set
>> to 1 at drm_sched_init(), then that scheduler supports a single run-qu=
eue,
>> i.e. single "priority". If a driver further sets a single entity per
>> run-queue, then this creates a 1-to-1 correspondence between a schedul=
er and
>> a scheduled entity.
>>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>> Cc: Qiang Yu <yuq825@gmail.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Emma Anholt <emma@anholt.net>
>> Cc: etnaviv@lists.freedesktop.org
>> Cc: lima@lists.freedesktop.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 +-
>>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  1 +
>>  drivers/gpu/drm/lima/lima_sched.c          |  4 +-
>>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
>>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  1 +
>>  drivers/gpu/drm/panfrost/panfrost_job.c    |  1 +
>>  drivers/gpu/drm/scheduler/sched_entity.c   | 18 +++++-
>>  drivers/gpu/drm/scheduler/sched_main.c     | 74 ++++++++++++++++++---=
-
>>  drivers/gpu/drm/v3d/v3d_sched.c            |  5 ++
>>  include/drm/gpu_scheduler.h                |  9 ++-
>>  11 files changed, 98 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c
>> index 2b8356699f235d..251995a90bbe69 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct =
amdgpu_device *adev)
>>  		}
>> =20
>>  		r =3D drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> +				   DRM_SCHED_PRIORITY_COUNT,
>>  				   ring->num_hw_submission, 0,
>>  				   timeout, adev->reset_domain->wq,
>>  				   ring->sched_score, ring->name,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_job.c
>> index 78476bc75b4e1d..1f357198533f3e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -325,8 +325,8 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_=
gpu_scheduler *sched)
>>  	int i;
>> =20
>>  	/* Signal all jobs not yet scheduled */
>> -	for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIORITY_M=
IN; i--) {
>> -		struct drm_sched_rq *rq =3D &sched->sched_rq[i];
>> +	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_MIN; i--) {=

>> +		struct drm_sched_rq *rq =3D sched->sched_rq[i];
>>  		spin_lock(&rq->lock);
>>  		list_for_each_entry(s_entity, &rq->entities, list) {
>>  			while ((s_job =3D to_drm_sched_job(spsc_queue_pop(&s_entity->job_q=
ueue)))) {
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm=
/etnaviv/etnaviv_sched.c
>> index 345fec6cb1a4c1..9b79f218e21afc 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> @@ -135,6 +135,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>  	int ret;
>> =20
>>  	ret =3D drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>> +			     DRM_SCHED_PRIORITY_COUNT,
>>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>  			     msecs_to_jiffies(500), NULL, NULL,
>>  			     dev_name(gpu->dev), gpu->dev);
>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/=
lima_sched.c
>> index ffd91a5ee29901..295f0353a02e58 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -488,7 +488,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *p=
ipe, const char *name)
>> =20
>>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>> =20
>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>> +	return drm_sched_init(&pipe->base, &lima_sched_ops,
>> +			      DRM_SCHED_PRIORITY_COUNT,
>> +			      1,
>>  			      lima_job_hang_limit,
>>  			      msecs_to_jiffies(timeout), NULL,
>>  			      NULL, name, pipe->ldev->dev);
>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/ms=
m/msm_ringbuffer.c
>> index 40c0bc35a44cee..95257ab0185dc4 100644
>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>> @@ -95,8 +95,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm=
_gpu *gpu, int id,
>>  	sched_timeout =3D MAX_SCHEDULE_TIMEOUT;
>> =20
>>  	ret =3D drm_sched_init(&ring->sched, &msm_sched_ops,
>> -			num_hw_submissions, 0, sched_timeout,
>> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>> +			     DRM_SCHED_PRIORITY_COUNT,
>> +			     num_hw_submissions, 0, sched_timeout,
>> +			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>  	if (ret) {
>>  		goto fail;
>>  	}
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm=
/nouveau/nouveau_sched.c
>> index 3b7ea522122605..7c376c4ccdcf9b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> @@ -436,6 +436,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>  		return -ENOMEM;
>> =20
>>  	return drm_sched_init(sched, &nouveau_sched_ops,
>> +			      DRM_SCHED_PRIORITY_COUNT,
>>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>  }
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm=
/panfrost/panfrost_job.c
>> index a8b4827dc42586..95510d481fab3a 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -832,6 +832,7 @@ int panfrost_job_init(struct panfrost_device *pfde=
v)
>> =20
>>  		ret =3D drm_sched_init(&js->queue[j].sched,
>>  				     &panfrost_sched_ops,
>> +				     DRM_SCHED_PRIORITY_COUNT,
>>  				     nentries, 0,
>>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>  				     pfdev->reset.wq,
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/dr=
m/scheduler/sched_entity.c
>> index a42763e1429dc1..409e4256f6e7d6 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -75,8 +75,20 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
>>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>> =20
>> -	if(num_sched_list)
>> -		entity->rq =3D &sched_list[0]->sched_rq[entity->priority];
>> +	if (!sched_list[0]->sched_rq) {
>> +		/* Warn drivers not to do this and to fix their DRM
>> +		 * calling order.
>> +		 */
>> +		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>> +	} else if (num_sched_list) {
>> +		/* The "priority" of an entity cannot exceed the number
>> +		 * of run-queues of a scheduler.
>> +		 */
>> +		if (entity->priority >=3D sched_list[0]->num_rqs)
>> +			entity->priority =3D max_t(u32, sched_list[0]->num_rqs,
>> +						 DRM_SCHED_PRIORITY_MIN);
>> +		entity->rq =3D sched_list[0]->sched_rq[entity->priority];
>> +	}
>> =20
>>  	init_completion(&entity->entity_idle);
>> =20
>> @@ -533,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_e=
ntity *entity)
>> =20
>>  	spin_lock(&entity->rq_lock);
>>  	sched =3D drm_sched_pick_best(entity->sched_list, entity->num_sched_=
list);
>> -	rq =3D sched ? &sched->sched_rq[entity->priority] : NULL;
>> +	rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
>>  	if (rq !=3D entity->rq) {
>>  		drm_sched_rq_remove_entity(entity->rq, entity);
>>  		entity->rq =3D rq;
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/=
scheduler/sched_main.c
>> index 5a3a622fc672f3..99797a8c836ac7 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -632,8 +632,14 @@ int drm_sched_job_init(struct drm_sched_job *job,=

>>  		       struct drm_sched_entity *entity,
>>  		       void *owner)
>>  {
>> -	if (!entity->rq)
>> +	if (!entity->rq) {
>> +		/* This will most likely be followed by missing frames
>> +		 * or worse--a blank screen--leave a trail in the
>> +		 * logs, so this can be debugged easier.
>> +		 */
>> +		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>>  		return -ENOENT;
>> +	}
>> =20
>>  	job->entity =3D entity;
>>  	job->s_fence =3D drm_sched_fence_alloc(entity, owner);
>> @@ -671,7 +677,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>  	sched =3D entity->rq->sched;
>> =20
>>  	job->sched =3D sched;
>> -	job->s_priority =3D entity->rq - sched->sched_rq;
>> +	job->s_priority =3D entity->priority;
>>  	job->id =3D atomic64_inc_return(&sched->job_id_count);
>> =20
>>  	drm_sched_fence_init(job->s_fence, job->entity);
>> @@ -888,10 +894,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler=
 *sched)
>>  		return NULL;
>> =20
>>  	/* Kernel run queue has higher priority than normal run queue*/
>> -	for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIORITY_M=
IN; i--) {
>> +	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_MIN; i--) {=

>>  		entity =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO ?
>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>> +			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
>> +			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
>>  		if (entity)
>>  			break;
>>  	}
>> @@ -1071,6 +1077,7 @@ static int drm_sched_main(void *param)
>>   *
>>   * @sched: scheduler instance
>>   * @ops: backend operations for this scheduler
>> + * @num_rqs: number of runqueues, one for each priority, up to DRM_SC=
HED_PRIORITY_COUNT
>>   * @hw_submission: number of hw submissions that can be in flight
>>   * @hang_limit: number of times to allow a job to hang before droppin=
g it
>>   * @timeout: timeout value in jiffies for the scheduler
>> @@ -1084,11 +1091,12 @@ static int drm_sched_main(void *param)
>>   */
>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  		   const struct drm_sched_backend_ops *ops,
>> -		   unsigned hw_submission, unsigned hang_limit,
>> +		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>  		   atomic_t *score, const char *name, struct device *dev)
>>  {
>>  	int i, ret;
>> +
>>  	sched->ops =3D ops;
>>  	sched->hw_submission_limit =3D hw_submission;
>>  	sched->name =3D name;
>> @@ -1097,8 +1105,36 @@ int drm_sched_init(struct drm_gpu_scheduler *sc=
hed,
>>  	sched->hang_limit =3D hang_limit;
>>  	sched->score =3D score ? score : &sched->_score;
>>  	sched->dev =3D dev;
>> -	for (i =3D DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++=
)
>> -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>> +
>> +	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>> +		/* This is a gross violation--tell drivers what the  problem is.
>> +		 */
>> +		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORI=
TY_COUNT\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	} else if (sched->sched_rq) {
>> +		/* Not an error, but warn anyway so drivers can
>> +		 * fine-tune their DRM calling order, and return all
>> +		 * is good.
>> +		 */
>> +		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
>> +		return 0;
>> +	}
>> +
>> +	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched->sched_rq),=

>> +					GFP_KERNEL | __GFP_ZERO);
>> +	if (!sched->sched_rq) {
>> +		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
>> +		return -ENOMEM;
>> +	}
>> +	sched->num_rqs =3D num_rqs;
>> +	ret =3D -ENOMEM;
>> +	for (i =3D DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
>> +		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]), GFP_KER=
NEL);
>> +		if (!sched->sched_rq[i])
>> +			goto Out_unroll;
>> +		drm_sched_rq_init(sched, sched->sched_rq[i]);
>> +	}
>> =20
>>  	init_waitqueue_head(&sched->wake_up_worker);
>>  	init_waitqueue_head(&sched->job_scheduled);
>> @@ -1115,11 +1151,18 @@ int drm_sched_init(struct drm_gpu_scheduler *s=
ched,
>>  		ret =3D PTR_ERR(sched->thread);
>>  		sched->thread =3D NULL;
>>  		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", n=
ame);
>> -		return ret;
>> +		goto Out_unroll;
>>  	}
>> =20
>>  	sched->ready =3D true;
>>  	return 0;
>> +Out_unroll:
>> +	for (--i ; i >=3D DRM_SCHED_PRIORITY_MIN; i--)
>> +		kfree(sched->sched_rq[i]);
>> +	kfree(sched->sched_rq);
>> +	sched->sched_rq =3D NULL;
>> +	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n",=
 __func__);
>> +	return ret;
>>  }
>>  EXPORT_SYMBOL(drm_sched_init);
>> =20
>> @@ -1138,8 +1181,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sc=
hed)
>>  	if (sched->thread)
>>  		kthread_stop(sched->thread);
>> =20
>> -	for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIORITY_M=
IN; i--) {
>> -		struct drm_sched_rq *rq =3D &sched->sched_rq[i];
>> +	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_MIN; i--) {=

>> +		struct drm_sched_rq *rq =3D sched->sched_rq[i];
>> =20
>>  		spin_lock(&rq->lock);
>>  		list_for_each_entry(s_entity, &rq->entities, list)
>> @@ -1150,7 +1193,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sc=
hed)
>>  			 */
>>  			s_entity->stopped =3D true;
>>  		spin_unlock(&rq->lock);
>> -
>> +		kfree(sched->sched_rq[i]);
>>  	}
>> =20
>>  	/* Wakeup everyone stuck in drm_sched_entity_flush for this schedule=
r */
>> @@ -1160,6 +1203,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sc=
hed)
>>  	cancel_delayed_work_sync(&sched->work_tdr);
>> =20
>>  	sched->ready =3D false;
>> +	kfree(sched->sched_rq);
>> +	sched->sched_rq =3D NULL;
>>  }
>>  EXPORT_SYMBOL(drm_sched_fini);
>> =20
>> @@ -1186,9 +1231,10 @@ void drm_sched_increase_karma(struct drm_sched_=
job *bad)
>>  	if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
>>  		atomic_inc(&bad->karma);
>> =20
>> -		for (i =3D DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
>> +		for (i =3D DRM_SCHED_PRIORITY_MIN;
>> +		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PR=
IORITY_KERNEL);
>>  		     i++) {
>> -			struct drm_sched_rq *rq =3D &sched->sched_rq[i];
>> +			struct drm_sched_rq *rq =3D sched->sched_rq[i];
>> =20
>>  			spin_lock(&rq->lock);
>>  			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d=
_sched.c
>> index 06238e6d7f5cda..038e1ae589c718 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -389,6 +389,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>> =20
>>  	ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
>>  			     &v3d_bin_sched_ops,
>> +			     DRM_SCHED_PRIORITY_COUNT,
>>  			     hw_jobs_limit, job_hang_limit,
>>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>>  			     NULL, "v3d_bin", v3d->drm.dev);
>> @@ -397,6 +398,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>> =20
>>  	ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>>  			     &v3d_render_sched_ops,
>> +			     DRM_SCHED_PRIORITY_COUNT,
>>  			     hw_jobs_limit, job_hang_limit,
>>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>>  			     NULL, "v3d_render", v3d->drm.dev);
>> @@ -405,6 +407,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>> =20
>>  	ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
>>  			     &v3d_tfu_sched_ops,
>> +			     DRM_SCHED_PRIORITY_COUNT,
>>  			     hw_jobs_limit, job_hang_limit,
>>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>>  			     NULL, "v3d_tfu", v3d->drm.dev);
>> @@ -414,6 +417,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>>  	if (v3d_has_csd(v3d)) {
>>  		ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
>>  				     &v3d_csd_sched_ops,
>> +				     DRM_SCHED_PRIORITY_COUNT,
>>  				     hw_jobs_limit, job_hang_limit,
>>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>>  				     NULL, "v3d_csd", v3d->drm.dev);
>> @@ -422,6 +426,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>> =20
>>  		ret =3D drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>>  				     &v3d_cache_clean_sched_ops,
>> +				     DRM_SCHED_PRIORITY_COUNT,
>>  				     hw_jobs_limit, job_hang_limit,
>>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>>  				     NULL, "v3d_cache_clean", v3d->drm.dev);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h=

>> index ac65f0626cfc91..d2fb81e34174dc 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -471,7 +471,9 @@ struct drm_sched_backend_ops {
>>   * @hw_submission_limit: the max size of the hardware queue.
>>   * @timeout: the time after which a job is removed from the scheduler=
=2E
>>   * @name: name of the ring for which this scheduler is being used.
>> - * @sched_rq: priority wise array of run queues.
>> + * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY=
_COUNT,
>> + *           as there's usually one run-queue per priority, but could=
 be less.
>> + * @sched_rq: An allocated array of run-queues of size @num_rqs;
>>   * @wake_up_worker: the wait queue on which the scheduler sleeps unti=
l a job
>>   *                  is ready to be scheduled.
>>   * @job_scheduled: once @drm_sched_entity_do_release is called the sc=
heduler
>> @@ -500,7 +502,8 @@ struct drm_gpu_scheduler {
>>  	uint32_t			hw_submission_limit;
>>  	long				timeout;
>>  	const char			*name;
>> -	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>> +	u32                             num_rqs;
>> +	struct drm_sched_rq             **sched_rq;
>>  	wait_queue_head_t		wake_up_worker;
>>  	wait_queue_head_t		job_scheduled;
>>  	atomic_t			hw_rq_count;
>> @@ -520,7 +523,7 @@ struct drm_gpu_scheduler {
>> =20
>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  		   const struct drm_sched_backend_ops *ops,
>> -		   uint32_t hw_submission, unsigned hang_limit,
>> +		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>  		   atomic_t *score, const char *name, struct device *dev);
>> =20
>>
>> base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
>=20

--------------Fnh462ke60BbFRLGTI6hMoU0
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

--------------Fnh462ke60BbFRLGTI6hMoU0--

--------------QFfEMX0SiT2XqPJy7Z2TdzgS--

--------------wFxN0leZNSlSyB9SCAG2WyAA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZTqPKgUDAAAAAAAKCRBMFUeUMaM0r1Ut
AQCjyHhcNy5ydeKDO4cJdgmxZzL2V8TUYMYrmNcmaWKO7wD9HO2hcdC56Pitidvbf3Vscw3wSZSI
xBUxsgDf10JLHAQ=
=HhXU
-----END PGP SIGNATURE-----

--------------wFxN0leZNSlSyB9SCAG2WyAA--
