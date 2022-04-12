Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5594FE264
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF68910E9C2;
	Tue, 12 Apr 2022 13:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CE110E9C2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 13:23:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 816853200D53;
 Tue, 12 Apr 2022 09:23:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 12 Apr 2022 09:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1649769809; x=1649856209; bh=SCBBhq7C9q
 0Z6mR7hQqmWZHCx1ZocRttm3x1QobmTTg=; b=QA+HwR/CwtCKhYGOcy9Z1ZwoEP
 inlBN2ws97HMBG/hMwgNWmPRguDSmiKr0/BZNLpGZUA8q5ZZCuIQ07806K+Nu8wK
 sFbKZrqUeDstfgwZTC+R4v6zdbx4vlk3ZLRrp50BiJbTKDZcN+5R4ZVMkMytFjC1
 j0aRg9WwXSzK6BUX5BBSlPccQb7upozo37NR6jADtIuiCrT/MDR8rq3sRjYQ81Da
 jVt9cJTzhOhyjoIaKbmAA6hWnYpIjqYvhyN5SNZ8ZY5Q18bozkYlKQpzAjAMOutM
 b6lWyAhYUXat95dTmFq0KxIGGxhb/UYp2ngsxEe2SxxR14VDQS6omEEcYDTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649769809; x=
 1649856209; bh=SCBBhq7C9q0Z6mR7hQqmWZHCx1ZocRttm3x1QobmTTg=; b=e
 XPnv5AadguhgwzimhsdMBgjPMrSYdpp+TnjGKJ4FJw+68TnBXeDKp1wbAPQhwJrg
 K/C7vrPZq2y6WiPh1geWoz8vSpJGyL1qFCezZ9ULBCyrnE3juylOkeuPXZkueFLi
 SBbUrb3o4BxGDlAMsGG+RB5pwzrqpXOTNgt8cMkhVT/BAiZMAJwkbQP+fEE6Qz59
 ZqrKt1mbCiKLFOqx153EnIupjOT+iU+yK1ThDi7GJ5WAJr3P7aJ+OFXaRvBRf+ED
 qceJbixeumR4D7sPffWhD2bcwhTi2OGVv0Da1w0dKLouFLZ3uymsTE5NvD99FxoU
 O9UiIrisktUT7HPhd0DNA==
X-ME-Sender: <xms:T31VYjxvmgYuCr3LCP8dbUYvbIy12F6BOyo9oB-EnrCzzjaSsAYRSg>
 <xme:T31VYrRg92peaIZ7uheflRnWYbEHTtGfHQjXyaM_ivlHOW7RNd6Pg-NHUb8OeMTQu
 _v3p7PVidw281g4Ya4>
X-ME-Received: <xmr:T31VYtU8hgF9-XI-3K1rx2WT7SHTotivfOEnsFyC2KDn6HfNnFXmlJ1ri1qayx5-v-n2vhR9BBAEyTkGYnD0Q8YjNQ-APRaioXS1HZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:T31VYtiwDlD-FHeWW_X7sJVeK5cH0-h8wzxzt1fl3TPdzROvFMu8Jw>
 <xmx:T31VYlAgh9wQZI8_87yrpoaPOvI-qXfIXviGKhuy2UTDtWpIKY5kOQ>
 <xmx:T31VYmI-N_eCzYBWNcuua5_5sJlp7KWQs8Vq1rTNGIYMxTwvvA9CvQ>
 <xmx:UX1VYp0EwhfrWJuYbbmgn1LBahUqSxO5llrF7oJ1VJ8tFQx_KLGdSA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 09:23:27 -0400 (EDT)
Date: Tue, 12 Apr 2022 15:23:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 3/6] drm/sun4i: sun8i-hdmi-phy: Used device-managed
 clocks/resets
Message-ID: <20220412132325.bq2c3g2fskckfgpz@houat>
References: <20220412043512.49364-1-samuel@sholland.org>
 <20220412043512.49364-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="542vfuzlbowtb4mg"
