Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6EE3DDBE7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FBD6E081;
	Mon,  2 Aug 2021 15:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243FD6E081
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 15:08:11 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 81F6621E52;
 Mon,  2 Aug 2021 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627916889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z37kMy9SoQOJeseAHmMfBsm5dk1UthnpLyE8hBtHVvM=;
 b=UXDPgS4tq2BaNvW7AtNLVqI6DgWpVLg6R62uC+F1KLnMrmVnEqj7E3ZRdI90oqryDCo9C2
 2LN1dU1FdKHjcS3xH4sc702PBwwhiBw4gLFzfLw9JAKg9ttXmQaBxg4I6+/vxLDE9gc8H2
 kJ3jqNbnncDSi9aFbRzDrmRlc61OWsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627916889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z37kMy9SoQOJeseAHmMfBsm5dk1UthnpLyE8hBtHVvM=;
 b=VvAe8XPEAu4hRMYihkWoj1TOpCY9eoWCF9luN64BREbhRv6qXfUmR5HsvB1la/zw4oErvu
 pO8r0bOrqWHT9gBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 481A813B3A;
 Mon,  2 Aug 2021 15:08:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 1iNYD1kKCGFbBgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Aug 2021 15:08:09 +0000
To: Icenowy Zheng <icenowy@sipeed.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-4-icenowy@sipeed.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] drm/tiny: add simple-dbi driver
Message-ID: <bfd59539-fc71-4994-ca33-f5fd3851243b@suse.de>
Date: Mon, 2 Aug 2021 17:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802063538.75583-4-icenowy@sipeed.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Lv5OspH6rqGbatVLEjfiXTa52V4EexmwP"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lv5OspH6rqGbatVLEjfiXTa52V4EexmwP
Content-Type: multipart/mixed; boundary="XiVied52HRMMNT1R15IYyiqkWtH7aDDl8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Icenowy Zheng <icenowy@sipeed.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <bfd59539-fc71-4994-ca33-f5fd3851243b@suse.de>
Subject: Re: [PATCH 3/4] drm/tiny: add simple-dbi driver
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-4-icenowy@sipeed.com>
In-Reply-To: <20210802063538.75583-4-icenowy@sipeed.com>

--XiVied52HRMMNT1R15IYyiqkWtH7aDDl8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.08.21 um 08:35 schrieb Icenowy Zheng:
> Add a driver for generic MIPI DBI panels initialized with MIPI DCS
> commands.
>=20
> Currently a ST7789V-based panel is added to it. This panel has its
> configuration pre-programmed into the controller, so no vendor-specific=

> configuration is needed.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>   drivers/gpu/drm/tiny/Kconfig      |  12 ++
>   drivers/gpu/drm/tiny/Makefile     |   1 +
>   drivers/gpu/drm/tiny/simple-dbi.c | 244 +++++++++++++++++++++++++++++=
+
>   3 files changed, 257 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/simple-dbi.c
>=20
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfi=
g
> index d31be274a2bd..6cfc57b68a46 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -144,6 +144,18 @@ config TINYDRM_REPAPER
>  =20
>   	  If M is selected the module will be called repaper.
>  =20
> +config TINYDRM_SIMPLE_DBI
> +	tristate "DRM support for generic MIPI DBI panels"
> +	depends on DRM && SPI
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DBI
> +	help
> +	  DRM driver for generic DBI panels that are MIPI DCS compatible
> +	  and needs no vendor-specific setup commands.
> +
> +	  If M is selected the module will be called simple-dbi.
> +
>   config TINYDRM_ST7586
>   	tristate "DRM support for Sitronix ST7586 display panels"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makef=
ile
> index e09942895c77..2553de651aa3 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)		+=3D mi0283qt.o
>   obj-$(CONFIG_TINYDRM_REPAPER)		+=3D repaper.o
>   obj-$(CONFIG_TINYDRM_ST7586)		+=3D st7586.o
>   obj-$(CONFIG_TINYDRM_ST7735R)		+=3D st7735r.o
> +obj-$(CONFIG_TINYDRM_SIMPLE_DBI)	+=3D simple-dbi.o
> diff --git a/drivers/gpu/drm/tiny/simple-dbi.c b/drivers/gpu/drm/tiny/s=
imple-dbi.c
> new file mode 100644
> index 000000000000..2b207e43d500
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/simple-dbi.c
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * DRM driver for display panels with configuration preset and needs o=
nly
> + * standard MIPI DCS commands to bring up.
> + *
> + * Copyright (C) 2021 Sipeed
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_mipi_dbi.h>
> +
> +#define MIPI_DCS_ADDRESS_MODE_BGR		BIT(3)
> +#define MIPI_DCS_ADDRESS_MODE_REVERSE		BIT(5)
> +#define MIPI_DCS_ADDRESS_MODE_RTL		BIT(6)
> +#define MIPI_DCS_ADDRESS_MODE_BTT		BIT(7)
> +
> +struct simple_dbi_cfg {
> +	const struct drm_display_mode mode;
> +	unsigned int left_offset;
> +	unsigned int top_offset;
> +	bool inverted;
> +	bool write_only;
> +	bool bgr;
> +	bool right_to_left;
> +	bool bottom_to_top;
> +};
> +
> +struct simple_dbi_priv {
> +	struct mipi_dbi_dev dbidev;	/* Must be first for .release() */

Which release?

> +	const struct simple_dbi_cfg *cfg;
> +};
> +
> +static void simple_dbi_pipe_enable(struct drm_simple_display_pipe *pip=
e,
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_plane_state *plane_state)
> +{
> +	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev);
> +	struct simple_dbi_priv *priv =3D container_of(dbidev,
> +						    struct simple_dbi_priv,
> +						    dbidev);
> +	struct mipi_dbi *dbi =3D &dbidev->dbi;
> +	int ret, idx;
> +	u8 addr_mode =3D 0x00;
> +
> +	if (!drm_dev_enter(pipe->crtc.dev, &idx))
> +		return;
> +
> +	DRM_DEBUG_KMS("\n");

