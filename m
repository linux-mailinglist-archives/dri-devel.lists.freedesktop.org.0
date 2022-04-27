Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11E510E01
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 03:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE9C10E11C;
	Wed, 27 Apr 2022 01:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A63410E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 01:34:09 +0000 (UTC)
X-UUID: 9ba25230041641849d1c196fdc9f83e4-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4b5c70cd-697c-48d7-b3c8-634b94bca4ec, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:54
X-CID-INFO: VERSION:1.1.4, REQID:4b5c70cd-697c-48d7-b3c8-634b94bca4ec, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_UHam,ACTI
 ON:release,TS:54
X-CID-META: VersionHash:faefae9, CLOUDID:086997c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:ec07c64a11a0,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 9ba25230041641849d1c196fdc9f83e4-20220427
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1197629606; Wed, 27 Apr 2022 09:34:04 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 27 Apr 2022 09:34:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 09:34:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 09:34:02 +0800
Message-ID: <30b00fffe6f3398edc6d94679cbfba55ddafc57f.camel@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Date: Wed, 27 Apr 2022 09:33:57 +0800
In-Reply-To: <YmhVKw/FQ/iQfLLD@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
 <YmhVKw/FQ/iQfLLD@robh.at.kernel.org>
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

On Tue, 2022-04-26 at 15:25 -0500, Rob Herring wrote:
> On Tue, Apr 19, 2022 at 11:32:35AM +0800, Rex-BC Chen wrote:
> > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > 
> > Add vdosys1 RDMA definition.
> 
> How does this compare to the mediatek,mt8183-mdp3-rdma or 
> mediatek,mt8195-disp-rdma?
> 

1. The mediatek,mt8195-vdo1-rdma is a completely different HW engine
with mediatek,mt8195-disp-rdma.
2. The mediatek,mt8195-vdo1-rdma is similar to mt8183-mdp3-rdma but
with different compression support and tile size.

Regards,
Nancy

> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 86
> > +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
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
> > index 000000000000..6ab773569462
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!2wDOMpaEiBxKqnxB_Ocy9EiZEBgMnMmhgp0QxtKsUv2WjEbcBxe1P0gILWVkqZ2k$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2wDOMpaEiBxKqnxB_Ocy9EiZEBgMnMmhgp0QxtKsUv2WjEbcBxe1P0gILfySwMCt$
> >  
> > +
> > +title: MediaTek MDP RDMA
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +
> > +description: |
> > +  The mediatek MDP RDMA stands for Read Direct Memory Access.
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
> > +      - items:
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
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
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
> > -- 
> > 2.18.0
> > 
> > 

