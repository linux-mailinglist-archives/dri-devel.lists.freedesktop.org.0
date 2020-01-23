Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A01470D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 19:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA896FE29;
	Thu, 23 Jan 2020 18:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B510B6FE29
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 18:32:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5C32120031;
 Thu, 23 Jan 2020 19:32:42 +0100 (CET)
Date: Thu, 23 Jan 2020 19:32:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v8 1/5] dt-bindings: display: ti, k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20200123183240.GD17233@ravnborg.org>
References: <cover.1579553817.git.jsarha@ti.com>
 <048190779ef056f407e812f85e955b6eecdf6cef.1579553817.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <048190779ef056f407e812f85e955b6eecdf6cef.1579553817.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=yvRlycOsFd3cc9s2ybcA:9
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 subhajit_paul@ti.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri.

dt_binding_check gives following warning:
 CHECK   Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dt.yaml
Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dt.yaml: dss@02540000: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dt.yaml: dss@02540000: 'port' is a required property

The ports definition in the yaml file does not looks like
what you have in the other yaml files.

The rest was fine - not other warnings in my build testing.

When you have the above warning fixed then I suggest you apply
the driver to drm-misc-next.
And then handle eventual updates in-tree.

If you lack commit-access I can commit the driver, but you should apply
for commit access theni, allowing you to maintain the driver in the future.

	Sam

On Mon, Jan 20, 2020 at 11:02:20PM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>     - Remove ports node
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> v6: - Add Reviewed-by: from Rob Herring <robh@kernel.org> and
>       Benoit Parrot <bparrot@ti.com>
> 
> v7: no change
> 
> v8: no change
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> new file mode 100644
> index 000000000000..532bb4794968
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments K2G Display Subsystem
> +
> +maintainers:
> +  - Jyri Sarha <jsarha@ti.com>
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +description: |
> +  The K2G DSS is an ultra-light version of TI Keystone Display
> +  SubSystem. It has only one output port and video plane. The
> +  output is DPI.
> +
> +properties:
> +  compatible:
> +    const: ti,k2g-dss
> +
> +  reg:
> +    items:
> +      - description: cfg DSS top level
> +      - description: common DISPC common
> +      - description: VID1 video plane 1
> +      - description: OVR1 overlay manager for vp1
> +      - description: VP1 video port 1
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: common
> +      - const: vid1
> +      - const: ovr1
> +      - const: vp1
> +
> +  clocks:
> +    items:
> +      - description: fck DSS functional clock
> +      - description: vp1 Video Port 1 pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: vp1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  port:
> +    type: object
> +    description:
> +      Port as described in Documentation/devictree/bindings/graph.txt.
> +      The DSS DPI output port node
> +
> +  max-memory-bandwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Input memory (from main memory to dispc) bandwidth limit in
> +      bytes per second
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    dss: dss@02540000 {
> +            compatible = "ti,k2g-dss";
> +            reg =   <0x02540000 0x400>,
> +                    <0x02550000 0x1000>,
> +                    <0x02557000 0x1000>,
> +                    <0x0255a800 0x100>,
> +                    <0x0255ac00 0x100>;
> +            reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
> +            clocks =        <&k2g_clks 0x2 0>,
> +                            <&k2g_clks 0x2 1>;
> +            clock-names = "fck", "vp1";
> +            interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
> +
> +            power-domains = <&k2g_pds 0x2>;
> +
> +            max-memory-bandwidth = <230000000>;
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                            dpi_out: endpoint {
> +                                    remote-endpoint = <&sii9022_in>;
> +                            };
> +                    };
> +            };
> +    };
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