I'm not a friend of such debugging statements. If you absolutely want to =

keep it, rather use drm_dbg_kms().

> +
> +	ret =3D mipi_dbi_poweron_reset(dbidev);
> +	if (ret)
> +		goto out_exit;
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(5);
> +
> +	/* Currently tinydrm supports 16bit only now */
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
> +			 MIPI_DCS_PIXEL_FMT_16BIT);
> +
> +	if (priv->cfg->inverted)
> +		mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
> +	else
> +		mipi_dbi_command(dbi, MIPI_DCS_EXIT_INVERT_MODE);
> +
> +	if (priv->cfg->bgr)
> +		addr_mode |=3D MIPI_DCS_ADDRESS_MODE_BGR;
> +
> +	if (priv->cfg->right_to_left)
> +		addr_mode |=3D MIPI_DCS_ADDRESS_MODE_RTL;
> +
> +	if (priv->cfg->bottom_to_top)
> +		addr_mode |=3D MIPI_DCS_ADDRESS_MODE_BTT;
> +
> +	switch (dbidev->rotation) {
> +	default:
> +		break;
> +	case 90:
> +		addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_REVERSE;
> +		addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_RTL;
> +		break;
> +	case 180:
> +		addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_RTL;
> +		addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_BTT;
> +		break;
> +	case 270:
> +		addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_REVERSE;
> +		addr_mode ^=3D MIPI_DCS_ADDRESS_MODE_BTT;
> +		break;
> +	}
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_ENTER_NORMAL_MODE);
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> +
> +	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> +out_exit:
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs simple_dbi_pipe_func=
s =3D {
> +	.enable		=3D simple_dbi_pipe_enable,
> +	.disable	=3D mipi_dbi_pipe_disable,
> +	.update		=3D mipi_dbi_pipe_update,
> +	.prepare_fb	=3D drm_gem_simple_display_pipe_prepare_fb,
> +};
> +
> +static const struct simple_dbi_cfg zsx154_b1206_cfg =3D {
> +	.mode		=3D { DRM_SIMPLE_MODE(240, 240, 28, 28) },
> +	.inverted	=3D true,
> +	.write_only	=3D true,
> +};
> +
> +DEFINE_DRM_GEM_CMA_FOPS(simple_dbi_fops);
> +
> +static const struct drm_driver simple_dbi_driver =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			=3D &simple_dbi_fops,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> +	.debugfs_init		=3D mipi_dbi_debugfs_init,
> +	.name			=3D "simple-dbi",
> +	.desc			=3D "Generic MIPI-DCS compatible DBI panel",
> +	.date			=3D "20210723",
> +	.major			=3D 1,
> +	.minor			=3D 0,
> +};
> +
> +static const struct of_device_id simple_dbi_of_match[] =3D {
> +	{ .compatible =3D "zsx,zsx154-b1206", .data =3D &zsx154_b1206_cfg },
> +	{ },
> +}
> +MODULE_DEVICE_TABLE(of, simple_dbi_of_match);
> +
> +static int simple_dbi_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	const struct simple_dbi_cfg *cfg;
> +	struct mipi_dbi_dev *dbidev;
> +	struct simple_dbi_priv *priv;
> +	struct drm_device *drm;
> +	struct mipi_dbi *dbi;
> +	struct gpio_desc *dc;
> +	u32 rotation =3D 0;
> +	int ret;
> +
> +	cfg =3D device_get_match_data(&spi->dev);
> +	if (!cfg)
> +		cfg =3D (void *)spi_get_device_id(spi)->driver_data;
> +
> +	priv =3D devm_drm_dev_alloc(dev, &simple_dbi_driver,
> +				  struct simple_dbi_priv, dbidev.drm);
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	dbidev =3D &priv->dbidev;
> +	priv->cfg =3D cfg;
> +
> +	dbi =3D &dbidev->dbi;
> +	drm =3D &dbidev->drm;
> +
> +	dbi->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(dbi->reset))
> +		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get reset =
GPIO\n");
> +
> +	dc =3D devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(dc))
> +		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get D/C GPIO\n");
> +
> +	dbidev->backlight =3D devm_of_find_backlight(dev);
> +	if (IS_ERR(dbidev->backlight))
> +		return PTR_ERR(dbidev->backlight);
> +
> +	device_property_read_u32(dev, "rotation", &rotation);
> +
> +	ret =3D mipi_dbi_spi_init(spi, dbi, dc);
> +	if (ret)
> +		return ret;
> +
> +	if (cfg->write_only)
> +		dbi->read_commands =3D NULL;
> +
> +	ret =3D mipi_dbi_dev_init(dbidev, &simple_dbi_pipe_funcs, &cfg->mode,=

> +				rotation);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, drm);

