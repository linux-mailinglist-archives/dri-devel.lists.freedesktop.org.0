Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3434FE171
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1A810E74C;
	Tue, 12 Apr 2022 13:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E2910E74C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 13:00:06 +0000 (UTC)
X-UUID: 531277d26e9140148876557592f4919b-20220412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:6ea4f665-8ca7-474d-8654-f176e9ffd863, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:3,EDM:0,RT:0,SF:50,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:61
X-CID-INFO: VERSION:1.1.4, REQID:6ea4f665-8ca7-474d-8654-f176e9ffd863, OB:0,
 LOB:
 0,IP:0,URL:8,TC:0,Content:3,EDM:0,RT:0,SF:50,FILE:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:61
X-CID-META: VersionHash:faefae9, CLOUDID:6f4ee8a8-d103-4e36-82b9-b0e86991b3df,
 C
 OID:bc718b94bef8,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:4,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 531277d26e9140148876557592f4919b-20220412
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 558646684; Tue, 12 Apr 2022 21:00:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 20:59:58 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 20:59:44 +0800
Message-ID: <42bad059798a9367bbd08fc24fe09d2cc46e96f6.camel@mediatek.com>
Subject: Re: [PATCH v4, 1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Date: Tue, 12 Apr 2022 21:00:12 +0800
In-Reply-To: <0500c72cd1fd8e0c374dbd85dffc6ead4dad2467.camel@mediatek.com>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
 <1649495514-25746-2-git-send-email-xinlei.lee@mediatek.com>
 <0500c72cd1fd8e0c374dbd85dffc6ead4dad2467.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-12 at 17:17 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Sat, 2022-04-09 at 17:11 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> >  .../display/mediatek/mediatek,dsi.yaml        | 118
> > ++++++++++++++++++
> >  2 files changed, 118 insertions(+), 62 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > l
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > deleted file mode 100644
> > index 36b01458f45c..000000000000
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -Mediatek DSI Device
> > -===================
> > -
> > -The Mediatek DSI function block is a sink of the display subsystem
> > and can
> > -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for
> > dual-
> > -channel output.
> > -
> > -Required properties:
> > -- compatible: "mediatek,<chip>-dsi"
> > -- the supported chips are mt2701, mt7623, mt8167, mt8173 and
> > mt8183.
> > -- reg: Physical base address and length of the controller's
> > registers
> > -- interrupts: The interrupt signal from the function block.
> > -- clocks: device clocks
> > -  See Documentation/devicetree/bindings/clock/clock-bindings.txt
> > for
> > details.
> > -- clock-names: must contain "engine", "digital", and "hs"
> > -- phys: phandle link to the MIPI D-PHY controller.
> > -- phy-names: must contain "dphy"
> > -- port: Output port node with endpoint definitions as described in
> > -  Documentation/devicetree/bindings/graph.txt. This port should be
> > connected
> > -  to the input port of an attached DSI panel or DSI-to-eDP encoder
> > chip.
> > -
> > -Optional properties:
> > -- resets: list of phandle + reset specifier pair, as described in
> > [1].
> > -
> > -[1] Documentation/devicetree/bindings/reset/reset.txt
> > -
> > -MIPI TX Configuration Module
> > -============================
> > -
> > -See phy/mediatek,dsi-phy.yaml
> > -
> > -Example:
> > -
> > -mipi_tx0: mipi-dphy@10215000 {
> > -	compatible = "mediatek,mt8173-mipi-tx";
> > -	reg = <0 0x10215000 0 0x1000>;
> > -	clocks = <&clk26m>;
> > -	clock-output-names = "mipi_tx0_pll";
> > -	#clock-cells = <0>;
> > -	#phy-cells = <0>;
> > -	drive-strength-microamp = <4600>;
> > -	nvmem-cells= <&mipi_tx_calibration>;
> > -	nvmem-cell-names = "calibration-data";
> > -};
> > -
> > -dsi0: dsi@1401b000 {
> > -	compatible = "mediatek,mt8173-dsi";
> > -	reg = <0 0x1401b000 0 0x1000>;
> > -	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> > -	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
> > -		 <&mipi_tx0>;
> > -	clock-names = "engine", "digital", "hs";
> > -	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
> > -	phys = <&mipi_tx0>;
> > -	phy-names = "dphy";
> > -
> > -	port {
> > -		dsi0_out: endpoint {
> > -			remote-endpoint = <&panel_in>;
> > -		};
> > -	};
> > -};
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > am
> > l
> > new file mode 100644
> > index 000000000000..431bb981394f
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > am
> > l
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > 
https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml*__;Iw!!CTRNKA9wMg0ARbw!1nUf3PGHra5nGo845exNyAn1KxdDMSV2ISukRJ6hQejfVta1JOIVoNEZ5BleoA$
> >  
> > +$schema: 
> > 
https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1nUf3PGHra5nGo845exNyAn1KxdDMSV2ISukRJ6hQejfVta1JOIVoNHzl2rp1Q$
> >  
> > +
> > +title: MediaTek DSI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> 
> Replace 'CK Hu' with MediaTek DRM driver maintainer:
> 
> 	Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 	Philipp Zabel <p.zabel@pengutronix.de>
> 
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +description: |
> > +  The MediaTek DSI function block is a sink of the display
> > subsystem
> > and can
> > +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for dual-
> > +  channel output.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-dsi
> > +      - mediatek,mt7623-dsi
> > +      - mediatek,mt8167-dsi
> > +      - mediatek,mt8173-dsi
> > +      - mediatek,mt8183-dsi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Engine Clock
> > +      - description: Digital Clock
> > +      - description: HS Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: engine
> > +      - const: digital
> > +      - const: hs
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dphy
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      Output port node. This port should be connected to the input
> > +      port of an attached DSI panel or DSI-to-eDP encoder chip.
> > +
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/reset/mt8183-resets.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        dsi0: dsi@14014000 {
> > +            compatible = "mediatek,mt8183-dsi";
> > +            reg = <0 0x14014000 0 0x1000>;
> > +            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> > +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +            clocks = <&mmsys CLK_MM_DSI0_MM>,
> > +                <&mmsys CLK_MM_DSI0_IF>,
> > +                <&mipi_tx0>;
> > +            clock-names = "engine", "digital", "hs";
> > +            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> > +            phys = <&mipi_tx0>;
> > +            phy-names = "dphy";
> > +            port {
> > +                dsi0_out: endpoint {
> > +                    remote-endpoint = <&panel_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> 
> 

Hi CK:

Thanks for your review.
I will replace in the next version.

Best Regards!
xinlei

