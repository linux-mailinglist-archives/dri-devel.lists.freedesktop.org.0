Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCFD15D376
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603FB6E9D5;
	Fri, 14 Feb 2020 08:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3826E1B2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 09:32:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A87D921B10;
 Thu, 13 Feb 2020 04:32:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Feb 2020 04:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Ey3EA7WUbbmeV5n7kMrMdCyyznD
 m0vTJDaAlruj1gnU=; b=i97VZd/9GNZAjtj0WAWujKBQruiZpr1fTGGLbz4a/fY
 VcI6L0ybzMktkKLNLcv3UyargfMn3461dAQQGPehyyccrTJepn3WBxYrDpCnYC4L
 0Rappd73ZbAOE40lBPG1yMxr8K+mzcnB39nEBQGTkxMgLWaAXttqiiwVA93HSm8s
 j4pnZM+gnp0xSxaNycu1vDVDep1t+T2cYb3/LiPQBnNUzwnKstOeSkoGoux2jW/G
 pP0IS7+IKgPpG2sKl5wXcpVbr9WLjPPX1J3lVA5qqbMB/Pgfxy2D9mw4Db8Bl1v/
 MfLS3aU9Lo2f2CoWF8womYpJ4Lz4A2tmXXcyMScweSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ey3EA7
 WUbbmeV5n7kMrMdCyyznDm0vTJDaAlruj1gnU=; b=ga73dFyEur3SUiHoZPXxEq
 ooM3ogcq2Py7YtMDoKHRBaruljpqDDA+c+6d2IN8ObstCm92Nsq84yn4hs8Qpr66
 fuah3qIkWvYaxPLX6y0C8UA9AbpYgcHKhaFnmfoKPqinczRwjw09G/dNosvv+iQi
 I2h2SQPznox/JyEdiboUeV1bBtkREPcG+VidrnT3eKLHt97TfShe2ENAH3Zh19BA
 s0ivsodWXVhwpvcYFsR/nXRq5DM3ewCTQK2TM8BCDZMUpWXDSmFPDO12zl2Y2v1R
 p45Hn7aqKLuJqduEo0Ayj5x69dqspWJead5bZshzJhAWrbcrV+ytATqi9GSC9Vbw
 ==
X-ME-Sender: <xms:qxdFXo-4l7Jkp6yPfyCoZmBNZhsX4BqulMV_9APzxAEMZloqkBxRuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qxdFXn5--rb8WCpLWjgAi7hNbEBgCs5aP4S2UTzsdhzwhMpIl9csQw>
 <xmx:qxdFXtNvwbipmmOo5uURGeSFtcZ9DGMkPv8lfz3eogKIkAjFCsJ4NQ>
 <xmx:qxdFXp5PJG-EM99-7nSJXVckqPLfwh0jjK_-vwPfXbPtaraADyP7TA>
 <xmx:rRdFXv63GIF_XLfsRA_K-2lufdf0HVUHnLcjf2fq1RCVFJ-Ptv3A_g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7A633280063;
 Thu, 13 Feb 2020 04:32:27 -0500 (EST)
Date: Thu, 13 Feb 2020 10:32:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: andrey.lebedev@gmail.com
Subject: Re: [PATCH v2 1/2] ARM: sun7i: Support LVDS output on Allwinner A20
Message-ID: <20200213093226.7zpd4wmogad7mhus@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200212222355.17141-1-andrey.lebedev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200212222355.17141-1-andrey.lebedev@gmail.com>
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Content-Type: multipart/mixed; boundary="===============0274386127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0274386127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ehooxt5uoooo37qf"
Content-Disposition: inline


--ehooxt5uoooo37qf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The prefix of your title should be "drm/sun4i: tcon:" instead of "ARM:
sun7i:"

The latter would be if you were modifying files under arch/arm, but
you're modifying files in (drivers/gpu/)drm/sun4i :)

On Thu, Feb 13, 2020 at 12:23:55AM +0200, andrey.lebedev@gmail.com wrote:
> From: Andrey Lebedev <andrey@lebedev.lt>
>
> A20 SoC (found in Cubieboard 2 among others) requires different LVDS set
> up procedure than A33. Timing controller (tcon) driver only implements
> sun6i-style procedure, that doesn't work on A20 (sun7i).
>
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 95 ++++++++++++++++++++----------
>  drivers/gpu/drm/sun4i/sun4i_tcon.h | 14 +++++
>  2 files changed, 77 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index c81cdce6ed55..e4c605ca685e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -114,46 +114,73 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
>  	}
>  }
>
> +static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
> +				      const struct drm_encoder *encoder)
> +{
> +	u8 val;
> +
> +	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> +		     SUN6I_TCON0_LVDS_ANA0_C(2) |
> +		     SUN6I_TCON0_LVDS_ANA0_V(3) |
> +		     SUN6I_TCON0_LVDS_ANA0_PD(2) |
> +		     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
> +	udelay(2);
> +
> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> +			   SUN6I_TCON0_LVDS_ANA0_EN_MB,
> +			   SUN6I_TCON0_LVDS_ANA0_EN_MB);
> +	udelay(2);
> +
> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> +			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
> +			   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
> +
> +	if (sun4i_tcon_get_pixel_depth(encoder) == 18)
> +		val = 7;
> +	else
> +		val = 0xf;
> +
> +	regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> +			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
> +			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
> +
> +}
> +
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
> +

Patches should contain only one logical change, so ideally this should
be two patches: one to create the function pointer and fill it for the
A31 style setup, the other one to add support for the A20.

Also, you should have only a single line between the two functions and
the second should come before the first (alphabetical ordering).

Maxime

--ehooxt5uoooo37qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkUXqgAKCRDj7w1vZxhR
xZQGAQDUTFCN6+DkjlsVNmEY9E37DqXjqwoTNETsi+iwh7cWKAEA4Ii/GwiF0rQJ
YESBk436xBgh02h3ajh1wbBeS2l9tgM=
=VT2S
-----END PGP SIGNATURE-----

--ehooxt5uoooo37qf--

--===============0274386127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0274386127==--
