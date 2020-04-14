Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968271A9402
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6286E85F;
	Wed, 15 Apr 2020 07:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAA46E492
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:30:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C8F08B58;
 Tue, 14 Apr 2020 04:30:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Apr 2020 04:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/CfHmA7c0jO7pf77t3C7Oki3S52
 gFaZ76bqIpouc54w=; b=M6dwhgEoBoIB2y7rp4DoAkl7KoyebJxJRYc4WPRjBGS
 A6lt9HmBvrU+e5GSpfhsS7DUFTqI02NtpfgUBx8ao19zARJv/jVCbeWtAlr4ZdBa
 s6nsR2Xe/9x2RkcZoEudpE3dVeaBCnDSdnACRQD5mZmO8iYZkrhZ1NpzP0zTeNca
 0gxltG3aP1kQQ0JQs4U79aqoIBevWlSuKLIhqdBM2jqrdA88U1V1mxAsKo/xtDzP
 fmOYFOey1FM0ULiPT1e+k778LOy0uxw37xjtm1/8Ccb2jSkHWpV1d9tkPFX8vZUl
 gMfk2XglbjmaZFyim2ukdeKgLfO/IakxKStrUAVCk+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/CfHmA
 7c0jO7pf77t3C7Oki3S52gFaZ76bqIpouc54w=; b=yYFNiXlR8f1qiG4USZL8ae
 m5g2jLSyKfP/ywlD/ISHgwfAfSEchaeMC21gQ8p1d6H2TNTKgL72PhyQUuO/S/kT
 XpX98niE7i4/84edcIl+cWorHWQ+OZl7qE/Q/XqN1liywiOnBppmy6EnK0MFwVTU
 jJvunYUrBSrgMN34LDm0gKMeKWuHafDZTRonTTXqzvTNUzCMwaKgtKNjt506x2C/
 VK6soNdSYo83suzx1cwMkC/DeF63XTAch5BnwS5IyvvonueqmzPXXRDW3QUqwWkv
 CNUD6xdk1Iid1Bu8z1SZf0sYam481Tm8OuiANzYIENp9e/HwSNusWr8uYzLZuoOA
 ==
X-ME-Sender: <xms:k3SVXsNFv4siq4nJowLJJumE3X7BmqiH4V-Hg7bw3Urd4ehNbLCgkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfedugddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
 gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:k3SVXkY40XT7yDdpznDdFSpd3c3p0CrgmYVGh45uEb3hqshgaAgzsw>
 <xmx:k3SVXuoR4m5dLWQz6WxAr2L7Px6XIhTk1SE30E6NbF5metSJB3C_xw>
 <xmx:k3SVXhzRcNw-02hZ06hjAZLscFrrh6rWj2Nhw588Oxqt_qZvMMjXaQ>
 <xmx:lHSVXjLNqIRAORGVzAfiSRbavqM4snT6_ETcIITZSEQKbSPWRk1Kfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9EE2306005E;
 Tue, 14 Apr 2020 04:30:11 -0400 (EDT)
Date: Tue, 14 Apr 2020 10:30:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: display: convert atmel lcdc to DT
 Schema
Message-ID: <20200414083010.qztgtj6v6b53qgjh@gilmour.lan>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-3-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200412182012.27515-3-sam@ravnborg.org>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0620821368=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0620821368==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kpecuiezqczpcjng"
Content-Disposition: inline


