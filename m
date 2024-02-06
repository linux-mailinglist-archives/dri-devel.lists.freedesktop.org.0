Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A884AAF2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 01:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B981126D6;
	Tue,  6 Feb 2024 00:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e1vw5439";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5F91126D4;
 Tue,  6 Feb 2024 00:06:57 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-46d1bebe946so529986137.2; 
 Mon, 05 Feb 2024 16:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707178016; x=1707782816; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nvetLybIldHGcSOf11gBOr8XuOCPAjj1mcInCdW2IzM=;
 b=e1vw5439HbzOw4R4++aU83NEr3NSlV6j7ZoZI1F0uWha2I3P41TZXTxQXCcxY+Mwwp
 GPeQch/XBXL5PnWYutXKl0ewq2s/z2QLQFRCa/rnhj7eWhhJ9d4Y7maACVOshTdnYCQM
 LuRovKYmMqHBa0jKm3EJTmh2Nfq1QoyGi59nIE6kd2El6DaMfQFs9qPt1aJRgR3sgrcH
 Mmlu82e85LrbAxUqQEdsg22U2pVJEd4bqXedlboC6BTGuH1I11BvYxPGSvmTjmvcMpvP
 UEkSywaI7B9i2YGz2Dadky7254uUHX3pP3eVyjb/wWr+1ggdDeRMlYrwwhSUxrg/E3ol
 mKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707178016; x=1707782816;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nvetLybIldHGcSOf11gBOr8XuOCPAjj1mcInCdW2IzM=;
 b=vh+qxQd4D9FWszoflAVLJ8RtJEDy0B76Y+Vusete3nIFfLphdjIdaqDSGnVWJhuC9/
 6didg6MWOTN/YlxF0L8BvfK7DM9POYIKjKAjQkNRfhml4Lffm1Ugl/uxREh+v7mUGffE
 FripxtGa7LpW558jOTo2sp+zRwDW26+Jf1mHAaswblM/c8xFILRaf86QFrZRZy5LgNmy
 BRcs/R4BgAXtns4G9eE/I0JeZ6MvzACUpynpXSgrW7uazOm6aBA3I0XRHvlgnUi1kvUv
 sMMpXhFr4JEIvmFdeBb2xqQiU0RJRQ93CpOtRzdotxx4382zNpFgBLssA3Ha+ZVQsYTt
 ej5w==
X-Gm-Message-State: AOJu0YyyekCAtX7rrFA8tedFa7BFHkLw5oH2XlKZ2tegALjqKkArYmGg
 X0ti45vhAcagwLjVMNOUksuHIYUpg39Xu0WQiNcbaS2+xrfDGMyk
X-Google-Smtp-Source: AGHT+IFZJXWr2Cw8NKrlqaths9wUuUkMVeyGi8JKVYJ/QgVYrK4HKa7nEK5HIOlbqMRvWJkFgZfomA==
X-Received: by 2002:a05:6102:954:b0:46d:1cb5:fa35 with SMTP id
 a20-20020a056102095400b0046d1cb5fa35mr1753323vsi.33.1707178015929; 
 Mon, 05 Feb 2024 16:06:55 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVGHzw0tor4ha7jq7MhzIVhjWs4L0i3BaoPXQ3JelsJcsm9JhkXj8UZlqNqLfxdqXQG43Sr9yoiJf4zdZzXp4dAfocfm+poliutxuG0v0TUqw/MZwuEm6Tw021sxybsgvPzrJZpXSiWk3RrkqlDY3mEv8GgID+qULxuDsIBWVNj786MTIKXb9uJzyQnkLk=
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a0ceace000000b0068c8d3bf2aesm488252qvp.4.2024.02.05.16.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 16:06:55 -0800 (PST)
Message-ID: <658318d1-25e9-48f0-9e36-9923f38fa431@gmail.com>
Date: Mon, 5 Feb 2024 19:06:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.7.0
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
References: <20240131030302.2088173-1-matthew.brost@intel.com>
 <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
 <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>
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
In-Reply-To: <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------990llxdGDL0p6NnSYHvldd0H"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------990llxdGDL0p6NnSYHvldd0H
Content-Type: multipart/mixed; boundary="------------ss45F8y8tuA1n6Nbr0P96UeH";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Message-ID: <658318d1-25e9-48f0-9e36-9923f38fa431@gmail.com>
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
References: <20240131030302.2088173-1-matthew.brost@intel.com>
 <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
 <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>
In-Reply-To: <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>

--------------ss45F8y8tuA1n6Nbr0P96UeH
Content-Type: multipart/mixed; boundary="------------XsDy4vnsDNCymGuecGCmkQ6U"

--------------XsDy4vnsDNCymGuecGCmkQ6U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-02-01 07:56, Christian K=C3=B6nig wrote:
> Am 31.01.24 um 18:11 schrieb Daniel Vetter:
>> On Tue, Jan 30, 2024 at 07:03:02PM -0800, Matthew Brost wrote:
>>> Add Matthew Brost to DRM scheduler maintainers.
>>>
>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Definitely need more people taking care of drm/sched, so thanks for
>> volunteering!
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Yeah, that's a good idea.

Acked-by: Luben Tuikov <ltuikov89@gmail.com>

Regards,
Luben

>>
>> I think this also needs an ack from Luben and Christian. And you also =
need
>> drm-misc commit rights first, or it's going to be a bit tricky to take=

>> care of maintainer duties for merging patches. But since your sched
>> patches now have landed in upstream this should be just a formality.
>=20
> Ack from my side, I don't have time to look into scheduler stuff anyway=
=2E
>=20
> Maybe I can get somebody from Leo's team to volunteer as another=20
> reviewer for scheduler related stuff.
>=20
> Cheers,
> Christian.
>=20
>>
>> Cheers, Sima
>>
>>> ---
>>>   MAINTAINERS | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5c00fad59e91..e968d68a96c8 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7308,6 +7308,7 @@ F:	drivers/gpu/drm/xlnx/
>>>  =20
>>>   DRM GPU SCHEDULER
>>>   M:	Luben Tuikov <ltuikov89@gmail.com>
>>> +M:	Matthew Brost <matthew.brost@intel.com>
>>>   L:	dri-devel@lists.freedesktop.org
>>>   S:	Maintained
>>>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>>> --=20
>>> 2.34.1
>>>
>=20

--=20
Regards,
Luben

--------------XsDy4vnsDNCymGuecGCmkQ6U
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

--------------XsDy4vnsDNCymGuecGCmkQ6U--

--------------ss45F8y8tuA1n6Nbr0P96UeH--

--------------990llxdGDL0p6NnSYHvldd0H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZcF4FgUDAAAAAAAKCRBMFUeUMaM0r1/X
AP9mIHt54seQ8wRh37JVWSu/mbvIXfnMWDvSil7E1hTgkQEAjaJv69riam6lha0675AuU/GnBctx
OKH8J+Mk7Oq4LA0=
=Tfk5
-----END PGP SIGNATURE-----

--------------990llxdGDL0p6NnSYHvldd0H--
