Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B7B2C551
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4590610E5FA;
	Tue, 19 Aug 2025 13:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q3G1JygH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056B10E5F9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:22:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC67E5C6360;
 Tue, 19 Aug 2025 13:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79861C4CEF1;
 Tue, 19 Aug 2025 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755609766;
 bh=7uyQh6ng4UOpHCO46GDHqraqGTXOJKWcZkd5oJvfD+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3G1JygHGEpQaYLN3dXx2P6KVJpyYJI91MWAZzSYkZTKxfrUvhEvvOHc8+30i+aHt
 f8hnnmYIhX32FmFZskkTtyu8ZNHrqzcdayN902gl3/arteItt2LMVuE2MCZrG7H4dP
 CQbA+btKqs6Ul3EMd3gHCO5pqfnsPWmtNwzL47DBd+PKxowRdf8IMjV+bZoGaX8sG9
 /uvvICYCUivh4vxSfoQxi8EtUpl7dCRPkNmw76jVm/dUdJ9385leA54cjTqUjpnSan
 XeNMoRDBpXNyoToGO33PCj3B8OuuhHV9QZNGxxGWBvsCrz4cWwEfYuFEx/q+LvbUBQ
 eHggfP7tWmH6Q==
Date: Tue, 19 Aug 2025 15:22:42 +0200
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
Message-ID: <5dc6mmx26aa6qoig5wkei2uozdjmx5r2uduhc5wtja7dhjdypj@fincrfpg5u3s>
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9365be0b-205e-4d59-ad18-c1924bf45277@emailsignatures365.codetwo.com>
 <20250819053205.9976-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ptrb773q7263qmge"
Content-Disposition: inline
In-Reply-To: <20250819053205.9976-3-mike.looijmans@topic.nl>
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


--ptrb773q7263qmge
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
MIME-Version: 1.0