Content-Disposition: inline
In-Reply-To: <20220412043512.49364-4-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--542vfuzlbowtb4mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 11, 2022 at 11:35:08PM -0500, Samuel Holland wrote:
> Now that the HDMI PHY is using a platform driver, it can use device-
> managed resources. Use these, as well as the dev_err_probe helper, to
> simplify the probe function and get rid of the remove function.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 100 ++++++++-----------------
>  1 file changed, 30 insertions(+), 70 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun=
4i/sun8i_hdmi_phy.c
> index 1effa30bfe62..1351e633d485 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -673,10 +673,8 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, s=
truct device_node *node)
>  static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct device_node *node =3D dev->of_node;
>  	struct sun8i_hdmi_phy *phy;
>  	void __iomem *regs;
> -	int ret;
> =20
>  	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
> @@ -686,88 +684,50 @@ static int sun8i_hdmi_phy_probe(struct platform_dev=
ice *pdev)
>  	phy->dev =3D dev;
> =20
>  	regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(regs)) {
> -		dev_err(dev, "Couldn't map the HDMI PHY registers\n");
> -		return PTR_ERR(regs);
> -	}
> +	if (IS_ERR(regs))
> +		return dev_err_probe(dev, PTR_ERR(regs),
> +				     "Couldn't map the HDMI PHY registers\n");
> =20
>  	phy->regs =3D devm_regmap_init_mmio(dev, regs,
>  					  &sun8i_hdmi_phy_regmap_config);
> -	if (IS_ERR(phy->regs)) {
> -		dev_err(dev, "Couldn't create the HDMI PHY regmap\n");
> -		return PTR_ERR(phy->regs);
> -	}
> +	if (IS_ERR(phy->regs))
> +		return dev_err_probe(dev, PTR_ERR(phy->regs),
> +				     "Couldn't create the HDMI PHY regmap\n");
> =20
> -	phy->clk_bus =3D of_clk_get_by_name(node, "bus");
> -	if (IS_ERR(phy->clk_bus)) {
> -		dev_err(dev, "Could not get bus clock\n");
> -		return PTR_ERR(phy->clk_bus);
> -	}
> -
> -	phy->clk_mod =3D of_clk_get_by_name(node, "mod");
> -	if (IS_ERR(phy->clk_mod)) {
> -		dev_err(dev, "Could not get mod clock\n");
> -		ret =3D PTR_ERR(phy->clk_mod);
> -		goto err_put_clk_bus;
> -	}
> +	phy->clk_bus =3D devm_clk_get(dev, "bus");
> +	if (IS_ERR(phy->clk_bus))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk_bus),
> +				     "Could not get bus clock\n");
> =20
> -	if (phy->variant->has_phy_clk) {
> -		phy->clk_pll0 =3D of_clk_get_by_name(node, "pll-0");
> -		if (IS_ERR(phy->clk_pll0)) {
> -			dev_err(dev, "Could not get pll-0 clock\n");
> -			ret =3D PTR_ERR(phy->clk_pll0);
> -			goto err_put_clk_mod;
> -		}
> -
> -		if (phy->variant->has_second_pll) {
> -			phy->clk_pll1 =3D of_clk_get_by_name(node, "pll-1");
> -			if (IS_ERR(phy->clk_pll1)) {
> -				dev_err(dev, "Could not get pll-1 clock\n");
> -				ret =3D PTR_ERR(phy->clk_pll1);
> -				goto err_put_clk_pll0;
> -			}
> -		}
> -	}
> +	phy->clk_mod =3D devm_clk_get(dev, "mod");
> +	if (IS_ERR(phy->clk_mod))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk_mod),
> +				     "Could not get mod clock\n");
> =20
> -	phy->rst_phy =3D of_reset_control_get_shared(node, "phy");
> -	if (IS_ERR(phy->rst_phy)) {
> -		dev_err(dev, "Could not get phy reset control\n");
> -		ret =3D PTR_ERR(phy->rst_phy);
> -		goto err_put_clk_pll1;
> -	}
> +	if (phy->variant->has_phy_clk)
> +		phy->clk_pll0 =3D devm_clk_get(dev, "pll-0");
> +	if (IS_ERR(phy->clk_pll0))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk_pll0),
> +				     "Could not get pll-0 clock\n");
> +
> +	if (phy->variant->has_second_pll)
> +		phy->clk_pll1 =3D devm_clk_get(dev, "pll-1");
> +	if (IS_ERR(phy->clk_pll1))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk_pll1),
> +				     "Could not get pll-1 clock\n");
> +
> +	phy->rst_phy =3D devm_reset_control_get_shared(dev, "phy");
> +	if (IS_ERR(phy->rst_phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->rst_phy),
> +				     "Could not get phy reset control\n");

I find the old construct clearer with the imbricated blocks.

Otherwise, the rest of the series looks fine, thanks!
Maxime

--542vfuzlbowtb4mg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlV9TQAKCRDj7w1vZxhR
xXz3AQCLd+iM9nW9TMjH67uErKUxeCFePEosuu47NlHJp2MjHQD/dC1dKOtp1lTu
FRHk3m7R4Cr2sMERznd+wOMkOdpzjQk=
=f6v7
-----END PGP SIGNATURE-----

--542vfuzlbowtb4mg--
