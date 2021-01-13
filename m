Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F421A2F4EE7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 16:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222246EACF;
	Wed, 13 Jan 2021 15:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6696EACF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:37:23 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id s19so618933oos.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 07:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5kG+UaHsX0V2DzmZsJoGVERE52cozjiwmwEVWUmr6BI=;
 b=OO8kvgUV4pYuvO95XjVBCegWk4zB0o8f3WNuWE/JdQank/DEMMRITiyMJT+97q6XUM
 M+1f3i3cFZYLrLI7n+4ItY0er4XVqgHzr6IIP592KzKQgQ+iFnmPTFowh3iNq2ZGDXW0
 3oiy45RwuCT594iItAMWEGs8BjMKTpkvrfgTUE6Sn+ULPiom6kXchuVMKyKIkpyaAQ4J
 M+QaAoJCTAzYLxJzws4PZigc6GDNE+/hGI5GUbw1jYgd5krVxM+WHIgNPKpWaUHaxTMz
 3CMmINeClyJaUJjggWTqYaquMtvwKghkuNrzC+DulpceTSCSyDXU314QGGCpy+BOELg3
 YPCg==
X-Gm-Message-State: AOAM532HsqUvvkKjaSNrsEidEtRGavEaFSP1t8jVI0UyFQgtqCyAoOhg
 Yv/wdP4h8zuyxETqUbEob69ydoNzdQ==
X-Google-Smtp-Source: ABdhPJz9xwVKMJuGX/FtAZ5bpt3tFVGkkyKSZAa9e6zltw1cl6vr7ZrxhX4LFcwReYcQSRExztNTvQ==
X-Received: by 2002:a4a:e8d1:: with SMTP id h17mr1609987ooe.71.1610552242970; 
 Wed, 13 Jan 2021 07:37:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p132sm439131oia.41.2021.01.13.07.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:37:22 -0800 (PST)
Received: (nullmailer pid 2494140 invoked by uid 1000);
 Wed, 13 Jan 2021 15:37:21 -0000
Date: Wed, 13 Jan 2021 09:37:21 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V3] dt-bindings: gpu: Convert v3d to json-schema
Message-ID: <20210113153721.GA2483761@robh.at.kernel.org>
References: <1610189433-29985-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610189433-29985-1-git-send-email-stefan.wahren@i2se.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 09, 2021 at 11:50:32AM +0100, Stefan Wahren wrote:
> This converts the v3d bindings to yaml format.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
> 
> Changes in V3:
> - drop redundant maxItems in case we already have items defined
> - fix order of reg-names enum
> - tag required items in description
> - add reg-names to required properties
> - drop clock-names
> 
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> deleted file mode 100644
> index b2df82b..0000000
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Broadcom V3D GPU
> -
> -Only the Broadcom V3D 3.x and newer GPUs are covered by this binding.
> -For V3D 2.x, see brcm,bcm-vc4.txt.
> -
> -Required properties:
> -- compatible:	Should be "brcm,7268-v3d" or "brcm,7278-v3d"
> -- reg:		Physical base addresses and lengths of the register areas
> -- reg-names:	Names for the register areas.  The "hub" and "core0"
> -		  register areas are always required.  The "gca" register area
> -		  is required if the GCA cache controller is present.  The
> -		  "bridge" register area is required if an external reset
> -		  controller is not present.
> -- interrupts:	The interrupt numbers.  The first interrupt is for the hub,
> -		  while the following interrupts are separate interrupt lines
> -		  for the cores (if they don't share the hub's interrupt).
> -		  See bindings/interrupt-controller/interrupts.txt
> -
> -Optional properties:
> -- clocks:	The core clock the unit runs on
> -- resets:	The reset line for v3d, if not using a mapping of the bridge
> -		  See bindings/reset/reset.txt
> -
> -v3d {
> -	compatible = "brcm,7268-v3d";
> -	reg = <0xf1204000 0x100>,
> -	      <0xf1200000 0x4000>,
> -	      <0xf1208000 0x4000>,
> -	      <0xf1204100 0x100>;
> -	reg-names = "bridge", "hub", "core0", "gca";
> -	interrupts = <0 78 4>,
> -		     <0 77 4>;
> -};
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> new file mode 100644
> index 0000000..3b543d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/brcm,bcm-v3d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom V3D GPU Bindings
> +
> +maintainers:
> +  - Eric Anholt <eric@anholt.net>
> +  - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - brcm,7268-v3d
> +      - brcm,7278-v3d
> +
> +  reg:
> +    items:
> +      - description: hub register (required)
> +      - description: core0 register (required)
> +      - description: GCA cache controller register (if GCA controller present)
> +      - description: bridge register (if no external reset controller)
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      enum: [ hub, core0, bridge, gca ]

Need to define the order at least for the required ones:

items:
  - const: hub
  - const: core0
  - enum: [ bridge, gca ]
  - enum: [ bridge, gca ]

If you have dts files that are different, then fix them. 

> +    minItems: 2
> +    maxItems: 4
> +
> +  interrupts:
> +    items:
> +      - description: hub interrupt (required)
> +      - description: core interrupts (if it doesn't share the hub's interrupt)
> +    minItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpu@f1200000 {
> +      compatible = "brcm,7268-v3d";
> +      reg = <0xf1204000 0x100>,
> +            <0xf1200000 0x4000>,
> +            <0xf1208000 0x4000>,
> +            <0xf1204100 0x100>;
> +      reg-names = "bridge", "hub", "core0", "gca";
> +      interrupts = <0 78 4>,
> +                   <0 77 4>;
> +    };
> +
> +...
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
