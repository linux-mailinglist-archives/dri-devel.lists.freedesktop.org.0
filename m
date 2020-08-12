Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92C242FDF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 22:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059656E046;
	Wed, 12 Aug 2020 20:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093A66E046
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 20:07:44 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 38F9E804D5;
 Wed, 12 Aug 2020 22:07:40 +0200 (CEST)
Date: Wed, 12 Aug 2020 22:07:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200812200738.GA651402@ravnborg.org>
References: <20200809105705.6334-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200809105705.6334-1-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8 a=qShfwd0oTMHuHMvwmoQA:9
 a=7aqmjZV61Y4sofUB:21 a=gQk0XASIYKSRNcyv:21 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Sun, Aug 09, 2020 at 12:57:04PM +0200, Marek Vasut wrote:
> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
> V2: Fix dt_binding_check errors
> V3: Add ... at the end of example

With Rob's r-b it is now applied to drm-misc-next.

	Sam

> ---
>  .../display/bridge/toshiba,tc358762.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> new file mode 100644
> index 000000000000..195025e6803c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358762.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC358762 MIPI DSI to MIPI DPI bridge
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The TC358762 is bridge device which converts MIPI DSI to MIPI DPI.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,tc358762
> +
> +  reg:
> +    maxItems: 1
> +    description: virtual channel number of a DSI peripheral
> +
> +  vddc-supply:
> +    description: Regulator for 1.2V internal core power.
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description: |
> +          Video port for MIPI DPI output (panel or connector).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@0 {
> +        reg = <0>;
> +        compatible = "toshiba,tc358762";
> +        vddc-supply = <&vcc_1v2_reg>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            bridge_in: endpoint {
> +              remote-endpoint = <&dsi_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            bridge_out: endpoint {
> +              remote-endpoint = <&panel_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
