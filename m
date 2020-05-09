Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08EE1CC1DB
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 15:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3A76E34B;
	Sat,  9 May 2020 13:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898956E34B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 13:44:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26CF130D;
 Sat,  9 May 2020 15:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589031858;
 bh=7ujcB1XiyYpi6kSKrCO4PkwZ8y4r1hWPfytMfvnyY4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fMcZW0Xdwz+2i/Y1YD/XzxevPo9t5tFUqBQrZl8MQUQquRHgWOpZHE1KoxEhfQMxT
 FoG0ZMRMprkb2BVaQaMm0+f0BY5fuTPWYbRY3wuJxBg+KQCMzAR8FH+i20YZaCz/Vv
 k83pJTzCERFtUCglPJMmGagn3gFxbRHKpSakbFFo=
Date: Sat, 9 May 2020 16:44:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: srk@48.io
Subject: Re: [PATCH 1/2] dt-bindings: it6251: add bindings for IT6251
 LVDS-to-eDP bridge
Message-ID: <20200509134410.GA5946@pendragon.ideasonboard.com>
References: <20200509111732.26102-1-srk@48.io>
 <20200509111732.26102-2-srk@48.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200509111732.26102-2-srk@48.io>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Sean Cross <xobs@kosagi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Richard,

Thank you for the patch.

On Sat, May 09, 2020 at 01:17:31PM +0200, srk@48.io wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Richard Marko <srk@48.io>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sean Cross <xobs@kosagi.com>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/ite,it6251.yaml   | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml
> new file mode 100644
> index 000000000000..8daa44a30fa1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it6251.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT6251 LVDS-to-eDP bridge bindings
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +  - Richard Marko <srk@48.io>
> +
> +description: |
> +  The IT6251 is a high-performance single-chip
> +  De-SSC LVDS to DisplayPort converter.
> +  Combined with LVDS receiver and DisplayPort Transmitter,
> +  the IT6251 supports LVDS input and DisplayPort 1.1a
> +  output by conversion function.

You could reflow this to the 80 columns limit. It also sounds like
marketing material copied from the datasheet, with "by conversion
function" likely a bad translation.

> +
> +properties:
> +  compatible:
> +    const: ite,it6251
> +
> +  reg:
> +    items:
> +      - description: I2C address of the bridge
> +      - description: I2C address of the LVDS part
> +
> +  reg-names:
> +    items:
> +      - const: bridge
> +      - const: lvds
> +
> +  ports:
> +    type: object
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
> +        description: |
> +         Video port for eDP output (typically panel).
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Video port for LVDS input.

We traditionally use port 0 for the input and port 1 for the output. I'd
rather do the same here to remain consistent, and allow generic code to
operate on this device.

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +  power-supply: true

There are multiple power supplies for the chip, shouldn't we have
multiple properties ? I would also name the properties according to the
supply name.

The chip has an HPD input. I would recommend already documenting an
optional boolean no-hpd property to report when the HPD input is not
connected.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    it6251@5c {
> +      compatible = "ite,it6251";
> +      reg = <0x5c>, <0x5e>;
> +      reg-names = "bridge", "lvds";
> +      power-supply = <&reg_display>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          bridge_out_edp0: endpoint {
> +            remote-endpoint = <&panel_in_edp0>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          bridge_in_lvds0: endpoint {
> +            remote-endpoint = <&lvds0_out>;
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
