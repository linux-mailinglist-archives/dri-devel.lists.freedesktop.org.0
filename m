Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76735E36D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 18:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C5889B22;
	Tue, 13 Apr 2021 16:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF96D89B22
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 16:04:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3E8C9F0;
 Tue, 13 Apr 2021 18:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618329858;
 bh=pUgM55miRgoN+NKLMy+bBwdxnn/EXzhYxduslvOw0Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uap0ILaCqSXV2FQ50sCvEAUadz05Gj75E13xc+gDhbZkBt6v8QkMz7prkHSAhSXyU
 1Nd+cQJBWVeSwDO1yjQ9zvlHEd6mFAv271eFF1DwFbQxJOpWyUyu30lQioxBds4bUu
 5LECcOIa3jxW/QL1qJCzvsWttGZlFonx0FHUmywg=
Date: Tue, 13 Apr 2021 19:03:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: bridge: add it66121 bindings
Message-ID: <YHXA0KFylvC7FDbK@pendragon.ideasonboard.com>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412154648.3719153-2-narmstrong@baylibre.com>
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
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, paul@crapouillou.net,
 a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 Phong LE <ple@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Thank you for the patch.

On Mon, Apr 12, 2021 at 05:46:46PM +0200, Neil Armstrong wrote:
> From: Phong LE <ple@baylibre.com>
> 
> Add the ITE bridge HDMI it66121 bindings.
> 
> Signed-off-by: Phong LE <ple@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/bridge/ite,it66121.yaml  | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> new file mode 100644
> index 000000000000..61ed6dc7740b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
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
> +  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
> +  to DVI 1.0 specifications.
> +
> +properties:
> +  compatible:
> +    const: ite,it66121
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device

You can drop the description.

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
> +                  - 24  # 24 data lines connected and single-edge mode
> +                default: 24
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: HDMI Connector port.
> +
> +    required:
> +      - port@0
> +      - port@1
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
> +      #address-cells = <1>;
> +      #size-cells = <0>;

It's customary to indent DT examples with 4 spaces.

> +
> +      it66121hdmitx: it66121hdmitx@4c {
> +        compatible = "ite,it66121";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&ite_pins_default>;
> +        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
> +        vcn18-supply = <&mt6358_vcn18_reg>;
> +        vrf12-supply = <&mt6358_vrf12_reg>;
> +        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;

You can #include the necessary headers at the top of the example, and
use GPIO_ACTIVE_LOW and IRQ_TYPE_LEVEL_LOW to replace the numerical
values.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +        interrupt-parent = <&pio>;
> +        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
> +        reg = <0x4c>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            it66121_in: endpoint {
> +              bus-width = <12>;
> +              remote-endpoint = <&display_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            hdmi_conn_out: endpoint {
> +              remote-endpoint = <&hdmi_conn_in>;
> +            };
> +          };
> +        };
> +      };
> +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
