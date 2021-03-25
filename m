Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2034974B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 17:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2936D6EB83;
	Thu, 25 Mar 2021 16:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9455A6EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 16:49:49 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id gb6so1315904pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KaZNs/slFbXR+His3djbKPWrwZ4lvzuSmzWHKektuFM=;
 b=Vlr0woIKSnzYqOorKJVFFq+dl4PWdwBStgUJVK/JTCgUghS+QDp1JjuyjXUdzyhPQO
 sYgRWBVWGjHTDHgijhGcL8U51jUGgF04DOENDTJBSpZ+Y3AIjkixor/uLErRjaiGvKhQ
 QTN8H3gF0kdJjdW8/k1+tcrRV4sUdJhuBROtS0jST6XkauacxKx/L5blCWUyweWotaa7
 ucRuxOhGc6gyqusUXi1Jl3pBUk4gfJGoNM1YlQ3lbUyewRyX61OEq8uJb19CjNELD34L
 GEV22TMIh2sxveAwHdjWicFS24NNMLKI1GBXPLEF5AvC6Q0nwVfmqtq2AQyoJXpC59rm
 b9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KaZNs/slFbXR+His3djbKPWrwZ4lvzuSmzWHKektuFM=;
 b=sczSDCbqLsNj3Wo1d9b9tk93lsQircv3+mieTFQXwFR1nbPe6uzM6pq2UMrlCdjbSO
 zCWTtfG7NU0ZwrqyWJmXTAaBCBrXVt2B0yqJXQmHPnr/kLc0dCBq7EO3QkkhATXbwEWH
 fR16dk1me/B7zUCKiOf4j8PeXh46j/G4gTdHmgoalB2lKZ+VKDbixPaMSDLMsQaNGu/X
 tuawpWJ5Q4/FEVxLlTI8PCUtSbKAYqhxbEBTbIPIrqHVkY2lpFmBxYP5GMXExNVhVjR1
 xDANLj5n4AdrFqA9cdQBlmmMwSeCGCaxqHRvekwkvcnp4s6cPZPLstOTP3V53qUCr9Kk
 Afcg==
X-Gm-Message-State: AOAM532TLrawYVU0JkpxszQB7OEr9jD4EhATkQnUOwrjrgxYE60g3jP0
 FNjR/g0D3Hx1oC0dwlN8Gi+FSNYxnyvFFoLr93Ryrs/w/8CSBQNz
X-Google-Smtp-Source: ABdhPJx7d0yaG5nL06/Z/qmgArm+E/1zz6/PdivRj7LNIGAYNsSqEjhkh4JiFkM9WhYO6fEUA/XeRv0i5aSyAMHJZZM=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr9930336pjh.19.1616690989004; 
 Thu, 25 Mar 2021 09:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210322103328.66442-1-jagan@amarulasolutions.com>
In-Reply-To: <20210322103328.66442-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 25 Mar 2021 17:49:38 +0100
Message-ID: <CAG3jFyt1pztRM=pHmE3VWK0aXKivQJ=7qz8QsryhEtL35LVXKg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: Add Chipone ICN6211
 bindings
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-amarula@amarulasolutions.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a42e37db23b88120aea9fa31f9c0952accb39296

On Mon, 22 Mar 2021 at 11:33, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> ICN6211 is MIPI-DSI to RGB Converter bridge from Chipone.
>
> It has a flexible configuration of MIPI DSI signal input and
> produces RGB565, RGB666, RGB888 output format.
>
> Add dt-bingings for it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v5:
> - rebase drm-misc-next
> - collect Rob, Robert review tags
> Changes for v4:
> - fixed Laurent comments
> - added regulators
> - replace reset with EN
> - fixed warnings pointed by Robert
> Changes for v3:
> - updated to new dt-bindings style
>
>  .../display/bridge/chipone,icn6211.yaml       | 99 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> new file mode 100644
> index 000000000000..62c3bd4cb28d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  ICN6211 is MIPI-DSI to RGB Converter bridge from chipone.
> +
> +  It has a flexible configuration of MIPI DSI signal input and
> +  produce RGB565, RGB666, RGB888 output format.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - chipone,icn6211
> +
> +  reg:
> +    maxItems: 1
> +    description: virtual channel number of a DSI peripheral
> +
> +  enable-gpios:
> +    description: Bridge EN pin, chip is reset when EN is low.
> +
> +  vdd1-supply:
> +    description: A 1.8V/2.5V/3.3V supply that power the MIPI RX.
> +
> +  vdd2-supply:
> +    description: A 1.8V/2.5V/3.3V supply that power the PLL.
> +
> +  vdd3-supply:
> +    description: A 1.8V/2.5V/3.3V supply that power the RGB output.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for MIPI DSI input
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for MIPI DPI output (panel or connector).
> +
> +    required:
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
> +    dsi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@0 {
> +        compatible = "chipone,icn6211";
> +        reg = <0>;
> +        enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            bridge_in_dsi: endpoint {
> +              remote-endpoint = <&dsi_out_bridge>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            bridge_out_panel: endpoint {
> +              remote-endpoint = <&panel_out_bridge>;
> +            };
> +          };
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b705ba51c54..b9d11101d060 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5568,6 +5568,11 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
>  F:     drivers/gpu/drm/panel/panel-boe-himax8279d.c
>
> +DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
> +M:     Jagan Teki <jagan@amarulasolutions.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> +
>  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
>  M:     Linus Walleij <linus.walleij@linaro.org>
>  S:     Maintained
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
