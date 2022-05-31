Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07855397D7
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386DC10E282;
	Tue, 31 May 2022 20:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EE210E282
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:15:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c2so9503514edf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oFtwwjCwLQncprSW0uxMAdDJMdxwLty5X6vUURCLEwk=;
 b=ITMWpvDnZ+RR0dXG8wMy2xR2rl4TYKiJPd4P2ee+6b+YSNrXIfd5C5/sxHiIaiV8l/
 Rr8j5rbfZJQdWDicbqJLULlJ8a1LPJtojDk9pZRk5GN9Grou5i7tAHjAOnAm+43fQbft
 AItTPaS/anUqkjrgHeA8gWiVTOnJVpyYwkX4kWPrZRx3KFfTtM/N/iDSPeACILsT4aQf
 M3SWSLCBTTSyyMcH3BloOhEZjIv4V9qKLVXjfngWe+ZrAh5pvVrbUk/ZDUnhXwaHIcji
 8VSjsm3e2xhEeVQO89RSDtV5LDweV0ruYx2PZwybiDHSYQi1HJRfQptttYSjG2nvuBwD
 fRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oFtwwjCwLQncprSW0uxMAdDJMdxwLty5X6vUURCLEwk=;
 b=q7f+ZcVoCQPsGUTyomfQwo5/3CQ2N8+o2b0jG7hqn3IDVW8LU7I7pTEumd5CARkoUc
 heI8c6PuehWxr30MJYCuynhJHgbZrSiWH4uLWNnDPv9A9BNUyEwIyUkUF1wTUblCd/KN
 dr5JLzNjV9zVsejbhcyXABoJ64PDfqiNRKM/XGRn2wTUQ66GKWD5FpgGksSiCWq2g5YA
 Ds753r4ZBZioiV6wnzkybpOQsuNgdzCC5tec50tZWQueuNiENyV1bNwlWh+MnoaOpOh5
 QNhd10APn81RwrSEL2kdqe+3GBFTdyzfz1LG7ubTd6Dy4coOKtpNnq7tYfnk4Va4le2K
 E1cA==
X-Gm-Message-State: AOAM530QBPy6DcT6OU0uzwguNa6DH4xc0N32GY+1ytUo1zQiVgOpPeNP
 AZ6q76jzVlUQyAutoS1NE/wmTQ==
X-Google-Smtp-Source: ABdhPJxh3X5a34X2qfUbuwM7ahlfxQCxIkomDGMgER9D0LcMD1yvEUBK+ewRUPxHTf67kQQv6tje2Q==
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr10752639edr.209.1654028100222; 
 Tue, 31 May 2022 13:15:00 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i24-20020a170906091800b006ff05d4726esm5251077ejd.50.2022.05.31.13.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 13:14:59 -0700 (PDT)
Message-ID: <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
Date: Tue, 31 May 2022 22:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding documentation
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-2-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-2-peterwu.pub@gmail.com>
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
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 

Subject - remove "binding documentation". It's already implied by prefix.

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
> index 000000000000..9d5c4487ca9c
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
> +      - description: BC1.2 done irq for mt6370 charger
> +      - description: usb plug in irq for mt6370 charger
> +      - description: mivr irq for mt6370 charger

s/for mt6370 charger//
in each item

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

Constraints (e.g. maxItems) are needed.

> +
> +  usb-otg-vbus:

Let's keep the same name as in MT6360:

usb-otg-vbus-regulator
> +    type: object
> +    description: OTG boost regulator.
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +    properties:
> +      enable-gpio:
> +        maxItems: 1
> +        description: |
> +          Specify a valid 'enable' gpio for the regulator and it's optional

This description is pointless - does not bring any more information. You
repeat the schema. Please, avoid such descriptions.

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false


How about example? Or is it going to be in MFD schema?


Best regards,
Krzysztof
