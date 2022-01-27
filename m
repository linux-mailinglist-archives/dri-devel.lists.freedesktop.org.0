Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B949DEB2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6EA10EE50;
	Thu, 27 Jan 2022 10:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF02810EE96
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:04:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 38DF25C01D3;
 Thu, 27 Jan 2022 05:04:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 05:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=xopkhIypaCipPIeujCY8BrcQk6x1DWJf0YA/S4
 pHu14=; b=ShIxdNQ7MZp/1macY2DQlytgfoWZZVS6ZrCjlipoPIB2lWkhB5h07c
 soBcUe7trRlkFvaJg9eNVzYl/DJxB4sdqhLGMR85ns6XHVtBbEI4XfMnVkn0G8iR
 2DuRKH/his9vG5H3iLrmhjLmuVQxMYZspfAwUaRRzI7Y5oib0LAPOFn8L61Cfi6j
 0kQSYWWmF4AaljXWRyKJp3EGssvFywDhQyv2MsFdvGhLsgf62CYSTM4ETa0xmUpT
 rgWTZ3JmO0DLZxBRXvIsFAQx7yApt3LDKZL6LWpoPdKC0/VGq9vahYjxVr/h4xuC
 kH1LrKUF77xZIYDC+fWILH1mUAMXktFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xopkhIypaCipPIeuj
 CY8BrcQk6x1DWJf0YA/S4pHu14=; b=eikibHqlrHqMFODXXRh9jtMeLAuVA8o/A
 Uk70r6fVkhxh556pd7Gbi5PHzy/9EZKd2SC/2yKruNbeDIb/F1uyRGva7eYx0/Yq
 vL6J4OePnDUjT7xGnIDXDwRkRINATzB0+QgddMSDYrbeSSZholgnM9TAHHFjgiPi
 ow1vA5bUDmBlH9a/weJZV7KtvhvTCXqjX8nylWWbSpACQzyPOmVIrIVsW8WAd4rR
 4cbtLh1w+fX0J2aeqDfP38fh2RLMNmERhaWGiGBPVSwOF6nNBynkJXH/4v1uCT5V
 bqWU98jcmhc/pFgKju59rR6N14EbkZZPsn7LMi9aKCEI70i0YjtEQ==
X-ME-Sender: <xms:R27yYVkgp600a6kr0Y1ogiamrWcJ8jYThBf2hICK7gVt56o5893jvw>
 <xme:R27yYQ3YOl-Ww5MWNJSq_vlW6_-ZeID3qfDT6lu-DLBG9Jlgiy6Uj38gmqwtHIMoD
 Fme2PChjdTw81eGEhs>
X-ME-Received: <xmr:R27yYboDhtO9N6z-mZQIiCXvIhA7vmwe2lHTl9qtzIAODq6xBm-ZT6EmgzRY7Q2ONsnvgZYv9hVLeMOZFWMRRtrd64aUfzR5-B5ZxaM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeehgeejkeeujeejueejiefhtddtteehteevudeihfejffetffegteevhfeitefg
 geenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R27yYVkexHecECxEIc_GcUAhM1cvBU37yj8JlIDTiR1twcXWBsO0gg>
 <xmx:R27yYT2mFJarcMLfypnSrT_ky5dj4cB5YZocOTjF34qTFgVCsimMtA>
 <xmx:R27yYUsySBtxwzLv3Fk7OenvCKUXlK-bAZ3Q3wlSFdr44rxTlDRfcw>
 <xmx:R27yYdpNcRk165r3DFtr5sGyc6bPgcR9cbjgJAybTLwovLhK_WxX9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 05:04:54 -0500 (EST)
