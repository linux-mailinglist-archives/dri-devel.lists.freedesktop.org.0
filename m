Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44104125471
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 22:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8CB6EA7D;
	Wed, 18 Dec 2019 21:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF94B6EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 21:16:03 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id r27so4161122otc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 13:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VfRpHq+kS/2gCphHVcGTyf5xHe3uvLTiFdpuwlwHK/I=;
 b=d8ro3kzhK/EXpEVWS9hxGpC7TpUFCaWsR7/9SxihYlAbSbqfH7oob7SbQohUyMpUex
 D5CrkKbzkOolsGLghJTrd/nMcTWP2PnsyMM9NjJfg+4rppb4T6UeAWivppBou/MZMOce
 BWzxNEv/8iEF8oRlj5vQOiiISRYzHMt+9INR0vvlBH/p9I6Wym0ghPEs4qn08bERRqIV
 Md5szbd8E1TSq9/Rpj31hqrAMZV8Ng9ycyG/b9/D+fRCXwEwuSTtPX1JJkKT9+dmzOz5
 Tsg1UqO/jheuRCBoA6L/dgwpYqf4ZLI16IMN8QD+K4mubnjNSF+TndZO28SfprA45P73
 Tfew==
X-Gm-Message-State: APjAAAWdoNE2IMZPJcDZcj+O+Ox3Pe4qv4WVBvixlQF3nRHDnbJm1T4B
 IYGv8CQizD6V5J75651oew==
X-Google-Smtp-Source: APXvYqxbO7jTCnsX1zsL+WZp6+wZtSheMGnt7JACGcjSdKYJsIBRWBi5EqsXahLBqZf8vvk48VBQaA==
X-Received: by 2002:a9d:784b:: with SMTP id c11mr4658325otm.246.1576703762925; 
 Wed, 18 Dec 2019 13:16:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q5sm1216343oia.21.2019.12.18.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 13:16:02 -0800 (PST)
Date: Wed, 18 Dec 2019 15:16:01 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination
 GPUs
Message-ID: <20191218211601.GA11411@bogus>
References: <cover.1576605726.git.hns@goldelico.com>
 <aedc895985d966cf709d153d5b0bed07f59bdcfd.1576605726.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aedc895985d966cf709d153d5b0bed07f59bdcfd.1576605726.git.hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, James Hogan <jhogan@kernel.org>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 07:01:59PM +0100, H. Nikolaus Schaller wrote:
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
> and others.
> 
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers, interrupt etc.).
> 
> In most cases, Clock, Reset and power management is handled
> by a parent node or elsewhere.
> 
> Tested by make dt_binding_check dtbs_check

I'm surprised that worked... (Not for long if it did).

> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> new file mode 100644
> index 000000000000..44799774e34d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination PVR/SGX GPU
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description: |+
> +  This binding describes the Imagination SGX5 series of 3D accelerators which
> +  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
> +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> +
> +  For an almost complete list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
> +  
> +  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by
> +  this binding but the extension of the pattern is straightforward.
> +  
> +  The SGX node is usually a child node of some DT node belonging to the SoC
> +  which handles clocks, reset and general address space mapping of the SGX
> +  register area.
> +
> +properties:
> +  compatible:
> +    enum:
> +    # Example: BeagleBoard A/B/C, OpenPandora 600MHz
> +      - ti,omap3-sgx530-121, img,sgx530-121, img,sgx530

Didn't I comment before this is not valid. You are defining the 
compatible string is: 'ti,omap3-sgx530-121, img,sgx530-121, img,sgx530'

You need:

compatible:
  oneOf:
    - description: BeagleBoard A/B/C, OpenPandora 600MHz
      items:
        - const: ti,omap3-sgx530-121
        - const: img,sgx530-121
        - const: img,sgx530

And so on for each of the rest.

> +    # Example: BeagleBoard XM, GTA04, OpenPandora 1GHz
> +      - ti,omap3-sgx530-125, img,sgx530-125, img,sgx530
> +    # Example: BeagleBone Black
> +      - ti,am3352-sgx530-125, img,sgx530-125, img,sgx530

These 2 could be combined using 'enum' for the first item. Basically, 
you can group ones where the last 2 strings are the same.

> +    # Example: Pandaboard, Pandaboard ES
> +      - ti,omap4-sgx540-120, img,sgx540-120, img,sgx540
> +      - ti,omap4-sgx544-112, img,sgx544-112, img,sgx544
> +    # Example: OMAP5 UEVM, Pyra Handheld
> +      - ti,omap5-sgx544-116, img,sgx544-116, img,sgx544
> +      - ti,dra7-sgx544-116, img,sgx544-116, img,sgx544
> +    # Example: CI20
> +      - ingenic,jz4780-sgx540-120, img,sgx540-120, img,sgx540
> +    # the following entries are not validated with real hardware

What am I supposed to do with that? You're just defining some strings. 
If you're not sure they are okay, then don't define them.

> +    # more TI SoC
> +      - ti,am3517-sgx530-125, img,sgx530-125, img,sgx530
> +      - ti,am4-sgx530-125, img,sgx530-125, img,sgx530
> +      - ti,ti81xx-sgx530-125, img,sgx530-125, img,sgx530
> +    # Example: Banana-Pi-M3 (Allwinner A83T)
> +      - allwinner,sun8i-a83t-sgx544-116, img,sgx544-116, img,sgx544
> +    # Example: Atom Z5xx
> +      - intel,poulsbo-gma500-sgx535, img,sgx535-116, img,sgx535
> +    # Example: Atom Z24xx
> +      - intel,medfield-gma-sgx540, img,sgx540-116, img,sgx540
> +    # Example: Atom N2600, D2500
> +      - intel,cedarview-gma3600-sgx545, img,sgx545-116, img,sgx545
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu@fe00 {
> +      compatible = "ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";

Doesn't match the schema.

> +      reg = <0xfe00 0x200>;
> +      interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> -- 
> 2.23.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
