Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD27FA2F8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F2110E2D8;
	Mon, 27 Nov 2023 14:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA38010E2DC;
 Mon, 27 Nov 2023 14:35:31 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4237346c6efso22458681cf.0; 
 Mon, 27 Nov 2023 06:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701095731; x=1701700531; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2B4bMCdtnwdoGPakwVrUs+LrD9K7dJqM4LxYamoMPsc=;
 b=E/ngPaj7k6I0soH4d3s98wGRfpyIizvBcXTKSDkPXYYNtPzcdBSL6q/63WQIxSOyVs
 OTVist99waeIeQKFg6bOtCBobD2EAJUpZvaiLfzQEkNitqESLiQROaOnr1YG+sJlkeRG
 HVgqeKMFYKwu0NWECtxD5esOunCan2Yayt4xUDVrgWDKtyFLZZ4XeuM8NzXlh2Z9GwBH
 99UHUDoPU01sx9kVREEY5SDh0xTeryVVTsIgow/AnXcxoxugmdOwS8/xyKIsdAYR+qDX
 6MZMGZq7xENWfvzZNJhEOGJA5BCLlnD//yFe0TVA9WDujaIGjV5b9KzBzuYV39xnE6Dn
 qDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701095731; x=1701700531;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2B4bMCdtnwdoGPakwVrUs+LrD9K7dJqM4LxYamoMPsc=;
 b=fQD/8vWURfrrrFS8z9HKmOCB2g7+svcVGFxAhZF69l5xMVCL0/+lGB/EhH7omObU4r
 bp6DS3BCoaA2CMkfvOwfd2QjM+MCtJAtqP6spYqMQBPOUPbjzHyTdz6sGDXOZKyZ4QdF
 Gz8KJsq0AjH936VcdQOnxJxfG7XjTcChXvVnqR7mmIxAbJYQ3Rkj4ybj788q+4BU22p5
 z63kbQVktziSXPDHdNc2+wNFIgPSvDijT+C5g2l6jScMAFIGeNm6joM/ZdSziDX5sl/R
 gDaMyLd1tjs4HGa1Mc8IHGOBOb11ch9qXvx3uz1OBkvq50W930zFDs79pfrPSJ1PZrPA
 SOCw==
X-Gm-Message-State: AOJu0Yzh9Lgm6j9LA0vjJ/MSlnhbHnUcPJa3R16fG+BCTwjD1mG0hL9Q
 opWXHW7vXhGz7Edv86ErJks=
X-Google-Smtp-Source: AGHT+IHkqtNIYFQtGjRhqBHdorUWSd4IxHUJVMJ023H/FDvloASUbRXcU6kumdrkB3LQRj0vufCRTA==
X-Received: by 2002:a05:622a:514:b0:421:9f8c:e42 with SMTP id
 l20-20020a05622a051400b004219f8c0e42mr12726184qtx.63.1701095730820; 
 Mon, 27 Nov 2023 06:35:30 -0800 (PST)
Received: from [192.168.2.14]
 (bras-base-toroon0964w-grc-76-76-65-20-140.dsl.bell.ca. [76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 y3-20020ac85243000000b004181e5a724csm3768229qtn.88.2023.11.27.06.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 06:35:30 -0800 (PST)
Message-ID: <4cc1a0fb-a6e4-4d90-b2c3-423ed6c1d44c@gmail.com>
Date: Mon, 27 Nov 2023 09:35:29 -0500
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
 <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
 <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
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
In-Reply-To: <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PepzSRcxqI9eB3CbgR6zBi8S"
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
--------------PepzSRcxqI9eB3CbgR6zBi8S
Content-Type: multipart/mixed; boundary="------------zibjDWxyoel9r0KEW6xMDOuZ";
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
Message-ID: <4cc1a0fb-a6e4-4d90-b2c3-423ed6c1d44c@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
 <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
 <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
In-Reply-To: <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>

--------------zibjDWxyoel9r0KEW6xMDOuZ
Content-Type: multipart/mixed; boundary="------------f5JZn0y6x0y04tb3jFRRbS2E"

--------------f5JZn0y6x0y04tb3jFRRbS2E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-27 09:20, Christian K=C3=B6nig wrote:
> Am 27.11.23 um 15:13 schrieb Luben Tuikov:
>> On 2023-11-27 08:55, Christian K=C3=B6nig wrote:
>>> Hi Luben,
>>>
>>> Am 24.11.23 um 08:57 schrieb Christian K=C3=B6nig:
>>>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>>>> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>>>>>
>>>>> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler
>>>>> priorities
>>>>> in ascending order,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_LOW,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_HIGH,
>>>>>  =C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL.
>>>>>
>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>>> Cc: linux-arm-msm@vger.kernel.org
>>>>> Cc: freedreno@lists.freedesktop.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Looks like you missed one usage in Nouveau:
>>>
>>> drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error:
>>> =E2=80=98DRM_SCHED_PRIORITY_MIN=E2=80=99 undeclared here (not in a fu=
nction); did you
>>> mean =E2=80=98DRM_SCHED_PRIORITY_LOW=E2=80=99?
>>>   =C2=A0=C2=A0 21 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N=
OUVEAU_SCHED_PRIORITY_SINGLE =3D DRM_SCHED_PRIORITY_MIN,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | DRM_SCHED_PRIORITY_LOW
>>>
>>> This now results in a build error on drm-misc-next.
>> I'm waiting for someone to R-B the fix I posted two days ago:
>> https://lore.kernel.org/r/20231125192246.87268-2-ltuikov89@gmail.com
>=20
> There must be something wrong with the dri-devel mailing list (or my=20
> gmail, but I doubt so). I don't see this mail in my inbox anywhere.
>=20
> Feel free to add my rb and push it.

Done.

Thanks.
--=20
Regards,
Luben

--------------f5JZn0y6x0y04tb3jFRRbS2E
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

--------------f5JZn0y6x0y04tb3jFRRbS2E--

--------------zibjDWxyoel9r0KEW6xMDOuZ--

--------------PepzSRcxqI9eB3CbgR6zBi8S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWSpMQUDAAAAAAAKCRBMFUeUMaM0r9uR
AP4puMB/qHKd9jBHPABQCNfWJmFrh252RevzGJYaIiqOdgD+LXhefPMxysudiSB1K8/fC8Qvbky0
DmxdBKJgXU2ehAM=
=Atc+
-----END PGP SIGNATURE-----

--------------PepzSRcxqI9eB3CbgR6zBi8S--
