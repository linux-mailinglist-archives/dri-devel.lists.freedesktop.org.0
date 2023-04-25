Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F906EE75E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 20:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E887510E0B1;
	Tue, 25 Apr 2023 18:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BFE10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 18:10:35 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-187b70ab997so32547480fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 11:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682446234; x=1685038234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rng6PHPZ/aCPXB606CKpC6fkVi0wxWyPWt9a80TUNyM=;
 b=jVC2fdboAaJJIi58v3s1xdLgDGV1RomKP1f/YOewZtsDD+X+TCPt2rNJNgbL9rzUoW
 oDDLgAW+l1tol/HDldaVytnjM5sUFO6ySAGK+6hH+PoxbinudP1df7CsrE4l05N923s9
 PXfgkKkW5AZfwwfpPsO3F+MjkEnB+lLJjDEEoR7Ad+n030YiOn2mK60dNtViRM1Uvh0i
 ycqnKt2OFX1h72grXeDv4lK45Q0KqgcRmdDsm4pQQPwO88h2xo26VlEWr4hvoSX+w6e8
 MYmM5n/aQWKWpqt4SFYB7GOfDTlCzpwwdLliWGvhNnNK5dA2DoWeGiN2WvoHAxdLPqTE
 ZmeQ==
X-Gm-Message-State: AAQBX9fi3WA//a4wBEnhTAP4KPa1NwYdBCHJHSIR9x5F3jJ2LdNdxwmE
 FPIHAG86EBZpnQG5CNfd0w==
X-Google-Smtp-Source: AKy350YaySHgNcVyVhpFn4mmI6SA/6Cofrcf+eQkTiMBlatn2FJ2k339LhvrpscsGqDNCP4IYrNBog==
X-Received: by 2002:a05:6870:a686:b0:177:864d:7a7e with SMTP id
 i6-20020a056870a68600b00177864d7a7emr9885349oam.18.1682446234059; 
 Tue, 25 Apr 2023 11:10:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dx46-20020a05687076ae00b00183ff6b45a2sm5771218oab.10.2023.04.25.11.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:10:33 -0700 (PDT)
Received: (nullmailer pid 2031051 invoked by uid 1000);
 Tue, 25 Apr 2023 18:10:32 -0000
Date: Tue, 25 Apr 2023 13:10:32 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: panel: Add synaptics r63353
 panel controller
Message-ID: <20230425181032.GA2028047-robh@kernel.org>
References: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
 <20230421154308.527128-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421154308.527128-2-dario.binacchi@amarulasolutions.com>
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
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 05:43:02PM +0200, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Add documentation for "synaptics,r63353" panel.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../display/panel/synaptics,r63353.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
> new file mode 100644
> index 000000000000..13e6ed39e124
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,r63353.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics R63353 based MIPI-DSI panels
> +
> +maintainers:
> +  - Michael Trimarchi <michael@amarulasolutions.com>
> +

You need a $ref to panel-common.yaml.

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - sharp,ls068b3sx02
> +      - const: synaptics,r63353
> +
> +  avdd-supply: true
> +  dvdd-supply: true
> +  port: true
> +  reg: true
> +  reset-gpios: true
> +  backlight: true

And then drop port, reset-gpios, and backlight.

> +
> +required:
> +  - compatible
> +  - avdd-supply
> +  - dvdd-supply
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false

And then 'unevaluatedProperties: false' here instead.

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
> +            compatible = "sharp,ls068b3sx02", "synaptics,r63353";
> +            reg = <0>;
> +            avdd-supply = <&avdd_display>;
> +            dvdd-supply = <&dvdd_display>;
> +            reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&mipi_dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.32.0
> 
