Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3F4CA1E8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C4810F3DE;
	Wed,  2 Mar 2022 10:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549BF10F3DD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6DA191F44C8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646215991;
 bh=UX2Ndc3ReNfDliUVWGnKCySKzcw0C27G/JIeKxUon7I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jqy/TnQbuUbEnIQ3cSRyRYrEEJMbQQa2VrLiDxrZ012nxs2LCFpIxW3sEusHlx9C4
 PIE493sQTuAvqxXJwWo2jcKZd/cmrdJu76HhoR7WwYnx0f6EryuRddJLP+TdsvDFz8
 mvtHEHfs2cZFFdpWesVhdIWtUDFUMqJMC1Uhm2eM8QRxYq7+DadL93prZB4B5nvBi/
 9D99jKTkJ5LoGIuhL5qG2Bxhdm1IuJ+IGvkVN9qew3b4JNDZvv1+aOrtqAE4Evnf/T
 r6McYcFdaf6hs/8LpvQZiCbN9Vqhxk3Z1MX9kgOvD2YrqIX5U7KoBvJxvjybMpzE7H
 BeIHW+u4un2KQ==
Message-ID: <a958a934-5a24-e5c5-c4c9-ce46a2b140b6@collabora.com>
Date: Wed, 2 Mar 2022 11:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 01/23] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-2-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222100741.30138-2-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/02/22 11:07, Nancy.Lin ha scritto:
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   .../arm/mediatek/mediatek,mdp-rdma.yaml       | 77 +++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
> new file mode 100644
> index 000000000000..d70b81ec1914
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MDP RDMA
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  The mediatek MDP RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
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
> +    description: A phandle and PM domain specifier as defined by bindings of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +
> +  clocks:
> +    items:
> +      - description: RDMA Clock
> +
> +  iommus:
> +    description:
> +      This property should point to the respective IOMMU block with master port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
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

You're missing a couple of header inclusions and relying on the default
address-cells, size-cells, which is wrong here, as you have two of both.

#include .........

soc {
     #address-cells = <2>;
     #size-cells = <2>;

         vdo1_rdma0: .......

> +
> +    vdo1_rdma0: vdo1_rdma@1c104000 {
> +        compatible = "mediatek,mt8195-vdo1-rdma";
> +        reg = <0 0x1c104000 0 0x1000>;
> +        interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> +        mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
> +    };
> +