Date: Thu, 27 Jan 2022 11:04:52 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Message-ID: <20220127100452.bmxcgf6ye3nxrgtq@houat>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y4vfjt4ve5verjss"
Content-Disposition: inline
In-Reply-To: <20220125175700.37408-4-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y4vfjt4ve5verjss
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 06:57:00PM +0100, Noralf Tr=F8nnes wrote:
> Add a driver that will work with most MIPI DBI compatible SPI panels.
> This avoids adding a driver for every new MIPI DBI compatible controller
> that is to be used by Linux. The 'compatible' Device Tree property with
> a '.bin' suffix will be used to load a firmware file that contains the
> controller configuration.
>=20
> Example (driver will load sainsmart18.bin):
>=20
> display@0 {
> 	compatible =3D "sainsmart18", "panel-mipi-dbi-spi";
> 	reg =3D <0>;
> 	reset-gpios =3D <&gpio 25 0>;
> 	dc-gpios =3D <&gpio 24 0>;
> };
>=20
> v2:
> - Drop model property and use compatible instead (Rob)
> - Add wiki entry in MAINTAINERS
>=20
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> ---
>  MAINTAINERS                            |   8 +
>  drivers/gpu/drm/panel/Kconfig          |  11 +
>  drivers/gpu/drm/panel/Makefile         |   1 +
>  drivers/gpu/drm/panel/panel-mipi-dbi.c | 394 +++++++++++++++++++++++++
>  4 files changed, 414 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-mipi-dbi.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d03ad8da1f36..8baa98723bdc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6047,6 +6047,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>  F:	drivers/gpu/drm/tiny/mi0283qt.c
> =20
> +DRM DRIVER FOR MIPI DBI compatible panels
> +M:	Noralf Tr=F8nnes <noralf@tronnes.org>
> +S:	Maintained
> +W:	https://github.com/notro/panel-mipi-dbi/wiki
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.ya=
ml
> +F:	drivers/gpu/drm/panel/panel-mipi-dbi.c
> +
>  DRM DRIVER FOR MSM ADRENO GPU
>  M:	Rob Clark <robdclark@gmail.com>
>  M:	Sean Paul <sean@poorly.run>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 434c2861bb40..1851cda5f877 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -274,6 +274,17 @@ config DRM_PANEL_LG_LG4573
>  	  Say Y here if you want to enable support for LG4573 RGB panel.
>  	  To compile this driver as a module, choose M here.
> =20
> +config DRM_PANEL_MIPI_DBI
> +	tristate "MIPI DBI compatible panel"
> +	depends on SPI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on DRM_KMS_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DBI
> +	help
> +	  Say Y here if you want to enable support for MIPI DBI compatible pane=
ls.
> +	  To compile this driver as a module, choose M here.
> +
>  config DRM_PANEL_NEC_NL8048HL11
>  	tristate "NEC NL8048HL11 RGB panel"
>  	depends on GPIOLIB && OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index d99fbbce49d1..a90c30459964 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) +=3D panel=
-leadtek-ltk050h3146w.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) +=3D panel-leadtek-ltk500hd=
1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) +=3D panel-lg-lb035q02.o
>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) +=3D panel-lg-lg4573.o
> +obj-$(CONFIG_DRM_PANEL_MIPI_DBI) +=3D panel-mipi-dbi.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) +=3D panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) +=3D panel-novatek-nt35510.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) +=3D panel-novatek-nt35950.o
> diff --git a/drivers/gpu/drm/panel/panel-mipi-dbi.c b/drivers/gpu/drm/pan=
el/panel-mipi-dbi.c
> new file mode 100644
> index 000000000000..6e3dc2de21d2
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-mipi-dbi.c
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DRM driver for MIPI DBI compatible display panels
> + *
> + * Copyright 2022 Noralf Tr=F8nnes
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <video/mipi_display.h>
> +
> +static const u8 panel_mipi_dbi_magic[15] =3D { 'M', 'I', 'P', 'I', ' ', =
'D', 'B', 'I',
> +					     0, 0, 0, 0, 0, 0, 0 };
> +
> +/*
> + * The display panel configuration is stored in a firmware file. The Dev=
ice Tree 'compatible'
> + * property value with a '.bin' suffix is passed to request_firmware() t=
o fetch this file.
> + */
> +struct panel_mipi_dbi_config {
> +	/* Magic string: panel_mipi_dbi_magic */
> +	u8 magic[15];
> +
> +	/* Config file format version */
> +	u8 file_format_version;
> +
> +	/* Width in pixels */
> +	__be16 width;
> +	/* Height in pixels */
> +	__be16 height;
> +
> +	/* Width in millimeters (optional) */
> +	__be16 width_mm;
> +	/* Height in millimeters (optional) */
> +	__be16 height_mm;
> +
> +	/* X-axis panel offset */
> +	__be16 x_offset;
> +	/* Y-axis panel offset */
> +	__be16 y_offset;
> +
> +	/* 4 pad bytes, must be zero */
> +	u8 pad[4];
> +
> +	/*
> +	 * Optional MIPI commands to execute when the display pipeline is enabl=
ed.
> +	 * This can be used to configure the display controller.
> +	 *
> +	 * The commands are stored in a byte array with the format:
> +	 *     command, num_parameters, [ parameter, ...], command, ...
> +	 *
> +	 * Some commands require a pause before the next command can be receive=
d.
> +	 * Inserting a delay in the command sequence is done by using the NOP c=
ommand with one
> +	 * parameter: delay in miliseconds (the No Operation command is part of=
 the MIPI Display
> +	 * Command Set where it has no parameters).
> +	 *
> +	 * Example:
> +	 *     command 0x11
> +	 *     sleep 120ms
> +	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
> +	 *     command 0x29
> +	 *
> +	 * Byte sequence:
> +	 *     0x11 0x00
> +	 *     0x00 0x01 0x78
> +	 *     0xb1 0x03 0x01 0x2c 0x2d
> +	 *     0x29 0x00
> +	 */
> +	u8 commands[];
> +};

I'm not really a fan of parsing raw data in the kernel. I guess we can't
really avoid the introduction of a special case to sleep, but we already
have dt properties for all of the other properties (but X and Y offset,
maybe?)

Maybe we should use those instead?

Maxime

--y4vfjt4ve5verjss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfJuRAAKCRDj7w1vZxhR
xU4JAP4se1Nj1asC1xEI9UwVkKwngw3PAPAypFO6IaMJFicjpwD/Wma1pGesT7wQ
y9WFVq8jZ5eIb3qpTEBOIjz4Zvq4vwM=
=grVi
-----END PGP SIGNATURE-----

--y4vfjt4ve5verjss--
