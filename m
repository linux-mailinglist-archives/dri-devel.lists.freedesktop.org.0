Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5830F9EC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 18:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D2F6EDF5;
	Thu,  4 Feb 2021 17:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB36EDF5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 17:40:40 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id k25so4504893oik.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 09:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppFNAnwz/O2d3fmUTcOou1FwVZxpBcox4zp0+9mjbI0=;
 b=DRmhxpiAYkrQkkcMHelaOv2VpEniW/m4lO6VBOJ1iSXp91mXhlRZv++pRCsI0l0l07
 0TJWVkyexeheJGnEoGR5nh/IztcrgIzebxQS4mr5/DPT0rstF5O1cPOA2MG0a9osBdfi
 6xuEATtuiU/JZFL4LBo0xbDg6nssC9Y+n8dsHCZV+N+Sfivdyf6wLfM4AscKCy5LXBKA
 q7UGul1hwiLgF44yAEzTrjIa2YoBzTXFQiXEtgGcVSD0e9PsuZLJzWBD+fCDoTRBSML2
 CcjcHDPTCXwxbVBULDNEUXzzy7lwKyq1uyEQAA86uAXTeokB0Dc6FgJAvF4YxKE7xY+y
 BIQg==
X-Gm-Message-State: AOAM533yomYtNrQACZEADfBuaE/N6IF4Vcb/0cH6R/VVVHtGgkxIXeMM
 TFJ7tz21JixtRK8AFZfoVw==
X-Google-Smtp-Source: ABdhPJwyQZK/KLQa58IT9c/ne8vaoP5CTOrMYyKDPUl4t2Upj/dzcMYl4KNRnM0QPe8DsbgWaulQrw==
X-Received: by 2002:a05:6808:145:: with SMTP id h5mr406403oie.87.1612460439336; 
 Thu, 04 Feb 2021 09:40:39 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a63sm1233750otc.75.2021.02.04.09.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 09:40:38 -0800 (PST)
Received: (nullmailer pid 702724 invoked by uid 1000);
 Thu, 04 Feb 2021 17:40:37 -0000
Date: Thu, 4 Feb 2021 11:40:37 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add documentation
 for SN65DSI84
Message-ID: <20210204174037.GA690342@robh.at.kernel.org>
References: <20210203071256.42050-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203071256.42050-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-amarula@amarulasolutions.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 12:42:55PM +0530, Jagan Teki wrote:
> SN65DSI84 is a Single Channel DSI to Dual-link LVDS bridge from
> Texas Instruments.
> 
> SN65DSI83, SN65DSI85 are variants of the same family of bridge
> controllers.
> 
> Right now the bridge driver is supporting a single link, dual-link
> support requires to initiate I2C Channel B registers, so dt-bindings
> documented with single link LVDS.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - none
> 
>  .../bindings/display/bridge/ti,sn65dsi84.yaml | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
> new file mode 100644
> index 000000000000..891382a76c1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi84.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI SN65DSI84 MIPI DSI to LVDS bridge bindings
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  The SN65DSI84 DSI to FlatLink bridge features a single channel MIPI D-PHY receiver
> +  front-end configuration with 4 lanes per channel operating at 1 Gbps per lanes.
> +  The bridge decodes MIPI DSI 18bpp RGB666 and 240bpp RG888 packets and converts
> +  the formatted video data stream to a FlatLink compatible LVDS output operating
> +  at pixel clocks operating from 25 MHx to 154 MHz, offering a Dual-Link LVDS,
> +  Single-Link LVDS interface with four data lanes per link.
> +
> +  https://www.ti.com/product/SN65DSI84
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi84
> +
> +  reg:
> +    maxItems: 1
> +    description: i2c address of the bridge, 0x2c

Just 'const: 0x2c' if that's the only valid address.

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge enable pin (active high).
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: |
> +          DSI Input. The remote endpoint phandle should be a
> +          reference to a valid mipi_dsi_host device node.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Video port for LVDS output (panel or connector).

This needs to use the graph.yaml schema. See the ones in drm-misc-next 
that are already converted.

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
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       ports {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           port@0 {
> +               reg = <0>;
> +               dsi_in: endpoint {
> +                   remote-endpoint = <&ltdc_ep0_out>;
> +               };
> +           };
> +
> +           port@1 {
> +               reg = <1>;
> +               dsi_out: endpoint {
> +                   remote-endpoint = <&bridge_in>;
> +                   data-lanes = <0 1>;
> +               };
> +           };
> +       };
> +    };
> +
> +    i2c6 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       bridge@2c {
> +           compatible = "ti,sn65dsi84";
> +           reg = <0x2c>;
> +           enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
> +
> +           ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@0 {
> +                   reg = <0>;
> +                   bridge_in: endpoint {
> +                        remote-endpoint = <&dsi_out>;
> +                   };
> +               };
> +
> +               port@1 {
> +                   reg = <1>;
> +                   bridge_out: endpoint {
> +                        remote-endpoint = <&panel_in_lvds>;
> +                   };
> +               };
> +           };
> +       };
> +    };
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
