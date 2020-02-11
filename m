Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE7158A54
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058686EDB5;
	Tue, 11 Feb 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C086E6E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:20:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4EC2221C0F;
 Tue, 11 Feb 2020 02:20:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 11 Feb 2020 02:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=BU30pT44LeYjqGun9tCYcCsIKDQ
 26EjzbD9vWsO8Hk4=; b=cT+VkzidJxvWZvNBOZfS46qlXD1n3kMzoPEXeBcZbiv
 MYLbPwQf/KfbWBtE1al+zm8+lDYvS+RTCyMnDIi64aYWRa6p7NSGE84sCkZbBqVf
 OIEk0sf2nzi1p0SnYCwJQf/GCLFUtCwDObtpifn9tp/yAaNLSFze6Dk8WeNEM61U
 puDtmDNKM5OB0Oc/PWvwm2OPQj6+aNNiEwTnfRGs62uLN6YJaj7BEB0ejeeQx1Ai
 VLv4ZrOxmzFz4IBEM5JoPh+AARCPVPAFGHfN+KzSpY76P4gST2p5BF5iwT6EWMoo
 yJEURhKfule5UoOH+d94aJg7Q5TQL6sYyGHTgL+7SIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BU30pT
 44LeYjqGun9tCYcCsIKDQ26EjzbD9vWsO8Hk4=; b=4NgOeEleWgaGYA6AO3YAqB
 E/hjIUhUCGadDurB7nW0dgh4psqpdjQuOdb0pA2Z0r2lB3J3e6NgIOFE+hnnXPEB
 T/h/JPQzHhYTvr/LT2bZZweabe4jMi/cUYAzOJzRJOeSCcGQ1flP6+KRL7+36hyz
 8Wl22kqlTWNXI1P5NqCIv880/1/Ux19/GHYMyIdnxgedkBj66Deg0xpWHlDCUE71
 cjY1aTJuBYGsfsloXdCnLo2h9AkHNyG42jYefJNSxiif19G3aXO9xLXqjHELGmLm
 UI7N4JoTaVGm2kbhUKz6cEWE+BBuYd1i/wq8eaqaljGrQA1qGZaYQU1WEVjxuzFQ
 ==
X-ME-Sender: <xms:plVCXl4cif1LxJSmHn5w0D9a9vTDkgVDkIDeTNriHXFzKWKv5iBHWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedvgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:plVCXiWs7OhCqSHs03thXNB0Y-oKakEpoJbxesyoZZBnhb-ExMCUiQ>
 <xmx:plVCXtiOtSvg6tpcrMcghYwln7R9ucHPmaX9grCCynKaKo3ODtWkiw>
 <xmx:plVCXidVbu0QEnlAGDEh0t3m9yK2x2juH03UsyCO-v-u_u3d55e6zw>
 <xmx:rVVCXjQU0ZA8Tp0TqLyLUX6R1WYxeGYBGkOrwG5d5CaYeb9fY_UTmQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D4453280060;
 Tue, 11 Feb 2020 02:20:06 -0500 (EST)
Date: Tue, 11 Feb 2020 08:20:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200211072004.46tbqixn5ftilxae@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
MIME-Version: 1.0
In-Reply-To: <20200210195633.GA21832@kedthinkpad>
X-Mailman-Approved-At: Tue, 11 Feb 2020 07:26:04 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0804692815=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0804692815==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7u7alefvy7ml5d3s"
Content-Disposition: inline


--7u7alefvy7ml5d3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Feb 10, 2020 at 09:56:33PM +0200, Andrey Lebedev wrote:
> A20 SoC (found in Cubieboard 2 among others) requires different LVDS set
> up procedure than A33. Timing controller (tcon) driver only implements
> sun6i-style procedure, that doesn't work on A20 (sun7i).

You're missing your Signed-off-by here.

> The support for such procedure is ported from u-boot and follows u-boot
> naming convention: SUN6I* for sun6i-style procedure, and SUN4I for other
> (which happens to be compatible with A20).

