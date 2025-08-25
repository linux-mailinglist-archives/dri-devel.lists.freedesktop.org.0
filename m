Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D7B342E3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D4210E497;
	Mon, 25 Aug 2025 14:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TYACNxds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FE510E497
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:14:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C871C44A92;
 Mon, 25 Aug 2025 14:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CC8C4CEED;
 Mon, 25 Aug 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756131266;
 bh=K3u5bT/ZtlXLNai7qoM2FPjXNdQzOUsxEXGyvPIo1fU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TYACNxdspJi5ThiynPHcr50ObHXj2Q67daq6qwZhNiuXLFds+YT7B4bwkJCQhoxOh
 +S7lrDX1ihqj0dmhnNfZenvjRPeG5XDEJouFSCBQRdG3NW2Gn/Jxt+q8ZYjOl2bvJF
 tCSS0soW1DTCrJ3PgVxDLJjQhxEJAEJX1Jx6U+6PubHw/1BrgUe0GyjqpVmQAmI1jv
 SP9aVWycBg2Hhvt9yz4eCUQjGr7e6H0wJuzAXnEJeHiHp0oRXDRQA8ZWxsfgpJu5wc
 xyE4A4TtsASQ1LuiOwSdjD05yTyL7ff5nwytgF9BDwMZTY0rYWlBsKC9RpJ+ZNSwD+
 prorSjO/f+VOw==
Date: Mon, 25 Aug 2025 16:14:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <20250825-red-bear-of-infinity-054eb7@houat>
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9365be0b-205e-4d59-ad18-c1924bf45277@emailsignatures365.codetwo.com>
 <20250819053205.9976-3-mike.looijmans@topic.nl>
 <5dc6mmx26aa6qoig5wkei2uozdjmx5r2uduhc5wtja7dhjdypj@fincrfpg5u3s>
 <7d57e55a-223f-4c3a-8806-1ea616b56d02@topic.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ufiibqftkvt6z4l5"
Content-Disposition: inline
In-Reply-To: <7d57e55a-223f-4c3a-8806-1ea616b56d02@topic.nl>
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


--ufiibqftkvt6z4l5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
MIME-Version: 1.0

