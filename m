Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAC89AF635
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071910E09C;
	Fri, 25 Oct 2024 00:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xBh/EuDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133DE10E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:35:48 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso14615501fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729816546; x=1730421346; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UpqDoU7811iUgoRoXhqnS/FMmBXm4qqrwAm3QTrrYxY=;
 b=xBh/EuDCaWtCv7As/TONQ0CqsMcQQLSBgkRW8Q1/4EmisN/EJmbOsBQHHkWXqi3NzR
 rrS+W55zbW+EvKYB9Zj4wJq8sQ+SESW2DLn4OMBudZ24qzCFpyIKVtKODIUyxjMtl+N4
 +X9ywzy/yUBDHRY1//yvpRU2WjZ/b6LAmTY5QZEQS1Qwk0kclnOAMu+EQf69CG+KaOG5
 aP4o7o3pFfY17dqOPMT1ab0jvvpRs01JrXWcUjYMnlwY25POM9VrR7oqskEpSi3ENTiq
 FpRYMwnuRXVg/PSpmBEkW6npBWctqE6KaZir9X0Ir4sQAJs2qzuqtL/RAxhcXopkuxq8
 aqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729816546; x=1730421346;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UpqDoU7811iUgoRoXhqnS/FMmBXm4qqrwAm3QTrrYxY=;
 b=So9KqAYh+PHo52BoY0deaxiOc7wEjZ0RzaT4O0c30+/GWbjrq5hsQXPE+OprHw2GVd
 Abm5lsM3t+KNNOcYcTov8SB8/Mph9Zh1CFfwxUarJR/+lr+Z2D/+yYMsnNGliEyhqWPp
 sWBVVF9XMnBlQIyakk9kDilP0ne75uNg+HcNKgxPgzxBhg6ZnYA4mY9rKaFBFwZB/Hg0
 S5ExZCEtQNXnL98vWP10oETsfRVisg4FDjHAVjTZu3b2UcKOV+v2PqzXpbMRQ8oGIAri
 It7dKfBawFWU2uM7tibxUBFXwYaNR8ziYXf3DpHPMZ3/LI3nyw4f04WVbBGdRwj8+V7X
 MboQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIRpTckRg39wyi94kiQRnGC1B0DlZFPN3oZatj0a8uUSItm6XvqHbWwXP/hs1ju/BsCrjnmnWbsY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJobLtX2sGevtTYw6XW/4puKGc0sRE0Njg0UkBfDc6o+k2wprG
 0mECi+ZEla249LZhvhKk5XXimhhSXG/ZpTS083FcPFcLwWF3P/PmlpElrXsaBy8=
X-Google-Smtp-Source: AGHT+IG4Oj198+tNSJkS3w/UzT2lvFEiteihlhghLdFhTKRyEqjEzVZjiiYbshwmVTRXg8tZFYTIQQ==
X-Received: by 2002:a05:6512:3c98:b0:539:ee04:2321 with SMTP id
 2adb3069b0e04-53b1a34901amr4206748e87.33.1729816545868; 
 Thu, 24 Oct 2024 17:35:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10c09esm10540e87.61.2024.10.24.17.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:35:44 -0700 (PDT)
Date: Fri, 25 Oct 2024 03:35:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
Message-ID: <mun27dlfzkciqp7lurjmbkwuuwoarxbmfg6gngopu6unsnv3dy@r3ewj3svi43x>
References: <20241023124411.1153552-1-r.czerwinski@pengutronix.de>
 <20241023124411.1153552-3-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023124411.1153552-3-r.czerwinski@pengutronix.de>
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

