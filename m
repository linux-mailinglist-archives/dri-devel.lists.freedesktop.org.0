Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016B3C576
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFE989117;
	Tue, 11 Jun 2019 07:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B8989117
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:55:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB1ABAEFD;
 Tue, 11 Jun 2019 07:55:33 +0000 (UTC)
Subject: Re: [PATCH v1 0/4] drm/{mga,mgag200}: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20190608081923.6274-1-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <3a36ad4b-7654-aa23-d2e9-71714e14feb5@suse.de>
Date: Tue, 11 Jun 2019 09:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608081923.6274-1-sam@ravnborg.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: multipart/mixed; boundary="===============1435858322=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1435858322==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ev1GG0igjXSpbyEGklOCFUrB03S7PB1v7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ev1GG0igjXSpbyEGklOCFUrB03S7PB1v7
Content-Type: multipart/mixed; boundary="xyhcs00Y6RDXzKT4yttJGxp3VVW9M9ZNr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <3a36ad4b-7654-aa23-d2e9-71714e14feb5@suse.de>
Subject: Re: [PATCH v1 0/4] drm/{mga,mgag200}: drop use of drmP.h
References: <20190608081923.6274-1-sam@ravnborg.org>
In-Reply-To: <20190608081923.6274-1-sam@ravnborg.org>

--xyhcs00Y6RDXzKT4yttJGxp3VVW9M9ZNr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Thanks a lot. There's some bike shedding in my other replies, but general=
ly

  Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regard
Thomas

Am 08.06.19 um 10:19 schrieb Sam Ravnborg:
> Drop use of the deprecated drmP.h header file.
> Also drop use of drm_os_linux.h as it is deprecated too,
> and was pulled in via drmP.h
>=20
> Build tested with allmodconfig, allyesconfig on
> various architectures.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> Sam Ravnborg (4):
>       drm/mga: drop dependency on drm_os_linux.h
>       drm/mga: make header file self contained
>       drm/mga: drop use of drmP.h
>       drm/mgag200: drop use of drmP.h
>=20
>  drivers/gpu/drm/mga/mga_dma.c            | 14 ++++++++------
>  drivers/gpu/drm/mga/mga_drv.c            |  7 +++----
>  drivers/gpu/drm/mga/mga_drv.h            | 25 +++++++++++++++++++++---=
-
>  drivers/gpu/drm/mga/mga_ioc32.c          |  3 +--
>  drivers/gpu/drm/mga/mga_irq.c            | 10 ++++------
>  drivers/gpu/drm/mga/mga_state.c          |  8 +++-----
>  drivers/gpu/drm/mga/mga_warp.c           |  4 +---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c |  3 ++-
>  drivers/gpu/drm/mgag200/mgag200_drv.c    | 10 +++++++---
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |  8 +++-----
>  drivers/gpu/drm/mgag200/mgag200_fb.c     |  8 +++++---
>  drivers/gpu/drm/mgag200/mgag200_i2c.c    |  6 ++++--
>  drivers/gpu/drm/mgag200/mgag200_main.c   |  4 +++-
>  drivers/gpu/drm/mgag200/mgag200_mode.c   |  3 ++-
>  drivers/gpu/drm/mgag200/mgag200_ttm.c    |  3 ++-
>  15 files changed, 69 insertions(+), 47 deletions(-)
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--xyhcs00Y6RDXzKT4yttJGxp3VVW9M9ZNr--

--Ev1GG0igjXSpbyEGklOCFUrB03S7PB1v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/XnQACgkQaA3BHVML
eiMfDwf+KBqwIPHTB+PlZxjVeQaDpVJcwIqsle++3c8CF0sE3N0ZyPaLtwzlz9lc
/Ysk0simc5NZhelILM2pkW2UE6fw6/IiR5tZf+6GF5wfJWpWsRqkIsfTsCcejBZL
txKnNIABo2gRGVVR3PzGDZY0BPw5aoxxn1iAYTXobUskLPkptckvsgYG7u8Aislh
03s1V2p78VAT7M13vSN7L+6pcaWswbqH57BTjxlmP/w6qX3ogDfbiuzbLhyKkdCx
qWvvp4euJ0w0RPusrOCIeX3ey0SPiYyL4zSXHt8tqnloF+Qiuz/Zg5Um+eQff1//
LJrfn8RI/48cC11jd1RTfijfOI2LkA==
=1x1n
-----END PGP SIGNATURE-----

--Ev1GG0igjXSpbyEGklOCFUrB03S7PB1v7--

--===============1435858322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1435858322==--
