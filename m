Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2607347E8CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 21:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF4910E403;
	Thu, 23 Dec 2021 20:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EEB10E406
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0utom7u8Suk0aASpCi+WffUjH+y0e5u1aGXguIC+eLk=; b=F4sU2SokE9igGARLaYk+phyQl/
 s3HHwN+y28xcld57LRUzhAwE1gy4bhq7gyjAERWmUO7q+4fI+NpXb215PSc+HToUQiZP9Bj8bUR6I
 Yovj+Nsp5RPwPCD65PDliEr6bD5JjoZT5rmMdO5v/NJKreZSA6bIfLa9/oHaTH4Yh+upUC/79g9yE
 4I8YiBHA46Aqn7zNcYDO0oi5RBhnj+2t5a2HaKq5xcSrfFgkK0nhDqI6cUatlAF+pnN5X8oYAn0Ej
 9hkRLOz8FllTWJiE1Cbgb/OQ3DQfCadaLt/GO0sV5OpoxDyl4OWXmgABwWoHKOFeBLxqEAdTh7HSP
 NomjA2Ww==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n0Uoh-00033I-UD; Thu, 23 Dec 2021 21:36:00 +0100
Date: Thu, 23 Dec 2021 19:35:48 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 0/3] drm/vkms: add support for multiple overlay planes
Message-ID: <20211223203525.4sr7rjfq6l42il5r@mail.igalia.com>
References: <20211213181131.17223-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w6ayn3vj6od4fgba"
Content-Disposition: inline
In-Reply-To: <20211213181131.17223-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w6ayn3vj6od4fgba
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/13, Jos=E9 Exp=F3sito wrote:
> Hi all,
>=20
> First of all, let me quickly introduce myself. I'm Jos=E9 Exp=F3sito and
> I'm a hobbyist open source developer.
> My contributions are usually in the kernel input/HID subsystems and
> in its userspace library (libinput) as well as other projects.
>=20
> I'm trying to learn more about the GPU and I found VKMS as a good
> project to get started.
>=20
> So, now that you have been warned about my (lack) of experience in this
> subsystem, let's get into the patches.
>=20
> The series adds support for multiple overlay planes by adding a new
> module parameter=A0that allows=A0to configure the number of overlay planes
> to add.
>=20
> I checked that the planes are properly created using drm_info[1] and
> also executed the IGT test "kms_plane" to make sure that the planes
> were listed in the output.
> In addition, I=A0checked the vkms_composer and -even though I'm not sure
> how to properly test it- it looks like it is already prepared to
> compose an arbitrary number of planes.
> Having said that, I really hope I didn't make any obvious mistakes.
>=20
> I noticed that the docs say:
> >=A0For all of these, we also want to review the igt test coverage and
> > make sure all relevant igt testcases work on vkms
>=20
> I ran some plane related tests, but some of them were already failing
> without my code, so I'd appreciate some help with this bit.

Hi Jos=E9,

What test did you run? Indeed, not all kms tests are passing and fixes
are welcome :)

Last time, I used these testcases for overlay: kms_plane_cursor,
kms_atomic; and these tests were fine too: kms_cursor_crc, kms_writeback,
kms_flip

Did you find any regression? Also, a good practice is to report in the
commit message which IGT tests you used to check the proposed changes.

Btw, thanks for your patchset.

Melissa

>=20
> Thank you very much in advance for your time. Any suggestions=A0to
> improve this patchset or about what to work on next are very welcome.
>=20
> Jose
>=20
> [1]=A0https://github.com/ascent12/drm_info
>=20
> Jos=E9 Exp=F3sito (3):
>   drm/vkms: refactor overlay plane creation
>   drm/vkms: add support for multiple overlay planes
>   drm/vkms: drop "Multiple overlay planes" TODO
>=20
>  Documentation/gpu/vkms.rst         |  2 --
>  drivers/gpu/drm/vkms/vkms_drv.c    |  5 +++++
>  drivers/gpu/drm/vkms/vkms_drv.h    |  1 +
>  drivers/gpu/drm/vkms/vkms_output.c | 29 ++++++++++++++++++++++-------
>  4 files changed, 28 insertions(+), 9 deletions(-)
>=20
> --=20
> 2.25.1
>=20

--w6ayn3vj6od4fgba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHE3aMACgkQwqF3j0dL
ehyuJw//aMCE2lh3Tr1ZiSbqNApTXl/pkod/wzI7FqFPLbkTcpYz3N3+ThePrFZm
xNfZMM7PQagOZThwOA3u1ZRBdgtXR02eMmCA+JatKTnizcObhVr6P+ZxIwSN54VK
dd6jCv2jTda3rYpCjQFulOGK7ZwdMRTVhyYmuM4EYEi16gjm+GtOs9JUvR2DWJhK
R5KHka1mf0jH9AZFH9hLzOSqdfc2Uyeoh+Zp+b6kOpQ65B9HE8HF/1a3jcAj9NEy
WhCnAhyYrHcx7nqaXpyZlhey3oAE551k/Npj0BlElosBd1DA7aCgq/tMzu1OOAyp
KXx20FNZN/NAE61TomZ1DF3vIf4ffkvFOYF86yUJ6OFo9cjfKoIesBYIBJaiA+Dm
KO1yJBn7IEmTM8Z3o/2L2tuRbD/qldLDLiKXR1G8/IwzZEQO1ArYfJETbUm+HDUh
ZM9FMjhd2GHbnyEkU7/Zymy3AxqWTrvuSZp74MaKz1N/c7+683GgOorj82SQgkri
kle73XzlxHiXJ0dE4ohzuLoZbKntlNpqJf1lWyiWoNlrMgZylrkcTms7D//CT/AN
IYiMvqhYNBBotJ2MGTY1yIyMLruKAXEMrk5az/jSi+jlSKNRx1LWn1Iu7GGUsmcR
cjz5paXhrr60GSELJGIISkxdA3OJ6HMT7eftZRsQFeMvuYJkVos=
=LuhI
-----END PGP SIGNATURE-----

--w6ayn3vj6od4fgba--
