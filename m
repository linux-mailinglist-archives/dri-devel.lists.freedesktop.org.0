Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0B5929C1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 08:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284B8AD189;
	Mon, 15 Aug 2022 06:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9BAD1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 06:43:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4D2C5C00B9;
 Mon, 15 Aug 2022 02:43:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Aug 2022 02:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660545781; x=1660632181; bh=8v1UNNv97h
 9J2L3WvxkH00sK+2Af+0MdgE0J1dhPpWA=; b=QBYvXoFE2expmhkMkPUa5b9q5J
 PJJ2hvuYdIuDuAStEHtfVpFxuE0rm9pi0n2MqT8brNudqMCmcIs9iMMb7udhtyQu
 Jku39EGmJVm1Ssj6AamPCjWZzdFFfLjumzy9QPcewvh8JfdmkDJ72G42IUMCw4FS
 dY4zC1H7DdhPpwZMMXrYLllHVJNk4cfil++OCi6mg3uIMKgtfIqhLTYzAI3s4CSZ
 bhjbP6E7sPa4hdayqvNaqYbabL06vdMam6fahFpUOQRojr4F8QBCosgYl9Dyx/NM
 Mo1XAE48Hm8nDCGZRWoClZnluZ4o7XD1+Ek+uFF8npJE7bCs2PTFxRE4RBag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660545781; x=1660632181; bh=8v1UNNv97h9J2L3WvxkH00sK+2Af
 +0MdgE0J1dhPpWA=; b=mYi0k5szCs5yZozk29RRx8q5qgOTdLBRsL8hGMEWLfnH
 ez8RFhJdZEdDQOdWsSA/wMS270RyUrecpyaq7QjdnNyttVRBu1quc4+SD867LYro
 41Gr25rR0YctXAS0odKzpWTU8nY+23p+681+AmJwC5EW23NI1YaKhH9BkP5EwiAs
 0lqhSPE6Id/EJ7TOOqf397/CPpWxA/txw8bCu09H7Md8jvNWABv2oFXgqqRbwt1b
 Mn6kBMDGLy67+47x6LXSwTvxDMjCFZjkv70itsEjcM6uXHs4U15dzrMoRhBuy+TC
 AAaaxtH845XqkVGyhhIR/lgsXSh8uZxVy4yNVFXiiw==
X-ME-Sender: <xms:9er5YmbPDT0JdOfn9FMUEzoXns9jT0o6gk3Kvl416ecLoTlZ5CQInA>
 <xme:9er5YpYONVVk6v9MGzUWveEA27hHAy-pGy9Ne_p5GQOBxk6cm6Bwg5-7BD6Pe3tBD
 s2BIFHWwue-w9C64s4>
X-ME-Received: <xmr:9er5Yg9SWnCsZZjs9aeDVnuGso9ndQG1WSNZa8u-tEayhh4HVu2M7MdLyN3O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9er5YorW5eieMVy2cljIB4lVcVYjdRVQptdswd1VCSBAU2maX4hE1A>
 <xmx:9er5YhoZGFiNdqZxuHq_5t9vxVZD_3NCg6kRG6RtG-Bqh1mVVIXouA>
 <xmx:9er5YmSorlkhw-ItEgf4iwovSGC9316WpxYvm4b-_XmfNz4T_bbe7Q>
 <xmx:9er5YiScjy43Usltq-fQC9u7FMsF0LG3ru--gDdz_rjhDCxwBLnKvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 02:43:00 -0400 (EDT)
Date: Mon, 15 Aug 2022 08:42:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 3/4] drm/sun4i: dsi: Add a variant structure
Message-ID: <20220815064248.4ujitfpvtw6y3k4k@houat>
References: <20220812074257.58254-1-samuel@sholland.org>
 <20220812074257.58254-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fe5pr2l7i2tpjvdm"
