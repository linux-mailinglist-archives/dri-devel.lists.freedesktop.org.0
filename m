Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43982F60F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 20:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CB610E5AC;
	Tue, 16 Jan 2024 19:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE39D10E549
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 19:50:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 80712B80FAC;
 Tue, 16 Jan 2024 19:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14B4C43390;
 Tue, 16 Jan 2024 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705434586;
 bh=nDrC9wTsCV4ph2iLOi/kjmUrKVaAS25bEBAFssh/F98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rt2FDwLkrEvke5xX3NG2XsTzU/1v1AFMfYT3gFwaDjFtMNSx6SOqH1XIkRtJBOoyh
 mwsMlpc8GweBANnXi89yX+fAIpoxT6EWsyWKMKpLs4FIKElC12KDINnLVfxEo3AMdY
 XEhkRRLSfe4V14sKLBqM7RP+DW8+GxDVF9O5iIf8FRYDiDm++l96OruiFu1UqmINk4
 cnmmpOfsCcqOr4VCcRnE9QcR8OwpiDKoGUdCPU0yRunpacKpAhO5bUH5bNgi3DTtO8
 4n2bT1APCSEQmT7Q0G011OkJoWArrWMb0WDzQ0TdzNVYmfRNshybGniknqm8+EhrkF
 AQy2aI8+dwU2w==
Date: Tue, 16 Jan 2024 13:49:43 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Message-ID: <20240116194943.GA301272-robh@kernel.org>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-2-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: linux4microchip@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 05:07:58PM +0530, Dharma Balasubiramani wrote:
> Convert the existing DT binding to DT schema of the Atmel's HLCDC display
> controller.
> 
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
> - Drop redundant info about bus-width description and add ref to video-interfaces.
> - Move 'additionalProperties' after 'Required'.
> - Drop parent node and it's other sub-device node which are not related here.
> - Add compatible to example 2 and add comments that bus-width is the diff between two examples.
> ---
>  .../atmel/atmel,hlcdc-display-controller.yaml | 110 ++++++++++++++++++
>  .../bindings/display/atmel/hlcdc-dc.txt       |  75 ------------
>  2 files changed, 110 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display-controller.yaml b/Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display-controller.yaml
> new file mode 100644
> index 000000000000..f022c294cfbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display-controller.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/atmel/atmel,hlcdc-display-controller.yaml#
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
> +  The LCD Controller (LCDC) consists of logic for transferring LCD image
> +  data from an external display buffer to a TFT LCD panel. The LCDC has one
> +  display input buffer per layer that fetches pixels through the single bus
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
> +      Output endpoint of the controller, connecting the LCD panel signals.
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
> +        unevaluatedProperties: false
> +        description:
> +          Endpoint connecting the LCD panel signals.
> +
> +        properties:
> +          bus-width:
> +            description: Endpoint bus width.
> +            $ref: /schemas/media/video-interfaces.yaml#
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
> +      compatible = "atmel,hlcdc-display-controller";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      port@0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0>;
> +
> +        hlcdc_panel_output: endpoint@0 {
> +          reg = <0>;
> +          remote-endpoint = <&panel_input>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    //Example 2 With a video interface override to force rgb565, bus-width=16
> +
> +    display-controller {
> +      compatible = "atmel,hlcdc-display-controller";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      port@0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0>;
> +        hlcdc_panel_output2: endpoint@0 {
> +          reg = <0>;
> +          remote-endpoint = <&panel_input>;
> +          bus-width = <16>;
> +        };
> +      };
> +    };

Just 1 extra property doesn't justify 2 examples.

In any case, drop the partial examples and just have 1 complete example 
in the MFD binding schema.

Rob
