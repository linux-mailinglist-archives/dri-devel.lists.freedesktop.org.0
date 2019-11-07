Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B46F3B42
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 23:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F6F6F7E0;
	Thu,  7 Nov 2019 22:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2666F7E0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 22:19:37 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 951BAC0002;
 Thu,  7 Nov 2019 22:19:30 +0000 (UTC)
Date: Thu, 7 Nov 2019 23:21:27 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Repurpose lvds-encoder.c
Message-ID: <20191107222127.25lw5zckqcn4a5p7@uno.localdomain>
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572886683-4919-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107181920.yh2suj3e2gra3iip@uno.localdomain>
 <TY1PR01MB1770CE255C06956A20AEAB63C0780@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1770CE255C06956A20AEAB63C0780@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20180716
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: multipart/mixed; boundary="===============0794482525=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0794482525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yybcryhg2ricc7o5"
Content-Disposition: inline


--yybcryhg2ricc7o5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Fabrizio,

On Thu, Nov 07, 2019 at 08:02:25PM +0000, Fabrizio Castro wrote:
> Hi Jacopo,
>
> Thank you for your feedback!
>
> > From: Jacopo Mondi <jacopo@jmondi.org>
> > Sent: 07 November 2019 18:19
> > Subject: Re: [PATCH v2 1/4] drm/bridge: Repurpose lvds-encoder.c
> >
> > Hi Fabrizio,
> >   thanks for the patch.
> >
> > On Mon, Nov 04, 2019 at 04:58:00PM +0000, Fabrizio Castro wrote:
> > > lvds-encoder.c implementation is also suitable for LVDS decoders,
> > > not just LVDS encoders.
> > > Instead of creating a new driver for addressing support for
> > > transparent LVDS decoders, repurpose lvds-encoder.c for the greater
> > > good.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > v1->v2:
> > > * No change
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig        |   8 +-
> > >  drivers/gpu/drm/bridge/Makefile       |   2 +-
> > >  drivers/gpu/drm/bridge/lvds-codec.c   | 169 ++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/bridge/lvds-encoder.c | 155 -------------------------------
> > >  4 files changed, 174 insertions(+), 160 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
> > >  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index 3436297..9e75ca4e 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -45,14 +45,14 @@ config DRM_DUMB_VGA_DAC
> > >  	  Support for non-programmable RGB to VGA DAC bridges, such as ADI
> > >  	  ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
> > >
> > > -config DRM_LVDS_ENCODER
> > > -	tristate "Transparent parallel to LVDS encoder support"
> > > +config DRM_LVDS_CODEC
> > > +	tristate "Transparent LVDS encoders and decoders support"
> > >  	depends on OF
> > >  	select DRM_KMS_HELPER
> > >  	select DRM_PANEL_BRIDGE
> > >  	help
> > > -	  Support for transparent parallel to LVDS encoders that don't require
> > > -	  any configuration.
> > > +	  Support for transparent LVDS encoders and LVDS decoders that don't
> > > +	  require any configuration.
> > >
> > >  config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
> > >  	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index 4934fcf..8a9178a 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -2,7 +2,7 @@
> > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> > >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > > -obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
> > > +obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> > >  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> > >  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> > >  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> > > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > > new file mode 100644
> > > index 0000000..8a1979c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > > @@ -0,0 +1,169 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > + */
> > > +
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_panel.h>
> > > +
> > > +struct lvds_codec {
> > > +	struct drm_bridge bridge;
> > > +	struct drm_bridge *panel_bridge;
> > > +	struct gpio_desc *powerdown_gpio;
> > > +	u32 connector_type;
> > > +};
> > > +
> > > +static int lvds_codec_attach(struct drm_bridge *bridge)
> > > +{
> > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > +							 struct lvds_codec,
> > > +							 bridge);
> > > +
> >
> > Weird indentation. Align to open ( to match the rest of the driver's
> > style.
>
> Will do, throughout the file.
>
> >
> > > +	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
> > > +				 bridge);
> > > +}
> > > +
> > > +static void lvds_codec_enable(struct drm_bridge *bridge)
> > > +{
> > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > +							 struct lvds_codec,
> > > +							 bridge);
> > > +
> >
> > Here too
> >
> > > +	if (lvds_codec->powerdown_gpio)
> > > +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
> > > +}
> > > +
> > > +static void lvds_codec_disable(struct drm_bridge *bridge)
> > > +{
> > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > +							 struct lvds_codec,
> > > +							 bridge);
> > > +
> > > +	if (lvds_codec->powerdown_gpio)
> > > +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
> > > +}
> > > +
> > > +static struct drm_bridge_funcs funcs = {
> > > +	.attach = lvds_codec_attach,
> > > +	.enable = lvds_codec_enable,
> > > +	.disable = lvds_codec_disable,
> > > +};
> > > +
> > > +static int lvds_codec_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct device_node *port;
> > > +	struct device_node *endpoint;
> > > +	struct device_node *panel_node;
> > > +	struct drm_panel *panel;
> > > +	struct lvds_codec *lvds_codec;
> > > +
> > > +	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> > > +	if (!lvds_codec)
> > > +		return -ENOMEM;
> > > +
> > > +	lvds_codec->connector_type = (u32)
> > > +		of_device_get_match_data(&pdev->dev);
> >
> > Fits in 1 line
>
> Will take it out
>
> >
> > > +	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > > +							       GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(lvds_codec->powerdown_gpio)) {
> > > +		int err = PTR_ERR(lvds_codec->powerdown_gpio);
> > > +
> > > +		if (err != -EPROBE_DEFER)
> > > +			dev_err(dev, "powerdown GPIO failure: %d\n", err);
> > > +		return err;
> >
> > I know it was there already, but this seems a bit unusual for the
> > minimal gain of having a printout in the very unlikely case the
> > gpiod_get() operations fails. I would just return PTR_ERR().
>
> Will change
>
> >
> > > +	}
> > > +
> > > +	/* Locate the panel DT node. */
> > > +	port = of_graph_get_port_by_id(dev->of_node, 1);
> > > +	if (!port) {
> > > +		dev_dbg(dev, "port 1 not found\n");
> > > +		return -ENXIO;
> > > +	}
> > > +
> > > +	endpoint = of_get_child_by_name(port, "endpoint");
> > > +	of_node_put(port);
> > > +	if (!endpoint) {
> > > +		dev_dbg(dev, "no endpoint for port 1\n");
> > > +		return -ENXIO;
> > > +	}
> >
> > I know it was there already, but this could be simplified with
> > of_graph_get_endpoint_by_regs()
> > > +
> > > +	panel_node = of_graph_get_remote_port_parent(endpoint);
> > > +	of_node_put(endpoint);
> > > +	if (!panel_node) {
> > > +		dev_dbg(dev, "no remote endpoint for port 1\n");
> > > +		return -ENXIO;
> > > +	}
> >
> > Or even better, simplify these three with of_graph_get_remote_node()
>
> Good catch,  of_graph_get_remote_node seems the best approach,
> I will go with that
>
> >
> > > +
> > > +	panel = of_drm_find_panel(panel_node);
> > > +	of_node_put(panel_node);
> > > +	if (IS_ERR(panel)) {
> > > +		dev_dbg(dev, "panel not found, deferring probe\n");
> > > +		return PTR_ERR(panel);
> > > +	}
> > > +
> > > +	lvds_codec->panel_bridge =
> > > +		devm_drm_panel_bridge_add_typed(dev, panel,
> > > +						lvds_codec->connector_type);
> >
> > The function documentation reports this as deprecated and suggested to
> > use the non-typed version. Do you think it could work for this new
> > codec driver ?
>
> I think so. However, the panel I am using doesn't define the connector type,
> probably because none of the DRM_MODE_CONNECTOR_* seem to fit
> perfectly, therefore I am probably going to need to define
> DRM_MODE_CONNECTOR_PARALLEL.

