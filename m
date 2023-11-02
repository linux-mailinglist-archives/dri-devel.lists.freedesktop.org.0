Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FBE7DFCBF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B510E2FB;
	Thu,  2 Nov 2023 22:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9E210E18B;
 Thu,  2 Nov 2023 22:59:07 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d9c7bba32beso1492766276.1; 
 Thu, 02 Nov 2023 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698965947; x=1699570747; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MY4/c9RfG+1KiVkWi3/lS+ZZIITdRz7ZMiJSrmDgH6o=;
 b=Z3QlOTpMwgUXnlw8oTnIcrLJQTgovcr59kBagD9bzWt4WZnyxhiVgS5WA29y6DcUV8
 XzLKTQgw+ja6WeX3SaDfz5C2gDQ4/3Q+djhsc5MbtBpNludRuXapcwb+onDL0YPO/tDJ
 kN+xEnBW5zZUPqCyThLGvcbDX46uZ3E4cNJ3j64d3dkIFIC9h49q32k46uXEQlb5X9WJ
 Gsdw1Uw/tiYttNcyLJhgNo8pPEycFtiqLxIS4ek/3MELRPJFHPZs8E9fowXgeyx6Fbrl
 wNxp0OV9vdhptMaA+keZ0g2zLU/HKKPyqztwZV450rTFjDjUcXALBylArxVsBB5CDkgi
 b0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965947; x=1699570747;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MY4/c9RfG+1KiVkWi3/lS+ZZIITdRz7ZMiJSrmDgH6o=;
 b=kYj/3bLmbdIQPCNT9mdGWHWJPoOiBs/Kzq6zjNXdlei4oOm1DmyN8qb5L69OGrsXeo
 3xbT2TN5Eu/mOnbcFU1XCGiFDlf7ZWP4rOAdWamMuGGLoAyF9f41eu7PoKDnZMK0lkik
 t533P1SY5WKYH+Z55Ft7IHNeeYv/NBMCCd1iEhqNQwbYPEHdoLPfzM22SQbT+/lpEMdm
 BuOfNObCywXLfXQozLxD5K3z9zIqWAyPEmkV/LQooImeiQRHR4Jx3OadfYZPYFHKOdOe
 HwAEYMGh0YhN8BnMr1oG/9yjCvzxE+4wu7/Wu2WG4kSpgEFKvhq06BZQ8g4VZINaeuNU
 xfmQ==
X-Gm-Message-State: AOJu0Yz97n5d/t6R+CMPxg7w2/6nNIhwsUlUTUWrBAJKEVtfY5BQVl6Q
 ZNblKcEYR5iwagpd6lBQvwk=
X-Google-Smtp-Source: AGHT+IHEclJBRxssAUSOtpKT3/M4VmUmXMxZeUpYP9M/8eSKEB7uncyRbCVhStSYptGXwjF5tl7N6A==
X-Received: by 2002:a25:7309:0:b0:d9a:ba25:d1f9 with SMTP id
 o9-20020a257309000000b00d9aba25d1f9mr22741617ybc.9.1698965946720; 
 Thu, 02 Nov 2023 15:59:06 -0700 (PDT)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 k6-20020ad44206000000b00668eb252523sm160566qvp.63.2023.11.02.15.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 15:59:06 -0700 (PDT)
Message-ID: <3577da06-be25-41e7-a2d7-a0c5334a7ea0@gmail.com>
Date: Thu, 2 Nov 2023 18:58:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH v8 3/5] drm/sched: Split free_job into own work item
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20231031032439.1558703-1-matthew.brost@intel.com>
 <20231031032439.1558703-4-matthew.brost@intel.com>
 <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
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
In-Reply-To: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BUZHndT5GOEav20u0Kc2wt0K"
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BUZHndT5GOEav20u0Kc2wt0K
Content-Type: multipart/mixed; boundary="------------BcoDTnAUibOyW402vGSJ005v";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Message-ID: <3577da06-be25-41e7-a2d7-a0c5334a7ea0@gmail.com>
Subject: Re: [PATCH v8 3/5] drm/sched: Split free_job into own work item
References: <20231031032439.1558703-1-matthew.brost@intel.com>
 <20231031032439.1558703-4-matthew.brost@intel.com>
 <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
In-Reply-To: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>

--------------BcoDTnAUibOyW402vGSJ005v
Content-Type: multipart/mixed; boundary="------------2F0XL9BCN19dFWhsGhA2XTZE"

