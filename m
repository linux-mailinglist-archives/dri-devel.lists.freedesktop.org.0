Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F268770C7
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 12:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA05810FF5E;
	Sat,  9 Mar 2024 11:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="joKOexLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE44410FF5E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 11:53:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33e7946bddfso920534f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 03:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709985184; x=1710589984; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/g0ylk5OXw5DuRDSC0jhgh8ENyy6UvA2w58cji7f7k=;
 b=joKOexLVQQ3j6B6/9B0FZZW5PGjgUi6UHWdmg5D7vgFDFdLFeO9Al0AB+dPFCPc2+5
 eMrXxZp6GTcFIsFOPv15toU8IV0FZAdc68IEK/rac3dw9AHLcdth8TIzGS+5R3Ts8Hpp
 EfC8IT43saK9/8Sz3Vq5aS2zMHJs/f+dPB2VNHePsV4SIU8fgP4rzkOobbzZFoGBAn9u
 k0l0agOhyadMamJIGxbKHuEINkVaN06oy9+45D+dchnPcdSS3lJjdaOzGRW0bMimmicr
 0drUKuloNIvn8ULrssEU7RI+gysHq4baVsNpJVZ5ST0xCfewd32dul5PaDotw76DHEEt
 JGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709985184; x=1710589984;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/g0ylk5OXw5DuRDSC0jhgh8ENyy6UvA2w58cji7f7k=;
 b=YcTCdp129TZh+rgFB+Y7dxlqUkRYhLgLmDJSbe+R/dyY903REt+n2w7beagWaPryp3
 O0rEB08d8DJqUXUXsi7CMtHxXbVNTz0KE3ZVrRzPrd/9fS+2gnqzN5uEKhywImSPGmzs
 tdeaeJwgBZFDWKuVBkbfNxLujHBctwKvZ1zmOkYxgJFLsJN9lXZ3vHtp8B71a9WLRjdp
 bsv+DEM8IslOKlQpW1vsjU/igUkGtCyKJ+jXF48xU1CcSeS6Lp3TThRSwObEtbJY9iZb
 FNxwOvksKn/Oz5wDrH2chAX7CMWbYPWL5WHKFn/pinDsUopSsTnW+jOTl0MvGa4ZoCBY
 SrEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFfgRxiNWkJUJIEGKkkQ3Piv1ZnVWXf1uMS4Bl9B4E9PaCTTmQc9l1gHw5lF2lZ6eGDdPFBSs5Gnc3pX+s7fCAP6PGag+DlEJb9RjSo6e4
X-Gm-Message-State: AOJu0YzgFI4DGoMwSlbe5Opp5mhT6pXoHxFWjoJcbtLIkSXg0wToYJCX
 lKZAOdnbreyZ6nyRqy+JvPlyFq78Ih51Dsyq+WnCgx0tnByBQMyIq5ACtXfW8To=
X-Google-Smtp-Source: AGHT+IEkrG+sQciYU+nX3qFZsHXjs9Iwb9k+xeRcbKkrN9JkycTcr5mtjiUouh+/DjcEorUTmh6AvQ==
X-Received: by 2002:adf:e6cf:0:b0:33d:29c1:c28c with SMTP id
 y15-20020adfe6cf000000b0033d29c1c28cmr1234225wrm.66.1709985183886; 
 Sat, 09 Mar 2024 03:53:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b0033e5c54d0d9sm1692690wrq.38.2024.03.09.03.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 03:53:03 -0800 (PST)
Message-ID: <cb220c6f-086c-4995-b2e2-bce78b9a4b04@linaro.org>
Date: Sat, 9 Mar 2024 12:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Content-Language: en-US
To: Patrick Gansterer <paroga@paroga.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240308215617.1729664-1-paroga@paroga.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240308215617.1729664-1-paroga@paroga.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2024 22:50, Patrick Gansterer wrote:
> Add Device Tree bindings for Texas Instruments LM3509 - a
> High Efficiency Boost for White LED's and/or OLED Displays
> 
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>

Thank you for your patch. There is something to discuss/improve.


> +  compatible:
> +    const: ti,lm3509
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  ti,brightness-rate-of-change-us:
> +    description: Brightness Rate of Change in microseconds.
> +    enum: [51, 13000, 26000, 52000]
> +
> +  ti,oled-mode:
> +    description: Enable OLED mode.
> +    type: boolean
> +
> +required:

required: goes after all properties.

> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^led@[01]$":
> +    type: object
> +    description: Properties for a string of connected LEDs.

Are you sure this is a string of LEDs? How does a string/tape work with
a backlight, I mean physically? How could it look like?

> +
> +    allOf:
> +      - $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        description:
> +          The control register that is used to program the two current sinks.
> +          The LM3509 has two registers (BMAIN and BSUB) and are represented
> +          as 0 or 1 in this property. The two current sinks can be controlled
> +          independently with both registers, or register BMAIN can be
> +          configured to control both sinks with the led-sources property.
> +        minimum: 0
> +        maximum: 1
> +
> +      label:
> +        maxItems: 1

It's a string, not string-array, so maxItems are not needed, just ":true".


> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 2
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 31

Not a required property? Then "default:".
> +
> +      max-brightness:
> +        minimum: 0
> +        maximum: 31

Some of your examples miss it, so there is some kind of default. Add it.
> +
> +    required:
> +      - reg
> +
> +    unevaluatedProperties: false
> +
> +unevaluatedProperties: false

You rewrote everything, so my previous comment obviously does not make
sense in such case. This must be additionalProperties: false. Look at
other bindings or example-schema how it is done (to repeat myself).

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@36 {
> +            compatible = "ti,lm3509";
> +            reg = <0x36>;
> +            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> +
> +            ti,oled-mode;
> +            ti,brightness-rate-of-change-us = <52000>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            led@0 {


Best regards,
Krzysztof

