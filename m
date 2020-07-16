Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3D2235A6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6E36ECEC;
	Fri, 17 Jul 2020 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96F86E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:04:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 19279580398;
 Thu, 16 Jul 2020 04:04:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Jul 2020 04:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6FRaGsNVf4Oj7I0udxEaM7YNj9M
 cwIA3wCwlWWtmTOA=; b=aiQTn2fNb8TfhHxIIwch/tNLmkKDW4oYncGU+pC15hf
 /CZeH6c3bGetKEm41U4n8RKpyxul0jnz3DcIhJCaNtO8C7um3iir043+vQi3YDtn
 p3KSDXE9WMLXo1L+xBuYSxEoXBm+TPz12CrX20keiALJNnflBZ4hv/vifGIxqcaw
 x3BMYik95WMw2c5yOLzg0mPtUiADeD+MVVm89pXz5wezeqnkf88VVH+VrjBzYKek
 nhqXGlnbJ43bE5yi+PXw88WwQZ6Jpje55m8zttJyNctSZk6cpm1leb91dVkN6S6g
 YfYNloTKbatEwy3w/hrodWYfxea352+YqjVkKRHZ2lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6FRaGs
 NVf4Oj7I0udxEaM7YNj9McwIA3wCwlWWtmTOA=; b=tZhlqkLu9ORCerc8ehZCwX
 xqkBavvP+D7IPmyj9NbSY1OMEqNh7MuwFvvT6g7a/oZ5w0aXT0vEwuVdm18cGkl3
 NdAtelCFZae9WYPjBgfQFfmeZdV6B+dWqTB7wabg5Pj4rWlCaqzo5q0p1iYsPF2D
 sUgue23P19QSpR/2ns5cHUPFqwXmvaigz3hiDEPoQ4mzKBQ1Vnxhzs9ZhbTx8Pz7
 rTavUGbTeTgKpR0x0y9CLospD3047VfBOMi0dwr+X4olIKxxVztjZzcAiITJ8rD1
 yZv/sMIdQX4Q41zsr9F2NZSagWPLjyWX+5GC04NxWXcQDy1MWjtRa/ZfOkQVGIPw
 ==
X-ME-Sender: <xms:FQoQXxYo6CpJfO7mbHxVpZ0yHIHufeSpcqjOCbf7Qvw4lVpJMTNu1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeefgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FQoQX4bxGili3U7hAUrD6waY1_sM5-YIpsYd5WG1yl8mxTLlI3AtGg>
 <xmx:FQoQXz-SX4j9njKO8H-uHHVKKaKkvLvQFASWQjND9q43oTTdRjTXTQ>
 <xmx:FQoQX_pKDacV5VjqYIKAHmwRZcTD-fimB9qwYI9GEMJcXlz8wxbi6Q>
 <xmx:FwoQX0Lp20jQ0VoV6I9b8sNwUn-61HCykeS90XumOzAJkxBlmHBMcg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B8E0306005F;
 Thu, 16 Jul 2020 04:04:37 -0400 (EDT)
Date: Thu, 16 Jul 2020 10:04:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 5/5] ARM: dts: sun7i: Add MSI Primo73 tablet
Message-ID: <20200716080435.3td5il4eskh5jcru@gilmour.lan>
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-6-wens@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200714071305.18492-6-wens@kernel.org>
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2124341608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2124341608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dnhfbvytdbc524k4"
Content-Disposition: inline


