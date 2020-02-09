Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF21156C47
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 20:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976156E874;
	Sun,  9 Feb 2020 19:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C324F6E874
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 19:49:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DB09920028;
 Sun,  9 Feb 2020 20:49:02 +0100 (CET)
Date: Sun, 9 Feb 2020 20:49:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: add binding for tft displays based
 on ilitek,ili9486
Message-ID: <20200209194901.GA24265@ravnborg.org>
References: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
 <8938c7a53598db793bbcddf205dcf35bcc19a18e.1581270802.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8938c7a53598db793bbcddf205dcf35bcc19a18e.1581270802.git.kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=gEfo2CItAAAA:8 a=_OE19q4kzygtEEPZJPIA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kamlesh.

On Sun, Feb 09, 2020 at 11:36:26PM +0530, Kamlesh Gurudasani wrote:
> This binding is for the tft displays based on ilitek,ili9486.
> ozzmaker,piscreen and waveshare,rpi-lcd-35 are such displays
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
> 
> v2 changes:
> * Changing file from txt to yaml format
> * removed ilitek,ili9486 from compatible string
> 
> v3 changes:
> * no changes
> 
> v4 changes:
> * no changes
> 
> v5 changes:
> * made changes according to Sam Ravnborg's comment
>   for making compatible part less complex

Applied to drm-misc-next.
I assume waveshare and ozzmaker hits vendor-prefixes via some other
tree.
I had hoped we could use the license I suggested as this is default
for new bindings. But thats your call.

Sam


> ---
>  .../bindings/display/ilitek,ili9486.yaml           | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> new file mode 100644
> index 0000000..66e93e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ilitek,ili9486.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9486 display panels device tree bindings
> +
> +maintainers:
> +  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> +
> +description:
> +  This binding is for display panels using an Ilitek ILI9486 controller in SPI
> +  mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          # Waveshare 3.5" 320x480 Color TFT LCD
> +        - waveshare,rpi-lcd-35
> +          # Ozzmaker 3.5" 320x480 Color TFT LCD
> +        - ozzmaker,piscreen
> +      - const: ilitek,ili9486
> +
> +  spi-max-frequency:
> +    maximum: 32000000
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)
> +
> +  backlight: true
> +  reg: true
> +  reset-gpios: true
> +  rotation: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - dc-gpios
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +            compatible = "gpio-backlight";
> +            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
> +    };
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +
> +            display@0{
> +                    compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";
> +                    reg = <0>;
> +                    spi-max-frequency = <32000000>;
> +                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +                    rotation = <180>;
> +                    backlight = <&backlight>;
> +            };
> +    };
> +
> +...
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
