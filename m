Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6033594EB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 09:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB136E88C;
	Fri, 28 Jun 2019 07:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DE36E88E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 07:30:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E22EB187;
 Fri, 28 Jun 2019 07:29:59 +0000 (UTC)
Subject: Re: [PATCH v2 02/18] drm/vram: use embedded gem object
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190621115755.8481-3-kraxel@redhat.com>
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
Message-ID: <e3d8d1ee-c033-0402-6058-7c2410cc250b@suse.de>
Date: Fri, 28 Jun 2019 09:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621115755.8481-3-kraxel@redhat.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1618748707=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1618748707==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BtMQccqzopt56oczlTQEKgFG9Me4QiQDV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BtMQccqzopt56oczlTQEKgFG9Me4QiQDV
Content-Type: multipart/mixed; boundary="DJ9HlhJD9L2dklPFOiy3KC57KeCfP5uxU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Message-ID: <e3d8d1ee-c033-0402-6058-7c2410cc250b@suse.de>
Subject: Re: [PATCH v2 02/18] drm/vram: use embedded gem object
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190621115755.8481-3-kraxel@redhat.com>
In-Reply-To: <20190621115755.8481-3-kraxel@redhat.com>

--DJ9HlhJD9L2dklPFOiy3KC57KeCfP5uxU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.06.19 um 13:57 schrieb Gerd Hoffmann:
> Drop drm_gem_object from drm_gem_vram_object, use the
> ttm_buffer_object.base instead.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_vram_helper.h           |  3 +--
>  drivers/gpu/drm/ast/ast_main.c              |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c       | 16 ++++++++--------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_main.c      |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_main.c       |  2 +-
>  6 files changed, 13 insertions(+), 14 deletions(-)
>=20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 9581ea0a4f7e..7b9f50ba3fce 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -36,7 +36,6 @@ struct vm_area_struct;
>   * video memory becomes scarce.
>   */
>  struct drm_gem_vram_object {
> -	struct drm_gem_object gem;
>  	struct ttm_buffer_object bo;
>  	struct ttm_bo_kmap_obj kmap;
> =20
> @@ -68,7 +67,7 @@ static inline struct drm_gem_vram_object *drm_gem_vra=
m_of_bo(
>  static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
>  	struct drm_gem_object *gem)

To avoid ambiguities, I used the form <destination type name>_of_<field
name>() to name these cast functions. The canonical name here would now
be drm_gem_vram_of_bo_base(). But that's just nitpicking. If you don't
want to change the name (and all its callers), maybe leave a FIXME commen=
t.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>  {
> -	return container_of(gem, struct drm_gem_vram_object, gem);
> +	return container_of(gem, struct drm_gem_vram_object, bo.base);
>  }
> =20
>  struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev=
,
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 4c7e31cb45ff..74e6e471d283 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -609,6 +609,6 @@ int ast_gem_create(struct drm_device *dev,
>  			DRM_ERROR("failed to allocate GEM object\n");
>  		return ret;
>  	}
> -	*obj =3D &gbo->gem;
> +	*obj =3D &gbo->bo.base;
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 4de782ca26b2..61d9520cc15f 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -24,7 +24,7 @@ static void drm_gem_vram_cleanup(struct drm_gem_vram_=
object *gbo)
>  	 * TTM buffer object in 'bo' has already been cleaned
>  	 * up; only release the GEM object.
>  	 */
> -	drm_gem_object_release(&gbo->gem);
> +	drm_gem_object_release(&gbo->bo.base);
>  }
> =20
>  static void drm_gem_vram_destroy(struct drm_gem_vram_object *gbo)
> @@ -80,7 +80,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
>  	int ret;
>  	size_t acc_size;
> =20
> -	ret =3D drm_gem_object_init(dev, &gbo->gem, size);
> +	ret =3D drm_gem_object_init(dev, &gbo->bo.base, size);
>  	if (ret)
>  		return ret;
> =20
> @@ -98,7 +98,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
>  	return 0;
> =20
>  err_drm_gem_object_release:
> -	drm_gem_object_release(&gbo->gem);
> +	drm_gem_object_release(&gbo->bo.base);
>  	return ret;
>  }
> =20
> @@ -378,11 +378,11 @@ int drm_gem_vram_fill_create_dumb(struct drm_file=
 *file,
>  	if (IS_ERR(gbo))
>  		return PTR_ERR(gbo);
> =20
> -	ret =3D drm_gem_handle_create(file, &gbo->gem, &handle);
> +	ret =3D drm_gem_handle_create(file, &gbo->bo.base, &handle);
>  	if (ret)
>  		goto err_drm_gem_object_put_unlocked;
> =20
> -	drm_gem_object_put_unlocked(&gbo->gem);
> +	drm_gem_object_put_unlocked(&gbo->bo.base);
> =20
>  	args->pitch =3D pitch;
>  	args->size =3D size;
> @@ -391,7 +391,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *=
file,
>  	return 0;
> =20
>  err_drm_gem_object_put_unlocked:
> -	drm_gem_object_put_unlocked(&gbo->gem);
> +	drm_gem_object_put_unlocked(&gbo->bo.base);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
> @@ -441,7 +441,7 @@ int drm_gem_vram_bo_driver_verify_access(struct ttm=
_buffer_object *bo,
>  {
>  	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_bo(bo);
> =20
> -	return drm_vma_node_verify_access(&gbo->gem.vma_node,
> +	return drm_vma_node_verify_access(&gbo->bo.base.vma_node,
>  					  filp->private_data);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_bo_driver_verify_access);
> @@ -635,7 +635,7 @@ int drm_gem_vram_driver_gem_prime_mmap(struct drm_g=
em_object *gem,
>  {
>  	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(gem);
> =20
> -	gbo->gem.vma_node.vm_node.start =3D gbo->bo.vma_node.vm_node.start;
> +	gbo->bo.base.vma_node.vm_node.start =3D gbo->bo.vma_node.vm_node.star=
t;
>  	return drm_gem_prime_mmap(gem, vma);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_mmap);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_ttm.c
> index 52fba8cb8ddd..f2a63b5f0425 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -65,7 +65,7 @@ int hibmc_gem_create(struct drm_device *dev, u32 size=
, bool iskernel,
>  			DRM_ERROR("failed to allocate GEM object: %d\n", ret);
>  		return ret;
>  	}
> -	*obj =3D &gbo->gem;
> +	*obj =3D &gbo->bo.base;
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/m=
gag200/mgag200_main.c
> index 0d7fc00e5d8a..c17440d3e6bc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -288,6 +288,6 @@ int mgag200_gem_create(struct drm_device *dev,
>  			DRM_ERROR("failed to allocate GEM object\n");
>  		return ret;
>  	}
> -	*obj =3D &gbo->gem;
> +	*obj =3D &gbo->bo.base;
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vb=
oxvideo/vbox_main.c
> index 18693e2bf72a..02fa8277ff1e 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -292,7 +292,7 @@ int vbox_gem_create(struct vbox_private *vbox,
>  		return ret;
>  	}
> =20
> -	*obj =3D &gbo->gem;
> +	*obj =3D &gbo->bo.base;
> =20
>  	return 0;
>  }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--DJ9HlhJD9L2dklPFOiy3KC57KeCfP5uxU--

--BtMQccqzopt56oczlTQEKgFG9Me4QiQDV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0VwfYACgkQaA3BHVML
eiM5nAgAr8QjHp6GlhpJqv8IP12NFNyGR6jQWj1hjUPl1m/cu1KsfuPPc3JYcn/X
rtq048TlKhgM30jloAj2yslkywrGVznhx8Dm5Z/IPYK0PFYRJeLIXfmwhvXEO6Xd
4rStCxsi83Dc7eTMTzv2f4JSTV+baKYwAbdL7G1MERbfF98YHfHuxQp9xqAsLFie
obxhBT3ym6aU2MicqSbmLq1hifZWjD5nAD6gH688stMYz4jnTSeIaHTVm88e9YWu
mWJT9noohZjuY3wA0xRZG+5NCPxBcJ7wZqC3kdwvzNYMjfyZHYrThH8Gm18A3vwx
oDcAIsdHDbyJGqvX7e/3xxlh2KitKA==
=fsj5
-----END PGP SIGNATURE-----

--BtMQccqzopt56oczlTQEKgFG9Me4QiQDV--

--===============1618748707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1618748707==--
