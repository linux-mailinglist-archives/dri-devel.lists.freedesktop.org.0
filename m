Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C01AD687
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1C66E356;
	Fri, 17 Apr 2020 06:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE86EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 07:31:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 55DAB681;
 Thu, 16 Apr 2020 03:31:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 03:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=W+EWBAvvjltFQn1vI0zsiOXRz1m
 8NYYI47sCEw0ADk0=; b=QMV7/UVSapjFb+v+wA7XYXucYljXj4/Vb90QCRC3MQ+
 /sYrI1O2dVTbW4cWCWoVAkMuplNy092cKAyIPgoWM2BdK+F8H7cKdPz0/nQBEZh4
 Dcklqe38ltfVJx3VjRBUfNFe+TEAF0zOTNT5LeKIE31Aae29vVo4sJTzdJ736mp9
 YiL0gXuBNvNjMjcvrjDUzzi6RXmXNeFZ/QQ2N6/+Y+B6H7NMA/TGbp8fH2Z5MUAB
 akkRESEMTBHpgi6Bn4eRx86z66dv/68Rw/p+VrOgh/6XJP7l+qcqNFflDb3v9Peh
 8wPJysw8lEgQtpvCEbPjIXgy9ObdfUG9ehDTIwoyQ3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=W+EWBA
 vvjltFQn1vI0zsiOXRz1m8NYYI47sCEw0ADk0=; b=3YS352+kYINH42g5b8bAVt
 424+2AHW3aRTZZ+sISMBlH489+u3jCCZHVWpSLnxlU6ZWvwaXxwg9LNxcGygyULg
 NnrEE9Vb9uXgRCgNfL+hM6qjBmX6SMuou65mqBGaiAybDWu480LIeZ6Vf6NdrYOd
 3cZaGX4k/7zBmx0zfRVaUv09FVozVkO0Sqg1CuWNLRmVE791G99JJe8q1IvhjyAW
 Tp3FuAjO/A/+x4k8PLykO6e6w6QNAirjF1qgFE5FXo7yfXKz2PW/az6IbM7lpzsi
 tay7+Mwv1NujyQblzHZUnvgiZCfzDSgyBo2Pj9p1ZxyV47zqjREJmbkPYutztkjw
 ==
X-ME-Sender: <xms:1AmYXjb_vu5cqR6L9QuudHN1dwqYdJcy3yLkk9rN7xEf8gtFhAcGYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1AmYXrM8wKqA1iz-Bo7pJ7pS2mCDQyj0tuKX-P5EzMYB5c2Ose8oHg>
 <xmx:1AmYXsiXjSmCBFhlPKcYveHQxwaOw519QE29WPb2ZbnuKxayn-NNCQ>
 <xmx:1AmYXnDlCjRpT_aSajm0fgpoIOrQ3b2t2q-6l3QwnkHQxbcpbf44YA>
 <xmx:1AmYXicl53aCn78R3bXpkWyvOzfIcfwvcnobppaou8lC3DdjgvT1pg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D87CD328005D;
 Thu, 16 Apr 2020 03:31:31 -0400 (EDT)
Date: Thu, 16 Apr 2020 09:31:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: display: convert atmel lcdc to DT
 Schema
Message-ID: <20200416073130.uwv3nphqlczk6fqc@gilmour.lan>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-3-sam@ravnborg.org>
 <20200414083010.qztgtj6v6b53qgjh@gilmour.lan>
 <20200415164427.GC7965@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200415164427.GC7965@ravnborg.org>
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Content-Type: multipart/mixed; boundary="===============1208889762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1208889762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bi3t3lca2w6eed6j"
Content-Disposition: inline


