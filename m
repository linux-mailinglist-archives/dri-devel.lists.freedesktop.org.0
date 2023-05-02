Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC596F3E4B
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DFE10E48D;
	Tue,  2 May 2023 07:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154310E48D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 07:15:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso674932766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683011728; x=1685603728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dtp1yaPEC+fRXRQf1GiiaizhZwEuiFdW7LGcT1sySog=;
 b=RdNB5sItGdZjMb3ymixPktS4fHSCxz1uwhzsP+8XITmMM1SrTlSipHywAIdBzh3EOA
 MiffZH4l7NU9LOoucBcOSTDiF1hWJOzh+oBCkdqER4v9Y2NeIRRpPvnl86FAs9XYwO6b
 dCv3iL+f/wY4Vu+HYt3u9YISRfHOJOTQQPz5H/W/+VQ9gjT+N8X4QIY8GcKfeCaUMZSG
 /uIQo0HZ0rK6SIPUahUDfKxmGCVTcPORmhmLo6xHdr2rvMQEFZKPKJqVT3Wpks9DTN4g
 Ksx10GyzlL7WCFvw70iCtPQfKKgfXYPudWbyRLYUYIGSue7Z2EVjIvtsvqVhWBOHPn3P
 DSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683011728; x=1685603728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dtp1yaPEC+fRXRQf1GiiaizhZwEuiFdW7LGcT1sySog=;
 b=ha5UMrfNTIVPxc767jLyV8vhQncOipHlE5Fui3+K5/sNZoyArTvnHmNUZmOmvG+F/C
 ev7rL7N/4l3qofy/N6xaP4XxXB5nDum/Ws0H9epGIhIVXdppffBhQrHYZxUib05q9ek+
 h8ZQmWaK7n0o0QE6/IU7QHTBfoFggMHOhyqsUTioCvKtggrSZDZ30OqnOObPijsp1PsM
 YbqGcQq1CS7LqB2D2SCFvf8uu1NZfebGZuYvhSHcQmGbKnL6d4bbQ+OKX/CpuvPlqmX1
 IO3aB7KHQ21foVGjVGD3lZgt6/Lp/qh/44NPtfhpPsRjEgKO1p8D/7fnrjV6C3+e4CPh
 zmiQ==
X-Gm-Message-State: AC+VfDyqAfckwjVuxYv2VajSNHmA8Ot1v8H26QnF5eHrzNJ+Ro5SbmfX
 VuL9j8QMcFSvPpQBJKx6cELWTfyNESrkMdYSxXI=
X-Google-Smtp-Source: ACHHUZ4f4BV375Lqs3dUy6tpZtsKlhKa36DK6PF4+nx/fJp1fDYdxz99rUNDj1w6kFQkzu8qb667Lw==
X-Received: by 2002:a17:907:9806:b0:958:4387:5772 with SMTP id
 ji6-20020a170907980600b0095843875772mr14229767ejc.41.1683011727850; 
 Tue, 02 May 2023 00:15:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a?
 ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
 by smtp.gmail.com with ESMTPSA id
 fp31-20020a1709069e1f00b0095251a3d66fsm15595581ejc.119.2023.05.02.00.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 00:15:27 -0700 (PDT)
Message-ID: <a7d07acf-d79e-3f67-dd48-2a5c3e840d7c@linaro.org>
Date: Tue, 2 May 2023 09:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0
 LCD panel controller
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20230501185103.25939-1-aweber.kernel@gmail.com>
 <20230501185103.25939-2-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501185103.25939-2-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05/2023 20:51, Artur Weber wrote:
> Add bindings for the S6D7AA0 LCD panel controller, including the
> S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
> of tablets, and the S6D7AA0-LSL080AL03 and S6D7AA0-LTL101AT01 panels
> used in the Samsung Galaxy Tab A 8.0 and 9.7 2015.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changed in v2:
>  - Updated commit message
>  - Applied suggestions from Krzysztof Kozlowski

What have changed?

> Changed in v3:
>  - Correctly applied suggestions

What have changed?

> Changed in v4:
>  - Added LSL080AL03, LTL101AT01 compatibles
>  - Added description to reset-gpios
>  - Added vmipi-supply, renamed enable-supply to power-supply
> ---
>  .../display/panel/samsung,s6d7aa0.yaml        | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> new file mode 100644
> index 000000000000..918f62a78ecd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6D7AA0 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      # 1280x800 LSL080AL02 panel
> +      - samsung,s6d7aa0-lsl080al02

lsl080al02 is model number also coming from Samsung? I am afraid this
concatenated two compatibles into one...

> +      # 1024x768 LSL080AL03 panel
> +      - samsung,s6d7aa0-lsl080al03
> +      # 1024x768 LTL101AT01 panel
> +      - samsung,s6d7aa0-ltl101at01
> +
> +  reg: true
> +
> +  backlight:> +    description: |

If there is going to be new version:
Do not need '|' unless you need to preserve formatting.

> +      Backlight to use for the panel. If this property is set on panels
> +      that have DSI-based backlight control (LSL080AL03 and LTL101AT01),
> +      it overrides the DSI-based backlight.
> +
> +  reset-gpios:
> +    description: Reset GPIO pin, usually GPIO_ACTIVE_LOW.
> +
> +  power-supply:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Main power supply for the panel; the exact voltage differs between
> +      panels, a


Best regards,
Krzysztof