On Tue, Aug 19, 2025 at 07:31:15AM +0200, Mike Looijmans wrote:
> The tmds181 and sn65dp159 are "retimers" and hence can be considered
> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
> FPGA into a valid HDMI signal, and it will typically be inserted
> between an encoder and hdmi-connector.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>=20
> Changes in v2:
> Use atomic_enable/disable
> Use #defines for bit fields in registers
> Allow HDMI 2 compliance
> Filter modes on clock range
> Use cross-over pixel frequency instead of manual overides
> Devicetree bindings according to standards
>=20
>  drivers/gpu/drm/bridge/Kconfig      |  11 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ti-tmds181.c | 561 ++++++++++++++++++++++++++++
>  3 files changed, 573 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
>=20
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index b9e0ca85226a..753177fc9b50 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
>  	help
>  	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
> =20
> +config DRM_TI_TMDS181
> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
> +	  The SN65DP159 provides output into a cable (source) whereas the
> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
> +	  can be set up as source or sink though.
> +
>  config DRM_TI_TPD12S015
>  	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index 245e8a27e3fc..f4b5089e903c 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>  obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
>  obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
> +obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
>  obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
>  obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
> diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridge=
/ti-tmds181.c
> new file mode 100644
> index 000000000000..34cbdb066820
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
> + *
> + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
> + *
> + * based on code
> + * Copyright (C) 2007 Hans Verkuil
> + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/i2c.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/ret=
imer");
> +MODULE_AUTHOR("Mike Looijmans");
> +MODULE_LICENSE("GPL");
> +
> +#define TMDS181_REG_ID		0
> +#define TMDS181_REG_REV		0x8
> +#define TMDS181_REG_CTRL9	0x9
> +/* Registers A and B have a volatile bit, but we don't use it, so cache =
is ok */
> +#define TMDS181_REG_CTRLA	0xA
> +#define TMDS181_REG_CTRLB	0xB
> +#define TMDS181_REG_CTRLC	0xC
> +#define TMDS181_REG_EQUALIZER	0xD
> +#define TMDS181_REG_EYESCAN	0xE
> +
> +#define TMDS181_CTRL9_SIG_EN			BIT(4)
> +#define TMDS181_CTRL9_PD_EN			BIT(3)
> +#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
> +#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
> +
> +#define TMDS181_CTRLA_MODE_SINK			BIT(7)
> +#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
> +#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
> +#define TMDS181_CTRLA_EQ_EN			BIT(4)
> +#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
> +#define TMDS181_CTRLA_APPLY			BIT(2)
> +#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
> +
> +#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
> +#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
> +#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
> +#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
> +#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
> +#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
> +
> +#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
> +#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
> +
> +#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
> +#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
> +#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
> +
> +#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
> +#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
> +#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
> +
> +/* Above this data rate HDMI2 standards apply (TX termination) */
> +#define HDMI2_PIXEL_RATE_KHZ	340000
> +
> +enum tmds181_chip {
> +	tmds181,
> +	dp159,
> +};
> +
> +struct tmds181_data {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct drm_bridge *next_bridge;
> +	struct drm_bridge bridge;
> +	u32 retimer_threshold_khz;
> +	enum tmds181_chip chip;
> +};
> +
> +static inline struct tmds181_data *
> +drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct tmds181_data, bridge);
> +}
> +
> +/* Set "apply" bit in control register after making changes */
> +static int tmds181_apply_changes(struct tmds181_data *data)
> +{
> +	return regmap_write_bits(data->regmap, TMDS181_REG_CTRLA,
> +				 TMDS181_CTRLA_APPLY, TMDS181_CTRLA_APPLY);
> +}
> +
> +static int tmds181_attach(struct drm_bridge *bridge,
> +			  enum drm_bridge_attach_flags flags)
> +{
> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> +				 flags);
> +}
> +
> +static enum drm_mode_status
> +tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_i=
nfo *info,
> +		   const struct drm_display_mode *mode)
> +{
> +	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit clock */
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;

I'm a bit confused by your comment here. Why do we care about the bit clock=
 here?

> +	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
> +	if (mode->crtc_clock > 350000)
> +		return MODE_CLOCK_HIGH;

And what do you call the "actual HDMI clock" and why wouldn't it be provide=
d?

> +	/*
> +	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
> +	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
> +	 */
> +	if (mode->clock > 600000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static void tmds181_enable(struct drm_bridge *bridge, struct drm_bridge_=
state *old_bridge_state)
> +{
> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
> +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> +	const struct drm_bridge_state *bridge_state;
> +	const struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +	unsigned int val;
> +
> +	/*
> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
> +	 * from the bridge to the encoder, to the connector and to the CRTC.
> +	 */
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	mode =3D &crtc_state->adjusted_mode;
> +
> +	/* Set retimer/redriver mode based on pixel clock */
> +	val =3D mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_F=
UNC_MODE : 0;
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
> +			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
> +
> +	/* Configure TX termination based on pixel clock */
> +	val =3D mode->clock > HDMI2_PIXEL_RATE_KHZ ?
> +				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
> +				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
> +			   TMDS181_CTRLB_TX_TERM_CTL,
> +			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
> +
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
> +			   TMDS181_CTRL9_PD_EN, 0);
> +}
> +
> +static void tmds181_disable(struct drm_bridge *bridge, struct drm_bridge=
_state *old_bridge_state)
> +{
> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
> +
> +	/* Set the PD_EN bit */
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
> +			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
> +}
> +
> +static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
> +	.attach		=3D tmds181_attach,
> +	.mode_valid	=3D tmds181_mode_valid,
> +	.atomic_enable	=3D tmds181_enable,
> +	.atomic_disable	=3D tmds181_disable,
> +
> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +};
> +
> +static const char * const tmds181_modes[] =3D {
> +	"redriver",
> +	"auto1",
> +	"auto2",
> +	"retimer",
> +};
> +
> +static ssize_t mode_show(struct device *dev, struct device_attribute *at=
tr,
> +			 char *buf)
> +{
> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
> +	const char *equalizer;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val & BIT(4)) {
> +		if (val & BIT(5))
> +			equalizer =3D "eq-adaptive";
> +		else
> +			equalizer =3D "eq-fixed";
> +	} else {
> +		equalizer =3D "eq-disabled";
> +	}
> +
> +	return scnprintf(buf, PAGE_SIZE, "%6s %s %s\n",
> +			(val & BIT(7)) ? "sink" : "source",
> +			tmds181_modes[val & 0x03],
> +			equalizer);
> +}
> +
> +static ssize_t mode_store(struct device *dev, struct device_attribute *a=
ttr,
> +			  const char *buf, size_t len)
> +{
> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +	int i;
> +
> +	/* Strip trailing newline(s) for being user friendly */
> +	while (len && buf[len] =3D=3D '\n')
> +		--len;
> +
> +	/* Need at least 4 actual characters */
> +	if (len < 4)
> +		return -EINVAL;
> +
> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(tmds181_modes); ++i) {
> +		if (strncmp(tmds181_modes[i], buf, len) =3D=3D 0) {
> +			val &=3D ~TMDS181_CTRLA_DEV_FUNC_MODE;
> +			val |=3D FIELD_PREP(TMDS181_CTRLA_DEV_FUNC_MODE, i);
> +			break;
> +		}
> +	}
> +
> +	if (strncmp("sink", buf, len) =3D=3D 0)
> +		val |=3D TMDS181_CTRLA_MODE_SINK;
> +
> +	if (strncmp("source", buf, len) =3D=3D 0)
> +		val &=3D ~TMDS181_CTRLA_MODE_SINK;
> +
> +	if (strncmp("eq-", buf, 3) =3D=3D 0) {
> +		switch (buf[3]) {
> +		case 'a': /* adaptive */
> +			val |=3D TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN;
> +			break;
> +		case 'f': /* fixed */
> +			val |=3D TMDS181_CTRLA_EQ_EN;
> +			val &=3D ~TMDS181_CTRLA_EQ_ADA_EN;
> +			break;
> +		case 'd': /* disable */
> +			val &=3D ~(TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN);
> +			break;
> +		}
> +	}
> +
> +	/* Always set the "apply changes" bit */
> +	val |=3D TMDS181_CTRLA_APPLY;
> +
> +	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLA, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return len;
> +}

