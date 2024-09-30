Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB2989C79
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 10:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9F710E1BF;
	Mon, 30 Sep 2024 08:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AvE5aNbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B1910E1BF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 08:18:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6095DA4016A;
 Mon, 30 Sep 2024 08:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D941BC4CEC7;
 Mon, 30 Sep 2024 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727684288;
 bh=SInII8Bh1V2/a6fF+OScty0ect+SAo9SbH+FOzX+R4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AvE5aNbVsKzYVIscSLWbvzpknA33wVLpigLKu0ANl2s6/8Sp+4cdB5KKdwlgJikP1
 H6yEJwIOIsdzDm257aZR+XPfkAWsuOLORh1j7vxG7WYYxD3tquXRDTY7KT6cqv39gA
 4jyJ3OTa+zt/vkwLy4nlxfX5LEJ3xV1TJfbBa7WLM//1wo7qzVvPFUwdx9+kRu12J5
 CCPC1f+fKyltUA9UYYPK3pJkxGx/wO8tKEnXvGWpTROSnIoFaKsfZiSTz/9Z7ZQFz+
 YmKLSpzRGi05M0Wa98Zzymsg7ddYYmuZ2oUukSJ2U+B/7t4G6EcnRcU2HH1Eefu00p
 sCmex4Rz+WdEA==
Date: Mon, 30 Sep 2024 10:18:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sandor Yu <sandor.yu@nxp.com>, 
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
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
Subject: Re: [PATCH v17 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <wdelo4zco6v5qchdupfvbrqin4n7fyjyo6yaqbpfihdkkhceoi@ja4zxmhk5isq>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <8bdf573bfd7e3feb45d7ccb53765a978a685ce2d.1727159906.git.Sandor.yu@nxp.com>
 <20240924-mottled-psychedelic-lorikeet-ef8f4c@houat>
 <DB9PR04MB945284B95FAE4FE127E6568FF4752@DB9PR04MB9452.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xn5raseppdto4osu"
Content-Disposition: inline
In-Reply-To: <DB9PR04MB945284B95FAE4FE127E6568FF4752@DB9PR04MB9452.eurprd04.prod.outlook.com>
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


--xn5raseppdto4osu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 02:34:36AM GMT, Sandor Yu wrote:
> > > +static void cdns_hdmi_sink_config(struct cdns_mhdp8501_device *mhdp)
> > > +{
> > > +	struct drm_display_info *display =3D &mhdp->curr_conn->display_info;
> > > +	struct drm_connector_state *conn_state =3D mhdp->curr_conn->state;
> >=20
> > That looks a bit hackish to me. We should probably provide a helper to =
get the
> > connector state the bridge is attached to.
>=20
> How about code change to followed, is it more clear?
> 370         struct drm_connector *connector =3D mhdp->curr_conn;
> 371         struct drm_connector_state *conn_state =3D connector->state;
> 372         struct drm_display_info *display =3D &connector->display_info;
> 373         struct drm_scdc *scdc =3D &display->hdmi.scdc;

What I meant was that I wish bridges had a way to get their connector
pointer. It doesn't look like it's possible with drm_bridge_connector,
and we don't have access to drm_display_info anymore.

I don't really see a good way to do this yet, so maybe that kind of
workaround is ok. Eventually, I guess we'll have the scrambler setup in
the HDMI connector helpers anyway.

Dmitry, any idea?

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
> > > +	ret =3D phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
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
> > > +	if (mode->hdisplay > 3840)
> > > +		return MODE_BAD_HVALUE;
> > > +
> > > +	if (mode->vdisplay > 2160)
> > > +		return MODE_BAD_VVALUE;
> > > +
> > > +	tmds_rate =3D mode->clock * 1000ULL;
> > > +	return cdns_hdmi_tmds_char_rate_valid(bridge, mode, tmds_rate); }
> >=20
> > Didn't we agree on creating a mode_valid helper?
>=20
> In fact, now I'm no idea where should add the mode_valid helper function.
>=20
> In struct drm_bridge_funcs, it had mode_valid() and hdmi_tmds_char_rate_v=
alid().
>=20
> If create a new mode_valid helper function in struct drm_connector_hdmi_f=
uncs,
> Is it appropriate to call another API function(tmds_char_rate_valid)
> at the same level within this API function?

I'm not quite sure what you mean, but a reasonable approach to me would
be to turn drm_hdmi_state_helper.c hdmi_clock_valid into a public
function, and then call it from drm_bridge_connector mode_valid hook.

It's a similar discussion to the previous one really: in order to
implement it properly, we need access to drm_display_info.

Maxime

--xn5raseppdto4osu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvpetwAKCRAnX84Zoj2+
djfgAYCZaASwMfe2ykj0a/K8S1j5r3GzSEFIzakKBywubxq6GcozEOQ+mxz87A86
cv/NELIBf0DTXPsTAXCviErr47lI3nve1omF4vQyAP+zb2jBvRypL75ULr+xiBwe
lVBTPB0JNA==
=FfFA
-----END PGP SIGNATURE-----

--xn5raseppdto4osu--
