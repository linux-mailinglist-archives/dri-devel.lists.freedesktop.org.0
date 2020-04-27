Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308D1BAD28
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 20:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD886E092;
	Mon, 27 Apr 2020 18:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DEE6E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 18:49:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 062D220026;
 Mon, 27 Apr 2020 20:49:15 +0200 (CEST)
Date: Mon, 27 Apr 2020 20:49:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <20200427184909.GA15880@ravnborg.org>
References: <cover.1587880280.git.xji@analogixsemi.com>
 <67ccead807b7d0a50df479cab2c9d325041224bc.1587880280.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67ccead807b7d0a50df479cab2c9d325041224bc.1587880280.git.xji@analogixsemi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=bbNUuHX0AAAA:8 a=gEfo2CItAAAA:8
 a=5HKp4fn5R8_46mwjT_sA:9 a=tXNADfTO3e5-O_bI:21 a=RL_1sUc0Wx0J8rAF:21
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=3b-t3vAtY4IUXy2q2Ylb:22
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin Ji

On Mon, Apr 27, 2020 at 02:17:46PM +0800, Xin Ji wrote:
> The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> for portable device. It converts MIPI to DisplayPort 1.3 4K.

Thanks for providing this binding.
When you re-submit please also send to devicetree@vger.kernel.org.

Running the binding through dt_binding_check gives me:

/home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml: ignoring, error in schema:
warning: no schema found in file: /home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
make[2]: *** [/home/sam/drm/linux.git/Documentation/devicetree/bindings/Makefile:42: Documentation/devicetree/bindings/processed-schema.yaml] Error 255
make[2]: *** Waiting for unfinished jobs....
/home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml: Additional properties are not allowed ('example' was unexpected)
/home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml: Additional properties are not allowed ('example' was unexpected)

See writing-schemas.rst for instruction installing tools etc.

> 
> You can add support to your board with binding.
> 
> Example:
> 	anx7625_bridge: encoder@58 {
> 		compatible = "analogix,anx7625";
> 		reg = <0x58>;
> 		status = "okay";
> 		panel-flags = <1>;
> 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		port@0 {
> 		  reg = <0>;
> 		  anx_1_in: endpoint {
> 		    remote-endpoint = <&mipi_dsi>;
> 		  };
> 		};
> 
> 		port@2 {
> 		  reg = <2>;
> 		  anx_1_out: endpoint {
> 		    remote-endpoint = <&panel_in>;
> 		  };
> 		};
> 	};
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/anx7625.yaml           | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
> new file mode 100644
> index 0000000..1149ebb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx7625.yaml

Name the file "analogix,anx7625.yaml".
(We should rename anx6345.yaml, so others do not omit the company name)

> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Analogix Semiconductor, Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/anx7625.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
> +
> +maintainers:
> +  - Xin Ji <xji@analogixsemi.com>
> +
> +description: |
> +  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> +  designed for portable devices.
> +
> +properties:
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +  compatible:
> +    items:
> +      - const: analogix,anx7625
> +
> +  reg:
> +    maxItems: 1
> +
> +  panel-flags:
> +    description: indicate the panel is internal or external.
> +    maxItems: 1
This property hint at something needs to be modelled in a different way.
I do not recall other bindings need similar info.

> +
> +  interrupts:
> +    maxItems: 1
A description would be nice.

> +
> +  enable-gpios:
> +    description: used for power on chip control, POWER_EN pin D2.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: used for reset chip control, RESET_N pin B7.
> +    maxItems: 1
> +
> +  port@0:
> +    type: object
> +    description:
> +      A port node pointing to MIPI DSI host port node.
> +
> +  port@1:
> +    type: object
> +    description:
> +      A port node pointing to MIPI DPI host port node.
Maybe explain how it differs from port@0 and why it is optional.

> +
> +  port@2:
> +    type: object
> +    description:
> +      A port node pointing to panel port node.
Unless there is a good reason not to then please use a ports node, like
you see in almost (all?) other bridge bindings.

> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - port@0
> +  - port@2

additionalProperties: false??


> +
> +example:
It must be named "examples:" - this is what dt_binding_check complains
about.

> +  - |
> +    anx7625_bridge: encoder@58 {
> +        compatible = "analogix,anx7625";
> +        reg = <0x58>;
> +        status = "okay";
No status in examples.

> +        panel-flags = <1>;
> +        enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
You need to include a header file to pull in GPIO_ACTIVE_HIGH - see what
other bindings do.
> +        reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
Be consistent with indent. My personal preference is 4 spaces.

> +          anx_1_in: endpoint {
> +            remote-endpoint = <&mipi_dsi>;
> +          };
> +        };
> +
> +        port@2 {
> +          reg = <2>;
> +          anx_1_out: endpoint {
> +            remote-endpoint = <&panel_in>;
> +          };
> +        };
> +    };

Lot's of small comments. But if this is your first binding then this is
expected.
Looks forward for v2.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
