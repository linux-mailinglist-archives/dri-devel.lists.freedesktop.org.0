Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A7594F6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 09:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6E76E88F;
	Fri, 28 Jun 2019 07:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E936E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 07:30:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27D27B609;
 Fri, 28 Jun 2019 07:30:39 +0000 (UTC)
Subject: Re: [PATCH v2 09/18] drm/vram: drop drm_gem_vram_driver_gem_prime_mmap
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190621115755.8481-10-kraxel@redhat.com>
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
Message-ID: <d3610263-421b-4c4f-faaa-0b8a8d905f07@suse.de>
Date: Fri, 28 Jun 2019 09:30:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621115755.8481-10-kraxel@redhat.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, ckoenig.leichtzumerken@gmail.com,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0884813869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0884813869==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SjuG3ISsctN3WUhn3ZUuTIOWBXlLTl6ww"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SjuG3ISsctN3WUhn3ZUuTIOWBXlLTl6ww
Content-Type: multipart/mixed; boundary="ICaAVP5Xc9uWp5y40PIWZuKzwVKaFAzz8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Message-ID: <d3610263-421b-4c4f-faaa-0b8a8d905f07@suse.de>
Subject: Re: [PATCH v2 09/18] drm/vram: drop
 drm_gem_vram_driver_gem_prime_mmap
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190621115755.8481-10-kraxel@redhat.com>
In-Reply-To: <20190621115755.8481-10-kraxel@redhat.com>

--ICaAVP5Xc9uWp5y40PIWZuKzwVKaFAzz8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 21.06.19 um 13:57 schrieb Gerd Hoffmann:
> The wrapper doesn't do anything any more, drop it.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_vram_helper.h     |  4 +---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 17 -----------------
>  2 files changed, 1 insertion(+), 20 deletions(-)
>=20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 7b9f50ba3fce..2ada671a2a6b 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -137,8 +137,6 @@ void drm_gem_vram_driver_gem_prime_unpin(struct drm=
_gem_object *obj);
>  void *drm_gem_vram_driver_gem_prime_vmap(struct drm_gem_object *obj);
>  void drm_gem_vram_driver_gem_prime_vunmap(struct drm_gem_object *obj,
>  					  void *vaddr);
> -int drm_gem_vram_driver_gem_prime_mmap(struct drm_gem_object *obj,
> -				       struct vm_area_struct *vma);
> =20
>  #define DRM_GEM_VRAM_DRIVER_PRIME \
>  	.gem_prime_export =3D drm_gem_prime_export, \
> @@ -147,6 +145,6 @@ int drm_gem_vram_driver_gem_prime_mmap(struct drm_g=
em_object *obj,
>  	.gem_prime_unpin  =3D drm_gem_vram_driver_gem_prime_unpin, \
>  	.gem_prime_vmap	  =3D drm_gem_vram_driver_gem_prime_vmap, \
>  	.gem_prime_vunmap =3D drm_gem_vram_driver_gem_prime_vunmap, \
> -	.gem_prime_mmap	  =3D drm_gem_vram_driver_gem_prime_mmap
> +	.gem_prime_mmap	  =3D drm_gem_prime_mmap
> =20
>  #endif
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 2e474dee30df..d78761802374 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -619,20 +619,3 @@ void drm_gem_vram_driver_gem_prime_vunmap(struct d=
rm_gem_object *gem,
>  	drm_gem_vram_unpin(gbo);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_vunmap);
> -
> -/**
> - * drm_gem_vram_driver_gem_prime_mmap() - \
> -	Implements &struct drm_driver.gem_prime_mmap
> - * @gem:	The GEM object to map
> - * @vma:	The VMA describing the mapping
> - *
> - * Returns:
> - * 0 on success, or
> - * a negative errno code otherwise.
> - */
> -int drm_gem_vram_driver_gem_prime_mmap(struct drm_gem_object *gem,
> -				       struct vm_area_struct *vma)
> -{
> -	return drm_gem_prime_mmap(gem, vma);
> -}
> -EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_mmap);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--ICaAVP5Xc9uWp5y40PIWZuKzwVKaFAzz8--

--SjuG3ISsctN3WUhn3ZUuTIOWBXlLTl6ww
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0Vwh4ACgkQaA3BHVML
eiOMUQf+PZ8j9q4zK3Eq6XY9xecI/H6s1jGpv8Dlt7GOlTitpIYDEca5p0rtecHV
hwGkLB7me8EsfPyt1tWlEuizxBbZFuaKSzViPfvy75ug/Xzc0rugUv2zW4Uv44v7
cAfswUkI42HBGXDscxcwYO3cyIGnVrK50yWzbJfvS4XfD13oE+lRBs0OvZ4ltDps
Pb+sH0X5vGE1HunXO0w+HcpbjfHXEokKsSRuSN4HpbxwV+qE5MMfJXfEH+YzNFpo
K4/XL5PydjkbHn48Hh2S3Vs0OVy3xySC6MDtwYaxJdPOdQej9SrjHUb8bN5n5Wyj
37b8Lz3kqSlpLfcxChTpZpkqHo3l6g==
=u0ug
-----END PGP SIGNATURE-----

--SjuG3ISsctN3WUhn3ZUuTIOWBXlLTl6ww--

--===============0884813869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0884813869==--
