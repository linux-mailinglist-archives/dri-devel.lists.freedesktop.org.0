Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA724142E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 02:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2F76E49B;
	Tue, 11 Aug 2020 00:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015DB6E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:36:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B85258;
 Tue, 11 Aug 2020 02:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597106211;
 bh=WT68YabTY7ddQtfmBQDHNawp8dKMoR3tuUNkUHEYri8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U/ZYWgTR0lteTac7vshe8KLcnDQhg18O1y4w88+HuaU7uRPqtIYegIMJcB/v6JOIn
 1L2sfaJ7TL0nBT1s6YOu6MjZBAJzpOjpLarFFsmxPqyg6xIVlBh6dLQK0QhfmYvFOQ
 VkGn6r82gLmg5Me9dGehE+y++xE70HnqcOPhnvSI=
Date: Tue, 11 Aug 2020 03:36:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings
Message-ID: <20200811003638.GB13513@pendragon.ideasonboard.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-2-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596713672-8146-2-git-send-email-sjakhade@cadence.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie, tomi.valkeinen@ti.com,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Swapnil,

Thank you for the patch.

On Thu, Aug 06, 2020 at 01:34:30PM +0200, Swapnil Jakhade wrote:
> From: Yuti Amonkar <yamonkar@cadence.com>
> 
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml    | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> new file mode 100644
> index 000000000000..dabccefe0983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP bridge
> +
> +maintainers:
> +  - Swapnil Jakhade <sjakhade@cadence.com>
> +  - Yuti Amonkar <yamonkar@cadence.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp8546
> +      - ti,j721e-mhdp8546
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
> +          The AUX and PMA registers are not part of this range, they are instead
> +          included in the associated PHY.
> +      - description:
> +          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: mhdptx
> +      - const: j721e-intg
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      DP bridge clock, used by the IP to know how to translate a number of
> +      clock cycles into a time (which is used to comply with DP standard timings
> +      and delays).
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      phandle to the DisplayPort PHY.
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devicetree/bindings/graph.txt.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description:
> +          Input port representing the DP bridge input.
> +
> +      port@1:
> +        type: object
> +        description:
> +          Output port representing the DP bridge output.

I've got a chance to study the J721E datasheet, and it shows the DP
bridge has 4 inputs, to support MST. Shouldn't this already be reflected
in the DT bindings ? I think it should be as simple as having 4 input
ports (port@0 to port@3) and one output port (port@4).

The bindings are ABI, so care must be taken to support all features and
avoid future changes that would break backward compatibility. It's fine
if the driver doesn't implement this feature yet.

> +
> +    required:
> +      - port@0
> +      - port@1
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,j721e-mhdp8546
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - reg-names
> +  - phys
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mhdp: dp-bridge@f0fb000000 {
> +            compatible = "cdns,mhdp8546";
> +            reg = <0xf0 0xfb000000 0x0 0x1000000>;
> +            reg-names = "mhdptx";
> +            clocks = <&mhdp_clock>;
> +            phys = <&dp_phy>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dp_bridge_input: endpoint {
> +                        remote-endpoint = <&xxx_dpi_output>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dp_bridge_output: endpoint {
> +                        remote-endpoint = <&xxx_dp_connector_input>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
