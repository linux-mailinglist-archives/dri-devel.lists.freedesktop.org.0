Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE21E0C80
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 13:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAECE89CA8;
	Mon, 25 May 2020 11:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1B189A94
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 11:08:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DFD7CAD45;
 Mon, 25 May 2020 11:08:20 +0000 (UTC)
Subject: Re: [PATCH v1 0/2] drm: update drm_vblank logging
To: Sam Ravnborg <sam@ravnborg.org>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20200523071224.1716837-1-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <34a01df5-15b0-ff2b-34fa-e5b5d961823a@suse.de>
Date: Mon, 25 May 2020 13:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200523071224.1716837-1-sam@ravnborg.org>
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
Cc: Y David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0856060063=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0856060063==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oM8r7rE2hDlQdcy9fvcW8FLAXhYNRSntY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oM8r7rE2hDlQdcy9fvcW8FLAXhYNRSntY
Content-Type: multipart/mixed; boundary="n5TL0phDP1eqWf55P8Lp3Rj3noD9fNtFk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Y David Airlie
 <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <34a01df5-15b0-ff2b-34fa-e5b5d961823a@suse.de>
Subject: Re: [PATCH v1 0/2] drm: update drm_vblank logging
References: <20200523071224.1716837-1-sam@ravnborg.org>
In-Reply-To: <20200523071224.1716837-1-sam@ravnborg.org>

--n5TL0phDP1eqWf55P8Lp3Rj3noD9fNtFk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 23.05.20 um 09:12 schrieb Sam Ravnborg:
> Replace all logging functions in vblank with their drm_ counterparts.
> As cocinelle and I are not yet good friends this was a pure mechanical
> replacement.
>=20
> It adds more lines because the added argument required some more lines
> to be divided in two.
>=20
> The patch was split in two:
> - the logging functions
> - the WARN functions
>=20
> This was only done to ease the review a little.
> The patch is done on top of drm-misc-next.
>=20
> 	Sam
>=20
> Sam Ravnborg (2):
>       drm/vblank: use drm_* functions for logging
>       drm/vblank: use drm_WARN for all warnings
>=20
>  drivers/gpu/drm/drm_vblank.c | 198 +++++++++++++++++++++++------------=
--------

For the series:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

>  1 file changed, 108 insertions(+), 90 deletions(-)
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--n5TL0phDP1eqWf55P8Lp3Rj3noD9fNtFk--

--oM8r7rE2hDlQdcy9fvcW8FLAXhYNRSntY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7LpyEACgkQaA3BHVML
eiP/KAf/WEzwBu0UVbMMPw9dAt9P6Z+gFZRmzBL9lKtlTTUnaSbfcqAeTPEwM3ak
533Lgtzufs/Pwz1tUa1pd6I34H4PIedSOZ4KZuyUsX1mXw3E1i4flGg46O8/m+Jd
L/RbSU5shvBq5My9w4cwMCikCD9jhzJtplprPRmweTXKTnemBaGWNw2b5a+l80bi
LUjIno5wNppj7sJCmW+lTze31n6WnxSAhhHknriokBlwTpOx0y/B49G6J2F307Dj
srbc1JPifkqIVAfbswkYxuRkMCDw7G5Hud+dH04XKhDGjetGGWAmkDSjDURGWQ7h
h55M6ycZK+jY9A92mgTfZPBHJdJKfw==
=1NVX
-----END PGP SIGNATURE-----

--oM8r7rE2hDlQdcy9fvcW8FLAXhYNRSntY--

--===============0856060063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0856060063==--
