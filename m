Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC4539812
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B3810E41F;
	Tue, 31 May 2022 20:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE15A10E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:38:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w27so12412343edl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LnHG31HXQfKnbhGg7cjs5q5dHO7sV+EO7splsWy9LeQ=;
 b=G4bpmdn50HXz387vl8R3y2JvcN1BMO8J4TnlELbvBC3hch09KoDJys8Gb1VxVKVfMp
 WF4/5Bl7r3o0N8kDIFXar10RdRAF2ERfMar+yaboTm27MUMOFUcQYMywTvJn4plszWu8
 Ezu6XeSDZVZvjILJcLyo9KEkUpJBiujNlQNxKeqylfN4Z1m0gwC/cw2quZMAy9Tl2zNe
 8VT/AW2zGVespv4TQu1Zz7OhJPEKNhKrS9X+3H43j6OKle3lQ4bHS3gfG7NjX7SzzA4Y
 6dd+Ty88BqnmRjplgHfH6NgwyQ/L5t4nymBrZrAKk05FYWSm/8zJsHLfWc7dmq7YPoJ5
 1mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LnHG31HXQfKnbhGg7cjs5q5dHO7sV+EO7splsWy9LeQ=;
 b=sjvbBjT29PZfTJFXGRh0P+iyCojeMN7qCZXGNe6tqnfTcDKgslzLb2y/CbjoAcSL51
 cIaytssu/q1SKo1Z3DqhMcQFVh0BCfqcm2hqT3COc2vPz99pkYVNfVWmajYw28oQq9KM
 jan6iH3aN+BeY+MYcx0m9DPmdGuRHpXVuBs3zQ6WA29GrzlEKbnaZRFeRFPRvNt0DqwR
 Lpe4dCeYmIrDbMWbcX20ZtZtXtS2tjFW4H0n1NemvG+BxiC/AHF7qWvmWFuMwGRXkYOU
 oWES1WDgd5vas4J8g/uKlTHlUSbjpLqAIP9EJq3+hzUtmmF4m9P/VmTpXzkqiBbEqVof
 aAAA==
X-Gm-Message-State: AOAM533suZSAsMagMWrZLDZH1TQIe5prnc2BtHHWl6U+4fcz6B2dXkLQ
 qY3VnVBWUMBVSsyJuQA562cM0isVog2iFoUD
X-Google-Smtp-Source: ABdhPJxkgTOHGDh/+1ZlJUDIpeS1F3D633+ql1GnhfBUpZG6Av5LP8dRbdIOBf6rA5kXSNJ0tE0G7w==
X-Received: by 2002:a05:6402:1f0f:b0:42d:d4a5:a38c with SMTP id
 b15-20020a0564021f0f00b0042dd4a5a38cmr10987637edb.140.1654029514252; 
 Tue, 31 May 2022 13:38:34 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 12-20020a50874c000000b0042bc5a536edsm9094727edv.28.2022.05.31.13.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 13:38:33 -0700 (PDT)
Message-ID: <0036b3f3-fdf8-4635-18e9-461b93a87f19@linaro.org>
Date: Tue, 31 May 2022 22:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 indicator documentation
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-3-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2022 12:42, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 indicator documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> new file mode 100644
> index 000000000000..823be3add097
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> @@ -0,0 +1,57 @@
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
> +  see Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
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
> +  "^(multi-)?led@[0-3]$":
> +    description: |
> +      Properties for a single LED.

Not useful description. Just skip it, I think schema allows it.

> +    $ref: common.yaml#
> +    type: object
> +
> +    properties:
> +      reg:
> +        description: |
> +          Index of the LED.

The same, regs are usually not described.

> +        enum:
> +          - 0 # LED output ISINK1
> +          - 1 # LED output ISINK2
> +          - 2 # LED output ISINK3
> +          - 3 # LED output ISINK4
> +
> +      mediatek,soft-start:
> +        description: |
> +          soft start step control, support /0.5ms/1ms/1.5ms/2ms.

Why here you start sentence lower-case?

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]

This has to be in logical values, so in ms, not in some register values.
Use proper unit suffix and enumerate the actual values.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof
