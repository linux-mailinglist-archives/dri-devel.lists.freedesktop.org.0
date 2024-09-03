Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A3969706
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8570F10E270;
	Tue,  3 Sep 2024 08:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MeZDbgvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65D810E307
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:28:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACB305C57C1;
 Tue,  3 Sep 2024 08:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5332DC4CEC4;
 Tue,  3 Sep 2024 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725352091;
 bh=2vmO40whD4KxOuL/zfxgcoBdpoYt/RmIIPf8OfLz+k0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MeZDbgvXqgpBINkwUE7Q2/jfrapSbjC0vcAZpuaOfHvkC+OzfEGLUlitfja8TmTfp
 FVUXbiL7wVUohsqotNV8e7CAMGaq57HIyjRwzDU6BgZGBxqNyNNMS10BV0gvzlrFUm
 cTWoHt3RQTUgE5X/dO+oEWeaxHKRUN9x7sCis+bhX8gA5FwX8vQwDmsnF8mTnaaADE
 sPad2WNRJdxauvpQ1IdVxBqJyhkdrkuLPTTvZ0FqbWm4XCA7ZAtdJGivzhzjNWRSl1
 vHV6ZKRh4LeHWni2kMkrDs1PeBUyJAEBkikbquDEXy9dN4c4Z1JitLQdM208eCwORB
 qZjiUE3UWx7Og==
Date: Tue, 3 Sep 2024 10:28:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, 
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, 
 "vkoul@kernel.org" <vkoul@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, 
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v16 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <20240903-gay-capable-hound-3cbef2@houat>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
 <359914108b879e995d4a39de32a33310009f0fab.1719903904.git.Sandor.yu@nxp.com>
 <20240702-quartz-salamander-of-culture-eec264@houat>
 <PAXPR04MB94480AB0490BBF00D2BA17BBF4932@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7aicz37iwjniln2o"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB94480AB0490BBF00D2BA17BBF4932@PAXPR04MB9448.eurprd04.prod.outlook.com>
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


--7aicz37iwjniln2o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2024 at 06:07:25AM GMT, Sandor Yu wrote:
> Hi Maxime,
>=20
> Thanks for your comments,
>=20
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > Maxime Ripard
> > Sent: 2024=E5=B9=B47=E6=9C=882=E6=97=A5 21:25
> > To: Sandor Yu <sandor.yu@nxp.com>
> > Cc: dmitry.baryshkov@linaro.org; andrzej.hajda@intel.com;
> > neil.armstrong@linaro.org; Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > kernel@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>; Oliver Brown
> > <oliver.brown@nxp.com>; alexander.stein@ew.tq-group.com;
> > sam@ravnborg.org
> > Subject: [EXT] Re: [PATCH v16 4/8] drm: bridge: Cadence: Add MHDP8501
> > DP/HDMI driver
> >=20
> > Hi,
> >=20
> > There's still the scrambler issue we discussed on v15, but I have some =
more
> > comments.
> >=20
> > On Tue, Jul 02, 2024 at 08:22:36PM GMT, Sandor Yu wrote:
> > > +enum drm_connector_status cdns_mhdp8501_detect(struct
> > > +cdns_mhdp8501_device *mhdp) {
> > > +	u8 hpd =3D 0xf;
> > > +
> > > +	hpd =3D cdns_mhdp8501_read_hpd(mhdp);
> > > +	if (hpd =3D=3D 1)
> > > +		return connector_status_connected;
> > > +	else if (hpd =3D=3D 0)
> > > +		return connector_status_disconnected;
> > > +
> > > +	dev_warn(mhdp->dev, "Unknown cable status, hdp=3D%u\n", hpd);
> > > +	return connector_status_unknown;
> > > +}
> > > +
> > > +static void hotplug_work_func(struct work_struct *work) {
> > > +	struct cdns_mhdp8501_device *mhdp =3D container_of(work,
> > > +						     struct cdns_mhdp8501_device,
> > > +						     hotplug_work.work);
> > > +	enum drm_connector_status status =3D cdns_mhdp8501_detect(mhdp);
> > > +
> > > +	drm_bridge_hpd_notify(&mhdp->bridge, status);
> > > +
> > > +	if (status =3D=3D connector_status_connected) {
> > > +		/* Cable connected  */
> > > +		DRM_INFO("HDMI/DP Cable Plug In\n");
> > > +		enable_irq(mhdp->irq[IRQ_OUT]);
> > > +	} else if (status =3D=3D connector_status_disconnected) {
> > > +		/* Cable Disconnected  */
> > > +		DRM_INFO("HDMI/DP Cable Plug Out\n");
> > > +		enable_irq(mhdp->irq[IRQ_IN]);
> > > +	}
> > > +}
> >=20
> > You shouldn't play with the interrupt being enabled here: hotplug inter=
rupts
> > should always enabled.
> >=20
> > If you can't for some reason, the reason should be documented in your d=
river.
>=20
> iMX8MQ have two HPD interrupters, one for plugout and the other for plugi=
n,
> because they could not be masked, so we have to enable one and disable th=
e other.
> I will add more comments here.