--dnhfbvytdbc524k4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 14, 2020 at 03:13:05PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Primo73 is an MSI branded Allwinner A20-based 7-inch tablet. It has
> a metal back case with a plastic insert around where the WiFi antenna is.
> The tablet is (as of July of 2020) no longer available from retailers.
> Kernel sources (as required by GPL) are no longer available from the
> vendor, MSI. The device support page still lists the link, but it is
> dead.
>=20
> The tablet features a non-identifiable 1024x600 7" MIPI DPI TFT panel,
> Goodix GT911-based capacitive touchscreen, 1GB DRAM, 8GB MLC NAND,
> RTL8188ETV-based WiFi, an NXP MMA8452 accelerometer for orientation,
> a GC2035 2 megapixel rear camera, a GC0308 0.3 megapixel front camera,
> a mini-HDMI output, a micro-USB port, a headphone jack and single speaker.
>=20
> The board design is believe to follow Allwinner's reference design. This
> judgement is based on the fact that the I/O pins and GPIO lines used
> match up with the reference design. Assumptions about the regulator tree
> are based on this.
>=20
> The LCD panel only has some serial number markings, and what appears to
> be a part number: "OS1N71J003", which is also a prefix for one of the
> serial number markings. Searching for this part number yielded no
> results. As such, the color depth display timings are directly listed
> in the device tree. The timing are from the FEX file recovered from the
> device. The color depth was derived from the dithering setting from the
> FEX file, as well as independent testing with a color gradient image.
> The internal board, as well as the ribbon cable for the panel, route the
> full 24 bits of color. So the 2 extra bits are dropped either by the
> panel itself or somewhere within the LCD panel module casing.
>=20
> Add a device tree for this tablet. Almost the whole device is supported.
> The only things missing are the two cameras, which don't have device
> tree bindings or driver support. The vendor for the LCD panel is left
> out, since there is nothing to go with.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> The panel-dpi binding requires a more-specific compatible string.
> However given the vendor of the panel is unknown, I'm not sure what
> the best course of action is here. I opted to put the part number in
> without a vendor prefix.

I guess we could just make up a comptible from the tablet name here?
Something like msi,primo73-panel ?

> ---
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/sun7i-a20-primo73.dts | 279 ++++++++++++++++++++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-primo73.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index e6a1cac0bfc7..c09cda958db5 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1133,6 +1133,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
>  	sun7i-a20-orangepi-mini.dtb \
>  	sun7i-a20-pcduino3.dtb \
>  	sun7i-a20-pcduino3-nano.dtb \
> +	sun7i-a20-primo73.dtb \
>  	sun7i-a20-wexler-tab7200.dtb \
>  	sun7i-a20-wits-pro-a20-dkt.dtb
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
> diff --git a/arch/arm/boot/dts/sun7i-a20-primo73.dts b/arch/arm/boot/dts/=
sun7i-a20-primo73.dts
> new file mode 100644
> index 000000000000..f3b1002ceb50
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-primo73.dts
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
> + */
> +
> +/dts-v1/;
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/{
> +	model =3D "MSI Primo73 Tablet";
> +	compatible =3D "msi,primo73", "allwinner,sun7i-a20";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		enable-gpios =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "b";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	panel: panel {
> +		compatible =3D "os1n71j003", "panel-dpi";
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_vcc5v0>; /* Actually driven from IPSOUT */
> +		enable-gpios =3D <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> +		height-mm =3D <86>;
> +		width-mm =3D <155>;
> +		bits-per-color =3D <6>;
> +
> +		panel-timing {
> +			clock-frequency =3D <60000000>;
> +			hactive =3D <1024>;
> +			vactive =3D <600>;
> +			hfront-porch =3D <160>;
> +			hback-porch =3D <60>;
> +			hsync-len =3D <100>;
> +			vback-porch =3D <13>;
> +			vfront-porch =3D <10>;
> +			vsync-len =3D <10>;
> +			de-active =3D <1>;
> +			pixelclk-active =3D <0>;
> +		};

The clock frequency doesn't seem to match the rest of the timings
though, it should be around 51MHz. Was this taken from the fex file too?

Maxime

--dnhfbvytdbc524k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXxAKEwAKCRDj7w1vZxhR
xVq3AQDecTAKa3nVz2cO7syghzWkCakk/sBcrbXaSGlzYa1/tAEArIg4KfsWe5vV
6ITtzFf1KFzrrjCWsO8WMMgvfHe/QwU=
=NrX2
-----END PGP SIGNATURE-----

--dnhfbvytdbc524k4--

--===============2124341608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2124341608==--
