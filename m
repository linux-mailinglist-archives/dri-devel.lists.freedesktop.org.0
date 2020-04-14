Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEF1A8A87
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 21:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592B6E56D;
	Tue, 14 Apr 2020 19:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD9F6E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:10:40 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m2so869744otr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ScMMUsaLt0ejnuMSGLD3JzzBHstpRGblAIjPSlTU1dg=;
 b=QC+rel85TZsi9HZ9jqAq9sYRG9FbaXJ0aAw1dYf0Cc1oYgnARi+z/QdOx2ULJ5VlZ6
 DpWqobx5CI6vqbEOHCejuANd3VEgLtvgSVXuabJObpfVdTahykSYwuMzXbjJkdAP+uGF
 c0Op2FTqXQrwL4QfG5Bz+foi6ZzRiv7dFvO80x+p4qb8hRLjrIZKf7IQcINQWaDxTfU6
 wfo+rIDG48/Cs+ZnBXYVtpAFEPUyY2Wovw7jyKLxWeFxkK8b5VxOppt9OwSeCdWmXMAf
 YE5obzuCzhCwwChKIC5QBwqaXVAfSAkBVbUDWqfB6ItUDLx/RXAQBT46X0f+HOi9pTT3
 W3eQ==
X-Gm-Message-State: AGi0PuaRVl53hlLeG9dfiS9xSMjrO5yw95yCa3bQ3mBFjXyY1xBtbPam
 d/q5v/d0HFOcLgWSNoPqJw==
X-Google-Smtp-Source: APiQypIKWxISZggRXNf9Qgesy8hv7Rz5Nq8gj4Eg85zBnsEFCSfC2I3YgukNf8jHIsVnvUdMfFWC6g==
X-Received: by 2002:a9d:2215:: with SMTP id o21mr19219028ota.113.1586891439450; 
 Tue, 14 Apr 2020 12:10:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a13sm2048010otl.55.2020.04.14.12.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:10:38 -0700 (PDT)
Received: (nullmailer pid 5509 invoked by uid 1000);
 Tue, 14 Apr 2020 19:10:37 -0000
Date: Tue, 14 Apr 2020 14:10:37 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/4] dt-bindings: display: add port support to atmel
 lcdc
Message-ID: <20200414191037.GA29184@bogus>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412182012.27515-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 12, 2020 at 08:20:12PM +0200, Sam Ravnborg wrote:
> Update the Atmel LCDC binding to include:
> - pwm. Used for backlight
> - endpoints using port node
>   Used for handle to panel
> - Added wiring property that is used to describe
>   the wiring between the LCDC and the panel
> 
> Existing properties that should not be used in new
> bindings are deprecated.
> 
> Updated example to include the updated way to specify panel etc.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/atmel/lcdc.yaml          | 94 ++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> index 7dcb9a4d5902..b5c2628f7805 100644
> --- a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> +++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> @@ -28,6 +28,7 @@ properties:
>  
>    "#address-cells":
>      const: 1
> +
>    "#size-cells":
>      const: 0
>  
> @@ -43,13 +44,84 @@ properties:
>    lcd-supply:
>      description: Regulator for LCD supply voltage.
>  
> +  "#pwm-cells":
> +    description:
> +      This PWM chip use the default 3 cells bindings
> +      defined in ../../pwm/pwm.yaml.
> +    const: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    maxItems: 2
> +    items:
> +      - const: lcdc_clk
> +      - const: hclk
> +
> +  port@0:

Just 'port' if there's only 1.

> +    type: object
> +    description: Endpoints of the display controller
> +
> +    properties:
> +
> +      reg:
> +        const: 0
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      endpoint@0:

Just 'endpoint' if there's only 1.

> +        type: object
> +        description: endpoint node that include phandle to panel
> +
> +        properties:
> +
> +          reg:
> +            const: 0
> +
> +          wiring:
> +            enum:
> +              - straight
> +              - red-blue-reversed
> +            description: |
> +              The LCDC is based on a blue-green-red configuration but to adapt
> +              to SW only supporting red-green-blue the data lines for red and blue
> +              may be reversed.
> +              See details in: http://ww1.microchip.com/downloads/en/AppNotes/doc6300.pdf
> +              "straight" - default value. Data lines are not reversed, uses BGR
> +              "red-blue-reversed" - red and green are reversed, uses RGB
> +
> +          remote-endpoint:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description:
> +              phandle to the panel node
> +
> +        required:
> +          - reg
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +
> +    additionalProperties: false
> +
>    display:
>      $ref: /schemas/types.yaml#/definitions/phandle
> +    deprecated: true
>      description: phandle to display node
>  
>  patternProperties:
>    "^display[0-9]$":
>      type: object
> +    deprecated: true
>      description: |
>        Display node is required to initialize the lcd panel.
>        This should be in the board dts
> @@ -107,12 +179,32 @@ required:
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
>      fb {
>          compatible = "atmel,at91sam9263-lcdc";
>          reg = <0x00700000 0x1000>;
> -        interrupts = <23 3 0>;
> +        interrupts = <26 IRQ_TYPE_LEVEL_HIGH 3>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_PERIPHERAL 26>;
> +        clock-names = "lcdc_clk", "hclk";
> +
> +        /* pwm for backlight */
> +        #pwm-cells = <3>;
> +
>          #address-cells = <1>;
>          #size-cells = <0>;
> +
> +        port@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            endpoint@0 {
> +                reg = <0>;
> +                wiring = "red-blue-reversed";
> +                remote-endpoint = <&panel_input>;
> +            };
> +        };
>      };
>  
>    - |
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
