Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F899C569
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A4410E277;
	Mon, 14 Oct 2024 09:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UbHXaWex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B227810E277
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:22:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0CB6A4187B;
 Mon, 14 Oct 2024 09:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC3AC4CEC3;
 Mon, 14 Oct 2024 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728897723;
 bh=oUasyECg4FzObacLupjjvObgA7tfGWkxHT+TC+1yGPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UbHXaWexNkFk1Edhb6b1Fp7cfwIRRbsMGl/2PvmVIqAOQIKxwlxFZN5oKxhG7QJgw
 OtfqXhQunhfedm5BhVOMYFaxfYhTrnGuB0FtlndDBXnUcq/sxXBrbBPwh9mmWVZs96
 05mDtc5KDDDUPmmHxMdPfJWNU1ePzsXLrmznNl3ACUa1WbGmPlW1vRxS+xBxlIoHco
 hq8bh4vZ4chpPWiKs8JLBTCjtqgTCGC7bRwIvBzDH+6WCmYQ58ft/s+dO0G/Gm61dh
 0/h983VMnI7vCsTwQLqfIP/DxwFtuasDYAQEXWIL7ty8QL0HRqcHZCeRvzzMDvR9/7
 ghpZ2TdYYOQ6w==
Date: Mon, 14 Oct 2024 11:22:00 +0200
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
Message-ID: <20241014-meteoric-acrid-corgi-f81a04@houat>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-5-victor.liu@nxp.com>
 <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
 <5fb80bf6-96be-4654-bd54-dc4f1d5136ae@nxp.com>
 <20241011-mottled-translucent-dodo-8877e6@houat>
 <6be9d2ac-7e0b-4b6a-885d-ad40158a2998@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="w45doemgv4va56xv"
Content-Disposition: inline
In-Reply-To: <6be9d2ac-7e0b-4b6a-885d-ad40158a2998@nxp.com>
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


--w45doemgv4va56xv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 02:18:16PM GMT, Liu Ying wrote:
> On 10/11/2024, Maxime Ripard wrote:
> > On Mon, Sep 30, 2024 at 03:55:30PM GMT, Liu Ying wrote:
> >> On 09/30/2024, Maxime Ripard wrote:
> >>> On Mon, Sep 30, 2024 at 01:28:59PM GMT, Liu Ying wrote:
> >>>> Multiple display modes could be read from a display device's EDID.
> >>>> Use clk_round_rate() to validate the "ldb" clock rate for each mode
> >>>> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
> >>>>
> >>>> Also, if the "ldb" clock and the pixel clock are sibling in clock
> >>>> tree, use clk_round_rate() to validate the pixel clock rate against
> >>>> the "ldb" clock.  This is not done in display controller driver
> >>>> because drm_crtc_helper_funcs::mode_valid() may not decide to do
> >>>> the validation or not if multiple encoders are connected to the CRTC,
> >>>> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
> >>>> parallel display output simultaneously.
> >>>>
> >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>> ---
> >>>>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++++++++++++++++
> >>>>  1 file changed, 22 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/brid=
ge/fsl-ldb.c
> >>>> index b559f3e0bef6..ee8471c86617 100644
> >>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> >>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> >>>> @@ -11,6 +11,7 @@
> >>>>  #include <linux/of_graph.h>
> >>>>  #include <linux/platform_device.h>
> >>>>  #include <linux/regmap.h>
> >>>> +#include <linux/units.h>
> >>>> =20
> >>>>  #include <drm/drm_atomic_helper.h>
> >>>>  #include <drm/drm_bridge.h>
> >>>> @@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
> >>>>  	u32 lvds_ctrl;
> >>>>  	bool lvds_en_bit;
> >>>>  	bool single_ctrl_reg;
> >>>> +	bool ldb_clk_pixel_clk_sibling;
> >>>>  };
> >>>> =20
> >>>>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] =3D {
> >>>> @@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devd=
ata[] =3D {
> >>>>  	[IMX8MP_LDB] =3D {
> >>>>  		.ldb_ctrl =3D 0x5c,
> >>>>  		.lvds_ctrl =3D 0x128,
> >>>> +		.ldb_clk_pixel_clk_sibling =3D true,
> >>>>  	},
> >>>>  	[IMX93_LDB] =3D {
> >>>>  		.ldb_ctrl =3D 0x20,
> >>>>  		.lvds_ctrl =3D 0x24,
> >>>>  		.lvds_en_bit =3D true,
> >>>> +		.ldb_clk_pixel_clk_sibling =3D true,
> >>>>  	},
> >>>>  };
> >>>> =20
> >>>> @@ -269,11 +273,29 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
> >>>>  		   const struct drm_display_info *info,
> >>>>  		   const struct drm_display_mode *mode)
> >>>>  {
> >>>> +	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
> >>>>  	struct fsl_ldb *fsl_ldb =3D to_fsl_ldb(bridge);
> >>>> =20
> >>>>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> >>>>  		return MODE_CLOCK_HIGH;
> >>>> =20
> >>>> +	/* Validate "ldb" clock rate. */
> >>>> +	link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> >>>> +	if (link_freq !=3D clk_round_rate(fsl_ldb->clk, link_freq))
> >>>> +		return MODE_NOCLOCK;
> >>>> +
> >>>> +	/*
> >>>> +	 * Use "ldb" clock to validate pixel clock rate,
> >>>> +	 * if the two clocks are sibling.
> >>>> +	 */
> >>>> +	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
> >>>> +		pclk_rate =3D mode->clock * HZ_PER_KHZ;
> >>>> +
> >>>> +		rounded_pclk_rate =3D clk_round_rate(fsl_ldb->clk, pclk_rate);
> >>>> +		if (rounded_pclk_rate !=3D pclk_rate)
> >>>> +			return MODE_NOCLOCK;
> >>>> +	}
> >>>> +
> >>>
> >>> I guess this is to workaround the fact that the parent rate would be
> >>> changed, and thus the sibling rate as well? This should be documented=
 in
