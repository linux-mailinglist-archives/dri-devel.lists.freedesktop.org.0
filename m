Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D834B139
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 22:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830A06F49F;
	Fri, 26 Mar 2021 21:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5610F6F49F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 21:23:30 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id u2so6211059ilk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GFAesB2LhZzprNf2dLrQnuDHb35OQ5BFJDmp+fC6R4k=;
 b=SUjQOWL5KtpM6MpYjjvk5aSyJQbE8JSz5GLRLQS9Uw/hgqvRjZvYNO+7HT22rOhlIx
 kfe02hYhmjVR86VWnMHsLJyjRSmo+QauAbNvOUkluLBPo4AJBRXEgv2yGhKMRQsWd0Gq
 r/bC3vMuQg3LngXbO0d7GieU/+CVOIxAyRRW24N7jrS83qt90IM9kieeeBCO6D/1QRiT
 ZCP08eyTuvQN9+DNw/oSbkq8/BOff7HC1y1vK/N1KxdMaskNJsLZF1GQs6XYKuKgh/fk
 9Hh1+IUPRFccMWqZFql+xDNzk49V8Yr08lqB3E5ZYOV2DJpWp8nBQ212auDdFr1gWU1D
 zxRQ==
X-Gm-Message-State: AOAM533u1qC/qxOS95HPGOcZ6uJNF15E9sb8/TDXUJdF9fHjVPidEctR
 6AUvqxYJCZ3BkG3BxK/Itw==
X-Google-Smtp-Source: ABdhPJxWDgVuZb4BctFtY8ZGjBJ8tzU8jb1tz9tywHPutqQzSq149SVhO7oqOpDUsdK3jpYTvJTw5w==
X-Received: by 2002:a05:6e02:1d1b:: with SMTP id
 i27mr12280697ila.87.1616793809709; 
 Fri, 26 Mar 2021 14:23:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s3sm3210309ilj.77.2021.03.26.14.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 14:23:28 -0700 (PDT)
Received: (nullmailer pid 3883718 invoked by uid 1000);
 Fri, 26 Mar 2021 21:23:27 -0000
Date: Fri, 26 Mar 2021 15:23:27 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: add bindings for
 newhaven,1.8-128160EF
Message-ID: <20210326212327.GA3878282@robh.at.kernel.org>
References: <20210322185032.762277-1-daniel@zonque.org>
 <20210322185032.762277-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322185032.762277-2-daniel@zonque.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 07:50:31PM +0100, Daniel Mack wrote:
> This adds documentation for a new ILI9163 based, SPI connected display.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/display/ilitek,ili9163.yaml      | 70 +++++++++++++++++++

As this is panel chip, put it in panel/.

>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
> new file mode 100644
> index 0000000000000..b98c6b871b790
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only

For new bindings: GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ilitek,ili9163.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9163 display panels device tree bindings
> +
> +maintainers:
> +  - Daniel Mack <daniel@zonque.org>
> +
> +description:
> +  This binding is for display panels using an Ilitek ILI9163 controller in SPI
> +  mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - newhaven,1.8-128160EF
> +          - ilitek,ili9163
> +      - const: ilitek,ili9163

This says '"ilitek,ili9163", "ilitek,ili9163"' is valid.

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
> +            display@0{

space                   ^

> +                    compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";

??

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
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
