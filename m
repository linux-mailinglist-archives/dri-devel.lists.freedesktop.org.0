Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5C1B345D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 03:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72546E19C;
	Wed, 22 Apr 2020 01:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6436E19C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 01:11:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90A24528;
 Wed, 22 Apr 2020 03:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587517909;
 bh=JttfiURhrIhVwSVufhA9ryuXfJIG3R4ryYcC3Ir96HU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2sXE9yCZ0iY3aB6GQ2crR2lHriVzkBs1ATtZFAyXdVX6dyyGq9ibhhNqn9eYQ1cE
 uw7Jug73O0bv5f2gxT6ifTLbclhqFsys5nrzaVjsmCiMLzaZg3aUeYe5LMf6IdPCrU
 m1LyltkPtBTCjX0pGYA6BGkh5GR2YcMcTA7G+eP0=
Date: Wed, 22 Apr 2020 04:11:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
Message-ID: <20200422011136.GN5983@pendragon.ideasonboard.com>
References: <20200421105814.1364900-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421105814.1364900-1-adrian.ratiu@collabora.com>
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
Cc: devicetree@vger.kernel.org, Philippe CORNU <philippe.cornu@st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

Thank you for the patch.

On Tue, Apr 21, 2020 at 01:58:14PM +0300, Adrian Ratiu wrote:
> This converts the Synopsis MIPI DSI binding documentation to yaml and
> should be quite straightforward. I've added a missing ref clk and also
> added Philippe as maintainer b/c he's the original txt author following
> the algorithm provided in Message-ID 20200420175909.GA5810@ravnborg.org.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Philippe CORNU <philippe.cornu@st.com>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
> Changes in v2:
>   - Removed unnecessary descriptions and maxItems (Rob)
>   - Changed maintainers entry / dropped Mark (Rob)
>   - Added dsi-controller.yaml ref (Rob)
> ---
>  .../bindings/display/bridge/dw_mipi_dsi.txt   | 32 -----------
>  .../display/bridge/snps,dw-mipi-dsi.yaml      | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> deleted file mode 100644
> index b13adf30b8d3b..0000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Synopsys DesignWare MIPI DSI host controller
> -============================================
> -
> -This document defines device tree properties for the Synopsys DesignWare MIPI
> -DSI host controller. It doesn't constitue a device tree binding specification
> -by itself but is meant to be referenced by platform-specific device tree
> -bindings.
> -
> -When referenced from platform device tree bindings the properties defined in
> -this document are defined as follows. The platform device tree bindings are
> -responsible for defining whether each optional property is used or not.
> -
> -- reg: Memory mapped base address and length of the DesignWare MIPI DSI
> -  host controller registers. (mandatory)
> -
> -- clocks: References to all the clocks specified in the clock-names property
> -  as specified in [1]. (mandatory)
> -
> -- clock-names:
> -  - "pclk" is the peripheral clock for either AHB and APB. (mandatory)
> -  - "px_clk" is the pixel clock for the DPI/RGB input. (optional)
> -
> -- resets: References to all the resets specified in the reset-names property
> -  as specified in [2]. (optional)
> -
> -- reset-names: string reset name, must be "apb" if used. (optional)
> -
> -- panel or bridge node: see [3]. (mandatory)
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/reset/reset.txt
> -[3] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> new file mode 100644
> index 0000000000000..d9ab464f79ff4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/snps,dw-mipi-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare MIPI DSI host controller
> +
> +maintainers:
> +  - Philippe CORNU <philippe.cornu@st.com>
> +
> +description: |
> +  This document defines device tree properties for the Synopsys DesignWare MIPI
> +  DSI host controller. It doesn't constitue a device tree binding specification
> +  by itself but is meant to be referenced by platform-specific device tree
> +  bindings.
> +
> +  When referenced from platform device tree bindings the properties defined in
> +  this document are defined as follows. The platform device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module clock
> +      - description: DSI bus clock for either AHB and APB
> +      - description: Pixel clock for the DPI/RGB input
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: pclk
> +      - const: px_clk
> +    minItems: 2
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: apb

I think you can also add the ports property and its child port@0 and
port@1, as they're required in all cases.

> +
> +patternProperties:
> +  "^panel@[0-3]$":
> +    type: object
> +
> +required:
> +  - reg
> +  - clocks
> +  - clock-names

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