--------------2F0XL9BCN19dFWhsGhA2XTZE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-02 07:13, Tvrtko Ursulin wrote:
>=20
> On 31/10/2023 03:24, Matthew Brost wrote:
>> Rather than call free_job and run_job in same work item have a dedicat=
ed
>> work item for each. This aligns with the design and intended use of wo=
rk
>> queues.
>>
>> v2:
>>     - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>>       timestamp in free_job() work item (Danilo)
>> v3:
>>    - Drop forward dec of drm_sched_select_entity (Boris)
>>    - Return in drm_sched_run_job_work if entity NULL (Boris)
>> v4:
>>    - Replace dequeue with peek and invert logic (Luben)
>>    - Wrap to 100 lines (Luben)
>>    - Update comments for *_queue / *_queue_if_ready functions (Luben)
>> v5:
>>    - Drop peek argument, blindly reinit idle (Luben)
>>    - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_d=
one (Luben)
>>    - Update work_run_job & work_free_job kernel doc (Luben)
>> v6:
>>    - Do not move drm_sched_select_entity in file (Luben)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 146 +++++++++++++++++------=
--
>>   include/drm/gpu_scheduler.h            |   4 +-
>>   2 files changed, 101 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/=
scheduler/sched_main.c
>> index d1ae05bded15..3b1b2f8eafe8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -265,6 +265,32 @@ static void drm_sched_run_job_queue(struct drm_gp=
u_scheduler *sched)
>>   		queue_work(sched->submit_wq, &sched->work_run_job);
>>   }
>>  =20
>> +/**
>> + * drm_sched_free_job_queue - enqueue free-job work
>> + * @sched: scheduler instance
>> + */
>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)=

>> +{
>> +	if (!READ_ONCE(sched->pause_submit))
>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>> +}
>> +
>> +/**
>> + * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
>> + * @sched: scheduler instance
>> + */
>> +static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler=
 *sched)
>> +{
>> +	struct drm_sched_job *job;
>> +
>> +	spin_lock(&sched->job_list_lock);
>> +	job =3D list_first_entry_or_null(&sched->pending_list,
>> +				       struct drm_sched_job, list);
>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>> +		drm_sched_free_job_queue(sched);
>> +	spin_unlock(&sched->job_list_lock);
>> +}
>> +
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -284,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_jo=
b *s_job, int result)
>>   	dma_fence_get(&s_fence->finished);
>>   	drm_sched_fence_finished(s_fence, result);
>>   	dma_fence_put(&s_fence->finished);
>> -	drm_sched_run_job_queue(sched);
>> +	drm_sched_free_job_queue(sched);
>>   }
>>  =20
>>   /**
>> @@ -943,8 +969,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_schedule=
r *sched)
>>   						typeof(*next), list);
>>  =20
>>   		if (next) {
>> -			next->s_fence->scheduled.timestamp =3D
>> -				dma_fence_timestamp(&job->s_fence->finished);
>> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>> +				     &next->s_fence->scheduled.flags))
>> +				next->s_fence->scheduled.timestamp =3D
>> +					dma_fence_timestamp(&job->s_fence->finished);
>>   			/* start TO timer for next job */
>>   			drm_sched_start_timeout(sched);
>>   		}
>> @@ -994,7 +1022,40 @@ drm_sched_pick_best(struct drm_gpu_scheduler **s=
ched_list,
>>   EXPORT_SYMBOL(drm_sched_pick_best);
>>  =20
>>   /**
>> - * drm_sched_run_job_work - main scheduler thread
>> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
>> + * @sched: scheduler instance
>> + */
>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler=
 *sched)
>> +{
>> +	if (drm_sched_select_entity(sched))
>> +		drm_sched_run_job_queue(sched);
>> +}
>> +
>> +/**
>> + * drm_sched_free_job_work - worker to call free_job
>> + *
>> + * @w: free job work
>> + */
>> +static void drm_sched_free_job_work(struct work_struct *w)
>> +{
>> +	struct drm_gpu_scheduler *sched =3D
>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>> +	struct drm_sched_job *cleanup_job;
>> +
>> +	if (READ_ONCE(sched->pause_submit))
>> +		return;
>> +
>> +	cleanup_job =3D drm_sched_get_cleanup_job(sched);
>> +	if (cleanup_job) {
>> +		sched->ops->free_job(cleanup_job);
>> +
>> +		drm_sched_free_job_queue_if_done(sched);
>> +		drm_sched_run_job_queue_if_ready(sched);
>=20
> Are finished jobs now disturbing the round robin selection?
>=20
> Every time this cleans up a job we get:
>=20
> drm_sched_run_job_queue_if_ready
>   -> drm_sched_select_entity
>       -> drm_sched_rq_select_entity_rr
>           -> rq->current_entity bumped to next in list
>=20
> So when the job run worker does:
>=20
> 	entity =3D drm_sched_select_entity(sched);
>=20
> It does not pick the same entity as before this patch? If so perhaps=20
> drm_sched_run_job_queue_if_ready needs a "peek" helper which does not=20
> modify any state.

Hi Tvrtko,

Thank you for reporting this. I've sent out a patch.
--=20
Regards,
Luben

--------------2F0XL9BCN19dFWhsGhA2XTZE
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

--------------2F0XL9BCN19dFWhsGhA2XTZE--

--------------BcoDTnAUibOyW402vGSJ005v--

--------------BUZHndT5GOEav20u0Kc2wt0K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUQpsAUDAAAAAAAKCRBMFUeUMaM0r67Q
AP49xl7DzqwWCvetwhSGy9hlXsiyGf/zMWB+7dHVmZYJWwD/QAIrdrmtUnXRqsHQUQJeRyaWQ+4m
ygTU14h2j557Cwk=
=tPvq
-----END PGP SIGNATURE-----

--------------BUZHndT5GOEav20u0Kc2wt0K--
