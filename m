Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEB2C81D1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516C66E440;
	Mon, 30 Nov 2020 10:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A766E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:11:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 141DC97E;
 Mon, 30 Nov 2020 11:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606731065;
 bh=6yNYBd4hnQw/+qV8tKpWZDM4iSZQKQnbWIb2+1kcLIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+l6Rv2m/xF1UWCpXENf943tSL9GmzWPPPYrZszfF6Y/etL/Uc0Cyq03XnsapAyYQ
 4s+jWzz17E6MiaJp1N1wuKVGEaiJm3B2pKyGO22hhKNuRpF5nMMyt3rR2COf5rhkyO
 dhhX4E5dho7hN2jnP8l2BjHhOrGkJb39K2n/aig4=
Date: Mon, 30 Nov 2020 12:10:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RESEND v3 1/2] dt-bindings: dp-connector: add binding for
 DisplayPort connector
Message-ID: <20201130101057.GP4141@pendragon.ideasonboard.com>
References: <20201124071155.76868-1-tomi.valkeinen@ti.com>
 <20201124071155.76868-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124071155.76868-2-tomi.valkeinen@ti.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 09:11:54AM +0200, Tomi Valkeinen wrote:
> Add binding for DisplayPort connector. A few notes:
> 
> * Similar to hdmi-connector, it has hpd-gpios as an optional property,
>   as the HPD could also be handled by, e.g., the DP bridge.
> 
> * dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
>   is not strictly required: standard DP cables do not even have the pin
>   connected.
> 
> * Connector type. Full size and mini connectors are identical except for
>   the connector size and form, so I believe there is no functional need
>   for this property. But similar to 'label' property, it might be used
>   to present information about the connector to the userspace.
> 
> * No eDP. There's really no "eDP connector", as it's always a custom
>   made connection between the DP and the DP panel, although the eDP spec
>   does offer a few suggested pin setups. So possibly there is no need for
>   edp-connector binding, but even if there is, I don't want to guess what
>   it could look like, and could it be part of the dp-connector binding.
> 
> * No DP++. I'm not familiar with DP++. DP++ might need an i2c bus added
>   to the bindings.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  .../display/connector/dp-connector.yaml       | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> new file mode 100644
> index 000000000000..b5fc3e52899e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/dp-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DisplayPort Connector
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +properties:
> +  compatible:
> +    const: dp-connector
> +
> +  label: true
> +
> +  type:
> +    enum:
> +      - full-size
> +      - mini

I wonder if "full" would be better than "full-size" to match "mini". Up
to you.

> +
> +  hpd-gpios:
> +    description: A GPIO line connected to HPD
> +    maxItems: 1
> +
> +  dp-pwr-supply:
> +    description: Power supply for the DP_PWR pin
> +    maxItems: 1
> +
> +  port:
> +    description: Connection to controller providing DP signals

Now that the OF graph schema has landed, could you add the corresponding
$ref ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +required:
> +  - compatible
> +  - type
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +        compatible = "dp-connector";
> +        label = "dp0";
> +        type = "full-size";
> +
> +        port {
> +            dp_connector_in: endpoint {
> +                remote-endpoint = <&dp_out>;
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
