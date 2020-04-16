Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CAD1AC883
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B636E261;
	Thu, 16 Apr 2020 15:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297666E261
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:09:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3B6A214AF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587049797;
 bh=rW0Bvw3mt3oRNulNWXsyEx1/+k3RkTc+dWy1wdwu6Qo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hthOJdnrcdqI6mMre4jfYWe1srm1RKsINoBdel8L88TL63UL7K3qE/bZotnPScbWn
 HnOsPRTdKvhFS3sZg8Sa8cW+uDQcJnHjZ4cu3wQmtZy+UaGdKzJLq4jI/KslkaVkje
 ij4rmuwpBU4Da7u/hi//x2ybpLVxv4RFng/klKNI=
Received: by mail-qk1-f172.google.com with SMTP id t3so17787406qkg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:09:56 -0700 (PDT)
X-Gm-Message-State: AGi0PuaIhp41IPa54/SOM99gHF367qte57ZRgGNEk8YK/D86nXL9RePV
 ybscS1VdDES17sNVzqCEmuAQk21ezFD6E5Dr5g==
X-Google-Smtp-Source: APiQypJ+bjQ0KgyMuk0uvkjJanAnJ0Z7kTZhk7t7vqPo6scnZ7torJnyQYrZi5/0Y+NTz2ZfLoR+oJzvFDzDKWw5KXQ=
X-Received: by 2002:a37:7dc6:: with SMTP id
 y189mr33611422qkc.223.1587049796040; 
 Thu, 16 Apr 2020 08:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200416125207.425271-1-adrian.ratiu@collabora.com>
In-Reply-To: <20200416125207.425271-1-adrian.ratiu@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 10:09:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyEjXjeADvxztT0kg6Sc-VASUeBPr0jJAwS39PckQjpw@mail.gmail.com>
Message-ID: <CAL_JsqLyEjXjeADvxztT0kg6Sc-VASUeBPr0jJAwS39PckQjpw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
To: Adrian Ratiu <adrian.ratiu@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 7:51 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> This converts the Synopsis MIPI DSI binding documentation to yaml and
> should be quite straightforward. I've added a missing ref clk and also
> added Mark and Rob as maintainers based on 'get_maintainer.pl' results.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  .../bindings/display/bridge/dw_mipi_dsi.txt   | 32 ---------
>  .../display/bridge/snps,dw-mipi-dsi.yaml      | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> deleted file mode 100644
> index b13adf30b8d3..000000000000
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
> index 000000000000..0ab4125eee30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/snps,dw-mipi-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare MIPI DSI host controller
> +
> +maintainers:
> +  - Rob Herring <robh+dt@kernel.org>

No thanks, I don't know anything about this hardware. It should be the
owner for this binding, not who applies patches.

> +  - Mark Rutland <mark.rutland@arm.com>

Check current maintainers. Mark is not one anymore.

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

Need to reference ($ref) dsi-controller.yaml here.

> +properties:
> +  reg:
> +    description: |
> +      Memory mapped base address and length of the DesignWare MIPI DSI host
> +      controller registers.

Drop the description. That's every 'reg'. You need to say how many
regions (maxItems: 1?).

> +
> +  clocks:
> +    description: |
> +      References to all the clocks specified in the clock-names property as
> +      specified in Documentation/devicetree/bindings/clock/clock-bindings.txt

Drop

> +    items:
> +      - description: Module clock
> +      - description: DSI bus colck for either AHB and APB

typo

> +      - description: Pixel clock for the DPI/RGB input
> +    minItems: 2
> +    maxItems: 3

You can drop 'maxItems'. It's implied by the length of 'items'.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: pclk
> +      - const: px_clk
> +    minItems: 2
> +    maxItems: 3
> +
> +  resets:
> +    description: |
> +      References to all the resets specified in the reset-names property as
> +      specified in Documentation/devicetree/bindings/reset/reset.txt

Drop.

You need maxItems to define how many reset entries.

> +
> +  reset-names:
> +    const: apb
> +
> +patternProperties:
> +  "^panel@[0-3]$":
> +    type: object
> +    description: |
> +      A node containing the panel or bridge description as documented in

bridge? But the node name says panel only.

> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt

Drop description.

> +
> +required:
> +  - reg
> +  - clocks
> +  - clock-names
> --
> 2.26.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
