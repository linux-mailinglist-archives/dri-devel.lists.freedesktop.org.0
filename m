Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B8F45C9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 12:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276C6F948;
	Fri,  8 Nov 2019 11:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D166F948
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 11:35:56 +0000 (UTC)
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it
 [93.34.114.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 04C8A1C002F;
 Fri,  8 Nov 2019 11:35:43 +0000 (UTC)
Date: Fri, 8 Nov 2019 12:37:37 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/7] drm/bridge: Repurpose lvds-encoder.c
Message-ID: <20191108113737.v5rmiwdxyd75e5tc@uno.localdomain>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107203454.GN24983@pendragon.ideasonboard.com>
 <TYXPR01MB177573D7BD9DAA139F7FAB8FC07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20191108093927.2g7dwgdwrcr4rov7@uno.localdomain>
 <20191108110658.GD4866@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191108110658.GD4866@pendragon.ideasonboard.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: multipart/mixed; boundary="===============1507241439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1507241439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wvvpgb3x5k3gray4"
Content-Disposition: inline


--wvvpgb3x5k3gray4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Fri, Nov 08, 2019 at 01:06:58PM +0200, Laurent Pinchart wrote:
> Hello Jacopo,
>
> On Fri, Nov 08, 2019 at 10:39:27AM +0100, Jacopo Mondi wrote:
> > On Fri, Nov 08, 2019 at 09:22:56AM +0000, Fabrizio Castro wrote:
> > > On 07 November 2019 20:35 Laurent Pinchart wrote:
> > > > On Thu, Nov 07, 2019 at 08:10:58PM +0000, Fabrizio Castro wrote:
> > > > > lvds-encoder.c implementation is also suitable for LVDS decoders,
> > > > > not just LVDS encoders.
> > > > > Instead of creating a new driver for addressing support for
> > > > > transparent LVDS decoders, repurpose lvds-encoder.c for the greater
> > > > > good.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > >
> > > > > ---
> > > > > v2->v3:
> > > > > * No change
> > > > > v1->v2:
> > > > > * No change
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/Kconfig        |   8 +-
> > > > >  drivers/gpu/drm/bridge/Makefile       |   2 +-
> > > > >  drivers/gpu/drm/bridge/lvds-codec.c   | 131 ++++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/bridge/lvds-encoder.c | 155 ----------------------------------
> > > > >  4 files changed, 136 insertions(+), 160 deletions(-)
> > > >
> > > > It would help if you added the -M1 option to git-format-patch to detect
> > > > the rename, the result would be easier to review.
> > >
> > > Will do, thank you for the hint
> > >
> > > > >  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
> > > > >  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > > > index 3436297..9e75ca4e 100644
> > > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > > @@ -45,14 +45,14 @@ config DRM_DUMB_VGA_DAC
> > > > >  	  Support for non-programmable RGB to VGA DAC bridges, such as ADI
> > > > >  	  ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
> > > > >
> > > > > -config DRM_LVDS_ENCODER
> > > > > -	tristate "Transparent parallel to LVDS encoder support"
> > > > > +config DRM_LVDS_CODEC
> > > > > +	tristate "Transparent LVDS encoders and decoders support"
> > > > >  	depends on OF
> > > > >  	select DRM_KMS_HELPER
> > > > >  	select DRM_PANEL_BRIDGE
> > > > >  	help
> > > > > -	  Support for transparent parallel to LVDS encoders that don't require
> > > > > -	  any configuration.
> > > > > +	  Support for transparent LVDS encoders and LVDS decoders that don't
> > > > > +	  require any configuration.
> > > > >
> > > > >  config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
> > > > >  	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
> > > > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > > > index 4934fcf..8a9178a 100644
> > > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > > @@ -2,7 +2,7 @@
> > > > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > > > >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> > > > >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > > > > -obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
> > > > > +obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> > > > >  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> > > > >  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> > > > >  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> > > > > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > > > > new file mode 100644
> > > > > index 0000000..d57a8eb
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > > > > @@ -0,0 +1,131 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > > +/*
> > > > > + * Copyright (C) 2019 Renesas Electronics Corporation
> > > > > + * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > + */
> > > > > +
> > > > > +#include <linux/gpio/consumer.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_device.h>
> > > > > +#include <linux/of_graph.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +
> > > > > +#include <drm/drm_bridge.h>
> > > > > +#include <drm/drm_panel.h>
> > > > > +
> > > > > +struct lvds_codec {
> > > > > +	struct drm_bridge bridge;
> > > > > +	struct drm_bridge *panel_bridge;
> > > > > +	struct gpio_desc *powerdown_gpio;
> > > > > +};
> > > > > +
> > > > > +static int lvds_codec_attach(struct drm_bridge *bridge)
> > > > > +{
> > > > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > > > +						     struct lvds_codec, bridge);
> > > > > +
> > > > > +	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
> > > > > +				 bridge);
> > > > > +}
> > > > > +
> > > > > +static void lvds_codec_enable(struct drm_bridge *bridge)
> > > > > +{
> > > > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > > > +						     struct lvds_codec, bridge);
> > > > > +
> > > > > +	if (lvds_codec->powerdown_gpio)
> > > > > +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
> > > > > +}
> > > > > +
> > > > > +static void lvds_codec_disable(struct drm_bridge *bridge)
> > > > > +{
> > > > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > > > +						     struct lvds_codec, bridge);
> > > > > +
> > > > > +	if (lvds_codec->powerdown_gpio)
> > > > > +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
> > > > > +}
> > > > > +
> > > > > +static struct drm_bridge_funcs funcs = {
> > > > > +	.attach = lvds_codec_attach,
> > > > > +	.enable = lvds_codec_enable,
> > > > > +	.disable = lvds_codec_disable,
> > > > > +};
> > > > > +
> > > > > +static int lvds_codec_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	struct device_node *panel_node;
> > > > > +	struct drm_panel *panel;
> > > > > +	struct lvds_codec *lvds_codec;
> > > > > +
> > > > > +	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> > > > > +	if (!lvds_codec)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > > > > +							     GPIOD_OUT_HIGH);
> > > > > +	if (IS_ERR(lvds_codec->powerdown_gpio))
> > > > > +		return PTR_ERR(lvds_codec->powerdown_gpio);
> > > >
> > > > The driver had an error message here, any reason it got removed ?
> > >
> > > I am quoting from https://www.spinics.net/lists/devicetree/msg318602.html :
> > > "I know it was there already, but this seems a bit unusual for the
> > > minimal gain of having a printout in the very unlikely case the
> > > gpiod_get() operations fails. I would just return PTR_ERR()."
> > >
> > > I am OK with reinstating it, just let me know what you want me to do here.
> >
> > Yeah, I suggested that as it seemed to me quite unusual pattern for the
> > minimal gain of having an error message in an unlikely case. Sorry Fab
> > for the double effort if Laurent wants it back again.
> >
> > > > > +
> > > > > +	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
> > > > > +	if (!panel_node) {
> > > > > +		dev_dbg(dev, "panel DT node not found\n");
> > > > > +		return -ENXIO;
> > > > > +	}
> > > > > +
> > > > > +	panel = of_drm_find_panel(panel_node);
> > > > > +	of_node_put(panel_node);
> > > > > +	if (IS_ERR(panel)) {
> > > > > +		dev_dbg(dev, "panel not found, deferring probe\n");
> > > > > +		return PTR_ERR(panel);
> > > > > +	}
> > > > > +
> > > > > +	lvds_codec->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > >
> > > > This was devm_drm_panel_bridge_add_typed(), do you think there's a risk
> > > > of breaking userspace ? Of course as noted in the documentation of
> > > > devm_drm_panel_bridge_add_typed() the right solution is to fix panel
> > > > drivers, but I'm still slightly worried.
> > >
> > > Things break when the panel doesn't define connector_type, leading to the below
> > > check from devm_drm_panel_bridge_add:
> > > if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
> > >     return NULL;
> > >
> > > Please advise on the best course of action here.
> >
> > I pointed out that function was described as deprecated and probably
> > fixing the panel driver would be best. Why are you concerned about
> > userspace ? is the panel driver that should correctly report its
> > connector type, isn't it ? In case it's not, sorry again Fab for the
> > double effort.
>
> I'm concerned that this change may turn a working system in a
> non-working system. The issue has to be fixed in panel drivers of
> course, but switching from devm_drm_panel_bridge_add_typed() to
> devm_drm_panel_bridge_add() should only be done once all the drivers
> that are used with lvds-encoder behave properly.
>

