Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94331067A0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 09:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682556F4E0;
	Fri, 22 Nov 2019 08:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE96F4E0;
 Fri, 22 Nov 2019 08:16:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1E8D7AEA7;
 Fri, 22 Nov 2019 08:16:16 +0000 (UTC)
Subject: Re: [PATCH 7/8] drm/hibmc: Use drm_gem_fb_create
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-8-daniel.vetter@ffwll.ch>
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
Message-ID: <282c9881-6134-5d82-c408-ee90986ef123@suse.de>
Date: Fri, 22 Nov 2019 09:16:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191115092120.4445-8-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0598321717=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0598321717==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8AaJKugCtQ94cnD2cI6E06hAoB1Fr6FlG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8AaJKugCtQ94cnD2cI6E06hAoB1Fr6FlG
Content-Type: multipart/mixed; boundary="3u6xVeBCtpXgK3CNF8gRLX247NGhe8iVa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <282c9881-6134-5d82-c408-ee90986ef123@suse.de>
Subject: Re: [PATCH 7/8] drm/hibmc: Use drm_gem_fb_create
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-8-daniel.vetter@ffwll.ch>
In-Reply-To: <20191115092120.4445-8-daniel.vetter@ffwll.ch>

--3u6xVeBCtpXgK3CNF8gRLX247NGhe8iVa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.11.19 um 10:21 schrieb Daniel Vetter:
> Again we could delete a lot more if we'd switch over to the generic
> fbdev stuff.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

There's one comment below. Except for that,

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  4 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   | 11 +---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  5 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 62 +++++--------------=

>  4 files changed, 19 insertions(+), 63 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 6527a97f68a3..2d0920ec4554 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -99,14 +99,12 @@ static void hibmc_plane_atomic_update(struct drm_pl=
ane *plane,
>  	s64 gpu_addr =3D 0;
>  	unsigned int line_l;
>  	struct hibmc_drm_private *priv =3D plane->dev->dev_private;
> -	struct hibmc_framebuffer *hibmc_fb;
>  	struct drm_gem_vram_object *gbo;
> =20
>  	if (!state->fb)
>  		return;
> =20
> -	hibmc_fb =3D to_hibmc_framebuffer(state->fb);
> -	gbo =3D drm_gem_vram_of_gem(hibmc_fb->obj);
> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);

There's no fb in this function. You have to use state->fb,

