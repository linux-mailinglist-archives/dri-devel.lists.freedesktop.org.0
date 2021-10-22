Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02D437295
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D7A6E5A3;
	Fri, 22 Oct 2021 07:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBE36E5A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 07:18:37 +0000 (UTC)
X-UUID: df4a0ada79cb45fe88ae32e977200fc0-20211022
X-UUID: df4a0ada79cb45fe88ae32e977200fc0-20211022
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 829914914; Fri, 22 Oct 2021 15:18:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 15:18:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 15:18:31 +0800
Message-ID: <2f01f80ad7394d568869ac90ef6dd67923ee7629.camel@mediatek.com>
Subject: Re: [PATCH v6 03/16] dt-bindings: mediatek: add ethdr definition
 for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Fri, 22 Oct 2021 15:18:31 +0800
In-Reply-To: <CAAOTY_9EG-dUE3TN3+8o5nBV1SW4CY9q+jy1P+G03W40C8zu5Q@mail.gmail.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-4-nancy.lin@mediatek.com>
 <CAAOTY_9EG-dUE3TN3+8o5nBV1SW4CY9q+jy1P+G03W40C8zu5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thanks for the review.

On Sat, 2021-10-16 at 07:37 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年10月4日 週一 下午2:21寫道：
> > 
> > Add vdosys1 ETHDR definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,ethdr.yaml      | 145
> > ++++++++++++++++++
> >  1 file changed, 145 insertions(+)
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
> > index 000000000000..e127f0b392d0
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml*__;Iw!!CTRNKA9wMg0ARbw!y6Q5VtKDLZHoYN5bEe_S_yTm7kWd_rwPjidk5R6NBVLXVIMVYK4VVXWslRmbyBny$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!y6Q5VtKDLZHoYN5bEe_S_yTm7kWd_rwPjidk5R6NBVLXVIMVYK4VVXWslYl8ES2J$
> >  
> > +
> > +title: Mediatek Ethdr Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +description: |
> > +  ETHDR is designed for HDR video and graphics conversion in the
> > external display path.
> > +  It handles multiple HDR input types and performs tone mapping,
> > color space/color
> > +  format conversion, and then combine different layers, output the
> > required HDR or
> > +  SDR signal to the subsequent display path. This engine is
> > composed of two video
> > +  frontends, two graphic frontends, one video backend and a mixer.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8195-disp-ethdr
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
> > +  iommus:
> > +    description: The compatible property is DMA function blocks.
> > +      Should point to the respective IOMMU block with master port
> > as argument,
> > +      see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > +      details.
> 
> In description, you does not mention that ethdr has dma function. I
> expect that video front end and graphics front end direct link to
> another hardware function block and no dma function. If it has both
> direct link and dma function, add explain in description.
> 
There is DMA hardware inside the ETHDR engine, which are DS and ADL.
The two engines can read hardware reg settings from dram and then apply
the settings during the v-blanking period.

I will explain it in description.

Regards,
Nancy

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
> > +
> > +    disp_ethdr@1c114000 {
> > +            compatible = "mediatek,mt8195-disp-ethdr";
> > +            reg = <0 0x1c114000 0 0x1000>,
> > +                  <0 0x1c115000 0 0x1000>,
> > +                  <0 0x1c117000 0 0x1000>,
> > +                  <0 0x1c119000 0 0x1000>,
> > +                  <0 0x1c11A000 0 0x1000>,
> > +                  <0 0x1c11B000 0 0x1000>,
> > +                  <0 0x1c11C000 0 0x1000>;
> > +            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0",
> > "gfx_fe1",
> > +                        "vdo_be", "adl_ds";
> > +            mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX
> > 0x4000 0x1000>,
> > +                                      <&gce1 SUBSYS_1c11XXXX
> > 0x5000 0x1000>,
> > +                                      <&gce1 SUBSYS_1c11XXXX
> > 0x7000 0x1000>,
> > +                                      <&gce1 SUBSYS_1c11XXXX
> > 0x9000 0x1000>,
> > +                                      <&gce1 SUBSYS_1c11XXXX
> > 0xA000 0x1000>,
> > +                                      <&gce1 SUBSYS_1c11XXXX
> > 0xB000 0x1000>,
> > +                                      <&gce1 SUBSYS_1c11XXXX
> > 0xC000 0x1000>;
> > +            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> > +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> > +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> > +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> > +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> > +                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> > +                     <&vdosys1 CLK_VDO1_26M_SLOW>,
> > +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> > +                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> > +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> > +                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> > +                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> > +                     <&topckgen CLK_TOP_ETHDR_SEL>;
> > +            clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0", "gfx_fe1",
> > +                          "vdo_be", "adl_ds", "vdo_fe0_async",
> > "vdo_fe1_async",
> > +                          "gfx_fe0_async",
> > "gfx_fe1_async","vdo_be_async",
> > +                          "ethdr_top";
> > +            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> > +                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> > +            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /*
> > disp mixer */
> > +            resets = <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> > +                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> > +                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> > +                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> > +                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> > +    };
> > +
> > +...
> > --
> > 2.18.0
> > 

