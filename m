Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0938B1B9F62
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 11:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA776E159;
	Mon, 27 Apr 2020 09:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A3A6E159
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 09:09:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1762580618;
 Mon, 27 Apr 2020 11:09:01 +0200 (CEST)
Date: Mon, 27 Apr 2020 11:09:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200427090900.GA25058@ravnborg.org>
References: <20200427084658.27962-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427084658.27962-1-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=QX4gbG5DAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=9PyzFoNYW9ryUBNcHcwA:9 a=Ngot1CxQ-7BNPHMX:21
 a=ceCSG8EcjXA1U1zs:21 a=wPNLvfGTeEIA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ricardo.

On Mon, Apr 27, 2020 at 10:46:58AM +0200, Ricardo Ca=F1uelo wrote:
> This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> definitions and descriptions were expanded, apart from that it's a
> direct translation from the original binding.
> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>

One comment below, with that fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> Changes in v2 (suggested by Enric Balletbo):
> =

>   - File name change: use full compatible string.
>   - Binding description removed.
>   - #address-cells and #size-cells properties removed from ports node.
>   - Example node renamed: anx7814 -> bridge.
> =

> Tested with:
> make dt_binding_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<.../analogix,anx781=
4.yaml>
> make dtbs_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<.../analogix,anx7814.yaml>
> =

>  .../display/bridge/analogix,anx7814.yaml      | 124 ++++++++++++++++++
>  .../bindings/display/bridge/anx7814.txt       |  42 ------
>  2 files changed, 124 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anal=
ogix,anx7814.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anx7=
814.txt
> =

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7=
814.yaml
> new file mode 100644
> index 000000000000..5459336ac2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.y=
aml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/analogix,anx7814.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
> +
> +maintainers:
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - analogix,anx7808
> +      - analogix,anx7812
> +      - analogix,anx7814
> +      - analogix,anx7818
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Should contain the INTP interrupt.
> +
> +  hpd-gpios:
> +    maxItems: 1
> +    description: Which GPIO to use for hpd.
> +
> +  pd-gpios:
> +    maxItems: 1
> +    description: Which GPIO to use for power down.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Which GPIO to use for reset.
> +
> +  dvdd10-supply:
> +    maxItems: 1
> +    description: Regulator for 1.0V digital core power.
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Video port for HDMI input.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +      port@1:
> +        type: object
> +        description:
> +          Video port for SlimPort, DisplayPort, eDP or MyDP output.
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - hpd-gpios
> +  - pd-gpios
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
Name this i2c

> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        anx7814: bridge@38 {
> +            compatible =3D "analogix,anx7814";
> +            reg =3D <0x38>;
> +            interrupt-parent =3D <&gpio0>;
> +            interrupts =3D <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> +            hpd-gpios =3D <&pio 36 GPIO_ACTIVE_HIGH>;
> +            pd-gpios =3D <&pio 33 GPIO_ACTIVE_HIGH>;
> +            reset-gpios =3D <&pio 98 GPIO_ACTIVE_HIGH>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +                    anx7814_in: endpoint {
> +                        remote-endpoint =3D <&hdmi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    anx7814_out: endpoint {
> +                        remote-endpoint =3D <&edp_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx7814.txt=
 b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
> deleted file mode 100644
> index 17258747fff6..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/anx7814.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Analogix ANX7814 SlimPort (Full-HD Transmitter)
> ------------------------------------------------
> -
> -The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> -designed for portable devices.
> -
> -Required properties:
> -
> - - compatible		: Must be one of:
> -			  "analogix,anx7808"
> -			  "analogix,anx7812"
> -			  "analogix,anx7814"
> -			  "analogix,anx7818"
> - - reg			: I2C address of the device
> - - interrupts		: Should contain the INTP interrupt
> - - hpd-gpios		: Which GPIO to use for hpd
> - - pd-gpios		: Which GPIO to use for power down
> - - reset-gpios		: Which GPIO to use for reset
> -
> -Optional properties:
> -
> - - dvdd10-supply	: Regulator for 1.0V digital core power.
> - - Video port for HDMI input, using the DT bindings defined in [1].
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	anx7814: anx7814@38 {
> -		compatible =3D "analogix,anx7814";
> -		reg =3D <0x38>;
> -		interrupt-parent =3D <&gpio0>;
> -		interrupts =3D <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> -		hpd-gpios =3D <&pio 36 GPIO_ACTIVE_HIGH>;
> -		pd-gpios =3D <&pio 33 GPIO_ACTIVE_HIGH>;
> -		reset-gpios =3D <&pio 98 GPIO_ACTIVE_HIGH>;
> -		port {
> -			anx7814_in: endpoint {
> -				remote-endpoint =3D <&hdmi0_out>;
> -			};
> -		};
> -	};
> -- =

> 2.18.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
