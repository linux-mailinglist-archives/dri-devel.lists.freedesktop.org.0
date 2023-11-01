Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2AE7DDAB4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 02:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3F810E121;
	Wed,  1 Nov 2023 01:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8E910E121;
 Wed,  1 Nov 2023 01:46:11 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7789923612dso435302885a.0; 
 Tue, 31 Oct 2023 18:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698803170; x=1699407970; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RvxVJDZR2kIPMKAtNABVOJZa7QpQ2gAYaNjveiqrkQk=;
 b=XsGsxLrVJiZHYlgbAphpitH912lGsHSVuDSGg1L3XV9iEEeWWjTaswOZ+fdOlIPoOd
 jprerzcmcjK5y9PGpb1Dsp5X8Rm8QEhN5qNmf0eH6nOYwqejYVq8GnuPgN/airT4bI3l
 qMZS+7hF5QTBIUIQTMjd0lHhFawk6zd79EoyYL6IrPEnbdK4DJXPr4mcpIk6Px9Af2xl
 fFxZNs+om9a745VwdG1ijTookjSiJ37oZ/sG2zL4rrYUkYD2QtODU+ZFIYI/KHu1Yj7z
 Vtg2ye/mQnSh9KSvzdxZ3tvh3jADg+hKJTk5iXh3otjZJLTBqKXFDKky9QLftpxDAO4H
 qRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698803170; x=1699407970;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RvxVJDZR2kIPMKAtNABVOJZa7QpQ2gAYaNjveiqrkQk=;
 b=rC8BKAxuN9K4K4mJtjtJDuBQhqxk315GIxUKFfYzNQkgxDiHGEVHB2xIhOJR1KlkfA
 FeDIyjkVTuVVfK7S/99XIVdcZwLt7yaQNOSJrEzvQ7O956oZBBveP8k6QHLM4lMlsYpz
 opMEuL5Fp4JeZN6PGcei97zEq1+McTrqn2QGMMDJMsKjd9RDpS2iRaEXCXKdvBgrLJJZ
 a6WYeVf1jCAvsPBO0VIgNUoA5sztCjHQ8xXfJrN7xcqCnIMKCd9s2nTp0tlch4A5kB9r
 fmb7HFho74Wk8knEQf2GgO6YuNi5tiuPEbrye0Rs6TC5bYdCWMrWAiExNUPRBq/ELCji
 A6mg==
X-Gm-Message-State: AOJu0YzzjFaBHjT+CZwP92pf1otHtvxc6HelLklGcPFCz2EmhAxccgVP
 teyRGDFsqCXtYAyMrPuOKfM=
X-Google-Smtp-Source: AGHT+IH4cHRAHUPXd9jGdpW87cW+UviVmGbnjpn8SJNwToB8Dd9wMjqb4ezZsRFjp44cMBkMfH0evQ==
X-Received: by 2002:a05:620a:2846:b0:779:deb9:72c6 with SMTP id
 h6-20020a05620a284600b00779deb972c6mr16013046qkp.14.1698803169904; 
 Tue, 31 Oct 2023 18:46:09 -0700 (PDT)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05620a318800b007777521dca4sm1014639qkb.21.2023.10.31.18.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 18:46:09 -0700 (PDT)
Message-ID: <bef15942-9543-4118-89c9-62c63c6215d4@gmail.com>
Date: Tue, 31 Oct 2023 21:46:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
To: Danilo Krummrich <dakr@redhat.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231023032251.164775-1-luben.tuikov@amd.com>
 <8f53f7ef-7621-4f0b-bdef-d8d20bc497ff@redhat.com>
 <6f3e9b93-2be5-46b2-bbd9-d61d2603c14a@gmail.com>
 <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>
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
In-Reply-To: <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zDKbCnjpOc0scl40pNaESUcA"
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
Cc: Matthew Brost <matthew.brost@intel.com>, lima@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, nouveau@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zDKbCnjpOc0scl40pNaESUcA
Content-Type: multipart/mixed; boundary="------------GYrnCIpljgaw7Ocs6hL3pbqf";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>, lima@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, nouveau@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 etnaviv@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu
 <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Message-ID: <bef15942-9543-4118-89c9-62c63c6215d4@gmail.com>
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
References: <20231023032251.164775-1-luben.tuikov@amd.com>
 <8f53f7ef-7621-4f0b-bdef-d8d20bc497ff@redhat.com>
 <6f3e9b93-2be5-46b2-bbd9-d61d2603c14a@gmail.com>
 <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>
