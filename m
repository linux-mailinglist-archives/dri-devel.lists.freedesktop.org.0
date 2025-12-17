Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A9CC8276
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638510E35E;
	Wed, 17 Dec 2025 14:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YlThj0b4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5010810E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:23:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 23BB14E41C63;
 Wed, 17 Dec 2025 14:23:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E5B0D6072F;
 Wed, 17 Dec 2025 14:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 69849102F0AD5; Wed, 17 Dec 2025 15:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5ExjHRzCFZ+/RFYvmYEsYj/7NGIqOTtAJIup5DN6WEI=;
 b=YlThj0b4pzEZrEtnFSrm4pfCZjYMPEPGbjB/A+BeOKSCNgekChztywvv9u84ExhYKJD/r8
 G/q0y8x6yabuCM/erlxGjviwveYEpxXCnNDdpzJA3u8u54ugwRzDfg2tDyeECKDv1ji3y3
 U7AtaQr60GW3YB196CmlBxvRAWZLqFOVV88De+Ipq6WyIB0VSVGmAtbQzG5E11OpDKo/xy
 UhnzAiMrwblhbL6rpCT2+xNO1SkUd58tOiMSwBq1jZT6ofBK3YQFmL3iENG94aNq9cCcJn
 foyvib/tJkq8qjFvb6+QtuhkIGTG2GGVXG/dl+lLoezsHO8j+jo2/FlbPC9xTA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:23:26 +0100
Message-Id: <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Cc: Herv=C3=A9, can you review the DT overlay aspects?

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> To maintain backward compatibility while removing the deprecated
> tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> the legacy "ti,tilcdc,panel" devicetree binding to the standard
> panel-dpi binding at early boot.
>
> The conversion uses an embedded device tree overlay that is applied and
> modified during subsys_initcall. The process:

I was a bit skeptical about the overlay idea initially. But after having
seen the code and thought about any alternative solution, I think you
probably took the simplest approach.

> - Apply embedded overlay to create a panel-dpi node with placeholder
>   timing properties and port/endpoint connections to the LCDC
> - Copy all properties from the legacy panel node to the new panel-dpi
> - Copy display-timings from the legacy panel
> - Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
>   standard display timing properties (pixelclk-active, syncclk-active)
> - Disable the legacy panel by removing its compatible property to
>   prevent the deprecated driver from binding
>
> The result is a standard panel-dpi node with proper endpoints and
> timing properties, allowing the DRM panel infrastructure to work with
> legacy devicetrees without modification.
>
> Other legacy panel-info properties are not migrated as they consistently
> use default values across all mainline devicetrees and can be hardcoded
> in the tilcdc driver.
>
> This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
> only be enabled for systems with legacy devicetrees containing
> "ti,tilcdc,panel" nodes.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

It's fair to add before your SoB line:
 Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 Link: https://lore.kernel.org/all/1d9a9269-bfda-4d43-938b-2df6b82b9369@ide=
asonboard.com/

> ---
>
> Using the approach of applying an overlay and then modifying the live
> device tree is the solution I found that requires no modification of the
> OF core. Dealing entirely with overlay changesets would bring additional
> requirements such as phandle resolution management, which is internal to
> the OF framework. I intend to avoid OF core change to support this legacy
> binding.
>
> Change in v2:
> - New patch.
> ---
>  drivers/gpu/drm/tilcdc/Kconfig                  |  14 +++
>  drivers/gpu/drm/tilcdc/Makefile                 |   2 +
>  drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c    | 159 ++++++++++++++++++=
++++++
>  drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso |  44 +++++++
>  4 files changed, 219 insertions(+)
>
> diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kcon=
fig
> index 24f9a245ba593..4dcae0a06b819 100644
> --- a/drivers/gpu/drm/tilcdc/Kconfig
> +++ b/drivers/gpu/drm/tilcdc/Kconfig
> @@ -14,3 +14,17 @@ config DRM_TILCDC
>  	  controller, for example AM33xx in beagle-bone, DA8xx, or
>  	  OMAP-L1xx.  This driver replaces the FB_DA8XX fbdev driver.
>
> +config DRM_TILCDC_PANEL_LEGACY
> +	bool "Support device tree blobs using TI LCDC Panel binding"
> +	default n

'default' defaults to 'n', you can drop this line.

However I think it should instead be enabled by default. You propose to
entirely remove the tilcdc panel driver in the next patch, so any users
without DRM_TILCDC_PANEL_LEGACY in their defconfig would be broken. For
this reason, I propose to enable DRM_TILCDC_PANEL_LEGACY in all cases where
the tilcdc_panel was compiled in, which I guess means:

    default DRM_TILCDC

