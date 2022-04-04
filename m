Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF24F19EC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 21:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3500A10E745;
	Mon,  4 Apr 2022 19:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C7B10E745
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 19:30:02 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so7908321otq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 12:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pw9/rx3OWyNgJmgrxMJHiM9XNdAuSk1x7PxfxleOVHo=;
 b=qfHBZjWwKwCbEHcrSV+XHyozQCmPbJ4bwGw3cDZ2BJUkhaJb1KuorUYxRPiWoUe7yH
 jTtB5SLTovGf6CctyjrZTR5AsOrAs6fS4Kwxp+AIo//TpzGsgaSbMTxBcLjEWH7JbAg0
 1NKRNOzFnnIIO7XVhH947Qki/IiCNHymYLS6Dw/gc9B40xJS71K/vDqzR21T3icfdhRC
 c155yNuNdtEhXDp/6Qm+KIjryJtBMpSjEP1QKppMPuHYzlg3HeXc0YHxN6ZZp7qIT6ey
 sakWKs0rOPGiMtuKKbtLjxa2VOSKDwuQBTpD2jchT0+crU3J20jrwZfGPhII9Aepq7Mu
 pGVw==
X-Gm-Message-State: AOAM533rmzhuuQNcP82W3SuFLU0jX8uRyu7Pxs3B3ISASqMctzZKTfdn
 Hd5Y1lj/2WuD1/F3TF6fVQ==
X-Google-Smtp-Source: ABdhPJwpJgxnagGtsX/4G1femKCs6URgtvhIa+HnkzdqIgagKjjdNd7aX3OMcDtkEZWJvTE80AJhKg==
X-Received: by 2002:a05:6830:201a:b0:5e6:8de6:9922 with SMTP id
 e26-20020a056830201a00b005e68de69922mr417505otp.3.1649100601406; 
 Mon, 04 Apr 2022 12:30:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l9-20020a4a4349000000b00328fae52bcasm4210372ooj.16.2022.04.04.12.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 12:30:01 -0700 (PDT)
Received: (nullmailer pid 1815025 invoked by uid 1000);
 Mon, 04 Apr 2022 19:30:00 -0000
Date: Mon, 4 Apr 2022 14:30:00 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: lt9211: Add Lontium
 LT9211 bridge driver
Message-ID: <YktHOBXZvMPWbrgk@robh.at.kernel.org>
References: <20220330212231.90904-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330212231.90904-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 11:22:30PM +0200, Marek Vasut wrote:
> Add bindings for Lontium LT9211 Single/Dual-Link DSI/LVDS or Single DPI to
> Single-link/Dual-Link DSI/LVDS or Single DPI bridge. This chip is highly
> capable at converting formats, but sadly it is also highly undocumented.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../display/bridge/lontium,lt9211.yaml        | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> new file mode 100644
> index 000000000000..2faa855b3824
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
> +  or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt9211
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active high RESET pin.
> +
> +  vccio-supply:
> +    description: Regulator for 1.8V IO power.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Primary MIPI DSI port-1 for MIPI input or
> +          LVDS port-1 for LVDS input or DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Additional MIPI port-2 for MIPI input or LVDS port-2
> +          for LVDS input. Used in combination with primary
> +          port-1 to drive higher resolution displays
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Primary MIPI DSI port-1 for MIPI output or
> +          LVDS port-1 for LVDS output or DPI output.
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Additional MIPI port-2 for MIPI output or LVDS port-2
> +          for LVDS output. Used in combination with primary
> +          port-1 to drive higher resolution displays.
> +
> +    required:
> +      - port@0
> +      - port@2
> +
> +required:
> +  - compatible
> +  - reg
> +  - vccio-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c10 {

i2c {

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi-bridge@3b {
> +        compatible = "lontium,lt9211";
> +        reg = <0x3b>;
> +
> +        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> +        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
> +
> +        vccio-supply = <&lt9211_1v8>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +
> +            endpoint {
> +              remote-endpoint = <&panel_in_lvds>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.35.1
> 
> 
