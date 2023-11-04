Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AF7E0CB1
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 01:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F7410E0CC;
	Sat,  4 Nov 2023 00:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D052710E0CC;
 Sat,  4 Nov 2023 00:24:18 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-66cfd35f595so15152966d6.2; 
 Fri, 03 Nov 2023 17:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699057458; x=1699662258; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FOpefyE9J8Mok4IxrtpoksULYd3F6RpQEz71F+5CPtc=;
 b=HjBqmRnWsYRoWvHBIefAX1Z6KOfjMYTJ4DC88nr043BAltiqO6N/vmeW5K20q1R2uW
 crDhiZ4In23PS+371UGtbSc645xW0yiE5reZT929hnI9QcwVZ9ihhriAR1d9cH6bLP6l
 adzs6yrkMzoK3+SBs4zROH/OV4apHcLp5MWQKA8A51Vm5ncx3f7ioIGX3w8sIdPfWvcP
 XAKq0wEY/G5zAleBXyU6PB4uLx4dkKkF8xXXnnOpJFBk2DdmNABsdPby0F5MWwVqnEYQ
 Cauhn/YOYPiRMhQ+Yx3kfRp64rKu9O68nHX7gt45/Wa8xgANliep1XiqTJWtStd8XmBe
 GBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699057458; x=1699662258;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FOpefyE9J8Mok4IxrtpoksULYd3F6RpQEz71F+5CPtc=;
 b=QMsLYZkZGD1PGjqG9OIav1BQyptivNePhUcToxngUHXcxuL/7jfddHt2Y+H9D/mjZ+
 Uq8mff+jfH8kml6rI2sdW2OUAi4m6fnWmqG4yQOuIQTxcXB9g1Bg3WqG08zh1qBmgmTg
 9GF3QiauypydIe1I0IsxN0RBTC0cXOT+20OT19apt7HD72p8BDiKvBA53uz+ft1SX3fL
 wNBFZUzJxA7P+xLA+ol68oKYJ2RXLd24kJaxqv5k7cLEqReFaQ2A3SvN6erH+zkX9MOI
 MsKtZbwQlTBr8r6RWgVMaIiMpLshDfnZ+E+hiHR3OpXH0tYzZWnXzc7Yjf4+EtZG7hG2
 z9CQ==
X-Gm-Message-State: AOJu0YzXbZjqEUM+HLYG5Nd8+0ZUFjUNWjQe7lpWUok+BEuDZT7pRGRm
 M3GqtI2UpEu3aJaPlR5ZyoI=
X-Google-Smtp-Source: AGHT+IFwxowzIRfMLfEcsRHN/XAN/yxFhCp4uv+ns5XsoMKAw8+YgcnPe2k5Cvg06jjuQtyy39hTAA==
X-Received: by 2002:ad4:5f09:0:b0:671:d2a5:3166 with SMTP id
 fo9-20020ad45f09000000b00671d2a53166mr21841850qvb.47.1699057457552; 
 Fri, 03 Nov 2023 17:24:17 -0700 (PDT)
Received: from [192.168.2.14]
 (bras-base-toroon0964w-grc-30-74-15-198-235.dsl.bell.ca. [74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a0ce452000000b006754772bfd4sm1203973qvm.21.2023.11.03.17.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 17:24:17 -0700 (PDT)
Message-ID: <19994348-7ce3-4e4d-9e9c-d0bdcd443637@gmail.com>
Date: Fri, 3 Nov 2023 20:24:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
 <ZUUOFw9YxklMb8FV@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZUUOFw9YxklMb8FV@DUT025-TGLU.fm.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CJsBAGe1Tnk20shO8LzINtCA"
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
Cc: robdclark@chromium.org, tvrtko.ursulin@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CJsBAGe1Tnk20shO8LzINtCA
Content-Type: multipart/mixed; boundary="------------y2m7pAXWWyw4i9huiM0MWsrY";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: tvrtko.ursulin@linux.intel.com, Liviu.Dudau@arm.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com, intel-xe@lists.freedesktop.org,
 ketil.johnsen@arm.com, lina@asahilina.net, ltuikov@yahoo.com,
 mcanal@igalia.com, robdclark@chromium.org, sarah.walker@imgtec.com
Message-ID: <19994348-7ce3-4e4d-9e9c-d0bdcd443637@gmail.com>
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
 <ZUUOFw9YxklMb8FV@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZUUOFw9YxklMb8FV@DUT025-TGLU.fm.intel.com>

--------------y2m7pAXWWyw4i9huiM0MWsrY
Content-Type: multipart/mixed; boundary="------------5DIR76mGoPgt8wzThAOf1z3n"

--------------5DIR76mGoPgt8wzThAOf1z3n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Matt, :-)

On 2023-11-03 11:13, Matthew Brost wrote:
> On Thu, Nov 02, 2023 at 06:46:54PM -0400, Luben Tuikov wrote:
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
>>
>=20
> Ah, yes I guess we both missed this. What about reviving the peek
> argument [1]? This would avoid unnecessary re-queues.

So, I really am not too fond of "peek-then-get-and-do" (scheduling) organ=
izations,
because they don't scale. As we've seen in our case, the RR has a side ef=
fect,
as Tvrtko pointed out (thanks!), and in the future this
"peek-first, then go-again, to go"-type of organization would only preven=
t us
from doing more interesting things.

Also, with the GPU scheduler organization, mixing in the "peek", we just =
get
to carry it around through many a function, only to be used in a leaf fun=
ction,
and exported way back up (because we don't know the rq at that level).

I'd much rather we just did "consume-until-empty", and if we have one las=
t
empty check (or first), then that's not a breaker. (I mean, we have a
drm_sched_pick_best() which has time complexity O(n), and we execute it e=
very time
we arm a job, so it's not that big of a deal.) Plus, it makes the code co=
ncise
and compact.

Let me reconstitute the patch and I'll send it for yours review.
--=20
Regards,
Luben

--------------5DIR76mGoPgt8wzThAOf1z3n
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

--------------5DIR76mGoPgt8wzThAOf1z3n--

--------------y2m7pAXWWyw4i9huiM0MWsrY--

--------------CJsBAGe1Tnk20shO8LzINtCA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUWPLwUDAAAAAAAKCRBMFUeUMaM0r4cb
AP4nsJ6sFomf81Z4LLXhf/zeyLBvJ/EiIHkpqZrwWYR3cAD/bJ5STYglUQ7Ht0qR7vJFk/Zwh6DX
ag1i8S5lQhIB5gY=
=leTi
-----END PGP SIGNATURE-----

--------------CJsBAGe1Tnk20shO8LzINtCA--
