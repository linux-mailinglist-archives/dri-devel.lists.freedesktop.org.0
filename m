Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061075BFB27
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 11:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B96B10E900;
	Wed, 21 Sep 2022 09:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785610E8FA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 09:40:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 758385C0109;
 Wed, 21 Sep 2022 05:40:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Sep 2022 05:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663753215; x=1663839615; bh=bHNxd+Ro7X
 T+ixR5PLGBqNdPLzu/gP2nLcKYU85wYTA=; b=oi5ZzsTXfwOYalffdtk1mo6Fgj
 44cjYowYWqKgaW/JeZyZ7h23GiQuM2SoZ+4G4YujB+pbSBRX+UDYBPutQnNsvFX5
 +GQjz7A7Sgi0lwF6apgYY7cPcfoN/1Q1MjMGInmD9CtFvb/VkDrMAl1WyN3k0mA2
 +/A3lFu/KlhQF6so3zfJlT4R4sAYLxjBp6AXqflTmbCFMYVnjPJbhujWIk3lTdOn
 ffQV9UPp4obhrSNMFcpLxVaz4pDgcJz90dyb78+CF3X8xJB61igGWdHrsXFEFvsP
 OAGHDaUbDNsI8bNZF7Bxu8Hn0xdP7/nTck+wNzz1YmfVWwhE7DcNoYWk1xAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663753215; x=1663839615; bh=bHNxd+Ro7XT+ixR5PLGBqNdPLzu/
 gP2nLcKYU85wYTA=; b=tO4g35cdIfHkgzCLzreRUO0z6W2zl5VFEtPGSeODG+c0
 tHsCGJgmPvBUkqNwV3Aug3FiDxerTLbsBofYaoTMNfS5ljwSvBv8DZvZUF5rsLfP
 eExgW4m0IBWDJ/xFBu1wS+cFL/qPlhNS4XXBgZD87fRhME1VC/yPNT5k0f+mao5j
 M6C58Idex1tZ3sm900ON5Ml3teGUTuislUsp0hUR27IMQbdg74hSBMbm71BTt8s0
 juFeZC5W0x1qlnQeJSeRyDVLBvnJRPGpeqioKe3DTvJ7+fZtGAFCA54LxNg4GDiy
 6JvSJsSonqXCCskGsSui/tH2x7xuepRohxxj5BSF8g==
X-ME-Sender: <xms:_tsqYzYQlvafCdluuzQkbAXkcInUx9wjEPeD_oynb4PeRvtW5AV2Ag>
 <xme:_tsqYyaHM95mZLUPy4LrHyNtthfIOG7opkvuYVjDcpRFgdjKD10cTKlbDFxf8qKnc
 -kpkJudX-G-yHUZPko>
X-ME-Received: <xmr:_tsqY18HxWnD66Fw-AssA9B6BDjxrP_lgj61UTM54M0XnBYa0N5RCQDXrdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_9sqY5rp-n-vmmAzFjqhyIQNvyQkJrghI20Iv3p8lVdRd9q2blVrlg>
 <xmx:_9sqY-qW8Q2nJGz0X3EzM2uf93MZoaTSrYzzy7gL1uKRLMCTgi952A>
 <xmx:_9sqY_QZEoq94KxICe3ZGOqr4Nsf7MYa01usJbfVxVMiMCX4r4XK2Q>
 <xmx:_9sqY0hF6t8fUGETNdCmWUZ8mzoyO9p3xxpoATChfwW_1ctEk1MESg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 05:40:14 -0400 (EDT)
Date: Wed, 21 Sep 2022 11:40:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
Message-ID: <20220921094012.7q5gwuhcwlqpozhi@houat>
References: <20220801131113.182487-1-marex@denx.de>
 <41f661e5-adcd-3e42-df2f-5732b1e19125@denx.de>
 <20220919134329.nb75womf35jdae3h@houat>
 <b585326b-190f-67f0-2631-412310b6d285@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ymqpgufno32csc36"
