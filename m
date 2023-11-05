Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA37E11E9
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 02:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE23D10E23D;
	Sun,  5 Nov 2023 01:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E3310E23E
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 01:51:18 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-41dd8fd947cso19622291cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Nov 2023 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699149078; x=1699753878; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YZiX0UGAYMF/8FNgn+L1xgSZybNf9eEYfyukAawa0fY=;
 b=RQUzthMM43h8Ab3rN2038quv4lfD6IOf2aIwvjIctgBH6xx/45QCThV/bRUCXHVosB
 3lFeL6I2JPFUlSN2au1CmpVm1XnPHLzfTaPOrQRXZKY/n+m5suOd72Yn2DBlSr0vmanG
 lTaOSHOa9rycF6guJXAQlHYhzB/VkR0iG9Yoi3FnVcwODIM5AKZjKU5gpvcM7aZ29bu6
 QOifjMTjdNpQjFGBCIylHceTkYx91QmVkCGwAVMUnZGGyAiffnTxPsHznwGmcL6hpEMY
 CnqaGjyYd+FZBD/xNnUefXG3d658kU+GUlJ7UhKcAnE/7X32Cm7a5juwrNWCaOpKqq9A
 jZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699149078; x=1699753878;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YZiX0UGAYMF/8FNgn+L1xgSZybNf9eEYfyukAawa0fY=;
 b=g87UCQzFyAH9a2POdFm2jEGfK0YHxRh07yb+YLdbE/uCpJPunOBnLIwMz8vFunRJ1j
 QIQ40gyNj3/JJ98/d3kZmp/pclO0DXpvI+1sl/SUFFE19T7VYm7npBBM1MNpaYflZ07h
 kTFvjHX4Xe+c3Zp8Kxivh+rsHnGgDhPANeULRVq2xZ4c8HsTr9CpS9nRmHRSNW2dTnEZ
 896eBekjpT+UJ9rAykrvAwKI9Oqig0j6yt5cFav0d04NM+LmYYcLb6DeZ06deyScqWjE
 DNZwN1on6wsHElKQYlZccGn/mTuXZ6/wXMTgj45e3cN6X4fLAZ4GA+KQBBJ4FhztdwJO
 bzDg==
X-Gm-Message-State: AOJu0YxGAiFMeREHaoDQwl/4TKz2KB2TBcOecqOK+J4FpQ/LP7dil8MS
 c/n7SlBEcoJDd4SQwyj3KG8=
X-Google-Smtp-Source: AGHT+IH4AwYp9ylMEml2MgxgOBhL8EgzT+hXBFzE2peOri5cnC8XfKaSwSe6jUbHM1VAcGET+RX5Tw==
X-Received: by 2002:a05:622a:1cb:b0:41e:1cc8:f280 with SMTP id
 t11-20020a05622a01cb00b0041e1cc8f280mr33151183qtw.59.1699149077800; 
 Sat, 04 Nov 2023 18:51:17 -0700 (PDT)
Received: from [192.168.2.14] ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 i5-20020ac813c5000000b0041b9b6eb309sm2079613qtj.93.2023.11.04.18.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 18:51:17 -0700 (PDT)
Message-ID: <88bd3e1d-db66-40de-b06f-adcaefacccf3@gmail.com>
Date: Sat, 4 Nov 2023 21:51:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
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
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Zat0d97VlCXjXkdakYxFIAkZ"
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Zat0d97VlCXjXkdakYxFIAkZ
Content-Type: multipart/mixed; boundary="------------S6203A0b4rIo2HdgVkbEljGX";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Message-ID: <88bd3e1d-db66-40de-b06f-adcaefacccf3@gmail.com>
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>

--------------S6203A0b4rIo2HdgVkbEljGX
Content-Type: multipart/mixed; boundary="------------pj07iQ6JKZMoqGiVKU6NsSjj"

--------------pj07iQ6JKZMoqGiVKU6NsSjj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-02 06:55, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> I found some of the naming a bit incosistent and unclear so just a smal=
l
> attempt to clarify and tidy some of them. See what people think if my f=
irst
> stab improves things or not.
>=20
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Tvrtko Ursulin (5):
>   drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
>   drm/sched: Move free worker re-queuing out of the if block
>   drm/sched: Rename drm_sched_free_job_queue to be more descriptive
>   drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify
>     kerneldoc
>   drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
>=20
>  drivers/gpu/drm/scheduler/sched_entity.c |  4 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 53 ++++++++++++------------=

>  include/drm/gpu_scheduler.h              |  2 +-
>  3 files changed, 29 insertions(+), 30 deletions(-)
>=20

Series is,

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

and pushed to drm-misc-next.

Thanks!
--=20
Regards,
Luben

--------------pj07iQ6JKZMoqGiVKU6NsSjj
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

--------------pj07iQ6JKZMoqGiVKU6NsSjj--

--------------S6203A0b4rIo2HdgVkbEljGX--

--------------Zat0d97VlCXjXkdakYxFIAkZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUb1DAUDAAAAAAAKCRBMFUeUMaM0r05S
AQD6xNFKHHbX+A7utlr/us8Tb58P70oY5aqj1WvZnnKIlAD/SZJb/Rd/OWui261TPBPYIpVjb6cH
WsqCP8JCQNaI6wI=
=8i2H
-----END PGP SIGNATURE-----

--------------Zat0d97VlCXjXkdakYxFIAkZ--
