Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21C01A08ED
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7496E593;
	Tue,  7 Apr 2020 08:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E26A6E0BA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 17:09:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 999965C00BD;
 Mon,  6 Apr 2020 13:09:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 13:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=YcYoeWATpc2GsutQeI56Fa6/iOz
 DV8D9rRqH1wkbKQw=; b=T3oRith+Sj7BjteRHAnY91vJBx1kn3w3lqPGyEQWYLp
 yiWy7nRSJNit4U1V4DiWBk4CPkj0iPkoxdMiF3o8oWnTvCeZUkKxWoyebOmvxlG8
 FAgAzU1pUo3pDHigEuHdqCAQYCZyp8sGiHS3AtR068MdZM9NC1i7dKN7xtBOYG+C
 ATlFWmhNgf6ItimcQ4DhI2n7WMzWiYpJT8Xd6URVO+rutMXK8uEq+xHpixabJ2Hu
 /4AYi1Mz0BU/erIVyd3sNshcFK/8kQJpmggC1zJNxVYZdfcRUWSHB0LRXEYIyYRm
 tU9yA8xgP1/+mVLjbOR33/mVqZRwup4Z7KQ3LzFfAqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YcYoeW
 ATpc2GsutQeI56Fa6/iOzDV8D9rRqH1wkbKQw=; b=DBTJ/OgRiJqXKCUj0JetKu
 qDfSyam7REfKCqreJlaunQlqKWEFMdIwiLYuMWU537JfSxuRawihHDeyZB49sGC1
 IBhLcI4XuRFZo8VCFcXkKvcvSCj71/Fa3FTlw94Y9RnoXHqoZTmB1rJho8UzOtC3
 N2NjkZ2ix5dbCrCdDlYWjNlfnbzrcblvaCqNM0E/rSNe6b3Uwokj3/rfRMzhhcWT
 58AM7XyC1tHekRhUFH+Y1U3YVAhUUGgOBKuLV5hiLCBvObXEdLboduIXgdQScIgt
 AwGHd9m4LjsGdLCjGy8TYWARXsgxkMF+jOQ/ko9AIZMQMtdph40spufUhMxsL94g
 ==
X-ME-Sender: <xms:PWKLXjlTA_JU9gS0pGLj52U8JGp4mWYWZWAqkbxLViUhlFtHWITHPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PWKLXuZ0TYV96YIVmx8vW7vJnMq_ecWvmf_Z0JgOz8K9YRpjnkiYWQ>
 <xmx:PWKLXpR0tKsih4Y81UIIv6IaRWuwKCTqwsqBVkF1HkbkBQRRRLrykA>
 <xmx:PWKLXoX6tcAOji39-4IhnJpeJ-tASEVTMeMoRrtIYF7Rm6eCYB2ASg>
 <xmx:P2KLXmT5aVdXuNyL2Ev7YXri_2r5VcEzZ7fAQnakGaD9M5Y0QY_Vsg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFF2C328005D;
 Mon,  6 Apr 2020 13:09:16 -0400 (EDT)
Date: Mon, 6 Apr 2020 19:09:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <20200406170915.x2ztz4q446h6vx2y@gilmour.lan>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200406080032.zlszhkjqmjeoa4ti@gilmour.lan>
 <20200406111927.GD4757@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200406111927.GD4757@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: multipart/mixed; boundary="===============1040641196=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1040641196==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="44rxnzrbe5lpurqz"
Content-Disposition: inline


