Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2F840DAD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 18:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FB2112A32;
	Mon, 29 Jan 2024 17:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B38910ED47;
 Mon, 29 Jan 2024 17:12:02 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-42aabb1cdaaso6273421cf.2; 
 Mon, 29 Jan 2024 09:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706548261; x=1707153061; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TqVOpsxTfTH0ummNU1TaZlcRwqQPY0j0DTr+rAGUvoA=;
 b=fQiJtQNNpycnMsY8UPYr6OhTwVW8QSV+ZHeCo8nPBaVUMtDyDnyBoFuoD2R+9WQnER
 aZq01AOzYKM6DuDZcLEaALWLWkLkKg/C+Kv3jqxg1cKzUuyA/uBtSyWQwGtQv7pjnqU5
 RRTc7NJxmhDf2kRFDl9pYY253nQLQtgRu1hPTYdbJUAlzOvQZ7CvhIBBKBniwRvJDx9x
 hgMIon8bKowrmfSU3VsqAFCuDhM2C4e3OoSQBcYL4HDeFbsUkEtpwGiiZVLQdh8vvcA7
 LY2N8/QQ3q5UllXKCaDhxf1BHanLlnHynLzY8WI+Iq5VeNjlIigyU7rrjDC9MCodf5vm
 Mnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706548261; x=1707153061;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TqVOpsxTfTH0ummNU1TaZlcRwqQPY0j0DTr+rAGUvoA=;
 b=Q0iWy58xzcsmm457737u9Tx/mInHLr6PZtror9sE2mSQxRCWMUNZy1CHZhJPQM4fcq
 5RDEVIC/w8mEN+E3z3zizF9KvyCLQQACBDBD88jUpqz+4Llh/b4GBJ0Hw9NFk12wOdyV
 7w8MDO3hVIT7qmdmel4ncPXC+HreGDhduxjWc4LppBlTeZdPhneqAdSy9Ov3/KJAAyFd
 4ok58LkpGGR/5wf5uy0qJNL6S1OD6fN+yW6H7hKKXUw7Skn03jZbbXklbpgLi6cCJce0
 xixnC7VV0juiXSfcrtmhQrrhhRnIprDNnQ0lTX8TywImanpXtXgboCLC/ItFq6pIZzje
 kKGQ==
X-Gm-Message-State: AOJu0Yybl16LFP+sxK4wd24NnvGpcoxUVXxsDIUJbn6oWGYDFXkRAWFy
 5rGG8AlDbozvuDqg0Le78vRnUGiSsq3UDEBZgf/cVJ77dRLOarvc
X-Google-Smtp-Source: AGHT+IGUUhWuacA/gCDOMeggQZoYbUADBHBfBYecP6FAP0Ce54ZvXL3zTSOEVJcVM8U3ZmXklhS0gg==
X-Received: by 2002:a05:622a:1741:b0:42a:2e4f:9aa2 with SMTP id
 l1-20020a05622a174100b0042a2e4f9aa2mr7353703qtk.54.1706548261022; 
 Mon, 29 Jan 2024 09:11:01 -0800 (PST)
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 g23-20020ac84b77000000b0042a3358bf59sm1648342qts.79.2024.01.29.09.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 09:11:00 -0800 (PST)
Message-ID: <1ad510fc-99e3-4d12-ae35-baaa8badc730@gmail.com>
Date: Mon, 29 Jan 2024 12:10:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.7.0
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
 <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
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
In-Reply-To: <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Qu1sYKlBWulHQVIt1sry4LlF"
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
Cc: dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 intel-xe@lists.freedesktop.org, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Qu1sYKlBWulHQVIt1sry4LlF
Content-Type: multipart/mixed; boundary="------------VzGJVECvdtLAp81pH610US4z";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>
Message-ID: <1ad510fc-99e3-4d12-ae35-baaa8badc730@gmail.com>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
 <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
In-Reply-To: <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>

--------------VzGJVECvdtLAp81pH610US4z
Content-Type: multipart/mixed; boundary="------------rvSh7wAeOi0Ite5hBpV5LiyD"

--------------rvSh7wAeOi0Ite5hBpV5LiyD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-01-29 02:44, Christian K=C3=B6nig wrote:
> Am 26.01.24 um 17:29 schrieb Matthew Brost:
>> On Fri, Jan 26, 2024 at 11:32:57AM +0100, Christian K=C3=B6nig wrote:
>>> Am 25.01.24 um 18:30 schrieb Matthew Brost:
>>>> On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian K=C3=B6nig wrote=
:
>>>>> Am 24.01.24 um 22:08 schrieb Matthew Brost:
>>>>>> All entities must be drained in the DRM scheduler run job worker t=
o
>>>>>> avoid the following case. An entity found that is ready, no job fo=
und
>>>>>> ready on entity, and run job worker goes idle with other entities =
+ jobs
>>>>>> ready. Draining all ready entities (i.e. loop over all ready entit=
ies)
>>>>>> in the run job worker ensures all job that are ready will be sched=
uled.
>>>>> That doesn't make sense. drm_sched_select_entity() only returns ent=
ities
>>>>> which are "ready", e.g. have a job to run.
>>>>>
>>>> That is what I thought too, hence my original design but it is not
>>>> exactly true. Let me explain.
>>>>
>>>> drm_sched_select_entity() returns an entity with a non-empty spsc qu=
eue
>>>> (job in queue) and no *current* waiting dependecies [1]. Dependecies=
 for
>>>> an entity can be added when drm_sched_entity_pop_job() is called [2]=
[3]
>>>> returning a NULL job. Thus we can get into a scenario where 2 entiti=
es
>>>> A and B both have jobs and no current dependecies. A's job is waitin=
g
>>>> B's job, entity A gets selected first, a dependecy gets installed in=

>>>> drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.=

>>> And here is the real problem. run work doesn't goes idle in that mome=
nt.
>>>
>>> drm_sched_run_job_work() should restarts itself until there is either=
 no
>>> more space in the ring buffer or it can't find a ready entity any mor=
e.
>>>
>>> At least that was the original design when that was all still driven =
by a
>>> kthread.
>>>
>>> It can perfectly be that we messed this up when switching from kthrea=
d to a
>>> work item.
>>>
>> Right, that what this patch does - the run worker does not go idle unt=
il
>> no ready entities are found. That was incorrect in the original patch
>> and fixed here. Do you have any issues with this fix? It has been test=
ed
>> 3x times and clearly fixes the issue.
>=20
> Ah! Yes in this case that patch here is a little bit ugly as well.
>=20
> The original idea was that run_job restarts so that we are able to paus=
e=20
> the submission thread without searching for an entity to submit more.
>=20
> I strongly suggest to replace the while loop with a call to=20
> drm_sched_run_job_queue() so that when the entity can't provide a job w=
e=20
> just restart the queuing work.

I agree with Christian. This more closely preserves the original design
of the GPU schedulers, so we should go with that.
--=20
Regards,
Luben

--------------rvSh7wAeOi0Ite5hBpV5LiyD
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

--------------rvSh7wAeOi0Ite5hBpV5LiyD--

--------------VzGJVECvdtLAp81pH610US4z--

--------------Qu1sYKlBWulHQVIt1sry4LlF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZbfcHAUDAAAAAAAKCRBMFUeUMaM0r3YF
APwLuKwbPwfmAGfE8TBDHTVaeVBsx+D5iJPHKCPlMwgKjQEAkSZV25S9h9+7pK7OJzXIbw0WxAXl
koAZxuejSqxX1QA=
=O+zD
-----END PGP SIGNATURE-----

--------------Qu1sYKlBWulHQVIt1sry4LlF--