Right, but why do you need to enable and disable them? Do you get
spurious interrupts?

> >=20
> > > +	/* Mailbox protect for HDMI PHY access */
> > > +	mutex_lock(&mhdp->mbox_mutex);
> > > +	ret =3D phy_init(mhdp->phy);
> > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > > +		goto clk_disable;
> > > +	}
> > > +
> > > +	/* Mailbox protect for HDMI PHY access */
> > > +	mutex_lock(&mhdp->mbox_mutex);
> > > +	ret =3D phy_set_mode(mhdp->phy, phy_mode);
> > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to configure PHY: %d\n", ret);
> > > +		goto clk_disable;
> > > +	}
> >=20
> > Why do you need a shared mutex between the phy and HDMI controller?
>=20
> Both PHY and HDMI controller could access to the HDMI firmware by mailbox,
> So add mutex to avoid race condition.

That should be handled at either the phy or mailbox level, not in your
hdmi driver.

> >=20
> > > +static enum drm_mode_status
> > > +cdns_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> > > +			       const struct drm_display_mode *mode,
> > > +			       unsigned long long tmds_rate) {
> > > +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > +	union phy_configure_opts phy_cfg;
> > > +	int ret;
> > > +
> > > +	phy_cfg.hdmi.tmds_char_rate =3D tmds_rate;
> > > +
> > > +	/* Mailbox protect for HDMI PHY access */
> > > +	mutex_lock(&mhdp->mbox_mutex);
> > > +	ret =3D phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > +	if (ret < 0)
> > > +		return MODE_CLOCK_RANGE;
> > > +
> > > +	return MODE_OK;
> > > +}
> > > +
> > > +static enum drm_mode_status
> > > +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> > > +			    const struct drm_display_info *info,
> > > +			    const struct drm_display_mode *mode) {
> > > +	unsigned long long tmds_rate;
> > > +
> > > +	/* We don't support double-clocked and Interlaced modes */
> > > +	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> > > +	    mode->flags & DRM_MODE_FLAG_INTERLACE)
> > > +		return MODE_BAD;
> > > +
> > > +	/* MAX support pixel clock rate 594MHz */
> > > +	if (mode->clock > 594000)
> > > +		return MODE_CLOCK_HIGH;
> >=20
> > This needs to be in the tmds_char_rate_valid function
> This clock rate check is covered by function tmds_char_rate_valid()
> It could be removed if keep function tmds_char_rate_valid() be called by =
mode_valid.

Yeah, it's not something you should have to duplicate.

> >=20
> > > +	if (mode->hdisplay > 3840)
> > > +		return MODE_BAD_HVALUE;
> > > +
> > > +	if (mode->vdisplay > 2160)
> > > +		return MODE_BAD_VVALUE;
> > > +
> > > +	tmds_rate =3D mode->clock * 1000ULL;
> > > +	return cdns_hdmi_tmds_char_rate_valid(bridge, mode, tmds_rate);
> >=20
> > It will already be called by the core so this is redundant.
>=20
> mode_valid function is use to filter the mode list in drm_helper_probe_si=
ngle_connector_modes(),
> if function cdns_hdmi_tmds_char_rate_valid() is not called, unsupported m=
odes will in mode list.

It's probably something we should deal with in the core somehow. I'm not
entirely sure how to reconcile drm_bridge_connector and the hdmi
framework there, but we should at the very least provide a mode_valid
helper for bridges.

