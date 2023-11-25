Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499BF7F8843
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 05:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759810E213;
	Sat, 25 Nov 2023 04:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41A210E169;
 Sat, 25 Nov 2023 04:22:32 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4239f2c1209so4917811cf.2; 
 Fri, 24 Nov 2023 20:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700886152; x=1701490952; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C4cyRYj7WcHa1hia+RC9t/My5KCej0dk3QVRPqMEvA8=;
 b=LEHvsnT3XY0LHNRCJwU5RfOLj8IN6FgS/kuipqevXIqsA63uStOEp3X66YLw9mfPXR
 JdrGe0/3+VotftwWuKFwN92TMkztIyHm6XHGIf+xq7WTdQgiP1HWYAQ+ZPF7E+pJKDj0
 qr6o1/PP8ncADSt2LmlwqmvPQAHVejfgQvmPgMDyoamLvjG13pvy9Po3K/5fnO9C4ppj
 zo5s6/6x/DmeI5mk9fxN2tTFDayqiUy72Vyh35SP1UKWOmbUZAKVhPLmJ4oPcQuGb9+g
 75/9OiCAVZ9vrY159mwCmq/6jmbkiVp0fDUhvuJhL2RGm8Yjq0hZNu6m9HKZZRI2QW0u
 1hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700886152; x=1701490952;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C4cyRYj7WcHa1hia+RC9t/My5KCej0dk3QVRPqMEvA8=;
 b=nBlriIpgTcIBvzh4jUM1rdnZ8dJqUUy0B+y86rsRMQLVcItpT9LPb4oJswE62MNcKn
 q0tGmPF52ixhdt+DbK/5p300CG5gYaGdgf0UU7EeOsa1g2y1QCtyS9LIN7ElTBSf8Bgy
 iU6bii5ocllrJXNJZkXvBDPwWgPBjYn8YUoRBp4+Rc7GYP6BH0SEJTNKyOE1Ho87mQH4
 6Z34NW9FBT2XYlQlXIybqslO2XFsJGnjW6zoEC23bo4zCmtGh2HrB+uD6RYexLV9WfwG
 Qqwx3z6gqNPNmBoEJ6jfMEU9FUa2YRuUiAyVuNzRmd37b0C81mDEXZ7COSjtRm+np0sS
 FEcA==
X-Gm-Message-State: AOJu0Yyv3/grSk/3fxX3Gt7E7/nav/WJyibqNmQ1mf8Ad6QPCtJJ0KxO
 2u5xxWl7GV7zmfivS7wkhj0=
X-Google-Smtp-Source: AGHT+IFidHondHuBPz7boNTBVdMM/F7esBJTzYFabJaW53AO2ELZa9WifGvR5DwYvijt13wHTXq7fg==
X-Received: by 2002:a05:622a:1493:b0:417:fe9c:6dce with SMTP id
 t19-20020a05622a149300b00417fe9c6dcemr6051337qtx.25.1700886151682; 
 Fri, 24 Nov 2023 20:22:31 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac85487000000b0041eadf108aasm1764382qtq.75.2023.11.24.20.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 20:22:31 -0800 (PST)
Message-ID: <5ecbd3ae-105c-49ad-b40e-6f096fc14309@gmail.com>
Date: Fri, 24 Nov 2023 23:22:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-6-ltuikov89@gmail.com>
 <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
 <9226e1d4-82f6-4c14-9170-4449de36804e@gmail.com>
 <dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com>
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
In-Reply-To: <dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NuEney03FDcrAsUjPVi0Ie5B"
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NuEney03FDcrAsUjPVi0Ie5B
Content-Type: multipart/mixed; boundary="------------0Mh5IJRVMxx22LV4FwpSK9PF";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <5ecbd3ae-105c-49ad-b40e-6f096fc14309@gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-6-ltuikov89@gmail.com>
 <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
 <9226e1d4-82f6-4c14-9170-4449de36804e@gmail.com>
 <dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com>
In-Reply-To: <dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com>

--------------0Mh5IJRVMxx22LV4FwpSK9PF
Content-Type: multipart/mixed; boundary="------------N5Mhm1qLRrr04hZGnLkRf1gD"

--------------N5Mhm1qLRrr04hZGnLkRf1gD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-24 04:38, Christian K=C3=B6nig wrote:
> Am 24.11.23 um 09:22 schrieb Luben Tuikov:
>> On 2023-11-24 03:04, Christian K=C3=B6nig wrote:
>>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>>> Reverse run-queue priority enumeration such that the higest priority=
 is now 0,
>>>> and for each consecutive integer the prioirty diminishes.
>>>>
>>>> Run-queues correspond to priorities. To an external observer a sched=
uler
>>>> created with a single run-queue, and another created with
>>>> DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedul=
e
>>>> sched->sched_rq[0] with the same "priority", as that index run-queue=
 exists in
