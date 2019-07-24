Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1072D61
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F326E524;
	Wed, 24 Jul 2019 11:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C996E524
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:24:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 504E1AC2C;
 Wed, 24 Jul 2019 11:24:55 +0000 (UTC)
Subject: Re: [PATCH 0/3] Fixes for mgag200 cursors
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190723075425.24028-1-tzimmermann@suse.de>
 <20190723084033.GB32268@ravnborg.org>
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
Message-ID: <3eaabdf6-ef43-7239-e65c-f394f675fde0@suse.de>
Date: Wed, 24 Jul 2019 13:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723084033.GB32268@ravnborg.org>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1182682962=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1182682962==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ua3VOrYkatOBERTqJa2sCJYJNkCZnunPV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ua3VOrYkatOBERTqJa2sCJYJNkCZnunPV
Content-Type: multipart/mixed; boundary="1USeZYuuGBVKMwMYdllFhVYqP3Jr0SI3Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <3eaabdf6-ef43-7239-e65c-f394f675fde0@suse.de>
Subject: Re: [PATCH 0/3] Fixes for mgag200 cursors
References: <20190723075425.24028-1-tzimmermann@suse.de>
 <20190723084033.GB32268@ravnborg.org>
In-Reply-To: <20190723084033.GB32268@ravnborg.org>

--1USeZYuuGBVKMwMYdllFhVYqP3Jr0SI3Y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 23.07.19 um 10:40 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, Jul 23, 2019 at 09:54:22AM +0200, Thomas Zimmermann wrote:
>> This patch set fixes a number of bugs that where introduced by the
>> recent changes to mgag200's handling of cursor BOs.
>>
>> Thomas Zimmermann (3):
>>   drm/mgag200: Pin displayed cursor BO to video memory
>>   drm/mgag200: Set cursor scanout address to correct BO
>>   drm/mgag200: Don't unpin the current cursor image's buffer.
>=20
> Browsed the fixes - looks good to me.
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20

Thanks!

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--1USeZYuuGBVKMwMYdllFhVYqP3Jr0SI3Y--

--ua3VOrYkatOBERTqJa2sCJYJNkCZnunPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl04QAYACgkQaA3BHVML
eiNOowgAmamBDDPXGvyxdk0rb0bOZpaEi7zIAxZyRU7gi7JZunnGYGcPsQFVfavp
0o9KgG+BqgxOm3olVHIDKXsFCKShJYQXmgw0oaY8ZKcnWRTkNgpFmerQ0dpj5C5o
pxqZdoVV3hij7MzGD3D3nk+OBuWXBJolMjE049xfTut0GY7qoTn3nyrzVgZQJoo8
JvPFyb2Qm3EhVz3Ciqum75awNMrZ6m6LFhnxOGa/GVZhRfgN3k5zsdhH4tUyjLk6
yMsJkqCjQ10YLm+nr9m6TM1dPHfd6Ivc7zGjFKs+aOXOKt8hYzh7XmQO/HA7BESf
fiVBzEFxp6eWqLXSe9mKJ8FJnYyQVA==
=4BKq
-----END PGP SIGNATURE-----

--ua3VOrYkatOBERTqJa2sCJYJNkCZnunPV--

--===============1182682962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1182682962==--
