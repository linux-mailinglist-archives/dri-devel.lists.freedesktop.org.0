Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5E507F80
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 05:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D27F10F1F2;
	Wed, 20 Apr 2022 03:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403B210F1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 03:15:38 +0000 (UTC)
X-UUID: 1fb72d17eccb4215ad8f9712affdea33-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:af9358d1-00b9-4c26-8d5a-21d9f751190f, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:53
X-CID-INFO: VERSION:1.1.4, REQID:af9358d1-00b9-4c26-8d5a-21d9f751190f, OB:0,
 LOB:
 0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:53
X-CID-META: VersionHash:faefae9, CLOUDID:274074ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:b1f79c9c742c,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 1fb72d17eccb4215ad8f9712affdea33-20220420
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1562580671; Wed, 20 Apr 2022 11:15:31 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 11:15:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 11:15:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 11:15:30 +0800
Message-ID: <0b85798f63deb0c943ed1803aaa06cde6437e7bd.camel@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 20 Apr 2022 11:15:30 +0800
In-Reply-To: <CAAOTY__u3q1YcNwGpyEUpRbThsg6U1-gYtaqtGgy2J4jMwSOUg@mail.gmail.com>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
 <74b3f0e3-1d9f-de9e-ccf0-1f2174ba7c25@gmail.com>
 <CAAOTY__u3q1YcNwGpyEUpRbThsg6U1-gYtaqtGgy2J4jMwSOUg@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-19 at 23:51 +0800, Chun-Kuang Hu wrote:
> Matthias Brugger <matthias.bgg@gmail.com> 於 2022年4月19日 週二 下午10:57寫道：
> > 
> > 
> > 
> > On 19/04/2022 05:32, Rex-BC Chen wrote:
> > > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > > 
> > > Add vdosys1 RDMA definition.
> > > 
> > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   .../display/mediatek/mediatek,mdp-rdma.yaml   | 86
> > > +++++++++++++++++++
> > >   1 file changed, 86 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > > rdma.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp
> > > -rdma.yaml
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp
> > > -rdma.yaml
> > > new file mode 100644
> > > index 000000000000..6ab773569462
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp
> > > -rdma.yaml
> > > @@ -0,0 +1,86 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!2Ig4llRcam253qgvT99ty3TWC4Yo6D6Dy1DgFiNuA_fMhtu1lJHERS1f4pzOBELsqIl__FAiHl5bJCAJqNc7FAWGTw$
> > >  
> > > +$schema: 
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2Ig4llRcam253qgvT99ty3TWC4Yo6D6Dy1DgFiNuA_fMhtu1lJHERS1f4pzOBELsqIl__FAiHl5bJCAJqNdU9sgsvg$
> > >  
> > > +
> > > +title: MediaTek MDP RDMA
> > > +
> > > +maintainers:
> > > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > 
> > I don't think I would be the correct person to maintain this. This
> > should be the
> > person that is maintaining the driver.
> 
> Agree. This should be
> 
> Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Philipp Zabel <p.zabel@pengutronix.de>
> 
> Regards,
> Chun-Kuang.
> 
> > 
> > Regards,
> > Matthias
> > 

Hello Chun-Kuang and Matthias,

OK, I will update the list in next version.

BRs,
Rex

> > > +
> > > +description: |
> > > +  The mediatek MDP RDMA stands for Read Direct Memory Access.
> > > +  It provides real time data to the back-end panel driver, such
> > > as DSI,
> > > +  DPI and DP_INTF.
> > > +  It contains one line buffer to store the sufficient pixel
> > > data.
> > > +  RDMA device node must be siblings to the central MMSYS_CONFIG
> > > node.
> > > +  For a description of the MMSYS_CONFIG binding, see
> > > +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.
> > > yaml for details.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: mediatek,mt8195-vdo1-rdma
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    description: A phandle and PM domain specifier as defined by
> > > bindings of
> > > +      the power controller specified by phandle. See
> > > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > > for details.
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: RDMA Clock
> > > +
> > > +  iommus:
> > > +    description:
> > > +      This property should point to the respective IOMMU block
> > > with master port as argument,
> > > +      see
> > > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > > details.
> > > +
> > > +  mediatek,gce-client-reg:
> > > +    description:
> > > +      The register of display function block to be set by gce.
> > > There are 4 arguments,
> > > +      such as gce node, subsys id, offset and register size. The
> > > subsys id that is
> > > +      mapping to the register of display function blocks is
> > > defined in the gce header
> > > +      include/include/dt-bindings/gce/<chip>-gce.h of each
> > > chips.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - power-domains
> > > +  - clocks
> > > +  - iommus
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/mt8195-clk.h>
> > > +    #include <dt-bindings/power/mt8195-power.h>
> > > +    #include <dt-bindings/gce/mt8195-gce.h>
> > > +    #include <dt-bindings/memory/mt8195-memory-port.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        vdo1_rdma0: mdp-rdma@1c104000 {
> > > +            compatible = "mediatek,mt8195-vdo1-rdma";
> > > +            reg = <0 0x1c104000 0 0x1000>;
> > > +            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > > +            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > > +            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> > > +            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX
> > > 0x4000 0x1000>;
> > > +        };
> > > +    };

