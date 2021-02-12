Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F7319A21
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 08:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC236E524;
	Fri, 12 Feb 2021 07:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95B26E524
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 07:13:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F508AE05;
 Fri, 12 Feb 2021 07:13:53 +0000 (UTC)
To: Daniel Mack <daniel@zonque.org>, airlied@linux.ie, daniel@ffwll.ch
References: <20210211095058.473776-1-daniel@zonque.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/tiny: add driver for newhaven,1.8-128160EF
Message-ID: <00f588fe-3820-7754-4e24-5789795e21e4@suse.de>
Date: Fri, 12 Feb 2021 08:13:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211095058.473776-1-daniel@zonque.org>
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
Cc: robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1072564745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1072564745==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SJ2AYeW64y1qD572AZ2FfttAiNIdT8wGg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SJ2AYeW64y1qD572AZ2FfttAiNIdT8wGg
Content-Type: multipart/mixed; boundary="exorrfJe5DfvtIMH1SXC9V738uA4S4cUj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Mack <daniel@zonque.org>, airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <00f588fe-3820-7754-4e24-5789795e21e4@suse.de>
Subject: Re: [PATCH] drm/tiny: add driver for newhaven,1.8-128160EF
References: <20210211095058.473776-1-daniel@zonque.org>
In-Reply-To: <20210211095058.473776-1-daniel@zonque.org>

--exorrfJe5DfvtIMH1SXC9V738uA4S4cUj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

thanks for the driver. I only have some minor comments

Am 11.02.21 um 10:50 schrieb Daniel Mack:
> This patch adds support for Newhaven's NHD-1.8-128160EF display, featur=
ing
> an Ilitek ILI9163 controller.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>   .../bindings/display/ilitek,ili9163.txt       |  27 +++
>   drivers/gpu/drm/tiny/Kconfig                  |  13 +
>   drivers/gpu/drm/tiny/Makefile                 |   1 +
>   drivers/gpu/drm/tiny/ili9163.c                | 224 +++++++++++++++++=
+
>   4 files changed, 265 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/ilitek,i=
li9163.txt
>   create mode 100644 drivers/gpu/drm/tiny/ili9163.c
>=20
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9163.t=
xt b/Documentation/devicetree/bindings/display/ilitek,ili9163.txt
> new file mode 100644
> index 0000000000000..fee119991c14e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ilitek,ili9163.txt
> @@ -0,0 +1,27 @@
> +Ilitek ILI9163 display panels
> +
> +This binding is for display panels using an Ilitek ILI9163 controller =
in SPI
> +mode.
> +
> +Required properties:
> +- compatible:	"newhaven,1.8-128160EF", "ilitek,ili9163"
> +- dc-gpios:	D/C pin
> +- reset-gpios:	Reset pin
> +
> +The node for this driver must be a child node of a SPI controller, hen=
ce
> +all mandatory properties described in ../spi/spi-bus.txt must be speci=
fied.
> +
> +Optional properties:
> +- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)=

> +- backlight:	phandle of the backlight device attached to the panel
> +
> +Example:
> +	display@0{
> +		compatible =3D "newhaven,1.8-128160EF", "ilitek,ili9163"
> +		reg =3D <0>;
> +		spi-max-frequency =3D <32000000>;
> +		dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> +		rotation =3D <270>;
> +		backlight =3D <&backlight>;
> +	};
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfi=
g
> index 2b6414f0fa759..9de0c0eeea6f5 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -41,6 +41,19 @@ config TINYDRM_HX8357D
>  =20
>   	  If M is selected the module will be called hx8357d.
>  =20
> +config TINYDRM_ILI9163
> +	tristate "DRM support for ILI9163 display panels"
> +	depends on DRM && SPI
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DBI
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM driver for the following Ilitek ILI9163 panels:
> +	  * NHD-1.8-128160EF 128x160 TFT
> +
> +	  If M is selected the module will be called ili9163.
> +
>   config TINYDRM_ILI9225
>   	tristate "DRM support for ILI9225 display panels"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makef=
ile
> index 6ae4e9e5a35fb..78016b2ed11b5 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -3,6 +3,7 @@
>   obj-$(CONFIG_DRM_CIRRUS_QEMU)		+=3D cirrus.o
>   obj-$(CONFIG_DRM_GM12U320)		+=3D gm12u320.o
>   obj-$(CONFIG_TINYDRM_HX8357D)		+=3D hx8357d.o
> +obj-$(CONFIG_TINYDRM_ILI9163)		+=3D ili9163.o
>   obj-$(CONFIG_TINYDRM_ILI9225)		+=3D ili9225.o
>   obj-$(CONFIG_TINYDRM_ILI9341)		+=3D ili9341.o
>   obj-$(CONFIG_TINYDRM_ILI9486)		+=3D ili9486.o
> diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9=
163.c
> new file mode 100644
> index 0000000000000..9f90ea9556c4d
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ili9163.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <video/mipi_display.h>
> +
> +#define ILI9163_FRMCTR1		0xb1
> +
> +#define ILI9163_PWCTRL1		0xc0
> +#define ILI9163_PWCTRL2		0xc1
> +#define ILI9163_VMCTRL1		0xc5
> +#define ILI9163_VMCTRL2		0xc7
> +#define ILI9163_PWCTRLA		0xcb
> +#define ILI9163_PWCTRLB		0xcf
> +
> +#define ILI9163_EN3GAM		0xf2
> +
> +#define ILI9163_MADCTL_BGR	BIT(3)
> +#define ILI9163_MADCTL_MV	BIT(5)
> +#define ILI9163_MADCTL_MX	BIT(6)
> +#define ILI9163_MADCTL_MY	BIT(7)

The indention is inconsistent. Or maybe it's just my email client.

> +
> +static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
> +			     struct drm_crtc_state *crtc_state,
> +			     struct drm_plane_state *plane_state)
> +{
> +	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev);
> +	struct mipi_dbi *dbi =3D &dbidev->dbi;
> +	u8 addr_mode;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(pipe->crtc.dev, &idx))
> +		return;
> +
> +	DRM_DEBUG_KMS("\n");

We now use drm_debug_kms() and similar helpers.

> +
> +	ret =3D mipi_dbi_poweron_conditional_reset(dbidev);
> +	if (ret < 0)
> +		goto out_exit;
> +	if (ret =3D=3D 1)
> +		goto out_enable;
> +
> +	/* Gamma */
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, 0x04);
> +	mipi_dbi_command(dbi, ILI9163_EN3GAM, 0x00);
> +
> +	/* Frame Rate */
> +	mipi_dbi_command(dbi, ILI9163_FRMCTR1, 0x0a, 0x14);
> +
> +	/* Power Control */
> +	mipi_dbi_command(dbi, ILI9163_PWCTRL1, 0x0a, 0x00);
> +	mipi_dbi_command(dbi, ILI9163_PWCTRL2, 0x02);
> +
> +	/* VCOM */
> +	mipi_dbi_command(dbi, ILI9163_VMCTRL1, 0x2f, 0x3e);
> +	mipi_dbi_command(dbi, ILI9163_VMCTRL2, 0x40);
> +
> +	/* Memory Access Control */
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_1=
6BIT);
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(100);
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> +	msleep(100);
> +
> +out_enable:
> +	switch (dbidev->rotation) {
> +	default:
> +		addr_mode =3D 0;
> +		break;
> +	case 90:
> +		addr_mode =3D ILI9163_MADCTL_MV | ILI9163_MADCTL_MX;
> +		break;
> +	case 180:
> +		addr_mode =3D ILI9163_MADCTL_MX | ILI9163_MADCTL_MY;
> +		break;
> +	case 270:
> +		addr_mode =3D ILI9163_MADCTL_MV | ILI9163_MADCTL_MY;
> +		break;
> +	}
> +	addr_mode |=3D ILI9163_MADCTL_BGR;
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> +	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> +out_exit:
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs ili9163_pipe_funcs =3D=
 {
> +	.enable =3D yx240qv29_enable,
> +	.disable =3D mipi_dbi_pipe_disable,
> +	.update =3D mipi_dbi_pipe_update,
> +	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_display_mode yx240qv29_mode =3D {
> +	DRM_SIMPLE_MODE(128, 160, 28, 35),
> +};
> +
> +DEFINE_DRM_GEM_CMA_FOPS(ili9163_fops);
> +
> +static struct drm_driver ili9163_driver =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,

Maybe order them by alphabet.

> +	.fops			=3D &ili9163_fops,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> +	.debugfs_init		=3D mipi_dbi_debugfs_init,
> +	.name			=3D "ili9163",
> +	.desc			=3D "Ilitek ILI9163",
> +	.date			=3D "20210208",
> +	.major			=3D 1,
> +	.minor			=3D 0,
> +};
> +
> +static const struct of_device_id ili9163_of_match[] =3D {
> +	{ .compatible =3D "newhaven,1.8-128160EF" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9163_of_match);
> +
> +static const struct spi_device_id ili9163_id[] =3D {
> +	{ "nhd-1.8-128160EF", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, ili9163_id);
> +
> +static int ili9163_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct mipi_dbi_dev *dbidev;
> +	struct drm_device *drm;
> +	struct mipi_dbi *dbi;
> +	struct gpio_desc *dc;
> +	u32 rotation =3D 0;
> +	int ret;
> +
> +	dbidev =3D devm_drm_dev_alloc(dev, &ili9163_driver,
> +				    struct mipi_dbi_dev, drm);
> +	if (IS_ERR(dbidev))
> +		return PTR_ERR(dbidev);
> +
> +	dbi =3D &dbidev->dbi;
> +	drm =3D &dbidev->drm;
> +
> +	dbi->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);=

> +	if (IS_ERR(dbi->reset)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> +		return PTR_ERR(dbi->reset);
> +	}
> +
> +	dc =3D devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(dc)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");

AFAIK drm_err() here and in similar places.

> +		return PTR_ERR(dc);
> +	}
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
> +	ret =3D mipi_dbi_dev_init(dbidev, &ili9163_pipe_funcs, &yx240qv29_mod=
e, rotation);
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