--bi3t3lca2w6eed6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 06:44:27PM +0200, Sam Ravnborg wrote:
> Hi Maxime.
>
> On Tue, Apr 14, 2020 at 10:30:10AM +0200, Maxime Ripard wrote:
> > On Sun, Apr 12, 2020 at 08:20:10PM +0200, Sam Ravnborg wrote:
> > > Add a new binding file to describe the bindings
> > > for the Atmel LCDC IP.
> > > This replaces the old txt based binding.
> > >
> > > The binding file describes the current binding,
> > > including properties to specify register values etc.
> > > The binding will be updated in a follow-up patch,
> > > the current binding describes the actual situation.
> > >
> > > This new binding file replaces the old .txt based
> > > binding which is deleted.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > >  .../bindings/display/atmel,lcdc.txt           |  88 -----------
> > >  .../bindings/display/atmel/lcdc.yaml          | 137 ++++++++++++++++++
> > >  2 files changed, 137 insertions(+), 88 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/atmel,lcdc.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
> > > deleted file mode 100644
> > > index acb5a0132127..000000000000
> > > --- a/Documentation/devicetree/bindings/display/atmel,lcdc.txt
> > > +++ /dev/null
> > > @@ -1,88 +0,0 @@
> > > -Atmel LCDC Framebuffer
> > > ------------------------------------------------------
> > > -
> > > -Required properties:
> > > -- compatible :
> > > -	"atmel,at91sam9261-lcdc" ,
> > > -	"atmel,at91sam9263-lcdc" ,
> > > -	"atmel,at91sam9g10-lcdc" ,
> > > -	"atmel,at91sam9g45-lcdc" ,
> > > -	"atmel,at91sam9g45es-lcdc" ,
> > > -	"atmel,at91sam9rl-lcdc" ,
> > > -	"atmel,at32ap-lcdc"
> > > -- reg : Should contain 1 register ranges(address and length).
> > > -	Can contain an additional register range(address and length)
> > > -	for fixed framebuffer memory. Useful for dedicated memories.
> > > -- interrupts : framebuffer controller interrupt
> > > -- display: a phandle pointing to the display node
> > > -
> > > -Required nodes:
> > > -- display: a display node is required to initialize the lcd panel
> > > -	This should be in the board dts.
> > > -- default-mode: a videomode within the display with timing parameters
> > > -	as specified below.
> > > -
> > > -Optional properties:
> > > -- lcd-supply: Regulator for LCD supply voltage.
> > > -
> > > -Example:
> > > -
> > > -	fb0: fb@00500000 {
> > > -		compatible = "atmel,at91sam9g45-lcdc";
> > > -		reg = <0x00500000 0x1000>;
> > > -		interrupts = <23 3 0>;
> > > -		pinctrl-names = "default";
> > > -		pinctrl-0 = <&pinctrl_fb>;
> > > -		display = <&display0>;
> > > -		#address-cells = <1>;
> > > -		#size-cells = <1>;
> > > -
> > > -	};
> > > -
> > > -Example for fixed framebuffer memory:
> > > -
> > > -	fb0: fb@00500000 {
> > > -		compatible = "atmel,at91sam9263-lcdc";
> > > -		reg = <0x00700000 0x1000 0x70000000 0x200000>;
> > > -		[...]
> > > -	};
> > > -
> > > -Atmel LCDC Display
> > > ------------------------------------------------------
> > > -Required properties (as per of_videomode_helper):
> > > -
> > > - - atmel,dmacon: dma controller configuration
> > > - - atmel,lcdcon2: lcd controller configuration
> > > - - atmel,guard-time: lcd guard time (Delay in frame periods)
> > > - - bits-per-pixel: lcd panel bit-depth.
> > > -
> > > -Optional properties (as per of_videomode_helper):
> > > - - atmel,lcdcon-backlight: enable backlight
> > > - - atmel,lcdcon-backlight-inverted: invert backlight PWM polarity
> > > - - atmel,lcd-wiring-mode: lcd wiring mode "RGB" or "BRG"
> > > - - atmel,power-control-gpio: gpio to power on or off the LCD (as many as needed)
> > > -
> > > -Example:
> > > -	display0: display {
> > > -		bits-per-pixel = <32>;
> > > -		atmel,lcdcon-backlight;
> > > -		atmel,dmacon = <0x1>;
> > > -		atmel,lcdcon2 = <0x80008002>;
> > > -		atmel,guard-time = <9>;
> > > -		atmel,lcd-wiring-mode = <1>;
> > > -
> > > -		display-timings {
> > > -			native-mode = <&timing0>;
> > > -			timing0: timing0 {
> > > -				clock-frequency = <9000000>;
> > > -				hactive = <480>;
> > > -				vactive = <272>;
> > > -				hback-porch = <1>;
> > > -				hfront-porch = <1>;
> > > -				vback-porch = <40>;
> > > -				vfront-porch = <1>;
> > > -				hsync-len = <45>;
> > > -				vsync-len = <1>;
> > > -			};
> > > -		};
> > > -	};
> > > diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> > > new file mode 100644
> > > index 000000000000..7dcb9a4d5902
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> > > @@ -0,0 +1,137 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/atmel/lcdc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Atmel LCDC (LCD Controller) display controller with PWM
> > > +
> > > +maintainers:
> > > +  - Sam Ravnborg <sam@ravnborg.org>
> > > +
> > > +description: |
> > > +  The Atmel LCDC Display Controller is display controller that
> > > +  includes a PWM for backlight/contrast.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - atmel,at91sam9261-lcdc
> > > +      - atmel,at91sam9263-lcdc
> > > +      - atmel,at91sam9g10-lcdc
> > > +      - atmel,at91sam9g45-lcdc
> > > +      - atmel,at91sam9g45es-lcdc
> > > +      - atmel,at91sam9g46-lcdc
> > > +      - atmel,at91sam9m10-lcdc
> > > +      - atmel,at91sam9m11-lcdc
> > > +      - atmel,at91sam9rl-lcdc
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +  reg:
> > > +    description: |
> > > +      Contains 1 register range (address and length).
> > > +      Can contain an additional register range (address and length)
> > > +      for fixed framebuffer memory
> >
> > So, minItems: 1 , maxItems: 2?
> The syntax is either:
>
>     reg = <0x00700000 0x1000>;
>
> or
>
>     reg = <0x00700000 0x1000 0x70000000 0x200000>;
>
> So always minItems: 1

