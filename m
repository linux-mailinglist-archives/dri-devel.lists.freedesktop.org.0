Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643E2F22FA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A9489DC1;
	Mon, 11 Jan 2021 22:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A49989DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:45:56 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id v19so143340ooj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TWzR02te5uk5MCjIEEArzIEPWl3rL9lGlci+NkzFFu0=;
 b=Zzzjpr44ZvoPhia90T+ygqXtBoJlzw+cn+frHKYwLTNZJku3hZfq7aaBBWcD8wwRE7
 1NhfpZJNqiBs5bSLYIIFgEnz5i6Efir7htBdUwUwRarG2C8q55ehi5PdwuiHcKkywLGh
 IY1uGyQIvTbeuyUrGQ5KPIixD9kEp0pwsoH67GI7jTz+TGn33JQNmlq+EsYir7RGvaBO
 5EUZS9RasPL8i4Y+lYIMrOCrKZY2pVSH0bQljfKaOB40dawCvKPi3ZHquX5R8TJbULqf
 jEAsR9SkeH0tvM4zSxxZQCF+3zg1NZeTinT5Trau6RJ+7QjKFKccc+Rtq4A5SzU5AIAf
 ZY5g==
X-Gm-Message-State: AOAM532Pq1RcDcWkkLobo4HE6Ci44cYB7dTO+iK9vijkqCcZaZBJJkHV
 PNvZ8YsRxkHq8KG2tdcXdQ==
X-Google-Smtp-Source: ABdhPJxp3aLQjXnU6rPP97yT5iEdgQlltxbQWg8hftjInKb4DwHZB4Jv6tWnqIddgIZhK92E4lmH3w==
X-Received: by 2002:a4a:751a:: with SMTP id j26mr971798ooc.68.1610405155736;
 Mon, 11 Jan 2021 14:45:55 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d10sm196490ooh.32.2021.01.11.14.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:45:54 -0800 (PST)
Received: (nullmailer pid 3197463 invoked by uid 1000);
 Mon, 11 Jan 2021 22:45:53 -0000
Date: Mon, 11 Jan 2021 16:45:53 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: display: bridge: Add YAML schema for
 Synopsys DW-HDMI
Message-ID: <20210111224553.GA3192268@robh.at.kernel.org>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105060818.24158-2-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 08:08:13AM +0200, Laurent Pinchart wrote:
> Add a .yaml schema containing the common properties for the Synopsys
> DesignWare HDMI TX controller. This isn't a full device tree binding
> specification, but is meant to be referenced by platform-specific
> bindings for the IP core.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

'ports' should probably be dropped if what each 'port' is is not defined 
here. Any users will have to define 'ports' and the child nodes.

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +additionalProperties: true
> +
> +...
> -- 
> Regards,
> 
> Laurent Pinchart
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
