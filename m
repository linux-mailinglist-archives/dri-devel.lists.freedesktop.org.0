Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A75597ED
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 12:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F46910E68A;
	Fri, 24 Jun 2022 10:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4510E525
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:35:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sb34so3760950ejc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GeySHEpfB0/asXQLszsfiLjDcMnpUMVH0jqVoWkX/7o=;
 b=uZ1wC8VHxURHrghX2//skAqQ30um2Rme3cIPNULf/p3DBJwzdeGZCHn64BbW1bwOoh
 MK7I4FRm4lPVfnOutTChG+9M+lYc4y4yEjHQmcsNNibkepmTc5kqbxTtx/VHfIwqpSFA
 A7a2fOZ7cvl48zaPYnFMhKsgQgSk6uKOAABQ6m5HcNHn+pYfMPqsOfrhh43gWvLbEKIG
 AMwez5zF4oib8KlCHUoPbdzUVBf2Mmj6iqKOZO4I2HmkzMfM5iXV86deY5+S7vEL+BT9
 wv3F9Puov/5GuHxXic5VvIIGs7RASkq12ilmGiKxF+k5qkfHOarvRWT8G3ev/yK3xUvF
 FD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GeySHEpfB0/asXQLszsfiLjDcMnpUMVH0jqVoWkX/7o=;
 b=b5uGI88MMJD/dv5GHLyPRFF+g7aLqRw24rdkbyXEGPQ1uubn/so2jb+g7eACOuX4k+
 7Ha0ygT7CM7eBx1bnRRKo/vqjFzjgw0Ln629ixTk6AxT8Bem0VM8NMymVzVaDU2kokbo
 6TehkaPl52Zi7fVXBt/Q1srh6h3g07CMbyqzpQ+gKYjz6Rsr/6k2nt0EvpnqVVxDZlY2
 JoN7e11M4pLigAZiZwwNdh+Yt7I65MR15bzw8QugDkve+jD/MrUczw6KQeyw5w5aNGp8
 DLrt3UJC5kxLqP3c5K/xqB4+xSj1GCJ5UI3MFHXeI4xybP1KuJtQkSJCUQRoSnnqf3bZ
 8tLg==
X-Gm-Message-State: AJIora/r2BpxY5QTK0FG+g3CUqOu4EpVeLtWNzS8yOrV0IOGnCJu2ZNs
 DMqo0EQYMJJv3MAcVz8o4W9t2Q==
X-Google-Smtp-Source: AGRyM1sqyv+H/bBGuPYg4PIFRLo9cOE04f0nH/20g7zmKiDRIOyqtdjIViwQXday1ZlmdpGjP7k8OA==
X-Received: by 2002:a17:907:1694:b0:716:14a4:fba with SMTP id
 hc20-20020a170907169400b0071614a40fbamr13073900ejc.290.1656066926720; 
 Fri, 24 Jun 2022 03:35:26 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b0042617ba638esm1683916edt.24.2022.06.24.03.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 03:35:25 -0700 (PDT)
Message-ID: <aec8ecdb-7c76-1261-216b-b40e450d1bf8@linaro.org>
Date: Fri, 24 Jun 2022 12:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-4-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-4-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2022 13:56, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 current sink type LED indicator binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Use leds-class-multicolor.yaml instead of common.yaml.
> - Split multi-led and led node.
> - Add subdevice "led" in "multi-led".
> ---
>  .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> new file mode 100644
> index 0000000..45030f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
> +
> +allOf:
> +  - $ref: leds-class-multicolor.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-indicator
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^multi-led@[0-3]$":
> +    type: object

Here as well unevaluatedProperties:false (on the type level)

> +
> +    properties:
> +      reg:
> +        enum: [0, 1, 2, 3]
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^led@[0-2]$":
> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - reg
> +          - color
> +
> +    required:
> +      - reg
> +      - color
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +  "^led@[0-3]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        enum: [0, 1, 2, 3]
> +
> +    required:
> +      - reg
> +      - color
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof
