Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C6984355
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8012110E2A6;
	Tue, 24 Sep 2024 10:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e/XEEtun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC1110E2A6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:16:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F050B5C136C;
 Tue, 24 Sep 2024 10:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC32C4CEC4;
 Tue, 24 Sep 2024 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727172990;
 bh=BIfBUYnZpf/ZbIfP5zMwi903n2DDlT4Z8VkDbMxBlx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e/XEEtun7n+xcrJRCsT9MSg8Idu+O8bc9THa6/VEHnvxOvfOU59/ePIm7qxbOi+X3
 lsJ39YQKcU3uIkNLszNz6MW5XvRi+ShFkdBCLjV9ZVU7h02uj/pdwPeUN44GB3xSir
 XziJBbr1XnkIGMG4/HdojdG9ux/nLeJ9xUd7yXzi5affi3PEE/wqZwbgZOGejtuf9W
 oZo3FjbM8xqh30fUnfPelddFBm++prvDkYXzWx24tCIrl7R4qWiuSWyn4Q7F2aarQe
 bM0SeKPjw72+1dHDMORFx1MIHitbFVM/mTvx2HDdpeWWx15v3AgyLKKyJFnhXhECpp
 ZzocJHYLqnkrw==
Date: Tue, 24 Sep 2024 12:16:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, 
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v17 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <20240924-mottled-psychedelic-lorikeet-ef8f4c@houat>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <8bdf573bfd7e3feb45d7ccb53765a978a685ce2d.1727159906.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ngfrob2xnxqm3qya"
Content-Disposition: inline
In-Reply-To: <8bdf573bfd7e3feb45d7ccb53765a978a685ce2d.1727159906.git.Sandor.yu@nxp.com>
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


--ngfrob2xnxqm3qya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:36:49PM GMT, Sandor Yu wrote:
> +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 status;
> +	int ret;
> +
> +	mutex_lock(&mhdp_mailbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_GENERAL,
> +				     GENERAL_GET_HPD_STATE, 0, NULL);
> +	if (ret)
> +		goto err_get_hpd;
> +
> +	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_GENERAL,
> +					    GENERAL_GET_HPD_STATE,
> +					    sizeof(status));
> +	if (ret)
> +		goto err_get_hpd;
> +
> +	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
> +	if (ret)
> +		goto err_get_hpd;
> +
> +	mutex_unlock(&mhdp_mailbox_mutex);

That's better I guess, but it's still not a good API design. If you
can't have concurrent accesses, then cdns_mhdp_mailbox_send et al.
should take the mutex themselves.

