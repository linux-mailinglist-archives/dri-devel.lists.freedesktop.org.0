Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F665824E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A106E179;
	Thu, 27 Jun 2019 12:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C388B6E161;
 Thu, 27 Jun 2019 12:15:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4939BAE9A;
 Thu, 27 Jun 2019 12:15:36 +0000 (UTC)
Subject: Re: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-2-daniel.vetter@ffwll.ch>
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
Message-ID: <bc19d6ca-8cce-11da-f6a0-46e97910d916@suse.de>
Date: Thu, 27 Jun 2019 14:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1746707936=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1746707936==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NW7mm1suUVrQxujJVbSQ1h2Ml0Im0bcO8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NW7mm1suUVrQxujJVbSQ1h2Ml0Im0bcO8
Content-Type: multipart/mixed; boundary="pkWeKZaMpVbSxYczRoMiMaVD43hbhFmxd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <bc19d6ca-8cce-11da-f6a0-46e97910d916@suse.de>
Subject: Re: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-2-daniel.vetter@ffwll.ch>

--pkWeKZaMpVbSxYczRoMiMaVD43hbhFmxd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.06.19 um 22:35 schrieb Daniel Vetter:
> We're kinda going in the wrong direction. Spotted while typing better
> gem/prime docs.
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index b4a76c2703e5..23583f0e3755 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -228,6 +228,10 @@ struct drm_gem_object_funcs
>  GEM objects can now have a function table instead of having the callba=
cks on the
>  DRM driver struct. This is now the preferred way and drivers can be mo=
ved over.
> =20
> +Unfortunately some of the recently added GEM helpers are going in the =
wrong
> +direction by adding OPS macros that use the old, deprecated hooks. See=

> +DRM_GEM_CMA_VMAP_DRIVER_OPS, DRM_GEM_SHMEM_DRIVER_OPS, and DRM_GEM_VRA=
M_DRIVER_PRIME.

There's currently only bochs using DRM_GEM_VRAM_DRIVER_PRIME.

Best regards
Thomas

> +
>  Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
>  ---------------------------------------------------------
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--pkWeKZaMpVbSxYczRoMiMaVD43hbhFmxd--

--NW7mm1suUVrQxujJVbSQ1h2Ml0Im0bcO8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0Us2cACgkQaA3BHVML
eiM49wgAk02al8+u6YeolTyj78GoyVaMg2g/cIKl3AQ7Qa1fWMolQmPKF6Wq8vie
wJ15cn43m/JA8EcGtFLq7k6WejRt9pXWKfDAlG0/KJPsOhrZfpKrQwRF/PyzB2D7
u6an4niwXh7/MYWtCNSBGIxPnefIZJSv1NbKysQmrdeoiVdfIA8kuSEe3DdY9hkv
rG0ba01ShctahI1rXK4dNE6ROcOA68xidRqa/h3G5gWZ2VRw63P4z7W6f7YdOTIa
/j/oKHCr8eBX890IPCHeW+3mlbJFI9Vm16zKrFXlu5mPYYzLoVwepEu0/iQhPGqP
kZ9BHmydBvEC7gBVblltqy148liyPQ==
=bNji
-----END PGP SIGNATURE-----

--NW7mm1suUVrQxujJVbSQ1h2Ml0Im0bcO8--

--===============1746707936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1746707936==--
