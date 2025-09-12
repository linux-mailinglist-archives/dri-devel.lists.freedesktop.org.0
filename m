Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB92B544A2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF3810E18E;
	Fri, 12 Sep 2025 08:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mLO35G+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A02D10E18E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757664693;
 bh=9+xOYBeZ+X7h8ramrWmPqxnrf2SG/GtpBiyuxPc138g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mLO35G+GQT/ZTZbiy0w14kycNTjbWocE+Pwgyu6D/DIjg5+dYtr+0yWVgVJU6Yrd8
 sPUpFUckgWGN2ycq6xvqHBMDt6Ji6MjwoSD0i4MiZhQovDzDXG1Ebk5ddrI0Jccpab
 eiy5n1YYtpHqTxsOVeMJk1jcIbSV+M1izE0FveYR38Bhf4kep7QbigM03J3epraa4P
 eF5A7q5gQpIEtJjcwC6qT1iia+eBsvYrbXO9dAt1FCl9YwOZySfUEMqy/IflNa1FF+
 /rA7KpHJhdhbl53sKtIxmkTmHdZSAH1NWwtu4eqeTQ06EWIWThbxVugK25jfO9d6cD
 ocmct+H5P/ezw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B6EB017E04D6;
 Fri, 12 Sep 2025 10:11:31 +0200 (CEST)
Message-ID: <b4c0f677-a97a-4076-a1d6-238854236ec9@collabora.com>
Date: Fri, 12 Sep 2025 10:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-2-ariel.dalessandro@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>   .../bindings/media/mediatek-mdp.txt           |  95 ----------
>   2 files changed, 169 insertions(+), 95 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> new file mode 100644
> index 0000000000000..8ca33a733c478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 Media Data Path
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Media Data Path is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8173-mdp-rdma
> +          - mediatek,mt8173-mdp-rsz
> +          - mediatek,mt8173-mdp-wdma
> +          - mediatek,mt8173-mdp-wrot
> +      - items:
> +          - const: mediatek,mt8173-mdp-rdma
> +          - const: mediatek,mt8173-mdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  mediatek,vpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
> +      image processing.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp-rdma
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Mutex clock
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +    then:
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp
> +    then:
> +      required:
> +        - mediatek,vpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mdp_rdma0: rdma@14001000 {
> +            compatible = "mediatek,mt8173-mdp-rdma",
> +                         "mediatek,mt8173-mdp";
> +            reg = <0 0x14001000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +            mediatek,vpu = <&vpu>;
> +        };
> +
> +        mdp_rdma1: rdma@14002000 {
> +            compatible = "mediatek,mt8173-mdp-rdma";
> +            reg = <0 0x14002000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
> +        };
> +
> +        mdp_rsz0: rsz@14003000 {
> +            compatible = "mediatek,mt8173-mdp-rsz";
> +            reg = <0 0x14003000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +        };
> +
> +        mdp_rsz1: rsz@14004000 {
> +            compatible = "mediatek,mt8173-mdp-rsz";
> +            reg = <0 0x14004000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +        };
> +
> +        mdp_rsz2: rsz@14005000 {
> +            compatible = "mediatek,mt8173-mdp-rsz";
> +            reg = <0 0x14005000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RSZ2>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +        };
> +
> +        mdp_wdma0: wdma@14006000 {
> +            compatible = "mediatek,mt8173-mdp-wdma";
> +            reg = <0 0x14006000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_WDMA>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_WDMA>;
> +        };
> +
> +        mdp_wrot0: wrot@14007000 {
> +            compatible = "mediatek,mt8173-mdp-wrot";
> +            reg = <0 0x14007000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +        };
> +
> +        mdp_wrot1: wrot@14008000 {
> +            compatible = "mediatek,mt8173-mdp-wrot";
> +            reg = <0 0x14008000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_WROT1>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_WROT1>;
> +        };
> +    };
> +
> +...
