Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1F359629
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8006E484;
	Fri,  9 Apr 2021 07:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFFF6E484
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:16:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB407AF27;
 Fri,  9 Apr 2021 07:16:29 +0000 (UTC)
Subject: Re: [PATCH 01/18] drm: Introduce new HDMI helpers
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-2-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <65a5bc82-b125-3da9-7f93-f87207718ee7@suse.de>
Date: Fri, 9 Apr 2021 09:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-2-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1627933102=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1627933102==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tF8XORvtnfZuD0PUSI0AA1ieb7OpYpnVO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tF8XORvtnfZuD0PUSI0AA1ieb7OpYpnVO
Content-Type: multipart/mixed; boundary="1U0sWlUfmPBOsR9WeFb8oMK8snN4HBWa5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <65a5bc82-b125-3da9-7f93-f87207718ee7@suse.de>
Subject: Re: [PATCH 01/18] drm: Introduce new HDMI helpers
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-2-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-2-maxime@cerno.tech>

--1U0sWlUfmPBOsR9WeFb8oMK8snN4HBWa5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

with my comments addressed:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The new bridge rework to support the input and output formats introduce=
d
> some boilerplate code that will need to be shared across drivers.
>=20
> Since dw-hdmi is the only driver so far, let's introduce those helpers
> based on that code.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/Makefile   |   2 +-
>   drivers/gpu/drm/drm_hdmi.c | 170 ++++++++++++++++++++++++++++++++++++=
+
>   include/drm/drm_hdmi.h     |  24 ++++++
>   3 files changed, 195 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/drm_hdmi.c
>   create mode 100644 include/drm/drm_hdmi.h
>=20
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 5eb5bf7c16e3..1b77bd64a37e 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -17,7 +17,7 @@ drm-y       :=3D	drm_auth.o drm_cache.o \
>   		drm_plane.o drm_color_mgmt.o drm_print.o \
>   		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>   		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> -		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> +		drm_client_modeset.o drm_atomic_uapi.o drm_hdmi.o drm_hdcp.o \
>   		drm_managed.o drm_vblank_work.o
>  =20
>   drm-$(CONFIG_DRM_LEGACY) +=3D drm_bufs.o drm_context.o drm_dma.o drm_=
legacy_misc.o drm_lock.o \
> diff --git a/drivers/gpu/drm/drm_hdmi.c b/drivers/gpu/drm/drm_hdmi.c
> new file mode 100644
> index 000000000000..3834d5dd6d88
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_hdmi.c
> @@ -0,0 +1,170 @@

The SPDX tag is missing from this file.

