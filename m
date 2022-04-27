Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46114510EDE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2135610EF1C;
	Wed, 27 Apr 2022 02:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7A010EF1B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:37:28 +0000 (UTC)
X-UUID: 9cf0da403a364a27b6f0cfb29ac46529-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c7a6c5d6-07c6-4429-b661-343050221648, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:8959d22e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9cf0da403a364a27b6f0cfb29ac46529-20220427
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1691933045; Wed, 27 Apr 2022 10:37:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 10:37:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 10:37:21 +0800
Message-ID: <34229a8ae0d051e671e1fe54c282d5ca7949278f.camel@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: add ethdr definition for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Date: Wed, 27 Apr 2022 10:37:21 +0800
In-Reply-To: <YmbNgQ+t/mUrLhis@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-6-rex-bc.chen@mediatek.com>
 <YmbNgQ+t/mUrLhis@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the review.

On Mon, 2022-04-25 at 11:34 -0500, Rob Herring wrote:
> On Tue, Apr 19, 2022 at 11:32:37AM +0800, Rex-BC Chen wrote:
> > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > 
> > Add vdosys1 ETHDR definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,ethdr.yaml      | 158
> > ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.y
> > aml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > new file mode 100644
> > index 000000000000..e8303c28a361
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml*__;Iw!!CTRNKA9wMg0ARbw!z6Qb786guKB3dY5cad1rD-jjAKgb98adNO0iLltNXsUykBP5Dsa0vYrk8jqJVUow$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!z6Qb786guKB3dY5cad1rD-jjAKgb98adNO0iLltNXsUykBP5Dsa0vYrk8uKJDTkb$
> >  
> > +
> > +title: MediaTek Ethdr Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +description: |
> 
> No need for '|' unless you have formatting to preserve.
> 

OK, I will remove it.

> > +  ETHDR is designed for HDR video and graphics conversion in the
> > external display path.
> > +  It handles multiple HDR input types and performs tone mapping,
> > color space/color
> > +  format conversion, and then combine different layers, output the
> > required HDR or
> > +  SDR signal to the subsequent display path. This engine is
> > composed of two video
> > +  frontends, two graphic frontends, one video backend and a mixer.
> > ETHDR has two
> > +  DMA function blocks, DS and ADL. These two function blocks read
> > the pre-programmed
> > +  registers from DRAM and set them to HW in the v-blanking period.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-disp-ethdr
> 
> blank line between DT properties.

OK, I will add blank line between DT properties.
> 
> > +  reg:
> > +    maxItems: 7
> > +  reg-names:
> > +    items:
> > +      - const: mixer
> > +      - const: vdo_fe0
> > +      - const: vdo_fe1
> > +      - const: gfx_fe0
> > +      - const: gfx_fe1
> > +      - const: vdo_be
> > +      - const: adl_ds
> > +  interrupts:
> > +    minItems: 1
> 
> maxItems: 1
> 
OK, I will fix it.

> > +  iommus:
> > +    description: The compatible property is DMA function blocks.
> > +      Should point to the respective IOMMU block with master port
> > as argument,
> > +      see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > +      details.
> > +    minItems: 1
> > +    maxItems: 2
> > +  clocks:
> > +    items:
> > +      - description: mixer clock
> > +      - description: video frontend 0 clock
> > +      - description: video frontend 1 clock
> > +      - description: graphic frontend 0 clock
> > +      - description: graphic frontend 1 clock
> > +      - description: video backend clock
> > +      - description: autodownload and menuload clock
> > +      - description: video frontend 0 async clock
> > +      - description: video frontend 1 async clock
> > +      - description: graphic frontend 0 async clock
> > +      - description: graphic frontend 1 async clock
> > +      - description: video backend async clock
> > +      - description: ethdr top clock
> > +  clock-names:
> > +    items:
> > +      - const: mixer
> > +      - const: vdo_fe0
> > +      - const: vdo_fe1
> > +      - const: gfx_fe0
> > +      - const: gfx_fe1
> > +      - const: vdo_be
> > +      - const: adl_ds
> > +      - const: vdo_fe0_async
> > +      - const: vdo_fe1_async
> > +      - const: gfx_fe0_async
> > +      - const: gfx_fe1_async
> > +      - const: vdo_be_async
> > +      - const: ethdr_top
> > +  power-domains:
> > +    maxItems: 1
> > +  resets:
> > +    maxItems: 5
> 
> Need to define what they are and order.
> 
OK. I will fix it in the next revision.

> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: The register of display function block to be set
> > by gce.
> > +      There are 4 arguments in this property, gce node, subsys id,
> > offset and
> > +      register size. The subsys id is defined in the gce header of
> > each chips
> > +      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the
> > register of
> > +      display function block.
> 
> Need to define each cell:
> 
> minItems: ??
> maxItems: ??
> items:
>   items:
>     - description: gce node
>     - description: ...
>     ...
> 
> Seems odd this property is optional...
> 
Yes, I miss the required properties, will fix them.

Since my email server spam problem is fixed. I will send these binding
patches in my vdosys1 series [1]. (The fixes will be in the next
revision v18) 

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=632713

Regards,
Nancy

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/gce/mt8195-gce.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    #include <dt-bindings/reset/mt8195-resets.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        disp_ethdr@1c114000 {
> > +                compatible = "mediatek,mt8195-disp-ethdr";
> > +                reg = <0 0x1c114000 0 0x1000>,
> > +                      <0 0x1c115000 0 0x1000>,
> > +                      <0 0x1c117000 0 0x1000>,
> > +                      <0 0x1c119000 0 0x1000>,
> > +                      <0 0x1c11a000 0 0x1000>,
> > +                      <0 0x1c11b000 0 0x1000>,
> > +                      <0 0x1c11b000 0 0x1000>;
> > +                reg-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +                            "vdo_be", "adl_ds";
> > +                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX
> > 0x4000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0x5000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0x7000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0x9000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0xa000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0xb000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0xc000 0x1000>;
> > +                clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> > +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> > +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> > +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> > +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> > +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> > +                         <&vdosys1 CLK_VDO1_26M_SLOW>,
> > +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> > +                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> > +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> > +                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> > +                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> > +                         <&topckgen CLK_TOP_ETHDR>;
> > +                clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +                              "vdo_be", "adl_ds", "vdo_fe0_async",
> > "vdo_fe1_async",
> > +                              "gfx_fe0_async",
> > "gfx_fe1_async","vdo_be_async",
> > +                              "ethdr_top";
> > +                power-domains = <&spm
> > MT8195_POWER_DOMAIN_VDOSYS1>;
> > +                iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> > +                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> > +                interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>;
> > /* disp mixer */
> > +                resets = <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> > +                         <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> > +                         <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> > +                         <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> > +                         <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0
> > 
> > 

