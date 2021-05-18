Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C75386E50
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 02:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB73A6E563;
	Tue, 18 May 2021 00:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61A96E563
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 00:28:04 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso7177946otn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 17:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R3L7pxt4zbk8yKl/avJfRLABaqdm3QQDGowpbldv5VQ=;
 b=tXZb4Rhg+oAiCNFhk5v40o2WjbSux8oJEIYNncmIHZIEapi0rvCwC62qDV/fdvPIxl
 eUyk+rBZeoUawsnee8UKsk81v63gP+SZz8/vkkgXtp6GLdlUdyvUHA44Rf+R9nnSWOFd
 90AwJGLvaeC1CosguwM2b6cfzihGRWRn/weiT+o38jkTxCli88R3o/fTJsonihDG9RQX
 Iy8BPGvB4NFBt6bvek0blOkjOjf2sSYfZSXl5efoF/SdAelI1rWq7Lw56vKGpWGbKEa8
 1XPVY8WTKA7MlkU884FiObGny4tzhuJudv161dDhO2abkhY0oNvJn6opHeniGGWgfsvZ
 q/QQ==
X-Gm-Message-State: AOAM532ShmUZ9Y/W/lUeATk1ERAJ41mEGV24gsSNEKxgyASsfJwbubqI
 R7E/egLibLbGiFw04W38lA==
X-Google-Smtp-Source: ABdhPJwo+JpfM6jwHe1xxWMB9CadaPmye2HzBZL+6b/BqkSpJkZUqJ2uC/RTySA+qewzrquRUK9mQw==
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr1918550otp.34.1621297684104; 
 Mon, 17 May 2021 17:28:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y44sm3421102ooi.0.2021.05.17.17.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 17:26:43 -0700 (PDT)
Received: (nullmailer pid 3503561 invoked by uid 1000);
 Tue, 18 May 2021 00:26:24 -0000
Date: Mon, 17 May 2021 19:26:24 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH] dt-bindings: display: convert faraday,tve200 to YAML
Message-ID: <20210518002624.GA3346846@robh.at.kernel.org>
References: <20210511165448.422987-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511165448.422987-1-clabbe@baylibre.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 04:54:48PM +0000, Corentin Labbe wrote:
> Converts display/faraday,tve200.txt to yaml.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/display/faraday,tve200.txt       | 54 -----------
>  .../bindings/display/faraday,tve200.yaml      | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.txt
>  create mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.txt b/Documentation/devicetree/bindings/display/faraday,tve200.txt
> deleted file mode 100644
> index 82e3bc0b7485..000000000000
> --- a/Documentation/devicetree/bindings/display/faraday,tve200.txt
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -* Faraday TV Encoder TVE200
> -
> -Required properties:
> -
> -- compatible: must be one of:
> -	"faraday,tve200"
> -	"cortina,gemini-tvc", "faraday,tve200"
> -
> -- reg: base address and size of the control registers block
> -
> -- interrupts: contains an interrupt specifier for the interrupt
> -	line from the TVE200
> -
> -- clock-names: should contain "PCLK" for the clock line clocking the
> -	silicon and "TVE" for the 27MHz clock to the video driver
> -
> -- clocks: contains phandle and clock specifier pairs for the entries
> -	in the clock-names property. See
> -	Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Optional properties:
> -
> -- resets: contains the reset line phandle for the block
> -
> -Required sub-nodes:
> -
> -- port: describes LCD panel signals, following the common binding
> -	for video transmitter interfaces; see
> -	Documentation/devicetree/bindings/media/video-interfaces.txt
> -	This port should have the properties:
> -	reg = <0>;
> -	It should have one endpoint connected to a remote endpoint where
> -	the display is connected.
> -
> -Example:
> -
> -display-controller@6a000000 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	compatible = "faraday,tve200";
> -	reg = <0x6a000000 0x1000>;
> -	interrupts = <13 IRQ_TYPE_EDGE_RISING>;
> -	resets = <&syscon GEMINI_RESET_TVC>;
> -	clocks = <&syscon GEMINI_CLK_GATE_TVC>,
> -		 <&syscon GEMINI_CLK_TVC>;
> -	clock-names = "PCLK", "TVE";
> -
> -	port@0 {
> -		reg = <0>;
> -		display_out: endpoint {
> -			remote-endpoint = <&panel_in>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.yaml b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
> new file mode 100644
> index 000000000000..3ab51e7e72af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/faraday,tve200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Faraday TV Encoder TVE200
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: faraday,tve200
> +      - items:
> +          - const: cortina,gemini-tvc
> +          - const: faraday,tve200
> +
> +  reg:
> +    minItems: 1

maxItems: 1

They evaluate the same, but maxItems seems a bit more logical. 

> +
> +  interrupts:
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: PCLK
> +      - const: TVE
> +
> +  clocks:
> +    minItems: 2
> +
> +  resets:
> +    minItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^port@[0-9]+$":

Should be just 'port' or 'port@0', but really the former is preferred 
when only 1. 

Use the graph binding:

$ref: /schemas/graph.yaml#/properties/port

> +    type: object
> +    description: describes LCD panel signals, following the common binding

But this is not an LCD panel...

> +      for video transmitter interfaces; see
> +      Documentation/devicetree/bindings/media/video-interfaces.txt

Drop this reference. It's now a schema, but this isn't using anything 
from it.

> +      It should have one endpoint connected to a remote endpoint where
> +      the display is connected.
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cortina,gemini-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/cortina,gemini-reset.h>
> +    display-controller@6a000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "faraday,tve200";
> +      reg = <0x6a000000 0x1000>;
> +      interrupts = <13 IRQ_TYPE_EDGE_RISING>;
> +      resets = <&syscon GEMINI_RESET_TVC>;
> +      clocks = <&syscon GEMINI_CLK_GATE_TVC>,
> +               <&syscon GEMINI_CLK_TVC>;
> +      clock-names = "PCLK", "TVE";
> +
> +      port@0 {
> +        reg = <0>;
> +        display_out: endpoint {
> +          remote-endpoint = <&panel_in>;
> +        };
> +      };
> +    };
> -- 
> 2.26.3
> 