Content-Disposition: inline
In-Reply-To: <b585326b-190f-67f0-2631-412310b6d285@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ymqpgufno32csc36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2022 at 08:17:11PM +0200, Marek Vasut wrote:
> On 9/19/22 15:43, Maxime Ripard wrote:
> > Hi,
>=20
> Hello Maxime,
>=20
> > On Sun, Sep 18, 2022 at 02:56:00PM +0200, Marek Vasut wrote:
> > > On 8/1/22 15:11, Marek Vasut wrote:
> > > > Fill in hs_rate and lp_rate to struct mipi_dsi_device for this brid=
ge and
> > > > adjust DSI input frequency calculations such that they expect the D=
SI host
> > > > to configure HS clock according to hs_rate.
> > > >=20
> > > > This is an optimization for the DSI burst mode case. In case the DS=
I device
> > > > supports DSI burst mode, it is recommended to operate the DSI inter=
face at
> > > > the highest possible HS clock frequency which the DSI device suppor=
ts. This
> > > > permits the DSI host to send as short as possible bursts of data on=
 the DSI
> > > > link and keep the DSI data lanes in LP mode otherwise, which reduce=
s power
> > > > consumption.
> > >=20
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Robert Foss <robert.foss@linaro.org>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > ---
> > > >    drivers/gpu/drm/bridge/ti-sn65dsi83.c | 25 +++++++++++++--------=
----
> > > >    1 file changed, 13 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/dr=
m/bridge/ti-sn65dsi83.c
> > > > index 14e7aa77e7584..b161f25c3a2f5 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > @@ -286,8 +286,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65d=
si83 *ctx,
> > > >    	return (mode_clock - 12500) / 25000;
> > > >    }
> > > > -static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
> > > > -				  const struct drm_display_mode *mode)
> > > > +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
> > > >    {
> > > >    	/*
> > > >    	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
> > > > @@ -303,20 +302,20 @@ static u8 sn65dsi83_get_dsi_range(struct sn65=
dsi83 *ctx,
> > > >    	 *  DSI_CLK =3D mode clock * bpp / dsi_data_lanes / 2
> > > >    	 * the 2 is there because the bus is DDR.
> > > >    	 */
> > > > -	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
> > > > -			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
> > > > -			    ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
> > > > +	return DIV_ROUND_UP(ctx->dsi->hs_rate, 5000000U);
> > > >    }
> > > > -static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
> > > > +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx,
> > > > +				const struct drm_display_mode *mode)
> > > >    {
> > > >    	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
> > > > -	unsigned int dsi_div =3D mipi_dsi_pixel_format_to_bpp(ctx->dsi->f=
ormat);
> > > > +	unsigned int dsi_div;
> > > > +	int mode_clock =3D mode->clock;
> > > > -	dsi_div /=3D ctx->dsi->lanes;
> > > > +	if (ctx->lvds_dual_link)
> > > > +		mode_clock /=3D 2;
> > > > -	if (!ctx->lvds_dual_link)
> > > > -		dsi_div /=3D 2;
> > > > +	dsi_div =3D (ctx->dsi->hs_rate / mode_clock) / 1000;
> > > >    	return dsi_div - 1;
> > > >    }
> > > > @@ -397,9 +396,9 @@ static void sn65dsi83_atomic_enable(struct drm_=
bridge *bridge,
> > > >    		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(c=
tx, mode)) |
> > > >    		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> > > >    	regmap_write(ctx->regmap, REG_DSI_CLK,
> > > > -		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, =
mode)));
> > > > +		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx))=
);
> > > >    	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> > > > -		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> > > > +		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx, m=
ode)));
> > > >    	/* Set number of DSI lanes and LVDS link config. */
> > > >    	regmap_write(ctx->regmap, REG_DSI_LANE,
> > > > @@ -643,6 +642,8 @@ static int sn65dsi83_host_attach(struct sn65dsi=
83 *ctx)
> > > >    	dsi->lanes =3D dsi_lanes;
> > > >    	dsi->format =3D MIPI_DSI_FMT_RGB888;
> > > >    	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_B=
URST;
> > > > +	dsi->hs_rate =3D 500000000;
> > > > +	dsi->lp_rate =3D 16000000;
> >=20
> > Let's leave aside the comment from Dave that the host might choose a
> > lower HS rate, we can indeed assume it's true for now.
> >=20
> > However.. Is there any guarantee that the host can even reach that
> > frequency in the first place? IIRC, the maximum rate a DSI host can
> > reach is implementation specific. So I'm not sure this solution flies.
> >=20
> > It's not clear to me from that patch what problem / issue it's supposed
> > to solve in the first place, but it really looks similar to the
> > discussion we had some time ago about that bridge that could only
> > operate at a set of fixed frequencies.
>=20
> The use of exact frequency on DSI HS clock for bridges which derive their
> PLL clock frequency from DSI HS clock discussion is separate a topic from
> this patch.

Sure, it just happens that the solution to that other patch would also be
a solution for this one.

> This patch is defining the maximum DSI HS clock frequency this bridge
> supports per datasheet (500 MHz) AND then assumes the DSI host would use
> that frequency on the DSI link (in burst mode, the highest frequency on t=
he
> link permits the link to be in LP mode for longest time and thus be as po=
wer
> efficient as possible).
>=20
> About the assumption -- currently the DSI HS clock frequency expected by =
the
> DSI bridge driver is calculated by its own driver-private formula ; the D=
SI
> HS clock frequency generated by the DSI host is calculated by the DSI host
> driver-private formula. Those two might not even match and thus each driv=
er
> might come to different DSI HS clock they expect or generate. This cannot
> work reliably.

I agree so far

> With this patch, it is at least possible for the DSI bridge driver to
> indicate what DSI HS clock it expects from the DSI host driver and what a=
re
> its maximum DSI HS clock. The DSI host driver can check the nearest bridge
> flags (to verify the bridge uses burst mode) and hs_rate and configure
> itself accordingly. If the DSI host cannot generate suitable DSI HS clock
> which the bridge expects, it should likely refuse to bind with the bridge
> (also read on below how to deal with this). I consider this an improvement
> over current situation which is a total guesswork.

But I disagree here. In the above paragraphs you mentioned that you are
making an assumption, which is then unreliable. Again, I agree with that
statement, but you then cannot advocate that it's a good solution. It's
a workaround at best, which kind of changes the semantics around hs_rate.

> Regarding DSI hosts which cannot generate the specified hs_rate , they
> should likely just reject binding with the DSI bridge.

That won't work in all situations. The constraints on the clock feeding
the DSI controller might have changed for example, and doesn't allow to
reach that frequency anymore.

And if the bandwidth is still enough to cover the data bandwidth, why
should we completely break the video pipeline, without any way to
recover?

> However, there has been a valid point raised that the highest DSI HS
> clock supported by the DSI bridge might not always be the desired
> clock, e.g. in case EMI reduction is required by lowering the clock. I
> would propose to add a DT property which would allow limiting the
> maximum DSI HS clock frequency per DSI OF graph link in the DT, and a
> helper which would check the DT property, compare it with bridge
> limits, and set hs_rate accordingly.
>=20
> This should work well for DSI burst mode links in general.

hs_rate is documented as "maximum lane frequency for high speed mode in
hertz". It's a maximum. You can't ask to every driver from now on to
treat it as the frequency that they have to apply. Or rather, you can do
that but it will require much more work than a single patch on a bridge.

And EMI reduction is fine, but that still doesn't address the fact that
the host might still not be able to provide that *maximum* frequency,
even after the EMI reduction. And, again, if there's still enough
bandwidth to send that video, there's no problem with that, we shouldn't
make it one.

> > You basically want to propagate the clock constraints along the bridge
> > chain, and make sure every body is fine with that. The most reasonable
> > would be to make it part of the bridge state, and possibly add a bunch
> > of extra functions to query the upstream bridge clock output for a given
> > state.
>=20
> The bridge hardware constraints are static, just like the bridge hardware
> itself, so they shouldn't be part of the bridge state, should they ?

Constraints are, sure. But the effective clock rate isn't a constraint,
it's a dynamic thing that will be affected by the mode, format, lanes,
etc. Most of them being part of the state.

> I agree we do need a way to implement frequency negotiation between DSI
> bridge and DSI host, but that's something which can be added on top of the
> actual bridge HW constraints, and yes, possibly by passing those dynamic
> constraints via bridge state.

I guess this is where we disagree. This is the first step to me.

Maxime

--ymqpgufno32csc36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYyrb/AAKCRDj7w1vZxhR
xZT4AQCzLA6lgw+xOza5vo8sADLhptYds6x9gTr4gIK+k+gS5QEAwfCrOI1esJD0
Q2rvxAHBKTV6wqfFpCwEvnnBgR7bPA4=
=Eqqg
-----END PGP SIGNATURE-----

--ymqpgufno32csc36--
