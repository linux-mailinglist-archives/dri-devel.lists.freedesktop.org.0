Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A547384AB15
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 01:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7161126D3;
	Tue,  6 Feb 2024 00:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l9We3r+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3815A1126D3;
 Tue,  6 Feb 2024 00:23:40 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7853a9eb5daso237169885a.2; 
 Mon, 05 Feb 2024 16:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707179020; x=1707783820; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IqVU+LiXbuywF9XQaymPLdHIGEL6qQwIS047Nq9mMH4=;
 b=l9We3r+LsygQ0e2CN1fRLb68qq4Ccu2Aqk0vKEpcaV/VmbVBaaewjSMxeV4dlGxKes
 bXyIoru1uN+qvdU0j48F+ur8A3bV2x0iC4kwHRN1c0glpOQqEyKywcHeluuIUA4WKL3B
 dmRMct08HVYhxV7E1VVtaJR+kxuojbodTjbmmvlBjsE4IOy3SEkXAjv5fmeFF/gt3RKs
 +WXuH47j1fjD/U8PkfJ3h0mK1HluQ+SRkjaZrUoH9ObpnLL5eV9pnBG8tktjSWrqrWgI
 Skivfg8kBkUKFSjRCvg86fwn7BHSIWrYUKqTq7rwVhvjxP6ZyW4RrgWNgAU9M/van8AJ
 z4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707179020; x=1707783820;
 h=in-reply-to:autocrypt:references:cc:to:from:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IqVU+LiXbuywF9XQaymPLdHIGEL6qQwIS047Nq9mMH4=;
 b=aYLiyd/kN3wodR07aGlPrs6E9RP5oALgW4fZYU+/SFA4HjLn44qQnWgkUxZ8r8Md7d
 hCDaXAeQpjIwVKQGPfevE3hpqcRSyKISHp2Z+djJpHlqI7BqS3ZwEChSLLIu0aIxkfIb
 0494qtHCVIQRQR17aIzSd4ucgglBYwgMl3u0YQOxbx6z+ZrBBbK0phXUTck5pwT8WNE8
 PqgN/gPzD2Ga9znE1BpP1ohB6lbSvE5LnYZLafKMsuM82rjJAunZvT5rE4J8IWbmdV61
 fcOs5OIf2QBJiuc/DctGufDVotY8z6u3Du14glDyeMjKh/aNvZLPP/KfQqopsF7OX0m2
 JG6w==
X-Gm-Message-State: AOJu0YybYvlNtP2x/P0Oq9RV8nJiVhY1vKzpuz0Y7yyYzE+y1RwcvrML
 SAfFFGYhUQzw2DOLWrseApU0bYOEnuYaGp6p8BunEZZkUYaMNi0b
X-Google-Smtp-Source: AGHT+IFjZzqkyM19R3R+VhfinPLErBcJD194Fy+xHoyiIoOKZuQLQ1pf2dnKPPqHR3yuodxSGJ9P+w==
X-Received: by 2002:a05:620a:20d2:b0:783:e2d5:a911 with SMTP id
 f18-20020a05620a20d200b00783e2d5a911mr559724qka.48.1707179019697; 
 Mon, 05 Feb 2024 16:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVYjZxXVVqaNPq9jPRv3sXatZshtDUqaatMbAclQM/XAG86/G9MFu5hE0ZkhQAwYV2zPVfSVN/EzhpksdYoxJa6VpUjBuZ6U+j7OHfTld84CtQLORCj4CdlVHm8jA5vrHjiks0i4Yx+2mMYfdpM1kk9bG9FDW7bhzxjpeXtGearg0Y26rHdW0WVkOYRZIQ=
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05620a210600b00783b6da58a9sm430301qkl.39.2024.02.05.16.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 16:23:39 -0800 (PST)
Message-ID: <3ca89794-f26b-4129-a4c9-33ae59be069f@gmail.com>
Date: Mon, 5 Feb 2024 19:23:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.7.0
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
References: <20240131030302.2088173-1-matthew.brost@intel.com>
 <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
 <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>
 <658318d1-25e9-48f0-9e36-9923f38fa431@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <658318d1-25e9-48f0-9e36-9923f38fa431@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cyuwicmEoUyyoes5Z2wqmfu4"
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
--------------cyuwicmEoUyyoes5Z2wqmfu4
Content-Type: multipart/mixed; boundary="------------60kzCsdhM09ZAWTOdBmSu2uB";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Message-ID: <3ca89794-f26b-4129-a4c9-33ae59be069f@gmail.com>
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
References: <20240131030302.2088173-1-matthew.brost@intel.com>
 <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
 <9dac66fd-2d84-488e-93f5-3983cd13d0bd@amd.com>
 <658318d1-25e9-48f0-9e36-9923f38fa431@gmail.com>
In-Reply-To: <658318d1-25e9-48f0-9e36-9923f38fa431@gmail.com>

--------------60kzCsdhM09ZAWTOdBmSu2uB
Content-Type: multipart/mixed; boundary="------------avrYEODY7JmUDO1Dl67To4IS"

--------------avrYEODY7JmUDO1Dl67To4IS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-02-05 19:06, Luben Tuikov wrote:
> On 2024-02-01 07:56, Christian K=C3=B6nig wrote:
>> Am 31.01.24 um 18:11 schrieb Daniel Vetter:
>>> On Tue, Jan 30, 2024 at 07:03:02PM -0800, Matthew Brost wrote:
>>>> Add Matthew Brost to DRM scheduler maintainers.
>>>>
>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Definitely need more people taking care of drm/sched, so thanks for
>>> volunteering!
>>>
>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> Yeah, that's a good idea.
>=20
> Acked-by: Luben Tuikov <ltuikov89@gmail.com>

This patch has been pushed to drm-misc-next.

Regards,
Luben

>=20
> Regards,
> Luben
>=20
>>>
>>> I think this also needs an ack from Luben and Christian. And you also=
 need
>>> drm-misc commit rights first, or it's going to be a bit tricky to tak=
e
>>> care of maintainer duties for merging patches. But since your sched
>>> patches now have landed in upstream this should be just a formality.
>>
>> Ack from my side, I don't have time to look into scheduler stuff anywa=
y.
>>
>> Maybe I can get somebody from Leo's team to volunteer as another=20
>> reviewer for scheduler related stuff.
>>
>> Cheers,
>> Christian.
>>
>>>
>>> Cheers, Sima
>>>
>>>> ---
>>>>   MAINTAINERS | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 5c00fad59e91..e968d68a96c8 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -7308,6 +7308,7 @@ F:	drivers/gpu/drm/xlnx/
>>>>  =20
>>>>   DRM GPU SCHEDULER
>>>>   M:	Luben Tuikov <ltuikov89@gmail.com>
>>>> +M:	Matthew Brost <matthew.brost@intel.com>
>>>>   L:	dri-devel@lists.freedesktop.org
>>>>   S:	Maintained
>>>>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>>>> --=20
>>>> 2.34.1
>>>>
>>
>=20

--=20
Regards,
Luben

--------------avrYEODY7JmUDO1Dl67To4IS
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

--------------avrYEODY7JmUDO1Dl67To4IS--

--------------60kzCsdhM09ZAWTOdBmSu2uB--

--------------cyuwicmEoUyyoes5Z2wqmfu4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZcF8AgUDAAAAAAAKCRBMFUeUMaM0r3Np
AP9nA7Oa01DkdqB6Y2pmuRneijBplCRy7VJZlbSLCn9H+gEAlKMwgBn2CwKwN6OJWtT1n0k03LOh
4e4wtiIcvrxOWAo=
=Cksx
-----END PGP SIGNATURE-----

--------------cyuwicmEoUyyoes5Z2wqmfu4--
