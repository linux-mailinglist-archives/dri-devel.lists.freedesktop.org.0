Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266684658E9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CF56E02B;
	Wed,  1 Dec 2021 22:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDADF6E02B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:08:36 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id t23so51569941oiw.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=61rAikMT2xFefgUe5g0NFULS9kpnMPEF5LrvcuuTYAU=;
 b=r2cxeG41eQIvTtZwOJB5T6SGDWHkp+s6uZdS3UcSPkpDzrlwEZqzWtwUYBR0lumiQX
 L+2k8XTJPfYRw70paDIGGg5LK3GICxkIqv9FLn52zi6rqjfSuHCzcM2OlFxtBciP+dKl
 LE2ljqdsvdstuA2crtoGaZymtR3aj4LvyZQOVbMiTary2p2CUy/BK2t5/Ne45aC8l1eG
 B3yMvRZi7MMDSOmr+ySaiOqgN0ot7RrkZSC3oRUfrbI7LpFQiCzaNdYI7tweWNcMgJHc
 kQkuVcli+WgvFwfQX/6VIYU0xJHDU++ABZHpwdHh3Ce8smY9wPYxq1l8WMtwGY/7hrfQ
 41Vg==
X-Gm-Message-State: AOAM533TDcWgSD0daXj5nXiFak8Nx7Qvi0Ij7bmMaJxpZ0PkUfNmgjQg
 uRMxfMV8vR9XieQKhuhNpvcioubaJA==
X-Google-Smtp-Source: ABdhPJxtSafNCNJSoXOFWLNnynN6wCIJQOugyj5c5EA3SsbJixIS28ajEXBr/1ehe/2yFDSR2rhwDg==
X-Received: by 2002:a05:6808:14e:: with SMTP id
 h14mr1048175oie.28.1638396516123; 
 Wed, 01 Dec 2021 14:08:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a3sm632937oil.32.2021.12.01.14.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:08:35 -0800 (PST)
Received: (nullmailer pid 2780052 invoked by uid 1000);
 Wed, 01 Dec 2021 22:08:34 -0000
Date: Wed, 1 Dec 2021 16:08:34 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 4/6] dt-bindings: display: sitronix,st7735r: Add
 initialization properties
Message-ID: <YafyYgrwga0Tf/EB@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-5-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-5-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 david@lechnology.com, dave.stevenson@raspberrypi.com,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 04:07:55PM +0100, Noralf Trønnes wrote:
> Add initialization properties that are commonly used to initialize the
> controller for a specific display panel. It is common for displays to have
> a datasheet listing the necessary controller settings or some example code
> doing the same. These settings can be matched directly to the DT
> properties.
> 
> The commands FRMCTR2, FRMCTR3, PWCTR4 and PWCTR5 are usually part of the
> setup examples but they are skipped here since they deal with partial and
> idle mode which are powersaving modes for very special use cases.
> 
> dc-gpios is made optional because its absence indicates 3-line mode.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../bindings/display/sitronix,st7735r.yaml    | 118 +++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> index 157b1a7b18f9..2db1cfe6ae30 100644
> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> @@ -19,6 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> +      - description:
> +          Sitronix ST7735R 262K Color Single-Chip TFT Controller/Driver
> +        items:
> +          - const: sitronix,st7735r
>        - description:
>            Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
>          items:
> @@ -32,20 +36,99 @@ properties:
>                - okaya,rh128128t
>            - const: sitronix,st7715r
>  
> +  width:
> +    description:
> +      Width of display panel in pixels
> +
> +  height:
> +    description:
> +      Height of display panel in pixels


We already have width-mm and height-mm for physical size so this might 
be a bit confusing. There's also panel-timing 'vactive' and 'hactive' 
which is effectively the same thing you are defining.

> +
> +  frmctr1:

Are all these standardized by MIPI or otherwise common? If not, they 
need vendor prefixes.

> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Frame Rate Control (In normal mode/Full colors) (B1h)
> +    minItems: 3
> +    maxItems: 3
> +
> +  invctr:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Display Inversion Control (B4h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  pwctr1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Power Control 1 (C0h)
> +    minItems: 3
> +    maxItems: 3
> +
> +  pwctr2:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Power Control 2 (C1h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  pwctr3:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Power Control 3 (in Normal mode/Full colors) (C2h)
> +    minItems: 2
> +    maxItems: 2
> +
> +  vmctr1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      VCOM Control 1 (C5h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  madctl:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Memory Data Access Control (36h)
> +    minItems: 1
> +    maxItems: 1
> +
> +  gamctrp1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Gamma Positive Polarity Correction Characteristics Setting (E0h)
> +    minItems: 16
> +    maxItems: 16
> +
> +  gamctrn1:
> +    $ref: /schemas/types.yaml#definitions/uint8-array
> +    description:
> +      Gamma Negative Polarity Correction Characteristics Setting (E1h)
> +    minItems: 16
> +    maxItems: 16
> +
> +  write-only:
> +    type: boolean
> +    description:
> +      Controller is not readable (ie. MISO is not wired up).
> +
>    dc-gpios:
>      maxItems: 1
> -    description: Display data/command selection (D/CX)
> +    description: |
> +      Controller data/command selection (D/CX) in 4-line SPI mode.
> +      If not set, the controller is in 3-line SPI mode.
>  
>    backlight: true
>    reg: true
>    spi-max-frequency: true
>    reset-gpios: true
>    rotation: true
> +  width-mm: true
> +  height-mm: true
>  
>  required:
>    - compatible
>    - reg
> -  - dc-gpios
>  
>  additionalProperties: false
>  
> @@ -72,5 +155,36 @@ examples:
>                      backlight = <&backlight>;
>              };
>      };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            sainsmart18@0{
> +                    compatible = "sitronix,st7735r";
> +                    reg = <0>;
> +                    spi-max-frequency = <40000000>;
> +
> +                    width = <160>;
> +                    height = <128>;
> +
> +                    frmctr1 = [ 01 2C 2D ];
> +                    invctr = [ 07 ];
> +                    pwctr1 = [ A2 02 84 ];
> +                    pwctr2 = [ C5 ];
> +                    pwctr3 = [ 0A 00 ];
> +                    vmctr1 = [ 0E ];
> +                    madctl = [ 60 ];
> +                    gamctrp1 = [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
> +                    gamctrn1 = [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
> +
> +                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> +                    write-only;
> +            };
> +    };
> +
>  
>  ...
> -- 
> 2.33.0
> 
> 
