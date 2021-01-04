Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E92E98BF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 16:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B604B89C6B;
	Mon,  4 Jan 2021 15:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B204989C6B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 15:31:48 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kwRpj-0001G7-Ch; Mon, 04 Jan 2021 16:31:47 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kwRpj-0006jc-2e; Mon, 04 Jan 2021 16:31:47 +0100
Message-ID: <348b20d674cbfc18384b8a29a3a63e3f8f08e334.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: bridge: Add YAML schema
 for Synopsys DW-HDMI
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 04 Jan 2021 16:31:46 +0100
In-Reply-To: <20201220195005.26438-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201220195005.26438-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sandy Huang <hjc@rock-chips.com>, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-12-20 at 21:50 +0200, Laurent Pinchart wrote:
> Add a .yaml schema containing the common properties for the Synopsys
> DesignWare HDMI TX controller. This isn't a full device tree binding
> specification, but is meant to be referenced by platform-specific
> bindings for the IP core.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

> ---
> Changes since v1:
> 
> - Add default to reg-io-width property
> - Add additionalProperties
> - Rebase on top of OF graph schema, dropped redundant properties
> - Drop cec clock as it's device-specific
> - Increase max clocks to 5 to accommodate the Rockchip DW-HDMI
> ---
>  .../display/bridge/synopsys,dw-hdmi.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..96c4bc06dbe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Synopsys DesignWare HDMI TX Controller
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This document defines device tree properties for the Synopsys DesignWare HDMI
> +  TX controller (DWC HDMI TX) IP core. It doesn't constitute a full device tree
> +  binding specification by itself but is meant to be referenced by device tree
> +  bindings for the platform-specific integrations of the DWC HDMI TX.
> +
> +  When referenced from platform device tree bindings the properties defined in
> +  this document are defined as follows. The platform device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description:
> +      Width (in bytes) of the registers specified by the reg property.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 4]
> +    default: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - description: The bus clock for either AHB and APB
> +      - description: The internal register configuration clock
> +    additionalItems: true
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +    items:
> +      - const: iahb
> +      - const: isfr
> +    additionalItems: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +additionalProperties: true
> +
> +...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
