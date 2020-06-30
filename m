Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB720F23B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 12:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BC789D42;
	Tue, 30 Jun 2020 10:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045FD89C33
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 10:08:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EF6C280554;
 Tue, 30 Jun 2020 12:08:42 +0200 (CEST)
Date: Tue, 30 Jun 2020 12:08:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: Add ingenic,ipu.yaml
Message-ID: <20200630100841.GA553950@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-2-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=zaYY7jrkgZO2RDDRebYA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 01:52:02AM +0200, Paul Cercueil wrote:
> Add documentation of the Device Tree bindings for the Image Processing
> Unit (IPU) found in most Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Do not know the IPU but looks correct.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Notes:
>     v2: Add missing 'const' in items list
> 
>  .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,ipu.yaml b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> new file mode 100644
> index 000000000000..5bfc33eb32c9
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
> +        - const: ingenic,jz4770-ipu
> +        - const: ingenic,jz4760-ipu
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
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
