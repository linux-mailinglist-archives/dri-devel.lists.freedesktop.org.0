Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C5B1EA1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72EA6F3B2;
	Fri, 13 Sep 2019 13:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253706F3B2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:19:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91E63AF5C;
 Fri, 13 Sep 2019 13:19:00 +0000 (UTC)
Subject: Re: [PATCH 8/8] drm/vram: drop DRM_VRAM_MM_FILE_OPERATIONS
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-9-kraxel@redhat.com>
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
Message-ID: <e9712055-c6db-5515-0c11-4d7add138856@suse.de>
Date: Fri, 13 Sep 2019 15:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913122908.784-9-kraxel@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1281997934=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1281997934==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zA1rUFhhBSXWwIP4z2ZeUiz5zg4E6vQzy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zA1rUFhhBSXWwIP4z2ZeUiz5zg4E6vQzy
Content-Type: multipart/mixed; boundary="96l4ZFHNGppJAUMHJrlioSkU3ljOc7z1J";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Message-ID: <e9712055-c6db-5515-0c11-4d7add138856@suse.de>
Subject: Re: [PATCH 8/8] drm/vram: drop DRM_VRAM_MM_FILE_OPERATIONS
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-9-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-9-kraxel@redhat.com>

--96l4ZFHNGppJAUMHJrlioSkU3ljOc7z1J
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 13.09.19 um 14:29 schrieb Gerd Hoffmann:
> Not needed any more because we don't have vram specific fops
> any more.  DEFINE_DRM_GEM_FOPS() can be used instead.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_vram_helper.h             | 18 ----
>  include/drm/drm_vram_mm_helper.h              | 82 +++++++++++++++++++=

>  drivers/gpu/drm/ast/ast_drv.c                 |  5 +-
>  drivers/gpu/drm/bochs/bochs_drv.c             |  5 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  5 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |  5 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          |  5 +-
>  7 files changed, 87 insertions(+), 38 deletions(-)
>  create mode 100644 include/drm/drm_vram_mm_helper.h
>=20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 9d5526650291..3503ff784803 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -180,22 +180,4 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
>  	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
>  void drm_vram_helper_release_mm(struct drm_device *dev);
> =20
> -/**
> - * define DRM_VRAM_MM_FILE_OPERATIONS - default callback functions for=
 \
> -	&struct file_operations
> - *
> - * Drivers that use VRAM MM can use this macro to initialize
> - * &struct file_operations with default functions.
> - */
> -#define DRM_VRAM_MM_FILE_OPERATIONS \
> -	.llseek		=3D no_llseek, \
> -	.read		=3D drm_read, \
> -	.poll		=3D drm_poll, \
> -	.unlocked_ioctl =3D drm_ioctl, \
> -	.compat_ioctl	=3D drm_compat_ioctl, \
> -	.mmap		=3D drm_gem_mmap, \
> -	.open		=3D drm_open, \
> -	.release	=3D drm_release \
> -
> -
>  #endif
> diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm=
_helper.h
> new file mode 100644

Please rebase onto the latest drm-tip. This entire file has been removed
in a recent patch.

