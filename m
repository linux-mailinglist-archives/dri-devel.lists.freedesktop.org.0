Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D530AA1D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC59E6E7DA;
	Mon,  1 Feb 2021 14:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E666E7DA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:44:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57D6FAB92;
 Mon,  1 Feb 2021 14:44:52 +0000 (UTC)
Subject: Re: [PATCH 6/6] drm/gma500: Never wait for blits
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-6-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f7243a58-1981-2836-f4cd-9d18918a8fac@suse.de>
Date: Mon, 1 Feb 2021 15:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201132617.1233-6-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie
Content-Type: multipart/mixed; boundary="===============0737658800=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0737658800==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="irNGCRgfEXQUijtiSBJgW01JOsAWdIZDN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--irNGCRgfEXQUijtiSBJgW01JOsAWdIZDN
Content-Type: multipart/mixed; boundary="bVm6jncwk30flTY4UpiHgBKtF97CrpJKF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie
Message-ID: <f7243a58-1981-2836-f4cd-9d18918a8fac@suse.de>
Subject: Re: [PATCH 6/6] drm/gma500: Never wait for blits
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-6-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20210201132617.1233-6-patrik.r.jakobsson@gmail.com>

--bVm6jncwk30flTY4UpiHgBKtF97CrpJKF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.02.21 um 14:26 schrieb Patrik Jakobsson:
> Blits cannot happen anymore since we removed the 2d accel code. Stop
> checking for a busy blitter and remove the remaining blitter code.
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/Makefile  |  1 -
>   drivers/gpu/drm/gma500/blitter.c | 43 -------------------------------=
-
>   drivers/gpu/drm/gma500/blitter.h | 16 ------------
>   drivers/gpu/drm/gma500/gtt.c     | 11 --------
>   4 files changed, 71 deletions(-)
>   delete mode 100644 drivers/gpu/drm/gma500/blitter.c
>   delete mode 100644 drivers/gpu/drm/gma500/blitter.h
>=20
> diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/M=
akefile
> index 6ee1ef389979..8c649d3ef6a4 100644
> --- a/drivers/gpu/drm/gma500/Makefile
> +++ b/drivers/gpu/drm/gma500/Makefile
> @@ -5,7 +5,6 @@
>  =20
>   gma500_gfx-y +=3D \
>   	  backlight.o \
> -	  blitter.o \
>   	  cdv_device.o \
>   	  cdv_intel_crt.o \
>   	  cdv_intel_display.o \
> diff --git a/drivers/gpu/drm/gma500/blitter.c b/drivers/gpu/drm/gma500/=
blitter.c
> deleted file mode 100644
> index cb2504a4a15f..000000000000
> --- a/drivers/gpu/drm/gma500/blitter.c
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2014, Patrik Jakobsson
> - * All Rights Reserved.
> - *
> - * Authors: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> - */
> -
> -#include "psb_drv.h"
> -
> -#include "blitter.h"
> -#include "psb_reg.h"
> -
> -/* Wait for the blitter to be completely idle */
> -int gma_blt_wait_idle(struct drm_psb_private *dev_priv)
> -{
> -	unsigned long stop =3D jiffies + HZ;
> -	int busy =3D 1;
> -
> -	/* NOP for Cedarview */
> -	if (IS_CDV(dev_priv->dev))
> -		return 0;
> -
> -	/* First do a quick check */
> -	if ((PSB_RSGX32(PSB_CR_2D_SOCIF) =3D=3D _PSB_C2_SOCIF_EMPTY) &&
> -	    ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) & _PSB_C2B_STATUS_BUSY) =3D=3D=
 0))
