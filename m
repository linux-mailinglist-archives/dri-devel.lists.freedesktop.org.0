Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146682F38A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2F10E0C5;
	Tue, 16 Jan 2024 17:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731EF10E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 17:56:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29B87611FC;
 Tue, 16 Jan 2024 17:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA3BC433C7;
 Tue, 16 Jan 2024 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705427750;
 bh=A7WpPOEyCtH2adKAYF4nilFbx0bdiAYZdsfDGpAubDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fIFPiJwhUgdRy26zRTMTIuX5fW2jwJKHQQTkKOxwN2HvpVn/od3MRM9C4W/I7qUgi
 K1QyRJ8Ie6+XBd2ke2Loy8Ex0b2GvEwK0AsAYQc0CqPHl5rgo0W6FVo4NHhfHkB6aS
 RFDcsruqxnHWSnJul+f5Fyp8CHEG8QmGuLCPHN7sr/RpR2Fe1fynQm0iUojU9wXs+B
 /JDad+LE7e7FVd9WbnnU+RfcdtqcAi9Jqq0uGM2WtYTvg1LyVWpPs+a6EZ+PaWzIrw
 psQRNYsdftFcEmk7IYLU+Q0UNsQZTSttxRajtNYuDZ9a0HG3vVMHPZBKCOvRx4w0vp
 6IJlabfVJ4fzw==
Date: Tue, 16 Jan 2024 17:55:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Message-ID: <20240116-coastal-amply-e495b07726df@spud>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-2-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M3diZ8Ne17+OylG0"
Content-Disposition: inline
In-Reply-To: <20240116113800.82529-2-dharma.b@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux4microchip@microchip.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--M3diZ8Ne17+OylG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Tue, Jan 16, 2024 at 05:07:58PM +0530, Dharma Balasubiramani wrote:
> Convert the existing DT binding to DT schema of the Atmel's HLCDC display
> controller.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> changelog
> v1 -> v2
> - Remove the explicit copyrights.
> - Modify filename like compatible.
> - Modify title (drop words like binding/driver).
> - Modify description actually describing the hardware and not the driver.
> - Remove pinctrl properties which aren't required.
> - Ref endpoint and not endpoint-base.
> - Drop redundant info about bus-width description and add ref to video-in=
terfaces.
> - Move 'additionalProperties' after 'Required'.
> - Drop parent node and it's other sub-device node which are not related h=
ere.
> - Add compatible to example 2 and add comments that bus-width is the diff=
 between two examples.
> ---
>  .../atmel/atmel,hlcdc-display-controller.yaml | 110 ++++++++++++++++++
>  .../bindings/display/atmel/hlcdc-dc.txt       |  75 ------------
>  2 files changed, 110 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/atmel/atmel=
,hlcdc-display-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc=
-dc.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-=
display-controller.yaml b/Documentation/devicetree/bindings/display/atmel/a=
tmel,hlcdc-display-controller.yaml
> new file mode 100644
> index 000000000000..f022c294cfbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display=
-controller.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/atmel/atmel,hlcdc-display-con=
troller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel's High LCD Controller (HLCDC)
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description: |

This | is not needed as you have no formatting to preserve.

> +  The LCD Controller (LCDC) consists of logic for transferring LCD image
> +  data from an external display buffer to a TFT LCD panel. The LCDC has =
one
> +  display input buffer per layer that fetches pixels through the single =
bus
> +  host interface and a look-up table to allow palletized display
> +  configurations.
> +
> +properties:
> +  compatible:
> +    const: atmel,hlcdc-display-controller
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  port@0:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      Output endpoint of the controller, connecting the LCD panel signal=
s.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      reg:
> +        maxItems: 1
> +
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/$defs/endpoint

$ref: /schemas/media/video-interfaces.yaml#

to match approximately all other endpoints?

> +        unevaluatedProperties: false
> +        description:
> +          Endpoint connecting the LCD panel signals.
> +
> +        properties:
> +          bus-width:
> +            description: Endpoint bus width.
> +            $ref: /schemas/media/video-interfaces.yaml#

and then bus-width's type is already defined for you, no?

