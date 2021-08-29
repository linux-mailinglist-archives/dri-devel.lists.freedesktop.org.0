Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED33FAB77
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEE289E0D;
	Sun, 29 Aug 2021 12:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A644289E0D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 12:45:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id e4c79135-08c6-11ec-aa7e-0050568cd888;
 Sun, 29 Aug 2021 12:44:47 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 66AB2194B76;
 Sun, 29 Aug 2021 14:45:06 +0200 (CEST)
Date: Sun, 29 Aug 2021 14:44:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 list@opendingux.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add AUO A030JTN01
Message-ID: <YSuBRjVDJyIPlaX0@ravnborg.org>
References: <20210828112640.7248-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828112640.7248-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi PAul,

On Sat, Aug 28, 2021 at 12:26:39PM +0100, Paul Cercueil wrote:
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/auo,a030jtn01.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> new file mode 100644
> index 000000000000..21c9d62e3625
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD
> +
> +description: |
> +  The panel must obey the rules for a SPI slave device as specified in
> +  spi/spi-controller.yaml
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: auo,a030jtn01
> +
> +  backlight: true
> +  port: true
> +  power-supply: true
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>

As this is a spi slave, then it is supposed to be a node below a spi
node.
Other bindings add:
    spi {
        #address-cells = <1>;
        #size-cells = <0>;
        ...
    }

to make this obvious.

> +
> +    panel@0 {
> +      compatible = "auo,a030jtn01";
> +      reg = <0>;
> +
> +      spi-max-frequency = <10000000>;
> +
> +      reset-gpios = <&gpe 4 GPIO_ACTIVE_LOW>;
> +      power-supply = <&lcd_power>;
> +
> +      backlight = <&backlight>;
> +
> +      port {
> +        panel_input: endpoint {
> +          remote-endpoint = <&panel_output>;
> +        };
> +      };
> +    };

My personal preference is indent with 4 spaces in the example - but
there is no hard rules so 2 spaces is also fine.

With or without my nits above:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


	Sam