A commit log is mostly about why you're doing a change, this part can
be left out.

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 91 ++++++++++++++++++++----------
>  drivers/gpu/drm/sun4i/sun4i_tcon.h | 12 ++++
>  2 files changed, 73 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index c81cdce6ed55..78896e907ca9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -114,46 +114,74 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
>  	}
>  }
>
> +static void sun4i_tcon_lvds_sun6i_enable(struct sun4i_tcon *tcon,
> +					 const struct drm_encoder *encoder) {

This doesn't match the kernel coding style, make sure to run checkpatch.

Also, using something like sun6i_tcon_setup_lvds_phy would be more fit
to what this function is doing.

> +	u8 val;
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
> +static void sun4i_tcon_lvds_sun4i_enable(struct sun4i_tcon *tcon) {

And sun4i_tcon_setup_lvds_phy.

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
> +	udelay(1); /* delay at least 1200 ns */

The delay and your comment don't match.

> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
> +			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
> +			   SUN4I_TCON0_LVDS_ANA1_UPDATE);

You refer to U-Boot in your commit log, but the sequence is not quite
the same, why did you change it?

> +}
> +
> +
>  static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
>  				       const struct drm_encoder *encoder,
>  				       bool enabled)
>  {
>  	if (enabled) {
> -		u8 val;
> -
> +		// Enable LVDS interface

There's no need for that comment, it's simple enough :)

>  		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
>  				   SUN4I_TCON0_LVDS_IF_EN,
>  				   SUN4I_TCON0_LVDS_IF_EN);
>
> -		/*
> -		 * As their name suggest, these values only apply to the A31
> -		 * and later SoCs. We'll have to rework this when merging
> -		 * support for the older SoCs.
> -		 */
> -		regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> -			     SUN6I_TCON0_LVDS_ANA0_C(2) |
> -			     SUN6I_TCON0_LVDS_ANA0_V(3) |
> -			     SUN6I_TCON0_LVDS_ANA0_PD(2) |
> -			     SUN6I_TCON0_LVDS_ANA0_EN_LDO);
> -		udelay(2);
> -
> -		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> -				   SUN6I_TCON0_LVDS_ANA0_EN_MB,
> -				   SUN6I_TCON0_LVDS_ANA0_EN_MB);
> -		udelay(2);
> -
> -		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> -				   SUN6I_TCON0_LVDS_ANA0_EN_DRVC,
> -				   SUN6I_TCON0_LVDS_ANA0_EN_DRVC);
> -
> -		if (sun4i_tcon_get_pixel_depth(encoder) == 18)
> -			val = 7;
> -		else
> -			val = 0xf;
> +		// Perform SoC-specific setup procedure

Ditto.

> +		if (tcon->quirks->sun6i_lvds_init) {
> +			sun4i_tcon_lvds_sun6i_enable(tcon, encoder);
> +		}
> +		else {
> +			sun4i_tcon_lvds_sun4i_enable(tcon);
> +		}
>
> -		regmap_write_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
> -				  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(0xf),
> -				  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
>  	} else {
>  		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
>  				   SUN4I_TCON0_LVDS_IF_EN, 0);
> @@ -1454,6 +1482,7 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
>  };
>
>  static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
> +	.supports_lvds		= true,
>  	.has_channel_0		= true,
>  	.has_channel_1		= true,
>  	.dclk_min_div		= 4,
> @@ -1464,11 +1493,13 @@ static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
>  static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
>  	.has_channel_0		= true,
>  	.has_lvds_alt		= true,
> +	.sun6i_lvds_init	= true,

Using a function pointer here (like we're doing with set_mux) would be
more future proof.

>  	.dclk_min_div		= 1,
>  };
>
>  static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
>  	.supports_lvds		= true,
> +	.sun6i_lvds_init	= true,
>  	.has_channel_0		= true,
>  	.dclk_min_div		= 1,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> index a62ec826ae71..973901c1bee5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -193,6 +193,13 @@
>  #define SUN4I_TCON_MUX_CTRL_REG			0x200
>
>  #define SUN4I_TCON0_LVDS_ANA0_REG		0x220
> +#define SUN4I_TCON0_LVDS_ANA0_DCHS			BIT(16)
> +#define SUN4I_TCON0_LVDS_ANA0_PD			BIT(20) | BIT(21)
> +#define SUN4I_TCON0_LVDS_ANA0_EN_MB			BIT(22)
> +#define SUN4I_TCON0_LVDS_ANA0_REG_C			BIT(24) | BIT(25)
> +#define SUN4I_TCON0_LVDS_ANA0_REG_V			BIT(26) | BIT(27)
> +#define SUN4I_TCON0_LVDS_ANA0_CK_EN			BIT(29) | BIT(28)
> +
>  #define SUN6I_TCON0_LVDS_ANA0_EN_MB			BIT(31)
>  #define SUN6I_TCON0_LVDS_ANA0_EN_LDO			BIT(30)
>  #define SUN6I_TCON0_LVDS_ANA0_EN_DRVC			BIT(24)
> @@ -201,6 +208,10 @@
>  #define SUN6I_TCON0_LVDS_ANA0_V(x)			(((x) & 3) << 8)
>  #define SUN6I_TCON0_LVDS_ANA0_PD(x)			(((x) & 3) << 4)
>
> +#define SUN4I_TCON0_LVDS_ANA1_REG		0x224
> +#define SUN4I_TCON0_LVDS_ANA1_INIT			(0x1f << 26 | 0x1f << 10)
> +#define SUN4I_TCON0_LVDS_ANA1_UPDATE			(0x1f << 16 | 0x1f << 00)

Having proper defines for those fields would be great too.

Side question, this will need some DT changes too, right?

Maxime

--7u7alefvy7ml5d3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkJVpAAKCRDj7w1vZxhR
xbVKAQCeNvcaswq45QY1IeN4a1lVn0bCHRnVx5A6B6hs3R2IHQD5ASxx6F8VvA11
Rk3zeIkh5pwhQnYBkw+TM0mmHeC7KQ4=
=md1S
-----END PGP SIGNATURE-----

--7u7alefvy7ml5d3s--

--===============0804692815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0804692815==--
