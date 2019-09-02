Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C58A5920
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 16:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F369B89804;
	Mon,  2 Sep 2019 14:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7889804
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 14:19:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4503AEE0;
 Mon,  2 Sep 2019 14:19:55 +0000 (UTC)
Subject: Re: [PATCH 1/5] drm/ttm: add drm_gem_ttm_print_info()
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-2-kraxel@redhat.com>
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
Message-ID: <199bbf8d-68bc-ea99-723e-3b88045970c4@suse.de>
Date: Mon, 2 Sep 2019 16:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902124126.7700-2-kraxel@redhat.com>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1535939294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1535939294==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cjdjp9ulf2nRxuOF8VQ8GWyCSJ89L0qOD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cjdjp9ulf2nRxuOF8VQ8GWyCSJ89L0qOD
Content-Type: multipart/mixed; boundary="2ENU1Q48nBJiWetPUBub11NB9hTIhOfj1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Message-ID: <199bbf8d-68bc-ea99-723e-3b88045970c4@suse.de>
Subject: Re: [PATCH 1/5] drm/ttm: add drm_gem_ttm_print_info()
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-2-kraxel@redhat.com>
In-Reply-To: <20190902124126.7700-2-kraxel@redhat.com>

--2ENU1Q48nBJiWetPUBub11NB9hTIhOfj1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

But please see below.

Am 02.09.19 um 14:41 schrieb Gerd Hoffmann:
> Now with ttm_buffer_object being a subclass of drm_gem_object we can
> easily lookup ttm_buffer_object for a given drm_gem_object, which in
> turm allows to create common helper functions.

s/trum/trun

>=20
> This patch starts off with a drm_gem_ttm_print_info() helper function
> which prints adds some ttm specific lines to the debug output.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem_ttm_helper.h     | 19 ++++++++
>  drivers/gpu/drm/drm_gem_ttm_helper.c | 67 ++++++++++++++++++++++++++++=

