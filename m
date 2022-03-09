Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061574D263F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 04:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159E810E5DC;
	Wed,  9 Mar 2022 03:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A471F10E5DC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 03:42:50 +0000 (UTC)
X-UUID: aaf7b6341ce14b5588419328d84a6108-20220309
X-UUID: aaf7b6341ce14b5588419328d84a6108-20220309
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1838592757; Wed, 09 Mar 2022 11:42:42 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 9 Mar 2022 11:42:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Mar 2022 11:42:41 +0800
Message-ID: <5cccaada06b76c0ce8e66abf1336cf565f4ccc0a.camel@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Fix examples on new
 bindings
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Date: Wed, 9 Mar 2022 11:42:41 +0800
In-Reply-To: <84e2bb5d7047fc1291d765131ce3f6b265a5304e.camel@mediatek.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
 <84e2bb5d7047fc1291d765131ce3f6b265a5304e.camel@mediatek.com>
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
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Would you like to let me resend this patch?

I will revert this patch to fix up the problem of mediatek,ethdr.yaml
needing to be rebased on [1][2]:

https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=e7dcfe64204a5cd9a74a9ca7d9c7a22434dc7fe5
Then Nancy will add mediatek,ethdr.yaml with your fix at the next
version of vdosys1 series:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=621401

I will also fix up include header of mediatek,ovl-2l.yaml from mt8173
to mt8183.


Regards,
Jason-JH.Lin

On Sun, 2022-03-06 at 02:34 +0800, Jason-JH Lin wrote:
> Hi Angelo,
> 
> Thank you very much for fixing them all.
> I really appreciate it :-)
> 
> I tested these patches and found some small problem.
> 
> 
> On Fri, 2022-03-04 at 10:54 +0100, AngeloGioacchino Del Regno wrote:
> > To avoid failure of dt_binding_check perform a slight refactoring
> > of the examples: the main block is kept, but that required fixing
> > the address and size cells, plus the inclusion of missing dt-
> > bindings
> > headers, required to parse some of the values assigned to various
> > properties.
> > 
> > Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split
> > each block to individual yaml")
> > Signed-off-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
> >  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
> >  .../display/mediatek/mediatek,color.yaml      | 23 +++--
> >  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
> >  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
> >  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
> >  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++-----
> > --
> > --
> >  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
> >  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
> >  .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
> >  .../display/mediatek/mediatek,od.yaml         | 14 ++-
> >  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
> >  .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
> >  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
> >  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
> >  .../display/mediatek/mediatek,split.yaml      | 17 +++-
> >  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
> >  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
> >  18 files changed, 316 insertions(+), 178 deletions(-)
> 
> [snip]
> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .y
> > aml
> > index 131eed5eeeb7..e16deca0dc2b 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr
> > .y
> > aml
> > @@ -97,51 +97,62 @@ additionalProperties: false
> >  
> >  examples:
> >    - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/gce/mt8195-gce.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> 
> This header file should base on [1].
> [1] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
> 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/
> 
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    #include <dt-bindings/reset/mt8195-resets.h>
> >  
> > -    disp_ethdr@1c114000 {
> > -            compatible = "mediatek,mt8195-disp-ethdr";
> > -            reg = <0 0x1c114000 0 0x1000>,
> > -                  <0 0x1c115000 0 0x1000>,
> > -                  <0 0x1c117000 0 0x1000>,
> > -                  <0 0x1c119000 0 0x1000>,
> > -                  <0 0x1c11A000 0 0x1000>,
> > -                  <0 0x1c11B000 0 0x1000>,
> > -                  <0 0x1c11C000 0 0x1000>;
> > -            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0",
> > "gfx_fe1",
> > -                        "vdo_be", "adl_ds";
> > -            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX
> > 0x4000
> > 0x1000>,
> > -                                      <&gce0 SUBSYS_1c11XXXX
> > 0x5000
> > 0x1000>,
> > -                                      <&gce0 SUBSYS_1c11XXXX
> > 0x7000
> > 0x1000>,
> > -                                      <&gce0 SUBSYS_1c11XXXX
> > 0x9000
> > 0x1000>,
> > -                                      <&gce0 SUBSYS_1c11XXXX
> > 0xA000
> > 0x1000>,
> > -                                      <&gce0 SUBSYS_1c11XXXX
> > 0xB000
> > 0x1000>,
> > -                                      <&gce0 SUBSYS_1c11XXXX
> > 0xC000
> > 0x1000>;
> > -            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> > -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> > -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> > -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> > -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> > -                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> > -                     <&vdosys1 CLK_VDO1_26M_SLOW>,
> > -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> > -                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> > -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> > -                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> > -                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> > -                     <&topckgen CLK_TOP_ETHDR_SEL>;
> > -            clock-names = "mixer", "vdo_fe0", "vdo_fe1",
> > "gfx_fe0",
> > "gfx_fe1",
> > -                          "vdo_be", "adl_ds", "vdo_fe0_async",
> > "vdo_fe1_async",
> > -                          "gfx_fe0_async",
> > "gfx_fe1_async","vdo_be_async",
> > -                          "ethdr_top";
> > -            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > -            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> > -                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> > -            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /*
> > disp mixer */
> > -            resets = <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> > -                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> > -                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> > -                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> > -                     <&vdosys1
> > MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
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
> > +                      <0 0x1c11A000 0 0x1000>,
> > +                      <0 0x1c11B000 0 0x1000>,
> > +                      <0 0x1c11C000 0 0x1000>;
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
> > 0xA000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0xB000 0x1000>,
> > +                                          <&gce0 SUBSYS_1c11XXXX
> > 0xC000 0x1000>;
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
> > /*
> > disp mixer */
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
> 
> These define should base on [2].
> [2] dt-bindings: reset: mt8195: add vdosys1 reset control bit
> 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220222100741.30138-5-nancy.lin@mediatek.com/
> 
> +        };
> >      };
> >  
> 
> [snip]
> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > index e3cef99d0f98..25d2ac2a4f05 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> > @@ -66,13 +66,23 @@ additionalProperties: false
> >  
> >  examples:
> >    - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +    #include <dt-bindings/gce/mt8173-gce.h>
> > +    #include <dt-bindings/memory/mt8173-larb-port.h>
> 
> These should be mt8183 header files.
> 
> #include <dt-bindings/clock/mt8183-clk.h>
> #include <dt-bindings/power/mt8183-power.h>
> #include <dt-bindings/gce/mt8183-gce.h>
> #include <dt-bindings/memory/mt8183-larb-port.h>
> 
> > -    ovl_2l0: ovl@14009000 {
> > -        compatible = "mediatek,mt8183-disp-ovl-2l";
> > -        reg = <0 0x14009000 0 0x1000>;
> > -        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> > -        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > -        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> > -        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> > -        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000
> > 0x1000>;
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        ovl_2l0: ovl@14009000 {
> > +            compatible = "mediatek,mt8183-disp-ovl-2l";
> > +            reg = <0 0x14009000 0 0x1000>;
> > +            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> > +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +            clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> > +            iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
> > +            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000
> > 0x1000>;
> > +        };
> >      };
> 
> [snip]
> 
> Thanks again! 
> Tested-by: Jason-JH.Lin <jason-jh.lin@medaitek.com>
> 
> Regards,
> Jason-JH.Lin
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

