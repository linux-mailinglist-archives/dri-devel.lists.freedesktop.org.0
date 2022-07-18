Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F07578BAD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2610EBBE;
	Mon, 18 Jul 2022 20:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9C10EB69
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 20:21:16 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id h16so6641799ila.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 13:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ynxFYeVYReMscKRbp1PGFWnDnfPfj0JbfYGgEj9QMa8=;
 b=N8vAhDnwTwCi7QnHKVPe0b//gQLX6xGwywizCIGErsusSjLLr8wyHXeqWubAOtTzYK
 5A6ZRhZKNeqsiJAhT1Pa43mbwMxJ9/UQh4TjOm6fl+s+Ix6Sj7bbWUsbA6WiUhdy2RYy
 6/LSgc5EH0HFpuZOVlorHhcKjMcCCs/HMVrSRkhErfjvzoAxFfhGao88bLji/pNYoEXQ
 tarc7un5nIJXACIMkdUrBsWBvdvM9P45MVSfkRjJI01H9w1gJ7ZuQL4dcdyg2t/gri5a
 gU6OrBulcLAQILrlO8/Qi44ciU73qyqk/Ne0d+AlqFAbR6b98NVQSmEllV8Iquu2fg/G
 bbog==
X-Gm-Message-State: AJIora8BTG2NnixYNBwkNPrKVsXDnMtPJnOPKww/4kJeMr23LMpOc2lZ
 r6z4TLS3TqwHydLQk4UHkg==
X-Google-Smtp-Source: AGRyM1vaDDDUOeHt3lurvR3J3lSRNZ44pNwdJGSHidBa5vaIG068vrI+0SSo+eDbXIHdcLNloTdksA==
X-Received: by 2002:a05:6e02:1688:b0:2dc:822e:7c63 with SMTP id
 f8-20020a056e02168800b002dc822e7c63mr14459068ila.205.1658175675865; 
 Mon, 18 Jul 2022 13:21:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 d190-20020a6bb4c7000000b0066961821575sm6327392iof.34.2022.07.18.13.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 13:21:14 -0700 (PDT)
Received: (nullmailer pid 3481625 invoked by uid 1000);
 Mon, 18 Jul 2022 20:21:09 -0000
Date: Mon, 18 Jul 2022 14:21:09 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v14 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220718202109.GA3465206-robh@kernel.org>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712111223.13080-2-rex-bc.chen@mediatek.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, liangxu.xu@mediatek.com, msp@baylibre.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 granquet@baylibre.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 07:12:14PM +0800, Bo-Chen Chen wrote:
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
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..e2d6cb314297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port Controller
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the MediaTek display port TX (DP) and
> +  embedded display port TX (eDP) controller present on some MediaTek SoCs.
> +  MediaTek DP and eDP are different hardwares and they have different
> +  base address for registers, so we need two different compatibles to
> +  separate them.

As I said before, 'different base address for registers' is not a reason 
for different compatibles. If it was, then we'd never have a compatible 
string appear more than once in a DT.

Explain WHAT is different within the block. For example[1].

Rob

[1] https://lore.kernel.org/all/20220710084133.30976-10-dmitry.baryshkov@linaro.org/


> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-tx
> +      - mediatek,mt8195-edp-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description: efuse data for display port calibration
> +
> +  nvmem-cell-names:
> +    const: dp_calibration_data
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
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
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Output endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                description: |
> +                  number of lanes supported by the hardware.
> +                  The possible values:
> +                  0       - For 1 lane enabled in IP.
> +                  0 1     - For 2 lanes enabled in IP.
> +                  0 1 2 3 - For 4 lanes enabled in IP.
> +                minItems: 1
> +                maxItems: 4
> +            required:
> +              - data-lanes
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  max-linkrate-mhz:
> +    enum: [ 1620, 2700, 5400, 8100 ]
> +    description: maximum link rate supported by the hardware.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +  - max-linkrate-mhz
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    dp_tx@1c600000 {
> +        compatible = "mediatek,mt8195-dp-tx";
> +        reg = <0x1c600000 0x8000>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> +        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> +        max-linkrate-mhz = <8100>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dptx_in: endpoint {
> +                    remote-endpoint = <&dp_intf0_out>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                dptx_out: endpoint {
> +                    data-lanes = <0 1 2 3>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.18.0
> 
> 
