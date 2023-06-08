Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AE7289E2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73810E61E;
	Thu,  8 Jun 2023 21:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E257710E61E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 21:05:08 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so50873339f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 14:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686258308; x=1688850308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=659QQ5o0RJcYetO+FfSdtr0AtP1kq3MC1W2qbtyWfug=;
 b=Qo0mmfiNpnt+bSeFUnkz8X+I6CMMUouG5QDYUMISR+7Lj6s2ZWosqpZp+HqDY2CZzf
 DsEVi1m9bxhkamqptDFcF9+hIk1ri1z3R2xH5a4BVayZ0pI9GRugltowHLbEajSTqNMq
 bwRKAE5gCkJrr4bLupvJ6SbDqX9ZjK8WzSPj7ZvtdvfTSyet0UH6ij8GUw2FLhKc8AWs
 3L1Xllk7ZkSMh+eC73zUj8fNQBcgId1wAsM9tv3MhPv4IkY55+G2KiTXNJ9XD7rE8wrX
 ejXZAIoIduJ7jV1fo60YptJf2pnros949DF5uDEYuSMpM6k0DHRSI2Jcbj0u3diBTrik
 /BXw==
X-Gm-Message-State: AC+VfDydPhz5z6FPmHDFA9JcE84/xgC7tihE0ZtFxZeSwTPjbKfeM386
 QmFscdQ7eBGjgzhnqjFlpQ==
X-Google-Smtp-Source: ACHHUZ7rRmGXmnpRmT5NgdTtJuMZenCQfLq1nIBRu8sRJkOPpqT6J9aOIzMkcUolL5ZTRHcwv6gLkA==
X-Received: by 2002:a6b:fb12:0:b0:77a:c741:b749 with SMTP id
 h18-20020a6bfb12000000b0077ac741b749mr3956832iog.1.1686258307710; 
 Thu, 08 Jun 2023 14:05:07 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a02ca4e000000b00411b2414eb5sm490387jal.94.2023.06.08.14.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 14:05:06 -0700 (PDT)
Received: (nullmailer pid 3445498 invoked by uid 1000);
 Thu, 08 Jun 2023 21:05:04 -0000
Date: Thu, 8 Jun 2023 15:05:04 -0600
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Message-ID: <20230608210504.GA3436215-robh@kernel.org>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
 <20220919-v4-1-687f09a06dd9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v4-1-687f09a06dd9@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, mac.shen@mediatek.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 04:30:58PM +0200, Guillaume Ranquet wrote:
> Add mt8195 SoC bindings for hdmi and hdmi-ddc
> 
> On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
> specific register range, power domain or interrupt, making it simpler
> than the legacy "mediatek,hdmi-ddc" binding.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 59 ++++++++++++++++++----
>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 45 +++++++++++++++++
>  2 files changed, 93 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index b90b6d18a828..4f62e6b94048 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> @@ -21,6 +21,7 @@ properties:
>        - mediatek,mt7623-hdmi
>        - mediatek,mt8167-hdmi
>        - mediatek,mt8173-hdmi
> +      - mediatek,mt8195-hdmi
>  
>    reg:
>      maxItems: 1
> @@ -29,18 +30,10 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Pixel Clock
> -      - description: HDMI PLL
> -      - description: Bit Clock
> -      - description: S/PDIF Clock
> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: pixel
> -      - const: pll
> -      - const: bclk
> -      - const: spdif
> +    maxItems: 4
>  
>    phys:
>      maxItems: 1
> @@ -58,6 +51,9 @@ properties:
>      description: |
>        phandle link and register offset to the system configuration registers.
>  
> +  power-domains:
> +    maxItems: 1
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -86,9 +82,50 @@ required:
>    - clock-names
>    - phys
>    - phy-names
> -  - mediatek,syscon-hdmi
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-hdmi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: APB
> +            - description: HDCP
> +            - description: HDCP 24M
> +            - description: Split HDMI
> +        clock-names:
> +          items:
> +            - const: hdmi_apb_sel
> +            - const: hdcp_sel
> +            - const: hdcp24_sel
> +            - const: split_hdmi
> +
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Pixel Clock
> +            - description: HDMI PLL
> +            - description: Bit Clock
> +            - description: S/PDIF Clock
> +
> +        clock-names:
> +          items:
> +            - const: pixel
> +            - const: pll
> +            - const: bclk
> +            - const: spdif

I don't understand how the same h/w block can have completely different 
clocks. If not the same h/w or evolution of the same h/w, then do a 
separate schema.

> +
> +      required:
> +        - mediatek,syscon-hdmi
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> new file mode 100644
> index 000000000000..84c096835b47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek HDMI DDC for mt8195
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-hdmi-ddc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  mediatek,hdmi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the mt8195 hdmi controller
> +
> +required:
> +  - compatible
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    hdmiddc0: i2c {
> +      compatible = "mediatek,mt8195-hdmi-ddc";
> +      mediatek,hdmi = <&hdmi0>;
> +      clocks = <&clk26m>;

How does one access this h/w device? There is nothing described to 
access it.

Rob
