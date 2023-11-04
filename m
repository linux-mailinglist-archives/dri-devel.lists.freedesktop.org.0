Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BB7E0CB2
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 01:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997010E1A9;
	Sat,  4 Nov 2023 00:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D710410E19D;
 Sat,  4 Nov 2023 00:25:25 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-66d76904928so14602646d6.2; 
 Fri, 03 Nov 2023 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699057525; x=1699662325; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ScjmxPez8wbUpbAW0lTYQD8bLE3YUQ1FL1+ykoKqaLI=;
 b=EqVskqTHJDa4bLupJlXj/fBCrDbxCXGN7U0JIs051UeQSDqmwqSmtlCALm1JLrZsti
 zSkar70sSpWfZJ2k4IgS4UvJq+mAAf6FoivrcbHuJDfe7uG2BXA7IQZcqsDE45ncL2gS
 M2eVqh5VC0JAQ4TpMUOF70xwAz7R1/wBTaRU8PXSIYvxZJPmOP62TII8EZj0gu6ajmPP
 sOztX3RLUE9vS8M7WfIHC2E3rQoQXvAbp/eTtR1lP7oabjzdSq1N83/gEvERMGZy26Kx
 IErILm5XsEtUG6bRfir3Xg9Z4m2T0318wcegiKRbf9AoeH2gwgzyTwny196Ixpd3XXLm
 3LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699057525; x=1699662325;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ScjmxPez8wbUpbAW0lTYQD8bLE3YUQ1FL1+ykoKqaLI=;
 b=k3jBIewtxKV+gK1CHAtFJjzqGZXdGLk0fy7H49JbYAnDAoni8CKHFZfT3ryiUXPUdZ
 o2pNnzhAoJ6MnYcNu7Jm7nUsxobI9uHLPvvveHApByoIweTcfPNQ3DibB53Dd0DDwLeG
 2PpvjuexmfV/ULClfWxvWjf+E6BYiJ9gnjOpzd6KzzKSBdD63KtdaBOvvFQfKx8cn0Cd
 xrhnQitoOOp1SIIRjdTy2uPpsAFcdFtCzNyg9ZqXLH0ajbZ8D/qPSTbdbcaaoy7PS3jk
 66BPHUcuL7wB0kKV9GvK7943XSKyn6qBJZ3RPQkwGw2aVznRzrU3jE+IM9StcCBnxjk/
 d+Xg==
X-Gm-Message-State: AOJu0Yx9v6+ar6QuFOFSc9m02mKK4fUUeinwOW9izh8z+3PicJQeaYkt
 FmoH2DmCE00igL/5WUiopmI=
X-Google-Smtp-Source: AGHT+IHo3rPF8Px1GzdDqSoOsMOCb0B7+2WB3o4ybkPoZQ6IqzxJZsN6sS1ZBKcNXFwu+4kKB2ypJg==
X-Received: by 2002:a05:6214:20ce:b0:66d:9e52:a431 with SMTP id
 14-20020a05621420ce00b0066d9e52a431mr32340586qve.3.1699057524747; 
 Fri, 03 Nov 2023 17:25:24 -0700 (PDT)
