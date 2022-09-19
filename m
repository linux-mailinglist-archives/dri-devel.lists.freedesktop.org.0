Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2615BCD72
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE9610E63F;
	Mon, 19 Sep 2022 13:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29B110E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:43:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1E8393200805;
 Mon, 19 Sep 2022 09:43:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 19 Sep 2022 09:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663595012; x=1663681412; bh=j1IDnZmIPS
 nqZblrXuvrnhVDRsdBeTSCWF9lWB28XC4=; b=CScmTOOYwfK9/qK8TPN1se8FwX
 E449mHKTUXf/GTXeF48qYMLOuypDNAZsvSVDQdAmyCa0orYdbsWNgrDUp7zGzGPG
 vje62qyilfWXa8j0gDu5+SzsPl0FHiP9o9QDsP1Fj9/S3SgJDJO4I8NXWn47b2Ae
 w1aLV0k95fivotsZdFPhcf2eDZ0hn0lNtzG7KXvYJ+GP2xLKW6l8NeOUo5riycHS
 U2DtXL9qmWHi2/z4ZIjGbJLi+4frWgt0KkB2F72TPtDuXW46VkOkk9yjIhJOlfPz
 UEYsIhdzEbrLF7TOZ3Lq7I4KNKwEYV6o+kL7rbXmvt+pkRh4Yi2FKNsmtGag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663595012; x=1663681412; bh=j1IDnZmIPSnqZblrXuvrnhVDRsdB
 eTSCWF9lWB28XC4=; b=e7LN74xl+Cds1J5X7aXy+qNXVbRL3yv3qWHv568XhPJW
 3RHmTTZLSPlR/3phN8kiuGIr2RZIPEgwebwaWdLhKzvTbgA0t5elGmWQFTq/RzBr
 +X+iGKafQxWuKNxi2QoeK2gJ58naYwKYfAXdPoRKVV4msE560I8ZebaCkx/56THn
 yyPy8XdfRq5ndcSCBKuMtR3GfcNpv4Mak27RiEjwd8PCAQiIZkIiP+2f/byN/x2X
 RMcKgRWu0kxMBEQ/qWBrsczco9yzAzEfMAwPfBK8NIAwQ3Bk39g8tvdYRY/8tDN+
 X/OhGhxuCOwiBrOvHUdQ4/axz960A3/qcavYGLDhXw==
X-ME-Sender: <xms:BHIoYyZ5HcZHwE5AzrDTr3NJrvF0QutGNVYqMLTDe3IRLVtRUlpfHA>
 <xme:BHIoY1bVYsDX8sIWD3nKE8DjMf5UsCrCCeA7K9npdvxjeqmmNUSwCnIUThuAeol-3
 svbkIKRCi8vgJKsVoY>
X-ME-Received: <xmr:BHIoY89xaOzxth9pz0DX1MZvY8pxMBO759EuY92eZvtFw0p8WSW0-mkdIbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvjedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BHIoY0rbbzBB_Su7iKYaZDTCJaYcUy7gC4gNfrcJJfqUZffLgrtbtQ>
 <xmx:BHIoY9qeIK_I7Y01_Q9JZvz6YpfZIdFqBdlCSbyOKBo8e92EZ2tpcA>
 <xmx:BHIoYyQbet0beuws7y0CHAMEEtYo66TSidAw5ScIhPOtw89enwsXFA>
 <xmx:BHIoY2CKXElejOQwPtT1nCTWLbNVepk69y-nHTuzDkOD8MZXepAPLA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 09:43:31 -0400 (EDT)
Date: Mon, 19 Sep 2022 15:43:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
Message-ID: <20220919134329.nb75womf35jdae3h@houat>
References: <20220801131113.182487-1-marex@denx.de>
 <41f661e5-adcd-3e42-df2f-5732b1e19125@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wbu3o3sx2utvlr6q"
Content-Disposition: inline
In-Reply-To: <41f661e5-adcd-3e42-df2f-5732b1e19125@denx.de>
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