> +	return status;
> +
> +err_get_hpd:
> +	dev_err(mhdp->dev, "read hpd  failed: %d\n", ret);
> +	mutex_unlock(&mhdp_mailbox_mutex);
> +
> +	return ret;
> +}
> +
> +enum drm_connector_status cdns_mhdp8501_detect(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 hpd = 0xf;
> +
> +	hpd = cdns_mhdp8501_read_hpd(mhdp);
> +	if (hpd == 1)
> +		return connector_status_connected;
> +	else if (hpd == 0)
> +		return connector_status_disconnected;
> +
> +	dev_warn(mhdp->dev, "Unknown cable status, hdp=%u\n", hpd);

This is already logged, there's no need to add a message there.

> +	return connector_status_unknown;
> +}
> +
> +static void hotplug_work_func(struct work_struct *work)
> +{
> +	struct cdns_mhdp8501_device *mhdp = container_of(work,
> +						     struct cdns_mhdp8501_device,
> +						     hotplug_work.work);
> +	enum drm_connector_status status = cdns_mhdp8501_detect(mhdp);
> +
> +	drm_bridge_hpd_notify(&mhdp->bridge, status);
> +
> +	if (status == connector_status_connected) {
> +		/* Cable connected  */
> +		DRM_INFO("HDMI/DP Cable Plug In\n");

You might want to log it using drm_dev_debug, but anything else is a big
stretch.

> +		enable_irq(mhdp->irq[IRQ_OUT]);
> +
> +		/* Reset HDMI/DP link with sink */
> +		if (mhdp->connector_type == DRM_MODE_CONNECTOR_HDMIA)
> +			cdns_hdmi_reset_link(mhdp);
> +		else
> +			cdns_dp_check_link_state(mhdp);
> +
> +	} else if (status == connector_status_disconnected) {
> +		/* Cable Disconnected  */
> +		DRM_INFO("HDMI/DP Cable Plug Out\n");
> +		enable_irq(mhdp->irq[IRQ_IN]);
> +	}
> +}
> +
> +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data)
> +{
> +	struct cdns_mhdp8501_device *mhdp = data;
> +
> +	disable_irq_nosync(irq);
> +
> +	mod_delayed_work(system_wq, &mhdp->hotplug_work,
> +			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> +
> +	return IRQ_HANDLED;
> +}

disable_irq_nosync doesn't guarantee that you won't be called before
interrupts are reenabled. What will happen if this handler is called
multiple times?

> +
> +static int cdns_mhdp8501_dt_parse(struct cdns_mhdp8501_device *mhdp,
> +				  struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *remote;
> +
> +	remote = of_graph_get_remote_node(np, 1, 0);
> +	if (!remote) {
> +		dev_err(dev, "fail to get remote node\n");
> +		of_node_put(remote);
> +		return -EINVAL;
> +	}
> +
> +	/* get connector type */
> +	if (of_device_is_compatible(remote, "hdmi-connector")) {
> +		mhdp->connector_type = DRM_MODE_CONNECTOR_HDMIA;
> +
> +	} else if (of_device_is_compatible(remote, "dp-connector")) {
> +		mhdp->connector_type = DRM_MODE_CONNECTOR_DisplayPort;
> +
> +	} else {
> +		dev_err(dev, "Unknown connector type\n");
> +		of_node_put(remote);
> +		return -EINVAL;
> +	}
> +
> +	of_node_put(remote);
> +
> +	if (of_property_read_u32(np, "lane-mapping", &mhdp->lane_mapping)) {
> +		dev_warn(dev, "Failed to get lane_mapping - using default\n");

debug logging as well.

> +		mhdp->lane_mapping = LANE_MAPPING_FLIPPED;
> +	}
> +
> +	return true;
> +}
> +
> +static void cdns_mhdp8501_add_bridge(struct cdns_mhdp8501_device *mhdp)
> +{
> +	mhdp->bridge.type = mhdp->connector_type;
> +	mhdp->bridge.driver_private = mhdp;
> +	mhdp->bridge.of_node = mhdp->dev->of_node;
> +	mhdp->bridge.vendor = "NXP";
> +	mhdp->bridge.product = "i.MX8";
> +	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +			   DRM_BRIDGE_OP_HPD;
> +
> +	if (mhdp->connector_type == DRM_MODE_CONNECTOR_HDMIA) {
> +		mhdp->bridge.funcs = &cdns_hdmi_bridge_funcs;
> +		mhdp->bridge.ops |= DRM_BRIDGE_OP_HDMI;
> +	} else if (mhdp->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		mhdp->bridge.funcs = &cdns_dp_bridge_funcs;
> +	} else {
> +		dev_err(mhdp->dev, "Unsupported connector type!\n");
> +		return;
> +	}

If this function can error out, then it should return an error code.

> +static int cdns_hdmi_scdc_write(struct cdns_mhdp8501_device *mhdp, u8 addr, u8 value)
> +{
> +	u8 msg[5], reg[5];
> +	int ret;
> +
> +	msg[0] = 0x54;
> +	msg[1] = addr;
> +	msg[2] = 0;
> +	msg[3] = 1;
> +	msg[4] = value;
> +
> +	mutex_lock(&mhdp_mailbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_HDMI_TX, HDMI_TX_WRITE,
> +				     sizeof(msg), msg);
> +	if (ret)
> +		goto err_scdc_write;
> +
> +	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_HDMI_TX,
> +					    HDMI_TX_WRITE, sizeof(reg));
> +	if (ret)
> +		goto err_scdc_write;
> +
> +	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, reg, sizeof(reg));
> +	if (ret)
> +		goto err_scdc_write;
> +
> +	if (reg[0] != 0)
> +		ret = -EINVAL;
> +
> +err_scdc_write:
> +
> +	mutex_unlock(&mhdp_mailbox_mutex);
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "scdc write failed: %d\n", ret);
> +	return ret;
> +}