In-Reply-To: <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>

--------------GYrnCIpljgaw7Ocs6hL3pbqf
Content-Type: multipart/mixed; boundary="------------OuxRas031G4MRJ7pqiOheDQq"

--------------OuxRas031G4MRJ7pqiOheDQq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-31 09:33, Danilo Krummrich wrote:
>=20
> On 10/26/23 19:25, Luben Tuikov wrote:
>> On 2023-10-26 12:39, Danilo Krummrich wrote:
>>> On 10/23/23 05:22, Luben Tuikov wrote:
>>>> The GPU scheduler has now a variable number of run-queues, which are=
 set up at
>>>> drm_sched_init() time. This way, each driver announces how many run-=
queues it
>>>> requires (supports) per each GPU scheduler it creates. Note, that ru=
n-queues
>>>> correspond to scheduler "priorities", thus if the number of run-queu=
es is set
>>>> to 1 at drm_sched_init(), then that scheduler supports a single run-=
queue,
>>>> i.e. single "priority". If a driver further sets a single entity per=

>>>> run-queue, then this creates a 1-to-1 correspondence between a sched=
uler and
>>>> a scheduled entity.
>>>
>>> Generally, I'm fine with this patch and how it replaces / generalizes=
 the single
>>> entity approach.
>>
>> Great!
>>
>>> However, I'm not quite sure how to properly use this. What is a drive=
r supposed to
>>> do, which previously took advantage of DRM_SCHED_POLICY_SINGLE_ENTITY=
?
>>>
>>> Is it supposed to call drm_sched_init() with num_rqs=3D1? If so, what=
's the correct way
>>
>> Yes, you call drm_sched_init() with num_rqs set to 1.
>>
>>> to initialize the drm_sched_entity then? Calling drm_sched_entity_ini=
t() with priority=3D0?
>>
>> Yes, with priority set to 0.
>>
>> One unfortunate fact I noticed when doing this patch is that the numer=
ical values
>> assigned to enum drm_sched_priority is that the names to values are up=
side down.
>> Instead of min being 0, normal:1, high:2, kernel:3, it should've been =
kernel:0 (highest),
>> high:1, normal:2, low:4, and so on.
>>
>> The reason for this is absolutely clear: if you had a single priority,=
 it would be
>> 0, the kernel, one, highest one. This is similar to how lanes in a hig=
hway are counted:
>> you always have lane 1. Similarly to nice(1) and kernel priorities...
>>
>>> Any other priority consequently faults in drm_sched_job_arm().
>>
>> drm_sched_job_arm() faults on !ENTITY, but the "priority" is just
>> assigned to s_priority:
>> 	job->s_priority =3D entity->priority;
>>
>>
>>> While I might sound like a broken record (sorry for that), I really t=
hink everything
>>> related to Matt's series needs documentation, as in:
>>
>> Yes, I agree.
>=20
> Great! Do you plan to send a subsequent patch adding some documentation=
 for this one? I
> think it'd be good to get all the above documented.

A lot of this would be the magic sauce of drivers and hardware--as we've =
seen with Xe,
and it would be presumptuous of me to write down to the detail of what an=
d how this
and that should be used.

So long as things are dynamic--as we've seen with the latest change in sc=
hed_rq--we let
drivers and hardware set the numbers and do their magic in their drivers =
and hardware.

Having said this, if something fundamental comes up to mind, I'd be sure =
to add a comment
there in--this applies to anyone else guys--don't be shy to post a patch =
adding comments
where you think there should be some.
--=20
Regards,
Luben

--------------OuxRas031G4MRJ7pqiOheDQq
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

--------------OuxRas031G4MRJ7pqiOheDQq--

--------------GYrnCIpljgaw7Ocs6hL3pbqf--

--------------zDKbCnjpOc0scl40pNaESUcA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUGt2AUDAAAAAAAKCRBMFUeUMaM0rw61
AQDKpBAsOaNOjmyfCngLs7TriS7QCVLu+kl15wd3ED3FpQD+PdH8uY4OJtDizpqYb72lclhW4GBi
bSeR26k13HmoOQk=
=wmQs
-----END PGP SIGNATURE-----

--------------zDKbCnjpOc0scl40pNaESUcA--