--wbu3o3sx2utvlr6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 18, 2022 at 02:56:00PM +0200, Marek Vasut wrote:
> On 8/1/22 15:11, Marek Vasut wrote:
> > Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge a=
nd
> > adjust DSI input frequency calculations such that they expect the DSI h=
ost
> > to configure HS clock according to hs_rate.
> >=20
> > This is an optimization for the DSI burst mode case. In case the DSI de=
vice
> > supports DSI burst mode, it is recommended to operate the DSI interface=
 at
> > the highest possible HS clock frequency which the DSI device supports. =
This
> > permits the DSI host to send as short as possible bursts of data on the=
 DSI
> > link and keep the DSI data lanes in LP mode otherwise, which reduces po=
wer
> > consumption.
>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 25 +++++++++++++------------
> >   1 file changed, 13 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi83.c
> > index 14e7aa77e7584..b161f25c3a2f5 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -286,8 +286,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83=
 *ctx,
> >   	return (mode_clock - 12500) / 25000;
> >   }
> > -static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
> > -				  const struct drm_display_mode *mode)
> > +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
> >   {
> >   	/*
> >   	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
> > @@ -303,20 +302,20 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi8=
3 *ctx,
> >   	 *  DSI_CLK =3D mode clock * bpp / dsi_data_lanes / 2
> >   	 * the 2 is there because the bus is DDR.
> >   	 */
> > -	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
> > -			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
> > -			    ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
> > +	return DIV_ROUND_UP(ctx->dsi->hs_rate, 5000000U);
> >   }
> > -static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
> > +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx,
> > +				const struct drm_display_mode *mode)
> >   {
> >   	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
> > -	unsigned int dsi_div =3D mipi_dsi_pixel_format_to_bpp(ctx->dsi->forma=
t);
> > +	unsigned int dsi_div;
> > +	int mode_clock =3D mode->clock;
> > -	dsi_div /=3D ctx->dsi->lanes;
> > +	if (ctx->lvds_dual_link)
> > +		mode_clock /=3D 2;
> > -	if (!ctx->lvds_dual_link)
> > -		dsi_div /=3D 2;
> > +	dsi_div =3D (ctx->dsi->hs_rate / mode_clock) / 1000;
> >   	return dsi_div - 1;
> >   }
> > @@ -397,9 +396,9 @@ static void sn65dsi83_atomic_enable(struct drm_brid=
ge *bridge,
> >   		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, m=
ode)) |
> >   		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> >   	regmap_write(ctx->regmap, REG_DSI_CLK,
> > -		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, mode=
)));
> > +		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
> >   	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> > -		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> > +		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx, mode)=
));
> >   	/* Set number of DSI lanes and LVDS link config. */
> >   	regmap_write(ctx->regmap, REG_DSI_LANE,
> > @@ -643,6 +642,8 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *=
ctx)
> >   	dsi->lanes =3D dsi_lanes;
> >   	dsi->format =3D MIPI_DSI_FMT_RGB888;
> >   	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> > +	dsi->hs_rate =3D 500000000;
> > +	dsi->lp_rate =3D 16000000;

Let's leave aside the comment from Dave that the host might choose a
lower HS rate, we can indeed assume it's true for now.

However.. Is there any guarantee that the host can even reach that
frequency in the first place? IIRC, the maximum rate a DSI host can
reach is implementation specific. So I'm not sure this solution flies.

It's not clear to me from that patch what problem / issue it's supposed
to solve in the first place, but it really looks similar to the
discussion we had some time ago about that bridge that could only
operate at a set of fixed frequencies.

You basically want to propagate the clock constraints along the bridge
chain, and make sure every body is fine with that. The most reasonable
would be to make it part of the bridge state, and possibly add a bunch
of extra functions to query the upstream bridge clock output for a given
state.

Maxime

--wbu3o3sx2utvlr6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYyhyAQAKCRDj7w1vZxhR
xR0uAP9j/64gj13xebWVX2y7kj9Lk9DOxks8WmoSmMVDQOrzYgEAhiSOCccJsFNO
pRiN9QjumgrwwT9CHKJj8ehe6ttkoAk=
=c2vG
-----END PGP SIGNATURE-----

--wbu3o3sx2utvlr6q--