> =20
>  	gpu_addr =3D drm_gem_vram_offset(gbo);
>  	if (WARN_ON_ONCE(gpu_addr < 0))
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index e58ecd7edcf8..ab5b4a4a2095 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -20,14 +20,9 @@
>  struct drm_device;
>  struct drm_gem_object;
> =20
> -struct hibmc_framebuffer {
> -	struct drm_framebuffer fb;
> -	struct drm_gem_object *obj;
> -};
> -
>  struct hibmc_fbdev {
>  	struct drm_fb_helper helper; /* must be first */
> -	struct hibmc_framebuffer *fb;
> +	struct drm_framebuffer *fb;
>  	int size;
>  };
> =20
> @@ -47,8 +42,6 @@ struct hibmc_drm_private {
>  	struct hibmc_fbdev *fbdev;
>  };
> =20
> -#define to_hibmc_framebuffer(x) container_of(x, struct hibmc_framebuff=
er, fb)
> -
>  void hibmc_set_power_mode(struct hibmc_drm_private *priv,
>  			  unsigned int power_mode);
>  void hibmc_set_current_gate(struct hibmc_drm_private *priv,
> @@ -61,7 +54,7 @@ void hibmc_fbdev_fini(struct hibmc_drm_private *priv)=
;
> =20
>  int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
>  		     struct drm_gem_object **obj);
> -struct hibmc_framebuffer *
> +struct drm_framebuffer *
>  hibmc_framebuffer_init(struct drm_device *dev,
>  		       const struct drm_mode_fb_cmd2 *mode_cmd,
>  		       struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c b/driver=
s/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
> index b4c1cea051e8..446aeedc9e29 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
> @@ -141,15 +141,14 @@ static int hibmc_drm_fb_create(struct drm_fb_help=
er *helper,
> =20
>  static void hibmc_fbdev_destroy(struct hibmc_fbdev *fbdev)
>  {
> -	struct hibmc_framebuffer *gfb =3D fbdev->fb;
>  	struct drm_fb_helper *fbh =3D &fbdev->helper;
> =20
>  	drm_fb_helper_unregister_fbi(fbh);
> =20
>  	drm_fb_helper_fini(fbh);
> =20
> -	if (gfb)
> -		drm_framebuffer_put(&gfb->fb);
> +	if (fbdev->fb)
> +		drm_framebuffer_put(fbdev->fb);
>  }
> =20
>  static const struct drm_fb_helper_funcs hibmc_fbdev_helper_funcs =3D {=

> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_ttm.c
> index 21b684eab5c9..386033b0d3a2 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_print.h>
> =20
>  #include "hibmc_drm_drv.h"
> @@ -97,74 +98,39 @@ int hibmc_dumb_create(struct drm_file *file, struct=
 drm_device *dev,
>  	return 0;
>  }
> =20
> -static void hibmc_user_framebuffer_destroy(struct drm_framebuffer *fb)=

> -{
> -	struct hibmc_framebuffer *hibmc_fb =3D to_hibmc_framebuffer(fb);
> -
> -	drm_gem_object_put_unlocked(hibmc_fb->obj);
> -	drm_framebuffer_cleanup(fb);
> -	kfree(hibmc_fb);
> -}
> -
>  static const struct drm_framebuffer_funcs hibmc_fb_funcs =3D {
> -	.destroy =3D hibmc_user_framebuffer_destroy,
> +	.destroy	=3D drm_gem_fb_destroy,
> +	.create_handle	=3D drm_gem_fb_create_handle,
>  };
> =20
> -struct hibmc_framebuffer *
> +struct drm_framebuffer *
>  hibmc_framebuffer_init(struct drm_device *dev,
>  		       const struct drm_mode_fb_cmd2 *mode_cmd,
>  		       struct drm_gem_object *obj)
>  {
> -	struct hibmc_framebuffer *hibmc_fb;
> +	struct drm_framebuffer *fb;
>  	int ret;
> =20
> -	hibmc_fb =3D kzalloc(sizeof(*hibmc_fb), GFP_KERNEL);
> -	if (!hibmc_fb) {
> -		DRM_ERROR("failed to allocate hibmc_fb\n");
> +	fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
> +	if (!fb) {
> +		DRM_ERROR("failed to allocate fb\n");
>  		return ERR_PTR(-ENOMEM);
>  	}
> =20
> -	drm_helper_mode_fill_fb_struct(dev, &hibmc_fb->fb, mode_cmd);
> -	hibmc_fb->obj =3D obj;
> -	ret =3D drm_framebuffer_init(dev, &hibmc_fb->fb, &hibmc_fb_funcs);
> +	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	fb->obj[0] =3D obj;
> +	ret =3D drm_framebuffer_init(dev, fb, &hibmc_fb_funcs);
>  	if (ret) {
>  		DRM_ERROR("drm_framebuffer_init failed: %d\n", ret);
> -		kfree(hibmc_fb);
> +		kfree(fb);
>  		return ERR_PTR(ret);
>  	}
> =20
> -	return hibmc_fb;
> -}
> -
> -static struct drm_framebuffer *
> -hibmc_user_framebuffer_create(struct drm_device *dev,
> -			      struct drm_file *filp,
> -			      const struct drm_mode_fb_cmd2 *mode_cmd)
> -{
> -	struct drm_gem_object *obj;
> -	struct hibmc_framebuffer *hibmc_fb;
> -
> -	DRM_DEBUG_DRIVER("%dx%d, format %c%c%c%c\n",
> -			 mode_cmd->width, mode_cmd->height,
> -			 (mode_cmd->pixel_format) & 0xff,
> -			 (mode_cmd->pixel_format >> 8)  & 0xff,
> -			 (mode_cmd->pixel_format >> 16) & 0xff,
> -			 (mode_cmd->pixel_format >> 24) & 0xff);
> -
> -	obj =3D drm_gem_object_lookup(filp, mode_cmd->handles[0]);
> -	if (!obj)
> -		return ERR_PTR(-ENOENT);
> -
> -	hibmc_fb =3D hibmc_framebuffer_init(dev, mode_cmd, obj);
> -	if (IS_ERR(hibmc_fb)) {
> -		drm_gem_object_put_unlocked(obj);
> -		return ERR_PTR((long)hibmc_fb);
> -	}
> -	return &hibmc_fb->fb;
> +	return fb;
>  }
> =20
>  const struct drm_mode_config_funcs hibmc_mode_funcs =3D {
>  	.atomic_check =3D drm_atomic_helper_check,
>  	.atomic_commit =3D drm_atomic_helper_commit,
> -	.fb_create =3D hibmc_user_framebuffer_create,
> +	.fb_create =3D drm_gem_fb_create,
>  };
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3u6xVeBCtpXgK3CNF8gRLX247NGhe8iVa--

--8AaJKugCtQ94cnD2cI6E06hAoB1Fr6FlG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3XmUwACgkQaA3BHVML
eiN8QggAgvmQjP1jGSg8b67MmvYn0Fs6wHtMPKcAz/WgOYzIraDfZqYyD48EsRiB
f0gHordVutx6brCdR57OwBNMC8/4kfTrXuHY4RbuAp1Kp8suoTLr7F2qSrj7TsPW
dfFIOSFbaSv7LbaLO8jbjDcptr9Wmfqr46biFS/3fXDEeEW8l6dTN213rCUy5Whv
MKQRT7OwHdxKpEPPRy6zOLWBM20gBQyCr77Z0JJhVdAR3bqj8Xuh5MMioe5mK5Zm
2hAisV8M01srJqghbhJHm/UKujufRNEJBzCqRE/00llUyuN5gti9a6WtxApGyuXz
US769tXOvKDJhpdSQqxp7vcrUGeTlQ==
=uSfK
-----END PGP SIGNATURE-----

--8AaJKugCtQ94cnD2cI6E06hAoB1Fr6FlG--

--===============0598321717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0598321717==--