--kpecuiezqczpcjng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 12, 2020 at 08:20:10PM +0200, Sam Ravnborg wrote:
> Add a new binding file to describe the bindings
> for the Atmel LCDC IP.
> This replaces the old txt based binding.
>
> The binding file describes the current binding,
> including properties to specify register values etc.
> The binding will be updated in a follow-up patch,
> the current binding describes the actual situation.
>
> This new binding file replaces the old .txt based
> binding which is deleted.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/atmel,lcdc.txt           |  88 -----------
>  .../bindings/display/atmel/lcdc.yaml          | 137 ++++++++++++++++++
>  2 files changed, 137 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/atmel,lcdc.txt
>  create mode 100644 Documentation/devicetree/bindings/display/atmel/lcdc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
> deleted file mode 100644
> index acb5a0132127..000000000000
> --- a/Documentation/devicetree/bindings/display/atmel,lcdc.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -Atmel LCDC Framebuffer
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible :
> -	"atmel,at91sam9261-lcdc" ,
> -	"atmel,at91sam9263-lcdc" ,
> -	"atmel,at91sam9g10-lcdc" ,
> -	"atmel,at91sam9g45-lcdc" ,
> -	"atmel,at91sam9g45es-lcdc" ,
> -	"atmel,at91sam9rl-lcdc" ,
> -	"atmel,at32ap-lcdc"
> -- reg : Should contain 1 register ranges(address and length).
> -	Can contain an additional register range(address and length)
> -	for fixed framebuffer memory. Useful for dedicated memories.
> -- interrupts : framebuffer controller interrupt
> -- display: a phandle pointing to the display node
> -
> -Required nodes:
> -- display: a display node is required to initialize the lcd panel
> -	This should be in the board dts.
> -- default-mode: a videomode within the display with timing parameters
> -	as specified below.
> -
> -Optional properties:
> -- lcd-supply: Regulator for LCD supply voltage.
> -
> -Example:
> -
> -	fb0: fb@00500000 {
> -		compatible = "atmel,at91sam9g45-lcdc";
> -		reg = <0x00500000 0x1000>;
> -		interrupts = <23 3 0>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_fb>;
> -		display = <&display0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -	};
> -
> -Example for fixed framebuffer memory:
> -
> -	fb0: fb@00500000 {
> -		compatible = "atmel,at91sam9263-lcdc";
> -		reg = <0x00700000 0x1000 0x70000000 0x200000>;
> -		[...]
> -	};
> -
> -Atmel LCDC Display
> ------------------------------------------------------
> -Required properties (as per of_videomode_helper):
> -
> - - atmel,dmacon: dma controller configuration
> - - atmel,lcdcon2: lcd controller configuration
> - - atmel,guard-time: lcd guard time (Delay in frame periods)
> - - bits-per-pixel: lcd panel bit-depth.
> -
> -Optional properties (as per of_videomode_helper):
> - - atmel,lcdcon-backlight: enable backlight
> - - atmel,lcdcon-backlight-inverted: invert backlight PWM polarity
> - - atmel,lcd-wiring-mode: lcd wiring mode "RGB" or "BRG"
> - - atmel,power-control-gpio: gpio to power on or off the LCD (as many as needed)
> -
> -Example:
> -	display0: display {
> -		bits-per-pixel = <32>;
> -		atmel,lcdcon-backlight;
> -		atmel,dmacon = <0x1>;
> -		atmel,lcdcon2 = <0x80008002>;
> -		atmel,guard-time = <9>;
> -		atmel,lcd-wiring-mode = <1>;
> -
> -		display-timings {
> -			native-mode = <&timing0>;
> -			timing0: timing0 {
> -				clock-frequency = <9000000>;
> -				hactive = <480>;
> -				vactive = <272>;
> -				hback-porch = <1>;
> -				hfront-porch = <1>;
> -				vback-porch = <40>;
> -				vfront-porch = <1>;
> -				hsync-len = <45>;
> -				vsync-len = <1>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> new file mode 100644
> index 000000000000..7dcb9a4d5902
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/atmel/lcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel LCDC (LCD Controller) display controller with PWM
> +
> +maintainers:
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  The Atmel LCDC Display Controller is display controller that
> +  includes a PWM for backlight/contrast.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91sam9261-lcdc
> +      - atmel,at91sam9263-lcdc
> +      - atmel,at91sam9g10-lcdc
> +      - atmel,at91sam9g45-lcdc
> +      - atmel,at91sam9g45es-lcdc
> +      - atmel,at91sam9g46-lcdc
> +      - atmel,at91sam9m10-lcdc
> +      - atmel,at91sam9m11-lcdc
> +      - atmel,at91sam9rl-lcdc
> +
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    description: |
> +      Contains 1 register range (address and length).
> +      Can contain an additional register range (address and length)
> +      for fixed framebuffer memory

So, minItems: 1 , maxItems: 2?

> +  interrupts:
> +    maxItems: 1
> +
> +  lcd-supply:
> +    description: Regulator for LCD supply voltage.
> +
> +  display:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to display node
> +
> +patternProperties:
> +  "^display[0-9]$":
> +    type: object
> +    description: |
> +      Display node is required to initialize the lcd panel.
> +      This should be in the board dts
> +
> +    properties:
> +
> +      atmel,dmacon:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: DMA controller configuration
> +
> +      atmel,lcdcon2:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: LCD controller configuration
> +
> +      atmel,guard-time:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: LCD guard time (Delay in frame periods)
> +
> +      bits-per-pixel:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: LCD panel bit-depth.

Those properties aren't documented anywhere?

Maxime

--kpecuiezqczpcjng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpV0kQAKCRDj7w1vZxhR
xba9AQDmrxYaMT55KbrVTmc0PvlNdbW8UOTkZx6RHCf7DesFnAD/bx2BEZuSu1JQ
/oSXtj39Ax0HAmrvnx0b6Rmn23btawE=
=I8D4
-----END PGP SIGNATURE-----

--kpecuiezqczpcjng--

--===============0620821368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0620821368==--
