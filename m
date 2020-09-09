Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0EB262953
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79EC6EA76;
	Wed,  9 Sep 2020 07:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86B66EA76;
 Wed,  9 Sep 2020 07:54:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 012EBAB8B;
 Wed,  9 Sep 2020 07:54:15 +0000 (UTC)
Subject: Re: [PATCH 24/24] drm/arc: Move to drm/tiny
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-25-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4ccaebf3-e1b5-8ca4-1f69-ac4b9d93277d@suse.de>
Date: Wed, 9 Sep 2020 09:54:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904143941.110665-25-daniel.vetter@ffwll.ch>
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0502273900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0502273900==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xLRTUUIAJQml5CknFcJyCMjRvNoamIqSD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xLRTUUIAJQml5CknFcJyCMjRvNoamIqSD
Content-Type: multipart/mixed; boundary="JyRDEOAlaRFUcRuF4dv2BpeEqBJsDZXh7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <4ccaebf3-e1b5-8ca4-1f69-ac4b9d93277d@suse.de>
Subject: Re: [PATCH 24/24] drm/arc: Move to drm/tiny
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-25-daniel.vetter@ffwll.ch>
In-Reply-To: <20200904143941.110665-25-daniel.vetter@ffwll.ch>

--JyRDEOAlaRFUcRuF4dv2BpeEqBJsDZXh7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.09.20 um 16:39 schrieb Daniel Vetter:
> Because it is.

Absolutely.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> v2: Delete now unused crtc funcs (0day)
>=20
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  MAINTAINERS                                         |  2 +-
>  drivers/gpu/drm/Kconfig                             |  2 --
>  drivers/gpu/drm/Makefile                            |  1 -
>  drivers/gpu/drm/arc/Kconfig                         | 10 ----------
>  drivers/gpu/drm/arc/Makefile                        |  3 ---
>  drivers/gpu/drm/tiny/Kconfig                        | 10 ++++++++++
>  drivers/gpu/drm/tiny/Makefile                       |  1 +
>  drivers/gpu/drm/{arc/arcpgu_drv.c =3D> tiny/arcpgu.c} |  0
>  8 files changed, 12 insertions(+), 17 deletions(-)
>  delete mode 100644 drivers/gpu/drm/arc/Kconfig
>  delete mode 100644 drivers/gpu/drm/arc/Makefile
>  rename drivers/gpu/drm/{arc/arcpgu_drv.c =3D> tiny/arcpgu.c} (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f92035bfbbcd..b16e80c4d669 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1334,7 +1334,7 @@ ARC PGU DRM DRIVER
>  M:	Alexey Brodkin <abrodkin@synopsys.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
> -F:	drivers/gpu/drm/arc/
> +F:	drivers/gpu/drm/tiny/arcpgu.c
> =20
>  ARCNET NETWORK LAYER
>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 147d61b9674e..9efb82caaa87 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -354,8 +354,6 @@ source "drivers/gpu/drm/vc4/Kconfig"
> =20
>  source "drivers/gpu/drm/etnaviv/Kconfig"
> =20
> -source "drivers/gpu/drm/arc/Kconfig"
> -
>  source "drivers/gpu/drm/hisilicon/Kconfig"
> =20
>  source "drivers/gpu/drm/mediatek/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2f31579f91d4..6c15ef9b04d6 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -109,7 +109,6 @@ obj-y			+=3D panel/
>  obj-y			+=3D bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) +=3D fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) +=3D etnaviv/
> -obj-$(CONFIG_DRM_ARCPGU)+=3D arc/
>  obj-y			+=3D hisilicon/
>  obj-$(CONFIG_DRM_ZTE)	+=3D zte/
>  obj-$(CONFIG_DRM_MXSFB)	+=3D mxsfb/
> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> deleted file mode 100644
> index e8f3d63e0b91..000000000000
> --- a/drivers/gpu/drm/arc/Kconfig
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config DRM_ARCPGU
> -	tristate "ARC PGU"
> -	depends on DRM && OF
> -	select DRM_KMS_CMA_HELPER
> -	select DRM_KMS_HELPER
> -	help
> -	  Choose this option if you have an ARC PGU controller.
> -
> -	  If M is selected the module will be called arcpgu.
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefil=
e
> deleted file mode 100644
> index b26f2495c532..000000000000
> --- a/drivers/gpu/drm/arc/Makefile
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -arcpgu-y :=3D arcpgu_drv.o
> -obj-$(CONFIG_DRM_ARCPGU) +=3D arcpgu.o
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfi=
g
> index 2b6414f0fa75..9bbaa1a69050 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -1,5 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> =20
> +config DRM_ARCPGU
> +	tristate "ARC PGU"
> +	depends on DRM && OF
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this option if you have an ARC PGU controller.
> +
> +	  If M is selected the module will be called arcpgu.
> +
>  config DRM_CIRRUS_QEMU
>  	tristate "Cirrus driver for QEMU emulated device"
>  	depends on DRM && PCI && MMU
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makef=
ile
> index 6ae4e9e5a35f..bef6780bdd6f 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> =20
> +obj-$(CONFIG_DRM_ARCPGU)		+=3D arcpgu.o
>  obj-$(CONFIG_DRM_CIRRUS_QEMU)		+=3D cirrus.o
>  obj-$(CONFIG_DRM_GM12U320)		+=3D gm12u320.o
>  obj-$(CONFIG_TINYDRM_HX8357D)		+=3D hx8357d.o
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/tiny/ar=
cpgu.c
> similarity index 100%
> rename from drivers/gpu/drm/arc/arcpgu_drv.c
> rename to drivers/gpu/drm/tiny/arcpgu.c
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--JyRDEOAlaRFUcRuF4dv2BpeEqBJsDZXh7--

--xLRTUUIAJQml5CknFcJyCMjRvNoamIqSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9YiiUUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNZkQgAmNi0dpzQzmNZONyCca6jtEfsdVrP
ATf65Plh/Zx0pieulYUik1er7Kt/BGJY7YvJmy5js8q0asCsOHkQeFYsTkliY5bl
L0sSZBIGXiwgWRuv7qNXQVidcVxxxQDbtE/afJRBdBqorGNaqv/eHu/UcVSTL0nP
wOqLwRj6DpbWomueEzTfMquXK3gz8trVkn3wYfq7mItmNVoePJp8nDCwo5IDyczo
ftAaZzCXSuJJMyS2fXQrHpsFEWgO3KHDpnFSW6N6n3iueHJ3gonq/ELTYoWopUfG
hviyrP4GVoPogYFSQUOGN+4WwhLc5cuVrG+tHG24R6z7pgeT9neIDIMo+w==
=r2O8
-----END PGP SIGNATURE-----

--xLRTUUIAJQml5CknFcJyCMjRvNoamIqSD--

--===============0502273900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0502273900==--