> >>> a comment if so.
> >>
> >> This is to workaround the fact that the display controller driver
> >> (lcdif_kms.c) cannot do the mode validation against pixel clock, as
> >> the commit message mentions.
> >=20
> > That part is still not super clear to me, but it's also not super
> > important to the discussion.
>=20
> As kerneldoc of drm_crtc_helper_funcs::mode_valid mentions that
> it is not allowed to look at anything else but the passed-in mode,
> it doesn't know of the connected encoder(s)/bridge(s) and thus
> cannot decide if it should do mode validation against pixel clock
> or not.  Encoder/bridge drivers could adjust pixel clock rates
> for display modes.  So, mode validation against pixel clock should
> be done in this bridge driver.
>=20
> In fact, the pixel clock should have been defined as a DT property
> in fsl,ldb.yaml because the clock routes to LDB as an input signal.
> However, it's too late...  If the DT property was defined in the
> first place, then this driver can naturally do mode validation
> against pixel clock instead of this workaround.
>=20
> >=20
> > My point is: from a clock API standpoint, there's absolutely no reason
> > to consider sibling clocks. clk_round_rate() should give you the rate
>=20
> Agree, but it's a workaround.
>=20
> > you want. If it affects other clocks it shouldn't, it's a clock driver
> > bug.
>=20
> The sibling clocks are the same type of clocks from HW design
> point of view and derived from the same clock parent/PLL.
> That's the reason why the workaround works.
>=20
> >=20
> > You might want to workaround it, but this is definitely not something
> > you should gloss over: it's a hack, it needs to be documented as such.
>=20
> I can add some documentation in next version to clarify this
> a bit.
>=20
> >=20
> >> The parent clock is IMX8MP_VIDEO_PLL1_OUT and it's clock rate is not
> >> supposed to be changed any more once IMX8MP_VIDEO_PLL1 clock rate is
> >> set by using DT assigned-clock-rates property.  For i.MX8MP EVK, the
> >> clock rate is assigned to 1039500000Hz in imx8mp.dtsi in media_blk_ctrl
> >> node.
> >=20
> > There's two things wrong with what you just described:
> >=20
> >   - assigned-clock-rates never provided the guarantee that the clock
> >     rate wouldn't change later on. So if you rely on that, here's your
> >     first bug.
>=20
> I'm not relying on that.

Sure you do. If anything in the kernel changes the rate of the
VIDEO_PLL1 clock, then it's game over and "clock rate is not supposed to
be changed any more once IMX8MP_VIDEO_PLL1 clock rate is set by using DT
assigned-clock-rates property." isn't true anymore.

> Instead, the PLL clock rate is not supposed to change since
> IMX8MP_CLK_MEDIA_LDB clock("ldb" clock parent clock) hasn't the
> CLK_SET_RATE_PARENT flag. And, we don't want to change the PLL clock
> rate at runtime because the PLL can be used by i.MX8MP MIPI DSI and
> LDB display pipelines at the same time, driven by two LCDIFv3 display
> controllers respectively with two imx-lcdif KMS instances. We don't
> want to see the two display pipelines to step on each other.
>=20
> >=20
> >   - If the parent clock rate must not change, why does that clock has
> >     SET_RATE_PARENT then? Because that's the bug you're trying to work
> >     around.
>=20
> IMX8MP_CLK_MEDIA_LDB clock hasn't the CLK_SET_RATE_PARENT flag.
> I'm fine with the "ldb" clock tree from the current clock driver
> PoV - just trying to validate pixel clock rate as a workaround.

As far as I can see, the ldb clock is IMX8MP_CLK_MEDIA_LDB_ROOT in
imx8mp.dtsi. That clock is defined using imx_clk_hw_gate2_shared2 that
does set CLK_SET_RATE_PARENT.

Maxime

--w45doemgv4va56xv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwziuAAKCRAnX84Zoj2+
dr2LAX95pmyIbBkFFUEui7PiHgljiomXcZhA3D+PsqZIdS4fAHBL/ajvV12rKc90
zTNHIbgBf1l3pytylMUdDYO9YPSzR6ycdEshRcV+N97mR5qeuaBkQQVeovN7ptjq
kmV3iPlg3w==
=unJz
-----END PGP SIGNATURE-----

--w45doemgv4va56xv--
