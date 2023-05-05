Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F26F8AAE
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E7710E0A6;
	Fri,  5 May 2023 21:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD810E0A6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:23:43 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-54c96cef24aso1156355eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321822; x=1685913822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwdhZdKqyhuaiAmSNIpDtAl7IfbJSYB+daUBPaVksik=;
 b=fazoiReZYU9CTGLcO2dxFc+GEQIZTCn9wuFU11hz2y0quAtimTFICfA1aFUgOCIMzb
 QekJNGzYVekBZhFRJp+7fZrLnde43Vl9jFXFUXRDOPTNh2/TmxOCCseFQ0woqOjMuVpd
 TwFJ40yZuDajPL0bMkG/uon8rdsUYtzH0MPMCplTSI+FsOpKZP5bhN3qpTX+yEK2yceo
 BjqEgH7S/2u8lfY2H0i+PX4OfH2GkNWNC+Q7dhFnvrRgsAUE/oaC+Y23HU0b9zvTQigT
 I/neM8jB6gpMRfe/rlxEukTTxVt0VqaMOwVREO0RPN1unqgt8AIZK/rKLOH2Goh4FqcF
 d1eQ==
X-Gm-Message-State: AC+VfDyF6x9FqvkK8L9mzWnIQsbSqk4EHUaRanKN41Y1/Vnn4mlJ0CCN
 1tb9+HqpuGjqbK8vaYLfkA==
X-Google-Smtp-Source: ACHHUZ5aScoYRGug8/b0YvTj0vwFXK6C0WhOO7mcg4F0Md4vayUd4T69DoSmGy8fggvRw39K2vP6pg==
X-Received: by 2002:a05:6808:46:b0:38d:f03f:935b with SMTP id
 v6-20020a056808004600b0038df03f935bmr1325252oic.24.1683321822415; 
 Fri, 05 May 2023 14:23:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 es10-20020a056808278a00b0038edc69490bsm3185925oib.10.2023.05.05.14.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:23:41 -0700 (PDT)
Received: (nullmailer pid 3587437 invoked by uid 1000);
 Fri, 05 May 2023 21:23:40 -0000
Date: Fri, 5 May 2023 16:23:40 -0500
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0
 LCD panel controller
Message-ID: <20230505212340.GA3585766-robh@kernel.org>
References: <20230501185103.25939-1-aweber.kernel@gmail.com>
 <20230501185103.25939-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501185103.25939-2-aweber.kernel@gmail.com>
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
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 08:51:01PM +0200, Artur Weber wrote:
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
> Changed in v3:
>  - Correctly applied suggestions
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

Dual license please.

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
> +      # 1024x768 LSL080AL03 panel
> +      - samsung,s6d7aa0-lsl080al03
> +      # 1024x768 LTL101AT01 panel
> +      - samsung,s6d7aa0-ltl101at01
> +
> +  reg: true
> +
> +  backlight:
> +    description: |
> +      Backlight to use for the panel. If this property is set on panels
> +      that have DSI-based backlight control (LSL080AL03 and LTL101AT01),
> +      it overrides the DSI-based backlight.
> +
> +  reset-gpios:
> +    description: Reset GPIO pin, usually GPIO_ACTIVE_LOW.
> +
> +  power-supply:
> +    description: |
> +      Main power supply for the panel; the exact voltage differs between
> +      panels, and is usually somewhere around 3.3-5v.
> +
> +  vmipi-supply:
> +    description: VMIPI supply, usually 1.8v.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "samsung,s6d7aa0-lsl080al02";
> +            reg = <0>;
> +            power-supply = <&display_3v3_supply>;
> +            reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
> +            backlight = <&backlight>;
> +        };
> +    };
> +
> +...
> -- 
> 2.40.1
> 
