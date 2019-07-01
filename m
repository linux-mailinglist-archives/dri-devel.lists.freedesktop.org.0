Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF535B5BB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5917389F8B;
	Mon,  1 Jul 2019 07:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC32189F8B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 07:29:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3088DAC4C;
 Mon,  1 Jul 2019 07:29:05 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/vram: Set GEM object functions for PRIME
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-2-tzimmermann@suse.de>
 <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>
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
Message-ID: <216c9142-ca8e-50ae-cb0b-f63a8b57addf@suse.de>
Date: Mon, 1 Jul 2019 09:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, zourongrong@gmail.com,
 airlied@redhat.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1360086630=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1360086630==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VJgSdurkEztlPswLgZ9FLZHJKE1eJLkKq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VJgSdurkEztlPswLgZ9FLZHJKE1eJLkKq
Content-Type: multipart/mixed; boundary="zmGWVBHQHM4ExPj4j9IdZDHfdYtVk5JTx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Message-ID: <216c9142-ca8e-50ae-cb0b-f63a8b57addf@suse.de>
Subject: Re: [PATCH 1/4] drm/vram: Set GEM object functions for PRIME
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-2-tzimmermann@suse.de>
 <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>
In-Reply-To: <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>

--zmGWVBHQHM4ExPj4j9IdZDHfdYtVk5JTx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.07.19 um 08:32 schrieb Gerd Hoffmann:
> On Fri, Jun 28, 2019 at 02:26:56PM +0200, Thomas Zimmermann wrote:
>> PRIME functionality is now provided via the callback functions in
>> struct drm_gem_object_funcs. The driver-structure functions are obsole=
te.
>> As a side effect of this patch, VRAM-based drivers get basic PRIME
>> support automatically without having to set any flags or additional
>> fields.
>=20
>> +static void drm_gem_vram_object_free(struct drm_gem_object *gem)
>> +static int drm_gem_vram_object_funcs_pin(struct drm_gem_object *gem)
>> +static void drm_gem_vram_object_funcs_unpin(struct drm_gem_object *ge=
m)
>> +static void *drm_gem_vram_object_funcs_vmap(struct drm_gem_object *ge=
m)
>> +static void drm_gem_vram_object_funcs_vunmap(struct drm_gem_object *g=
em,
>> +					     void *vaddr)
>=20
>> +static const struct drm_gem_object_funcs drm_gem_vram_object_funcs =3D=
 {
>> +	.free	=3D drm_gem_vram_object_free,
>> +	.pin	=3D drm_gem_vram_object_funcs_pin,
>> +	.unpin	=3D drm_gem_vram_object_funcs_unpin,
>> +	.vmap	=3D drm_gem_vram_object_funcs_vmap,
>> +	.vunmap	=3D drm_gem_vram_object_funcs_vunmap
>> +};
>=20
> Why new functions?  Can't you just hook up the existing prime functions=
?

The final patch will remove the existing functions, so drivers won't use
them accidentally.

Best regards
Thomas

>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--zmGWVBHQHM4ExPj4j9IdZDHfdYtVk5JTx--

--VJgSdurkEztlPswLgZ9FLZHJKE1eJLkKq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0Ztj8ACgkQaA3BHVML
eiMqgQf+N9Iu0I++Fk1LOPBWggZRUFwh9WDhn0FW1kyMxMuuQE/A0AiOWo3MIVzm
9LrYRXYGnhz6GJmLPUWdKGWI/O4VYhcR191oHfWShLm1zdXqZRPxA4Y/mAEi2zMl
Ug3D8zw89PS9g0rzBG5BTCfvqs0YipuzkfMqSq4cG5hQt5nbEF9532A5icVBeM5e
pholpr6uxIN9Rw6wSJ/C5KKyN5frcLlL2BWiJaexRyzAV2+eZs5xDTjT2F4B/XOE
KKQzvuefrihr1TVYc6oRkrtM6TIkc8PJj7ZF82aDXJ1zd3Bm6dyuWvmp96MW9l56
W8UGRAQ9ej/M+KRI+kx5OJuNUJ3aDw==
=l9iu
-----END PGP SIGNATURE-----

--VJgSdurkEztlPswLgZ9FLZHJKE1eJLkKq--

--===============1360086630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1360086630==--