On Wed, Oct 23, 2024 at 02:44:10PM +0200, Rouven Czerwinski wrote:
> The LXD M9189A panel is based on the EK79007AD3 DSI display controller.
> It currently supports only 4 lane operation.
> 
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
>  MAINTAINERS                              |   6 +
>  drivers/gpu/drm/panel/Kconfig            |   9 +
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lxd-m9189a.c | 261 +++++++++++++++++++++++
>  4 files changed, 277 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-lxd-m9189a.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb33..e4d749b403c28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7179,6 +7179,12 @@ F:	Documentation/devicetree/bindings/display/lvds.yaml
>  F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>  F:	drivers/gpu/drm/panel/panel-lvds.c
>  
> +DRM DRIVER FOR LXD M9189A PANELS
> +M:	Rouven Czerwinski <r.czerwinski@pengutronix.de>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> +F:	drivers/gpu/drm/panel/panel-lxd-m9189a.c
> +
>  DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
>  M:	Guido Günther <agx@sigxcpu.org>
>  R:	Purism Kernel Team <kernel@puri.sm>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d3a9a9fafe4ec..7667ac1ef80e3 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -135,6 +135,15 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
>  	  Say Y if you want to enable support for panels based on the
>  	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
>  
> +config DRM_PANEL_LXD_M9189A
> +	tristate "LXD M9189A MIPI-DSI LCD panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for the LXD M9189A 4-Lane
> +	  1024x600 MIPI DSI panel.
> +
>  config DRM_PANEL_DSI_CM
>  	tristate "Generic DSI command mode panels"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 987a087024103..6d77c304e7529 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
>  obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>  obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
>  obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
> +obj-$(CONFIG_DRM_PANEL_LXD_M9189A) += panel-lxd-m9189a.o
>  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
>  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
>  obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
> diff --git a/drivers/gpu/drm/panel/panel-lxd-m9189a.c b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
> new file mode 100644
> index 0000000000000..71c5a18541bae
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2024 Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +/* Manufacturer specific DSI commands */
> +#define EK79007AD3_GAMMA1		0x80
> +#define EK79007AD3_GAMMA2		0x81
> +#define EK79007AD3_GAMMA3		0x82
> +#define EK79007AD3_GAMMA4		0x83
> +#define EK79007AD3_GAMMA5		0x84
> +#define EK79007AD3_GAMMA6		0x85
> +#define EK79007AD3_GAMMA7		0x86
> +#define EK79007AD3_PANEL_CTRL3		0xB2
> +
> +struct ek79007ad3_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *standby_gpio;
> +};
> +
> +static inline struct ek79007ad3_panel *to_ek79007ad3_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ek79007ad3_panel, panel);
> +}
> +
> +static void ek79007ad3_reset(struct ek79007ad3_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(20);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	msleep(30);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(55);
> +}
> +
> +static int ek79007ad3_on(struct ek79007ad3_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	/* Gamma 2.2 */
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA1, 0x48);
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA2, 0xB8);
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA3, 0x88);
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA4, 0x88);
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA5, 0x58);
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA6, 0xD2);
> +	mipi_dsi_dcs_write_seq(dsi, EK79007AD3_GAMMA7, 0x88);

mipi_dsi_dcs_write_seq_multi

> +	msleep(50);

mipi_dsi_msleep(), here and further below

> +
> +	/* 4 Lanes */
> +	ret = mipi_dsi_generic_write(dsi, (u8[]){ EK79007AD3_PANEL_CTRL3, 0x70 }, 2);

mipi_dsi_generic_write_multi

> +	if (ret)
> +		goto fail;
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);

_multi

> +	msleep(120);
> +
> +fail:
> +	return ret;
> +}
> +
> +static int ek79007ad3_disable(struct drm_panel *panel)
> +{
> +	struct ek79007ad3_panel *ctx = to_ek79007ad3_panel(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	gpiod_set_value_cansleep(ctx->standby_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static int ek79007ad3_prepare(struct drm_panel *panel)
> +{
> +	struct ek79007ad3_panel *ctx = to_ek79007ad3_panel(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_enable(ctx->supply);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ctx->standby_gpio, 0);
> +	msleep(20);
> +
> +	mipi_dsi_dcs_nop(dsi);

PLease move these calls to _on() and use mipi_dsi_dcs_nop_multi() and
mipi_dsi_usleep_range().

> +	usleep_range(1000, 2000);
> +
> +	ek79007ad3_reset(ctx);
> +
> +	ret = ek79007ad3_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_disable(ctx->supply);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ek79007ad3_unprepare(struct drm_panel *panel)
> +{
> +	struct ek79007ad3_panel *ctx = to_ek79007ad3_panel(panel);
> +
> +	gpiod_set_value_cansleep(ctx->standby_gpio, 1);
> +	msleep(50);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_disable(ctx->supply);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode ek79007ad3_mode = {
> +	.clock = 51200,

.clock = (1024 + 160 + 160 + 10) * (600 + 23 + 12 + 1) * N / 1000;

> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 160,
> +	.hsync_end = 1024 + 160 + 160,
> +	.htotal = 1024 + 160 + 160 + 10,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 12,
> +	.vsync_end = 600 + 12 + 23,
> +	.vtotal = 600 + 23 + 12 + 1,
> +	.width_mm = 154,
> +	.height_mm = 86,
> +};
> +
> +static int ek79007ad3_get_modes(struct drm_panel *panel,
> +				  struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &ek79007ad3_mode);
> +}
> +
> +static const struct drm_panel_funcs ek79007ad3_panel_funcs = {
> +	.prepare = ek79007ad3_prepare,
> +	.unprepare = ek79007ad3_unprepare,
> +	.disable = ek79007ad3_disable,
> +	.get_modes = ek79007ad3_get_modes,
> +};
> +
> +static int ek79007ad3_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct ek79007ad3_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(ctx->supply))
> +		return dev_err_probe(dev, ret, "Failed to get regulator\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->standby_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->standby_gpio),
> +				     "Failed to get standby-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +
> +	drm_panel_init(&ctx->panel, dev, &ek79007ad3_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ek79007ad3_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ek79007ad3_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id ek79007ad3_of_match[] = {
> +	{ .compatible = "lxd,m9189a" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ek79007ad3_of_match);
> +
> +static struct mipi_dsi_driver ek79007ad3_driver = {
> +	.probe = ek79007ad3_probe,
> +	.remove = ek79007ad3_remove,
> +	.driver = {
> +		.name = "panel-fitipower-ek79007ad3",
> +		.of_match_table = ek79007ad3_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ek79007ad3_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for ek79007ad3-equipped DSI panels");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