> -		return 0;
> -
> -	do {
> -		busy =3D (PSB_RSGX32(PSB_CR_2D_SOCIF) !=3D _PSB_C2_SOCIF_EMPTY);
> -	} while (busy && !time_after_eq(jiffies, stop));
> -
> -	if (busy)
> -		return -EBUSY;
> -
> -	do {
> -		busy =3D ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) &
> -			_PSB_C2B_STATUS_BUSY) !=3D 0);
> -	} while (busy && !time_after_eq(jiffies, stop));
> -
> -	/* If still busy, we probably have a hang */
> -	return (busy) ? -EBUSY : 0;
> -}
> diff --git a/drivers/gpu/drm/gma500/blitter.h b/drivers/gpu/drm/gma500/=
blitter.h
> deleted file mode 100644
> index 8d67dabd9ba3..000000000000
> --- a/drivers/gpu/drm/gma500/blitter.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2014, Patrik Jakobsson
> - * All Rights Reserved.
> - *
> - * Authors: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> - */
> -
> -#ifndef __BLITTER_H
> -#define __BLITTER_H
> -
> -struct drm_psb_private;
> -
> -extern int gma_blt_wait_idle(struct drm_psb_private *dev_priv);
> -
> -#endif
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.=
c
> index e884750bc123..df9b611b856a 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -11,7 +11,6 @@
>  =20
>   #include <asm/set_memory.h>
>  =20
> -#include "blitter.h"
>   #include "psb_drv.h"
>  =20
>  =20
> @@ -229,18 +228,9 @@ void psb_gtt_unpin(struct gtt_range *gt)
>   	struct drm_device *dev =3D gt->gem.dev;
>   	struct drm_psb_private *dev_priv =3D dev->dev_private;
>   	u32 gpu_base =3D dev_priv->gtt.gatt_start;
> -	int ret;
>  =20
> -	/* While holding the gtt_mutex no new blits can be initiated */
>   	mutex_lock(&dev_priv->gtt_mutex);
>  =20
> -	/* Wait for any possible usage of the memory to be finished */
> -	ret =3D gma_blt_wait_idle(dev_priv);
> -	if (ret) {
> -		DRM_ERROR("Failed to idle the blitter, unpin failed!");
> -		goto out;
> -	}
> -
>   	WARN_ON(!gt->in_gart);
>  =20
>   	gt->in_gart--;
> @@ -251,7 +241,6 @@ void psb_gtt_unpin(struct gtt_range *gt)
>   		psb_gtt_detach_pages(gt);
>   	}
>  =20
> -out:
>   	mutex_unlock(&dev_priv->gtt_mutex);
>   }
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--bVm6jncwk30flTY4UpiHgBKtF97CrpJKF--

--irNGCRgfEXQUijtiSBJgW01JOsAWdIZDN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAYE+MFAwAAAAAACgkQlh/E3EQov+Dj
VxAAvrXTelZQJJw2YM/3oSDsdWnI0SD0I7tOtL48xhWwSU2xj7GpmhjdcVOldrCKnKvLCl6UKltU
tGY8bSjKfHnwMGy0fuzj0ix09cFRQqEGCADOWxfVT0jlreekb3JDLuYg8tbj5EIQAtcGauc/ZuPF
/pw5ESOC8wOngHtj2fg3pMwkbim6Z4NSOX4tGftz4p7xmKzdCxq6mmk9Dgwwa2ukw6+i9T+0sXNx
M7jhCoGryOVmOihrQRj3geSEM73vHTDfuED/F2aW1rNu0FQJYtWj+80s4Qknu0gXpAFdUXlp4RTp
0lr/lqjBiFrJjArOBpr3kYJXkHCifoGAkBG1f05rAL8LBb2x75r+4Qgtvo3gd+oVuwZ7W3buleCd
c2xh1OXDDznJ0HnCNCHVw7Ds7ec6y6/x2fzLDLqVmMZSlCQQoEpEIkJn4xPip0XIlExuVL+cYoYs
POsttvCMDPj90DXLpWn/PgY9JPeHY4w8YsiYkPPjVEAzI7nGyhiAMVnKalzzQe7gqczLaNhbZxXz
JvhDFB01HCi06AeS1m1G0eD0AJiC6Pyuc9Q0eDtRQq49OL0OfFSbD8PCfWaAWuoSUQthIgxsyyZU
lDbwso5npvygVm1XrcT5E9SLpVs8vs6sDHwSOhrt0jhjQ1fyuqLJEWpXUiFZ2nAzys6o86ysI/TE
NBM=
=5Shd
-----END PGP SIGNATURE-----

--irNGCRgfEXQUijtiSBJgW01JOsAWdIZDN--

--===============0737658800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0737658800==--
