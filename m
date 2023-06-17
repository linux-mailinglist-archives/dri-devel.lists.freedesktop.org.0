Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BD4733FC3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 10:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A4810E14F;
	Sat, 17 Jun 2023 08:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511C010E14F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 08:53:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9829a5ae978so237856166b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686991990; x=1689583990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7v/MuJCI1UFCTEb0ULR4YPwehjpcbKBRUmu39o5MfA=;
 b=VtVrmiLDbD4WsRd7BNVvyMnAtiuxcS9O6ZzkUiy06oD/hw11A6e0xcoBPDLyH8tKbx
 edoByt1J5hbbc4YEa4QryL52GdE1358bbo18frPRqUeF0eAo1aS/u/JPG0cc1jiWbKJ8
 TiTQWAbPfjdebrKN1aFx3AMx0OcKyx9GJ26aV391kGCvXEee+i2pFHFVMYVsqnOBQLoV
 LbfAlNW0XAZpPxRkz245caoXQ1mp6S9C613EkKYnHTT+uI1l1Brt2Ai/EKj6wprGk42j
 GGDj1JgOZ8SZ7720VvNG3eETF4Y3X7WjqRcNriJcb7AiVILQ0MsZwsVWLx+L/jjQm6Zo
 1vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686991990; x=1689583990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7v/MuJCI1UFCTEb0ULR4YPwehjpcbKBRUmu39o5MfA=;
 b=SJARZF1mJow+pHjyTh1qNZ2ZhCKzrlsdytd1qilHggzFfiK2thVzzQ2JQRE2+lhtb1
 8w2cMa8KpmzqXzyj9vn8EE1/2CQ7zCyZu4p8Y9Tc7rFf6tK8o2wiHEnOOJTUZKkt4/r2
 0lL0Xvy19SkYgrVCzzzI+qbbLaBmUGLAB4LGu/a0dk9e3E80cXg0bVqakpzMJ1My2vpY
 a4TbEj1IQJnyB6+fAov+aBWBn9UIzxsQb3/HiAtgTUZWNEj6j/RKEcfV7NFKVliSu5tD
 66WJmtJoX/BuVRmOUYIuUD9x0SiPcguTah3m9pHkkiAuXBXQk+0kPwj+EP8ttWyNPj62
 MWDQ==
X-Gm-Message-State: AC+VfDxeQOS7dWMba/s7/p7Qvp2tmSmg+pNc9lB1YBkbk8GeqCccAwgw
 oj2rM2c/IgJsHkYZbEgOFoNROIksXTb0Uzx+f3I=
X-Google-Smtp-Source: ACHHUZ7AMfzuX8rRWUTw0RM7dJ0hcar2M9pAMiePR3WSb1BtFbqqF9p5lR1YlJ+Jt/alv09LczOsxA==
X-Received: by 2002:a17:907:a41e:b0:978:8ecd:fa75 with SMTP id
 sg30-20020a170907a41e00b009788ecdfa75mr4340090ejc.9.1686991990401; 
 Sat, 17 Jun 2023 01:53:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170906714500b00985767bb5f9sm1997506ejj.70.2023.06.17.01.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 01:53:09 -0700 (PDT)
Message-ID: <73f246a7-7b3f-58a6-2679-fd983eaad9d0@linaro.org>
Date: Sat, 17 Jun 2023 10:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/6] dt-bindings: display: st7789v: bound the number of
 Rx data lines
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
 <20230616163255.2804163-3-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616163255.2804163-3-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 18:32, Miquel Raynal wrote:
> The ST7789V LCD controller supports regular SPI wiring, as well as no Rx
> data line at all. The operating system needs to know whether it can read
> registers from the device or not. Let's detail this specific design
> possibility by bounding the spi-rx-bus-width property.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> index 0ccf0487fd8e..a25df7e1df88 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> @@ -29,6 +29,10 @@ properties:
>    spi-cpha: true
>    spi-cpol: true
>  
> +  spi-rx-bus-width:
> +    minimum: 0
> +    maximum: 1

0 is already minimum, but I understand you want to emphasize lack of RX.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

