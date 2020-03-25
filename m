Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3161930F6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 20:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460EE6E820;
	Wed, 25 Mar 2020 19:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14089B84
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 19:16:42 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FF75206F6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585163801;
 bh=cfVwm22IKI9cOZgwEccMOiw9QY/DqffBXIvOZsHd/8A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pFjsWXtR8pMq87hc2kODna+ZSIgJ146bAfOW/i3135FzSV8omnP7zLhyy0OyNglCv
 U32rdnV4tEZX4gco8ZpbU8Qesb5jYkYzIZaAG+WjHpWhwjFWFeuzkPzOFrbhz+oOpC
 7jl5EGz4sg7vZs5CGhQ/kz8tGtTT3LfIL5pvzmlc=
Received: by mail-qt1-f179.google.com with SMTP id e14so3233121qts.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 12:16:41 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0RdNbc8woz1ElW+zG3/iPc0l9oc43QemRg0rTXldfI0uph9vmZ
 Dy3nNVxRNtEmZCGbgZBc6Y0WgdscZ+usDrn5Ag==
X-Google-Smtp-Source: ADFU+vv1R1RGuT4oHV3D+FyU0t3cuppa4GSmQ5jGdbHF8VwlsPh+dfVyz1CyHG3Yx4qgCUSy+PVyYUNHglvEV1kL3DU=
X-Received: by 2002:ac8:1b33:: with SMTP id y48mr4755572qtj.136.1585163800284; 
 Wed, 25 Mar 2020 12:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
 <20200318171003.5179-2-jagan@amarulasolutions.com>
In-Reply-To: <20200318171003.5179-2-jagan@amarulasolutions.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Mar 2020 13:16:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+F4cE=razpBFg=vjA8_TbPSH8pxLWO85s2Lt_=NZ063Q@mail.gmail.com>
Message-ID: <CAL_Jsq+F4cE=razpBFg=vjA8_TbPSH8pxLWO85s2Lt_=NZ063Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Convert
 sitronix,st7701 to DT schema
To: Jagan Teki <jagan@amarulasolutions.com>
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
 David Airlie <airlied@linux.ie>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 11:10 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Convert the sitronix,st7701 panel bindings to DT schema.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - fix dt_binding_check
>
>  .../display/panel/sitronix,st7701.txt         | 30 --------
>  .../display/panel/sitronix,st7701.yaml        | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
> deleted file mode 100644
> index ccd17597f1f6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Sitronix ST7701 based LCD panels
> -
> -ST7701 designed for small and medium sizes of TFT LCD display, is
> -capable of supporting up to 480RGBX864 in resolution. It provides
> -several system interfaces like MIPI/RGB/SPI.
> -
> -Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
> -inbuilt ST7701 chip.
> -
> -Required properties:
> -- compatible: must be "sitronix,st7701" and one of
> -  * "techstar,ts8550b"
> -- reset-gpios: a GPIO phandle for the reset pin
> -
> -Required properties for techstar,ts8550b:
> -- reg: DSI virtual channel used by that screen
> -- VCC-supply: analog regulator for MIPI circuit
> -- IOVCC-supply: I/O system regulator
> -
> -Optional properties:
> -- backlight: phandle for the backlight control.
> -
> -panel@0 {
> -       compatible = "techstar,ts8550b", "sitronix,st7701";
> -       reg = <0>;
> -       VCC-supply = <&reg_dldo2>;
> -       IOVCC-supply = <&reg_dldo2>;
> -       reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
> -       backlight = <&backlight>;
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> new file mode 100644
> index 000000000000..e02686dfd937
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR X11)

Do you have rights on the old doc to change the license? If so, it should be:

(GPL-2.0-only OR BSD-2-Clause)

If not, GPL-2.0-only.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sitronix,st7701.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7701 based LCD panels
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  ST7701 designed for small and medium sizes of TFT LCD display, is
> +  capable of supporting up to 480RGBX864 in resolution. It provides
> +  several system interfaces like MIPI/RGB/SPI.
> +
> +  Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
> +  inbuilt ST7701 chip.

Reference panel-common.yaml here.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - techstar,ts8550b
> +      - const: sitronix,st7701
> +
> +  reg:
> +    description: DSI virtual channel used by that screen

maxItems: 1

> +
> +  VCC-supply:
> +    description: analog regulator for MIPI circuit
> +
> +  IOVCC-supply:
> +    description: I/O system regulator
> +
> +  reset-gpios:
> +    description: a GPIO phandle for the reset pin

Just 'reset-gpios: true'. Already defined by panel-common.yaml.

> +
> +  backlight:
> +    description: Backlight used by the panel
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Same here. Just need 'true'.

> +
> +required:
> +  - compatible
> +  - reg
> +  - VCC-supply
> +  - IOVCC-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "techstar,ts8550b", "sitronix,st7701";
> +            reg = <0>;
> +            VCC-supply = <&reg_dldo2>;
> +            IOVCC-supply = <&reg_dldo2>;
> +            reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
> +            backlight = <&backlight>;
> +        };
> +    };
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
