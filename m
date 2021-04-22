Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76735367CA7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B946E199;
	Thu, 22 Apr 2021 08:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FCF6E199
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:38:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so2746079wmd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e/+oo5NyWhxN8td4aAh9SsnnFirRgQL1gPvUfVwD200=;
 b=pkB2qIX1usxFoCNOI2x3+oaGnCZE8vB+31MwBTWvuKgbLe/MnyjERza/5A2qeA1Uq0
 V3N2zi/t/QQI/pG2oTryHaWiivXLOBHUvlnNnSDw6YJftjxQ12Gjt3tZ5PZlSzUvAJa5
 VIYnP6R/et6DPyl0/5P0H2Yr0KGxruw3lA9ZamlTXYDTwQDOv6gvbJKT3ODOmLHNzMhi
 QfqC+Z9Qf62l6bwNhxnJxF7/hKpzf3Q4YJRmXbbDvXeshx9tocSleoKc8FMmMy1hHD9t
 ntlk4YRTzR0saqmXJBuQTJm0lOqQYckvCcwGT7D3XF+Qykwjpks92kH7sln+gv2FWiiE
 zvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e/+oo5NyWhxN8td4aAh9SsnnFirRgQL1gPvUfVwD200=;
 b=Ze+hW3R9XU5Q6yrArWEEkPtoc2RMYD7dUW2CFsWxA+z1czjt38gWS/mHl5FgfEHAWS
 EbopOeFwX/UYTfU6fkJJQQbHqW72neVAUUpv8svZjNHEvU8bkn7sEE20+6bkTG+Qx0Ze
 fzLMQJK1CSr/Hgf5c0ZJS7GJ5nLM/G4sih6ZgOXVnvWhihc0ee5hfVxwk3xDXqYR7YMc
 5ZJZvpkKD2Ur9nCKGCB4TjIjoK1cWEONbRmgwiB8EOiuCRMqtqiO53q5737NUpEGrSgS
 12hvbu6mbCCFOC7vLLqXs9HfgLPiOeOKsfoPzgDJFt/YGaFwaZuj0u2bsNKWw8Rl+alx
 0DVA==
X-Gm-Message-State: AOAM533kK/wPorUOvPIwtwD2l48ckAsqDFV6ULdRwwtXPW7UcERuSa/p
 vAP+XssN0mElN0Woykmj/MWIHA==
X-Google-Smtp-Source: ABdhPJw0qRItyXI0pzjkKJwKn1n4YLbsxzSoq8E70voh0hqRrA92cKUJw89gaQ6iXB6LnwWEdz8dLQ==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr2507234wmb.129.1619080722686; 
 Thu, 22 Apr 2021 01:38:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:916d:6f7:3c58:6b43?
 ([2a01:e0a:90c:e290:916d:6f7:3c58:6b43])
 by smtp.gmail.com with ESMTPSA id u9sm2245828wmc.38.2021.04.22.01.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:38:42 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210421223122.112736-1-marex@denx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9ffbea6e-c341-4a43-3c9e-0b177cfe98d5@baylibre.com>
Date: Thu, 22 Apr 2021 10:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421223122.112736-1-marex@denx.de>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2021 00:31, Marek Vasut wrote:
> Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Add compatible string for SN65DSI84, since this is now tested on it
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> new file mode 100644
> index 000000000000..42d11b46a1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI83 and SN65DSI84 DSI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  Texas Instruments SN65DSI83 1x Single-link MIPI DSI
> +  to 1x Single-link LVDS
> +  https://www.ti.com/lit/gpn/sn65dsi83
> +  Texas Instruments SN65DSI84 1x Single-link MIPI DSI
> +  to 1x Dual-link or 2x Single-link LVDS
> +  https://www.ti.com/lit/gpn/sn65dsi84
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,sn65dsi83
> +      - const: ti,sn65dsi84
> +
> +  reg:
> +    const: 0x2d
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge_en pin (active high).
> +
> +  ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for LVDS output (panel or bridge).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              remote-endpoint: true

Similar to Jagan's serie, would be great to add bindings for the dual-link LVDS even if not supported
by the driver (the driver can fails with a verbose error).

Neil

> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@2d {
> +        compatible = "ti,sn65dsi83";
> +        reg = <0x2d>;
> +
> +        enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +              data-lanes = <1 2 3 4>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            endpoint {
> +              remote-endpoint = <&panel_in_lvds>;
> +            };
> +          };
> +        };
> +      };
> +    };
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