I see.. I'm no expert of DRM at all, but it seems to me too that none
of the existing DRM_MODE_CONNECTOR_* fits. I found no documentation
for them and that doesn't help... Although it seems weird there are no
similar use cases in mainline..

> I'll send v3 shortly so that you can have a look at what I mean, please advise
> on the best course of action.
>
> >
> > > +	if (IS_ERR(lvds_codec->panel_bridge))
> > > +		return PTR_ERR(lvds_codec->panel_bridge);
> > > +
> > > +	/* The panel_bridge bridge is attached to the panel's of_node,
> > > +	 * but we need a bridge attached to our of_node for our user
> > > +	 * to look up.
> > > +	 */
> > > +	lvds_codec->bridge.of_node = dev->of_node;
> > > +	lvds_codec->bridge.funcs = &funcs;
> > > +	drm_bridge_add(&lvds_codec->bridge);
> > > +
> > > +	platform_set_drvdata(pdev, lvds_codec);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int lvds_codec_remove(struct platform_device *pdev)
> > > +{
> > > +	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
> > > +
> > > +	drm_bridge_remove(&lvds_codec->bridge);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct of_device_id lvds_codec_match[] = {
> > > +	{
> > > +		.compatible = "lvds-encoder",
> > > +		.data = (void *)DRM_MODE_CONNECTOR_LVDS
> >
> > In case you for for drm_panel_bridge_add() you could drop the type
>
> Will do
>
> >
> > > +	},
> > > +	{
> > > +		.compatible = "thine,thc63lvdm83d",
> > > +		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
> > > +	},
> > > +	{
> > > +		.compatible = "lvds-decoder",
> > > +		.data = (void *)DRM_MODE_CONNECTOR_Unknown,
> > > +	},
> >
> > Which decoder are you using? This is a generic fallback, but I would
> > expect compatible for a real device to appear in DTS.
>
> I am using the DS90CF384AMTDX/NOPB.
>
> This driver is for transparent encoders and decoders, which means
> there is no way you can control them. I don't think we should add
> any device specific compatible string here, as it would be of no use.
> The original dt-bindings for the encoders requires a device specific
> compatible string for encoders with additional properties, I think
> we should keep it that way for decoders too. I am not going to
> use a device specific compatible string in the DT either for the
> time being, unless really necessary.
>

I see, but in example your chip has a powerdown gpio pin, which is not
defined in the lvds-codec bindings. A compatible string for that device
should be added, with the associated DT binding file, much like it's
done for the "thine,thc63lvdm83d" one. Nothing that could not be
done later on top of what you have here though

Thanks
  j

> I will send a v3 shortly. Thank you for your help so far!
>
> Fab
>
> >
> > > +	{},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, lvds_codec_match);
> > > +
> > > +static struct platform_driver lvds_codec_driver = {
> > > +	.probe	= lvds_codec_probe,
> > > +	.remove	= lvds_codec_remove,
> > > +	.driver		= {
> > > +		.name		= "lvds-codec",
> > > +		.of_match_table	= lvds_codec_match,
> > > +	},
> > > +};
> > > +module_platform_driver(lvds_codec_driver);
> > > +
> > > +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> > > +MODULE_DESCRIPTION("Driver for transparent LVDS encoders and LVDS decoders");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
> > > deleted file mode 100644
> > > index e2132a8..0000000
> > > --- a/drivers/gpu/drm/bridge/lvds-encoder.c
> > > +++ /dev/null
> > > @@ -1,155 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0-or-later
> > > -/*
> > > - * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > - */
> > > -
> > > -#include <linux/gpio/consumer.h>
> > > -#include <linux/module.h>
> > > -#include <linux/of.h>
> > > -#include <linux/of_graph.h>
> > > -#include <linux/platform_device.h>
> > > -
> > > -#include <drm/drm_bridge.h>
> > > -#include <drm/drm_panel.h>
> > > -
> > > -struct lvds_encoder {
> > > -	struct drm_bridge bridge;
> > > -	struct drm_bridge *panel_bridge;
> > > -	struct gpio_desc *powerdown_gpio;
> > > -};
> > > -
> > > -static int lvds_encoder_attach(struct drm_bridge *bridge)
> > > -{
> > > -	struct lvds_encoder *lvds_encoder = container_of(bridge,
> > > -							 struct lvds_encoder,
> > > -							 bridge);
> > > -
> > > -	return drm_bridge_attach(bridge->encoder, lvds_encoder->panel_bridge,
> > > -				 bridge);
> > > -}
> > > -
> > > -static void lvds_encoder_enable(struct drm_bridge *bridge)
> > > -{
> > > -	struct lvds_encoder *lvds_encoder = container_of(bridge,
> > > -							 struct lvds_encoder,
> > > -							 bridge);
> > > -
> > > -	if (lvds_encoder->powerdown_gpio)
> > > -		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 0);
> > > -}
> > > -
> > > -static void lvds_encoder_disable(struct drm_bridge *bridge)
> > > -{
> > > -	struct lvds_encoder *lvds_encoder = container_of(bridge,
> > > -							 struct lvds_encoder,
> > > -							 bridge);
> > > -
> > > -	if (lvds_encoder->powerdown_gpio)
> > > -		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
> > > -}
> > > -
> > > -static struct drm_bridge_funcs funcs = {
> > > -	.attach = lvds_encoder_attach,
> > > -	.enable = lvds_encoder_enable,
> > > -	.disable = lvds_encoder_disable,
> > > -};
> > > -
> > > -static int lvds_encoder_probe(struct platform_device *pdev)
> > > -{
> > > -	struct device *dev = &pdev->dev;
> > > -	struct device_node *port;
> > > -	struct device_node *endpoint;
> > > -	struct device_node *panel_node;
> > > -	struct drm_panel *panel;
> > > -	struct lvds_encoder *lvds_encoder;
> > > -
> > > -	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
> > > -	if (!lvds_encoder)
> > > -		return -ENOMEM;
> > > -
> > > -	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > > -							       GPIOD_OUT_HIGH);
> > > -	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
> > > -		int err = PTR_ERR(lvds_encoder->powerdown_gpio);
> > > -
> > > -		if (err != -EPROBE_DEFER)
> > > -			dev_err(dev, "powerdown GPIO failure: %d\n", err);
> > > -		return err;
> > > -	}
> > > -
> > > -	/* Locate the panel DT node. */
> > > -	port = of_graph_get_port_by_id(dev->of_node, 1);
> > > -	if (!port) {
> > > -		dev_dbg(dev, "port 1 not found\n");
> > > -		return -ENXIO;
> > > -	}
> > > -
> > > -	endpoint = of_get_child_by_name(port, "endpoint");
> > > -	of_node_put(port);
> > > -	if (!endpoint) {
> > > -		dev_dbg(dev, "no endpoint for port 1\n");
> > > -		return -ENXIO;
> > > -	}
> > > -
> > > -	panel_node = of_graph_get_remote_port_parent(endpoint);
> > > -	of_node_put(endpoint);
> > > -	if (!panel_node) {
> > > -		dev_dbg(dev, "no remote endpoint for port 1\n");
> > > -		return -ENXIO;
> > > -	}
> > > -
> > > -	panel = of_drm_find_panel(panel_node);
> > > -	of_node_put(panel_node);
> > > -	if (IS_ERR(panel)) {
> > > -		dev_dbg(dev, "panel not found, deferring probe\n");
> > > -		return PTR_ERR(panel);
> > > -	}
> > > -
> > > -	lvds_encoder->panel_bridge =
> > > -		devm_drm_panel_bridge_add_typed(dev, panel,
> > > -						DRM_MODE_CONNECTOR_LVDS);
> > > -	if (IS_ERR(lvds_encoder->panel_bridge))
> > > -		return PTR_ERR(lvds_encoder->panel_bridge);
> > > -
> > > -	/* The panel_bridge bridge is attached to the panel's of_node,
> > > -	 * but we need a bridge attached to our of_node for our user
> > > -	 * to look up.
> > > -	 */
> > > -	lvds_encoder->bridge.of_node = dev->of_node;
> > > -	lvds_encoder->bridge.funcs = &funcs;
> > > -	drm_bridge_add(&lvds_encoder->bridge);
> > > -
> > > -	platform_set_drvdata(pdev, lvds_encoder);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int lvds_encoder_remove(struct platform_device *pdev)
> > > -{
> > > -	struct lvds_encoder *lvds_encoder = platform_get_drvdata(pdev);
> > > -
> > > -	drm_bridge_remove(&lvds_encoder->bridge);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static const struct of_device_id lvds_encoder_match[] = {
> > > -	{ .compatible = "lvds-encoder" },
> > > -	{ .compatible = "thine,thc63lvdm83d" },
> > > -	{},
> > > -};
> > > -MODULE_DEVICE_TABLE(of, lvds_encoder_match);
> > > -
> > > -static struct platform_driver lvds_encoder_driver = {
> > > -	.probe	= lvds_encoder_probe,
> > > -	.remove	= lvds_encoder_remove,
> > > -	.driver		= {
> > > -		.name		= "lvds-encoder",
> > > -		.of_match_table	= lvds_encoder_match,
> > > -	},
> > > -};
> > > -module_platform_driver(lvds_encoder_driver);
> > > -
> > > -MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> > > -MODULE_DESCRIPTION("Transparent parallel to LVDS encoder");
> > > -MODULE_LICENSE("GPL");
> > > --
> > > 2.7.4
> > >

--yybcryhg2ricc7o5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3EmOcACgkQcjQGjxah
VjzXnQ//b/+SM4gG76moOFGkVzKuUKvMyYqRJPuFwuzgkiV1z5+YQaPf88+zDqwq
+o7U59tFJVhon+zHo0x01I/uaLDoJudVNfAlyx5ASZa/5fd/ed9HxNRvufPKOBjs
ZzK7CdDKVNCRXJS6vIPcyL1bznS6DW8SG7xvkz2q+jBU6SPgc9xkQFef3pgI8h72
jMXE/jb5FPW+bBbqAKJF86dgstluIqo3hZyCohfoEX11jZVer+KP2Zdp2r7+hfw6
dCJRgIcUWkO8hInn87LgZ2SZQSvFHnpszgDT3TnBnA/w3yfGURXBdiueVOUnXtrE
znCuI7s/7ZsNBy7qrU1GTwawdQPvJAu6dxSxGafi/nSV+Pl+tVXzl67r0k32D0jr
HotANlE1dKf8820CFuXObur87mjQFaoFrgauw2tc4G5Qk1e+HYsIPKtcKuULI83D
YxB3S7KDLENe00SIbIUnfSesEDWS1i0M1fpOLVOwj4cYUmNfiVHFp5EdkX3YZT9/
wnano3eLsh/rIKWys1CjusZiQosQ7uqOj3BwuX3GpuaRUU+xUbDXcnoEpRoh+cD7
YQu1hZHt87QJZm1GOy3M1QVf50sd8LKH+MLvIW3rofODDyvFrFzbbx36O2X2vTEG
5YF7AgHa0Yy1M5SbXA5beVfhRuA+3sa7giT5YinWz+CCrXdkrqk=
=oCxM
-----END PGP SIGNATURE-----

--yybcryhg2ricc7o5--

--===============0794482525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0794482525==--