> >=20
> > > +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +					   struct drm_bridge_state *old_state) {
> > > +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > > +	struct drm_atomic_state *state =3D old_state->base.state;
> > > +	struct drm_connector *connector;
> > > +	struct video_info *video =3D &mhdp->video_info;
> > > +	struct drm_crtc_state *crtc_state;
> > > +	struct drm_connector_state *conn_state;
> > > +	struct drm_display_mode *mode =3D &mhdp->mode;
> > > +	union phy_configure_opts phy_cfg;
> > > +	int ret;
> > > +
> > > +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > > +							     bridge->encoder);
> > > +	if (WARN_ON(!connector))
> > > +		return;
> > > +
> > > +	mhdp->curr_conn =3D connector;
> > > +
> > > +	conn_state =3D drm_atomic_get_new_connector_state(state, connector);
> > > +	if (WARN_ON(!conn_state))
> > > +		return;
> > > +
> > > +	crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->crt=
c);
> > > +	if (WARN_ON(!crtc_state))
> > > +		return;
> > > +
> > > +	video->color_fmt =3D conn_state->hdmi.output_format;
> > > +	video->bpc =3D conn_state->hdmi.output_bpc;
> > > +
> > > +	drm_mode_copy(&mhdp->mode, &crtc_state->adjusted_mode);
> >=20
> > Why do you need a copy of all these fields? You should pass the connect=
or /
> > bridge state around and not copy these fields.
> >=20
> OK, mode will be removed, and it will replace by drm_connector_state.
>=20
> > > +	/* video mode check */
> > > +	if (mode->clock =3D=3D 0 || mode->hdisplay =3D=3D 0 || mode->vdispl=
ay =3D=3D 0)
> > > +		return;
> >=20
> > This should be checked in atomic_check, but I'm pretty sure it's redund=
ant.
> OK, It will be removed.
> >=20
> > > +	dev_dbg(mhdp->dev, "Mode: %dx%dp%d\n",
> > > +		mode->hdisplay, mode->vdisplay, mode->clock);
> > > +
> > > +	drm_atomic_helper_connector_hdmi_update_infoframes(connector,
> > > +state);
> > > +
> > > +	/* Line swapping */
> > > +	cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000 |
> > > +mhdp->lane_mapping);
> > > +
> > > +	mhdp->hdmi.char_rate =3D drm_hdmi_compute_mode_clock(mode,
> > > +							   mhdp->video_info.bpc,
> > > +							   mhdp->video_info.color_fmt);
> >=20
> > The TMDS char rate is already available in the connector_state so there=
 no
> > need to recompute it.
> >=20
> > > +	phy_cfg.hdmi.tmds_char_rate =3D mhdp->hdmi.char_rate;
> >=20
> > And you shouldn't store a copy either.
> OK, variable char_rate will be removed and will use the drm_connector_sta=
te-> hdmi.tmds_char_rate
>=20
> >=20
> > > +	/* Mailbox protect for HDMI PHY access */
> > > +	mutex_lock(&mhdp->mbox_mutex);
> > > +	ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > > +	mutex_unlock(&mhdp->mbox_mutex);
> > > +	if (ret) {
> > > +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > > +			__func__, ret);
> > > +		return;
> > > +	}
> > > +
> > > +	cdns_hdmi_sink_config(mhdp);
> > > +
> > > +	ret =3D cdns_hdmi_ctrl_init(mhdp);
> > > +	if (ret < 0) {
> > > +		dev_err(mhdp->dev, "%s, ret =3D %d\n", __func__, ret);
> > > +		return;
> > > +	}
> > > +
> > > +	/* Config GCP */
> > > +	if (mhdp->video_info.bpc =3D=3D 8)
> > > +		cdns_hdmi_disable_gcp(mhdp);
> > > +	else
> > > +		cdns_hdmi_enable_gcp(mhdp);
> > > +
> > > +	ret =3D cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
> > > +	if (ret < 0) {
> > > +		dev_err(mhdp->dev, "CDN_API_HDMITX_SetVic_blocking ret
> > =3D %d\n", ret);
> > > +		return;
> > > +	}
> > > +}
> > > +
> > > +static int cdns_hdmi_bridge_clear_infoframe(struct drm_bridge *bridg=
e,
> > > +					    enum hdmi_infoframe_type type) {
> > > +	return 0;
> > > +}
> >=20
> > Either implement it or don't, but an empty function is dead code.
> Must have function hdmi_clear_infoframe when set DRM_BRIDGE_OP_HDMI flag =
in &drm_bridge->ops,=20
> otherwise the drm_bridge_connector_init() will fail.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/drm_bridge_connector.c?h=3Dnext-20240902#n419

That's a strong hint that you should implement it, not workaround it :)

Maxime

--7aicz37iwjniln2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtbImAAKCRAnX84Zoj2+
dgGHAX9FDkhLFPtquyrUMgxPr9xY0ivsn0sWmHUKQ09hJXUEoHtpdPatT0QCOvzV
2AKWQMoBf0z6Lm15+lli3Igf3sSvOanU7WV5rlMuAlOiL8GCrKGv4Rcsvk04mUJP
0YTWhKrakw==
=IrmI
-----END PGP SIGNATURE-----

--7aicz37iwjniln2o--
