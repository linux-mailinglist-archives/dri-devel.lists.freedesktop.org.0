Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85C873A68
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3216C113263;
	Wed,  6 Mar 2024 15:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DD1IDXNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938E9113276
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:12:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B02DACE2241;
 Wed,  6 Mar 2024 15:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D39BC433C7;
 Wed,  6 Mar 2024 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709737927;
 bh=RkXvgfFkQeab6f37tUpRH2m7Hc4zq4G2QQFYL2agHN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DD1IDXNmd2Htv29SsgSyAU2hFP3h9kX8C2GCVtBUXQtN/aXH8PXn2lLuvXkHZ+Vgm
 i20lg50sutBkjRnMuWtuxpjmFeNe+ZZys5LS8C5YDqH+ZRrx+pGOXwuDwwsRbLYq7S
 9oTJmQHPvJNAY3HVBOtSf9+LL40f57ybK8qSOsEJ4R+Es7rNc8VW7vgQnMB5CoFzbW
 A+vCCYEIED6D5jhPbBnIqhi1m86tzqaINKuUi6M7SFMXZsCTwFGbuzRcxiWqyickpQ
 dZdsZQyd5B3EdrHSZlSpof+SIg6QQ58HkrDhQNe/iHIrkmQYYzk5vy+9rzMTdIlh8c
 2qiqyQ8nE9iMg==
Date: Wed, 6 Mar 2024 16:12:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v15 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <20240306-mysterious-hoatzin-of-faith-49aec0@houat>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lgqwn3iwtrpezttc"
Content-Disposition: inline
In-Reply-To: <20240306101625.795732-5-alexander.stein@ew.tq-group.com>
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


--lgqwn3iwtrpezttc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Mar 06, 2024 at 11:16:21AM +0100, Alexander Stein wrote:
> +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 status;
> +	int ret;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
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
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	return status;
> +
> +err_get_hpd:
> +	dev_err(mhdp->dev, "read hpd  failed: %d\n", ret);
> +	mutex_unlock(&mhdp->mbox_mutex);
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
> +		enable_irq(mhdp->irq[IRQ_OUT]);
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

AFAICT from the rest of the driver, you support HDMI modes with a
character rate > 340Mchar/s, and thus you need to enable the scrambler.

If you unplug/replug a monitor with the scrambler enabled though, and if
there's no userspace component to react to the userspace event, the code
you have here won't enable the scrambler again.

You can test that by using modetest with a 4k@60Hz mode or something,
and then disconnecting / reconnecting the monitor.

We addressed it in vc4 in commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset
link on hotplug").

Arguably, the whole handling of the HDMI scrambling setup should be
turned into a helper, and I wanted to extend the work I've been doing
around the HDMI infra to support the scrambler setup once it landed.

> +static int cdns_hdmi_mode_config(struct cdns_mhdp8501_device *mhdp,
> +				 struct drm_display_mode *mode,
> +				 struct video_info *video_info)
> +{
> +	int ret;
> +	u32 val;
> +	u32 vsync_lines = mode->vsync_end - mode->vsync_start;
> +	u32 eof_lines = mode->vsync_start - mode->vdisplay;
> +	u32 sof_lines = mode->vtotal - mode->vsync_end;
> +	u32 hblank = mode->htotal - mode->hdisplay;
> +	u32 hactive = mode->hdisplay;
> +	u32 vblank = mode->vtotal - mode->vdisplay;
> +	u32 vactive = mode->vdisplay;
> +	u32 hfront = mode->hsync_start - mode->hdisplay;
> +	u32 hback = mode->htotal - mode->hsync_end;
> +	u32 vfront = eof_lines;
> +	u32 hsync = hblank - hfront - hback;
> +	u32 vsync = vsync_lines;
> +	u32 vback = sof_lines;
> +	u32 v_h_polarity = ((mode->flags & DRM_MODE_FLAG_NHSYNC) ? 0 : 1) +
> +			((mode->flags & DRM_MODE_FLAG_NVSYNC) ? 0 : 2);
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_H_SIZE, (hactive << 16) + hblank);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_V_SIZE, (vactive << 16) + vblank);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_FRONT_WIDTH, (vfront << 16) + hfront);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_SYNC_WIDTH, (vsync << 16) + hsync);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_BACK_WIDTH, (vback << 16) + hback);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HSYNC2VSYNC_POL_CTRL, v_h_polarity);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Reset Data Enable */
> +	cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> +	val &= ~F_DATA_EN(1);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set bpc */
> +	val &= ~F_VIF_DATA_WIDTH(3);
> +	switch (video_info->bpc) {
> +	case 10:
> +		val |= F_VIF_DATA_WIDTH(1);
> +		break;
> +	case 12:
> +		val |= F_VIF_DATA_WIDTH(2);
> +		break;
> +	case 16:
> +		val |= F_VIF_DATA_WIDTH(3);
> +		break;
> +	case 8:
> +	default:
> +		val |= F_VIF_DATA_WIDTH(0);
> +		break;
> +	}
> +
> +	/* select color encoding */
> +	val &= ~F_HDMI_ENCODING(3);
> +	switch (video_info->color_fmt) {
> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		val |= F_HDMI_ENCODING(2);
> +		break;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		val |= F_HDMI_ENCODING(1);
> +		break;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		val |= F_HDMI_ENCODING(3);
> +		break;
> +	case DRM_COLOR_FORMAT_RGB444:
> +	default:
> +		val |= F_HDMI_ENCODING(0);
> +		break;
> +	}

