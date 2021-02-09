Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C912A315797
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 21:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A7C6E48F;
	Tue,  9 Feb 2021 20:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D436E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 20:19:04 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id d7so16419102otq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 12:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZOJ3/xZbrYavgOoCQR7u2DEXz/TzJ11fMpN1m2ECp9w=;
 b=SVnToRYijSCr29XQZu1qSPA3RBZl+dKpyeeACiS0dz0fd2reXQIP0ewQJ0OeqGEbY4
 iuomOjgpAy6Uoy+VZ/qa7tP3wJ6Edwfmy5QT2OJOC6wUP/P6vf40LSQXKTtO5KGikAYS
 Lw2LihSBmFpaStjb+/b5QXtyTdy3F5vG4tWCKmPyg7Kyz94Dxa0SPifDFf2x3rhK8I+U
 eFjCra0AMTF/thKIgpi0Zwv6PSbjK3XOG3vXYHPYbFs4xRYy5BOPFDhsTF/1zNKlUrvH
 tCFAT7bqdWlbqcwYv/8f4FLm355tR+fsxZ4OPi8eKyjN4RPJm9JDOyE0gi13GalEDwAw
 Dz3Q==
X-Gm-Message-State: AOAM530gDH3E7FTvZhDnBhq28+lszmtaJIgd47jQQyGSi9hQicEtIswB
 5DwiOVlXH5z+L0DDK3r5SQ==
X-Google-Smtp-Source: ABdhPJwhQ9AAOunj+XPxDONZPOSBzu6VAfoY7nift3HRk/RnSl8wAChUeH9QkwuuwtgqyBkgYxKqcA==
X-Received: by 2002:a05:6830:1bf5:: with SMTP id
 k21mr16990317otb.207.1612901943725; 
 Tue, 09 Feb 2021 12:19:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y5sm2094523oti.59.2021.02.09.12.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:19:02 -0800 (PST)
Received: (nullmailer pid 98230 invoked by uid 1000);
 Tue, 09 Feb 2021 20:19:01 -0000
Date: Tue, 9 Feb 2021 14:19:01 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 bindings
Message-ID: <20210209201901.GA82980@robh.at.kernel.org>
References: <20210130181014.161457-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130181014.161457-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 30, 2021 at 07:10:13PM +0100, Marek Vasut wrote:
> Add DT binding document for TI SN65DSI83 DSI to LVDS bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> new file mode 100644
> index 000000000000..77e1bafd8cd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI83 DSI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The Texas Instruments SN65DSI83 bridge takes MIPI DSI in and outputs LVDS.
> +  https://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi83&fileType=pdf
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi83
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

This all needs to use graph.yaml and video-interfaces.yaml. The latter 
is in the media tree. See examples there for what to do. It will have to 
wait for rc1 to apply to drm-misc.

For data-lanes, you need to specify how many lanes are valid. If there's 
only 1 possible setting (in the h/w, not driver), then it doesn't need 
to be in DT.

I agree with Doug on adding the regulators. Hard to get wrong in the 
binding. You or someone can add them to the driver when you can test.

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
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
