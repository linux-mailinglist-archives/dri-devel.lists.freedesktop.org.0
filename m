Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4CD4FD33C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271A10FC3E;
	Tue, 12 Apr 2022 09:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0087010FC3E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:17:24 +0000 (UTC)
X-UUID: 12a903a30dd44d17963fff0be0d7d5d8-20220412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:304400b8-5cac-4589-8035-78d29b59493d, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:50,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:58
X-CID-INFO: VERSION:1.1.4, REQID:304400b8-5cac-4589-8035-78d29b59493d, OB:0,
 LOB:
 0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:50,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:58
X-CID-META: VersionHash:faefae9, CLOUDID:04c5e2a8-d103-4e36-82b9-b0e86991b3df,
 C
 OID:f7ad10c0c629,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 12a903a30dd44d17963fff0be0d7d5d8-20220412
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1145291233; Tue, 12 Apr 2022 17:17:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Apr 2022 17:17:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 17:17:18 +0800
Message-ID: <0500c72cd1fd8e0c374dbd85dffc6ead4dad2467.camel@mediatek.com>
Subject: Re: [PATCH v4, 1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Date: Tue, 12 Apr 2022 17:17:17 +0800
In-Reply-To: <1649495514-25746-2-git-send-email-xinlei.lee@mediatek.com>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
 <1649495514-25746-2-git-send-email-xinlei.lee@mediatek.com>
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

Hi, Xinlei:

On Sat, 2022-04-09 at 17:11 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
>  .../display/mediatek/mediatek,dsi.yaml        | 118
> ++++++++++++++++++
>  2 files changed, 118 insertions(+), 62 deletions(-)
>  delete mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> deleted file mode 100644
> index 36b01458f45c..000000000000
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Mediatek DSI Device
> -===================
> -
> -The Mediatek DSI function block is a sink of the display subsystem
> and can
> -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for
> dual-
> -channel output.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's
> registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for
> details.
> -- clock-names: must contain "engine", "digital", and "hs"
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be
> connected
> -  to the input port of an attached DSI panel or DSI-to-eDP encoder
> chip.
> -
> -Optional properties:
> -- resets: list of phandle + reset specifier pair, as described in
> [1].
> -
> -[1] Documentation/devicetree/bindings/reset/reset.txt
> -
> -MIPI TX Configuration Module
> -============================
> -
> -See phy/mediatek,dsi-phy.yaml
> -
> -Example:
> -
> -mipi_tx0: mipi-dphy@10215000 {
> -	compatible = "mediatek,mt8173-mipi-tx";
> -	reg = <0 0x10215000 0 0x1000>;
> -	clocks = <&clk26m>;
> -	clock-output-names = "mipi_tx0_pll";
> -	#clock-cells = <0>;
> -	#phy-cells = <0>;
> -	drive-strength-microamp = <4600>;
> -	nvmem-cells= <&mipi_tx_calibration>;
> -	nvmem-cell-names = "calibration-data";
> -};
> -
> -dsi0: dsi@1401b000 {
> -	compatible = "mediatek,mt8173-dsi";
> -	reg = <0 0x1401b000 0 0x1000>;
> -	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
> -		 <&mipi_tx0>;
> -	clock-names = "engine", "digital", "hs";
> -	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
> -	phys = <&mipi_tx0>;
> -	phy-names = "dphy";
> -
> -	port {
> -		dsi0_out: endpoint {
> -			remote-endpoint = <&panel_in>;
> -		};
> -	};
> -};
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> new file mode 100644
> index 000000000000..431bb981394f
> --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml*__;Iw!!CTRNKA9wMg0ARbw!1nUf3PGHra5nGo845exNyAn1KxdDMSV2ISukRJ6hQejfVta1JOIVoNEZ5BleoA$
>  
> +$schema: 
> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1nUf3PGHra5nGo845exNyAn1KxdDMSV2ISukRJ6hQejfVta1JOIVoNHzl2rp1Q$
>  
> +
> +title: MediaTek DSI Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>

Replace 'CK Hu' with MediaTek DRM driver maintainer:

	Chun-Kuang Hu <chunkuang.hu@kernel.org>
	Philipp Zabel <p.zabel@pengutronix.de>

> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +description: |
> +  The MediaTek DSI function block is a sink of the display subsystem
> and can
> +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> for dual-
> +  channel output.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dsi
> +      - mediatek,mt7623-dsi
> +      - mediatek,mt8167-dsi
> +      - mediatek,mt8173-dsi
> +      - mediatek,mt8183-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Engine Clock
> +      - description: Digital Clock
> +      - description: HS Clock
> +
> +  clock-names:
> +    items:
> +      - const: engine
> +      - const: digital
> +      - const: hs
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port should be connected to the input
> +      port of an attached DSI panel or DSI-to-eDP encoder chip.
> +
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/mt8183-resets.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dsi0: dsi@14014000 {
> +            compatible = "mediatek,mt8183-dsi";
> +            reg = <0 0x14014000 0 0x1000>;
> +            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +            clocks = <&mmsys CLK_MM_DSI0_MM>,
> +                <&mmsys CLK_MM_DSI0_IF>,
> +                <&mipi_tx0>;
> +            clock-names = "engine", "digital", "hs";
> +            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> +            phys = <&mipi_tx0>;
> +            phy-names = "dphy";
> +            port {
> +                dsi0_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

