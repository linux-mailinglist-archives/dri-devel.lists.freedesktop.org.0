Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD812450CC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 11:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B56E095;
	Sat, 15 Aug 2020 09:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125A6E095
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 09:32:32 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3000580537;
 Sat, 15 Aug 2020 11:32:28 +0200 (CEST)
Date: Sat, 15 Aug 2020 11:32:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 3/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200815093226.GB993113@ravnborg.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
 <0a7539135cc46eec5636ca89f52695f4a1197841.1597412076.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a7539135cc46eec5636ca89f52695f4a1197841.1597412076.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=e5mUnYsNAAAA:8
 a=3KzlNI64WeVczAfcRB8A:9 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

On Fri, Aug 14, 2020 at 03:36:23PM +0200, Guido G=FCnther wrote:
> The panel uses a Focaltech FT8006p, the touch part is handled by the
> already existing edt-ft5x06.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

Looks good.
A few notes in the following, nothing major.

	Sam

> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 362 ++++++++++++++++++
>  4 files changed, 381 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83ba7b62651f7..7dfe4cc3d4ec8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5474,6 +5474,13 @@ S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-lvds.c
>  F:	Documentation/devicetree/bindings/display/panel/lvds.yaml
>  =

> +DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
> +M:	Guido G=FCnther <agx@sigxcpu.org>
> +R:	Purism Kernel Team <kernel@puri.sm>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.=
yaml
> +F:	drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +
>  DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
>  S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/mga/
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index de2f2a452be55..8d97d07c58713 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -217,6 +217,17 @@ config DRM_PANEL_NOVATEK_NT39016
>  	  Say Y here if you want to enable support for the panels built
>  	  around the Novatek NT39016 display controller.
>  =

> +config DRM_PANEL_MANTIX_MLAF057WE51
> +	tristate "Mantix MLAF057WE51-X MIPI-DSI LCD panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Mantix
> +	  MLAF057WE51-X MIPI DSI panel as e.g. used in the Librem 5. It
> +	  has a resolution of 720x1440 pixels, a built in backlight and touch
> +	  controller.
> +
>  config DRM_PANEL_OLIMEX_LCD_OLINUXINO
>  	tristate "Olimex LCD-OLinuXino panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index e45ceac6286fd..15a4e77529514 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LG4573) +=3D panel-lg-lg4573.o
>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) +=3D panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) +=3D panel-novatek-nt35510.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) +=3D panel-novatek-nt39016.o
> +obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) +=3D panel-mantix-mlaf057we51=
.o
>  obj-$(CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO) +=3D panel-olimex-lcd-olinu=
xino.o
>  obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) +=3D panel-orisetech-otm8009a=
.o
>  obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) +=3D panel-osd-osd101t2587-=
53ts.o
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/g=
pu/drm/panel/panel-mantix-mlaf057we51.c
> new file mode 100644
> index 0000000000000..6c07bcdb75937
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mantix MLAF057WE51 5.7" MIPI-DSI panel driver
> + *
> + * Copyright (C) Purism SPC 2020
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
Include not needed.

> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/display_timing.h>
I do not think this include is needed

> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#define DRV_NAME "panel-mantix-mlaf057we51"
> +
> +/* Manufacturer specific Commands send via DSI */
> +#define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
> +#define MANTIX_CMD_INT_CANCEL           0x4C
> +
> +struct mantix {
> +	struct device *dev;
> +	struct drm_panel panel;
> +	struct gpio_desc *reset_gpio;
> +
> +	struct regulator *avdd;
> +	struct regulator *avee;
> +	struct regulator *vddi;
> +};
> +
> +static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct mantix, panel);
> +}
> +
> +#define dsi_generic_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] =3D { seq };				\
> +		int ret;						\
> +		ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +static int mantix_init_sequence(struct mantix *ctx)
> +{
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +	struct device *dev =3D ctx->dev;
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor.
> +	 */
> +	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> +
> +	dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
> +	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> +	dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
> +
> +	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> +	dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> +	msleep(20);
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
> +	return 0;
> +}
> +
> +static int mantix_enable(struct drm_panel *panel)
> +{
> +	struct mantix *ctx =3D panel_to_mantix(panel);
> +	struct device *dev =3D ctx->dev;
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(dev);
> +	int ret;
> +
> +	ret =3D mantix_init_sequence(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "Failed to exit sleep mode\n");
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +
> +	ret =3D mipi_dsi_turn_on_peripheral(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "Failed to turn on peripheral\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mantix_disable(struct drm_panel *panel)
> +{
> +	struct mantix *ctx =3D panel_to_mantix(panel);
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	ret =3D mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to turn off the display: %d\n", ret);
> +
> +	ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enter sleep mode: %d\n", ret);
> +
> +	mipi_dsi_dcs_enter_sleep_mode(dsi);
Does the display really need to enter sleep mode twice?

> +	return 0;
> +}
> +
> +static int mantix_unprepare(struct drm_panel *panel)
> +{
> +	struct mantix *ctx =3D panel_to_mantix(panel);
> +
> +	regulator_disable(ctx->avdd);
> +	regulator_disable(ctx->avee);
> +	regulator_disable(ctx->vddi);

The order the regulators are disabled is not the reverse of the order
thay are enabled. Unless this is on purpose it would be more logical and
less confusing if unprepare is the reverse of prepare.


> +
> +	return 0;
> +}
> +
> +static int mantix_prepare(struct drm_panel *panel)
> +{
> +	struct mantix *ctx =3D panel_to_mantix(panel);
> +	int ret;
> +
> +	/* Focaltech FT8006P, section 7.3.1 and 7.3.4 */
> +	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
> +	ret =3D regulator_enable(ctx->vddi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enable vddi supply: %d\n", ret);
> +		return ret;
> +	}
> +	/* T1 + T2 */
> +	usleep_range(8000, 10000);
> +
> +	ret =3D regulator_enable(ctx->avdd);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enable avdd supply: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* T2d */
> +	usleep_range(3500, 4000);
> +	ret =3D regulator_enable(ctx->avee);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enable avee supply: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* T3+T5 */
> +	usleep_range(10000, 12000);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5150, 7000);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +	/* T6 */
> +	msleep(50);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode default_mode =3D {
> +	.hdisplay    =3D 720,
> +	.hsync_start =3D 720 + 45,
> +	.hsync_end   =3D 720 + 45 + 14,
> +	.htotal	     =3D 720 + 45 + 14 + 25,
> +	.vdisplay    =3D 1440,
> +	.vsync_start =3D 1440 + 130,
> +	.vsync_end   =3D 1440 + 130 + 8,
> +	.vtotal	     =3D 1440 + 130 + 8 + 106,
> +	.clock	     =3D 85298,
> +	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm    =3D 65,
> +	.height_mm   =3D 130,
> +};
> +
> +static int mantix_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct mantix *ctx =3D panel_to_mantix(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode =3D drm_mode_duplicate(connector->dev, &default_mode);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
> +			      default_mode.hdisplay, default_mode.vdisplay,
> +			      drm_mode_vrefresh(mode));
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm =3D mode->width_mm;
> +	connector->display_info.height_mm =3D mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs mantix_drm_funcs =3D {
> +	.disable   =3D mantix_disable,
> +	.unprepare =3D mantix_unprepare,
> +	.prepare   =3D mantix_prepare,
> +	.enable	   =3D mantix_enable,
> +	.get_modes =3D mantix_get_modes,
> +};
> +
> +static int mantix_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct mantix *ctx;
> +	int ret;
> +
> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dev =3D dev;
> +
> +	dsi->lanes =3D 4;
> +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	ctx->avdd =3D devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(ctx->avdd)) {
> +		ret =3D PTR_ERR(ctx->avdd);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request avdd regulator: %d\n",
> +				      ret);
In these modern times linelegth of 100 is acceptable, so avoid
linewrapping here and likewise below.

> +		return ret;
> +	}
> +	ctx->avee =3D devm_regulator_get(dev, "avee");
> +	if (IS_ERR(ctx->avee)) {
> +		ret =3D PTR_ERR(ctx->avee);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request avee regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +	ctx->vddi =3D devm_regulator_get(dev, "vddi");
> +	if (IS_ERR(ctx->vddi)) {
> +		ret =3D PTR_ERR(ctx->vddi);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request vddi regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &mantix_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
empty line?
> +	drm_panel_add(&ctx->panel);
> +
> +	ret =3D mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev,
> +			      "mipi_dsi_attach failed (%d). Is host ready?\n",
> +			      ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> +		     default_mode.hdisplay, default_mode.vdisplay,
> +		     drm_mode_vrefresh(&default_mode),
> +		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
> +
> +	return 0;
> +}
> +
> +static void mantix_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct mantix *ctx =3D mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret =3D drm_panel_unprepare(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to unprepare panel: %d\n",
> +			      ret);
> +
> +	ret =3D drm_panel_disable(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to disable panel: %d\n",
> +			      ret);
> +}
In shutdown we usually ignore any errors.

> +
> +static int mantix_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct mantix *ctx =3D mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	mantix_shutdown(dsi);
> +
> +	ret =3D mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to detach from DSI host: %d\n",
> +			      ret);
Likewise in remove we ignore any errors.

> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mantix_of_match[] =3D {
> +	{ .compatible =3D "mantix,mlaf057we51-x" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mantix_of_match);
> +
> +static struct mipi_dsi_driver mantix_driver =3D {
> +	.probe	=3D mantix_probe,
> +	.remove =3D mantix_remove,
> +	.shutdown =3D mantix_shutdown,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.of_match_table =3D mantix_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(mantix_driver);
> +
> +MODULE_AUTHOR("Guido G=FCnther <agx@sigxcpu.org>");
> +MODULE_DESCRIPTION("DRM driver for Mantix MLAF057WE51-X MIPI DSI panel");
> +MODULE_LICENSE("GPL v2");
> -- =

> 2.26.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
