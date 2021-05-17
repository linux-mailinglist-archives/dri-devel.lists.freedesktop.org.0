Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC43382CAC
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 14:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1D76E951;
	Mon, 17 May 2021 12:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F234F6E951
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:57:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72E53B1C8;
 Mon, 17 May 2021 12:57:33 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: repair reference in DRM DRIVER FOR SIMPLE
 FRAMEBUFFERS
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20210517101648.29906-1-lukas.bulwahn@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d86962b1-da7e-232e-6501-9fa2e406781f@suse.de>
Date: Mon, 17 May 2021 14:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210517101648.29906-1-lukas.bulwahn@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8T38aIg0zaK56NSCyYPDE0KMDZccUjuyX"
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
Cc: kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8T38aIg0zaK56NSCyYPDE0KMDZccUjuyX
Content-Type: multipart/mixed; boundary="nzNGNBF0QtYWhtU9g06smdT7uiap7YwMT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <d86962b1-da7e-232e-6501-9fa2e406781f@suse.de>
Subject: Re: [PATCH] MAINTAINERS: repair reference in DRM DRIVER FOR SIMPLE
 FRAMEBUFFERS
References: <20210517101648.29906-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210517101648.29906-1-lukas.bulwahn@gmail.com>

--nzNGNBF0QtYWhtU9g06smdT7uiap7YwMT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.05.21 um 12:16 schrieb Lukas Bulwahn:
> Commit 11e8f5fd223b ("drm: Add simpledrm driver") adds the file
> ./drivers/gpu/drm/tiny/simpledrm.c, but refers to the file
> ./drivers/gpu/drm/tiny/simplekms.c with the new MAINTAINERS section
> DRM DRIVER FOR SIMPLE FRAMEBUFFERS.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
>=20
>    warning: no file matches    F:    drivers/gpu/drm/tiny/simplekms.c
>=20
> Repair the file entry by referring to the right location.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210514
>=20
> Thomas, Daniel, please pick this minor clean-up patch for your -next tr=
ee.

Thank you so much. Added to drm-misc-next

Best regards
Thomas

>=20
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6582d19cdf7a..88277ff25d43 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5885,7 +5885,7 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	drivers/gpu/drm/tiny/simplekms.c
> +F:	drivers/gpu/drm/tiny/simpledrm.c
>  =20
>   DRM DRIVER FOR SIS VIDEO CARDS
>   S:	Orphan / Obsolete
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--nzNGNBF0QtYWhtU9g06smdT7uiap7YwMT--

--8T38aIg0zaK56NSCyYPDE0KMDZccUjuyX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCiaDwFAwAAAAAACgkQlh/E3EQov+DD
tBAAotWv6n0Bi9OwXQHdZ+36Mh8S4VR1BH5wElL3t3VPjFChCmY0xMSNx44AaW9rD9akvfdE8EWI
M+Q1wPPCoNplbgeQFuwlJZIXTh41NaDQcSJequwUEHEzU4YmPXBP3uq7GvnvjHi0hWfamar87bJ7
kYMp9yax3WjdRzlA03H6fblysVjTZrZnnwCPBShYp81pSTiWgIVPQbhlLotPi/94w6LbYGqN5Kh8
RrTQvEJrpKtqk7GzQ7FxKzAic8jwxv4B4bGhuPVzNEd0ya7fCf9dH1Tn34/DYAjMM2DU9eZyraqB
wYeWJhLOmUoN3xNbOyn6VI3dEJDznnJNZKbfKcXHzSbagu1Ay39KZyYfnONiaW7DXzz7PMpGfyv4
kcMpH+3OTacIwdw111J24LyyGqg0j+AtxebSWEdgbxOs9vtlaIIsuto1/+M72G8GSqaYbwEAQLJ6
QqqlZy3o4CL+/8hsZiPE8+H4EXh2mIB1e5szv0Bxja5cbdwOla5f9PZXVdZbyJACVQOub6W36Otg
/GOrrAjwbJEq21xeX2ouCYOb4HL7mVNj+WnTf8vtUedldlm0aqNYJ66KAH9CkIn27bAYryWcgw8i
NqXijb1CBY7K1iI7gNl9aPl9waFuaL+/e+R2IcbfFGGScAurG1j5gX5RTdizYhLtgQWIiTNfm+1M
ZHk=
=JYFL
-----END PGP SIGNATURE-----

--8T38aIg0zaK56NSCyYPDE0KMDZccUjuyX--
