Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B314E0CA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 19:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251C6E8DA;
	Thu, 30 Jan 2020 18:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1CE6E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 18:28:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 055F12005E;
 Thu, 30 Jan 2020 19:28:33 +0100 (CET)
Date: Thu, 30 Jan 2020 19:28:32 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: michael.srba@seznam.cz
Subject: Re: [PATCH v2 2/2] drm/panel: Add a driver for Samsung
 s6e88a0-ams452ef01 panel
Message-ID: <20200130182832.GB21265@ravnborg.org>
References: <20200130171128.29251-1-michael.srba@seznam.cz>
 <20200130171128.29251-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130171128.29251-2-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=8Ij8Eh1qDQUTCndBv-EA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Micahel.

Thanks for the quick feedback.

Please address checkpatch warnings.

be2b44c76320 (HEAD -> drm-misc-next) drm/panel: Add a driver for Samsung s6e88a0-ams452ef01 panel
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
new file mode 100644

-:69: WARNING:LONG_LINE: line over 80 characters
#69: FILE: drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c:25:
+static inline struct s6e88a0_ams452ef01 *to_s6e88a0_ams452ef01(struct drm_panel *panel)

-:74: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#74: FILE: drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c:30:
+#define dsi_dcs_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };				\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0)						\
+			return ret;					\
+	} while (0)

-:122: WARNING:LONG_LINE_COMMENT: line over 80 characters
#122: FILE: drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c:78:
+	dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a); // set default Amoled Off Ratio

-:183: WARNING:LONG_LINE: line over 80 characters
#183: FILE: drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c:139:
+		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);

-:226: WARNING:LONG_LINE: line over 80 characters
#226: FILE: drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c:182:
+static int s6e88a0_ams452ef01_get_modes(struct drm_panel *panel, struct drm_connector *connector)

total: 0 errors, 7 warnings, 0 checks, 308 lines checked



Use: dim checkpatch" if you have dim.
Otherwise use checkpatch -q --emacs --strict --show-types

Ignore the warning "MACRO_WITH_FLOW_CONTROL" - as this seems legit in this use-case.

	Sam

On Thu, Jan 30, 2020 at 06:11:28PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> Changes since v1: reorder includes; remove empty functions; fix after rebasing
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   6 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 289 ++++++++++++++++++
>  3 files changed, 296 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ae44ac2ec106..0c7d61f32b0e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -275,6 +275,12 @@ config DRM_PANEL_SAMSUNG_S6E63M0
>  	  Say Y here if you want to enable support for Samsung S6E63M0
>  	  AMOLED LCD panel.
>  
> +config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
> +	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
> +	depends on OF
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +
>  config DRM_PANEL_SAMSUNG_S6E8AA0
>  	tristate "Samsung S6E8AA0 DSI video mode panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7c4d3c581fd4..5b622fbe4014 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>  obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> new file mode 100644
> index 000000000000..49d3f6d0f137
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (C) 2019, Michael Srba
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct s6e88a0_ams452ef01 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data supplies[2];
> +	struct gpio_desc *reset_gpio;
> +
> +	bool prepared;
> +};
> +
> +static inline struct s6e88a0_ams452ef01 *to_s6e88a0_ams452ef01(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct s6e88a0_ams452ef01, panel);
> +}
> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
> +	dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	// set default brightness/gama
> +	dsi_dcs_write_seq(dsi, 0xca,
> +			  0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
> +			  0x80, 0x80, 0x80,			// V203 R,G,B
> +			  0x80, 0x80, 0x80,			// V151 R,G,B
> +			  0x80, 0x80, 0x80,			// V87  R,G,B
> +			  0x80, 0x80, 0x80,			// V51  R,G,B
> +			  0x80, 0x80, 0x80,			// V35  R,G,B
> +			  0x80, 0x80, 0x80,			// V23  R,G,B
> +			  0x80, 0x80, 0x80,			// V11  R,G,B
> +			  0x6b, 0x68, 0x71,			// V3   R,G,B
> +			  0x00, 0x00, 0x00);			// V1   R,G,B
> +	dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a); // set default Amoled Off Ratio
> +	dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
> +	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
> +	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6e88a0_ams452ef01_off(struct s6e88a0_ams452ef01 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(35);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	return 0;
> +}
> +
> +static int s6e88a0_ams452ef01_prepare(struct drm_panel *panel)
> +{
> +	struct s6e88a0_ams452ef01 *ctx = to_s6e88a0_ams452ef01(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	s6e88a0_ams452ef01_reset(ctx);
> +
> +	ret = s6e88a0_ams452ef01_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int s6e88a0_ams452ef01_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e88a0_ams452ef01 *ctx = to_s6e88a0_ams452ef01(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = s6e88a0_ams452ef01_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode s6e88a0_ams452ef01_mode = {
> +	.clock = (540 + 88 + 4 + 20) * (960 + 14 + 2 + 8) * 60 / 1000,
> +	.hdisplay = 540,
> +	.hsync_start = 540 + 88,
> +	.hsync_end = 540 + 88 + 4,
> +	.htotal = 540 + 88 + 4 + 20,
> +	.vdisplay = 960,
> +	.vsync_start = 960 + 14,
> +	.vsync_end = 960 + 14 + 2,
> +	.vtotal = 960 + 14 + 2 + 8,
> +	.vrefresh = 60,
> +	.width_mm = 56,
> +	.height_mm = 100,
> +};
> +
> +static int s6e88a0_ams452ef01_get_modes(struct drm_panel *panel, struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &s6e88a0_ams452ef01_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs s6e88a0_ams452ef01_panel_funcs = {
> +	.unprepare = s6e88a0_ams452ef01_unprepare,
> +	.prepare = s6e88a0_ams452ef01_prepare,
> +	.get_modes = s6e88a0_ams452ef01_get_modes,
> +};
> +
> +static int s6e88a0_ams452ef01_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6e88a0_ams452ef01 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vdd3";
> +	ctx->supplies[1].supply = "vci";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		ret = PTR_ERR(ctx->reset_gpio);
> +		dev_err(dev, "Failed to get reset-gpios: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 2;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +
> +	drm_panel_init(&ctx->panel, dev, &s6e88a0_ams452ef01_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_add(&ctx->panel);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to add panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6e88a0_ams452ef01_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e88a0_ams452ef01 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id s6e88a0_ams452ef01_of_match[] = {
> +	{ .compatible = "samsung,s6e88a0-ams452ef01" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, s6e88a0_ams452ef01_of_match);
> +
> +static struct mipi_dsi_driver s6e88a0_ams452ef01_driver = {
> +	.probe = s6e88a0_ams452ef01_probe,
> +	.remove = s6e88a0_ams452ef01_remove,
> +	.driver = {
> +		.name = "panel-s6e88a0-ams452ef01",
> +		.of_match_table = s6e88a0_ams452ef01_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e88a0_ams452ef01_driver);
> +
> +MODULE_AUTHOR("Michael Srba <Michael.Srba@seznam.cz>");
> +MODULE_DESCRIPTION("MIPI-DSI based Panel Driver for AMS452EF01 AMOLED LCD with a S6E88A0 controller");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.24.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
