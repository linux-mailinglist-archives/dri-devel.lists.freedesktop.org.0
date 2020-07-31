Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27923418F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 10:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB3E6EA26;
	Fri, 31 Jul 2020 08:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAAF6EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 08:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id F021EFB04;
 Fri, 31 Jul 2020 10:52:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQOtMZwUpzP6; Fri, 31 Jul 2020 10:52:55 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id AB0654537D; Fri, 31 Jul 2020 10:52:54 +0200 (CEST)
Date: Fri, 31 Jul 2020 10:52:54 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 5/5] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20200731085254.GC12560@bogon.m.sigxcpu.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200731081836.3048-6-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731081836.3048-6-laurentiu.palcu@oss.nxp.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Jul 31, 2020 at 11:18:33AM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> =

> Add bindings for iMX8MQ Display Controller Subsystem.
> =

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> ---
> Changes in v9:
>  * Include imx8mq-clock.h in the example so we can use clock names
>    instead of their values;

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


(and passed DT bindings check for me)
 -- Guido
> =

>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx=
8mq-dcss.yaml
> =

> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcs=
s.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> new file mode 100644
> index 000000000000..f1f25aa794d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> @@ -0,0 +1,108 @@
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
> +  display buffers, compose them, and drive a display using HDMI 2.0a(wit=
h HDCP
> +  2.2) or MIPI-DSI. The DCSS is intended to support up to 4kp60 displays=
. HDR10
> +  image processing capabilities are included to provide a solution capab=
le of
> +  driving next generation high dynamic range displays.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx8mq-dcss
> +
> +  reg:
> +    items:
> +      - description: DCSS base address and size, up to IRQ steer start
> +      - description: DCSS BLKCTL base address and size
> +
> +  interrupts:
> +    items:
> +      - description: Context loader completion and error interrupt
> +      - description: DTG interrupt used to signal context loader trigger=
 time
> +      - description: DTG interrupt for Vblank
> +
> +  interrupt-names:
> +    items:
> +      - const: ctxld
> +      - const: ctxld_kick
> +      - const: vblank
> +
> +  clocks:
> +    items:
> +      - description: Display APB clock for all peripheral PIO access int=
erfaces
> +      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
> +      - description: RTRAM clock
> +      - description: Pixel clock, can be driven either by HDMI phy clock=
 or MIPI
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
> +  assigned-clocks:
> +    items:
> +      - description: Phandle and clock specifier of IMX8MQ_CLK_DISP_AXI_=
ROOT
> +      - description: Phandle and clock specifier of IMX8MQ_CLK_DISP_RTRM
> +      - description: Phandle and clock specifier of either IMX8MQ_VIDEO2=
_PLL1_REF_SEL or
> +                     IMX8MQ_VIDEO_PLL1_REF_SEL
> +
> +  assigned-clock-parents:
> +    items:
> +      - description: Phandle and clock specifier of IMX8MQ_SYS1_PLL_800M
> +      - description: Phandle and clock specifier of IMX8MQ_SYS1_PLL_800M
> +      - description: Phandle and clock specifier of IMX8MQ_CLK_27M
> +
> +  assigned-clock-rates:
> +    items:
> +      - description: Must be 800 MHz
> +      - description: Must be 400 MHz
> +
> +  port:
> +    type: object
> +    description:
> +      A port node pointing to the input port of a HDMI/DP or MIPI displa=
y bridge.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    dcss: display-controller@32e00000 {
> +        compatible =3D "nxp,imx8mq-dcss";
> +        reg =3D <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> +        interrupts =3D <6>, <8>, <9>;
> +        interrupt-names =3D "ctxld", "ctxld_kick", "vblank";
> +        interrupt-parent =3D <&irqsteer>;
> +        clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>, <&clk IMX8MQ_CLK_DIS=
P_AXI_ROOT>,
> +                 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>, <&clk IMX8MQ_VIDEO2_P=
LL_OUT>,
> +                 <&clk IMX8MQ_CLK_DISP_DTRC>;
> +        clock-names =3D "apb", "axi", "rtrm", "pix", "dtrc";
> +        assigned-clocks =3D <&clk IMX8MQ_CLK_DISP_AXI>, <&clk IMX8MQ_CLK=
_DISP_RTRM>,
> +                          <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
> +        assigned-clock-parents =3D <&clk IMX8MQ_SYS1_PLL_800M>, <&clk IM=
X8MQ_SYS1_PLL_800M>,
> +                                 <&clk IMX8MQ_CLK_27M>;
> +        assigned-clock-rates =3D <800000000>,
> +                               <400000000>;
> +        port {
> +            dcss_out: endpoint {
> +                remote-endpoint =3D <&hdmi_in>;
> +            };
> +        };
> +    };
> +
> -- =

> 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
