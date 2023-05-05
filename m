Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD56F8A10
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 22:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AD510E670;
	Fri,  5 May 2023 20:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A40C10E670
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 20:20:13 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6a5da18f7f5so1732378a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 13:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683318013; x=1685910013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jeVjl15EmXwPrSoTLLJ5uHm4Jcc6syTLqrZaF+h77Ng=;
 b=HmkM3UlsI7T9+rAAutck+LejLPHQRypuRkG0B2JGkBd0M0zMwuTeWNj6dsy21ao271
 /mYt4crTx7/B+NldSJU6gmVVHd/u7m7xgfjSD4A4HM8mJplnAalzgiXwEgveY3NG9+h0
 TXBengkxnA6fRlUrAOIVhWsX217FnlZ+1HNdjOupafD1J6GQhLc/q4P315FcstGPQWR0
 x7jjGLhjCo96yOKPYhKhBaHJDBikwASJE9XApDXl9Nrx5UqDYHJesPgN+pUh4q7BzzP6
 eBiVAtk09RfGw45fb3ZsHAfX8LJ+eqkvW4FncsD9MPsWrbojUToRZiwZseL0UM1mD6a3
 XTUA==
X-Gm-Message-State: AC+VfDwei9Okb1Mf2+TnBf+6tmU+v23KOuHZosTJ+UB8wKTigqM4pXKm
 fU61V9NjzC9J6IcYWxC0gA==
X-Google-Smtp-Source: ACHHUZ7X8aQNmpfMIMdOoP0/+wzyXQXke+6RJNTzYtkQr3VDmT0W1LeWUqibheXdp6rvT1lPprIs3w==
X-Received: by 2002:a05:6870:e28c:b0:187:baaf:fb24 with SMTP id
 v12-20020a056870e28c00b00187baaffb24mr1409070oad.29.1683318012756; 
 Fri, 05 May 2023 13:20:12 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p5-20020a056870868500b00172ac40356csm2218324oam.50.2023.05.05.13.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 13:20:12 -0700 (PDT)
Received: (nullmailer pid 3501013 invoked by uid 1000);
 Fri, 05 May 2023 20:20:10 -0000
Date: Fri, 5 May 2023 15:20:10 -0500
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: lp855x: convert to YAML and
 modernize
Message-ID: <20230505202010.GA3494651-robh@kernel.org>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
 <20230429104534.28943-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429104534.28943-2-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 29, 2023 at 12:45:31PM +0200, Artur Weber wrote:
> Notable changes:
> - ROM child nodes use dashes instead of underscores; the driver
>   reads all child nodes regardless of their names, so this doesn't
>   break ABI.
> - pwm-period argument is deprecated, as it effectively duplicates
>   the period value provided in pwms. The driver continues to accept
>   the property, so this should not break ABI.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  .../leds/backlight/lp855x-backlight.yaml      | 148 ++++++++++++++++++
>  .../bindings/leds/backlight/lp855x.txt        |  72 ---------
>  2 files changed, 148 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
> new file mode 100644
> index 000000000000..dfe8131d2a32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/lp855x-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments LP855X backlight controllers
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lp8550
> +      - ti,lp8551
> +      - ti,lp8552
> +      - ti,lp8553
> +      - ti,lp8555
> +      - ti,lp8556
> +      - ti,lp8557
> +
> +  reg:
> +    maxItems: 1
> +
> +  dev-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      Value of device control register. This is a device-specific value.
> +
> +  bl-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Backlight device name.
> +
> +  init-brt:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Initial value of backlight brightness.
> +
> +  power-supply:
> +    description: Regulator which controls the 3V rail.
> +
> +  enable-supply:
> +    description: Regulator which controls the EN/VDDIO input.
> +
> +  pwms:
> +    maxItems: 1
> +    description: |
> +      PWM channel to use for controlling the backlight; setting this
> +      enables the PWM-based backlight control mode.
> +
> +  pwm-names: true
> +
> +  pwm-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      PWM period value. Deprecated; set the period value in the pwms
> +      property instead.
> +    deprecated: true
> +
> +patternProperties:
> +  "^rom-[0-9a-f]{2}h$":
> +    type: object
> +    description: Nodes containing the values of configuration registers.

       additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    properties:
> +      rom-addr:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Register address of ROM area to be updated.
> +
> +      rom-val:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Value to write to the ROM register.
> +
> +required:
> +  - compatible
> +  - reg
> +  - dev-ctrl
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@2c {
> +            compatible = "ti,lp8555";
> +            reg = <0x2c>;
> +
> +            dev-ctrl = /bits/ 8 <0x00>;
> +
> +            pwms = <&pwm 0 10000>;
> +            pwm-names = "lp8555";
> +
> +            /* 4V OV, 4 output LED0 string enabled */
> +            rom-14h {
> +              rom-addr = /bits/ 8 <0x14>;
> +              rom-val = /bits/ 8 <0xcf>;
> +            };
> +
> +            /* Heavy smoothing, 24ms ramp time step */
> +            rom-15h {
> +              rom-addr = /bits/ 8 <0x15>;
> +              rom-val = /bits/ 8 <0xc7>;
> +            };
> +
> +            /* 4 output LED1 string enabled */
> +            rom-19h {
> +              rom-addr = /bits/ 8 <0x19>;
> +              rom-val = /bits/ 8 <0x0f>;
> +            };
> +        };
> +    };
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@2c {
> +            compatible = "ti,lp8556";
> +            reg = <0x2c>;
> +
> +            bl-name = "lcd-bl";
> +            dev-ctrl = /bits/ 8 <0x85>;
> +            init-brt = /bits/ 8 <0x10>;
> +        };
> +      };
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@2c {
> +            compatible = "ti,lp8557";
> +            reg = <0x2c>;
> +            enable-supply = <&backlight_vddio>;
> +            power-supply = <&backlight_vdd>;
> +
> +            dev-ctrl = /bits/ 8 <0x41>;
> +            init-brt = /bits/ 8 <0x0a>;
> +
> +            /* 4V OV, 4 output LED string enabled */
> +            rom-14h {
> +              rom-addr = /bits/ 8 <0x14>;
> +              rom-val = /bits/ 8 <0xcf>;
> +            };
> +        };
> +    };
