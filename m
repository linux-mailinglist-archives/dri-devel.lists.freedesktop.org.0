Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAED74FEB8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 07:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621710E48D;
	Wed, 12 Jul 2023 05:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2550210E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:32:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9922d6f003cso838255066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689139947; x=1691731947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cm9lqU5pPuyE1DC++4NWH2zRUzX6wSqTAdFnrSF5Rww=;
 b=VNigY0kXhCTUccMmpH3lWTI7nxi83g7n5A1t1tz1XYVlSBCWD9Kg6QLd7Ops/wOXIW
 JgrqUmfdDm7UX7cnWLkVBMz95ScQmC5AjulXn8LK3+WDjp1VALtpm2QZaqJhnA0NcZQn
 74vY8XFWcy9hvefzgIeiXi9CVfmzZhB2dDky+W8StXKW5ohrK75wLI7kmcv4t0q4chrj
 G15AqQCc3VxVHvxHXXFbpi3bbtG1xGhSpn8HQ1X0Dv9tcPXm50LjdF8YHfucYTp52V5Q
 UkXEV8WZD76Tsp55o0hKxcAGY9S3gKTMPf53nhiPGnKPdRbRepfjLIHJYHqzEESRp/fk
 5cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689139947; x=1691731947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cm9lqU5pPuyE1DC++4NWH2zRUzX6wSqTAdFnrSF5Rww=;
 b=iqq9YoI6XD83JP6PNJuCSyGaGiNCQIf9HrybGGU19qxGxQi9tt+x7SlBWAMUJqV6a8
 nL21GWBBcOzzxaMcQ0EUCtVo/JN0Ur7POyu1nbQiRKnl6203lxG234xejZuIuGQARoNk
 ykTQdJWXtDcVBV1RBiVs0xX/BE6b7DV/PDwerOxog2ebR17QrM0PKV1iB8/w4b5h9SsO
 SmrvF9gq2s88VLRbIpIUH7x6Xl/d33rlQ4zqramCTgH4ZfXKWspESxMe/eEdIjKsKErM
 j74XRl665HI/US2UZt+7InrLhVkrlfsG9bE2Z9rzHVERq4R1OVCFB8FKz3D5ya6R8jBL
 UjiA==
X-Gm-Message-State: ABy/qLbJuFTJXYy73AzxVVF1gHXCxvlNoz8JqDY7bFzXT4USXiJc8buJ
 kpmFEZs2AHGQ3khodTG2y8U1Fw==
X-Google-Smtp-Source: APBJJlG4YRdWN+SCSbzyfd58UWeDDH8s4zkWWVj4TV7KjDSCdVdE1A1W2FG3adOSrHXkUmi0u3mGVA==
X-Received: by 2002:a17:906:33d0:b0:992:b3a3:81f9 with SMTP id
 w16-20020a17090633d000b00992b3a381f9mr15779053eja.71.1689139946740; 
 Tue, 11 Jul 2023 22:32:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170906394b00b00982b204678fsm1976336eje.207.2023.07.11.22.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 22:32:26 -0700 (PDT)
Message-ID: <14bed951-22ae-4aa8-5fcb-b2cd92ebdbef@linaro.org>
Date: Wed, 12 Jul 2023 07:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: add startek
 kd070fhfid015 support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
 <20230711-startek_display-v1-1-163917bed385@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711-startek_display-v1-1-163917bed385@baylibre.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2023 17:36, Alexandre Mergnat wrote:
> The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
> of 1024 x 600 pixels.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../display/panel/startek,kd070fhfid015.yaml       | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> new file mode 100644
> index 000000000000..857658e002fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/startek,kd070fhfid015.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Startek Electronic Technology Co. kd070fhfid015 7 inch TFT LCD panel
> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: startek,kd070fhfid015
> +
> +  dcdc-gpios: true

From where does this come? Which schema defines it?

> +
> +  height-mm:
> +    const: 151
> +
> +  iovcc-supply:
> +    description: Reference to the regulator powering the panel IO pins.
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  port: true
> +
> +  power-supply: true
> +
> +  width-mm:
> +    const: 95
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - dcdc-gpios
> +  - iovcc-supply
> +  - reg
> +  - reset-gpios
> +  - port
> +  - power-supply

Missing example.

Best regards,
Krzysztof

