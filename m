Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53AB1E15
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBC36F3A2;
	Fri, 13 Sep 2019 13:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2D6F3A2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:02:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BC84AF16;
 Fri, 13 Sep 2019 13:02:29 +0000 (UTC)
Subject: Re: [PATCH 5/8] drm/ttm: add drm_gem_ttm_mmap()
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-6-kraxel@redhat.com>
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
Message-ID: <5a79a05f-5763-201a-86e8-bb298d4fe856@suse.de>
Date: Fri, 13 Sep 2019 15:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913122908.784-6-kraxel@redhat.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0518065666=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0518065666==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="r7A6mzK88xHtMrD6GleUoiZYdW0TXdMbH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r7A6mzK88xHtMrD6GleUoiZYdW0TXdMbH
Content-Type: multipart/mixed; boundary="zxSGjltxhKEdh4LB9qpYhjbXfM4CinhIk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <5a79a05f-5763-201a-86e8-bb298d4fe856@suse.de>
Subject: Re: [PATCH 5/8] drm/ttm: add drm_gem_ttm_mmap()
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-6-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-6-kraxel@redhat.com>

--zxSGjltxhKEdh4LB9qpYhjbXfM4CinhIk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.09.19 um 14:29 schrieb Gerd Hoffmann:
> Add helper function to mmap ttm bo's using &drm_gem_object_funcs.mmap()=
=2E
>=20
> Note that with this code path access verification is done by
> drm_gem_mmap() (which calls drm_vma_node_is_allowed(()).
> The &ttm_bo_driver.verify_access() callback is is not used.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_ttm_helper.h     |  2 ++
>  drivers/gpu/drm/drm_gem_ttm_helper.c | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm=
_helper.h
> index 6268f89c5a48..118cef76f84f 100644
> --- a/include/drm/drm_gem_ttm_helper.h
> +++ b/include/drm/drm_gem_ttm_helper.h
> @@ -15,5 +15,7 @@
> =20
>  void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent=
,
>  			    const struct drm_gem_object *gem);
> +int drm_gem_ttm_mmap(struct drm_gem_object *gem,
> +		     struct vm_area_struct *vma);
> =20
>  #endif
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm=
_gem_ttm_helper.c
> index 9a4bafcf20df..34ce6cf78b35 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -52,5 +52,24 @@ void drm_gem_ttm_print_info(struct drm_printer *p, u=
nsigned int indent,
>  }
>  EXPORT_SYMBOL(drm_gem_ttm_print_info);
> =20
> +/**
> + * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
> + * @gem: GEM object.
> + * @vma: vm area.
> + *
> + * This function can be used as &drm_gem_object_funcs.mmap
> + * callback.
> + */
> +int drm_gem_ttm_mmap(struct drm_gem_object *gem,
> +		     struct vm_area_struct *vma)
> +{
> +	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> +
> +	ttm_bo_get(bo);
> +	ttm_bo_mmap_vma_setup(bo, vma);
> +	return 0;
> +}

This function looks like ttm_fbdev_mmap(). Can you use that instead?

Best regards
Thomas

> +EXPORT_SYMBOL(drm_gem_ttm_mmap);
> +
>  MODULE_DESCRIPTION("DRM gem ttm helpers");
>  MODULE_LICENSE("GPL");
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--zxSGjltxhKEdh4LB9qpYhjbXfM4CinhIk--

--r7A6mzK88xHtMrD6GleUoiZYdW0TXdMbH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl17k2EACgkQaA3BHVML
eiMm6wf/bhqpBDkcEtT0pJM60Ozya8mBpHEpStnL2vPMCYWX8gqkygxhiaT0bjy1
EHb3axf107liHAyP/Lu7CSkejUuLbsMndfSUINvHPyj39GkeKKExjK3I4+Blsank
6UbPsWZqY9DSj6FVVrD+0bFweu7xSAJjxzLivfU5s0AfGi7cAssw+BC1TIljAkXM
czMlf5EI2gz01r9tk8Ih2BJdh/CzvExIq+tGWbl9K73ggFPd3LeDy0lA5JmmhnJp
iRhSwmD1qyChng+zF3cLV1vQXqeEQsBFktpNOw6SRPqWJJzna00znhDM4b34r9tc
kMEU+Vu3Tn6Yhx+PP8o7YKuXPk40EQ==
=F607
-----END PGP SIGNATURE-----

--r7A6mzK88xHtMrD6GleUoiZYdW0TXdMbH--

--===============0518065666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0518065666==--