I see.. It's probably most safer then to keep the _typed() version.

However, I understand not breaking working system is of course
desirable, but this would not be a userspace breakage, but a driver
change that requires other associated drivers to be updated
accordingly, like it happens at every release. I however fear a
change like this if blindly ported to a BSP would break it, and yes,
doing that in this single commit won't help identifying where the
issue comes from. Sorry Fabrizio for the bad suggestion, you should
keep the _typed version and eventually switch to the new one in a
separate commit if you feel like to.

> > > > Actually, could you split this patch in two, with a patch that only
> > > > renames the driver (and the symbols internally) without any functional
> > > > change, and another patch that performs the modifications ? That would
> > > > be much easier to review and discuss.
> >
> > This is more work for something that could be simply addressed by the
> > reviewer by passing -M10 to git show. For such a simple driver isn't
> > this fine the way it is ?
>
> Don't make it difficult for the reviewer. I've reviewed this patch in my
> e-mail client, not in git. The patch itself should be generated with
> -M10, but in any case, such renames should not be bundled with other
> changes. One logical change by patch is the rule, and we can sometimes
> bundle a semi-unrelated minor change (such as a typo or indentation
> fix), but certainly not a potentially dangerous functional change that
> needs to be carefully reviewed.

Ack

Thanks
  j