AFAIK dev files are being created during drm_dev_register(). It's=20
probably safer to set the drvdata before.

> +
> +	drm_fbdev_generic_setup(drm, 0);
> +
> +	return 0;
> +}
> +
> +static int simple_dbi_remove(struct spi_device *spi)
> +{
> +	struct drm_device *drm =3D spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);
> +
> +	return 0;
> +}
> +
> +static void simple_dbi_shutdown(struct spi_device *spi)
> +{
> +	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> +}
> +
> +static struct spi_driver simple_dbi_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "simple-dbi",
> +		.of_match_table =3D simple_dbi_of_match,
> +	},
> +	.probe =3D simple_dbi_probe,
> +	.remove =3D simple_dbi_remove,
> +	.shutdown =3D simple_dbi_shutdown,
> +};
> +module_spi_driver(simple_dbi_spi_driver);
> +
> +MODULE_DESCRIPTION("Simple DBI panel DRM driver");
> +MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
> +MODULE_LICENSE("GPL");
>=20

Trailing blank line. (?)

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--XiVied52HRMMNT1R15IYyiqkWtH7aDDl8--

--Lv5OspH6rqGbatVLEjfiXTa52V4EexmwP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEIClgFAwAAAAAACgkQlh/E3EQov+AM
aQ//SK7OM2HPMDLh+CaCrwoYHYf3OgZqPv9Vhdd9+RPnm/zIZctXbVs1r2b8AFx6E8tYI0z3zjZw
CTgVGG7shjUw0Uhs0sqlRXcnPAHJ6QgFeWsvOSOgtSrXBTP2SVnSMv7PXIKuQMcIDex2u97ZBfnv
mM4/osKju1/h4O8yvorB3JsHiX/wpB2Uh+H441It83uAYPRNZfze895Nk/kFV8WPkjYDJxqg8znF
YCNZJEQPUwMG+Nxy0UZO9XONyTCicFkSoGR2NhAGs4/EJK+/X++GC1L8VdO6fyCd5A2nt8islcZp
ELOLy8CJhTQVfLqpCYlg1/jA0eS4ZPWxJVVMXueV05Lg74nRA9brmQ08nJa6ojVabJeUDPeWi2Vm
vPoGJ9jZvKeUwBEFmSHYqqrbF2EKT6ViwnKqyDkMt1TaXhHG14XsGKkLJ1hFxJd1qT6u7P7MB37g
7AZBmHSsrVTPFcdZnJpCV4W83ZiZOmpjDDY7xcKckP7NVxOLIdBX8J6uK6BR8VKRgncR1kVI6hPC
XAYwZO6whiYdP+WufJ+QfC2LrkIgWhPWrWrkihgyuZPoKEYMZy8puqas4GJzeMg/NvdM5e2HMnPw
EPnao8pr3aka8u5WdvdJylNw/6k0jkE7odsgsJKhkIE0XYDY1YArXQ0ky7e3NV2JnvG4Le5dJtHQ
Q74=
=fcYh
-----END PGP SIGNATURE-----

--Lv5OspH6rqGbatVLEjfiXTa52V4EexmwP--
