Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AE8578EF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F0D10E4DF;
	Fri, 16 Feb 2024 09:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uNUjB6Gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E79E10E4DF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:36:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8B746B3;
 Fri, 16 Feb 2024 10:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1708076212;
 bh=FqIG4hQ/2p90XglkBfcZ3NnAeisl+tmJAkWr6NZhF0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uNUjB6Gw3OxkvkHlmGSI/pkrf1LZkc1jpT/X9oJcmmrO5PwnbIe8er7efnoLnnde4
 EJCR+DW8RAqM7mraBwyYb41PjGtQ2zQu7cWh/h/nBhV0w0TvfPG5Urbm3zm5QqRtJz
 JzCOTixie+sNZIGN5ZidIK9mD6GREBUJXuiNf14Q=
Date: Fri, 16 Feb 2024 11:37:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 marex@denx.de, frieder.schrempf@kontron.de,
 Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 09/12] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Message-ID: <20240216093700.GA10584@pendragon.ideasonboard.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-10-aford173@gmail.com>
 <5916132.MhkbZ0Pkbq@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5916132.MhkbZ0Pkbq@steina-w>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 16, 2024 at 10:05:26AM +0100, Alexander Stein wrote:
> Hi all,
> 
> Am Samstag, 3. Februar 2024, 17:52:49 CET schrieb Adam Ford:
> > From: Lucas Stach <l.stach@pengutronix.de>
> > 
> > The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> > core with a little bit of SoC integration around it.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > 
> > ---
> > V3:  Change name and location to better idenfity as a bridge and
> >      HDMI 2.0a transmitter
> > 
> >      Fix typos and feedback from Rob and added ports.
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 102 ++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> > new file mode 100644
> > index 000000000000..3791c9f4ebab
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Lucas Stach <l.stach@pengutronix.de>
> > +
> > +description:
> > +  The i.MX8MP HDMI transmitter is a Synopsys DesignWare
> > +  HDMI 2.0a TX controller IP.
> > +
> > +allOf:
> > +  - $ref: /schemas/display/bridge/synopsys,dw-hdmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mp-hdmi-tx
> > +
> > +  reg-io-width:
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iahb
> > +      - const: isfr
> > +      - const: cec
> > +      - const: pix
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel RGB input port
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: HDMI output port
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> 
> Is this really correct that port@1 is required? AFAICS this host already 
> supports HPD and DDC by itself, so there is no need for a dedicated HDMI 
> connector.

The chip has an HDMI output, so there's an output port.

> With the current state of the drivers this output port is completely ignored 
> anyway. Yet it works for a lot of people.

DT bindings describe the hardware. From a DT point of view, tt's fine
for drivers to ignore the port (that may or may not be true from a DRM
point of view, but that's a separate discussion).

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - power-domains
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    hdmi@32fd8000 {
> > +        compatible = "fsl,imx8mp-hdmi-tx";
> > +        reg = <0x32fd8000 0x7eff>;
> > +        interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
> > +                 <&clk IMX8MP_CLK_HDMI_REF_266M>,
> > +                 <&clk IMX8MP_CLK_32K>,
> > +                 <&hdmi_tx_phy>;
> > +        clock-names = "iahb", "isfr", "cec", "pix";
> > +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
> > +        reg-io-width = <1>;
> > +        ports {
> > +           #address-cells = <1>;
> > +           #size-cells = <0>;
> > +           port@0 {
> > +             reg = <0>;
> > +
> > +             hdmi_tx_from_pvi: endpoint {
> > +               remote-endpoint = <&pvi_to_hdmi_tx>;
> > +             };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +              hdmi_tx_out: endpoint {
> > +                remote-endpoint = <&hdmi0_con>;
> > +              };
> > +          };
> > +        };
> > +    };

-- 
Regards,

Laurent Pinchart
