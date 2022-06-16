Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA254EC4B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C3B10E70F;
	Thu, 16 Jun 2022 21:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B2510E70F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:13:39 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id e9so2383900pju.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Kq/MImyJWDNQF4uVHL2hoQzE+MOoY9vKXhkH8pM9iWw=;
 b=oDMV4rTsW6tuuydGHoAl95ll57TYHtuIcLgxX6P7/F+8fIbQhjShTYv2VvzpwP7I2f
 ODHrtoYjkED2az8ySqcIMrm+pOu+7wc36Gixgd4SqjTTp2xGjJwjUIq7Ph9degSmWdKX
 yj+zZbeGwC2SAvyU6KbLZ+Xaj2RwEPcHQKXAY2iJoap6UrcUJyAmwqtTzidiQL+PewJN
 TXCl3YI8GHPSj+2facEjkfri+q2kbnFjLZgmiFiaUiSyp9HGqAx9gzJuFbGW9OmISdjg
 cuyrA3nq+PB2AEHmSSIN5WKjGpYumFtoXZ9U4IEaUlHrLbpqtigpthN2+jEEbLDZnr8E
 qDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kq/MImyJWDNQF4uVHL2hoQzE+MOoY9vKXhkH8pM9iWw=;
 b=CAQtHbv9YGDE6zUbrIMmhR2+u0Q1RxMILXsNMEDyqfVkzzyIJIgA9uECT5UfLGy1fC
 oROCHBgJhcLMpsDcBU/9luv9qtCO71BNx8PVePPCS8b4q9a3Nc9BPlcVcHlyQKMiiICB
 mv9//1UiOCFV0psz5uYfZ5McgyE+jP8LW626SyUA9gHilQ+XTCs8zO7uHgzGCr8Ygoyp
 1dCQL6UL2GMUduEvmu29h07oNKvCkX0962Bi49uVdVJXnAPaR0jISM131xS7nujtkRfd
 e+EAx7M7UUEL2hzIK8XYfmZE4D7Ug1dohBPv+kqSWcy3r6dXPNGYWMwb5SVvYm4DmZlV
 R4rg==
X-Gm-Message-State: AJIora+TZyDYC7lP7pn0yHE2s/VXkOH++BTY4TIgdhWzIrBapSg0wgaF
 EhteKQTKb5Ls4y2j1N35IFb4Qw==
X-Google-Smtp-Source: AGRyM1sXBnnmN0CPt8Et0W6JQWWLYChMrg1Zy3h2FXLYYO9nrTkigRzDuYC+LUgyDJpx2ZUWmbfawg==
X-Received: by 2002:a17:902:dccb:b0:168:f9f4:5773 with SMTP id
 t11-20020a170902dccb00b00168f9f45773mr6364361pll.124.1655414018850; 
 Thu, 16 Jun 2022 14:13:38 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a629a12000000b0051bf246ca2bsm2187451pfe.100.2022.06.16.14.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 14:13:38 -0700 (PDT)
Message-ID: <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
Date: Thu, 16 Jun 2022 14:13:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 05/15] dt-bindings: backlight: Add Mediatek MT6370
 backlight
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-6-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-6-peterwu.pub@gmail.com>
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
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../backlight/mediatek,mt6370-backlight.yaml  | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> new file mode 100644
> index 000000000000..25a05e607e83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Backlight
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  The MT6370 Backlight WLED driver supports up to a 29V output voltage for
> +  4 channels of 8 series WLEDs. Each channel supports up to 30mA of current
> +  capability with 2048 current steps (11 bits) in exponential or linear
> +  mapping curves.
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-backlight
> +
> +  default-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  max-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  enable-gpios:
> +    description: External backlight 'enable' pin
> +    maxItems: 1
> +
> +  mediatek,bled-pwm-enable:
> +    description: |
> +      Enable external PWM input for backlight dimming
> +    type: boolean
> +
> +  mediatek,bled-pwm-hys-enable:
> +    description: |
> +      Enable the backlight input-hysteresis for PWM mode
> +    type: boolean
> +
> +  mediatek,bled-pwm-hys-input-bit:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      The selection of the upper and lower bounds threshold of backlight
> +      PWM resolution. If we choose selection 3 (6 bits), the variation of PWM
> +      resolution needs over than 64 steps (2^6).
> +      value mapping:
> +        - 0: 1
> +        - 1: 2
> +        - 2: 4
> +        - 3: 6

Nope, I said last time:
"In any case you cannot have values mapping"

Please use proper real world value, not some register bits. The property
name also needs fixing.

> +
> +  mediatek,bled-ovp-shutdown:
> +    description: |
> +      Enable the backlight shutdown when OVP level triggered
> +    type: boolean
> +
> +  mediatek,bled-ovp-microvolt:
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Backlight OVP level selection.
> +      value mapping:
> +        - 0: 17000000
> +        - 1: 21000000
> +        - 2: 25000000
> +        - 3: 29000000

No. Please test your bindings.

microvolt cannot be 1 mV. It's 21000000, not 1. No value mappings.

> +
> +  mediatek,bled-ocp-shutdown:
> +    description: |
> +      Enable the backlight shutdown when OCP level triggerred.
> +    type: boolean
> +
> +  mediatek,bled-ocp-microamp:
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Backlight OC level selection.
> +      value mapping:
> +        - 0: 900000
> +        - 1: 1200000
> +        - 2: 1500000
> +        - 3: 1800000

Nope.

> +
> +  mediatek,bled-channel-use:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      Backlight LED channel to be used.
> +      Each bit mapping to:
> +        - 0: CH4
> +        - 1: CH3
> +        - 2: CH2
> +        - 3: CH1
> +    minimum: 1
> +    maximum: 15
> +
> +required:
> +  - compatible
> +  - mediatek,bled-channel-use
> +
> +additionalProperties: false


Best regards,
Krzysztof
