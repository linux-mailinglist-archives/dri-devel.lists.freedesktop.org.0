Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8988D2135EF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F2E6EB39;
	Fri,  3 Jul 2020 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81C26EA64
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:46:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DF820A96;
 Thu,  2 Jul 2020 03:46:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 02 Jul 2020 03:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XD7giw22ZmO7+jioYevux6e4A4V
 ypAB+8F9PcAxqDzg=; b=onCcasIjj6hTu3WPuf4sGp6/uBj/24rWctvNGuHHyQP
 iGIkq5cs6KYY6exKCz3iXR5EdwP6dWkoXl6thsoClOXo4/LeYsT5RJhO0PzS61+a
 u1stq2r53l/8rRv+uHLF+vrJ7aiDaGLerafnb4EMwxsRzKjk7ZySAs/gSDFV8K4O
 //HqGET1kB3hDcCkI4venIwe3XjS67w8J/URT5dRoVrA1K/+OMGIilKnBn8FDEHF
 U4BbTf9XCLWgZf+OK6czrO9sLwZSkAam2l/AG4T5KnMX8H38ooOsDZIyrcYGY+tw
 ObRp5CD9jFWZuFrFXbv46s7zk4YBjLDS9vVcbb620iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XD7giw
 22ZmO7+jioYevux6e4A4VypAB+8F9PcAxqDzg=; b=uHSAlAsAhoZYXWd6OnEizh
 vO+Xr7Xthpivedv8K2ygyrVsmHnBr+3XxwBk2YyKwXlIe5fQ2X/1ky1a0rqHMDEH
 QMhNhe07CpiOg9iD952KgVdmy+lfI11JNZSSWslE9MbChMlVn4tY2PgAq+N3SyiG
 M4aL4/7pEBw1+9xEE7ycWkT9ewJCBQn/SHAS3iXbceBZjF3QTzJaM6MV2GPeba/i
 so1fHRPqUrkggVHamPlfO5CmRKGIQCUkoe2isukDNSRMB8c8y+TuE9sRkq9GPuYD
 vH5YfOsq4XRwnkHXSpq4pWlF7RD1LgkOBrn4+x6sVMGOEHCv7BDGfL6CmhqSnSuA
 ==
X-ME-Sender: <xms:2pD9Xv_8DEDgYsgU4ENG14E5yt9ldfWo_anPvVHs_qZ0yXLuPdDwOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdefgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2pD9Xrvu3pWSffdJhtROI1t-tC_B5UhUpwTimD6nZuNiPHYJM4DRWA>
 <xmx:2pD9XtD_K1AzkRvfClc7dYbb_S_CavhwwUKrHjcYp2Ed25bJl_kLwQ>
 <xmx:2pD9Xrc3NCP9DxAmkwGyNXTD6neeP4XTj98rN6TMLPcBj82KhsyJAA>
 <xmx:3JD9XpcZA-4T6qtgUGGXqPCajd1anfIY-w08mJT3mAM8ZQXBG1goCZ04Vyg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D187D3280064;
 Thu,  2 Jul 2020 03:46:33 -0400 (EDT)
Date: Thu, 2 Jul 2020 09:46:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v7 12/13] arm64: dts: sun50i-a64-pinephone: Enable LCD
 support on PinePhone
Message-ID: <20200702074631.oj54lreufm3fkhiu@gilmour.lan>
References: <20200701162928.1638874-1-megous@megous.com>
 <20200701162928.1638874-13-megous@megous.com>
MIME-Version: 1.0
In-Reply-To: <20200701162928.1638874-13-megous@megous.com>
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
Cc: devicetree@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1980191963=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1980191963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4seei5k7uul7ogtm"
Content-Disposition: inline


--4seei5k7uul7ogtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 06:29:27PM +0200, Ondrej Jirman wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>=20
> PinePhone uses PWM backlight and a XBD599 LCD panel over DSI for
> display.
>=20
> Backlight levels curve was optimized by Martijn Braam using a
> lux meter.
>=20
> Add its device nodes.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../allwinner/sun50i-a64-pinephone-1.1.dts    | 19 ++++++++++
>  .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 35 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
> index 06a775c41664..3e99a87e9ce5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
> @@ -9,3 +9,22 @@ / {
>  	model =3D "Pine64 PinePhone Braveheart (1.1)";
>  	compatible =3D "pine64,pinephone-1.1", "allwinner,sun50i-a64";
>  };
> +
> +&backlight {
> +	power-supply =3D <&reg_ldo_io0>;
> +	/*
> +	 * PWM backlight circuit on this PinePhone revision was changed since
> +	 * 1.0, and the lowest PWM duty cycle that doesn't lead to backlight
> +	 * being off is around 20%. Duty cycle for the lowest brightness level
> +	 * also varries quite a bit between individual boards, so the lowest
> +	 * value here was chosen as a safe default.
> +	 */
> +	brightness-levels =3D <
> +		774  793  814  842
> +		882  935  1003 1088
> +		1192 1316 1462 1633
> +		1830 2054 2309 2596
> +		2916 3271 3664 4096>;
> +	num-interpolated-steps =3D <50>;
> +	default-brightness-level =3D <400>;
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index cefda145c3c9..85a7aa5efd32 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -16,6 +16,13 @@ aliases {
>  		serial0 =3D &uart0;
>  	};
> =20
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		enable-gpios =3D <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
> +		/* Backlight configuration differs per PinePhone revision. */
> +	};
> +
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> @@ -84,6 +91,30 @@ &dai {
>  	status =3D "okay";
>  };
> =20
> +&de {
> +	status =3D "okay";
> +};
> +
> +&dphy {
> +	status =3D "okay";
> +};
> +
> +&dsi {
> +	vcc-dsi-supply =3D <&reg_dldo1>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";

If you're about to send a new version, you can remove #address-cells and
#size-cells too, they're already set in the DTSI.

Maxime

--4seei5k7uul7ogtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXv2Q1wAKCRDj7w1vZxhR
xRU3AP9/RU4o7gJkXULsYLNValRt6TkkGC1AIH6ty1GbeFVv2AD+NJYwDiC9CJxm
iWn2yi4SWp4MZG0IKSMy8iATzq2rVgs=
=mUin
-----END PGP SIGNATURE-----

--4seei5k7uul7ogtm--

--===============1980191963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1980191963==--
