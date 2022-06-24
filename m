Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3863559899
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 13:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3C10E65B;
	Fri, 24 Jun 2022 11:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAE510E65B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 11:39:40 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id mf9so4241395ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Wj6+le4xQYgRWhbJ4o+JcrPIptpoGXL5M4xVrdtZbXI=;
 b=O26iv82q0trCWgDQwRmW6rUiSusM7pWvnNkO+V25QbNy7sOhu5esaQuJS7PwEwU3me
 Y5h7BfA9Gsbe2XrGvelcv6XAS5b+QDIjWuyq9j37ZvWmhRmJ48gmjKfPI+n6s0JkG0Im
 CDVkH9TIGF7b8/w7lXV62OP94WgbzGfx7wpTJbGIrqDtM3uOjQnbLKSKlKwAtePFBT0V
 p0UC7KC2dcsZiVk+jsW+BB+3hwR39LVFSI68D3J4t1grJmX1kHAWk4K42QCX24AX1oi0
 SbMSM89C1Pj1C7dtRAeCcSnHR7lTOSfcpvpwV+KgsO9loIxaBH/9by5n0QkWSZvgYpVw
 4zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wj6+le4xQYgRWhbJ4o+JcrPIptpoGXL5M4xVrdtZbXI=;
 b=T9GFGEyzmmu9c+hn3aBPZBmJrBang3QSnsjUtR8UX/3aNgZGKTmWTF/8W/05hqZcyQ
 hJdJaCfkNZ16MYF6tr8LaQ9llbf+H9ha0aKLq7SfbrOKs+ikiDri3nmc0UNf10zXC1HU
 890PfZX2cQIO83PSJ4ltsmFo690oaHXrGRcGUvu3gW6xXkVVGpkTZ7EEHFTFrRl9UBB8
 QjNtkUFka73MTThlLCaUhnjlmQ6NpT9/S5UjDoF4rBBXVnWWTQV+ch5nyQo2r7IhGHeR
 0IfMUyb4OAp3K4Os8V/fDsNbOLB+qMqU+7upFrIGExl3VVmvdI9fDdVY74GTg3gnwDm/
 wCyQ==
X-Gm-Message-State: AJIora9r0YkI/89KqFUGeq8nRzR1bYHz9aZugg29ap0PBtxRleg8rYyt
 PWz2xSRSzIDCg4qOJan6aHoP7g==
X-Google-Smtp-Source: AGRyM1tMl63rWpj4b70pBJHZZBdq7tLURrxHPvEhTWmOq2GveNEsVZf4u0behvJ6CGqQ22A5aqS+/g==
X-Received: by 2002:a17:907:7e81:b0:726:2912:7467 with SMTP id
 qb1-20020a1709077e8100b0072629127467mr7207432ejc.373.1656070778635; 
 Fri, 24 Jun 2022 04:39:38 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b007219c20dcd8sm962517ejd.196.2022.06.24.04.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 04:39:38 -0700 (PDT)
Message-ID: <8956c98e-657c-0263-c8d9-d6beb54410f9@linaro.org>
Date: Fri, 24 Jun 2022 13:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 06/14] dt-bindings: mfd: Add Mediatek MT6370
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-7-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-7-peterwu.pub@gmail.com>
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
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Use " in entire patchset
> - Refine ADC description
> - Rename "enable-gpio" to "enable-gpios" in "regualtor"
> - Change "/schemas/" to "../" in every reference of all MT6370 modules
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> new file mode 100644
> index 0000000..fa9da13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> @@ -0,0 +1,280 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 SubPMIC
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |
> +  MT6370 is a highly-integrated smart power management IC, which includes a
> +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
> +  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
> +  driver, a backlight WLED driver, a display bias driver and a general LDO for
> +  portable devices.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370
> +
> +  reg:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  adc:
> +    type: object
> +    description: |
> +      Provides 9 channels for system monitoring, including VBUSDIV5 (lower
> +      accuracy, higher measure range), VBUSDIV2 (higher accuracy, lower
> +      measure range), VBAT, VSYS, CHG_VDDP, TS_BAT, IBUS, IBAT, and TEMP_JC.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6370-adc
> +
> +      "#io-channel-cells":
> +        const: 1
> +
> +    required:
> +      - compatible
> +      - "#io-channel-cells"
> +
> +  backlight:
> +    type: object
> +    $ref: ../leds/backlight/mediatek,mt6370-backlight.yaml#

This was correct before: /schemas/leds/ ....

Same in other places.


Best regards,
Krzysztof
