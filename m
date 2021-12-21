Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6647C7A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 20:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A0910EA8D;
	Tue, 21 Dec 2021 19:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BB610F77A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 19:41:23 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id l11so72909qke.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 11:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=duofUTwu8b95rKJDUSHd36lYQ0sEGfkma/8SKA1oW+M=;
 b=obA0DuQseguPrQxUAKrjgDj2mJvhDveSjaLeZ+fEqo3XuYyA8In2m4ELzSg9yHHQhl
 Z9oe4DwbjUcZZY6eX3oFaBssbrZOfERIGkJX926VWyyRlz6NmzobEPlkVrL4Iv9tKHXV
 CJA2ChiD6irCRHjTGc2MKmKKOP/nxpudd8ffO5+Vy3sb28eLbIqIcLdVP7vlzPFdEcWz
 cEdISXBTXMteYLHN0oLMeY+M5PbSZUL3OypozGXhTxEsCmibPcF6PLWvGRjVjrBN8v9B
 CTm5RAXQbwsrmlI7Bsf9V7nxyEm7bja2ugUgVytsYWt35tRwAPEINKTx5pXKM4e+mISI
 Y1Dg==
X-Gm-Message-State: AOAM532dp7a0hCYzYroM3V20xspkWHkouvC6ImagJN7ENH5btHL1Z8E0
 3arSVT9BM9DW+awiecuF4Q==
X-Google-Smtp-Source: ABdhPJygck2OJtc3MJwpyyWyfI+a4szU9dS+/mNaclv4h+SPf0xt1F56WYCs0EhL/9m4+weGFiOAtw==
X-Received: by 2002:a05:620a:128e:: with SMTP id
 w14mr3255431qki.472.1640115682484; 
 Tue, 21 Dec 2021 11:41:22 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id e7sm18334608qtx.72.2021.12.21.11.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:41:21 -0800 (PST)
Received: (nullmailer pid 1625724 invoked by uid 1000);
 Tue, 21 Dec 2021 19:41:19 -0000
