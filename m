Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CFAE01E1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 11:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD3F10E9D9;
	Thu, 19 Jun 2025 09:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z8Y5iCsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF710E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 09:41:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8837849ED0;
 Thu, 19 Jun 2025 09:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E180DC4CEEA;
 Thu, 19 Jun 2025 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750326067;
 bh=Kea1oGq0yOrLu69nIByO29Ka/lkhBMFN6/dXmxK9I0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8Y5iCsAl2phyZcuyWyv8duKIXc887sVB47l6bRCpzmc4Xbr0XWbLUvt1ziZfatUi
 3ekTefmuEILKNt1sH/ppGjAR/JNE2A/1f/eS/cAF8/FB+NpTEnfiTDLyr6UJZTlEFp
 RCnLJV+gOCOc5pNY6Mxx4x6HO/9nnPAPUT/xHt5Q4P3zllQ7mZoBnbRCpAXtWFEHjI
 1bVbYbziUxxlyc8JgJFkXVxDcWw9Yg5ub1W6Bq1Z8qypHiM329AJRuSghjqetJh/Pk
 NcbJed5IR/1gIwh5JmljBkPt9Fqspue8HM0ctlOPId/AbF9yuCyQrB0pNJk91dV+Su
 uxHZIX0zC81GA==
Date: Thu, 19 Jun 2025 11:41:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
Message-ID: <20250619-nondescript-holistic-ostrich-6d1efc@houat>
References: <20250526114353.12081-1-clamor95@gmail.com>
 <20250526114353.12081-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gif2fpgroucfpfxk"
Content-Disposition: inline
In-Reply-To: <20250526114353.12081-3-clamor95@gmail.com>
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


--gif2fpgroucfpfxk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
MIME-Version: 1.0

On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *host,
> +					 const struct mipi_dsi_msg *msg)
> +{
> +	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> +	struct mipi_dsi_device *dsi_dev = priv->output.dev;
> +	u8 buf = *(u8 *)msg->tx_buf;
> +	u16 config;
> +	int ret;
> +
> +	if (!priv->enabled) {
> +		dev_err(priv->dev, "Bridge is not enabled\n");
> +		return -ENODEV;
> +	}

Transfers can and should happen even when the bridge is disabled. The
hardware might not permit that, but you'll need to elaborate in the
comment about why.

> +	if (msg->rx_len) {
> +		dev_warn(priv->dev, "MIPI rx is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	guard(mutex)(&priv->mlock);
> +
> +	ret = ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &config);
> +	if (ret)
> +		return ret;
> +
> +	switch (msg->type) {
> +	case MIPI_DSI_DCS_SHORT_WRITE:
> +	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> +	case MIPI_DSI_DCS_LONG_WRITE:
> +		config |= SSD2825_CONF_REG_DCS;
> +		break;
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> +	case MIPI_DSI_GENERIC_LONG_WRITE:
> +		config &= ~SSD2825_CONF_REG_DCS;
> +		break;
> +	case MIPI_DSI_DCS_READ:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> +	default:
> +		return 0;
> +	}
> +
> +	ret = ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> +	if (ret)
> +		return ret;
> +
> +	ret = ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	ret = ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> +	if (ret)
> +		return ret;
> +
> +	if (buf == MIPI_DCS_SET_DISPLAY_ON) {
> +		/*
> +		 * NOTE! This is here since it cannot be called in bridge enable because
> +		 * bridge pre enable and bridge enable have no gap in between.
> +		 *
> +		 * Existing framework bridge-panel seq is:
> +		 *	panel_prepare > bridge_pre_enable > bridge_enable > panel_enable
> +		 *
> +		 * Using prepare_prev_first was tested, but it switches seq like this:
> +		 *	bridge_pre_enable > panel_prepare > bridge_enable > panel_enable
> +		 *
> +		 * This will not work since panel hw MUST be prepared before bridge is
> +		 * configured. Correct seq should be:
> +		 *	panel_prepare > bridge_pre_enable > panel_enable > bridge_enable

Where is that requirement coming from?

panel prepare is documented as:

  The .prepare() function is typically called before the display controller
  starts to transmit video data.


And video data transmission for bridges only happen at bridge_enable
time.

So, from an API PoV, all the sequences above are correct.

> +		 * Last two functions should be swapped related to existing framework.
> +		 * I am not aware about method which allows that.
> +		 *
> +		 * Once there will be such method/flag, code below should be moved into
> +		 * bridge_enable since it is basically a bridge configuration completing
> +		 * after initial panel DSI sequence is completed.
> +		 */

If there's anything to fix, we should do it before introducing that
driver.

> +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +	struct mipi_dsi_device *dsi_dev = priv->output.dev;
> +	const struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +	u32 input_bus_flags = bridge->timings->input_bus_flags;
> +	u16 flags = 0, config;
> +	u8 pixel_format;
> +	int ret;
> +
> +	if (priv->enabled)
> +		return;

What is this guarding against?

> +	/* Power Sequence */
> +	ret = clk_prepare_enable(priv->tx_clk);
> +	if (ret)
> +		dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), priv->supplies);
> +	if (ret)
> +		dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
> +
> +	usleep_range(1000, 2000);
> +
> +	ssd2825_hw_reset(priv);
> +
> +	/* Perform SW reset */
> +	ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> +
> +	/* Set pixel format */
> +	switch (dsi_dev->format) {
> +	case MIPI_DSI_FMT_RGB565:
> +		pixel_format = 0x00;
> +		break;
> +	case MIPI_DSI_FMT_RGB666_PACKED:
> +		pixel_format = 0x01;
> +		break;
> +	case MIPI_DSI_FMT_RGB666:
> +		pixel_format = 0x02;
> +		break;
> +	case MIPI_DSI_FMT_RGB888:
> +	default:
> +		pixel_format = 0x03;
> +		break;
> +	}
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	mode = &crtc_state->adjusted_mode;
> +
> +	/* Set panel timings */
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> +			  ((mode->vtotal - mode->vsync_end) << 8) |
> +			  (mode->htotal - mode->hsync_end));
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> +			  ((mode->vtotal - mode->vsync_start) << 8) |
> +			  (mode->htotal - mode->hsync_start));
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> +			  ((mode->vsync_start - mode->vdisplay) << 8) |
> +			  (mode->hsync_start - mode->hdisplay));
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode->hdisplay);
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode->vdisplay);
> +
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		flags |= SSD2825_HSYNC_HIGH;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		flags |= SSD2825_VSYNC_HIGH;
> +
> +	if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		flags |= SSD2825_NON_BURST_EV;
> +
> +	if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> +		flags |= SSD2825_PCKL_HIGH;
> +
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, flags | pixel_format);
> +	ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev->lanes - 1);
> +	ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> +
> +	/* Call PLL configuration */
> +	ssd2825_setup_pll(priv, mode);
> +
> +	usleep_range(10000, 11000);
> +
> +	config = SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD2825_CONF_REG_DCS |
> +		 SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> +
> +	if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> +		config &= ~SSD2825_CONF_REG_HS;
> +
> +	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> +		config &= ~SSD2825_CONF_REG_EOT;
> +
> +	/* Initial DSI configuration register set */
> +	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> +	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> +
> +	priv->enabled = true;
> +}
> +
> +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	/* placeholder */
> +}

