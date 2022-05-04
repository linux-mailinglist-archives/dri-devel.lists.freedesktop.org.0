Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E6519971
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800A310EA11;
	Wed,  4 May 2022 08:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036310EA11
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:15:59 +0000 (UTC)
X-UUID: 21d90d16125948628360cade69d418a3-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:693f7aeb-331c-419d-9a4e-2ecb47e9cdaa, OB:0,
 LO
 B:20,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:53
X-CID-INFO: VERSION:1.1.4, REQID:693f7aeb-331c-419d-9a4e-2ecb47e9cdaa, OB:0,
 LOB:
 20,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:53
X-CID-META: VersionHash:faefae9, CLOUDID:8bb371c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:8251d87da193,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 21d90d16125948628360cade69d418a3-20220504
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1050801728; Wed, 04 May 2022 16:15:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 16:15:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 May 2022 16:15:53 +0800
Message-ID: <003b87fabbedc776d74c0a542dc3ae5bcb0bbdf2.camel@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 4 May 2022 16:15:53 +0800
In-Reply-To: <YnFt5vL+6uVioqsf@robh.at.kernel.org>
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-2-rex-bc.chen@mediatek.com>
 <YnFt5vL+6uVioqsf@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-05-03 at 13:01 -0500, Rob Herring wrote:
> On Thu, Apr 28, 2022 at 09:37:50PM +0800, Rex-BC Chen wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> >  .../display/mediatek/mediatek,dsi.yaml        | 122
> > ++++++++++++++++++
> >  2 files changed, 122 insertions(+), 62 deletions(-)
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
> > for dual-
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
> > for details.
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
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > new file mode 100644
> > index 000000000000..2ca9229ef69e
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > @@ -0,0 +1,122 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml*__;Iw!!CTRNKA9wMg0ARbw!w60__6oza0dggkQt6zWF-ZnYUKobclO7i3x9kiS1CETGQlCVcifs6UfqytY8vunKIJlM$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!w60__6oza0dggkQt6zWF-ZnYUKobclO7i3x9kiS1CETGQlCVcifs6UfqytY8vns85I56$
> >  
> > +
> > +title: MediaTek DSI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +description: |
> > +  The MediaTek DSI function block is a sink of the display
> > subsystem and can
> > +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for dual-
> > +  channel output.
> > +
> > +allOf:
> > +  - $ref: /schemas/display/dsi-controller.yaml#
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
> 
> 1 blank line
> 
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> 
> Did you try adding these? Because they are wrong and will contradict 
> dsi-controller.yaml.
> 

Hello Rob,

Sorry, I response something wrong in previous letter.
We could have sub nodes in mediatek dsi.
But we do not need to define this:
  "#address-cells":
    const: 2

  "#size-cells":
    const: 2

I will drop them. Thanks!

BRs,
Rex

> Rob

