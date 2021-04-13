Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9835E5FB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 20:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529876E857;
	Tue, 13 Apr 2021 18:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2786E857
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 18:09:33 +0000 (UTC)
Date: Tue, 13 Apr 2021 19:09:17 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: bridge: add it66121 bindings
To: Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <H3LIRQ.7IT4EUNNTEBX1@crapouillou.net>
In-Reply-To: <20210412154648.3719153-2-narmstrong@baylibre.com>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-2-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, Phong LE <ple@baylibre.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Le lun. 12 avril 2021 =E0 17:46, Neil Armstrong =

<narmstrong@baylibre.com> a =E9crit :
> From: Phong LE <ple@baylibre.com>
> =

> Add the ITE bridge HDMI it66121 bindings.
> =

> Signed-off-by: Phong LE <ple@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/bridge/ite,it66121.yaml  | 123 =

> ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 =

> Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> =

> diff --git =

> a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml =

> b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> new file mode 100644
> index 000000000000..61ed6dc7740b
> --- /dev/null
> +++ =

> b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE it66121 HDMI bridge Device Tree Bindings
> +
> +maintainers:
> +  - Phong LE <ple@baylibre.com>
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The IT66121 is a high-performance and low-power single channel HDMI
> +  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward =

> compatible
> +  to DVI 1.0 specifications.
> +
> +properties:
> +  compatible:
> +    const: ite,it66121
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active low reset
> +
> +  vrf12-supply:
> +    description: Regulator for 1.2V analog core power.
> +
> +  vcn33-supply:
> +    description: Regulator for 3.3V digital core power.
> +
> +  vcn18-supply:
> +    description: Regulator for 1.8V IO core power.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: DPI input port.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-width:
> +                description:
> +                  Endpoint bus width.
> +                enum:
> +                  - 12  # 12 data lines connected and dual-edge mode
> +                  - 24  # 24 data lines connected and single-edge =

> mode
> +                default: 24
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: HDMI Connector port.
> +
> +    required:
> +      - port@0
> +      - port@1

Should port@1 really be required? Since the chip itself handles the =

hotplug detection and stuff like DCC, I'm not sure what to connect here.

Cheers,
-Paul

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vrf12-supply
> +  - vcn33-supply
> +  - vcn18-supply
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      it66121hdmitx: it66121hdmitx@4c {
> +        compatible =3D "ite,it66121";
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&ite_pins_default>;
> +        vcn33-supply =3D <&mt6358_vcn33_wifi_reg>;
> +        vcn18-supply =3D <&mt6358_vcn18_reg>;
> +        vrf12-supply =3D <&mt6358_vrf12_reg>;
> +        reset-gpios =3D <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
> +        interrupt-parent =3D <&pio>;
> +        interrupts =3D <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
> +        reg =3D <0x4c>;
> +
> +        ports {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          port@0 {
> +            reg =3D <0>;
> +            it66121_in: endpoint {
> +              bus-width =3D <12>;
> +              remote-endpoint =3D <&display_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg =3D <1>;
> +            hdmi_conn_out: endpoint {
> +              remote-endpoint =3D <&hdmi_conn_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> --
> 2.25.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
