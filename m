Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F63210FF7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110B06E946;
	Wed,  1 Jul 2020 16:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457D36E94C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id DF87AFB03;
 Wed,  1 Jul 2020 18:01:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QreS0lBW60hx; Wed,  1 Jul 2020 18:01:03 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 64FD340972; Wed,  1 Jul 2020 18:01:03 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:01:03 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 05/13] drm/panel: st7703: Rename functions from jh057n
 prefix to st7703
Message-ID: <20200701160103.GD174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-6-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-6-megous@megous.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Wed, Jul 01, 2020 at 12:31:18PM +0200, Ondrej Jirman wrote:
> This is done so that code that's not specific to a particular
> jh057n panel is named after the controller. Functions specific
> to the panel are kept named after the panel.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 90 ++++++++++---------
>  1 file changed, 46 insertions(+), 44 deletions(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index 38ff742bc120..511af659f273 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Rockteck jh057n00900 5.5" MIPI-DSI panel driver
> + * Driver for panels based on Sitronix ST7703 controller, souch as:
> + *
> + * - Rocktech jh057n00900 5.5" MIPI-DSI panel
>   *
>   * Copyright (C) Purism SPC 2019
>   */
> @@ -21,7 +23,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  =

> -#define DRV_NAME "panel-rocktech-jh057n00900"
> +#define DRV_NAME "panel-sitronix-st7703"
>  =

>  /* Manufacturer specific Commands send via DSI */
>  #define ST7703_CMD_ALL_PIXEL_OFF 0x22
> @@ -45,7 +47,7 @@
>  #define ST7703_CMD_SETGIP1	 0xE9
>  #define ST7703_CMD_SETGIP2	 0xEA
>  =

> -struct jh057n {
> +struct st7703 {
>  	struct device *dev;
>  	struct drm_panel panel;
>  	struct gpio_desc *reset_gpio;
> @@ -56,9 +58,9 @@ struct jh057n {
>  	struct dentry *debugfs;
>  };
>  =

> -static inline struct jh057n *panel_to_jh057n(struct drm_panel *panel)
> +static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
>  {
> -	return container_of(panel, struct jh057n, panel);
> +	return container_of(panel, struct st7703, panel);
>  }
>  =

>  #define dsi_generic_write_seq(dsi, seq...) do {				\
> @@ -69,7 +71,7 @@ static inline struct jh057n *panel_to_jh057n(struct drm=
_panel *panel)
>  			return ret;					\
>  	} while (0)
>  =

> -static int jh057n_init_sequence(struct jh057n *ctx)
> +static int jh057n_init_sequence(struct st7703 *ctx)
>  {
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
>  	struct device *dev =3D ctx->dev;
> @@ -141,9 +143,9 @@ static int jh057n_init_sequence(struct jh057n *ctx)
>  	return 0;
>  }
>  =

> -static int jh057n_enable(struct drm_panel *panel)
> +static int st7703_enable(struct drm_panel *panel)
>  {
> -	struct jh057n *ctx =3D panel_to_jh057n(panel);
> +	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	int ret;
>  =

>  	ret =3D jh057n_init_sequence(ctx);
> @@ -156,17 +158,17 @@ static int jh057n_enable(struct drm_panel *panel)
>  	return 0;
>  }
>  =

> -static int jh057n_disable(struct drm_panel *panel)
> +static int st7703_disable(struct drm_panel *panel)
>  {
> -	struct jh057n *ctx =3D panel_to_jh057n(panel);
> +	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
>  =

>  	return mipi_dsi_dcs_set_display_off(dsi);
>  }
>  =

> -static int jh057n_unprepare(struct drm_panel *panel)
> +static int st7703_unprepare(struct drm_panel *panel)
>  {
> -	struct jh057n *ctx =3D panel_to_jh057n(panel);
> +	struct st7703 *ctx =3D panel_to_st7703(panel);
>  =

>  	if (!ctx->prepared)
>  		return 0;
> @@ -178,9 +180,9 @@ static int jh057n_unprepare(struct drm_panel *panel)
>  	return 0;
>  }
>  =

> -static int jh057n_prepare(struct drm_panel *panel)
> +static int st7703_prepare(struct drm_panel *panel)
>  {
> -	struct jh057n *ctx =3D panel_to_jh057n(panel);
> +	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	int ret;
>  =

>  	if (ctx->prepared)
> @@ -230,10 +232,10 @@ static const struct drm_display_mode default_mode =
=3D {
>  	.height_mm   =3D 130,
>  };
>  =

> -static int jh057n_get_modes(struct drm_panel *panel,
> +static int st7703_get_modes(struct drm_panel *panel,
>  			    struct drm_connector *connector)
>  {
> -	struct jh057n *ctx =3D panel_to_jh057n(panel);
> +	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	struct drm_display_mode *mode;
>  =

>  	mode =3D drm_mode_duplicate(connector->dev, &default_mode);
> @@ -254,17 +256,17 @@ static int jh057n_get_modes(struct drm_panel *panel,
>  	return 1;
>  }
>  =

> -static const struct drm_panel_funcs jh057n_drm_funcs =3D {
> -	.disable   =3D jh057n_disable,
> -	.unprepare =3D jh057n_unprepare,
> -	.prepare   =3D jh057n_prepare,
> -	.enable	   =3D jh057n_enable,
> -	.get_modes =3D jh057n_get_modes,
> +static const struct drm_panel_funcs st7703_drm_funcs =3D {
> +	.disable   =3D st7703_disable,
> +	.unprepare =3D st7703_unprepare,
> +	.prepare   =3D st7703_prepare,
> +	.enable	   =3D st7703_enable,
> +	.get_modes =3D st7703_get_modes,
>  };
>  =

>  static int allpixelson_set(void *data, u64 val)
>  {
> -	struct jh057n *ctx =3D data;
> +	struct st7703 *ctx =3D data;
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
>  =

>  	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Setting all pixels on\n");
> @@ -282,7 +284,7 @@ static int allpixelson_set(void *data, u64 val)
>  DEFINE_SIMPLE_ATTRIBUTE(allpixelson_fops, NULL,
>  			allpixelson_set, "%llu\n");
>  =

> -static void jh057n_debugfs_init(struct jh057n *ctx)
> +static void st7703_debugfs_init(struct st7703 *ctx)
>  {
>  	ctx->debugfs =3D debugfs_create_dir(DRV_NAME, NULL);
>  =

> @@ -290,16 +292,16 @@ static void jh057n_debugfs_init(struct jh057n *ctx)
>  			    &allpixelson_fops);
>  }
>  =

> -static void jh057n_debugfs_remove(struct jh057n *ctx)
> +static void st7703_debugfs_remove(struct st7703 *ctx)
>  {
>  	debugfs_remove_recursive(ctx->debugfs);
>  	ctx->debugfs =3D NULL;
>  }
>  =

> -static int jh057n_probe(struct mipi_dsi_device *dsi)
> +static int st7703_probe(struct mipi_dsi_device *dsi)
>  {
>  	struct device *dev =3D &dsi->dev;
> -	struct jh057n *ctx;
> +	struct st7703 *ctx;
>  	int ret;
>  =

>  	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> @@ -340,7 +342,7 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
>  =

> -	drm_panel_init(&ctx->panel, dev, &jh057n_drm_funcs,
> +	drm_panel_init(&ctx->panel, dev, &st7703_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  =

>  	ret =3D drm_panel_of_backlight(&ctx->panel);
> @@ -363,13 +365,13 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
>  		     default_mode.vrefresh,
>  		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
>  =

> -	jh057n_debugfs_init(ctx);
> +	st7703_debugfs_init(ctx);
>  	return 0;
>  }
>  =

> -static void jh057n_shutdown(struct mipi_dsi_device *dsi)
> +static void st7703_shutdown(struct mipi_dsi_device *dsi)
>  {
> -	struct jh057n *ctx =3D mipi_dsi_get_drvdata(dsi);
> +	struct st7703 *ctx =3D mipi_dsi_get_drvdata(dsi);
>  	int ret;
>  =

>  	ret =3D drm_panel_unprepare(&ctx->panel);
> @@ -383,12 +385,12 @@ static void jh057n_shutdown(struct mipi_dsi_device =
*dsi)
>  			      ret);
>  }
>  =

> -static int jh057n_remove(struct mipi_dsi_device *dsi)
> +static int st7703_remove(struct mipi_dsi_device *dsi)
>  {
> -	struct jh057n *ctx =3D mipi_dsi_get_drvdata(dsi);
> +	struct st7703 *ctx =3D mipi_dsi_get_drvdata(dsi);
>  	int ret;
>  =

> -	jh057n_shutdown(dsi);
> +	st7703_shutdown(dsi);
>  =

>  	ret =3D mipi_dsi_detach(dsi);
>  	if (ret < 0)
> @@ -397,28 +399,28 @@ static int jh057n_remove(struct mipi_dsi_device *ds=
i)
>  =

>  	drm_panel_remove(&ctx->panel);
>  =

> -	jh057n_debugfs_remove(ctx);
> +	st7703_debugfs_remove(ctx);
>  =

>  	return 0;
>  }
>  =

> -static const struct of_device_id jh057n_of_match[] =3D {
> +static const struct of_device_id st7703_of_match[] =3D {
>  	{ .compatible =3D "rocktech,jh057n00900" },
>  	{ /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, jh057n_of_match);
> +MODULE_DEVICE_TABLE(of, st7703_of_match);
>  =

> -static struct mipi_dsi_driver jh057n_driver =3D {
> -	.probe	=3D jh057n_probe,
> -	.remove =3D jh057n_remove,
> -	.shutdown =3D jh057n_shutdown,
> +static struct mipi_dsi_driver st7703_driver =3D {
> +	.probe	=3D st7703_probe,
> +	.remove =3D st7703_remove,
> +	.shutdown =3D st7703_shutdown,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> -		.of_match_table =3D jh057n_of_match,
> +		.of_match_table =3D st7703_of_match,
>  	},
>  };
> -module_mipi_dsi_driver(jh057n_driver);
> +module_mipi_dsi_driver(st7703_driver);
>  =

>  MODULE_AUTHOR("Guido G=FCnther <agx@sigxcpu.org>");
> -MODULE_DESCRIPTION("DRM driver for Rocktech JH057N00900 MIPI DSI panel");
> +MODULE_DESCRIPTION("DRM driver for Sitronix ST7703 based MIPI DSI panels=
");
>  MODULE_LICENSE("GPL v2");
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
