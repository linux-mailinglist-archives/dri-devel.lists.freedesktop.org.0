Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB061EFE3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669A10E2B3;
	Mon,  7 Nov 2022 10:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF0110E2B3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 10:03:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c25so15386293ljr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RM9kb3J3wnBPlGqqjFbWWIP1RllNoZN+0SAF5Yq6Zr4=;
 b=zMGUtZu0IWNgDwJWBtEWy+3qUj/xZTiJLH3eT3yNKcOiC0kvdCoCfBnbH1cJLBnnjl
 78/SC5P1u0YdAdrVaJTsU1Ycn8In4GnViWJn/G/x7qA2x2GhGO7S3pfdg3MuxGB+ttQG
 EsZ9Ry4krL/6ZuqYd9u2jpHP+gADgE1CWK7uzdTM2MNs0Hp7hSAYGx55rldPnMl39vOo
 AZsoNaHN2Ualx8AYYKKHE7XOeTVDZLlI3jSLcVavcUL/QW1AavkAELbHnGQKEz5gFIZ2
 IKC0P8DkF9tWPQx7i6uRDGNa9bMHsEMOYpi8pYcU0/ZfmGGAhd6Mm5tGhAr37xRagpdj
 r/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RM9kb3J3wnBPlGqqjFbWWIP1RllNoZN+0SAF5Yq6Zr4=;
 b=fSY+dBa5mbiYRlXaC/Y5zHRTbn/tQ9v7F3Ue8f6kaJGdwvZEdUNjE1gCCQalyXsuUL
 +4a+Rr1W1p04wuRyIuD4ARdJFz2sV1HZw1Rc7Oy+IooYJ3V6qbQCTP8L/gpXVCfNWiAo
 cXQHyM7GzcewdcUiyhAFFJhbZsfQI6RftXi21bsZovmvmKl2gFQedlMaZFkwCSpiPze8
 vXPy1VYmrcTL0PZRsn0rr0+stBEfBjCuRzuhE8/FO27v3/d7t6pUl25JOrWsD/245HTE
 ZUikaaYJaM2Qw8KytG5iIDSppWoUj0Bh2RibbQNWv68LAyJjhoP8rWs+TNL7TxmMLzku
 qg2w==
X-Gm-Message-State: ACrzQf3QCtszR5BzG/1CHJCXXa3DHUNBq1NlvXYJORYSh303mTQqDHr3
 sRh7Ef/Zg1y4A+RSoIYrDRhQRg==
X-Google-Smtp-Source: AMsMyM45Nd4u9vh1fgVyjMywXV/syU6IzBqqpec13oIq/b2S10en3aGDNpC5XgVj+PXwKcO/NWFW4A==
X-Received: by 2002:a2e:80c4:0:b0:277:fa0:d500 with SMTP id
 r4-20020a2e80c4000000b002770fa0d500mr5209054ljg.51.1667815381318; 
 Mon, 07 Nov 2022 02:03:01 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a19ad03000000b004a459799bc3sm1150870lfc.283.2022.11.07.02.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 02:03:00 -0800 (PST)
Message-ID: <ab8528cc-fa5d-35da-0c6e-cdebc694f646@linaro.org>
Date: Mon, 7 Nov 2022 11:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-2-a803f2660127@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v3-2-a803f2660127@baylibre.com>
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

On 04/11/2022 15:09, Guillaume Ranquet wrote:
> Add mt8195 SoC bindings for hdmi and hdmi-ddc
> 
> On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
> specific register range, power domain or interrupt, making it simpler
> than its the legacy "mediatek,hdmi-ddc" binding.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 61 ++++++++++++++++++----
>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index bdaf0b51e68c..9710b7b6e9bf 100644
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
> @@ -29,18 +30,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Pixel Clock
> -      - description: HDMI PLL
> -      - description: Bit Clock
> -      - description: S/PDIF Clock
> +    minItems: 4

Drop minItems, it's not needed when equal to maxItems.

> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: pixel
> -      - const: pll
> -      - const: bclk
> -      - const: spdif
> +    minItems: 4

Drop minItems, it's not needed when equal to maxItems.


> +    maxItems: 4
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
> index 000000000000..2dc273689584
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
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ddc

Unless you expect it to grow, I propose to drop clock-names. It's not
useful when the name is the same as name of hardware.

Best regards,
Krzysztof

