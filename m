Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFC52FD7E
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 17:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EA710E110;
	Sat, 21 May 2022 15:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A602A10E110
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 15:03:45 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id w14so18714622lfl.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4qCtL0+bm+n7u/HXMR/ejdT6S5mFrpV8yho83BhRO5s=;
 b=y5RaZjFHrW8w0QDRcNsylDIFb53EJ2po4JTV2FpNAdkAYoZdu1qF5axrhsPQuGATng
 IRhb46WEpzowjRCtShPff9kYW6hHmeuNWcNUVWWram5Vsu13pwjOphSj50HlavWfE75o
 fl8HJqVUjSx8QbwUjbHsCAWiX5BauC0NO2ZKYDPS4ebr9JVbKM3hZESP+xBd6W4RKh33
 MjPK1gRmYo1vuibvD7RGvzYvB0fQWdgtoSLYcw2VHu54BnbEvJcolLEa1EoGN8BAPKCL
 xL8v5PmCr8qaYJ68UOqWoeB4NePuVP6tv4mkCntQBpW2qZmf/QlRL9lcpkc3pjzue05U
 zOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4qCtL0+bm+n7u/HXMR/ejdT6S5mFrpV8yho83BhRO5s=;
 b=a6vGJbCncGySZ8N6QwUwk+qxgzOzZ0R6n0f2MHrKSP1VRQNqbatmEiFZJAewA6wVYl
 Ne/OzChEhF0xu/q6ULm8awQskxQxKeXig7UcXT+6egDBjcORu8P5xUryx8FSJIvhB/Tz
 G1j7lY4glp6Jv9C7CzGZZcHe6KJVM0kfEokQQ66CZ9c+RfWfGkCOg8CAIAUe4cqpfrcg
 lGV+Hi1YKjIQgCsCpQKq02+R/zmOMc+mYM2As2Yr3BUdYSpVixM3cBpcZPkJn8P18Pow
 yWekpXExmx+ZjK9jM9d1k/d3ari0iUDEeuScuwnDW+nNsX2CU4u79xKFV4bnqSa38YCj
 Onjg==
X-Gm-Message-State: AOAM530Bf8n+TP5/CkDC+0izKBk7Bpu0hjvV5MmTSftuHZg559JvxlcA
 FNxlzoDLlWRyqszCDzgFPF6YgA==
X-Google-Smtp-Source: ABdhPJxtHDtDb6cleVJCc0ulh0XswzEKTSNzq7RDBh7mwPl4obmqj7ZYfKIcfiHfX3+2J00L6fmtSQ==
X-Received: by 2002:ac2:4f0c:0:b0:477:cb8e:bd8b with SMTP id
 k12-20020ac24f0c000000b00477cb8ebd8bmr5791149lfr.209.1653145423865; 
 Sat, 21 May 2022 08:03:43 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p20-20020ac24ed4000000b0047255d210easm1087910lfr.25.2022.05.21.08.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 08:03:43 -0700 (PDT)
Message-ID: <6ae55a29-0b29-f53c-c9bd-fae929f3caf7@linaro.org>
Date: Sat, 21 May 2022 17:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Peter Rosin <peda@axentia.se>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Sebastian Reichel <sre@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>
References: <20220519211411.2200720-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
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
Cc: chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2022 23:14, Rob Herring wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
> 
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/hisilicon/controller/hip04-bootwrapper.yaml       | 5 +++--
>  .../bindings/display/bridge/toshiba,tc358768.yaml         | 1 +
>  .../devicetree/bindings/display/panel/panel-timing.yaml   | 5 +++++
>  .../bindings/display/panel/raydium,rm67191.yaml           | 1 +
>  .../bindings/display/panel/samsung,s6e8aa0.yaml           | 1 +
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml       | 1 +
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 1 +
>  .../devicetree/bindings/input/matrix-keymap.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/i2c/adv7604.yaml  | 3 ++-
>  Documentation/devicetree/bindings/mux/reg-mux.yaml        | 8 ++++++--
>  Documentation/devicetree/bindings/net/cdns,macb.yaml      | 1 +
>  Documentation/devicetree/bindings/net/ingenic,mac.yaml    | 1 +
>  .../devicetree/bindings/net/ti,davinci-mdio.yaml          | 1 +
>  .../devicetree/bindings/net/wireless/ti,wlcore.yaml       | 2 ++
>  .../devicetree/bindings/pci/snps,dw-pcie-ep.yaml          | 6 ++++--
>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml   | 2 ++
>  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml    | 2 ++
>  Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml | 1 +
>  .../devicetree/bindings/power/supply/battery.yaml         | 7 ++++++-
>  .../devicetree/bindings/power/supply/charger-manager.yaml | 1 +
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml   | 1 +
>  Documentation/devicetree/bindings/serial/8250.yaml        | 1 +
>  .../devicetree/bindings/sound/audio-graph-card2.yaml      | 3 +++
>  .../devicetree/bindings/sound/imx-audio-hdmi.yaml         | 3 +++
>  Documentation/devicetree/bindings/usb/smsc,usb3503.yaml   | 1 +
>  25 files changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml b/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml
> index 7378159e61df..483caf0ce25b 100644
> --- a/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml
> +++ b/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml
> @@ -17,14 +17,15 @@ properties:
>        - const: hisilicon,hip04-bootwrapper
>  
>    boot-method:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: |
>        Address and size of boot method.
>        [0]: bootwrapper physical address
>        [1]: bootwrapper size
>        [2]: relocation physical address
>        [3]: relocation size
> -    minItems: 1
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 4
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index 3bd670b8e5cd..0b6f5bef120f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -58,6 +58,7 @@ properties:
>  
>              properties:
>                data-lines:
> +                $ref: /schemas/types.yaml#/definitions/uint32
>                  enum: [ 16, 18, 24 ]
>  
>        port@1:
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> index 7749de95ee40..229e3b36ee29 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> @@ -146,6 +146,7 @@ properties:
>        Horizontal sync pulse.
>        0 selects active low, 1 selects active high.
>        If omitted then it is not used by the hardware
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
>    vsync-active:
> @@ -153,6 +154,7 @@ properties:
>        Vertical sync pulse.
>        0 selects active low, 1 selects active high.
>        If omitted then it is not used by the hardware
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
>    de-active:
> @@ -160,6 +162,7 @@ properties:
>        Data enable.
>        0 selects active low, 1 selects active high.
>        If omitted then it is not used by the hardware
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
>    pixelclk-active:
> @@ -169,6 +172,7 @@ properties:
>        sample data on rising edge.
>        Use 1 to drive pixel data on rising edge and
>        sample data on falling edge
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
>    syncclk-active:
> @@ -179,6 +183,7 @@ properties:
>        sample sync on rising edge of pixel clock.
>        Use 1 to drive sync on rising edge and
>        sample sync on falling edge of pixel clock
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
>    interlaced:
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> index 745dd247c409..617aa8c8c03a 100644
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> @@ -24,6 +24,7 @@ properties:
>  
>    dsi-lanes:
>      description: Number of DSI lanes to be used must be <3> or <4>
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [3, 4]
>  
>    v3p3-supply:
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> index ca959451557e..1cdc91b3439f 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> @@ -36,6 +36,7 @@ properties:
>  
>    init-delay:
>      description: delay after initialization sequence [ms]
> +    $ref: /schemas/types.yaml#/definitions/uint32
>  
>    panel-width-mm:
>      description: physical panel width [mm]
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index 5fe19fa5f67c..a99e7842ca17 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -26,6 +26,7 @@ properties:
>      const: 2
>  
>    registers-number:
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: Number of daisy-chained shift registers
>  
>    enable-gpios:
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index e8f137abb03c..aa61fe64be63 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -31,6 +31,7 @@ properties:
>      type: boolean
>  
>    function-row-physmap:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 1
>      maxItems: 15
>      description: |
> diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.yaml b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> index 6699d5e32dca..9f703bb51e12 100644
> --- a/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> +++ b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> @@ -27,6 +27,10 @@ properties:
>        column and linux key-code. The 32-bit big endian cell is packed as:
>            row << 24 | column << 16 | key-code
>  
> +  linux,no-autorepeat:
> +    type: boolean
> +    description: Disable keyrepeat

This should be rather a separate patch - it's documenting a missing
property, not only a type.

Best regards,
Krzysztof