Content-Disposition: inline
In-Reply-To: <20220812074257.58254-4-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fe5pr2l7i2tpjvdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Fri, Aug 12, 2022 at 02:42:55AM -0500, Samuel Holland wrote:
> Replace the ad-hoc calls to of_device_is_compatible() with a structure
> describing the differences between variants. This is in preparation for
> adding more variants to the driver.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 50 +++++++++++++++++---------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  7 ++++
>  2 files changed, 40 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index b4dfa166eccd..6479ade416b9 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -1101,12 +1101,16 @@ static const struct component_ops sun6i_dsi_ops =
=3D {
> =20
>  static int sun6i_dsi_probe(struct platform_device *pdev)
>  {
> +	const struct sun6i_dsi_variant *variant;
>  	struct device *dev =3D &pdev->dev;
> -	const char *bus_clk_name =3D NULL;
>  	struct sun6i_dsi *dsi;
>  	void __iomem *base;
>  	int ret;
> =20
> +	variant =3D device_get_match_data(dev);
> +	if (!variant)
> +		return -EINVAL;
> +
>  	dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>  	if (!dsi)
>  		return -ENOMEM;
> @@ -1114,10 +1118,7 @@ static int sun6i_dsi_probe(struct platform_device =
*pdev)
>  	dsi->dev =3D dev;
>  	dsi->host.ops =3D &sun6i_dsi_host_ops;
>  	dsi->host.dev =3D dev;
> -
> -	if (of_device_is_compatible(dev->of_node,
> -				    "allwinner,sun6i-a31-mipi-dsi"))
> -		bus_clk_name =3D "bus";
> +	dsi->variant =3D variant;
> =20
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
> @@ -1142,7 +1143,7 @@ static int sun6i_dsi_probe(struct platform_device *=
pdev)
>  		return PTR_ERR(dsi->regs);
>  	}
> =20
> -	dsi->bus_clk =3D devm_clk_get(dev, bus_clk_name);
> +	dsi->bus_clk =3D devm_clk_get(dev, variant->has_mod_clk ? "bus" : NULL);
>  	if (IS_ERR(dsi->bus_clk))
>  		return dev_err_probe(dev, PTR_ERR(dsi->bus_clk),
>  				     "Couldn't get the DSI bus clock\n");
> @@ -1151,21 +1152,21 @@ static int sun6i_dsi_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		return ret;
> =20
> -	if (of_device_is_compatible(dev->of_node,
> -				    "allwinner,sun6i-a31-mipi-dsi")) {
> +	if (variant->has_mod_clk) {
>  		dsi->mod_clk =3D devm_clk_get(dev, "mod");
>  		if (IS_ERR(dsi->mod_clk)) {
>  			dev_err(dev, "Couldn't get the DSI mod clock\n");
>  			ret =3D PTR_ERR(dsi->mod_clk);
>  			goto err_attach_clk;
>  		}
> -	}
> =20
> -	/*
> -	 * In order to operate properly, that clock seems to be always
> -	 * set to 297MHz.
> -	 */
> -	clk_set_rate_exclusive(dsi->mod_clk, 297000000);
> +		/*
> +		 * In order to operate properly, the module clock on the
> +		 * A31 variant always seems to be set to 297MHz.
> +		 */
> +		if (variant->set_mod_clk)
> +			clk_set_rate_exclusive(dsi->mod_clk, 297000000);
> +	}
>
>
>  	dsi->dphy =3D devm_phy_get(dev, "dphy");
>  	if (IS_ERR(dsi->dphy)) {
> @@ -1205,16 +1206,31 @@ static int sun6i_dsi_remove(struct platform_devic=
e *pdev)
> =20
>  	component_del(&pdev->dev, &sun6i_dsi_ops);
>  	mipi_dsi_host_unregister(&dsi->host);
> -	clk_rate_exclusive_put(dsi->mod_clk);
> +	if (dsi->variant->has_mod_clk && dsi->variant->set_mod_clk)
> +		clk_rate_exclusive_put(dsi->mod_clk);

There's also a clk_rate_exclusive_put call in the bind error path

Maxime

--fe5pr2l7i2tpjvdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvnq6AAKCRDj7w1vZxhR
xRUgAQC+Q6FefSqQzlCuirg8gH0Zff7RElCM+/kmmzZdz/QEiwEA1K0JgOyS8Xbv
pApMRj4LRfKxndHBOk/R4DCvHbcNxwk=
=pvGf
-----END PGP SIGNATURE-----

--fe5pr2l7i2tpjvdm--