>>>> both schedulers, i.e. a scheduler with one run-queue or many. This p=
atch makes
>>>> it so.
>>>>
>>>> In other words, the "priority" of sched->sched_rq[n], n >=3D 0, is t=
he same for
>>>> any scheduler created with any allowable number of run-queues (prior=
ities), 0
>>>> to DRM_SCHED_PRIORITY_COUNT.
>>>>
>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>> Cc: linux-arm-msm@vger.kernel.org
>>>> Cc: freedreno@lists.freedesktop.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>>>>    drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
>>>>    drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
>>>>    include/drm/gpu_scheduler.h              |  6 +++---
>>>>    5 files changed, 16 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_job.c
>>>> index 1a25931607c514..71a5cf37b472d4 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> @@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct dr=
m_gpu_scheduler *sched)
>>>>    	int i;
>>>>   =20
>>>>    	/* Signal all jobs not yet scheduled */
>>>> -	for (i =3D sched->num_rqs - 1; i >=3D DRM_SCHED_PRIORITY_LOW; i--)=
 {
>>>> +	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>>    		struct drm_sched_rq *rq =3D sched->sched_rq[i];
>>>>    		spin_lock(&rq->lock);
>>>>    		list_for_each_entry(s_entity, &rq->entities, list) {
>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm=
_gpu.h
>>>> index eb0c97433e5f8a..2bfcb222e35338 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>> @@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
>>>>     * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially =
in some
>>>>     * cases, so we don't use it (no need for kernel generated jobs).=

>>>>     */
>>>> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHE=
D_PRIORITY_LOW)
>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED=
_PRIORITY_HIGH)
>>>>   =20
>>>>    /**
>>>>     * struct msm_file_private - per-drm_file context
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/=
drm/scheduler/sched_entity.c
>>>> index cb7445be3cbb4e..6e2b02e45e3a32 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -81,14 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entit=
y *entity,
>>>>    		 */
>>>>    		pr_warn("%s: called with uninitialized scheduler\n", __func__);=

>>>>    	} else if (num_sched_list) {
>>>> -		/* The "priority" of an entity cannot exceed the number
>>>> -		 * of run-queues of a scheduler.
>>>> +		/* The "priority" of an entity cannot exceed the number of
>>>> +		 * run-queues of a scheduler. Choose the lowest priority
>>>> +		 * available.
>>>>    		 */
>>>>    		if (entity->priority >=3D sched_list[0]->num_rqs) {
>>>>    			drm_err(sched_list[0], "entity with out-of-bounds priority:%u =
num_rqs:%u\n",
>>>>    				entity->priority, sched_list[0]->num_rqs);
>>>>    			entity->priority =3D max_t(s32, (s32) sched_list[0]->num_rqs -=
 1,
>>>> -						 (s32) DRM_SCHED_PRIORITY_LOW);
>>>> +						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>>> That seems to be a no-op. You basically say max_T(.., num_rqs - 1, 0)=
,
>>> this will always be num_rqs - 1
>> This protects against num_rqs being equal to 0, in which case we selec=
t KERNEL (0).
>=20
> Ah! That's also why convert it to signed! I was already wondering why=20
> you do this.

I thought it was clear since we're doing,

	num_rqs - 1

and there's no guarantee that the result would be non-negative even if th=
e variable
num_rqs was non-negative. But I've added an explanation of what's going o=
n here.

>>
>> This comes from "[PATCH] drm/sched: Fix bounds limiting when given a m=
alformed entity"
>> which I sent yesterday (Message-ID: <20231123122422.167832-2-ltuikov89=
@gmail.com>).
>=20
> I can't find that one in my inbox anywhere, but was able to find it in =

> patchwork.

Did you check your gmail?
=20
>> Could you R-B that patch too?
>=20
> I would add a comment cause the intention of max_t(s32 is really not=20
> obvious here.
>=20
> With that done feel free to add my rb to both patches.

Done.
--=20
Regards,
Luben

--------------N5Mhm1qLRrr04hZGnLkRf1gD
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

--------------N5Mhm1qLRrr04hZGnLkRf1gD--

--------------0Mh5IJRVMxx22LV4FwpSK9PF--

--------------NuEney03FDcrAsUjPVi0Ie5B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWF2fgUDAAAAAAAKCRBMFUeUMaM0r4XG
AP0QGGxEyImPiwKGa5LyJn0QTuGzbesSeVe8fCW6aKn3CwD/fYjuVtF5WBGfnnNvS6lVMA3R9bpo
w+dMaRTpKUVjiAo=
=JifR
-----END PGP SIGNATURE-----

--------------NuEney03FDcrAsUjPVi0Ie5B--
