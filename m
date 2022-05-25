Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6326534063
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 17:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B719E10E082;
	Wed, 25 May 2022 15:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D0110E082
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:30:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9C1F61F450E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653492638;
 bh=mGX881tfLiNKIMFbpkJ51Yg+RQ+F9f5Vkk6XOh4uNGc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XiLCHHbHnd1Of9D/ytssYwCUsRsP+P8gc8sVErDFW2KN0nriCpd0EnGi8pD+i7k4K
 xEcmVmjE6akfuOKNi5dPUssQ1UQIMYMVW1VlWa8IkEUWQofaE3Qau4yswACMZT/YGR
 wiCDrQ++snvDecCL/AL48FhDsVlYmvgGmQyhh4Z10Pf6eIGiCecdncslLCBuW/w8qA
 H1x7wi6Wf8tWIBmV53OjicRhpeMB0HttD0TeyXge4RNnx2x8cyzglTtwlepmhgN3o9
 TkxwHho3xnEiQxK/eXPcxX/pWdv806oz0wMRAGjIiScBpjm1TgQM/0YEzRgGLRj3t3
 RXWyV6ddLadRA==
Message-ID: <f2856b8f-9465-2638-aabf-d2dda842766b@collabora.com>
Date: Wed, 25 May 2022 17:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 02/21] dt-bindings: mediatek,dp: Add Display Port
 binding
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-3-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-3-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   .../display/mediatek/mediatek,dp.yaml         | 99 +++++++++++++++++++
>   1 file changed, 99 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..36ae0a6df299
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port Controller
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the MediaTek (embedded) Display Port controller
> +  present on some MediaTek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: faxi clock
> +
> +  clock-names:
> +    items:
> +      - const: faxi
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the controller, usually dp_intf
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
> +

You should add port@0 (and port@1, probably) as required... with what you've done
here, you're saying that "ports" is required, but you're allowing it to be empty..

   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description: Input endpoint of the controller, usually dp_intf

       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output endpoint of the controller

     required:
       - port@0
       - port@1

^^^ that's how it should look.

> +  max-lanes:
> +    maxItems: 1
> +    description: maximum number of lanes supported by the hardware
> +
> +  max-linkrate:
> +    maxItems: 1
> +    description: maximum link rate supported by the hardware

As you've put it (in the example below), the max-linkrate property wants a value
that corresponds to what you find in the HW registers... this is wrong.

Devicetree bindings should be generic and devicetrees shouldn't have hardware
specific bits inside, hence, please change this property to accept a link rate
specified in Mbps and also specify that in the description.

Thanks,
Angelo

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +  - max-lanes
> +  - max-linkrate
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    edp_tx: edp_tx@1c500000 {
> +        compatible = "mediatek,mt8195-dp-tx";
> +        reg = <0 0x1c500000 0 0x8000>;
> +        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&edp_pin>;
> +        max-lanes = /bits/ 8 <4>;
> +        max-linkrate = /bits/ 8 <0x1e>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                edp_in: endpoint {
> +                    remote-endpoint = <&dp_intf0_out>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                edp_out: endpoint {
> +                	remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
