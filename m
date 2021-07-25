Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113853D4E1F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 16:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DAE6E193;
	Sun, 25 Jul 2021 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161D36E193
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 14:34:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7cefd247-ed55-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 14:34:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 45D4B194B37;
 Sun, 25 Jul 2021 16:35:01 +0200 (CEST)
Date: Sun, 25 Jul 2021 16:34:40 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Message-ID: <YP12gIvW2nldYQfx@ravnborg.org>
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725140339.2465677-1-alexeymin@postmarketos.org>
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexey,
On Sun, Jul 25, 2021 at 05:03:37PM +0300, Alexey Minnekhanov wrote:
> The Samsung S6E3FA2 AMOLED cmd LCD panel is used on Samsung Galaxy
> S5 (klte) phone.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  .../display/panel/samsung,s6e3fa2.yaml        | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
> new file mode 100644
> index 000000000000..d5628ae81141
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e3fa2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung s6e3fa2 AMOLED CMD LCD DSI panel
> +
> +maintainers:
> +  - Alexey Minnekhanov <alexeymin@postmarketos.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e3fa2
> +
> +  reg: true
> +  reset-gpios: true
> +  port: true
> +
> +  iovdd-supply:
> +    description: IOVDD regulator
> +
> +  vddr-supply:
> +    description: VDDR regulator
> +
> +required:
> +  - compatible
reg?

> +  - reset-gpios
> +  - iovdd-supply
> +  - vddr-supply

> +
> +unevaluatedProperties: false
As I do not see the DT node pull in additional preperties from another
binding the more strict:
additionalProperties: false seems to be the right choise here.
In this way the DT check will catch if thre are properties specified
that are not listed by the binding.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> +
> +examples:
> +  - |
> +    /* from Samsung Galaxy S5 klte */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "samsung,s6e3fa2";
> +            reg = <0>;
> +
> +            reset-gpios = <&pma8084_gpios 17 GPIO_ACTIVE_LOW>;
> +
> +            iovdd-supply = <&pma8084_lvs4>;
> +            vddr-supply = <&vreg_panel>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.31.1
