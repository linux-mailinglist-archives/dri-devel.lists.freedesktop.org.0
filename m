Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6431B8E0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CC089AC0;
	Mon, 15 Feb 2021 12:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D189AC0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:18:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70E19743;
 Mon, 15 Feb 2021 13:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1613391486;
 bh=ZGjqeLHhLSjQAtFs+lBFjupO2sxG85RXzJ4w+DhEIL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gke28+8rWJyPMgaFfMDwyQ+pD5S7PRAMzEtYS+wS+Km+Vy3yoaLdoHx1qUFwkyF6k
 QYXbnKc0Btd0lfaNLchweYCFOuzc4vxbxftchdZm8lVkVI8vOvWBl5ROd+a1Zi/Zkn
 oc2pE9nrCKHPIjcbeDKCujXqyaWu1pCBasb8HxYQ=
Date: Mon, 15 Feb 2021 14:17:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 Chipone ICN6211
Message-ID: <YCpmZWRoiWULiANx@pendragon.ideasonboard.com>
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214175211.105107-1-jagan@amarulasolutions.com>
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
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Sun, Feb 14, 2021 at 11:22:10PM +0530, Jagan Teki wrote:
> ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> 
> It has a flexible configuration of MIPI DSI signal input and
> produce RGB565, RGB666, RGB888 output format.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - updated to new dt-bindings style
> 
>  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> new file mode 100644
> index 000000000000..13764f13fe46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> @@ -0,0 +1,90 @@
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
> +  ICN6211 is MIPI-DSI to RGB Convertor bridge from chipone.
> +
> +  It has a flexible configuration of MIPI DSI signal input and
> +  produce RGB565, RGB666, RGB888 output format.

How does one select between the output formats ? Should the output
connection option be described in the device tree ?

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
> +  reset-gpios:
> +    description: GPIO connected for the reset pin
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
> +  - reset-gpios
> +  - ports

How about regulators ?

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
> +        reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          bridge_in: port@0 {

You can drop this label.

> +            reg = <0>;
> +
> +            bridge_out_dsi: endpoint {

This label should be bridge_in_dsi.

> +              remote-endpoint = <&dsi_out_bridge>;
> +            };
> +          };
> +
> +          bridge_out: port@1 {

You can drop this label too.

> +            reg = <1>;
> +
> +            bridge_out_panel: endpoint {
> +              remote-endpoint = <&panel_out_bridge>;
> +            };
> +          };
> +        };
> +      };
> +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
