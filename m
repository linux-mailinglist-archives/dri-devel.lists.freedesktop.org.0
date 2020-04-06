Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66EA1A08FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259056E5A2;
	Tue,  7 Apr 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA996E2DE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:00:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D74F15C01A7;
 Mon,  6 Apr 2020 04:00:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 06 Apr 2020 04:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=IkPl9GikYyHPmZc02tULTBn56d9
 A0vpAp2YQ86XA7LU=; b=Hk12HmPSF34cbLkWUAQcbrVNM9pkdDGaOwf8CQPE3gN
 3cmfz1iVG6T+jojVuFEaba66i6jPUKckIOR41xehgGhrzSxc7HSnKW19vjY9AgR1
 I7uvzHCh0sepjGu5LGPWnbzf9JeZ2j6XQAvxfJPZhEHTieGH/HDV485klUUapExU
 GSYDyIDjW/8AYqGSQbH4SfA0P3iyb8KQoH2icqdKSuDEoo6wGfsy+81RGO3YGpGP
 q7Hm5QKsxNrEQVjIIy3Ni0Wzhkk5TPO+9IfqAAlO9BznH341AleyrrqToDW6uo+y
 XVIzW9sP52p539b9i7gAP+1tiADjghfjk4otspYVSzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IkPl9G
 ikYyHPmZc02tULTBn56d9A0vpAp2YQ86XA7LU=; b=ePEJvDotrB9gxXClxaSXwP
 Dxva49fLYXmews7qJtotG3I8FxNN9rI+H6E6ExakqiV9UZMjrAIe/N8K7AkMMx/Z
 NPuspa0CteKqG4JkB+AA8KYhgoXMffEd4qZbzcv27ggN+94Lv8VXebV+ZArdKw0P
 PeoXu4CtscHrNNFr5qzi2VOY6Pkm+e2IIDeHslLMVI9CMIQbzoPlNlm3P2qq3OvV
 rx8rbHVv72VoiYR2iEmOUa3Vae+32Y3JyU1Y6TGfI9YmKmrcr6kFpQrk4ZLdL3uX
 PtVaM9A1tEZlO3y9keOrmC0g1ZW5bAQrlcopKnQoQPER5qPwvoh6DQaxU3emxRUg
 ==
X-ME-Sender: <xms:oeGKXqY9SPziKqWhImqe8gj8mkZl2z-C8yK3I5D3CrAMDumLd2jjMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oeGKXptQ2NxTu6CDE-RM137L0F6nk1teCPjvITxYA62-NrLZ_LcpIw>
 <xmx:oeGKXnudaCiGH0-eSxDdWUqpxuGB_jv_5RrzuaXrCyE6oTD8Gb-cgw>
 <xmx:oeGKXucu_-HCmEH37qPzlM7itCCpPUlPEVPGjP0bRCD6t6vLo55iGQ>
 <xmx:ouGKXtQYr8yqF5opG21J19m7iAK3Sh6iezGQXZKQ8oqWIx9FndZx2g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D43F306D397;
 Mon,  6 Apr 2020 04:00:33 -0400 (EDT)
Date: Mon, 6 Apr 2020 10:00:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <20200406080032.zlszhkjqmjeoa4ti@gilmour.lan>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200405233935.27599-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: multipart/mixed; boundary="===============0675948239=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0675948239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofqcj6g3ss2qbhgm"
Content-Disposition: inline