--44rxnzrbe5lpurqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:19:27PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>
> On Mon, Apr 06, 2020 at 10:00:32AM +0200, Maxime Ripard wrote:
> > On Mon, Apr 06, 2020 at 02:39:33AM +0300, Laurent Pinchart wrote:
> > > Convert the Rockchip HDMI TX text binding to YAML.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
> > >  .../display/rockchip/rockchip,dw-hdmi.yaml    | 178 ++++++++++++++++++
> > >  2 files changed, 178 insertions(+), 74 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > > deleted file mode 100644
> > > index 3d32ce137e7f..000000000000
> > > --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > > +++ /dev/null
> > > @@ -1,74 +0,0 @@
> > > -Rockchip DWC HDMI TX Encoder
> > > -============================
> > > -
> > > -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > > -with a companion PHY IP.
> > > -
> > > -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> > > -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> > > -following device-specific properties.
> > > -
> > > -
> > > -Required properties:
> > > -
> > > -- compatible: should be one of the following:
> > > -		"rockchip,rk3228-dw-hdmi"
> > > -		"rockchip,rk3288-dw-hdmi"
> > > -		"rockchip,rk3328-dw-hdmi"
> > > -		"rockchip,rk3399-dw-hdmi"
> > > -- reg: See dw_hdmi.txt.
> > > -- reg-io-width: See dw_hdmi.txt. Shall be 4.
> > > -- interrupts: HDMI interrupt number
> > > -- clocks: See dw_hdmi.txt.
> > > -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> > > -- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
> > > -  corresponding to the video input of the controller. The port shall have two
> > > -  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
> > > -- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
> > > -
> > > -Optional properties
> > > -
> > > -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> > > -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> > > -  connected to a system I2C master this property contains a phandle to that
> > > -  I2C master controller.
> > > -- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
> > > -- clock-names: May contain "cec" as defined in dw_hdmi.txt.
> > > -- clock-names: May contain "grf", power for grf io.
> > > -- clock-names: May contain "vpll", external clock for some hdmi phy.
> > > -- phys: from general PHY binding: the phandle for the PHY device.
> > > -- phy-names: Should be "hdmi" if phys references an external phy.
> > > -
> > > -Optional pinctrl entry:
> > > -- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> > > -  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> > > -  i2c timeout.  It's intended that this unwedge pinctrl entry will
> > > -  cause the SDA line to be driven low to work around a hardware
> > > -  errata.
> > > -
> > > -Example:
> > > -
> > > -hdmi: hdmi@ff980000 {
> > > -	compatible = "rockchip,rk3288-dw-hdmi";
> > > -	reg = <0xff980000 0x20000>;
> > > -	reg-io-width = <4>;
> > > -	ddc-i2c-bus = <&i2c5>;
> > > -	rockchip,grf = <&grf>;
> > > -	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > > -	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> > > -	clock-names = "iahb", "isfr";
> > > -	ports {
> > > -		hdmi_in: port {
> > > -			#address-cells = <1>;
> > > -			#size-cells = <0>;
> > > -			hdmi_in_vopb: endpoint@0 {
> > > -				reg = <0>;
> > > -				remote-endpoint = <&vopb_out_hdmi>;
> > > -			};
> > > -			hdmi_in_vopl: endpoint@1 {
> > > -				reg = <1>;
> > > -				remote-endpoint = <&vopl_out_hdmi>;
> > > -			};
> > > -		};
> > > -	};
> > > -};
> > > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > > new file mode 100644
> > > index 000000000000..8ff544ae0ac2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > > @@ -0,0 +1,178 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip DWC HDMI TX Encoder
> > > +
> > > +maintainers:
> > > +  - Mark Yao <mark.yao@rock-chips.com>
> > > +
> > > +description: |
> > > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > > +  with a companion PHY IP.
> > > +
> > > +allOf:
> > > +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3228-dw-hdmi
> > > +      - rockchip,rk3288-dw-hdmi
> > > +      - rockchip,rk3328-dw-hdmi
> > > +      - rockchip,rk3399-dw-hdmi
> > > +
> > > +  reg: true
> > > +
> > > +  reg-io-width:
> > > +    const: 4
> > > +
> > > +  clocks:
> > > +    minItems: 2
> > > +    maxItems: 5
> > > +    items:
> > > +      - description: The bus clock for either AHB and APB
> > > +      - description: The internal register configuration clock
> > > +      - description: The HDMI CEC controller main clock
> > > +      - description: Power for GRF IO
> > > +      - description: External clock for some HDMI PHY
> > > +
> > > +  clock-names:
> > > +    minItems: 2
> > > +    maxItems: 5
> > > +    items:
> > > +      - const: iahb
> > > +      - const: isfr
> > > +      - enum:
> > > +        - cec
> > > +        - grf
> > > +        - vpll
> > > +      - enum:
> > > +        - cec
> > > +        - grf
> > > +        - vpll
> > > +      - enum:
> > > +        - cec
> > > +        - grf
> > > +        - vpll
> >
> > IIRC Rob wanted us to standardize the order of the clocks if possible,
> > since it's a pain to support properly here, and your description won't
> > match what you describe here either (and in general it's just a best
> > practice), so if all your DTs have the same order you should just set
> > that order in stone.
>
> But how do we handle the case where any of the cec, grf and vpll clocks
> can be set ? Assuming, for instance, that
>
> 	clock-names = "iahb", "isfr", "cec";
> 	clock-names = "iahb", "isfr", "vpll";
> 	clock-names = "iahb", "isfr", "cec", "vpll";
>
> would all be valid.

It would be painful then...

The easiest way to do so would be to simply use an enum there, and not
bother checking the array at all. You'll get a warning if there's
multiple occurences of the same string, and I guess that's what you
would be really concerned about.

However, now that I think about it, what's the interaction between the
generic binding and this one when it comes to the third clock? The
generic one expects it to be cec, and here you have other options?

Maxime

--44rxnzrbe5lpurqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXotiOwAKCRDj7w1vZxhR
xSpiAP9Eq+c7RMavv1hwija32yeHaInh8ucvSZ9ACRviXx0KjAD+KMMIn1YNATK1
xOP2DIlql3VhqKUxuiww2WGVq4gC+Qo=
=3S1z
-----END PGP SIGNATURE-----

--44rxnzrbe5lpurqz--

--===============1040641196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1040641196==--
