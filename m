Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1FAE7A7A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944710E6A2;
	Wed, 25 Jun 2025 08:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F3A10E6A2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:42:10 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 164911F00055
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:42:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 57B34AC7A40; Wed, 25 Jun 2025 08:42:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id B63DAAC79CD;
 Wed, 25 Jun 2025 08:41:58 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:41:56 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 17/22] phy: allwinner: phy-sun6i-mipi-dphy: add LVDS
 support
Message-ID: <aFu2VBhCIEdLIPv3@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-17-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d3aehSfkx/JP9fmi"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-17-13b52f71fb14@linumiz.com>
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


--d3aehSfkx/JP9fmi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your work on this!

On Fri 27 Dec 24, 16:38, Parthiban Nallathambi wrote:
> DPHY in A100/A133 supports both LVDS and DSI. Combo phy register
> have BIT(2) for enabling LVDS specifically, but enabling it alone
> isn't functional.
>=20
> Both MIPI and LVDS needs to be enabled in the combo phy to get
> the display working under LVDS mode. There is no specific enable
> bit for LVDS apart from the one in combo phy. MIPI got enable
> control in analog 4 register which must be disabled when using
> in LVDS mode.
>=20
> Introduce set_mode in phy ops to control only for MIPI DSI.

Similar work was already submitted for D1/T113-S3 LVDS support, which seems=
 to
be the exact same situation as the A133.

See: https://patchwork.freedesktop.org/series/145276/

I just made a review of that series and find it more elegant in various ways
(especially since configuring the registers in set_mode is not the right pl=
ace).
So you probably want to follow-up on that series instead.

Note that both D1/T113-S3 and A133 support a second LVDS output, LVDS1, whi=
ch
uses the traditional TCON0 LVDS PHY. It would be great to be able to support
both outputs as well as dual-link modes!

All the best,

Paul

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/al=
lwinner/phy-sun6i-mipi-dphy.c
> index 36eab95271b2..d164b2ea5dfd 100644
> --- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> +++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> @@ -314,13 +314,11 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struc=
t sun6i_dphy *dphy)
>  	/* Disable sigma-delta modulation. */
>  	regmap_write(dphy->regs, SUN50I_DPHY_PLL_REG2, 0);
> =20
> -	regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
> -			   SUN6I_DPHY_ANA4_REG_EN_MIPI,
> -			   SUN6I_DPHY_ANA4_REG_EN_MIPI);
> -
>  	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_LVDS |
>  			   SUN50I_COMBO_PHY_REG0_EN_MIPI |
>  			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
> +			   SUN50I_COMBO_PHY_REG0_EN_LVDS |
>  			   SUN50I_COMBO_PHY_REG0_EN_MIPI |
>  			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
> =20
> @@ -528,6 +526,22 @@ static int sun6i_dphy_exit(struct phy *phy)
>  	return 0;
>  }
> =20
> +static int sun6i_set_mode(struct phy *phy, enum phy_mode mode, int submo=
de)
> +{
> +	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> +
> +	switch (mode) {
> +	case PHY_MODE_MIPI_DPHY:
> +		regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
> +				   SUN6I_DPHY_ANA4_REG_EN_MIPI,
> +				   SUN6I_DPHY_ANA4_REG_EN_MIPI);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> =20
>  static const struct phy_ops sun6i_dphy_ops =3D {
>  	.configure	=3D sun6i_dphy_configure,
> @@ -535,6 +549,7 @@ static const struct phy_ops sun6i_dphy_ops =3D {
>  	.power_off	=3D sun6i_dphy_power_off,
>  	.init		=3D sun6i_dphy_init,
>  	.exit		=3D sun6i_dphy_exit,
> +	.set_mode	=3D sun6i_set_mode,
>  };
> =20
>  static const struct regmap_config sun6i_dphy_regmap_config =3D {
>=20
> --=20
> 2.39.5
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--d3aehSfkx/JP9fmi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbtlQACgkQhP3B6o/u
lQzqSg//SJcn6XUET8v2oKGY0j3YQ3uzt4mVEWREtoX7QNRmIZjIBDAGhrWgBmTN
dFlh6GJ2K+rOsj+OV+97A7mAEY9i/VFv0Dg8EQvuOvdhDtkf0WVlMAJq83QfvEob
OQHfNljD4Aok5skavuHpLBw653kp//9ZON/+cMP2f6bZmXIAeLTUdN6ocHb7hYa+
kyyXzDUNmSuoPqGZaDJB1WWEqxAr4Y80zzjWC8XVJhKU7q9Rp/lyypTuNC26ftK+
vcEL/5xc3WY5mcdQzORUx8lgd1ci0KIitnXtRXJNZEYlAuiOaMiNOtSU2TO28BTM
WGx945ro/eq7fjjqkijVHgsyRksQgIdhbCjYg6fHnpVtOF2zoxv7vwu+8PKtUdPC
DID0fceBLNf6ETivJq5mQj+VjQ81bljq+XtKRIwVJSpU1vD9NwapX/l8R0P24AM+
He/bymV/n1GJ+Pcr449ALxq4wM9AVSa4W3GqpUtgYhXlR4dPVJQdZkifclHAewVO
XaksRFT7LiybP6l3zB5/oqihosU6efMnhxJjd5U1SqGxT0DCmLT4V4dpaDY4C4IX
xncL/YSihjHW8gQlK7OHldVSHBO+yxBUoffyBxOmV1UDLFimGT7G9eHrZ6TGmiid
E9NyPrf2JsbW+O5iukFTY4G6uPMXr7ez+HzHW9c9FD0saunYv9o=
=BpKz
-----END PGP SIGNATURE-----

--d3aehSfkx/JP9fmi--