You should be using SCDC helpers there instead of hand crafting your
messages.

> +static void cdns_hdmi_sink_config(struct cdns_mhdp8501_device *mhdp)
> +{
> +	struct drm_display_info *display = &mhdp->curr_conn->display_info;
> +	struct drm_connector_state *conn_state = mhdp->curr_conn->state;

That looks a bit hackish to me. We should probably provide a helper to
get the connector state the bridge is attached to.

> +	struct drm_scdc *scdc = &mhdp->curr_conn->display_info.hdmi.scdc;
> +	u8 buff = 0;
> +
> +	/* check sink type (HDMI or DVI) */
> +	if (!display->is_hdmi) {
> +		mhdp->hdmi.hdmi_type = MODE_DVI;
> +		return;
> +	}
> +
> +	/* Default work in HDMI1.4 */
> +	mhdp->hdmi.hdmi_type = MODE_HDMI_1_4;
> +
> +	/* check sink support SCDC or not */
> +	if (!scdc->supported) {
> +		dev_info(mhdp->dev, "Sink Not Support SCDC\n");

drm_dev_debug

> +static enum drm_mode_status
> +cdns_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       unsigned long long tmds_rate)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	phy_cfg.hdmi.tmds_char_rate = tmds_rate;
> +
> +	ret = phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> +	if (ret < 0)
> +		return MODE_CLOCK_RANGE;
> +
> +	return MODE_OK;
> +}
> +
> +static enum drm_mode_status
> +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
> +			    const struct drm_display_mode *mode)
> +{
> +	unsigned long long tmds_rate;
> +
> +	/* We don't support double-clocked and Interlaced modes */
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> +	    mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return MODE_BAD;
> +
> +	if (mode->hdisplay > 3840)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay > 2160)
> +		return MODE_BAD_VVALUE;
> +
> +	tmds_rate = mode->clock * 1000ULL;
> +	return cdns_hdmi_tmds_char_rate_valid(bridge, mode, tmds_rate);
> +}

Didn't we agree on creating a mode_valid helper?

> +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	struct drm_atomic_state *state = old_state->base.state;
> +	struct drm_connector *connector;
> +	struct video_info *video_info = &mhdp->video_info;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector_state *conn_state;
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	mhdp->curr_conn = connector;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	video_info->color_fmt = conn_state->hdmi.output_format;
> +	video_info->bpc = conn_state->hdmi.output_bpc;
> +
> +	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> +
> +	/* Line swapping */
> +	cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000 | mhdp->lane_mapping);
> +
> +	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> +
> +	ret = phy_configure(mhdp->phy, &phy_cfg);
> +	if (ret) {
> +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	cdns_hdmi_sink_config(mhdp);
> +
> +	ret = cdns_hdmi_ctrl_init(mhdp);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "hdmi ctrl init failed = %d\n",  ret);
> +		return;
> +	}
> +
> +	/* Config GCP */
> +	if (video_info->bpc == 8)
> +		cdns_hdmi_disable_gcp(mhdp);
> +	else
> +		cdns_hdmi_enable_gcp(mhdp);
> +
> +	ret = cdns_hdmi_mode_config(mhdp, &crtc_state->adjusted_mode, video_info);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "CDN_API_HDMITX_SetVic_blocking ret = %d\n", ret);
> +		return;
> +	}

If the only thing you're doing is filling video_info and passing it
there, why do you need that structure at all? Just pass the
connector_state pointer.

Maxime

--ngfrob2xnxqm3qya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvKRewAKCRAnX84Zoj2+
dpoOAYD41qitcYXB5WaMdorEwUm7B3ubdFEWIJEps105LfIzrWMMbfSkRtfZG7ni
fXXk8SYBgMPje3xq+wu1oHYlR5nIMZEmr1YqTY+lLWWiy6a3nQVA+V10Ot8XDfeS
fT+tUGPLEg==
=5ACm
-----END PGP SIGNATURE-----

--ngfrob2xnxqm3qya--
