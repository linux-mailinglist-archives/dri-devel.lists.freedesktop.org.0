Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3A210FEE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 17:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AA289949;
	Wed,  1 Jul 2020 15:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B2A89949
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 15:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E4648FB04;
 Wed,  1 Jul 2020 17:58:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HarL-GLC7aLb; Wed,  1 Jul 2020 17:58:58 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 08F4640972; Wed,  1 Jul 2020 17:58:58 +0200 (CEST)
Date: Wed, 1 Jul 2020 17:58:57 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 02/13] dt-bindings: panel: Convert
 rocktech,jh057n00900 to yaml
Message-ID: <20200701155857.GB174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-3-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-3-megous@megous.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej,
On Wed, Jul 01, 2020 at 12:31:15PM +0200, Ondrej Jirman wrote:
> Convert Rocktech MIPI DSI panel driver from txt to yaml bindings.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../display/panel/rocktech,jh057n00900.txt    | 23 -------
>  .../display/panel/rocktech,jh057n00900.yaml   | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml

Thanks for the conversion! Shouldn't we switch to `sitronix-st7703.yaml`
as well in this patch?
Cheers,
 -- Guido

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
> deleted file mode 100644
> index a372c5d84695..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "rocktech,jh057n00900"
> -- reg: DSI virtual channel of the peripheral
> -- reset-gpios: panel reset gpio
> -- backlight: phandle of the backlight device attached to the panel
> -- vcc-supply: phandle of the regulator that provides the vcc supply voltage.
> -- iovcc-supply: phandle of the regulator that provides the iovcc supply
> -  voltage.
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel@0 {
> -			compatible = "rocktech,jh057n00900";
> -			reg = <0>;
> -			backlight = <&backlight>;
> -			reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
> -			vcc-supply = <&reg_2v8_p>;
> -			iovcc-supply = <&reg_1v8_p>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> new file mode 100644
> index 000000000000..928ba42e7f8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/rocktech,jh057n00900.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
> +
> +maintainers:
> +  - Ondrej Jirman <megi@xff.cz>
> +
> +description: |
> +             Rocktech JH057N00900 is a 720x1440 TFT LCD panel
> +             connected using a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: rocktech,jh057n00900
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  vcc-supply:
> +    description: Panel power supply
> +
> +  iovcc-supply:
> +    description: I/O voltage supply
> +
> +  reset-gpios:
> +    description: GPIO used for the reset pin
> +    maxItems: 1
> +
> +  backlight:
> +    description: Backlight used by the panel
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +  - iovcc-supply
> +  - reset-gpios
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
> +      panel@0 {
> +        compatible = "rocktech,jh057n00900";
> +        reg = <0>;
> +        vcc-supply = <&reg_2v8_p>;
> +        iovcc-supply = <&reg_1v8_p>;
> +        reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
> +        backlight = <&backlight>;
> +      };
> +    };
> +...
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