--ofqcj6g3ss2qbhgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Apr 06, 2020 at 02:39:33AM +0300, Laurent Pinchart wrote:
> Convert the Rockchip HDMI TX text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> deleted file mode 100644
> index 3d32ce137e7f..000000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Rockchip DWC HDMI TX Encoder
> -============================
> -
> -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> -with a companion PHY IP.
> -
> -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> -following device-specific properties.
> -
> -
> -Required properties:
> -
> -- compatible: should be one of the following:
> -		"rockchip,rk3228-dw-hdmi"
> -		"rockchip,rk3288-dw-hdmi"
> -		"rockchip,rk3328-dw-hdmi"
> -		"rockchip,rk3399-dw-hdmi"
> -- reg: See dw_hdmi.txt.
> -- reg-io-width: See dw_hdmi.txt. Shall be 4.
> -- interrupts: HDMI interrupt number
> -- clocks: See dw_hdmi.txt.
> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> -- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
> -  corresponding to the video input of the controller. The port shall have two
> -  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
> -- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
> -
> -Optional properties
> -
> -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> -  connected to a system I2C master this property contains a phandle to that
> -  I2C master controller.
> -- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
> -- clock-names: May contain "cec" as defined in dw_hdmi.txt.
> -- clock-names: May contain "grf", power for grf io.
> -- clock-names: May contain "vpll", external clock for some hdmi phy.
> -- phys: from general PHY binding: the phandle for the PHY device.
> -- phy-names: Should be "hdmi" if phys references an external phy.
> -
> -Optional pinctrl entry:
> -- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> -  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> -  i2c timeout.  It's intended that this unwedge pinctrl entry will
> -  cause the SDA line to be driven low to work around a hardware
> -  errata.
> -
> -Example:
> -
> -hdmi: hdmi@ff980000 {
> -	compatible = "rockchip,rk3288-dw-hdmi";
> -	reg = <0xff980000 0x20000>;
> -	reg-io-width = <4>;
> -	ddc-i2c-bus = <&i2c5>;
> -	rockchip,grf = <&grf>;
> -	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> -	clock-names = "iahb", "isfr";
> -	ports {
> -		hdmi_in: port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			hdmi_in_vopb: endpoint@0 {
> -				reg = <0>;
> -				remote-endpoint = <&vopb_out_hdmi>;
> -			};
> -			hdmi_in_vopl: endpoint@1 {
> -				reg = <1>;
> -				remote-endpoint = <&vopl_out_hdmi>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..8ff544ae0ac2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Mark Yao <mark.yao@rock-chips.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> +  with a companion PHY IP.
> +
> +allOf:
> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3228-dw-hdmi
> +      - rockchip,rk3288-dw-hdmi
> +      - rockchip,rk3328-dw-hdmi
> +      - rockchip,rk3399-dw-hdmi
> +
> +  reg: true
> +
> +  reg-io-width:
> +    const: 4
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - description: The bus clock for either AHB and APB
> +      - description: The internal register configuration clock
> +      - description: The HDMI CEC controller main clock
> +      - description: Power for GRF IO
> +      - description: External clock for some HDMI PHY
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - const: iahb
> +      - const: isfr
> +      - enum:
> +        - cec
> +        - grf
> +        - vpll
> +      - enum:
> +        - cec
> +        - grf
> +        - vpll
> +      - enum:
> +        - cec
> +        - grf
> +        - vpll

IIRC Rob wanted us to standardize the order of the clocks if possible,
since it's a pain to support properly here, and your description won't
match what you describe here either (and in general it's just a best
practice), so if all your DTs have the same order you should just set
that order in stone.

> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The HDMI DDC bus can be connected to either a system I2C master or the
> +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> +      to a system I2C master this property contains a phandle to that I2C
> +      master controller.
> +
> +  interrupts: true
> +
> +  phys:
> +    maxItems: 1
> +    description: The HDMI PHY
> +
> +  phy-names:
> +    const: hdmi
> +
> +  pinctrl-0: true
> +  pinctrl-1: true

These two are already set by the tools on any schemas (up to
pinctrl-255 actually).

Maxime

--ofqcj6g3ss2qbhgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXorhoAAKCRDj7w1vZxhR
xR4bAQCBWDdneD/u9+7PGzCDBNh8sIvQvVJSL+TgtX6FRplLagD/c7pS9CfDHxzG
vQrFqWGofHKNGJWHWIUjh3BxqsuemQw=
=wdbW
-----END PGP SIGNATURE-----

--ofqcj6g3ss2qbhgm--

--===============0675948239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0675948239==--
