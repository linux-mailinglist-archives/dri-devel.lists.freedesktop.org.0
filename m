Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD991A9582
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 10:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C737B6E8FE;
	Wed, 15 Apr 2020 08:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FBB6E8FE;
 Wed, 15 Apr 2020 08:04:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4505FAD2C;
 Wed, 15 Apr 2020 08:04:49 +0000 (UTC)
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
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
Message-ID: <b354f293-111e-166f-eac2-8f061169bb81@suse.de>
Date: Wed, 15 Apr 2020 10:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-54-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0163356443=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0163356443==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xIYzm7Q1FmMoRDMxt8IC3ikf9fdEOd2Tl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xIYzm7Q1FmMoRDMxt8IC3ikf9fdEOd2Tl
Content-Type: multipart/mixed; boundary="qebEZc3nCgYVemTBIdJOFvKdwYIbC8hgq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <b354f293-111e-166f-eac2-8f061169bb81@suse.de>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
In-Reply-To: <20200415074034.175360-54-daniel.vetter@ffwll.ch>

--qebEZc3nCgYVemTBIdJOFvKdwYIbC8hgq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.04.20 um 09:40 schrieb Daniel Vetter:
> Because it is.

Yes.

OTOH, as much as I appreciate the simplification, I think it should be
in a separate series.

>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

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
> index 0a5cf105ee37..748244b1625b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1295,7 +1295,7 @@ ARC PGU DRM DRIVER
>  M:	Alexey Brodkin <abrodkin@synopsys.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
> -F:	drivers/gpu/drm/arc/
> +F:	drivers/gpu/drm/tiny/arcpgu.c
> =20
>  ARCNET NETWORK LAYER
>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 4f4e7fa001c1..a0a89025d6fa 100644
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
> index 2c0e5a7e5953..e69eafbf9e39 100644
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


--qebEZc3nCgYVemTBIdJOFvKdwYIbC8hgq--

--xIYzm7Q1FmMoRDMxt8IC3ikf9fdEOd2Tl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6WwBwACgkQaA3BHVML
eiNZ4Af/UFTTgKFcokX83J5qNUvto4LgspWsgF4UdRpmoFF+71dDy5yTImLBOoW/
4LWbvWl6LqSEzuQE7nD85xA1TPM88y6souvTSf8PjGSMEFjMz1xhxt19Q14QgRL+
13S7t5xM70kFjZXYYFaKGdjCvQhOEqInrHKEJ/k4JwjDLk/+1fyiyOzj45RrgJ2m
r5sMJJXiU2u59WuFBFqDJKpzYPU09ZNnz3xMMZeqWx91+iR6gffizZcJ6xhwj8TA
mEzk43REFCwqp9K9iEaNprpNJFzloBXjoVvVs3eBTik1VsGKLgKzkD1n4T9fiuJv
cjmZdHoVpfHzSD3vrU0PVjUr2u4xwg==
=cyKm
-----END PGP SIGNATURE-----

--xIYzm7Q1FmMoRDMxt8IC3ikf9fdEOd2Tl--

--===============0163356443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0163356443==--