> +#include <linux/errno.h>
> +#include <linux/hdmi.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_hdmi.h>
> +
> +/**
> + * drm_hdmi_bus_fmt_is_rgb() - Is the media bus format an RGB format?
> + * @bus_format: MEDIA_BUS_FMT* to test
> + *
> + * Checks if the media bus format is an RGB one
> + *
> + * RETURNS:

Just a question on this. I always use 'Returns:' Is this supposed to be=20
in capital letters? And does it make a difference?

> + * True if the format is an RGB one, false otherwise
> + */
> +bool drm_hdmi_bus_fmt_is_rgb(u32 bus_format)
> +{
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_RGB121212_1X36:
> +	case MEDIA_BUS_FMT_RGB161616_1X48:
> +		return true;
> +

No empty line here and in similar places.

> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_rgb);
> +
> +/**
> + * drm_hdmi_bus_fmt_is_yuv444() - Is the media bus format an YUV444 fo=
rmat?
> + * @bus_format: MEDIA_BUS_FMT* to test
> + *
> + * Checks if the media bus format is an YUV444 one
> + *
> + * RETURNS:
> + * True if the format is an YUV444 one, false otherwise
> + */
> +bool drm_hdmi_bus_fmt_is_yuv444(u32 bus_format)
> +{
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_YUV12_1X36:
> +	case MEDIA_BUS_FMT_YUV16_1X48:
> +		return true;
> +
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_yuv444);
> +
> +/**
> + * drm_hdmi_bus_fmt_is_yuv422() - Is the media bus format an YUV422 fo=
rmat?
> + * @bus_format: MEDIA_BUS_FMT* to test
> + *
> + * Checks if the media bus format is an YUV422 one
> + *
> + * RETURNS:
> + * True if the format is an YUV422 one, false otherwise
> + */
> +bool drm_hdmi_bus_fmt_is_yuv422(u32 bus_format)
> +{
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +	case MEDIA_BUS_FMT_UYVY12_1X24:
> +		return true;
> +
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_yuv422);
> +
> +/**
> + * drm_hdmi_bus_fmt_is_yuv420() - Is the media bus format an YUV420 fo=
rmat?
> + * @bus_format: MEDIA_BUS_FMT* to test
> + *
> + * Checks if the media bus format is an YUV420 one
> + *
> + * RETURNS:
> + * True if the format is an YUV420 one, false otherwise
> + */
> +bool drm_hdmi_bus_fmt_is_yuv420(u32 bus_format)
> +{
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +		return true;
> +
> +	default:
> +		return false;
> +	}
> +}
> +EXPORT_SYMBOL(drm_hdmi_bus_fmt_is_yuv420);
> +
> +/**
> + * drm_hdmi_bus_fmt_color_depth() - Returns the color depth in bits
> + * @bus_format: MEDIA_BUS_FMT* to test
> + *
> + * Computes the number of bits per color for a given media bus format
> + *
> + * RETURNS:
> + * The number of bits per color
> + */
> +int drm_hdmi_bus_fmt_color_depth(u32 bus_format)
> +{
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +		return 8;
> +
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +		return 10;
> +
> +	case MEDIA_BUS_FMT_RGB121212_1X36:
> +	case MEDIA_BUS_FMT_YUV12_1X36:
> +	case MEDIA_BUS_FMT_UYVY12_1X24:
> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +		return 12;
> +
> +	case MEDIA_BUS_FMT_RGB161616_1X48:
> +	case MEDIA_BUS_FMT_YUV16_1X48:
> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +		return 16;
> +
> +	default:
> +		return 0;
> +	}
> +}
> +EXPORT_SYMBOL(drm_hdmi_bus_fmt_color_depth);
> +
> +/**
> + * drm_hdmi_bus_fmt_color_depth() - Returns the color depth in bits
> + * @bus_format: MEDIA_BUS_FMT* to test
> + *
> + * Computes the number of bits per color for a given media bus format
> + *
> + * RETURNS:
> + * The number of bits per color
> + */
> +int drm_hdmi_avi_infoframe_output_colorspace(struct hdmi_avi_infoframe=
 *frame,
> +					     struct drm_bus_cfg *out_bus_cfg)
> +{
> +	if (drm_hdmi_bus_fmt_is_yuv444(out_bus_cfg->format))
> +		frame->colorspace =3D HDMI_COLORSPACE_YUV444;
> +	else if (drm_hdmi_bus_fmt_is_yuv422(out_bus_cfg->format))
> +		frame->colorspace =3D HDMI_COLORSPACE_YUV422;
> +	else if (drm_hdmi_bus_fmt_is_yuv420(out_bus_cfg->format))
> +		frame->colorspace =3D HDMI_COLORSPACE_YUV420;
> +	else if (drm_hdmi_bus_fmt_is_rgb(out_bus_cfg->format))
> +		frame->colorspace =3D HDMI_COLORSPACE_RGB;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_hdmi_avi_infoframe_output_colorspace);
> diff --git a/include/drm/drm_hdmi.h b/include/drm/drm_hdmi.h
> new file mode 100644
> index 000000000000..8cd281699ea0
> --- /dev/null
> +++ b/include/drm/drm_hdmi.h
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2013-2015 Mentor Graphics Inc.
> + * Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> + * Copyright (C) 2010, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> + */
> +
> +#ifndef __DRM_HDMI_H_
> +#define __DRM_HDMI_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_bus_cfg;
> +struct hdmi_avi_infoframe;
> +
> +bool drm_hdmi_bus_fmt_is_rgb(u32 bus_format);
> +bool drm_hdmi_bus_fmt_is_yuv444(u32 bus_format);
> +bool drm_hdmi_bus_fmt_is_yuv422(u32 bus_format);
> +bool drm_hdmi_bus_fmt_is_yuv420(u32 bus_format);
> +int drm_hdmi_bus_fmt_color_depth(u32 bus_format);
> +int drm_hdmi_avi_infoframe_output_colorspace(struct hdmi_avi_infoframe=
 *frame,
> +					     struct drm_bus_cfg *out_bus_cfg);
> +
> +#endif // __DRM_HDMI_H_
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1U0sWlUfmPBOsR9WeFb8oMK8snN4HBWa5--

--tF8XORvtnfZuD0PUSI0AA1ieb7OpYpnVO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBv/0sFAwAAAAAACgkQlh/E3EQov+Bs
gxAAjBoRYP7MJZpJc8gdErSu4NRt3LCggyT/yrjoecoWF9RipDSn7QT9ixd5AxBIuk4RxNWj+qbl
31L5PYR08mhRP451+yIM6V9DMv7wdqR7smCApqlTYFMV5f41HfoArIUvuVJuREHp4GqYfPOWAGdT
hn0+uAbEkVc09iwBPx5ZsukGuxRZpP8JGFxYAnhiHmoEruVo2I2YdtOhGebG478McQQ48sll/b86
hAWsvPkllAlUmIVEsy+3KLQVDKHG9J2S435nq08jcSEkYwtfJPKh0Kbir6QQwPM2sHWKsaBNZZ8O
SfPSU4X+Bo1mjD7337EKw/ZKDYKU9Z0fnd7sToUMgDRf6yKZ7fk/vyT1ng2E7C4NMieoMvp71NjY
gqneKcluGYEAfZu+czuFjQzolqYAPNgAg+kHIO3ueuMqzXWhaUDMaaGyJZJWmAjxrI5ApQRtLQql
bZCsC5d0E9f4VJyenshVRseTO0tGn9yRu/R6RFmgH4iTQf0iv/YmsCvlws/IemyYdFd2MRQfJ/xJ
bnsDJWddz/ahMD2g+o5H/+dtizLYi9ci8HOi/pxMwgI6sqIiaTxBK6mA9wtyjfATQo86eOQgLtHd
WjVPtS2vtY+B7Q8NTsrKx/iO4ZPDWx9cLoPBAzWKMnV1awl6U+WT6StUJf4Slwif9pVqD0dNAgKN
qcA=
=UDYH
-----END PGP SIGNATURE-----

--tF8XORvtnfZuD0PUSI0AA1ieb7OpYpnVO--

--===============1627933102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1627933102==--