>  Documentation/gpu/drm-mm.rst         | 12 +++++
>  drivers/gpu/drm/Kconfig              |  7 +++
>  drivers/gpu/drm/Makefile             |  3 ++
>  5 files changed, 108 insertions(+)
>  create mode 100644 include/drm/drm_gem_ttm_helper.h
>  create mode 100644 drivers/gpu/drm/drm_gem_ttm_helper.c
>=20
> diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm=
_helper.h
> new file mode 100644
> index 000000000000..6268f89c5a48
> --- /dev/null
> +++ b/include/drm/drm_gem_ttm_helper.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef DRM_GEM_TTM_HELPER_H
> +#define DRM_GEM_TTM_HELPER_H
> +
> +#include <linux/kernel.h>
> +
> +#include <drm/drm_gem.h>
> +#include <drm/drm_device.h>
> +#include <drm/ttm/ttm_bo_api.h>
> +#include <drm/ttm/ttm_bo_driver.h>
> +
> +#define drm_gem_ttm_of_gem(gem_obj) \
> +	container_of(gem_obj, struct ttm_buffer_object, base)
> +
> +void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent=
,
> +			    const struct drm_gem_object *gem);
> +
> +#endif
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm=
_gem_ttm_helper.c
> new file mode 100644
> index 000000000000..cd6ac2cc8fdd
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/module.h>
> +
> +#include <drm/drm_gem_ttm_helper.h>
> +
> +/**
> + * DOC: overview
> + *
> + * This library provides helper functions for gem objects backed by
> + * ttm.
> + */
> +
> +/**
> + * drm_gem_ttm_print_info() - Print &ttm_buffer_object info for debugf=
s
> + * @p: DRM printer
> + * @indent: Tab indentation level
> + * @gem: GEM object
> + *
> + * This function can be used as the &drm_driver->gem_print_info callba=
ck.
> + */
> +void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent=
,
> +			    const struct drm_gem_object *gem)
> +{
> +	static const char *plname[] =3D {

The array and the strings should be declared const. IIRC something like

  static const char * const plname[] =3D {

> +		[ TTM_PL_SYSTEM ] =3D "system",
> +		[ TTM_PL_TT     ] =3D "tt",
> +		[ TTM_PL_VRAM   ] =3D "vram",
> +		[ TTM_PL_PRIV   ] =3D "priv",
> +

This 'gap' in the array seems to be a problem for drivers that use these
bits. Could the print logic be moved into s separate function that also
takes the array as an argument?

Best regards
Thomas

> +		[ 16 ]            =3D "cached",
> +		[ 17 ]            =3D "uncached",
> +		[ 18 ]            =3D "wc",
> +		[ 19 ]            =3D "contig",
> +
> +		[ 21 ]            =3D "pinned", /* NO_EVICT */
> +		[ 22 ]            =3D "topdown",
> +	};
> +	const struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> +	bool first =3D true;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(plname); i++) {
> +		if (!(bo->mem.placement & (1 << i)))
> +			continue;
> +		if (!plname[i])
> +			continue;
> +		if (first) {
> +			first =3D false;
> +			drm_printf_indent(p, indent, "placement=3D%s", plname[i]);
> +		} else
> +			drm_printf(p, ",%s", plname[i]);
> +	}
> +	if (!first)
> +		drm_printf(p, "\n");
> +
> +	if (bo->mem.bus.is_iomem) {
> +		drm_printf_indent(p, indent, "bus.base=3D%lx\n",
> +				  (unsigned long)bo->mem.bus.base);
> +		drm_printf_indent(p, indent, "bus.offset=3D%lx\n",
> +				  (unsigned long)bo->mem.bus.offset);
> +	}
> +}
> +EXPORT_SYMBOL(drm_gem_ttm_print_info);
> +
> +MODULE_DESCRIPTION("DRM gem ttm helpers");
> +MODULE_LICENSE("GPL");
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rs=
t
> index b664f054c259..a70a1d9f30ec 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -412,6 +412,18 @@ VRAM MM Helper Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_vram_mm_helper.c
>     :export:
> =20
> +GEM TTM Helper Functions Reference
> +-----------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gem_ttm_helper.c
> +   :doc: overview
> +
> +.. kernel-doc:: include/drm/drm_gem_ttm_helper.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_gem_ttm_helper.c
> +   :export:
> +
>  VMA Offset Manager
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index e6f40fb54c9a..f7b25519f95c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -172,6 +172,13 @@ config DRM_VRAM_HELPER
>  	help
>  	  Helpers for VRAM memory management
> =20
> +config DRM_TTM_HELPER
> +	tristate
> +	depends on DRM
> +	select DRM_TTM
> +	help
> +	  Helpers for ttm-based gem objects
> +
>  config DRM_GEM_CMA_HELPER
>  	bool
>  	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 10f8329a8b71..545c61d6528b 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -37,6 +37,9 @@ drm_vram_helper-y :=3D drm_gem_vram_helper.o \
>  		     drm_vram_mm_helper.o
>  obj-$(CONFIG_DRM_VRAM_HELPER) +=3D drm_vram_helper.o
> =20
> +drm_ttm_helper-y :=3D drm_gem_ttm_helper.o
> +obj-$(CONFIG_DRM_TTM_HELPER) +=3D drm_ttm_helper.o
> +
>  drm_kms_helper-y :=3D drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_=
probe_helper.o \
>  		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
>  		drm_kms_helper_common.o drm_dp_dual_mode_helper.o \
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--2ENU1Q48nBJiWetPUBub11NB9hTIhOfj1--

--cjdjp9ulf2nRxuOF8VQ8GWyCSJ89L0qOD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1tJQoACgkQaA3BHVML
eiOHcAf3VTUaB9PMaditKrmiH36Jt8ohPz8W0pa/SFXIDg+YKId36BTBxbxJXUcK
p+nD1ZL39TxMbHYORl0vQpJIzef1JKSu3NMGZa5UuErPpEoerqsXf90Ua7tkJHGv
DsC/N8hcjirwkaQoXGL2eJoaRyb8mrlzb57NQ1evN7iIpJT1++Pto2w7UqclTixp
lr1+Bqi+pHhzwGx7zkTLlcgxxIzoVwC66Pin9EEnrmxCSm5cHRKzXj8kSCsZTejo
Ls/nk4dCAw3+WRIMA1789qxKZjWHqQh0vPPSZBYnq/TV24rgnkzbg9FF28uEU9Bi
9DSR9YP3QZprzRfogKEY00LNa3Y8
=UtGE
-----END PGP SIGNATURE-----

--cjdjp9ulf2nRxuOF8VQ8GWyCSJ89L0qOD--

--===============1535939294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1535939294==--
