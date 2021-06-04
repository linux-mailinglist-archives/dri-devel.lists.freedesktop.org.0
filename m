Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F239C126
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 22:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABC46E09F;
	Fri,  4 Jun 2021 20:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1817C6E09F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 20:18:44 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so2521024oor.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 13:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MCfv6fQHDee2XjvXSHxeG0uhLM30iPs27L6wPGcgAxs=;
 b=H644Ol/TFPAhql4/6jWMrAfG6gy9+GFh/RB5TDMQpHJCgB9KuCaUhWy/gz3ZDa4kpP
 ze06KvcSvwCXjWpP4OtGuN8ltEZEr7E78tCqNOLBkvEYdX2sOJDUOfy7YNVkO+n9u34W
 Hvw1YoVi3OBt3bYI9ITkiW84sXT1L1No0JlnoQg0VvtpjmYgabe+7/t+K+A3XWh7eCWx
 Cjrz2an9/oHbQEkMlVuZAhN5e0MO65UQnqiVBhoNtGaIt1EFLtyFe+eOmAxmE6jXYBG8
 mx+wlupp7utB5aWwDhXHr1RCzVR86WKn3CwFO1mEbv0/VYo5eS8RxLZ8L1DFJS6ZnFiT
 Fceg==
X-Gm-Message-State: AOAM5317YArFeoXrGvKoVSVwLMtYPZd2tf/CAGWYYC6LgXrfiK54a9nV
 GfTmy4961zhAohUUSZqUDQ==
X-Google-Smtp-Source: ABdhPJzRJDPfmgAea9/YY0WQx51jKCVAWE652ExVRIuOi+o8jdXEwJqKDYUFtdgGhgxX1EY+ifs3dQ==
X-Received: by 2002:a4a:5246:: with SMTP id d67mr4967125oob.33.1622837923378; 
 Fri, 04 Jun 2021 13:18:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f2sm634713ooj.22.2021.06.04.13.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:18:42 -0700 (PDT)
Received: (nullmailer pid 3843001 invoked by uid 1000);
 Fri, 04 Jun 2021 20:18:41 -0000
Date: Fri, 4 Jun 2021 15:18:41 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add SONY Synaptics JDI panel
Message-ID: <20210604201841.GA3834184@robh.at.kernel.org>
References: <20210525113105.52990-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525113105.52990-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Thierry Reding <thierry.reding@gmail.com>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 01:31:02PM +0200, Konrad Dybcio wrote:
> Add bindings for the SONY Synaptics JDI panel used in
> Xperia X, X Performance, X Compact, XZ and XZs smartphones.
> 
> Due to the nature of phone manufacturing and lack of any docs
> whatsoever, replacement names have been used to indicate the
> devices that this panel is used on.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../display/panel/sony,synaptics-jdi.yaml     | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml
> new file mode 100644
> index 000000000000..81d841c049e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,synaptics-jdi.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,synaptics-jdi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SONY Synaptics JDI panel
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
> +
> +description: |+

Do you need the formatting? If not, drop '|+'.

> +  This panel seems to only be found in SONY Xperia
> +  X, X Performance, X Compact, XZ and XZs
> +  smartphones and we have no straightforward way of
> +  actually getting the correct model number,
> +  as no schematics are released publicly.

Odd choice of line break length. 80 char please.

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - sony,synaptics-jdi-dora
> +          - sony,synaptics-jdi-kagura
> +          - sony,synaptics-jdi-keyaki
> +          - sony,synaptics-jdi-kugo
> +          - sony,synaptics-jdi-suzu
> +
> +  reg: true
> +
> +  reset-gpios: true
> +
> +  avdd-supply:
> +    description: avdd supply
> +
> +  vddio-supply:
> +    description: vddio supply
> +
> +  vsn-supply:
> +    description: voltage negative supply
> +
> +  vsp-supply:
> +    description: voltage positive supply
> +
> +  tvdd-supply:
> +    description: tvdd supply
> +
> +  preset-gpio:
> +    description: panel reset pin

What's reset-gpios then?

> +
> +  pvddio-gpio:
> +    description: panel vddio pin
> +
> +  treset-gpio:
> +    description: touch reset pin

Use '-gpios'

And need to define how many (maxItems: 1).

> +
> +required:
> +  - compatible
> +  - reg
> +  - preset-gpio
> +  - pvddio-gpio
> +  - treset-gpio
> +  - avdd-supply
> +  - vddio-supply
> +  - vsn-supply
> +  - vsp-supply
> +  - tvdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            panel: panel@0 {
> +                    reg = <0>;
> +
> +                    pvddio-gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +                    preset-gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
> +                    treset-gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +
> +                    vddio-supply = <&pm8994_s4>;
> +                    avdd-supply = <&pm8994_l2>;
> +                    tvdd-supply = <&panel_tvdd>;
> +
> +                    backlight = <&pmi8994_wled>;
> +
> +                    port {
> +                      panel_in: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                      };

Consistent indentation please. 4 spaces is good.

> +                    };
> +            };
> +    };
> -- 
> 2.31.1
