Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823B32E47F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 10:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3590B6EB29;
	Fri,  5 Mar 2021 09:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7480A6EB29
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 09:15:58 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id g20so1110335plo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2s/6bosQnyMVVhGPfC4oLj+5tbM01J9t4bfvMd7vhE=;
 b=AaRPNLUShGL/WIkNjCI0BiUU3K2IHRYb3melResKabIt41oLMDOCBa5ds0aAxzFZSZ
 t2cd5JZ8xh0hphmXPCOe0xzIQJkSw2Db1V1OqJH5pS0etrD3XWxxjwSjXcqBg++A1h5f
 g1PAmYxHwOrcvMMeo2ZcIihES8695t8Gn1yGObjhXS/CZ9InFMrYdk/82/STX4MSmHU6
 UfgiiWlXhGOZAwpoql5BXkBvzAd4mb6tmO2rFhmvpY71qx7C5lMnCJErH2DahXH7Aqre
 HuJOjOC21AQ5xfBPqCp4UFKi/OzUqSiJ/d1dvY9+lpgQOKZN0NQCRJ/5ZfTIsXE6m/wt
 kPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2s/6bosQnyMVVhGPfC4oLj+5tbM01J9t4bfvMd7vhE=;
 b=kb6zVzwnE+rdQB0nIKFhUR44j6eFtzDeUTiJcZkDMxKL0VvOHPagmOcvgevtMSzKv1
 7wJ5kBRP+0JxEJHSbJI4bs3f/CImGcF0flq8dhEMc34S9k99P4l3BoGlw3Dird8tQyEd
 Rxe07EzUPwLPWUj6sSvjoKFJiArfhx+XdCHWVjwYDnOc+kK4rxqsy92ZBMdvOhYbw7wL
 fg0ZwnIqrkkNbPGPfo/frjYnSfpfJz2afmd4gIBl70zmdlxiBYGwx3WStjGls49rm+pE
 dmbos5kTKJs1UqF37gcaSLHIwkxYu14m7rtxYmprNLTjfmF5KqH1IGl9dD05CIwZ2vpa
 33hw==
X-Gm-Message-State: AOAM531N2dhRVsA/K6fGQwbL0YD3JWF/pjvbrnBYarYaxl7jD0Gmm2ra
 o4/cZja2ko0MJTUhOMJQ+v3wRLVajVda1z8Crh5XuA==
X-Google-Smtp-Source: ABdhPJy/Sfmg/zLpRI4ehD75EdGmKQ7AwXYkMBriEgMGBtafpi+vNhuCvcADyvNsVacmQIihmDdlrS1M9kGc3mjRNZo=
X-Received: by 2002:a17:90b:1b52:: with SMTP id
 nv18mr9516532pjb.19.1614935758043; 
 Fri, 05 Mar 2021 01:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20210304092133.21717-1-jagan@amarulasolutions.com>
In-Reply-To: <20210304092133.21717-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 5 Mar 2021 10:15:47 +0100
Message-ID: <CAG3jFysfspsKe6U9pxEjgDh9W4Lzs4f7G4cnwvjz0gYc4b5gzg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: Add Chipone ICN6211
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

Hey Jagan,

This looks good to me, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 4 Mar 2021 at 10:21, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> ICN6211 is MIPI-DSI to RGB Converter bridge from Chipone.
>
> It has a flexible configuration of MIPI DSI signal input and
> produces RGB565, RGB666, RGB888 output format.
>
> Add dt-bingings for it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
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
> index 9d241b832aae..065cbdc889d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5529,6 +5529,11 @@ S:       Maintained
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
