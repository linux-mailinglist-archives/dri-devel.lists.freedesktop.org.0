Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBD4FBE5D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F6A10F267;
	Mon, 11 Apr 2022 14:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A110F267
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:08:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7BD5B5C0154;
 Mon, 11 Apr 2022 10:08:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Apr 2022 10:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1649686081; x=1649772481; bh=bfGmTzu1G0
 if/R4EHfaxRpk9Qy8B+I+nG3pBPzlqFag=; b=JdmWs+aEl8IxiRNNWYk9R5xve3
 mn5Kk8gzoj6qobT8pmp4SEFHkZlRQKRCrA5Rm2sjGbVCdkaF/3K4CGm/C9VUCtA+
 Wzz+gEEhZx5m6ySFmxHM5ODMnG94ruxvd1j5n1oE6IXb7PTspBeECWTp+qAwzyCn
 Jfpi5eC6D1cnZSnkarrVwTb4SjBUEfCkMIUMBj3S1C6sq7Pgxe/pedBrBqivdyL5
 3iJDJYjp71xe3zNTWpjvSu6O1WVIhi2kjbglOo5JZoSZeGaowgkXcgi8Q6Bk83ol
 wWquLahChUqjocDWkTg9w9pVmpy0N48pR0imbuE78Eb3dwrNVwuVTvoq7yZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649686081; x=
 1649772481; bh=bfGmTzu1G0if/R4EHfaxRpk9Qy8B+I+nG3pBPzlqFag=; b=E
 VYUwVpFxYA88MGSnoFdp8OPDMfY5E9q8V/62/xdVPZ2Ql0KopoBxj6t47lAoBR7u
 7osSWga8kbNqhos5sNgKiM47fs34Shpr/zwYXGJPvtGMyaVEdRYsnWPW9oGzx0mU
 iE+92cw+NRfMCxLvmhOJXFmnMaGknsOo+kX3MVvk0iL041sms8Bdi90ngYJ05aqw
 piiGtsPDzgkoLRZVHlZ7nxJOyy62WzQOwWYSc0RQu4e67UxB0yxPynPg+eIWGQ2Y
 CwzDaPgav2yC7gAEKeo8fjESrnMb5+zU6J8+ZoVZb6L79m8ZIzWS2M9midx1ZiyN
 BnsPu+ghBSWAfQBHFS4NQ==
X-ME-Sender: <xms:QDZUYp3nwm85wCVc_m4CdsZH7rXabu7yGLLgS4V5UAETgJEBpbDMKw>
 <xme:QDZUYgHIxaQ7OhfxmZ6IMsb1Q9X1xcACins1FKIFTXS9JjEsO87nftcxuA_Dv2ski
 cedQpanbfeD_gm_qHY>
X-ME-Received: <xmr:QDZUYp5mMxAOV7-Z4DNBYg8dPHk-JbE8nZcgvxw4AvRMWSZrnlPdjT2AMgYZBGTGGXOPd96yYSF4rX7gkFx-4vu2GOPLFbL98Ot-ADI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekiedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QDZUYm0RoPZY2LUUC-pzvEmlDfePjsuSmTqqW5Kz9V_9UEoqbDqqdA>
 <xmx:QDZUYsEdj6TZTxI07NIkf5amiU56yvlQub9PjAEUBtxY1LW91-gY6Q>
 <xmx:QDZUYn-tffKVY8MYtPn0WZz18jwLuuE0eVPWVhasGXv3AGCnpDOQwA>
 <xmx:QTZUYqULYUv5HwP4xaL6gktaHMrVkiS6EGGhXrDFqD-7rgO76lcWrA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 10:08:00 -0400 (EDT)
Date: Mon, 11 Apr 2022 16:07:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v0 07/10] phy: freescale: add Samsung HDMI PHY
Message-ID: <20220411140757.724qo6w3pxoihgwd@houat>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-8-l.stach@pengutronix.de>
 <20220411115922.luv2gyutdecvsxa3@houat>
 <f2fc68f6c2034546009c96658da0e63f191978d1.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="buxh2zhgj6qtfcrc"
Content-Disposition: inline
In-Reply-To: <f2fc68f6c2034546009c96658da0e63f191978d1.camel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, patchwork-lst@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--buxh2zhgj6qtfcrc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 02:20:22PM +0200, Lucas Stach wrote:
> Hi Maxime,
>=20
> Am Montag, dem 11.04.2022 um 13:59 +0200 schrieb Maxime Ripard:
> > Hi Lucas,
> >=20
> > On Wed, Apr 06, 2022 at 06:01:20PM +0200, Lucas Stach wrote:
> > > +static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> > > +					 unsigned long parent_rate)
> > > +{
> > > +	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> > > +
> > > +	if (!phy->cur_cfg)
> > > +		return 0;
> > > +
> > > +	return phy->cur_cfg->clk_rate;
> > > +}
> >=20
> > This means that the clock will return 0 at initialization, which will
> > throw the rate accounting in the CCF off.
> >=20
> > Returning 0 here isn't valid. Surely that phy has a default
> > configuration at boot that you could use to initialize a rate?
> >=20
> > See https://lore.kernel.org/linux-clk/20220408091037.2041955-1-maxime@c=
erno.tech/
>=20
> Thanks for the hint. I don't know the full history of this and surely I
> can use the register reset defaults to initialize the clock rate, but
> it still seems odd. A powered down clock generator, like the PLL in
> this PHY, is not actually putting out a clock at any rate, so 0 for the
> rate seems natural, so it's kind of a bad pitfall if the CCF can't deal
> with that.

Yeah, it's what that whole discussion has been about, but my
understanding is that clk_get_rate() (and thus .recalc_rate) don't
necessarily return the actual output rate in hardware, but the rate that
would be output if the clock was enabled.

Anyway, I've ping'd Stephen on IRC to see if he can clarifies this, we
won't have an issue on this before then I'm afraid :)

Maxime

--buxh2zhgj6qtfcrc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlQ2PQAKCRDj7w1vZxhR
xXDkAP93cwLcJdeklDCJsSAldhyh0WAGg/JE7pBpAEEjGffTAgEAgZpfIhFD672z
t+oxtMzXL0GHXKdzUY6Kch6Jn3vVtwc=
=QPPB
-----END PGP SIGNATURE-----

--buxh2zhgj6qtfcrc--