On Tue, Aug 19, 2025 at 04:25:29PM +0200, Mike Looijmans wrote:
> On 19-08-2025 15:22, Maxime Ripard wrote:
> > On Tue, Aug 19, 2025 at 07:31:15AM +0200, Mike Looijmans wrote:
> > > The tmds181 and sn65dp159 are "retimers" and hence can be considered
> > > HDMI-to-HDMI bridges. Typical usage is to convert the output of an
> > > FPGA into a valid HDMI signal, and it will typically be inserted
> > > between an encoder and hdmi-connector.
> > >=20
> > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > ---
> > >=20
> > > Changes in v2:
> > > Use atomic_enable/disable
> > > Use #defines for bit fields in registers
> > > Allow HDMI 2 compliance
> > > Filter modes on clock range
> > > Use cross-over pixel frequency instead of manual overides
> > > Devicetree bindings according to standards
> > >=20
> > >   drivers/gpu/drm/bridge/Kconfig      |  11 +
> > >   drivers/gpu/drm/bridge/Makefile     |   1 +
> > >   drivers/gpu/drm/bridge/ti-tmds181.c | 561 +++++++++++++++++++++++++=
+++
> > >   3 files changed, 573 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/=
Kconfig
> > > index b9e0ca85226a..753177fc9b50 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
> > >   	help
> > >   	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
> > > +config DRM_TI_TMDS181
> > > +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge drive=
r"
> > > +	depends on OF
> > > +	select DRM_KMS_HELPER
> > > +	select REGMAP_I2C
> > > +	help
> > > +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
> > > +	  The SN65DP159 provides output into a cable (source) whereas the
> > > +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Eit=
her
> > > +	  can be set up as source or sink though.
> > > +
> > >   config DRM_TI_TPD12S015
> > >   	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
> > >   	depends on OF
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge=
/Makefile
> > > index 245e8a27e3fc..f4b5089e903c 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
> > >   obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
> > >   obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
> > >   obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
> > > +obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
> > >   obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
> > >   obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
> > >   obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
> > > diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/br=
idge/ti-tmds181.c
> > > new file mode 100644
> > > index 000000000000..34cbdb066820
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
> > > @@ -0,0 +1,561 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
> > > + *
> > > + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
> > > + *
> > > + * based on code
> > > + * Copyright (C) 2007 Hans Verkuil
> > > + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
> > > + */
> > > +
> > > +#include <linux/module.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/delay.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +
> > > +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver=
/retimer");
> > > +MODULE_AUTHOR("Mike Looijmans");
> > > +MODULE_LICENSE("GPL");
> > > +
> > > +#define TMDS181_REG_ID		0
> > > +#define TMDS181_REG_REV		0x8
> > > +#define TMDS181_REG_CTRL9	0x9
> > > +/* Registers A and B have a volatile bit, but we don't use it, so ca=
che is ok */
> > > +#define TMDS181_REG_CTRLA	0xA
> > > +#define TMDS181_REG_CTRLB	0xB
> > > +#define TMDS181_REG_CTRLC	0xC
> > > +#define TMDS181_REG_EQUALIZER	0xD
> > > +#define TMDS181_REG_EYESCAN	0xE
> > > +
> > > +#define TMDS181_CTRL9_SIG_EN			BIT(4)
> > > +#define TMDS181_CTRL9_PD_EN			BIT(3)
> > > +#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
> > > +#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
> > > +
> > > +#define TMDS181_CTRLA_MODE_SINK			BIT(7)
> > > +#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
> > > +#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
> > > +#define TMDS181_CTRLA_EQ_EN			BIT(4)
> > > +#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
> > > +#define TMDS181_CTRLA_APPLY			BIT(2)
> > > +#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
> > > +
> > > +#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
> > > +#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
> > > +#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
> > > +#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
> > > +#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
> > > +#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
> > > +
> > > +#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
> > > +#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
> > > +
> > > +#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
> > > +#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
> > > +#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
> > > +
> > > +#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
> > > +#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
> > > +#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
> > > +
> > > +/* Above this data rate HDMI2 standards apply (TX termination) */
> > > +#define HDMI2_PIXEL_RATE_KHZ	340000
> > > +
> > > +enum tmds181_chip {
> > > +	tmds181,
> > > +	dp159,
> > > +};
> > > +
> > > +struct tmds181_data {
> > > +	struct i2c_client *client;
> > > +	struct regmap *regmap;
> > > +	struct drm_bridge *next_bridge;
> > > +	struct drm_bridge bridge;
> > > +	u32 retimer_threshold_khz;
> > > +	enum tmds181_chip chip;
> > > +};
> > > +
> > > +static inline struct tmds181_data *
> > > +drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
> > > +{
> > > +	return container_of(bridge, struct tmds181_data, bridge);
> > > +}
> > > +
> > > +/* Set "apply" bit in control register after making changes */
> > > +static int tmds181_apply_changes(struct tmds181_data *data)
> > > +{
> > > +	return regmap_write_bits(data->regmap, TMDS181_REG_CTRLA,
> > > +				 TMDS181_CTRLA_APPLY, TMDS181_CTRLA_APPLY);
> > > +}
> > > +
> > > +static int tmds181_attach(struct drm_bridge *bridge,
> > > +			  enum drm_bridge_attach_flags flags)
> > > +{
> > > +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
> > > +
> > > +	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> > > +				 flags);
> > > +}
> > > +
> > > +static enum drm_mode_status
> > > +tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_displ=
ay_info *info,
> > > +		   const struct drm_display_mode *mode)
> > > +{
> > > +	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit clo=
ck */
> > > +	if (mode->clock < 25000)
> > > +		return MODE_CLOCK_LOW;
> > I'm a bit confused by your comment here. Why do we care about the bit c=
lock here?
>=20
> Purpose here is to filter out modes that certainly won't work. For exampl=
e,
> a standard 640x480 mode would have a 24MHz clock, which this chip doesn't
> support according to the datasheet.

Sure, but you're talking about the pixel clock here, not the bit clock.
So I'm still not sure why you need to mention it in the comment.

> > > +	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
> > > +	if (mode->crtc_clock > 350000)
> > > +		return MODE_CLOCK_HIGH;
> > And what do you call the "actual HDMI clock" and why wouldn't it be pro=
vided?
>=20
> The clock signal on the HDMI cable.

That's not mode->clock or mode->crtc_clock then. The datasheets mention
that it can go from 0.25 to 6 Gbps. That's the TMDS char rate, which is
calculated using drm_hdmi_compute_mode_clock().

> Again, aim is to block modes that certainly won't work.
>=20
> While developing the driver (and logging lots) the crtc_clock was
> often just "0".
>=20
> This is still tricky though. What if we'd have a DSI-to-HDMI bridge in
> between this and the crtc, and outputting a 4k display mode? The
> DSI-to-HDMI bridge output clock (to the retimer) won't match the CRTC
> clock, nor would it match the pixel clock (using 1/40 clock rate).

It's not tricky, really. DRM internals only ever talks in pixel clock
rates, ie assuming a pixel gets sent out for each clock cycle.

It will not be the case if the buses are somewhat-serial for example,
but it allows each bus driver to derive its own internal clock from the
pixel clock rate and its parameters.

So your example works just fine, because on the DSI bus and on the HDMI
bus, you'd still get the same pixel clock rate.

Maxime

--ufiibqftkvt6z4l5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKxvvwAKCRAnX84Zoj2+
drhcAYD5In3dxdYPlMQ5janY9tPdMsdSULyQot6o/2wRARULmQ4s0eKh30KatnzD
OVbmTpYBgO2mVqD6W6CZeWAQ2IksaX8hPym2+I+mfhqkmzZTWvvLHy2KtkKFExjz
1VIcQwKukw==
=0vDz
-----END PGP SIGNATURE-----

--ufiibqftkvt6z4l5--
