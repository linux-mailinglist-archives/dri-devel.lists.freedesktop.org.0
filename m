Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F054EBDF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB5110EACA;
	Thu, 16 Jun 2022 21:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D4510E7CC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:05:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id a17so251794pls.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qWeAN6wBOdgTg8JbowHd+2FzjeCfu8a+6968a4QI8WI=;
 b=N5ZFoL+aFoUS6hB954SKMlb7yCUNVwnEz5QTGbIWpo81EwQ1sMXtUJNQgQWUFXyaqj
 B3EKyPgnhgeP6Zxqc0o0AXWyPWgb2jZKHij8R6bu7VXYG/qL6Jeu3Pus4aTVrIH5N/up
 1mVgnWLjqxO/IM/TYAske9+86aHB4TE/sPT2q6jKDvKrVbIRbqCUop88VsbKe70HL/Xn
 WD13w1gMuXTC77dfwj7AUO0e7PAT47hYpwj/3hqPUXU+ijawuZQFwT1JvD33vRGoqe5d
 JySTlKChot+aWilu0E/PsGcDvuRxR9SgKE0cOeMTOx1RDYK8f3vG2bi+O+s59MTFKM8U
 9Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qWeAN6wBOdgTg8JbowHd+2FzjeCfu8a+6968a4QI8WI=;
 b=2eMVpN5I/bp8kVDhfthTxQhYh9Zu0wXxmLRo3B9taP/3i7Vnpi96CM1ZIYXbbcCW4t
 HjL+ptCWusJ6G8HOtFLPbkf7AMzxaQx2AeCeOtfOpV9YeGBxgsYk4cxaZhYOzMXC2uiD
 MXsDl0SkAJQFFaOy7KV0dK36gE+gN9wNt1A9MEdv/6EXDpwAdaEyvkCkH6owDTq7wqxf
 1LDSjDYM3/O5wcOhkTqzGkjYmIVqVDV62KjhJVgKEM3+yx9qlk7NFht5XfMA7f63r3kc
 Zhag4bf8AF+3UwyGlAbuMqpNEXjyIs+YUXtkYI7eWSFf66IC1HPpO0UJbke7H0RhtwRm
 lbig==
X-Gm-Message-State: AJIora/eadNXPVb7c9/giuntCcErDinln1SEGG3CXvvbV2418XEups9D
 PfVPnexbWzCn2B1Yrfa7VhnKAw==
X-Google-Smtp-Source: AGRyM1unXZ92n4cSgCY+nW05HkVgMJnrvjv1CRQe+KwLgKR+A0HSLHUM2FUPV+vxq7K020P5WmFE0w==
X-Received: by 2002:a17:90b:4d8a:b0:1e6:87ad:bfd3 with SMTP id
 oj10-20020a17090b4d8a00b001e687adbfd3mr7000104pjb.138.1655413536660; 
 Thu, 16 Jun 2022 14:05:36 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a17090ad70500b001dd16b86fc0sm4249403pju.19.2022.06.16.14.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 14:05:36 -0700 (PDT)
Message-ID: <dd9b9be2-7bdf-6cb6-b8ad-d7c0a0d5b98a@linaro.org>
Date: Thu, 16 Jun 2022 14:05:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/15] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-3-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiaEn Wu <chiaen_wu@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 000000000000..b63553ebb15b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Battery Charger
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-charger
> +
> +  interrupts:
> +    description: |
> +      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
> +      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
> +      are required.
> +    items:
> +      - description: BC1.2 done irq
> +      - description: usb plug in irq
> +      - description: mivr irq
> +
> +  interrupt-names:
> +    items:
> +      - const: attach_i
> +      - const: uvp_d_evt
> +      - const: mivr
> +
> +  io-channels:
> +    description: |
> +      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
> +      is required.

Add io-channel-names and describe each item - what type of ADC it is
expected to be.

> +    minItems: 1
> +    maxItems: 9
> +
> +  usb-otg-vbus-regulator:
> +    type: object
> +    description: OTG boost regulator.
> +    $ref: /schemas/regulator/regulator.yaml#

unevaluatedProperties: false

> +
> +    properties:
> +      enable-gpio:

"gpios", so:
enable-gpios

> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false
> +
> +...


Best regards,
Krzysztof