It looks like you're only using RGB444?

> +static int cdns_hdmi_avi_info_set(struct cdns_mhdp8501_device *mhdp,
> +				  struct drm_display_mode *mode)
> +{
> +	struct hdmi_avi_infoframe frame;
> +	struct drm_connector_state *conn_state = mhdp->curr_conn->state;
> +	struct drm_display_mode *adj_mode;
> +	enum hdmi_quantization_range qr;
> +	u8 buf[32];
> +	int ret;
> +
> +	/* Initialise info frame from DRM mode */
> +	drm_hdmi_avi_infoframe_from_display_mode(&frame, mhdp->curr_conn, mode);
> +
> +	frame.colorspace = cdns_hdmi_colorspace(mhdp->video_info.color_fmt);
> +
> +	drm_hdmi_avi_infoframe_colorimetry(&frame, conn_state);
> +
> +	adj_mode = &mhdp->bridge.encoder->crtc->state->adjusted_mode;
> +
> +	qr = drm_default_rgb_quant_range(adj_mode);
> +
> +	drm_hdmi_avi_infoframe_quant_range(&frame, mhdp->curr_conn,
> +					   adj_mode, qr);
> +
> +	ret = hdmi_avi_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "failed to pack AVI infoframe: %d\n", ret);
> +		return -1;
> +	}
> +
> +	buf[0] = 0;
> +	cdns_hdmi_infoframe_set(mhdp, 0, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_AVI);
> +
> +	return 0;
> +}
> +
> +static void cdns_hdmi_vendor_info_set(struct cdns_mhdp8501_device *mhdp,
> +				      struct drm_display_mode *mode)
> +{
> +	struct hdmi_vendor_infoframe frame;
> +	u8 buf[32];
> +	int ret;
> +
> +	/* Initialise vendor frame from DRM mode */
> +	ret = drm_hdmi_vendor_infoframe_from_display_mode(&frame, mhdp->curr_conn, mode);
> +	if (ret < 0) {
> +		dev_info(mhdp->dev, "No vendor infoframe\n");
> +		return;
> +	}
> +
> +	ret = hdmi_vendor_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
> +	if (ret < 0) {
> +		dev_warn(mhdp->dev, "Unable to pack vendor infoframe: %d\n", ret);
> +		return;
> +	}
> +
> +	buf[0] = 0;
> +	cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_VENDOR);
> +}
> +
> +static void cdns_hdmi_drm_info_set(struct cdns_mhdp8501_device *mhdp)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct hdmi_drm_infoframe frame;
> +	u8 buf[32];
> +	int ret;
> +
> +	conn_state = mhdp->curr_conn->state;
> +
> +	if (!conn_state->hdr_output_metadata)
> +		return;
> +
> +	ret = drm_hdmi_infoframe_set_hdr_metadata(&frame, conn_state);
> +	if (ret < 0) {
> +		dev_dbg(mhdp->dev, "couldn't set HDR metadata in infoframe\n");
> +		return;
> +	}
> +
> +	ret = hdmi_drm_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
> +	if (ret < 0) {
> +		dev_dbg(mhdp->dev, "couldn't pack HDR infoframe\n");
> +		return;
> +	}
> +
> +	buf[0] = 0;
> +	cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_DRM);
> +}

This is another thing that was supposed to be handled by my current
series here:
https://lore.kernel.org/r/20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org

In particular, you're missing the SPD infoframes here.

> +static void cdns_hdmi_mode_set(struct cdns_mhdp8501_device *mhdp)
> +{

You should use atomic_enable here

> +	struct drm_display_mode *mode = &mhdp->mode;
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	/* video mode check */
> +	if (mode->clock == 0 || mode->hdisplay == 0 || mode->vdisplay == 0)
> +		return;
> +
> +	cdns_hdmi_lanes_config(mhdp);
> +
> +	phy_cfg.hdmi.pixel_clk_rate = mode->clock;
> +	phy_cfg.hdmi.bpc = mhdp->video_info.bpc;
> +	phy_cfg.hdmi.color_space = cdns_hdmi_colorspace(mhdp->video_info.color_fmt);
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_configure(mhdp->phy, &phy_cfg);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret) {
> +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	cdns_hdmi_sink_config(mhdp);
> +
> +	ret = cdns_hdmi_ctrl_init(mhdp, mhdp->hdmi.hdmi_type);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "%s, ret = %d\n", __func__, ret);
> +		return;
> +	}
> +
> +	/* Config GCP */
> +	if (mhdp->video_info.bpc == 8)
> +		cdns_hdmi_disable_gcp(mhdp);
> +	else
> +		cdns_hdmi_enable_gcp(mhdp);
> +
> +	ret = cdns_hdmi_avi_info_set(mhdp, mode);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "%s ret = %d\n", __func__, ret);
> +		return;
> +	}
> +
> +	/* vendor info frame is enabled only for HDMI1.4 4K mode */
> +	cdns_hdmi_vendor_info_set(mhdp, mode);
> +
> +	cdns_hdmi_drm_info_set(mhdp);
> +
> +	ret = cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "CDN_API_HDMITX_SetVic_blocking ret = %d\n", ret);
> +		return;
> +	}
> +}
> +
> +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(mhdp->dev, "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum drm_mode_status
> +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	enum drm_mode_status mode_status = MODE_OK;
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	/* We don't support double-clocked and Interlaced modes */
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> +	    mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return MODE_BAD;
> +
> +	/* MAX support pixel clock rate 594MHz */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->hdisplay > 3840)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay > 2160)
> +		return MODE_BAD_VVALUE;
> +
> +	/* Check modes supported by PHY */
> +	phy_cfg.hdmi.pixel_clk_rate = mode->clock;
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret < 0)
> +		return MODE_CLOCK_RANGE;
> +
> +	return mode_status;
> +}

mode_valid is only called when the userspace asks for the current modes
available on a connector, but not when the userspace programs a mode.
This is atomic_check's job, so you probably want to have a similar
atomic_check here.

> +static bool
> +cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> +			    const struct drm_display_mode *mode,
> +			    struct drm_display_mode *adjusted_mode)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	struct video_info *video = &mhdp->video_info;
> +
> +	/* The only currently supported format */
> +	video->bpc = 8;
> +	video->color_fmt = DRM_COLOR_FORMAT_RGB444;
> +
> +	return true;
> +}

mode_fixup is deprecated. I guess you wanted to use reset here.
Generally speaking, the bpc and color_format should be part of your
state anyway.

I know Dmitry was interested in plugging my HDMI series into the bridge
infrastructure. It would benefit your driver quite a lot I think, so you
probably want to sync up with him.

Maxime

--lgqwn3iwtrpezttc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeiHwwAKCRDj7w1vZxhR
xfDQAP98OUYzPDbd7t89OCitGUkIbsDS/ABj8YL94liZuqy66wD/Sou5Qp414MHB
mohzojfgJUYyXYSlQDYCjFwCjyOb0gs=
=ee0H
-----END PGP SIGNATURE-----

--lgqwn3iwtrpezttc--
