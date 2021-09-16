Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F11C40D1D0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 04:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE94F89DD5;
	Thu, 16 Sep 2021 02:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5207789DD5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:56:45 +0000 (UTC)
X-UUID: f043e734a6f54b0c81552b2a13b543b5-20210916
X-UUID: f043e734a6f54b0c81552b2a13b543b5-20210916
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1940946546; Thu, 16 Sep 2021 10:56:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 10:56:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 10:56:38 +0800
Message-ID: <9068426be6ba2a0eb05d77b18a8f131a2d00ca21.camel@mediatek.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Rob Herring"
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 10:56:38 +0800
In-Reply-To: <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-2-nancy.lin@mediatek.com>
 <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
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

On Tue, 2021-09-07 at 07:42 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年9月6日 週一 下午3:15寫道：
> > 
> > Add vdosys1 RDMA definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 77
> > +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
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
> > index 000000000000..3610093848e1
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> 
> I've compared the rdma driver in mdp [1] with the rdma driver in
> display [2], both are similar. The difference are like merge0 versus
> merge5. So I would like both binding document are placed together. In
> display folder? In media folder? In SoC folder? I've no idea which
> one
> is better, but at lease put together.
> 
> [1] 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210824100027.25989-6-moudy.ho@mediatek.com/__;!!CTRNKA9wMg0ARbw!1MjfK1sAMDvP9fU1GX6QvfLEfapYEcLmsYP2AhkAOZ6LVaLTLi6vAnJMMqH3vrJ3$
>  
> [2] 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210906071539.12953-12-nancy.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!1MjfK1sAMDvP9fU1GX6QvfLEfapYEcLmsYP2AhkAOZ6LVaLTLi6vAnJMMuM29V9T$
>  
> 
> Regards,
> Chun-Kuang.
> 
OK, I will discuss this with Moudy.

Regards,
Nancy Lin
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!1MjfK1sAMDvP9fU1GX6QvfLEfapYEcLmsYP2AhkAOZ6LVaLTLi6vAnJMMheRB2bL$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1MjfK1sAMDvP9fU1GX6QvfLEfapYEcLmsYP2AhkAOZ6LVaLTLi6vAnJMMkoF4_Zs$
> >  
> > +
> > +title: mediatek display MDP RDMA
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> > +
> > +description: |
> > +  The mediatek display MDP RDMA stands for Read Direct Memory
> > Access.
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
> > +
> > +    vdo1_rdma0: vdo1_rdma@1c104000 {
> > +        compatible = "mediatek,mt8195-vdo1-rdma";
> > +        reg = <0 0x1c104000 0 0x1000>;
> > +        interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +        iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> > +        mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x4000
> > 0x1000>;
> > +    };
> > +
> > --
> > 2.18.0
> > 

