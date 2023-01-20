Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98258675234
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 11:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7402510E0DF;
	Fri, 20 Jan 2023 10:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D56510E0DF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 10:19:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q10so4420387wrs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 02:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8BcJzXSs607af8t7kqUBgjRke129BH5lCDD+YUTH7w=;
 b=LpfSiNltaoV7bWfi3yQR6wIwTKqlLH7Cjtwa/XneNU61Ua5EWCgWLAmqQW4ko0k8hT
 7nuNnorRsj8t9/48i19w6P2TUdPkm4CyGE2Yz2+MfpMRt0T7BdOQ55DOkkwsEVlOCXzE
 hS5JDPHJU3BA2gZU16GZAw37kzK3q/u9bQQ0UtRPyu/TLBIhpD6usPD828f08UdUSxXS
 YySKUR3JB5bmEdzRIKnZps+lJwVscq4/xFDjvBmGNpVL0ybJO9d2/TfrNZYppcH6tnfS
 GxiR3AYWsyaulrms7NLKr3R/Ms8Bs/W4errDUbskI+8/qTbdpiSCp4oZIPL+CCIB5nEp
 T9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d8BcJzXSs607af8t7kqUBgjRke129BH5lCDD+YUTH7w=;
 b=C16C/xALAtK9qRkrUoDnAyAqV3E/q5c8+3OE+N/XDWMZ4RJu3WfHEv1WeJ1/5V2xc9
 o2bNkVeRImGVtOlQXlE3Jb1n9I/8r81CyaXEwBVbOYGSC7hJtA37DFU3Ltc80mn9wu8T
 uuZ4EAm7gFQAk8tUu1UIwZmAmi5Y8YKEdxhG3Ph+fFw9OeBCaJt4a19vc2v6yHWvxn3/
 jf3fQ7vbVu75JdghqaKOsV+DddTVpRD3Q8WNdtP3URikfDG4Sh7GNVK8g8/K85rz7pFz
 jb7j0AQVUOZPxNoP3Fi73DQEcKy5HdMpT4KVr1omSQe6KHGTaT88UHRgGwQ9Xp5Mwv8P
 +dMA==
X-Gm-Message-State: AFqh2kpY2UtpndzZvtXy78yAkJfZEMA0tyWk4HUDM5lGKqujj+JCd3fP
 5mFB1uAb22eFNGGKMWefadG8ww==
X-Google-Smtp-Source: AMrXdXuKdhKIqJEou6IJmM5yvUMjMnUD67NRnsbGkBHfaQP6Ex2vg3VDK1+5I1ULAcU+W6HSfx0aeA==
X-Received: by 2002:adf:f0cd:0:b0:2bd:d783:377 with SMTP id
 x13-20020adff0cd000000b002bdd7830377mr12934188wro.22.1674209939686; 
 Fri, 20 Jan 2023 02:18:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b00291f1a5ced6sm14862170wrp.53.2023.01.20.02.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:18:59 -0800 (PST)
Message-ID: <a9c47e2f-aacb-4c8f-3a0b-67274ef15376@linaro.org>
Date: Fri, 20 Jan 2023 11:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
References: <20230120094728.19967-1-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120094728.19967-1-lujianhua000@gmail.com>
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
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 10:47, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Remove "items" between "compatible" and "const: kinetic,ktz8866".
>   - Change "additionalProperties" to "unevaluatedProperties".
> 
> Changes in v3:
>   - Add Krzysztof's R-b.
> 
> Changes in v4:
>   - Drop Krzysztof's R-b.
>   - Add some new properties.
> 
> Changes in v5:
>   - Add missing enum under property description.
>   - Rename uncorrect properties.
> 
> Changes in v6:
>   - Correct wrong property suffix and description.
> 
> Changes in v7:
>   - Add vddpos and vddeg supply.
>   - Use enable-gpios instead of defining enable pin.
> 
>  .../leds/backlight/kinetic,ktz8866.yaml       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> new file mode 100644
> index 000000000000..b1d0ade0dfb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kinetic Technologies KTZ8866 backlight
> +
> +maintainers:
> +  - Jianhua Lu <lujianhua000@gmail.com>
> +
> +description: |
> +  The Kinetic Technologies KTZ8866 is a high efficiency 6-channels-current-sinks
> +  led backlight with dual lcd bias power.
> +  https://www.kinet-ic.com/ktz8866/
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktz8866
> +
> +  vddpos-supply:
> +    description: positive boost supply regulator.
> +
> +  vddneg-supply:
> +    description: negative boost supply regulator.
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
> +  current-num-sinks:
> +    description: number of the LED current sinks' channels.
> +    enum: [1, 2, 3, 4, 5, 6]
> +
> +  current-ramping-time-ms:
> +    description: LED current ramping time in milliseconds.
> +    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]

kinetic,current-ramp-delay-ms

> +
> +  led-ramping-time-ms:

kinetic,led-enable-ramp-delay-ms

So both are similar to existing regulator properties.

Best regards,
Krzysztof

