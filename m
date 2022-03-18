Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154C4DD558
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 08:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1410E733;
	Fri, 18 Mar 2022 07:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAAB10E733
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 07:43:49 +0000 (UTC)
X-UUID: eb709ff3221549a5b1fbd3fa548fd7a8-20220318
X-UUID: eb709ff3221549a5b1fbd3fa548fd7a8-20220318
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 145076729; Fri, 18 Mar 2022 15:43:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 15:43:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 15:43:18 +0800
Message-ID: <9bd729a6e2d8a23f25c55c3aec81cb5b64eb0057.camel@mediatek.com>
Subject: Re: [PATCH v14 01/22] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Fri, 18 Mar 2022 15:43:18 +0800
In-Reply-To: <20220310035515.16881-2-nancy.lin@mediatek.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-2-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Thu, 2022-03-10 at 11:54 +0800, Nancy.Lin wrote:
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,mdp-rdma.yaml       | 86
> +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml

The better path:
Documentation/devicetree/bindings/soc/mediatek/mediatek,mdp-rdma.yaml

Does this mdp-rdma has relation with mdp3-rdma [1]? If the hardware are
compatible, I think the binding document could be squashed. If no
relation, I think mdp-rdma could be placed in display folder.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220117055254.9777-15-roy-cw.yeh@mediatek.com/

Regards,
CK

> 
> diff --git
> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> rdma.yaml
> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> rdma.yaml
> new file mode 100644
> index 000000000000..6ab773569462
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> rdma.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!0sVM-qGMUv6LrYRyg_gOLC9Em4NHxZhbtdmygv32phBHBUyLUzixXPduIIqCKA$
>  
> +$schema: 
> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!0sVM-qGMUv6LrYRyg_gOLC9Em4NHxZhbtdmygv32phBHBUyLUzixXPfYY-0O3A$
>  
> +
> +title: Mediatek MDP RDMA
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  The mediatek MDP RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as
> DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG
> node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8195-vdo1-rdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by
> bindings of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for
> details.
> +
> +  clocks:
> +    items:
> +      - description: RDMA Clock
> +
> +  iommus:
> +    description:
> +      This property should point to the respective IOMMU block with
> master port as argument,
> +      see
> Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> details.
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There
> are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The
> subsys id that is
> +      mapping to the register of display function blocks is defined
> in the gce header
> +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vdo1_rdma0: mdp-rdma@1c104000 {
> +            compatible = "mediatek,mt8195-vdo1-rdma";
> +            reg = <0 0x1c104000 0 0x1000>;
> +            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> +            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> +            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> +            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000
> 0x1000>;
> +        };
> +    };

