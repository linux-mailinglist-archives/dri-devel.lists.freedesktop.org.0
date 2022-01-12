Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7D48BCBB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 02:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A310E310;
	Wed, 12 Jan 2022 01:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497410E310
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 01:54:26 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id t9so1491002oie.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 17:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jyyKKvrn92emBwTYl6ojD1y8WmP58/pIYIpRrruJx/w=;
 b=UoVj47Ov0W+XUzi9Gs0wDdClt1gkHa/zuGT6fzXsRitztSZgne484N2v025o/SVpdG
 uF/BEzTFA8aPPrMYVct8XVj918UzVG2kr5hZ6zSQJSUlwyn3x05RvUHubRrUHLbCM2vH
 MzgUtgnHRfbKIPDaaJo1Wtdh5P6oycf2sZnXj3BO5MDM02eTTMecvq+jsi17j824SYg2
 ESLRIzbOpXIBR3aGerkWU3e6+vsleem/WA2lINvcpuqjesnThaj+ttFBcBJo6r8uEWom
 7e75Dvp1XpK8b84py5Qvelj8r3nNV/sX0kcCMftPSPmQc34dYMj/uPCUexSsowyhE8m8
 LxOw==
X-Gm-Message-State: AOAM530/FiEEfmrydikg9aY7JdjpPvbw068kcSHyPCPN/ss2T+4FkmY5
 3LnXmHdpd/gfCfIX9kMh/w==
X-Google-Smtp-Source: ABdhPJyai3eviqa56Rw1cwTXbmGC71Vr+kY41i8iUDYQQFe2H8+v8hh3AGbUdGoLrzSfIGQXsyaa3Q==
X-Received: by 2002:a05:6808:254:: with SMTP id
 m20mr2737989oie.55.1641952465766; 
 Tue, 11 Jan 2022 17:54:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v4sm2255328oot.36.2022.01.11.17.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:54:25 -0800 (PST)
Received: (nullmailer pid 3904441 invoked by uid 1000);
 Wed, 12 Jan 2022 01:54:24 -0000
Date: Tue, 11 Jan 2022 19:54:24 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <Yd400IApAqHeSW4B@robh.at.kernel.org>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107145515.613009-2-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 07, 2022 at 03:55:10PM +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
> on the same Amlogic SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-mipi-dsi.yaml    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> new file mode 100644
> index 000000000000..f3070783d606
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson Synopsys Designware Integration is composed of
> +  - A Synopsys DesignWare MIPI DSI Host Controller IP
> +  - A TOP control block controlling the Clocks & Resets of the IP
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-dw-mipi-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: pclk
> +      - const: px_clk
> +      - const: meas_clk
> +
> +  resets:
> +    minItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: top
> +
> +  phys:
> +    minItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

/schemas/graph.yaml#/properties/port

> +        unevaluatedProperties: false

And this can be dropped.

> +        description: Input node to receive pixel data.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false

Same here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        description: DSI output node to panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi@7000 {
> +          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
> +          reg = <0x6000 0x400>;
> +          resets = <&reset_top>;
> +          reset-names = "top";
> +          clocks = <&clk_pclk>, <&clk_px>;
> +          clock-names = "pclk", "px_clk";
> +          phys = <&mipi_dphy>;
> +          phy-names = "dphy";
> +
> +          ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              /* VPU VENC Input */
> +              mipi_dsi_venc_port: port@0 {
> +                  reg = <0>;
> +
> +                  mipi_dsi_in: endpoint {
> +                       remote-endpoint = <&dpi_out>;
> +                  };
> +              };
> +
> +              /* DSI Output */
> +              mipi_dsi_panel_port: port@1 {
> +                  reg = <1>;
> +
> +                  mipi_out_panel: endpoint {
> +                      remote-endpoint = <&mipi_in_panel>;
> +                  };
> +              };
> +          };
> +    };
> -- 
> 2.25.1
> 
> 