Date: Tue, 21 Dec 2021 15:41:19 -0400
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: lp855x: Convert to json-schema
Message-ID: <YcIt34BGh/F/Fown@robh.at.kernel.org>
References: <20211217170715.2893923-1-thierry.reding@gmail.com>
 <20211217170715.2893923-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217170715.2893923-2-thierry.reding@gmail.com>
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
Cc: Milo Kim <milo.kim@ti.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 06:07:15PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Texas Instruments LP855x backlight device tree bindings from
> the free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/leds/backlight/lp855x.txt        |  72 ---------
>  .../bindings/leds/backlight/ti,lp8550.yaml    | 151 ++++++++++++++++++
>  2 files changed, 151 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x.txt b/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
> deleted file mode 100644
> index 88f56641fc28..000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/lp855x.txt
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -lp855x bindings
> -
> -Required properties:
> -  - compatible: "ti,lp8550", "ti,lp8551", "ti,lp8552", "ti,lp8553",
> -                "ti,lp8555", "ti,lp8556", "ti,lp8557"
> -  - reg: I2C slave address (u8)
> -  - dev-ctrl: Value of DEVICE CONTROL register (u8). It depends on the device.
> -
> -Optional properties:
> -  - bl-name: Backlight device name (string)
> -  - init-brt: Initial value of backlight brightness (u8)
> -  - pwm-period: PWM period value. Set only PWM input mode used (u32)
> -  - rom-addr: Register address of ROM area to be updated (u8)
> -  - rom-val: Register value to be updated (u8)
> -  - power-supply: Regulator which controls the 3V rail
> -  - enable-supply: Regulator which controls the EN/VDDIO input
> -
> -Example:
> -
> -	/* LP8555 */
> -	backlight@2c {
> -		compatible = "ti,lp8555";
> -		reg = <0x2c>;
> -
> -		dev-ctrl = /bits/ 8 <0x00>;
> -		pwm-period = <10000>;
> -
> -		/* 4V OV, 4 output LED0 string enabled */
> -		rom_14h {
> -			rom-addr = /bits/ 8 <0x14>;
> -			rom-val = /bits/ 8 <0xcf>;
> -		};
> -
> -		/* Heavy smoothing, 24ms ramp time step */
> -		rom_15h {
> -			rom-addr = /bits/ 8 <0x15>;
> -			rom-val = /bits/ 8 <0xc7>;
> -		};
> -
> -		/* 4 output LED1 string enabled */
> -		rom_19h {
> -			rom-addr = /bits/ 8 <0x19>;
> -			rom-val = /bits/ 8 <0x0f>;
> -		};
> -	};
> -
> -	/* LP8556 */
> -	backlight@2c {
> -		compatible = "ti,lp8556";
> -		reg = <0x2c>;
> -
> -		bl-name = "lcd-bl";
> -		dev-ctrl = /bits/ 8 <0x85>;
> -		init-brt = /bits/ 8 <0x10>;
> -	};
> -
> -	/* LP8557 */
> -	backlight@2c {
> -		compatible = "ti,lp8557";
> -		reg = <0x2c>;
> -		enable-supply = <&backlight_vddio>;
> -		power-supply = <&backlight_vdd>;
> -
> -		dev-ctrl = /bits/ 8 <0x41>;
> -		init-brt = /bits/ 8 <0x0a>;
> -
> -		/* 4V OV, 4 output LED string enabled */
> -		rom_14h {
> -			rom-addr = /bits/ 8 <0x14>;
> -			rom-val = /bits/ 8 <0xcf>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
> new file mode 100644
> index 000000000000..412779a5462b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8550.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lp8550.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments LP855x family devicetree bindings
> +
> +maintainers:
> +  - Milo Kim <milo.kim@ti.com>
> +  - Rob Herring <robh+dt@kernel.org>

I don't know anything about this h/w.

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
> +    description: Value of DEVICE CONTROL register. It depends on the device.
> +
> +  bl-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Backlight device name
> +
> +  init-brt:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Initial value of backlight brightness
> +
> +  pwm-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: PWM period value. Set only PWM input mode used
> +
> +  pwm-names:
> +    maxItems: 1
> +
> +  pwms:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the 3V rail
> +
> +  enable-supply:
> +    description: Regulator which controls the EN/VDDIO input
> +
> +patternProperties:
> +  '^rom_[0-9a-f]{2}h$':
> +    type: object
> +    properties:
> +      rom-addr:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Register address of ROM area to be updated
> +
> +      rom-val:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        description: Register value to be updated
> +
> +    additionalProperties: false
> +
> +    required:
> +      - rom-addr
> +      - rom-val
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - dev-ctrl
> +
> +examples:
> +  # LP8555
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      backlight@2c {
> +        compatible = "ti,lp8555";
> +        reg = <0x2c>;
> +
> +        dev-ctrl = /bits/ 8 <0x00>;
> +        pwm-period = <10000>;
> +
> +        /* 4V OV, 4 output LED0 string enabled */
> +        rom_14h {
> +          rom-addr = /bits/ 8 <0x14>;
> +          rom-val = /bits/ 8 <0xcf>;
> +        };
> +
> +        /* Heavy smoothing, 24ms ramp time step */
> +        rom_15h {
> +          rom-addr = /bits/ 8 <0x15>;
> +          rom-val = /bits/ 8 <0xc7>;
> +        };
> +
> +        /* 4 output LED1 string enabled */
> +        rom_19h {
> +          rom-addr = /bits/ 8 <0x19>;
> +          rom-val = /bits/ 8 <0x0f>;
> +        };
> +      };
> +    };
> +
> +  # LP8556
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      backlight@2c {
> +        compatible = "ti,lp8556";
> +        reg = <0x2c>;
> +
> +        bl-name = "lcd-bl";
> +        dev-ctrl = /bits/ 8 <0x85>;
> +        init-brt = /bits/ 8 <0x10>;
> +      };
> +    };
> +
> +  # LP8557
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      backlight@2c {
> +        compatible = "ti,lp8557";
> +        reg = <0x2c>;
> +        enable-supply = <&backlight_vddio>;
> +        power-supply = <&backlight_vdd>;
> +
> +        dev-ctrl = /bits/ 8 <0x41>;
> +        init-brt = /bits/ 8 <0x0a>;
> +
> +        /* 4V OV, 4 output LED string enabled */
> +        rom_14h {
> +          rom-addr = /bits/ 8 <0x14>;
> +          rom-val = /bits/ 8 <0xcf>;
> +        };
> +      };
> +    };
> -- 
> 2.34.1
> 
> 
