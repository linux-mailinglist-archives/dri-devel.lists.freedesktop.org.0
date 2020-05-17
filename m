Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8891D664D
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 08:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDDA6E3B7;
	Sun, 17 May 2020 06:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C203A6E3B7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 06:17:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7C71F8052B;
 Sun, 17 May 2020 08:17:11 +0200 (CEST)
Date: Sun, 17 May 2020 08:17:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/12] dt-bindings: display: Add ingenic,ipu.yaml
Message-ID: <20200517061710.GB609600@ravnborg.org>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516215057.392609-2-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8
 a=b0PC0ugUiK8WXcUa1NUA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.
On Sat, May 16, 2020 at 11:50:47PM +0200, Paul Cercueil wrote:
> Add documentation of the Device Tree bindings for the Image Processing
> Unit (IPU) found in most Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

For me it fails like this:

/Documentation/devicetree/bindings/display/ingenic,ipu.yaml: ignoring, error in schema: properties: compatible: oneOf: 1: items
warning: no schema found in file: Documentation/devicetree/bindings/display/ingenic,ipu.yaml
make[2]: *** [Documentation/devicetree/bindings/Makefile:42: Documentation/devicetree/bindings/processed-schema.yaml] Error 255
make[2]: *** Waiting for unfinished jobs....
Documentation/devicetree/bindings/display/ingenic,ipu.yaml: properties:compatible:oneOf:1:items: ['ingenic,jz4770-ipu', 'ingenic,jz4760-ipu'] is not valid under any of the given schemas (Possible causes of the failure):
	Documentation/devicetree/bindings/display/ingenic,ipu.yaml: properties:compatible:oneOf:1:items: ['ingenic,jz4770-ipu', 'ingenic,jz4760-ipu'] is not of type 'object', 'boolean'
	Documentation/devicetree/bindings/display/ingenic,ipu.yaml: properties:compatible:oneOf:1:items:0: 'ingenic,jz4770-ipu' is not of type 'object', 'boolean'
	Documentation/devicetree/bindings/display/ingenic,ipu.yaml: properties:compatible:oneOf:1:items:1: 'ingenic,jz4760-ipu' is not of type 'object', 'boolean'


	Sam

> ---
>  .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,ipu.yaml b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> new file mode 100644
> index 000000000000..22fe02ca866d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,ipu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs Image Processing Unit (IPU) devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4725b-ipu
> +        - ingenic,jz4760-ipu
> +      - items:
> +        - ingenic,jz4770-ipu
> +        - ingenic,jz4760-ipu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ipu
> +
> +patternProperties:
> +  "^ports?$":
> +    description: OF graph bindings (specified in bindings/graph.txt).
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4770-cgu.h>
> +    ipu@13080000 {
> +      compatible = "ingenic,jz4770-ipu", "ingenic,jz4760-ipu";
> +      reg = <0x13080000 0x800>;
> +
> +      interrupt-parent = <&intc>;
> +      interrupts = <29>;
> +
> +      clocks = <&cgu JZ4770_CLK_IPU>;
> +      clock-names = "ipu";
> +
> +      port {
> +        ipu_ep: endpoint {
> +          remote-endpoint = <&lcdc_ep>;
> +        };
> +      };
> +    };
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
