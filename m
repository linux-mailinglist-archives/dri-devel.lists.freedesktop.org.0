Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014416EDEF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587F6EB82;
	Tue, 25 Feb 2020 18:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE496EB82
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:24:12 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id r137so270785oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zyUEcnd6mf3xDLs58H/+znKVsIUHaN8BT7T15bn5I/4=;
 b=qYOJgcL5UL1iOHju5MCWeMLiK+uSvnW4gW9Iv1Cl1Nwd/xsoUAtPl/wxuj3xXTe+0w
 /iBbi/7vHI7q66lRTjfX2wqE3qTi4ITJevKM4XOM1jcm4PoXA7fZ9ZgG7xidd+TWkKes
 Jr9zgPJp3Kq0ecXvbpQpgI8she/3NN6/xh+lKR7QO+z2wniyT/FKHkA/01R8LERBR+x0
 v0Rk9w/asrtL6UYsi0Ojqv7EycvyOMoF+7JYv2fRDdZe10eAScUVM/YLn9doJteG1Miz
 IEeqZZCdFfmatp6e7kkCtsey9T/g+kTeUDoPr3AtGdsTz6sy/ny3D8jIhq/xwBOZUz0V
 43CQ==
X-Gm-Message-State: APjAAAV4NYWNaJdjCC2YTd+r0iZJIbprrExofwrWfxMz0qV85kcRsCYZ
 RKbxWm88qzqZCV9MELRz1U5T9rI=
X-Google-Smtp-Source: APXvYqy2YFi/Z/AQYaFr+0YJAOKBBXw2YKbb14sGV3IuzdQIEB+ZE6Mmn4i6K3FgKLi1IMdYd8+R/w==
X-Received: by 2002:a05:6808:251:: with SMTP id
 m17mr190704oie.15.1582655052039; 
 Tue, 25 Feb 2020 10:24:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n27sm5572706oie.18.2020.02.25.10.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:24:11 -0800 (PST)
Received: (nullmailer pid 14462 invoked by uid 1000);
 Tue, 25 Feb 2020 18:24:10 -0000
Date: Tue, 25 Feb 2020 12:24:10 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 88/89] dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI
 controllers bindings
Message-ID: <20200225182410.GA7661@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <4c21dda4f0b73977de1e54d408d7bf6bf3b6d238.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c21dda4f0b73977de1e54d408d7bf6bf3b6d238.1582533919.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 10:07:30AM +0100, Maxime Ripard wrote:
> The HDMI controllers found in the BCM2711 SoC need some adjustments to the
> bindings, especially since the registers have been shuffled around in more
> register ranges.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml | 118 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 109 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
> index 52b3cdac0bdf..a9d24e1cf684 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
> @@ -11,24 +11,58 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: brcm,bcm2835-hdmi
> +    enum:
> +      - brcm,bcm2835-hdmi
> +      - brcm,bcm2711-hdmi0
> +      - brcm,bcm2711-hdmi1
>  
>    reg:
> +    oneOf:
> +      - items:
> +        - description: HDMI register range
> +        - description: HD register range
> +
> +      - items:
> +        - description: HDMI controller register range
> +        - description: DVP register range
> +        - description: HDMI PHY register range
> +        - description: Rate Manager register range
> +        - description: Packet RAM register range
> +        - description: Metadata RAM register range
> +        - description: CSC register range
> +        - description: CEC register range
> +        - description: HD register range
> +
> +  reg-names:
>      items:
> -      - description: HDMI register range
> -      - description: HD register range
> +      - const: hdmi
> +      - const: dvp
> +      - const: phy
> +      - const: rm
> +      - const: packet
> +      - const: metadata
> +      - const: csc
> +      - const: cec
> +      - const: hd

Don't you want 'hd' 2nd or need to define the 2 entry case separately?

Really, I think this should be 2 files. All but interrupts and ddc have 
a difference.

>  
>    interrupts:
>      minItems: 2
>  
>    clocks:
> -    items:
> -      - description: The pixel clock
> -      - description: The HDMI state machine clock
> +    oneOf:
> +      - items:
> +        - description: The pixel clock
> +        - description: The HDMI state machine clock
> +
> +      - items:
> +        - description: The HDMI state machine clock
>  
>    clock-names:
> -    items:
> -      - const: pixel
> +    oneOf:
> +      - items:
> +        - const: pixel
> +        - const: hdmi
> +
>        - const: hdmi
>  
>    ddc:
> @@ -51,15 +85,54 @@ properties:
>    dma-names:
>      const: audio-rx
>  
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> -  - interrupts
>    - clocks
>    - ddc
>  
>  additionalProperties: false
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - brcm,bcm2711-hdmi0
> +          - brcm,bcm2711-hdmi1
> +
> +then:
> +  properties:
> +    reg:
> +      minItems: 9
> +
> +    clocks:
> +      maxItems: 1
> +
> +    clock-names:
> +      maxItems: 1
> +
> +  required:
> +    - reg-names
> +    - resets
> +
> +else:
> +  properties:
> +    reg:
> +      maxItems: 2
> +
> +    clocks:
> +      minItems: 2
> +
> +    clock-names:
> +      minItems: 2
> +
> +  required:
> +    - interrupts
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/bcm2835.h>
> @@ -77,4 +150,31 @@ examples:
>          clock-names = "pixel", "hdmi";
>      };
>  
> +  - |
> +    hdmi0: hdmi@7ef00700 {
> +        compatible = "brcm,bcm2711-hdmi0";
> +        reg = <0x7ef00700 0x300>,
> +              <0x7ef00300 0x200>,
> +              <0x7ef00f00 0x80>,
> +              <0x7ef00f80 0x80>,
> +              <0x7ef01b00 0x200>,
> +              <0x7ef01f00 0x400>,
> +              <0x7ef00200 0x80>,
> +              <0x7ef04300 0x100>,
> +              <0x7ef20000 0x100>;
> +        reg-names = "hdmi",
> +                    "dvp",
> +                    "phy",
> +                    "rm",
> +                    "packet",
> +                    "metadata",
> +                    "csc",
> +                    "cec",
> +                    "hd";
> +        clocks = <&firmware_clocks 13>;
> +        clock-names = "hdmi";
> +        resets = <&dvp 0>;
> +        ddc = <&ddc0>;
> +    };
> +
>  ...
> -- 
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
