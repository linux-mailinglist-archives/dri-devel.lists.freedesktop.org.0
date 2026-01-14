Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1217D1CFDC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423E10E2BE;
	Wed, 14 Jan 2026 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="x88kuLUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9908F10E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:02:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4B0061A2857;
 Wed, 14 Jan 2026 08:02:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0E5C76074A;
 Wed, 14 Jan 2026 08:02:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95556103C82AE; Wed, 14 Jan 2026 09:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768377762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OrlcgvLEASE7cgCAVQW4sEC2L2tinvXr+j0pOUZUjvY=;
 b=x88kuLUqFra37jp+2L7Hmyl1rJK9Luj34PccVPygGuBCC5mIUNebQlygEiXB90nJrOOq+B
 bdtRJbNiaHF/QALBf/DPpUr60ZpM5vhmVOXLlkv7oMKeKJQNP+BV4YdafCKgB1jDyaAPS2
 tq5kA2oEP25DWOWvI0u2Fyifk3icvqsLbMsUmjXV3ejO7GBvLUNaiqfEvB2ZkGbiC+5LTu
 zHYrpWi9KCbcQZYi3IgsxHlw0lA3zBo1u/c47qXxbQWSy3rWbbKhvEIWU87kPC41Ert43H
 A1ighEQjWb6vQJdU5S1OfOJxLVA3ZVpXbWi0B45Cr3vvnRFlbka6Iwu8FsX63Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 09:02:35 +0100
Message-Id: <DFO5LHWDD7S2.19P595M4CWIPI@bootlin.com>
Cc: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Marco Felsch" <m.felsch@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
X-Mailer: aerc 0.20.1
References: <20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de>
 <20260113-v6-18-topic-imx93-parallel-display-v8-2-4abccdc473a5@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-imx93-parallel-display-v8-2-4abccdc473a5@pengutronix.de>
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

Hello Marco, Liu,

On Tue Jan 13, 2026 at 8:07 PM CET, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuratio=
n.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.19-rc1]
> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> [m.felsch@pengutronix.de: add bus-width support]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

I'm sorry to be reviewing at v8 only, I hadn't noticed this series before.

> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 221 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 233 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index b9028a5e5a065c3237b404111d8df57e8e017f9d..181ee87bc0f9f65ee0b6e5edb=
b48ba808dfbb71f 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -99,4 +99,15 @@ config DRM_IMX93_MIPI_DSI
>  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
>  	  processor.
>
> +config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
> +	tristate "NXP i.MX91/i.MX93 parallel display format configuration"

Minor nit: this is a driver for a device, so calling it "configuration"
seems weird. From the code it looks like a device converting the color
format, so what about "NXP i.MX91/i.MX93 parallel display format
converter"?

[...]

> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct imx93_pdfc *pdfc;
> +	struct device_node *ep;
> +	int err;
> +
> +	pdfc =3D devm_drm_bridge_alloc(dev, struct imx93_pdfc, bridge, &funcs);
> +	if (IS_ERR(pdfc))
> +		return PTR_ERR(pdfc);
> +
> +	pdfc->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(pdfc->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
> +				     "failed to get regmap\n");
> +
> +	/* No limits per default */
> +	pdfc->phy_bus_width =3D 24;
> +
> +	/* Get output ep (port1/endpoint) */
> +	ep =3D of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> +	if (ep) {
> +		err =3D of_property_read_u32(ep, "bus-width", &pdfc->phy_bus_width);
> +		of_node_put(ep);
> +
> +		/* bus-width is optional but it must have valid data if present */
> +		if (err && err !=3D -EINVAL)
> +			return dev_err_probe(dev, err,
> +					     "failed to query bus-width\n");
> +	}
> +
> +	pdfc->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(pdfc->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	pdfc->dev =3D dev;
> +	pdfc->bridge.driver_private =3D pdfc;

pdfc embeds the struct drm_bridge, which is the mandatory design since
devm_drm_bridge_alloc() got added, so driver_private shouldn't be needed
anymore. Most drivers have a bridge_to_foo() inline function using
component_of() to get the private struct from the drm_bridge pointer,
e.g. [0] and [1].

[0] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/gpu/drm/bridge/=
simple-bridge.c#L39-L43
[1] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/gpu/drm/bridge/=
ti-sn65dsi83.c#L287-L290

A short discussion took place a few months ago about driver_private, kind
of suggesting it might be removed after all drivers have switched to
devm_drm_bridge_alloc(). I think we should at least not introduce new users
of driver_private at least.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
