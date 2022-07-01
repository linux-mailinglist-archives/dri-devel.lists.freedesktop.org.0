Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A21563AEC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693F10E325;
	Fri,  1 Jul 2022 20:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6F10E325
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:29:17 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id f15so2079960ilj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 13:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uo+ZyI55hAfSIWqq6L8CrLiVvmJn3xH9wA2nHRVPzqs=;
 b=WByNj4OPLuU6UdpUSAVk+M/qyo1neTYROTrzuyvJTF3zVJ8F5bfhlbfkxqMdFoJUrZ
 +RSxbn1m4nKxIb5Kg1gJejPsSOUHcHXNqb/24gE0KVcwO9KDlKREw3G8QxkVLVV6jiqY
 cAi4asm4Uf68CRj8tEsBx8hIoN6G1aT2yV5K2fOrKHPYxFPH1z2oXkOdXmCsDZzfV9Nr
 5iE/+SmevXtJft1W/MWl9sdcvLHjLX6h7aytNthdbKOKx9ML9oE1FzCdXG4v9PHCoxbx
 qGL/71OuQ5gILm3Y0ieGB5HPxGmVF7N1uz+jFuphpJ3ZF94Hfvbe4Jg8rp3RFVWIC9aJ
 2Xfw==
X-Gm-Message-State: AJIora8RmeewiqsNAtbU8iQ0X391VtKOf4OUO5gDaH8rw8Un5dW9qlGh
 ExoY+Q5J4Z8QNU0TSy+t/6730kuP4A==
X-Google-Smtp-Source: AGRyM1tZiGuUdsxhrqYhUe40OKpKjKLHpucAiduiag1kEaPCFa4zBB7r9DaKoLV8cPTwKhI5n7GFIA==
X-Received: by 2002:a92:b10e:0:b0:2d8:d8a7:8b29 with SMTP id
 t14-20020a92b10e000000b002d8d8a78b29mr9510641ilh.233.1656707357164; 
 Fri, 01 Jul 2022 13:29:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a027356000000b00331cfbce17csm10280153jae.100.2022.07.01.13.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 13:29:16 -0700 (PDT)
Received: (nullmailer pid 1469333 invoked by uid 1000);
 Fri, 01 Jul 2022 20:29:14 -0000
Date: Fri, 1 Jul 2022 14:29:14 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v13 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220701202914.GA1457156-robh@kernel.org>
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701062808.18596-2-rex-bc.chen@mediatek.com>
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

On Fri, Jul 01, 2022 at 02:27:59PM +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.

I'm sure you answered this before, but I'll keep asking until the 
information is contained within this patch. Otherwise, I won't remember. 
Is there a h/w difference in the 2 blocks? Different registers? Why 
can't you just look at what the output is connected to?

> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..26047fc65e7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,108 @@
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
> +  Device tree bindings for the MediaTek display port and
> +  embedded display port controller present on some MediaTek SoCs.
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
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  data-lanes:

This is not where data-lanes belongs. It goes in port@1 endpoint. Look 
at other users.

> +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes

Generally, not how references look in DT bindings.

> +    description: |
> +      number of lanes supported by the hardware.
> +      The possible values:
> +      0       - For 1 lane enabled in IP.
> +      0 1     - For 2 lanes enabled in IP.
> +      0 1 2 3 - For 4 lanes enabled in IP.
> +    minItems: 1
> +    maxItems: 4
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
> +  - data-lanes
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
> +        data-lanes = <0 1 2 3>;
> +        max-linkrate-mhz = <8100>;
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
> +                    remote-endpoint = <&panel_in>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.18.0
> 
> 
