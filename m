Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4151A8912
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2536E25C;
	Tue, 14 Apr 2020 18:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5CE6E25C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:18:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id ABE0380441;
 Tue, 14 Apr 2020 20:18:48 +0200 (CEST)
Date: Tue, 14 Apr 2020 20:18:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: Document the Synopsys ARC HDMI TX
 bindings
Message-ID: <20200414181847.GB21071@ravnborg.org>
References: <20200414144402.27643-1-Eugeniy.Paltsev@synopsys.com>
 <20200414144402.27643-3-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414144402.27643-3-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=jIQo8A4GAAAA:8
 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8 a=_sfh-jedi5NWomO9Eu8A:9
 a=Bidoa8gpE23jXAbx:21 a=7WcnEqVqqvUY8Xlb:21 a=CjuIK1q_8ugA:10
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eugeniy.

On Tue, Apr 14, 2020 at 05:44:02PM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> HDMI 2.0 TX encoder driver for ARC SoCs.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

with a few nits addressed.

As already mentioned - the filename confuses.
Maybe tell why in changelog - og fix filename to follow compatible.

> ---
>  .../display/bridge/snps,arc-dw-hdmi.yaml      | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> new file mode 100644
> index 000000000000..f52fc3b114b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/snps,arc-dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI 2.0 TX encoder driver
> +
> +maintainers:
> +  - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
> +  with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.
> +
> +  These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> +  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> +  with the following device-specific properties.
> +
> +properties:
> +  compatible:
> +    const: snps,dw-hdmi-hsdk
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Memory mapped base address and length of the DWC HDMI TX registers.
> +
> +  clocks:
> +    items:
> +      - description: The bus clock for AHB / APB
> +      - description: The internal register configuration clock
> +
> +  clock-names:
> +    items:
> +      - const: iahb
> +      - const: isfr
> +
> +  reg-io-width:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 4]
> +        description:
> +          Width of the registers specified by the reg property. The
> +          value is expressed in bytes and must be equal to 1 or 4 if specified.
> +          The register width defaults to 1 if the property is not present.
> +
> +  ports:
> +    type: object
> +    description: |
> +      A ports node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
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
> +        description: |
> +          Video input endpoints of the controller.
> +          Usually the associated with PGU.
Please rephrase this sentence. I am not sure how to read it.

> +
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller. HDMI connector.
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
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi: hdmi@0x10000 {
hdmi
> +        compatible = "snps,dw-hdmi-hsdk";
> +        reg = <0x10000 0x10000>;
> +        reg-io-width = <4>;
> +        interrupts = <14>;
> +        clocks = <&apbclk>, <&hdmi_pix_clk>;
> +        clock-names = "iahb", "isfr";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                hdmi_enc_input: endpoint {
> +                    remote-endpoint = <&pgu_output>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                hdmi_enc_out: endpoint {
> +                    remote-endpoint = <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> +
> +    hdmi-out {
> +        port {
> +            hdmi_con: endpoint {
> +                remote-endpoint = <&hdmi_enc_out>;
> +            };
> +        };
> +    };
> +
> +    pgu {
> +        port_o: port {
> +            pgu_output: endpoint {
> +                remote-endpoint = <&hdmi_enc_input>;
> +            };
> +        };
> +    };
> -- 
> 2.21.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
