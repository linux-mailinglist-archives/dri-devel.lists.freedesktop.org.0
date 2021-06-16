Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E273AA797
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 01:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592BF6E845;
	Wed, 16 Jun 2021 23:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1B96E845
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 23:40:15 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id b14so3815815ilq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 16:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kDYnmGlkYP2XTjPyujeKcLs7zkGku54gbQ2xEMwMzGQ=;
 b=U3ZU7RE2/SuhRAfvlf+rTSPUP5MgVUEw2mz4O8UMmjBWgPyfyWCZIrfgbHEPDL3FVZ
 94fKI25J8p32uxdbXfTSv0Dr3ORGNucy00EFzpFOM1WHkzEMb/cTKz+r4HFE/+KeOsPc
 kio5t9jLP74IOTHhlbORMN3S2B7r8iK7HNg5pCBiPTCrLTFvw3PPn9XA71F5Zpxxht/W
 rCO9rjWdkJw0ePW3WZZxFk0fFuyI70WraIyd97WoGlihOorQUnPD28OJRLoq5LUxujTU
 Qj1d9biVXXacPI7YLUrEa3EDS8rZks1z1mdGfWsrWsMv7m4YvCa+LAzTtqyj2E2eQ+z1
 zuLQ==
X-Gm-Message-State: AOAM530xWYylzxji4pgJ7/THaFc9DsZ/4voNdATlTLlmI0/ucOxp+uJw
 5/Yw8iqRjo11w+uF9NGH5Q==
X-Google-Smtp-Source: ABdhPJxOVFOvxO+PfGwlEWm+SVTL4u/1b9+xCOaQxsYMANRsvdRArIUQpQn2YsRYLvV0yG3lnEellA==
X-Received: by 2002:a92:bf10:: with SMTP id z16mr1547434ilh.304.1623886814437; 
 Wed, 16 Jun 2021 16:40:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id h7sm1866831ilr.44.2021.06.16.16.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 16:40:13 -0700 (PDT)
Received: (nullmailer pid 300348 invoked by uid 1000);
 Wed, 16 Jun 2021 23:40:11 -0000
Date: Wed, 16 Jun 2021 17:40:11 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add SONY Synaptics JDI panel
Message-ID: <20210616234011.GA295646@robh.at.kernel.org>
References: <20210605104942.39487-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605104942.39487-1-konrad.dybcio@somainline.org>
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

On Sat, Jun 05, 2021 at 12:49:40PM +0200, Konrad Dybcio wrote:
> Add bindings for the SONY Synaptics JDI panel used in
> Xperia X, X Performance, X Compact, XZ and XZs smartphones.
> 
> Due to the nature of phone manufacturing and lack of any docs
> whatsoever, replacement names have been used to indicate the
> devices that this panel is used on.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - gpio -> gpios
> - description: |+ -> description: |
> - remove redundant reset-gpio
> - fix up indentation in the example
> 
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
> +  This panel seems to only be found in SONY Xperia
> +  X, X Performance, X Compact, XZ and XZs
> +  smartphones and we have no straightforward way of
> +  actually getting the correct model number,
> +  as no schematics are released publicly.
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

'-gpios' is the preferred form.

And needs 'maxItems: 1'

> +    description: panel reset pin
> +
> +  pvddio-gpio:
> +    description: panel vddio pin
> +
> +  treset-gpio:
> +    description: touch reset pin

Same for these.

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

Missing a compatible which means the above schema is never applied...

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

and that would point out this is not documented. 

> +                      panel_in: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                      };
> +                    };
> +            };
> +    };
> -- 
> 2.31.1