With this change applied:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> index 000000000000..a47b49adba62
> --- /dev/null
> +++ b/include/drm/drm_vram_mm_helper.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef DRM_VRAM_MM_HELPER_H
> +#define DRM_VRAM_MM_HELPER_H
> +
> +#include <drm/drm_file.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/ttm/ttm_bo_driver.h>
> +
> +struct drm_device;
> +
> +/**
> + * struct drm_vram_mm_funcs - Callback functions for &struct drm_vram_=
mm
> + * @evict_flags:	Provides an implementation for struct \
> +	&ttm_bo_driver.evict_flags
> + * @move_notify:	Provides an implementation for
> + *			struct &ttm_bo_driver.move_notify
> + *
> + * These callback function integrate VRAM MM with TTM buffer objects. =
New
> + * functions can be added if necessary.
> + */
> +struct drm_vram_mm_funcs {
> +	void (*evict_flags)(struct ttm_buffer_object *bo,
> +			    struct ttm_placement *placement);
> +	void (*move_notify)(struct ttm_buffer_object *bo, bool evict,
> +			    struct ttm_mem_reg *new_mem);
> +};
> +
> +/**
> + * struct drm_vram_mm - An instance of VRAM MM
> + * @vram_base:	Base address of the managed video memory
> + * @vram_size:	Size of the managed video memory in bytes
> + * @bdev:	The TTM BO device.
> + * @funcs:	TTM BO functions
> + *
> + * The fields &struct drm_vram_mm.vram_base and
> + * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
> + * available for public read access. Use the field
> + * &struct drm_vram_mm.bdev to access the TTM BO device.
> + */
> +struct drm_vram_mm {
> +	uint64_t vram_base;
> +	size_t vram_size;
> +
> +	struct ttm_bo_device bdev;
> +
> +	const struct drm_vram_mm_funcs *funcs;
> +};
> +
> +/**
> + * drm_vram_mm_of_bdev() - \
> +	Returns the container of type &struct ttm_bo_device for field bdev.
> + * @bdev:	the TTM BO device
> + *
> + * Returns:
> + * The containing instance of &struct drm_vram_mm
> + */
> +static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
> +	struct ttm_bo_device *bdev)
> +{
> +	return container_of(bdev, struct drm_vram_mm, bdev);
> +}
> +
> +int drm_vram_mm_debugfs_init(struct drm_minor *minor);
> +int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
> +		     uint64_t vram_base, size_t vram_size,
> +		     const struct drm_vram_mm_funcs *funcs);
> +void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
> +
> +int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
> +		     struct drm_vram_mm *vmm);
> +
> +/*
> + * Helpers for integration with struct drm_device
> + */
> +
> +struct drm_vram_mm *drm_vram_helper_alloc_mm(
> +	struct drm_device *dev, uint64_t vram_base, size_t vram_size,
> +	const struct drm_vram_mm_funcs *funcs);
> +void drm_vram_helper_release_mm(struct drm_device *dev);
> +
> +#endif
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_dr=
v.c
> index e0e8770462bc..1f17794b0890 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -200,10 +200,7 @@ static struct pci_driver ast_pci_driver =3D {
>  	.driver.pm =3D &ast_pm_ops,
>  };
> =20
> -static const struct file_operations ast_fops =3D {
> -	.owner =3D THIS_MODULE,
> -	DRM_VRAM_MM_FILE_OPERATIONS
> -};
> +DEFINE_DRM_GEM_FOPS(ast_fops);
> =20
>  static struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM,
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/=
bochs_drv.c
> index 3b9b0d9bbc14..10460878414e 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -58,10 +58,7 @@ static int bochs_load(struct drm_device *dev)
>  	return ret;
>  }
> =20
> -static const struct file_operations bochs_fops =3D {
> -	.owner		=3D THIS_MODULE,
> -	DRM_VRAM_MM_FILE_OPERATIONS
> -};
> +DEFINE_DRM_GEM_FOPS(bochs_fops);
> =20
>  static struct drm_driver bochs_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index f5b35fdef6f3..b6fdac91e502 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -26,10 +26,7 @@
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
> =20
> -static const struct file_operations hibmc_fops =3D {
> -	.owner		=3D THIS_MODULE,
> -	DRM_VRAM_MM_FILE_OPERATIONS
> -};
> +DEFINE_DRM_GEM_FOPS(hibmc_fops);
> =20
>  static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
>  {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mg=
ag200/mgag200_drv.c
> index 4f9df3b93598..397f8b0a9af8 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -58,10 +58,7 @@ static void mga_pci_remove(struct pci_dev *pdev)
>  	drm_put_dev(dev);
>  }
> =20
> -static const struct file_operations mgag200_driver_fops =3D {
> -	.owner =3D THIS_MODULE,
> -	DRM_VRAM_MM_FILE_OPERATIONS
> -};
> +DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
> =20
>  static struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vbo=
xvideo/vbox_drv.c
> index 862db495d111..0c37032c8b65 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -189,10 +189,7 @@ static struct pci_driver vbox_pci_driver =3D {
>  #endif
>  };
> =20
> -static const struct file_operations vbox_fops =3D {
> -	.owner =3D THIS_MODULE,
> -	DRM_VRAM_MM_FILE_OPERATIONS
> -};
> +DEFINE_DRM_GEM_FOPS(vbox_fops);
> =20
>  static struct drm_driver driver =3D {
>  	.driver_features =3D
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--96l4ZFHNGppJAUMHJrlioSkU3ljOc7z1J--

--zA1rUFhhBSXWwIP4z2ZeUiz5zg4E6vQzy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl17lz0ACgkQaA3BHVML
eiMnnAf/WNOsuDWjvqlzlMCQDRePLNMgyMKt7Xv5BaF+Zf6b9EVDevsZVQi7kSk+
eRfMj+LumVHuaevagkciNbPUyaa7jQw9hKXwtERSo+tCzRW/x1s59LVex4D+P2DG
GN5ntCCJIDe9hh1gdvYmR/HiVsrPY4wnzZhaPParQ9n68p40Vkt47HvtPmgA7+YT
ICElqBllfjA0hy0Etg+g8M6bxUvzHSgg+4ho4yGhGMT59zV7OWIb0S5qunOO3xRi
x+uv8dwyfcFSjJ3tg/qPZ8bIcCTVmx9fmQ3N/M9g2rJtPAHHXkuOnnyDvMBU6suQ
0h2+c+hDK4r7yLAMDg/ebPBxh62tpA==
=oYh2
-----END PGP SIGNATURE-----

--zA1rUFhhBSXWwIP4z2ZeUiz5zg4E6vQzy--

--===============1281997934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1281997934==--