> +            enum: [ 12, 16, 18, 24 ]
> +
> +required:
> +  - '#address-cells'
> +  - '#size-cells'
> +  - compatible
> +  - port@0
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    //Example 1
> +
> +    display-controller {
> +      compatible =3D "atmel,hlcdc-display-controller";
> +      pinctrl-names =3D "default";
> +      pinctrl-0 =3D <&pinctrl_lcd_base &pinctrl_lcd_rgb888>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      port@0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        reg =3D <0>;
> +
> +        hlcdc_panel_output: endpoint@0 {
> +          reg =3D <0>;
> +          remote-endpoint =3D <&panel_input>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    //Example 2 With a video interface override to force rgb565, bus-wid=
th=3D16
> +
> +    display-controller {
> +      compatible =3D "atmel,hlcdc-display-controller";
> +      pinctrl-names =3D "default";
> +      pinctrl-0 =3D <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      port@0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        reg =3D <0>;

Should be a newline here before the child node.

Cheers,
Conor.

> +        hlcdc_panel_output2: endpoint@0 {
> +          reg =3D <0>;
> +          remote-endpoint =3D <&panel_input>;
> +          bus-width =3D <16>;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt=
 b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> deleted file mode 100644
> index 923aea25344c..000000000000
> --- a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -Device-Tree bindings for Atmel's HLCDC (High LCD Controller) DRM driver
> -
> -The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
> -See ../../mfd/atmel-hlcdc.txt for more details.
> -
> -Required properties:
> - - compatible: value should be "atmel,hlcdc-display-controller"
> - - pinctrl-names: the pin control state names. Should contain "default".
> - - pinctrl-0: should contain the default pinctrl states.
> - - #address-cells: should be set to 1.
> - - #size-cells: should be set to 0.
> -
> -Required children nodes:
> - Children nodes are encoding available output ports and their connections
> - to external devices using the OF graph representation (see ../graph.txt=
).
> - At least one port node is required.
> -
> -Optional properties in grandchild nodes:
> - Any endpoint grandchild node may specify a desired video interface
> - according to ../../media/video-interfaces.txt, specifically
> - - bus-width: recognized values are <12>, <16>, <18> and <24>, and
> -   override any output mode selection heuristic, forcing "rgb444",
> -   "rgb565", "rgb666" and "rgb888" respectively.
> -
> -Example:
> -
> -	hlcdc: hlcdc@f0030000 {
> -		compatible =3D "atmel,sama5d3-hlcdc";
> -		reg =3D <0xf0030000 0x2000>;
> -		interrupts =3D <36 IRQ_TYPE_LEVEL_HIGH 0>;
> -		clocks =3D <&lcdc_clk>, <&lcdck>, <&clk32k>;
> -		clock-names =3D "periph_clk","sys_clk", "slow_clk";
> -
> -		hlcdc-display-controller {
> -			compatible =3D "atmel,hlcdc-display-controller";
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <&pinctrl_lcd_base &pinctrl_lcd_rgb888>;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -
> -			port@0 {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -				reg =3D <0>;
> -
> -				hlcdc_panel_output: endpoint@0 {
> -					reg =3D <0>;
> -					remote-endpoint =3D <&panel_input>;
> -				};
> -			};
> -		};
> -
> -		hlcdc_pwm: hlcdc-pwm {
> -			compatible =3D "atmel,hlcdc-pwm";
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <&pinctrl_lcd_pwm>;
> -			#pwm-cells =3D <3>;
> -		};
> -	};
> -
> -Example 2: With a video interface override to force rgb565; as above
> -but with these changes/additions:
> -
> -	&hlcdc {
> -		hlcdc-display-controller {
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
> -
> -			port@0 {
> -				hlcdc_panel_output: endpoint@0 {
> -					bus-width =3D <16>;
> -				};
> -			};
> -		};
> -	};
> --=20
> 2.25.1
>=20

--M3diZ8Ne17+OylG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZabDHwAKCRB4tDGHoIJi
0rzVAQDXJ1TQ1k0nCXBFIKNZ39yzTXWYH98QUx/HdCzWsNYangD8ChAiKtj801cY
BMVPytUV5tnGQJvaA2g/fcfgvl5suQM=
=84qM
-----END PGP SIGNATURE-----

--M3diZ8Ne17+OylG0--