Except I think if DRM_TILCDC=3Dm, DRM_TILCDC_PANEL_LEGACY should be =3Dy. I
don't know how to do that in Kconfig. But I'm not really sure about this
last topic.

> +	depends on DRM_TILCDC
> +        depends on OF
> +        depends on BACKLIGHT_CLASS_DEVICE
> +        depends on PM
> +	select OF_OVERLAY
> +	select DRM_PANEL_SIMPLE
> +	help
> +	  Choose this option if you need a kernel that is compatible
> +	  with device tree blobs using the obsolete "ti,tilcdc,panel"
> +	  binding. If you find "ti,tilcdc,panel"-string from your DTB,
> +	  you probably need this. Otherwise you do not.

Maybe mention here what it does?

For example, rewording your commit message:

  Modifies the live device tree at early boot to convert the legacy
  "ti,tilcdc,panel" devicetree node to the standard panel-dpi node.  This
  allows to maintain backward compatibility for boards which were using the
  deprecated tilcdc_panel driver.

> diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Mak=
efile
> index f5190477de721..6d6a08b5adf40 100644
> --- a/drivers/gpu/drm/tilcdc/Makefile
> +++ b/drivers/gpu/drm/tilcdc/Makefile
> @@ -11,3 +11,5 @@ tilcdc-y :=3D \
>  	tilcdc_drv.o
>
>  obj-$(CONFIG_DRM_TILCDC)	+=3D tilcdc.o
> +obj-$(CONFIG_DRM_TILCDC_PANEL_LEGACY)	+=3D tilcdc_panel_legacy.o \
> +					   tilcdc_panel_legacy.dtbo.o
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c b/drivers/gpu/d=
rm/tilcdc/tilcdc_panel_legacy.c
> new file mode 100644
> index 0000000000000..a9651dd9f9935
> --- /dev/null
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Kory Maincent <kory.maincent@bootlin.com>
> + *
> + * To support the legacy "ti,tilcdc,panel" binding, the devicetree has t=
o
> + * be transformed to the new panel-dpi binding with the endpoint associa=
ted.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/slab.h>
> +
> +/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.l=
ib */
> +extern char __dtbo_tilcdc_panel_legacy_begin[];
> +extern char __dtbo_tilcdc_panel_legacy_end[];
> +
> +static void __init
> +tilcdc_panel_update_prop(struct device_node *node, char *name,
> +			 void *val, int length)
> +{
> +	struct property *prop;
> +
> +	prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> +	if (!prop)
> +		return;
> +
> +	prop->name =3D kstrdup(name, GFP_KERNEL);
> +	prop->length =3D length;
> +	prop->value =3D kmemdup(val, length, GFP_KERNEL);
> +	of_update_property(node, prop);
> +}
> +
> +static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
> +					  struct device_node *new_panel)
> +{
> +	struct device_node *child, *old_timing, *new_timing, *panel_info;
> +	u32 invert_pxl_clk =3D 0, sync_edge =3D 0;
> +	struct property *prop;
> +
> +	/* Copy all panel properties to the new panel node */
> +	for_each_property_of_node(old_panel, prop) {
> +		if (!strncmp(prop->name, "compatible", sizeof("compatible")))
> +			continue;
> +
> +		tilcdc_panel_update_prop(new_panel, prop->name,
> +					 prop->value, prop->length);
> +	}
> +
> +	child =3D of_get_child_by_name(old_panel, "display-timings");

There's some housekeeping code in this function to ensure you put all the
device_node refs. It would be simpler and less error prone to use a cleanup
action. E.g.:

-	struct device_node *child, *old_timing, *new_timing, *panel_info;

-	child =3D of_get_child_by_name(old_panel, "display-timings");
+	struct device_node *child __free(device_node) =3D of_get_child_by_name(ol=
d_panel, "display-timings");

> +	if (!child)
> +		return -EINVAL;
> +
> +	/* The default display timing is the one specified as native-mode.
> +	 * If no native-mode is specified then the first node is assumed
> +	 * to be the native mode.
> +	 */
> +	old_timing =3D of_parse_phandle(child, "native-mode", 0);
> +	if (!old_timing) {
> +		old_timing =3D of_get_next_child(child, NULL);
> +		if (!old_timing) {
> +			of_node_put(child);
> +			return -EINVAL;
> +		}
> +	}
> +	of_node_put(child);
> +
> +	new_timing =3D of_get_child_by_name(new_panel, "panel-timing");
> +	if (!new_timing)
> +		return -EINVAL;
> +
> +	/* Copy all panel timing property to the new panel node */
> +	for_each_property_of_node(old_timing, prop)
> +		tilcdc_panel_update_prop(new_timing, prop->name,
> +					 prop->value, prop->length);
> +
> +	panel_info =3D of_get_child_by_name(old_panel, "panel-info");
> +	if (!panel_info)
> +		return -EINVAL;

tilcdc_panel_update_prop() has previously done various allocations which
will not be freed if you return here. You shoudl probably do all the
of_get_*() at the top, and if they all succeed start copying data along
with with the needed allocations.

> +	/* Looked only for these two parameter as all the other are always
> +	 * set to default and not related to common DRM properties.
> +	 */
> +	of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
> +	of_property_read_u32(panel_info, "sync-edge", &sync_edge);
> +
> +	if (!invert_pxl_clk)
> +		tilcdc_panel_update_prop(new_timing, "pixelclk-active",
> +					 &(int){1}, sizeof(int));
> +
> +	if (!sync_edge)
> +		tilcdc_panel_update_prop(new_timing, "syncclk-active",
> +					 &(int){1}, sizeof(int));
> +
> +	of_node_put(panel_info);
> +	of_node_put(old_timing);
> +	of_node_put(new_timing);
> +	return 0;
> +}
> +
> +static const struct of_device_id tilcdc_panel_of_match[] __initconst =3D=
 {
> +	{ .compatible =3D "ti,tilcdc,panel", },
> +	{},
> +};
> +
> +static const struct of_device_id tilcdc_of_match[] __initconst =3D {
> +	{ .compatible =3D "ti,am33xx-tilcdc", },
> +	{ .compatible =3D "ti,da850-tilcdc", },
> +	{},
> +};
> +
> +static int __init tilcdc_panel_legacy_init(void)
> +{
> +	struct device_node *panel, *lcdc, *new_panel;
> +	void *dtbo_start;
> +	u32 dtbo_size;
> +	int ovcs_id;
> +	int ret;
> +
> +	lcdc =3D of_find_matching_node(NULL, tilcdc_of_match);
> +	panel =3D of_find_matching_node(NULL, tilcdc_panel_of_match);
> +
> +	if (!of_device_is_available(panel) ||
> +	    !of_device_is_available(lcdc)) {
> +		ret =3D -ENODEV;
> +		goto out;
> +	}
> +
> +	dtbo_start =3D __dtbo_tilcdc_panel_legacy_begin;
> +	dtbo_size =3D __dtbo_tilcdc_panel_legacy_end -
> +		    __dtbo_tilcdc_panel_legacy_begin;
> +
> +	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
> +	if (ret)
> +		goto out;
> +
> +	new_panel =3D of_find_node_by_name(NULL, "panel-dpi");
> +	if (!new_panel) {
> +		ret =3D -ENODEV;
> +		goto overlay_remove;
> +	}
> +
> +	ret =3D tilcdc_panel_copy_props(panel, new_panel);
> +	if (ret)
> +		goto overlay_remove;
> +
> +	/* Remove compatible property to avoid any driver compatible match */
> +	of_remove_property(panel, of_find_property(panel, "compatible",
> +						   NULL));
> +overlay_remove:
> +	of_overlay_remove(&ovcs_id);

Is it correct to remove the overlay here? Won't it remove what you have
just added?

> +out:
> +	of_node_put(new_panel);
> +	of_node_put(panel);
> +	of_node_put(lcdc);

Here too you can use cleanup actions, even though the current code is
slightly simpler than tilcdc_panel_copy_props as far as of_node_put() is
concerned.

> +	return ret;
> +}
> +
> +subsys_initcall(tilcdc_panel_legacy_init);
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso b/drivers/gp=
u/drm/tilcdc/tilcdc_panel_legacy.dtso
> new file mode 100644
> index 0000000000000..77f3ec9391d55
> --- /dev/null
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * DTS overlay for converting ti,tilcdc,panel binding to new binding.
> + *
> + * Copyright (C) Kory Maincent <kory.maincent@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	panel-dpi {
> +		compatible =3D "panel-dpi";
> +		port {
> +			panel_in: endpoint@0 {
> +				remote-endpoint =3D <&lcd_0>;
> +			};
> +		};
> +		panel-timing {
> +			clock-frequency =3D <0>;
> +			hactive =3D <0>;
> +			vactive =3D <0>;
> +			hfront-porch =3D <0>;
> +			hback-porch =3D <0>;
> +			hsync-len =3D <0>;
> +			vfront-porch =3D <0>;
> +			vback-porch =3D <0>;
> +			vsync-len =3D <0>;
> +			hsync-active =3D <0>;
> +			vsync-active =3D <0>;
> +			de-active =3D <0>;
> +			pixelclk-active =3D <0>;
> +			syncclk-active =3D <0>;
> +		};
> +	};
> +};
> +
> +&lcdc {
> +	port {
> +		lcd_0: endpoint@0 {
> +			remote-endpoint =3D <&panel_in>;
> +		};
> +	};
> +};




--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
