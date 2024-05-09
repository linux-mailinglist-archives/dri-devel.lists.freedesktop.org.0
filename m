Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AA18C0CB8
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 10:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752710E364;
	Thu,  9 May 2024 08:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FmnTUG66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BFF10E364
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 08:40:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so1127192a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715244037; x=1715848837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zqLAjg1hRCipJw/nc3mM4kgs0PTcSNAKwMinAhtsjdE=;
 b=FmnTUG66j4g2p8HBFuHqd8QShmsOeXC141id/4qvg1BCO75uIGfqIhrLsP0sXe6PlN
 FDMqIMrHgCZZAlp0rXfB+MzH+MqvrwL/9kXxhxbxGVchyQjHrto9tFM1MHp2GB0V3JEo
 Hdclrw9KGH6rLIAGhX82UhbxALVzdWaonQzaUHi6XVRnnc2BTCNlHsjPBlSYMGBU3ldK
 mHzb0yU1ApDHwoOdAhfW/agpgUyl7JtGgqqmy+sr1UGhB4HcMrBLHrEi5o3O/FX9RDF4
 ZVBVaoGKeG6dSno8nYLiGQZLA4C1GQ/2Z5xKIwgsyYxjnWzW+ClWBeuTuQTc9V+RgKSX
 invA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715244037; x=1715848837;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zqLAjg1hRCipJw/nc3mM4kgs0PTcSNAKwMinAhtsjdE=;
 b=Ydsyb9wkSBIuNUoE36ozdjJMX/RJHrmShA31IYgSeUbwUGlwSXOZe8SO5ZzHpmt9HB
 KFpOgLOuP/XmkmTcgr/3doN3VFBbqfkz8/SaiFLMlLlN3oP8DirjJ00sjBjApBFUHk8V
 jy3zznvhW0NK1AjtWEZZRDI9tFby4pwECCu9zsXOfNU9INyNrFlv951M9QGNJYM849l8
 7Y23bB0/66UzR1VmwGh4ksB9S1Hi2Fb89UevLSh58M+2sdJIgibf/Jk5l8heFR1Xjlwa
 bYt8DPbwzPUGPWu1AOhk3QEK7SR3pwj+dQWMuEQbw4wwNkIrqCnqoMGnYvTBhhI8700O
 bD+g==
X-Gm-Message-State: AOJu0Yx6XsflTsK/WJpvPG/1oQGX2i40x0xTPElIZAsGBm+0TNKjtTUU
 6QiRwUlKuhKtSrTWUhGG4xxzNQpGkylVz6MG9Z2caHiwBEtDEChK7JXYo0fhdv0=
X-Google-Smtp-Source: AGHT+IHVIOp2U+LWWVlaJwVL6i6ttY+ZB6g5+IEEKA1wti9cs3yhwDIeod8voxY4eG7/M8gODG53VA==
X-Received: by 2002:a05:6402:5247:b0:56e:7281:55eb with SMTP id
 4fb4d7f45d1cf-57332786715mr1989034a12.9.1715244037049; 
 Thu, 09 May 2024 01:40:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea65e2sm464889a12.19.2024.05.09.01.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 01:40:36 -0700 (PDT)
Message-ID: <82685064-5163-4f83-88c8-b29fcb63ef08@linaro.org>
Date: Thu, 9 May 2024 10:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add Starry-er88577
 support
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240509064959.23550-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240509064959.23550-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240509064959.23550-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On 09/05/2024 08:49, Zhaoxiong Lv wrote:
> Create a new dt-scheam for the Starry-er88577.

typo, but anyway, this is not a "dt-schema".

Describe hardware instead in one sentence.

> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/starry,er88577.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml b/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
> new file mode 100644
> index 000000000000..6686beaf0f16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/starry,er88577.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/starry,er88577.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starry Display ER88577 based MIPI-DSI panels
> +
> +description: |

Do not need '|' unless you need to preserve formatting.


> +  -This binding is for display panels using an ER88577 controller

No need to say binding is a binding. Describe hardware instead.

> +
> +maintainers:
> +  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: starry,er88577
> +
> +  pp3300-supply: true
> +  reg: true

Hm, I wonder why we do not have constraints here in most of the bindings...

Anyway, keep the same order as in required:

> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - pp3300-supply
> +  - backlight
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>

You include this header for?

> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel: panel@0 {
> +            compatible = "starry,er88577";
> +            reg = <0>;
> +            enable-gpios = <&pio 98 0>;

And here do not use it? Use the define.


Best regards,
Krzysztof

