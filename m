Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309855597CC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 12:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E3410E862;
	Fri, 24 Jun 2022 10:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CB810E837
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:27:46 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u15so3737707ejc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Nuxc36+s4sWQDaVadkc6oPNaa2rIDEmkVevDjA38UUQ=;
 b=Lu/cMZDQbpDrvP88FBrvMyrvBoGMLxkakNs1O/w0KJCcIFSPOUBY6OryS/oCJ06YOn
 GbDK7li6a4UHrHldXUyUMMOWrNS7pm9L5bfCAY7TmNWPkoDDJz8VXQFe9Fhpv3m1uc0L
 t4Sa3S5fCj+Jep4qZr+X95xroO/Fz5Hy4UOnCnNBFg2IacvUZRBw/4DLZFBdZxUBHoUe
 5PIG9v7XeqxkrKqcy2iOjNxequ8IQZPQLNBUYSNE3EU48hl1FQubHzyALQeSD5oD6gy4
 XQLb1KUjFcLMpjEJx38RU1Cy1e+e8w6rEg3l9/raR6EjGfIkJCCDcDqn2DXE/qEDSWEt
 gzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nuxc36+s4sWQDaVadkc6oPNaa2rIDEmkVevDjA38UUQ=;
 b=hSUdjXlR4rlEISI0g1rRGTXpKDkX+wzqyqOYT2SEnrF1p4HivbDzpc07kMXLRQ9UON
 KVolO1tDuAct0zRTQkGGyaHWkATnEx0yYnm2UN/ne9nbpWs1ZWNdeErxO45nhX8DQw3w
 /fJ9CUZ5e3HqzcMBuHHoBZQhIrmrH6C4HZyuaB9cJDefCLhMqZJPeorgFwzlpoX8iW1+
 lmYEO8W4Y3dfM1zvZ8RzCjaQlYJFBS7XsJouGJAt+k9/zjdcY8uFwCD6yMuLX9L9wuaR
 UTv0D2TQKBhAFQ3REh5Gct6sFl2zwsOIopJNTjszn6mmqWMOptYvKXSen3/wm2iAzXOd
 1JKw==
X-Gm-Message-State: AJIora++r0DedZJqGabnUWSsm9P6rjAYURRm7PFmCMt8xsmA3h8HID6Q
 +7Crc/WC5MMFxbjpkWNqb9QYOA==
X-Google-Smtp-Source: AGRyM1t4wJC/XeeqGXInCg0idKMgknVDGZX7X/fQzRWF0oldACj/ylYne3Hz/Rt8agVjJawt7AOTzw==
X-Received: by 2002:a17:907:94cb:b0:721:252c:d4bb with SMTP id
 dn11-20020a17090794cb00b00721252cd4bbmr12681930ejc.148.1656066465307; 
 Fri, 24 Jun 2022 03:27:45 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o12-20020a056402038c00b0043561e0c9adsm1640034edv.52.2022.06.24.03.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 03:27:44 -0700 (PDT)
Message-ID: <06819889-2c00-83d8-0d25-ce6c2559105a@linaro.org>
Date: Fri, 24 Jun 2022 12:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 02/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-3-peterwu.pub@gmail.com>
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
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v3
> - Add items and remove maxItems of io-channels
> - Add io-channel-names and describe each item
> - Add "unevaluatedProperties: false" in "usb-otg-vbus-regulator"
> - Rename "enable-gpio" to "enable-gpios" in "usb-otg-vbus-regulator"
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml      | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 0000000..f138db6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,87 @@
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
> +      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
> +    minItems: 1
> +    items:
> +      - description: |
> +          VBUS voltage with lower accuracy (+-75mV) but higher measure
> +          range (1~22V)
> +      - description: |
> +          VBUS voltage with higher accuracy (+-30mV) but lower measure
> +          range (1~9.76V)
> +      - description: the main system input voltage
> +      - description: battery voltage
> +      - description: battery temperature-sense input voltage
> +      - description: IBUS current (required)
> +      - description: battery current
> +      - description: |
> +          regulated output voltage to supply for the PWM low-side gate driver
> +          and the bootstrap capacitor
> +      - description: IC junction temperature
> +
> +  io-channel-names:

It does not match io-channels, you need minItems here as well.

> +    items:
> +      - const: vbusdiv5
> +      - const: vbusdiv2
> +      - const: vsys
> +      - const: vbat
> +      - const: ts_bat
> +      - const: ibus
> +      - const: ibat
> +      - const: chg_vddp
> +      - const: temp_jc
> +

Best regards,
Krzysztof
