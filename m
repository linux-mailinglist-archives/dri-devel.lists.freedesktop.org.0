Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B257FA224
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C29E10E2AC;
	Mon, 27 Nov 2023 14:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EF710E2AC;
 Mon, 27 Nov 2023 14:14:05 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4219f89ee21so23750561cf.3; 
 Mon, 27 Nov 2023 06:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701094445; x=1701699245; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iD64oD8+Tiz7f283O8sbj0DrpBu/nCS99B4zaBcOQXA=;
 b=UxYjH0YwSCFSsCtLj9JhWirsrK4WT0OX1dWEy+3c52BOZlcEZncKr6inxYApd2DGCj
 PIf7EJXNLfsFmUsvEwcVFzaFcQirauYVcrLhAGZ8N90JKLnxgfhCVgLkz6X1+6Ma71E1
 HsUNC9hxpO8xKcr05X1un9n11PTMLC1ZLqsx1I6MHt+XDu/EUEo4S5cWzOQlvwEakBy6
 xfAEJLRKCwSqskZAl51qdjz1w0xIi4YdwL2D3OI2rin9h81mLVveFefuTjfMXLuIMYlM
 ZDsemM9BMxwuohLlkcBqKYzfhJDo5VMig8NsPrWr1WHGseEjRJU8NOlSRf+BrF4jQAQp
 RJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701094445; x=1701699245;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iD64oD8+Tiz7f283O8sbj0DrpBu/nCS99B4zaBcOQXA=;
 b=fsT514BhaWil5qIwyRCV2itA0iGZQW/kfg51j2JodrLuiY50msASMQPN5nAfPeZmAd
 A9H5CWT2ZqKY8Gje6h1xaps20bYGNTrSfT3kado/rF6vgVfZ8+aJ356GUBxAL5/gdaXo
 aqra5AR84TGwIdfjWEQ5jxzYWEQZayuFcl8vMwXk9gDpFoAmJp+DB5l7vuO9zY+5MTpD
 hgZvG0GTFTQFOrJ1uOuQbdXXJfxPcPJlZFrwDPlCo8q2e9cpoNGd2J6/7eFgASI9asBQ
 qtj2X+OxH5Kkgunq+JXVEIuVTScxQcw6OqSPPEhwqDUdveSCq8mvPaKkjCO8tP5vOBi8
 fRSw==
X-Gm-Message-State: AOJu0YzSy74oxHigi7T1ZPUzw3VjIq5ebENIThR5jaR2omaYu0+K0/mx
 U+3UX1CwPiS0PObgPRE+tTs=
X-Google-Smtp-Source: AGHT+IGwg5QV31C5XMheg1IRO4EfPhPM44eKrBn90XyWmIB7Foc3EZAxshRsGIra0OfZq1abL6qINQ==
X-Received: by 2002:a05:622a:1b12:b0:423:98ba:1f74 with SMTP id
 bb18-20020a05622a1b1200b0042398ba1f74mr14628158qtb.58.1701094444911; 
 Mon, 27 Nov 2023 06:14:04 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 g23-20020ac84817000000b0041eef6cacf4sm3759645qtq.81.2023.11.27.06.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 06:13:57 -0800 (PST)
Message-ID: <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
Date: Mon, 27 Nov 2023 09:13:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
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
In-Reply-To: <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9d8Wd8vPYUGUOABemRhg3b9i"
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
--------------9d8Wd8vPYUGUOABemRhg3b9i
Content-Type: multipart/mixed; boundary="------------ANJos5hgeAFPnw8wVTMf0vip";
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
Message-ID: <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
In-Reply-To: <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>

--------------ANJos5hgeAFPnw8wVTMf0vip
Content-Type: multipart/mixed; boundary="------------0KPyDQBze61FW4P7mTO6D8Pz"

--------------0KPyDQBze61FW4P7mTO6D8Pz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-27 08:55, Christian K=C3=B6nig wrote:
> Hi Luben,
>=20
> Am 24.11.23 um 08:57 schrieb Christian K=C3=B6nig:
>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>>>
>>> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler=20
>>> priorities
>>> in ascending order,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_LOW,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_HIGH,
>>> =C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL.
>>>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>
>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Looks like you missed one usage in Nouveau:
>=20
> drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error:=20
> =E2=80=98DRM_SCHED_PRIORITY_MIN=E2=80=99 undeclared here (not in a func=
tion); did you=20
> mean =E2=80=98DRM_SCHED_PRIORITY_LOW=E2=80=99?
>  =C2=A0=C2=A0 21 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUV=
EAU_SCHED_PRIORITY_SINGLE =3D DRM_SCHED_PRIORITY_MIN,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | DRM_SCHED_PRIORITY_LOW
>=20
> This now results in a build error on drm-misc-next.

I'm waiting for someone to R-B the fix I posted two days ago:
https://lore.kernel.org/r/20231125192246.87268-2-ltuikov89@gmail.com
--=20
Regards,
Luben

--------------0KPyDQBze61FW4P7mTO6D8Pz
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

--------------0KPyDQBze61FW4P7mTO6D8Pz--

--------------ANJos5hgeAFPnw8wVTMf0vip--

--------------9d8Wd8vPYUGUOABemRhg3b9i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWSkDgUDAAAAAAAKCRBMFUeUMaM0r1ZP
AQCwzBKGWSSFf6Oz9Ktr5onlPjRbeXcOFk4UXputujHIrQD/ZQtqUnEIVF73ktHLWTZQMDGJ+0df
pXv3ZFVRxQUv4A0=
=VFsd
-----END PGP SIGNATURE-----

--------------9d8Wd8vPYUGUOABemRhg3b9i--
