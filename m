Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D8167BAC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FF26F3EF;
	Fri, 21 Feb 2020 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B8F6EE14
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:25:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CEE3522085;
 Thu, 20 Feb 2020 12:25:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=CmeCB3EedI4a6cWfKVdd/aDqAGy
 NtRjQTLkKMzwbjVw=; b=nTKo5PKjyq1NZxjw2fBMnS1gEb72o3x2VarDP8wMIBX
 mvsSxAh0WI87NeM/0jWE7yYPXLX8b/fHWd5IzodG9Fr1iUTMCWcrrlB7POHcfczH
 00gtZTLAgXEkVjolqBjcy91vXe3w8Uvd/UE43VFaBJqiOQEVAZ1vhevBrlBXYAvD
 Mb100qku+sgsLzE+CFf3EIQP33ktZH1Sk1fOTZccL6kbpUF/ZZtWidmCZxOXimoe
 KdffWN2ZSKgNAnZjihwyYOQJ4Iy3J41rOEVgY/2DFlIfS7/yrujlzLZk8iPU3vAX
 scqQ7IOmqIXYpx/w03mWaDb+fBSbzMy6HF0Z9A95UPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CmeCB3
 EedI4a6cWfKVdd/aDqAGyNtRjQTLkKMzwbjVw=; b=NfzWIUGidz0DyNGf8iTI9F
 MPMgfxJ+ofG7dFjM/AlLZShZWpiWNU0ncYPXnQEAKmG0gz8xhDEfYEDPhVQCMA4k
 hf2Fov4AZm0a5H6imgpc/brzbaosv24+agYlKqZ6GKgo7hN7sTHAiVZv6TaMCXZ/
 08RcpGNj/fktMc8/JFJ8v3ZWII8inDte+L0FWNJ36lEUTTDP7sA5UNAzUYSH5+2x
 mXYUzEnuI6Itu3dySNAUw4l94vw9BDVrJVzXBwI7ez6zF9NNfM+QWFPCBByDsWS4
 BncBbk+cn2eIgO43Y/rsBx9KDI9BLT8zohzl1YD04Eo1EXX5DhzT6L/+80DQdDvw
 ==
X-ME-Sender: <xms:-cBOXv88wPuMH1Llg_UxFyu9nT6vA7c8hruXgoGrhofOXkkcGY48GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-cBOXjTyMwBnhd-563HYuuyq6YuTeUGkRZBwdg_dS0yJJn2HtwIiSA>
 <xmx:-cBOXkn14MXT89knvPLbxLKp85rlEfpjRmelxVRGA-tE6m1Iq8GTCg>
 <xmx:-cBOXraNplfJQ27KkI-_mkGnekuNBSawhVgc4JQ8k0xYCD-lcAl3Tw>
 <xmx:-cBOXq4xkfQBLiLS-vZCiInT5w63KndcSnrhxj6ArMMVKOl-zYn4bQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 723713280063;
 Thu, 20 Feb 2020 12:25:13 -0500 (EST)
Date: Thu, 20 Feb 2020 18:25:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 5/5] drm/sun4i: tcon: Support LVDS output on Allwinner A20
Message-ID: <20200220172512.dmjtqgyay73x3ubx@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
 <20200219180858.4806-6-andrey.lebedev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200219180858.4806-6-andrey.lebedev@gmail.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0746606786=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0746606786==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qbnnqotkbijgn4ey"
Content-Disposition: inline


--qbnnqotkbijgn4ey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 08:08:58PM +0200, Andrey Lebedev wrote:
> From: Andrey Lebedev <andrey@lebedev.lt>
>
> A20 SoC (found in Cubieboard 2 among others) requires different LVDS set
> up procedure than A33. Timing controller (tcon) driver only implements
> sun6i-style procedure, that doesn't work on A20 (sun7i).
>
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 37 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.h | 11 +++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index b7234eef3c7b..09ee6e8c6914 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -114,6 +114,30 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
>  	}
>  }
>
> +static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
> +				      const struct drm_encoder *encoder)
> +{
> +	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> +		     SUN4I_TCON0_LVDS_ANA0_CK_EN |
> +		     SUN4I_TCON0_LVDS_ANA0_REG_V |
> +		     SUN4I_TCON0_LVDS_ANA0_REG_C |
> +		     SUN4I_TCON0_LVDS_ANA0_EN_MB |
> +		     SUN4I_TCON0_LVDS_ANA0_PD |
> +		     SUN4I_TCON0_LVDS_ANA0_DCHS);
> +
> +	udelay(2); /* delay at least 1200 ns */
> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
> +			   SUN4I_TCON0_LVDS_ANA1_INIT,
> +			   SUN4I_TCON0_LVDS_ANA1_INIT);
> +	udelay(1); /* delay at least 120 ns */
> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
> +			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
> +			   SUN4I_TCON0_LVDS_ANA1_UPDATE);
> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> +			   SUN4I_TCON0_LVDS_ANA0_EN_MB,
> +			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
> +}
> +
>  static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
>  				      const struct drm_encoder *encoder)
>  {
> @@ -1455,7 +1479,18 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
>  	.dclk_min_div		= 1,
>  };
>
> +static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
> +	.supports_lvds		= true,
> +	.has_channel_0		= true,
> +	.has_channel_1		= true,
> +	.dclk_min_div		= 4,
> +	/* Same display pipeline structure as A10 */
> +	.set_mux		= sun4i_a10_tcon_set_mux,
> +	.setup_lvds_phy		= sun4i_tcon_setup_lvds_phy,
> +};
> +
>  static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
> +	.supports_lvds		= false,

False is already the default here.

I've removed it while applying

Maxime

--qbnnqotkbijgn4ey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7A+AAKCRDj7w1vZxhR
xayeAQDILhx+HqIc9ELL8w3aXArAebOzGMH9WytljuIvons+JAEA3kY2DIgA9alq
IOF7a7Q4pPKQWirbPIzwYsb2BRGiJQo=
=C6AH
-----END PGP SIGNATURE-----

--qbnnqotkbijgn4ey--

--===============0746606786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0746606786==--
