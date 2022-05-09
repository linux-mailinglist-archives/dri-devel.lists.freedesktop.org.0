Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036D51F726
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 10:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A4310E37B;
	Mon,  9 May 2022 08:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657D910E37B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 08:45:52 +0000 (UTC)
X-UUID: b13aee952fc048978f6059a48e5462e1-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7730f550-ca22-4d26-a3ed-1240a9238bbc, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:53
X-CID-INFO: VERSION:1.1.4, REQID:7730f550-ca22-4d26-a3ed-1240a9238bbc, OB:0,
 LOB:
 0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:53
X-CID-META: VersionHash:faefae9, CLOUDID:c1f019b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:f2f2a8b00f34,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: b13aee952fc048978f6059a48e5462e1-20220509
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1070502207; Mon, 09 May 2022 16:45:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 9 May 2022 16:45:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 May 2022 16:45:46 +0800
Message-ID: <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Date: Mon, 9 May 2022 16:45:46 +0800
In-Reply-To: <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-09 at 15:31 +0800, Krzysztof Kozlowski wrote:
> On 09/05/2022 06:43, Rex-BC Chen wrote:
> > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > 
> > Add vdosys1 RDMA definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 94
> > +++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > new file mode 100644
> > index 000000000000..ca31accb0a95
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!x6pqRSLbN1fx6j57PKXCTTp8n7bulgpLzXS8uUh5vAIxkRKD8K6EqOopnFrXvT54LQXmIEDFFvPQzC4ldr1TddEeTw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!x6pqRSLbN1fx6j57PKXCTTp8n7bulgpLzXS8uUh5vAIxkRKD8K6EqOopnFrXvT54LQXmIEDFFvPQzC4ldr3y-9sW3w$
> >  
> > +
> > +title: MediaTek MDP RDMA
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +description:
> > +  The MediaTek MDP RDMA stands for Read Direct Memory Access.
> > +  It provides real time data to the back-end panel driver, such as
> > DSI,
> > +  DPI and DP_INTF.
> > +  It contains one line buffer to store the sufficient pixel data.
> > +  RDMA device node must be siblings to the central MMSYS_CONFIG
> > node.
> > +  For a description of the MMSYS_CONFIG binding, see
> > +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya
> > ml for details.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> 
> oneOf is not needed
> 
> > +      - items:
> 
> items not needed, you have only one item.
> 

Hello Krzysztof,

Thanks for your review.
ok, we will drop them.

> > +          - const: mediatek,mt8195-vdo1-rdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    description: A phandle and PM domain specifier as defined by
> > bindings of
> > +      the power controller specified by phandle. See
> > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> 
> Skip description, it's obvious. Instead maxItems.
> 

ok, we will fix it.

> > +
> > +  clocks:
> > +    items:
> > +      - description: RDMA Clock
> > +
> > +  iommus:
> > +    description:
> > +      This property should point to the respective IOMMU block
> > with master port as argument,
> > +      see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > details.
> 
> Skip description, it's obvious. Instead maxItems.
> 

ok, we will fix it.

> > +
> > +  mediatek,gce-client-reg:
> > +    description:
> > +      The register of display function block to be set by gce.
> > There are 4 arguments,
> > +      such as gce node, subsys id, offset and register size. The
> > subsys id that is
> > +      mapping to the register of display function blocks is
> > defined in the gce header
> > +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> 
> Double "include" in the path.

ok, we will fix it.

> 
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +  - mediatek,gce-client-reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    #include <dt-bindings/gce/mt8195-gce.h>
> > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        vdo1_rdma0: mdp-rdma@1c104000 {
> 
> Generic node name. dma-controller (if it does not conflict with
> dma-common.yaml schema)?

We don't understand what dma-controller you are referring to? Can you
help explain more? Thanks!

BRs,
Rex

> 
> > +            compatible = "mediatek,mt8195-vdo1-rdma";
> > +            reg = <0 0x1c104000 0 0x1000>;
> > +            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > +            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> > +            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX
> > 0x4000 0x1000>;
> > +        };
> > +    };
> 
> 
> Best regards,
> Krzysztof