I don't know if anything might need drvdata (probably not). But it might =

be safer to set it after the allocation happend.

> +
> +	drm_fbdev_generic_setup(drm, 0);
> +
> +	return 0;
> +}
> +
> +static int ili9163_remove(struct spi_device *spi)
> +{
> +	struct drm_device *drm =3D spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);
> +
> +	return 0;
> +}
> +
> +static void ili9163_shutdown(struct spi_device *spi)
> +{
> +	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> +}
> +
> +static struct spi_driver ili9163_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "ili9163",
> +		.of_match_table =3D ili9163_of_match,
> +	},
> +	.id_table =3D ili9163_id,
> +	.probe =3D ili9163_probe,
> +	.remove =3D ili9163_remove,
> +	.shutdown =3D ili9163_shutdown,
> +};
> +module_spi_driver(ili9163_spi_driver);
> +
> +MODULE_DESCRIPTION("Ilitek ILI9163 DRM driver");
> +MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
> +MODULE_LICENSE("GPL");
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--exorrfJe5DfvtIMH1SXC9V738uA4S4cUj--

--SJ2AYeW64y1qD572AZ2FfttAiNIdT8wGg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAmKrAFAwAAAAAACgkQlh/E3EQov+CR
WQ/+IwYHyalZnGZz4jgxmxvJIBl/DFSD2V15s1uuC+qeuvXeYGjGSK1pA13q8vCDY/zUFPCy47DE
bQ+AEIclWSlQ3aL7EmPJnmizQKHj5XhsIajLo1FEQruNuPvdlBSNOZw937wAag7eNhxvwAodA9VL
wQXSqfylDtap9QXP4Dx4X2o1XRjquw7K7Alwgekvl83GLJmFLfcTU2nkU3z7A2FdOuzKZfL2KXG7
/N4NIOx9WpEOY48COjJJM+2LOX0EjeILHgW1vyLI6eJn0KYJvpQsmr3ahFN+X8NG6ATH9/5zJM/V
oYW++QKJgDhTdZ7ki2hqx9d/JexNB9yqq6X1p6kVMlS+/EsF3iJV1nzdHP9EgID32Lqx9QVd/29G
KGy0RA7W0g/OTAyWCu7IGPcaugS8VkxkuYcTQ+VbQ1tjvfTovwiuxLQfs171G7pLTzadqc0FsTIt
TpLgjM52TxP2bbeZFjpeW90Mg4dKRdLgiEUiLKFNG8xSuoEPmPtTGAIxW34NK8V0Y58pUbnAuLhF
TzdTN7iSLvaapYjvxshS8tV8hjS35vFadwhPKqeHiVbR3MCaYxpQgfqc9QF8C41nB7GTjYF7jfm+
TQP8e9JeNhBbdLiNiWGvZNZxiHGg25sIq6cMF8hSKcUmLDQAgeCUqp/We9TiQcU6TDFXMmcGUAym
y2c=
=IYaw
-----END PGP SIGNATURE-----

--SJ2AYeW64y1qD572AZ2FfttAiNIdT8wGg--

--===============1072564745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1072564745==--