The datasheet seems to define when to use a mode over another. Why would
we want to force it over what it requires?

What happens if that change is made during an atomic_commit?

> +/* termination for HDMI TX: 0=3Doff, 1=3D150..300, 3=3D75..150 ohms */
> +static ssize_t termination_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u\n",
> +			 FIELD_GET(TMDS181_CTRLB_TX_TERM_CTL, val));
> +}
> +
> +static ssize_t termination_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t len)
> +{
> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
> +	u32 val;
> +	unsigned long newval;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D kstrtoul((const char *) buf, 10, &newval);
> +	if (ret)
> +		return ret;
> +
> +	if (newval > 3)
> +		return -EINVAL;
> +
> +	val &=3D ~TMDS181_CTRLB_TX_TERM_CTL;
> +	val |=3D FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, newval);
> +
> +	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return len;
> +}

Same question. The datasheet defines which termination to use based on
the pixel clock. Why should we want anything else?

Also, since it's in userspace, where is the documentation and userspace
code using that API?

> +static DEVICE_ATTR_RW(mode);
> +static DEVICE_ATTR_RW(termination);
> +
> +static struct attribute *tmds181_attrs[] =3D {
> +	&dev_attr_mode.attr,
> +	&dev_attr_termination.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tmds181_attr_group =3D {
> +	.attrs =3D tmds181_attrs,
> +};
> +
> +static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
> +static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
> +
> +static int tmds181_check_id(struct tmds181_data *data)
> +{
> +	int ret;
> +	int retry;
> +	u8 buffer[8];
> +
> +	for (retry =3D 0; retry < 20; ++retry) {
> +		ret =3D regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
> +				       sizeof(buffer));
> +		if (!ret)
> +			break;
> +
> +		/* Compensate for very long OE power-up delays due to the cap */
> +		usleep_range(5000, 10000);
> +	}
> +
> +	if (ret) {
> +		dev_err(&data->client->dev, "I2C read ID failed\n");
> +		return ret;
> +	}
> +
> +	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) =3D=3D 0) {
> +		dev_info(&data->client->dev, "Detected: TMDS181\n");
> +		data->chip =3D tmds181;
> +		return 0;
> +	}
> +
> +	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
> +		dev_info(&data->client->dev, "Detected: DP159\n");
> +		data->chip =3D dp159;
> +		return 0;
> +	}
> +
> +	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer), =
buffer);
> +
> +	return -ENODEV;
> +}
> +
> +static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int =
reg)
> +{
> +	switch (reg) {
> +	/* IBERT result and status registers, not used yet */
> +	case 0x15:
> +	case 0x17 ... 0x1F:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config tmds181_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.cache_type =3D REGCACHE_RBTREE,
> +	.max_register =3D 0x20,
> +	.volatile_reg =3D tmds181_regmap_is_volatile,
> +};
> +
> +static int tmds181_probe(struct i2c_client *client)
> +{
> +	struct tmds181_data *data;
> +	struct gpio_desc *oe_gpio;
> +	int ret;
> +	u32 param;
> +	u8 val;
> +
> +	/* Check if the adapter supports the needed features */
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -EIO;
> +
> +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;

devm_drm_bridge_alloc()

Maxime

--ptrb773q7263qmge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKR6ogAKCRAnX84Zoj2+
dgJlAX9qRGmJ2k72QTSOW+EcRvs0LYzI5Xqao/Iz/rmmpg8Vqmdb4pH2f0xk9ext
FXF3U9QBgNGx8gBR8unS0vXLAaDELcnytWrGBkCsCGiGyysHu1wJHNKVikMnYSrw
zJ2XHm7iCg==
=Mndq
-----END PGP SIGNATURE-----

--ptrb773q7263qmge--