Received: from [192.168.2.14]
 (bras-base-toroon0964w-grc-30-74-15-198-235.dsl.bell.ca. [74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a0ce452000000b006754772bfd4sm1203973qvm.21.2023.11.03.17.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 17:25:24 -0700 (PDT)
Message-ID: <8e1d65c7-26a1-4f72-a51e-781dbd17c29c@gmail.com>
Date: Fri, 3 Nov 2023 20:25:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
Content-Language: en-CA, en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
 <d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.intel.com>
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
In-Reply-To: <d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DDM0FKgbde0juQdRlCBw45xZ"
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ltuikov@yahoo.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DDM0FKgbde0juQdRlCBw45xZ
Content-Type: multipart/mixed; boundary="------------LeHnxOz2Q5Z01FAWkh3s6W0n";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Liviu.Dudau@arm.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 intel-xe@lists.freedesktop.org, ketil.johnsen@arm.com, lina@asahilina.net,
 ltuikov@yahoo.com, matthew.brost@intel.com, mcanal@igalia.com,
 robdclark@chromium.org, sarah.walker@imgtec.com
Message-ID: <8e1d65c7-26a1-4f72-a51e-781dbd17c29c@gmail.com>
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
 <d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.intel.com>
In-Reply-To: <d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.intel.com>

--------------LeHnxOz2Q5Z01FAWkh3s6W0n
Content-Type: multipart/mixed; boundary="------------9xWZOND0BhGy6wSyH0Jufb5N"

--------------9xWZOND0BhGy6wSyH0Jufb5N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tvrtko,

On 2023-11-03 06:39, Tvrtko Ursulin wrote:
>=20
> On 02/11/2023 22:46, Luben Tuikov wrote:
>> Eliminate drm_sched_run_job_queue_if_ready() and instead just call
>> drm_sched_run_job_queue() in drm_sched_free_job_work(). The problem is=
 that
>> the former function uses drm_sched_select_entity() to determine if the=

>> scheduler had an entity ready in one of its run-queues, and in the cas=
e of the
>> Round-Robin (RR) scheduling, the function drm_sched_rq_select_entity_r=
r() does
>> just that, selects the _next_ entity which is ready, sets up the run-q=
ueue and
>> completion and returns that entity. The FIFO scheduling algorithm is u=
naffected.
>>
>> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity=
(), then
>> in the case of RR scheduling, that would result in calling select_enti=
ty()
>> twice, which may result in skipping a ready entity if more than one en=
tity is
>> ready. This commit fixes this by eliminating the if_ready() variant.
>=20
> Fixes: is missing since the regression already landed.

Ah, yes, thank you for pointing that out. :-)
I'll add one.

>=20
>>
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 14 ++------------
>>   1 file changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/=
scheduler/sched_main.c
>> index 98b2ad54fc7071..05816e7cae8c8b 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **=
sched_list,
>>   }
>>   EXPORT_SYMBOL(drm_sched_pick_best);
>>  =20
>> -/**
>> - * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
>> - * @sched: scheduler instance
>> - */
>> -static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler=
 *sched)
>> -{
>> -	if (drm_sched_select_entity(sched))
>> -		drm_sched_run_job_queue(sched);
>> -}
>> -
>>   /**
>>    * drm_sched_free_job_work - worker to call free_job
>>    *
>> @@ -1069,7 +1059,7 @@ static void drm_sched_free_job_work(struct work_=
struct *w)
>>   		sched->ops->free_job(cleanup_job);
>>  =20
>>   		drm_sched_free_job_queue_if_done(sched);
>> -		drm_sched_run_job_queue_if_ready(sched);
>> +		drm_sched_run_job_queue(sched);
>=20
> It works but is a bit wasteful causing needless CPU wake ups with a=20

I'd not worry about "waking up the CPU" as the CPU scheduler would most l=
ikely
put the wq on the same CPU by instruction cache locality.

> potentially empty queue, both here and in drm_sched_run_job_work below.=


That's true, but if you were to look at the typical execution of
this code you'd see we get a string of function entry when the incoming q=
ueue
is non-empty, followed by one empty entry only to be taken off the CPU. S=
o,
it really isn't a breaker.

So, there's a way to mitigate this in drm_sched_run_job_work(). I'll see =
that it
makes it in the next version of the patch.

Thanks!
--=20
Regards,
Luben

--------------9xWZOND0BhGy6wSyH0Jufb5N
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

--------------9xWZOND0BhGy6wSyH0Jufb5N--

--------------LeHnxOz2Q5Z01FAWkh3s6W0n--

--------------DDM0FKgbde0juQdRlCBw45xZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUWPcwUDAAAAAAAKCRBMFUeUMaM0r75b
AQCxXmmlS8v3CIONZOAMig5BM6aZxHRa6BAtSWhqBzenSgEAjtRHVpYHTa+5rzxckoNS6p8VVrWb
EhPTKpWDVNrPJAA=
=QTla
-----END PGP SIGNATURE-----

--------------DDM0FKgbde0juQdRlCBw45xZ--