>
> > > Will do
> > >
> > > > > +	if (IS_ERR(lvds_codec->panel_bridge))
> > > > > +		return PTR_ERR(lvds_codec->panel_bridge);
> > > > > +
> > > > > +	/* The panel_bridge bridge is attached to the panel's of_node,
> > > > > +	 * but we need a bridge attached to our of_node for our user
> > > > > +	 * to look up.
> > > > > +	 */
> > > > > +	lvds_codec->bridge.of_node = dev->of_node;
> > > > > +	lvds_codec->bridge.funcs = &funcs;
> > > > > +	drm_bridge_add(&lvds_codec->bridge);
> > > > > +
> > > > > +	platform_set_drvdata(pdev, lvds_codec);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int lvds_codec_remove(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
> > > > > +
> > > > > +	drm_bridge_remove(&lvds_codec->bridge);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct of_device_id lvds_codec_match[] = {
> > > > > +	{ .compatible = "lvds-encoder"  },
> > > > > +	{ .compatible = "thine,thc63lvdm83d" },
> > > > > +	{ .compatible = "lvds-decoder" },
> > > > > +	{},
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, lvds_codec_match);
> > > > > +
> > > > > +static struct platform_driver lvds_codec_driver = {
> > > > > +	.probe	= lvds_codec_probe,
> > > > > +	.remove	= lvds_codec_remove,
> > > > > +	.driver		= {
> > > > > +		.name		= "lvds-codec",
> > > > > +		.of_match_table	= lvds_codec_match,
> > > > > +	},
> > > > > +};
> > > > > +module_platform_driver(lvds_codec_driver);
> > > > > +
> > > > > +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> > > > > +MODULE_DESCRIPTION("Driver for transparent LVDS encoders and LVDS decoders");
> > > >
> > > > Maybe "LVDS encoders and decoders" ?
> > > >
> > > > > +MODULE_LICENSE("GPL");
> > > >
> > > > [snip]
>
> --
> Regards,
>
> Laurent Pinchart

--wvvpgb3x5k3gray4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3FU4EACgkQcjQGjxah
VjyWgw//c8XgfgSTmqWr4nORNRJyGA1HZcYtyhLwZmD2tS8+tpejTmNq8gbGRUPh
HmUkgfZ0kGNJDAtIOusjVTDY5a7ig2Z9Tpyfli8ryfKm2q2Qiiyzrhlxe3rMsBxF
FzQEI8GLzyVTvZyf1n27a02YDMlp0P4s6nAPVSSrpl8u+zO7tQrd+Bn0Kf09aLP2
6y4JDSh5Nghxjwt5baOKbEyLYLwoepVgsQXotbHONFoZwg/Do21lXHqZ50IMrvwt
cGZbNnGzpxbwYlF0OfUG9oUZnMgTHdJMt0H4kCH0vuoJbCvalt0jUuOG7NRH4z3J
sAP6eDE+VaWxatBgUPcRztlDRQZ/DPg1hkGLmzmdfK2KKnZgOPkDHt+jEEbJwAdZ
e746R61sxZa4Y0VnvlPZt6yHz2EgqOvfsk/zdd8IqTYKgu6vCxoLMci4HqJRfOrj
SsrGgkj3129HjVt2Kv8Zb4gsbd/+V6vAWI16owO9LXUJ1Inki2nVi8C5PuhtQa2Y
Y5mceHHv+RdIFBuv/97pidFHjq4tSMoIfBrWT9mALFf1d+038v4JWtUq7X9A8n/n
JsakoP9HAgTvNCuLgzf9ZxesNPuu4h4IEGVF30xGtcKHOFHZrVL4MMNm+3zaVY0B
OzdoqsNPBs7V1h/2BM6Q+PRm6wXS1gOZXQutV+0jqXNJ0nhL/WQ=
=aUO+
-----END PGP SIGNATURE-----

--wvvpgb3x5k3gray4--

--===============1507241439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1507241439==--
