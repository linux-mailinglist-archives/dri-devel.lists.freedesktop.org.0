Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDD308816
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 12:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B069B6EAD2;
	Fri, 29 Jan 2021 11:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92B46EAD2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 11:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83618AC48;
 Fri, 29 Jan 2021 11:10:40 +0000 (UTC)
Subject: Re: [PATCH 0/5] drm/gma500: Remove Moorestown/Medfield
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <CAMeQTsamDLbHq7NEcc2fBGXyiS0fu7E3O3RczBBH8etYHLASKw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7d2102e7-e596-2354-80be-59a802abcc51@suse.de>
Date: Fri, 29 Jan 2021 12:10:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMeQTsamDLbHq7NEcc2fBGXyiS0fu7E3O3RczBBH8etYHLASKw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1069317012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1069317012==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aqAO6eLZjLGI9STJrQyubt18OtHKL32v6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aqAO6eLZjLGI9STJrQyubt18OtHKL32v6
Content-Type: multipart/mixed; boundary="oDWjPGLl57NaMV5Lhas7GUlF82T4EOUFa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <7d2102e7-e596-2354-80be-59a802abcc51@suse.de>
Subject: Re: [PATCH 0/5] drm/gma500: Remove Moorestown/Medfield
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <CAMeQTsamDLbHq7NEcc2fBGXyiS0fu7E3O3RczBBH8etYHLASKw@mail.gmail.com>
In-Reply-To: <CAMeQTsamDLbHq7NEcc2fBGXyiS0fu7E3O3RczBBH8etYHLASKw@mail.gmail.com>

--oDWjPGLl57NaMV5Lhas7GUlF82T4EOUFa
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.01.21 um 11:46 schrieb Patrik Jakobsson:
> On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>> Support for Moorestown and Medfield platforms is being removed from
>> the kernel. So here's a patch to remove the related code from the
>> gma500 driver. On top of that I also cleaned up the configuration
>> a bit.
>>
>> Note that Poulsbo and Cedartrail is still there and will remain. With
>> the MID platforms gone, there's actually a chance of cleaning up the
>> code for the desktop chips.
>>
>> I smoke tested the patchset by running Xorg and Weston on a Cedartrail=

>> system.
>=20
> Hi Thomas,
> It is correct that Moorestown platform support is removed in the
> kernel but Oaktrail and Moorestown aren't interchangeable. They share
> the same CPU/GPU but not platform. I still have an Oaktrail device
> (Minnowboard v1) which needs to be supported. Medfield on the other
> hand can go as far as I'm concerned.

I see. So patch 2 would have to be removed.

Best regards
Thomas

>=20
> I'll have a closer look at the patches this afternoon.
>=20
> Thanks
> Patrik
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oDWjPGLl57NaMV5Lhas7GUlF82T4EOUFa--

--aqAO6eLZjLGI9STJrQyubt18OtHKL32v6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAT7S8FAwAAAAAACgkQlh/E3EQov+CF
WBAAsIa4/2Afjt3odCM55+1cEfST0Xc7pn26GaY0nsdVoFE2H3fKYWuxkG06yJYy9LD/HdLjK+Yw
beMKK5ey73QJEL1ycMaeccPS+LdegvXrfK9vPY+jPaU42xa3HEceUMfOo7Luq+YWdmuHFwqbJ2Bs
n/fK7fl0PygyE/MjrzrUmfJKuDRJLeJuIwg1Nrm8pD65VvnmcW5/mqFfQguzEgF2ujd5fkSufLTG
NpY5VTjxkj/lSm2/TBSgLUk2yeNz9e8eTGf+xmBEPHK5CENto5rUzbzdyibcg7swTNLNfv7ya8dB
Q9foErdnQZob69WSI5+jdUFPg2m2YCSQwAl5jkg16YPTuJ4OeGw4FiN0J2PGRFZVHrlcqPHOvnkX
5fB7iIxCGcXBLKnZ/M4zCd+iRD/NC6uUjhP8gvRVCo+4BWzqhDMqkKZ+Hqr1/qJan4XnjFkZmPdO
rds9O5R0TcmnVmfLTJTh8Ou+46XLtPCTqKpL/REXp2NgItSSIqKQxqjsBGkIZzQ9dZN5dCriPaKR
u0p4l/4GhHVU/3rwF0mD5gbgGxoJ1Y1oqc3xvNu4QqXahU1Enj/ExnlEGPl/Uv1Obxi9u1myahK2
Fi+eL9O1XAmkavMCsLiHexDSoYEdhVcOrO3YOIOwSLFAn9TibaP179BcXUW3wVVOeja4axKtALYf
je4=
=EscT
-----END PGP SIGNATURE-----

--aqAO6eLZjLGI9STJrQyubt18OtHKL32v6--

--===============1069317012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1069317012==--
