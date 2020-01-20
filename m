Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7A142F1F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 17:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8286E9DD;
	Mon, 20 Jan 2020 16:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C34B6E9DD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oetEg5fj/8NVUMsSSQOrxfgNlGM/ZZ/jjm0sZwoCSO4=; b=DQeNOKDjz9g1nGoGOuDajUmD3+
 gMdqW1mQqsYHpytC4feb++yYn3XPWDQOPhX/3gxTwp5Q2iLqiyWAsh/vc5Bc4ORx80wVg71E+QB0L
 yeZ9/YLAkahXl5poGpuT2uHekfU0KXec2cPJibm5lzX4IjfZyymJbkrpwhoI8kSWMUYy7nwtj23iy
 iTsPdyg8A4qH3XvK2wkOiaCOn3mCqBHr1BA7unu+NQjuJaGgegtgpn4r0AqkGMgMO5wyGG9EQNy9m
 NZTh0FAic/prdQteKCb3voaRDHyLkZfb7FLAmZLai4LQVZbEDJHQvNrxSNnbdFS9dRHTTT7uyhFDP
 sXvIvaUA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:49460 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1itZTv-0006Fx-E5; Mon, 20 Jan 2020 11:00:51 -0500
Subject: Re: [PATCH v2 1/5] dt-bindings: display: sitronix, st7735r: Convert to
 DT schema
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
From: David Lechner <david@lechnology.com>
Message-ID: <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
Date: Mon, 20 Jan 2020 10:00:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200115124548.3951-2-geert+renesas@glider.be>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/15/20 6:45 AM, Geert Uytterhoeven wrote:
> Convert the DT binding documentation for Sitronix ST7735R displays to DT
> schema.
> 
> Add a reference to the Adafruit 1.8" LCD while at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - New.
> ---
>   .../bindings/display/sitronix,st7735r.txt     | 35 ----------
>   .../bindings/display/sitronix,st7735r.yaml    | 65 +++++++++++++++++++
>   MAINTAINERS                                   |  2 +-
>   3 files changed, 66 insertions(+), 36 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>   create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> deleted file mode 100644
> index cd5c7186890a2be7..0000000000000000
> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Sitronix ST7735R display panels
> -
> -This binding is for display panels using a Sitronix ST7735R controller in SPI
> -mode.
> -
> -Required properties:
> -- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
> -- dc-gpios:	Display data/command selection (D/CX)
> -- reset-gpios:	Reset signal (RSTX)
> -
> -The node for this driver must be a child node of a SPI controller, hence
> -all mandatory properties described in ../spi/spi-bus.txt must be specified.
> -
> -Optional properties:
> -- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> -- backlight:	phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	backlight: backlight {
> -		compatible = "gpio-backlight";
> -		gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	...
> -
> -	display@0{
> -		compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
> -		reg = <0>;
> -		spi-max-frequency = <32000000>;
> -		dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> -		rotation = <270>;
> -		backlight = &backlight;
> -	};
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> new file mode 100644
> index 0000000000000000..21bccc91f74255e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7735r.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7735R Display Panels Device Tree Bindings
> +
> +maintainers:
> +  - David Lechner <david@lechnology.com>
> +
> +description:
> +  This binding is for display panels using a Sitronix ST7735R controller in
> +  SPI mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#

not all of these properties are applicable.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
> +        items:
> +          - enum:
> +              - jianda,jd-t18003-t01
> +          - const: sitronix,st7735r
> +
> +  spi-max-frequency:
> +    maximum: 32000000
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)
> +
> +required:
> +  - compatible
> +  - reg
> +  - dc-gpios
> +  - reset-gpios

Missing optional rotation and backlight properties.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +            compatible = "gpio-backlight";
> +            gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            display@0{
> +                    compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
> +                    reg = <0>;
> +                    spi-max-frequency = <32000000>;
> +                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> +                    rotation = <270>;
> +            };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea8262509bdd21ac..3007f83bd504194a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5382,7 +5382,7 @@ M:	David Lechner <david@lechnology.com>
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   S:	Maintained
>   F:	drivers/gpu/drm/tiny/st7735r.c
> -F:	Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> +F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
>   
>   DRM DRIVER FOR SONY ACX424AKP PANELS
>   M:	Linus Walleij <linus.walleij@linaro.org>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
