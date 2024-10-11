Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7175799A251
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 13:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0E10EAC7;
	Fri, 11 Oct 2024 11:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4OulmIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF8D10EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 11:06:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2EDE5A436A3;
 Fri, 11 Oct 2024 11:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161C6C4CEC3;
 Fri, 11 Oct 2024 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728644764;
 bh=+afMQpX0JvOchhAJniw8uaMvP8EFyAlup01m6OURoHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4OulmIhynqoIG6cwL/oDYypb1Cra/XDVG+ommmLbQdd01N081OD7DEn2cJTN38Q6
 vV0ypSvGHzSufSE0IfmSmLfO1Zh0quEYL3s9tE8ytn0H+tVzkMVvaMXo+HE0Ftv4GR
 fOAea25nsJcs8+hDeTZxyqO7SRZzOildiPxtaunCtqZrCIoSQfpSqhcI/8JKvVqeEl
 UulNNoD9fxKF3H9iEDegVSYgkZSz0vf5hj/mKPCegzGIgceyqsYaWH77Bm3OWNPMzW
 E2GhutJD20SAHv7tG85QM1KcaLx6GweMA05hawDIxPKPj8LSP1HjCPe68etrZClmGD
 xO9oZH3Tyi15A==
Date: Fri, 11 Oct 2024 13:06:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de, 
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
Subject: Re: [PATCH 4/8] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Message-ID: <20241011-mottled-translucent-dodo-8877e6@houat>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-5-victor.liu@nxp.com>
 <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
 <5fb80bf6-96be-4654-bd54-dc4f1d5136ae@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="x757sqlahb6r4ntt"
Content-Disposition: inline
In-Reply-To: <5fb80bf6-96be-4654-bd54-dc4f1d5136ae@nxp.com>
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


--x757sqlahb6r4ntt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 03:55:30PM GMT, Liu Ying wrote:
> On 09/30/2024, Maxime Ripard wrote:
> > On Mon, Sep 30, 2024 at 01:28:59PM GMT, Liu Ying wrote:
> >> Multiple display modes could be read from a display device's EDID.
> >> Use clk_round_rate() to validate the "ldb" clock rate for each mode
> >> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
> >>
> >> Also, if the "ldb" clock and the pixel clock are sibling in clock
> >> tree, use clk_round_rate() to validate the pixel clock rate against
> >> the "ldb" clock.  This is not done in display controller driver
> >> because drm_crtc_helper_funcs::mode_valid() may not decide to do
> >> the validation or not if multiple encoders are connected to the CRTC,
> >> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
> >> parallel display output simultaneously.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge=
/fsl-ldb.c
> >> index b559f3e0bef6..ee8471c86617 100644
> >> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> >> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> >> @@ -11,6 +11,7 @@
> >>  #include <linux/of_graph.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/regmap.h>
> >> +#include <linux/units.h>
> >> =20
> >>  #include <drm/drm_atomic_helper.h>
> >>  #include <drm/drm_bridge.h>
> >> @@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
> >>  	u32 lvds_ctrl;
> >>  	bool lvds_en_bit;
> >>  	bool single_ctrl_reg;
> >> +	bool ldb_clk_pixel_clk_sibling;
> >>  };
> >> =20
> >>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] =3D {
> >> @@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdat=
a[] =3D {
> >>  	[IMX8MP_LDB] =3D {
> >>  		.ldb_ctrl =3D 0x5c,
> >>  		.lvds_ctrl =3D 0x128,
> >> +		.ldb_clk_pixel_clk_sibling =3D true,
> >>  	},
> >>  	[IMX93_LDB] =3D {
> >>  		.ldb_ctrl =3D 0x20,
> >>  		.lvds_ctrl =3D 0x24,
> >>  		.lvds_en_bit =3D true,
> >> +		.ldb_clk_pixel_clk_sibling =3D true,
> >>  	},
> >>  };
> >> =20
> >> @@ -269,11 +273,29 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
> >>  		   const struct drm_display_info *info,
> >>  		   const struct drm_display_mode *mode)
> >>  {
> >> +	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
> >>  	struct fsl_ldb *fsl_ldb =3D to_fsl_ldb(bridge);
> >> =20
> >>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> >>  		return MODE_CLOCK_HIGH;
> >> =20
> >> +	/* Validate "ldb" clock rate. */
> >> +	link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> >> +	if (link_freq !=3D clk_round_rate(fsl_ldb->clk, link_freq))
> >> +		return MODE_NOCLOCK;
> >> +
> >> +	/*
> >> +	 * Use "ldb" clock to validate pixel clock rate,
> >> +	 * if the two clocks are sibling.
> >> +	 */
> >> +	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
> >> +		pclk_rate =3D mode->clock * HZ_PER_KHZ;
> >> +
> >> +		rounded_pclk_rate =3D clk_round_rate(fsl_ldb->clk, pclk_rate);
> >> +		if (rounded_pclk_rate !=3D pclk_rate)
> >> +			return MODE_NOCLOCK;
> >> +	}
> >> +
> >=20
> > I guess this is to workaround the fact that the parent rate would be
> > changed, and thus the sibling rate as well? This should be documented in
> > a comment if so.
>=20
> This is to workaround the fact that the display controller driver
> (lcdif_kms.c) cannot do the mode validation against pixel clock, as
> the commit message mentions.

That part is still not super clear to me, but it's also not super
important to the discussion.

My point is: from a clock API standpoint, there's absolutely no reason
to consider sibling clocks. clk_round_rate() should give you the rate
you want. If it affects other clocks it shouldn't, it's a clock driver
bug.

You might want to workaround it, but this is definitely not something
you should gloss over: it's a hack, it needs to be documented as such.

> The parent clock is IMX8MP_VIDEO_PLL1_OUT and it's clock rate is not
> supposed to be changed any more once IMX8MP_VIDEO_PLL1 clock rate is
> set by using DT assigned-clock-rates property.  For i.MX8MP EVK, the
> clock rate is assigned to 1039500000Hz in imx8mp.dtsi in media_blk_ctrl
> node.

There's two things wrong with what you just described:

  - assigned-clock-rates never provided the guarantee that the clock
    rate wouldn't change later on. So if you rely on that, here's your
    first bug.

  - If the parent clock rate must not change, why does that clock has
    SET_RATE_PARENT then? Because that's the bug you're trying to work
    around.

Maxime

--x757sqlahb6r4ntt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwkGmQAKCRAnX84Zoj2+
dpmzAX42+f8i9iWsZTTD5OGlkpoItRqHSN7O6d+7Lxr/b8KuqFcDNVloMtOgxtQ5
VJUOg80Bf1SKxcQSA71NDLJi1xYsqMWk43y5/K7Xr7fwOcMDdGqyODG1onnbtzsc
vPqFZLtSMQ==
=1Lq7
-----END PGP SIGNATURE-----

--x757sqlahb6r4ntt--
