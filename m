Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697E5FF20B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 18:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF6510E9AC;
	Fri, 14 Oct 2022 16:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D614910E9AC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 16:10:00 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id d13so2751195qko.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 09:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ibaUtiZs0j0ZyBp6RNG4pWG3FWVSOwMKv1XJhYLZ2A=;
 b=ztcKC+/Ury/FfFgOgJ7c8e99UOUsKW0FnQzuxZOvUmCMIbBIlKK5/X5gdg5eWMiRqm
 Yx69tkmNYfyPgPpvi2FY66gvTL0Yn7NTEwXjF1eF0D4mDyjM3lESE3WgziRoYWbaRbHu
 XcyiSpySlB8FKGB03etji4m7rRoPFfXALIdz2XqLu2sXl8byNOD4u+cnYvzlRgmhjxsF
 Z8kgtXU8siH6jEnOd74igCyHjuh15ZkqMivhnN6gcnOdlFmJtKPPx1EbkuDubjBJWgQu
 EDXhhkItZOcsScE3goaVX2a34LFlg9KAC3j31vuO/mT7flBS8aFwwWMExsF6l8isx7oa
 i4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ibaUtiZs0j0ZyBp6RNG4pWG3FWVSOwMKv1XJhYLZ2A=;
 b=olXU5hw7Z+bthBXqECc1uVh1qJRXvvsT1+2WUd0Y9LveKv+iuXkDe/OcbBue7J/Qqu
 eJH0XgsxZxvPQAeEtQNCJKBhDuXA6zPJvZfeaihRumL+XyOXk3yNOtPbT1hRJblgvsfT
 GvDVzqmzAhDbuhHpFRl6JLSzUP15erDLPFl6hd8ktIExd7kL5JGP4i2VaK5J+66AVLGJ
 2AGsnJPXbjtvgTepfLVgH6DOMxnIwskbnvGDaVkNWOGrWEXfWJkv2ZS8yiZ5gLCk0eDD
 WRSxWluiVP4/5huxGlDjeVJexgoYaVdhbrMPPKV5bEw3+bcmCIso2Vbweq/iwOZjCPuT
 Y1GQ==
X-Gm-Message-State: ACrzQf2mI8Y5+olauw82MChR3UrU3EkpY+KC97C+k+v/qr/tFGFznES6
 4wekbGCBarEeRJBtJioLpZSaeA==
X-Google-Smtp-Source: AMsMyM7ICLgE4IVjUyTBhoH1DHcdwrnifWy6OeB5AVaA4jWEGk9f8HKoHbLWrqi1/nVvZzRojjP/mA==
X-Received: by 2002:a37:bc3:0:b0:6ee:7931:9e5a with SMTP id
 186-20020a370bc3000000b006ee79319e5amr4301025qkl.105.1665763799878; 
 Fri, 14 Oct 2022 09:09:59 -0700 (PDT)
Received: from [192.168.7.170] ([12.190.236.102])
 by smtp.gmail.com with ESMTPSA id
 dm48-20020a05620a1d7000b006e99290e83fsm2887515qkb.107.2022.10.14.09.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 09:09:59 -0700 (PDT)
Message-ID: <c91ee3ce-3f30-a3ef-bb38-8571e488b6b6@linaro.org>
Date: Fri, 14 Oct 2022 12:08:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jitao shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
 <20220919-v2-2-8419dcf4f09d@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v2-2-8419dcf4f09d@baylibre.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 11:15, Guillaume Ranquet wrote:
> Add mt8195 SoC bindings for hdmi and hdmi-ddc
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 67 +++++++++++++++++-----
>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++
>  2 files changed, 104 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index bdaf0b51e68c..955026cd7ca5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> @@ -21,26 +21,21 @@ properties:
>        - mediatek,mt7623-hdmi
>        - mediatek,mt8167-hdmi
>        - mediatek,mt8173-hdmi
> +      - mediatek,mt8195-hdmi
>  
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> -

This change is not really explained in commit msg...

>    clocks:
> -    items:
> -      - description: Pixel Clock
> -      - description: HDMI PLL
> -      - description: Bit Clock
> -      - description: S/PDIF Clock
> +    minItems: 4
> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: pixel
> -      - const: pll
> -      - const: bclk
> -      - const: spdif
> +    minItems: 4
> +    maxItems: 4
> +
> +  interrupts:
> +    maxItems: 1
>  
>    phys:
>      maxItems: 1
> @@ -58,6 +53,9 @@ properties:
>      description: |
>        phandle link and register offset to the system configuration registers.
>  
> +  power-domains:
> +    maxItems: 1
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -86,9 +84,50 @@ required:
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
> +
> +      required:
> +        - mediatek,syscon-hdmi
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> new file mode 100644
> index 000000000000..0fe0a2a2f17f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> @@ -0,0 +1,51 @@
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

I think I wrote it - you already have bindings for HDMI DDC. I doubt
that these are different and it looks like you model the bindings
according to your driver. That's not the way.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ddc
> +
> +  mediatek,hdmi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the mt8195 hdmi controller
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    hdmiddc0: ddc_i2c {

Node names should be generic - ddc.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

No underscores in node names.

Additionally I2C devices have addresses on the bus. Why this one doesn't?

> +      compatible = "mediatek,mt8195-hdmi-ddc";
> +      mediatek,hdmi = <&hdmi0>;
> +      clocks = <&clk26m>;
> +      clock-names = "ddc";
> +    };
> +
> +...
> 

Best regards,
Krzysztof

