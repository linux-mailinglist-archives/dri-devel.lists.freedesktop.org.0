Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A116AD15
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 18:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3736E5D4;
	Mon, 24 Feb 2020 17:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA106E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 17:22:03 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j6HQc-0002l7-Tk; Mon, 24 Feb 2020 18:21:58 +0100
Message-ID: <7716263db71ca07a52e5a562882f0ae7f35fee48.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: imx: add bindings for DCSS
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Date: Mon, 24 Feb 2020 18:21:57 +0100
In-Reply-To: <1575625964-27102-4-git-send-email-laurentiu.palcu@nxp.com>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
 <1575625964-27102-4-git-send-email-laurentiu.palcu@nxp.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2019-12-06 at 11:52 +0200, Laurentiu Palcu wrote:
> Add bindings for iMX8MQ Display Controller Subsystem.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml      | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> new file mode 100644
> index 00000000..efd2494
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 NXP
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/imx/nxp,imx8mq-dcss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: iMX8MQ Display Controller Subsystem (DCSS)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@nxp.com>
> +
> +description:
> +
> +  The DCSS (display controller sub system) is used to source up to three
> +  display buffers, compose them, and drive a display using HDMI 2.0a(with HDCP
> +  2.2) or MIPI-DSI.

HDMI 2.0a and MIPI_DSI are not really properties of the DCSS, but
rather the connected bridges. Maybe just drop them here?

>  The DCSS is intended to support up to 4kp60 displays. HDR10
> +  image processing capabilities are included to provide a solution capable of
> +  driving next generation high dynamic range displays.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx8mq-dcss
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 3
> +    items:
> +      - description: Context loader completion and error interrupt
> +      - description: DTG interrupt used to signal context loader trigger time
> +      - description: DTG interrupt for Vblank
> +
> +  interrupt-names:
> +    maxItems: 3
> +    items:
> +      - const: ctx_ld

Can we make this just "ctxld" for a bit more consistency with the name
below?

> +      - const: ctxld_kick
> +      - const: vblank
> +
> +  clocks:
> +    maxItems: 5
> +    items:
> +      - description: Display APB clock for all peripheral PIO access interfaces
> +      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
> +      - description: RTRAM clock
> +      - description: Pixel clock, can be driver either by HDMI phy clock or MIPI
> +      - description: DTRC clock, needed by video decompressor
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: rtrm
> +      - const: pix
> +      - const: dtrc
> +
> +  port@0:
> +    type: object
> +    description: A port node pointing to a hdmi_in or mipi_in port node.

"A port node pointing to the input port of a HDMI/DP or MIPI display
bridge".

> +
> +examples:
> +  - |
> +    dcss: display-controller@32e00000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "nxp,imx8mq-dcss";
> +        reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> +        interrupts = <6>, <8>, <9>;
> +        interrupt-names = "ctx_ld", "ctxld_kick", "vblank";
> +        interrupt-parent = <&irqsteer>;
> +        clocks = <&clk 248>, <&clk 247>, <&clk 249>,
> +                 <&clk 254>,<&clk 122>;
> +        clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
> +        assigned-clocks = <&clk 107>, <&clk 109>, <&clk 266>;
> +        assigned-clock-parents = <&clk 78>, <&clk 78>, <&clk 3>;
> +        assigned-clock-rates = <800000000>,
> +                               <400000000>;
> +        port@0 {
> +            dcss_out: endpoint {
> +                remote-endpoint = <&hdmi_in>;
> +            };
> +        };
> +    };
> +

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
