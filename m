Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C24CD3F2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 13:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8910F30A;
	Fri,  4 Mar 2022 12:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8CB10F303
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 12:03:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 64CE31F46649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646395418;
 bh=XpAzJvb+GVH+2SCPpPI7qbwtiD8hua3WPwflOJsyPPY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gZtJuURO4W0mnhLtB38xAdJ3cdvMB7FrXPlaxb6oi6+JZKm9ojcJBjTFsEzjXukaZ
 67G97REeiCebwJQ9oe1vab/ndYVoWnzx/aiN5WEQxHp4MHarWxKBlqh7LU/61nmFqN
 UfSB3sXqrk1OdGwNt2bCofCtAhO6HZAboQo2xOmJJQnSeVOkcpHModeurFD+qGqffA
 EncxG+jNU7L/IT2JuU2HUs9HN7nGmbCpbggpoHJ2TOrFq8+QZONRSlId1IW57P+jLW
 zlTq2VOB9m+/zVz6AraDIneiDezqngfbo5BP4eJKQwvGLyl5k+kI10vNUoaOP0PfUq
 mNlRqDtadrmFg==
Message-ID: <386e5a59-8b06-58f5-90d0-2c5a5eaa614f@collabora.com>
Date: Fri, 4 Mar 2022 13:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2, 1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   .../display/mediatek/mediatek,dsi.txt         | 62 --------------
>   .../display/mediatek/mediatek,dsi.yaml        | 85 +++++++++++++++++++
>   2 files changed, 85 insertions(+), 62 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> deleted file mode 100644
> index 36b01458f45c..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Mediatek DSI Device
> -===================
> -
> -The Mediatek DSI function block is a sink of the display subsystem and can
> -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
> -channel output.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "engine", "digital", and "hs"
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be connected
> -  to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
> -
> -Optional properties:
> -- resets: list of phandle + reset specifier pair, as described in [1].
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
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> new file mode 100644
> index 000000000000..552a013786fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek DSI Controller Device Tree Bindings

Shouldn't this be "MediaTek"?

> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dsi
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
> +      - description: Hs Clock

HS should be all capital letters.

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

Add #address-cells, #size-cells with const 2

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

Since all users are using two address and size cells:

     soc {
         #address-cells = <2>;
         #size-cells = <2>;

         dsi0: dsi@14014000 {
             compatible = "mediatek,mt8183-dsi";
             reg = <0 0x14014000 0 0x1000>;
                   .....etc.....
         };
     };

> +    dsi0: dsi@14014000 {
> +        compatible = "mediatek,mt8183-dsi";
> +        reg = <0x14014000 0x1000>;
> +        interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +        clocks = <&mmsys CLK_MM_DSI0_MM>,
> +            <&mmsys CLK_MM_DSI0_IF>,
> +            <&mipi_tx0>;
> +        clock-names = "engine", "digital", "hs";
> +        resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> +        phys = <&mipi_tx0>;
> +        phy-names = "dphy";
> +    };