Yeah, but <0x00700000 0x1000 0x70000000 0x200000 0x70000000 0x200000>;
would be invalid, right?

> >
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  lcd-supply:
> > > +    description: Regulator for LCD supply voltage.
> > > +
> > > +  display:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to display node
> > > +
> > > +patternProperties:
> > > +  "^display[0-9]$":
> > > +    type: object
> > > +    description: |
> > > +      Display node is required to initialize the lcd panel.
> > > +      This should be in the board dts
> > > +
> > > +    properties:
> > > +
> > > +      atmel,dmacon:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        description: DMA controller configuration
> > > +
> > > +      atmel,lcdcon2:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        description: LCD controller configuration
> > > +
> > > +      atmel,guard-time:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        description: LCD guard time (Delay in frame periods)
> > > +
> > > +      bits-per-pixel:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        description: LCD panel bit-depth.
> >
> > Those properties aren't documented anywhere?
>
> Not more than this and then by their use in the driver(s).
>
> In the current patchset the node is deprecated in next patch.
> I plan to do in two patches:
>   - delete properites which is not used in kernel, barebox, u-boot)
>   - Mark all the old properties deprecated
>
> And for the soon-to-be deprecated properties we need no detailed
> description.

Even if they are going to be deprecated, and it never was done, it
seems to be a good occasion to document them properly.

Maxime

--bi3t3lca2w6eed6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpgJ0gAKCRDj7w1vZxhR
xWBKAP4s9+x5BuHw/HL8XygQ35smR4G2Z3jON4UkrosWknQ/VAD9FxRLwKxRY86l
bnqBuKSa7h7ecCDV7wX1bngdQUQRswY=
=MbWq
-----END PGP SIGNATURE-----

--bi3t3lca2w6eed6j--

--===============1208889762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1208889762==--