That doesn't work with any bridge or panel that doesn't require any DCS
command to power up, unfortunately.

> +static void ssd2825_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +	int ret;
> +
> +	if (!priv->enabled)
> +		return;
> +
> +	msleep(100);
> +
> +	/* Exit DSI configuration register set */
> +	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> +			  SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT);
> +	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> +
> +	/* HW disable */
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(ssd2825_supplies),
> +				     priv->supplies);
> +	if (ret < 0)
> +		dev_err(priv->dev, "error disabling regulators (%d)\n", ret);
> +
> +	clk_disable_unprepare(priv->tx_clk);
> +
> +	priv->enabled = false;
> +}
> +
> +static int ssd2825_bridge_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
> +				 flags);
> +}
> +
> +static enum drm_mode_status
> +ssd2825_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
> +			  const struct drm_display_mode *mode)
> +{
> +	if (mode->hdisplay > 1366)
> +		return MODE_H_ILLEGAL;
> +
> +	if (mode->vdisplay > 1366)
> +		return MODE_V_ILLEGAL;
> +
> +	return MODE_OK;
> +}
> +
> +static bool ssd2825_mode_fixup(struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       struct drm_display_mode *adjusted_mode)
> +{
> +	/* Default to positive sync */
> +
> +	if (!(adjusted_mode->flags &
> +	      (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
> +		adjusted_mode->flags |= DRM_MODE_FLAG_PHSYNC;
> +
> +	if (!(adjusted_mode->flags &
> +	      (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
> +		adjusted_mode->flags |= DRM_MODE_FLAG_PVSYNC;
> +
> +	return true;
> +}
> +
> +static const struct drm_bridge_funcs ssd2825_bridge_funcs = {
> +	.attach = ssd2825_bridge_attach,
> +	.mode_valid = ssd2825_bridge_mode_valid,
> +	.mode_fixup = ssd2825_mode_fixup,
> +
> +	.atomic_pre_enable = ssd2825_bridge_atomic_pre_enable,
> +	.atomic_enable = ssd2825_bridge_atomic_enable,
> +	.atomic_disable = ssd2825_bridge_atomic_disable,
> +
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +};
> +
> +static const struct drm_bridge_timings default_ssd2825_timings = {
> +	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE
> +		 | DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
> +		 | DRM_BUS_FLAG_DE_HIGH,
> +};
> +
> +static int ssd2825_probe(struct spi_device *spi)
> +{
> +	struct ssd2825_priv *priv;
> +	struct device *dev = &spi->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	/* Driver supports only 8 bit 3 Wire mode */
> +	spi->bits_per_word = 9;
> +
> +	ret = spi_setup(spi);
> +	if (ret)
> +		return ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

devm_drm_bridge_alloc()

> +	spi_set_drvdata(spi, priv);
> +	priv->spi = spi;
> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;

spi_set_drvdata and dev_set_drvdata are doing the same thing here.

Maxime

--gif2fpgroucfpfxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFPbKwAKCRAnX84Zoj2+
diB2AYCG7blGb/jNwt79YqDiXbKiSCGuqM51+CeIZ2l3gU0JVeqR17TfIbhPYp/5
dbcgsw4BgOwDnI9X2uxwBgQHy9iXgxgYw2DNPB9dQhRm0VKurWVoIjpYlmBFrStS
AknexqWYBw==
=PvzH
-----END PGP SIGNATURE-----

--gif2fpgroucfpfxk--
