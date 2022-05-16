Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D14F528A7F
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 18:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF6810E1DE;
	Mon, 16 May 2022 16:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48B110FB93
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 16:33:27 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-f16a3e0529so10498049fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 09:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CiuDSc5jE/tQy9qIvLJu2MZL0HMNt8pDPacw0cghyhk=;
 b=Bf+iIh47DxuM7Mgx4SD1VXZKN+WjylM4lcv7C83M+iLqFVqxd8Pe/IZ0CxlEt3U8zQ
 5mimKA7ZxQzMeeJQR+64K37tllXdHdxQqW0Vx/TzpNV1tPDg1PeVd8w5tmD+ewmzI/By
 HG1ITdOeTsWdwLNce0x36Y2JYb55OfBHkovn1Yo2LQdguytZeMmewWlo1qiwfC4kzZSQ
 eO9MmYcIQQWjOHKu94usqVI8KFEokV0uUY78vsV3CJBC/rYVgEOjiay4gXbEAJkbHWVW
 tatFlCZ9Hs0tFDSZw5fJi6CvA1fsKnUqg9eegAC6pjJelGSE2m0evwJ7Kz9lbuq2wp06
 WBcQ==
X-Gm-Message-State: AOAM533h25X6/JCNtkW7LiyF5pkFkduhtC4df4sm1LJTvEKa3B71bicZ
 qV9ahu56ArOmkbShDoNxiA==
X-Google-Smtp-Source: ABdhPJycQNzePEJAzWR0E4hHkTqbdk/jDS1QEhfnLSWiGpLOPMe8c1wY+jAIc2jwGk3JGr3sEYpwMg==
X-Received: by 2002:a05:6870:a1a0:b0:d9:b198:4cfa with SMTP id
 a32-20020a056870a1a000b000d9b1984cfamr10022635oaf.159.1652718806864; 
 Mon, 16 May 2022 09:33:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056870e24800b000eb0e40b4b8sm5829199oac.48.2022.05.16.09.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:33:26 -0700 (PDT)
Received: (nullmailer pid 2801600 invoked by uid 1000);
 Mon, 16 May 2022 16:33:25 -0000
Date: Mon, 16 May 2022 11:33:25 -0500
From: Rob Herring <robh@kernel.org>
To: cyndis@kapsi.fi
Subject: Re: [PATCH v1 01/13] dt-bindings: Add bindings for Tegra234 Host1x
 and VIC
Message-ID: <20220516163325.GA2793304-robh@kernel.org>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-2-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516100213.1536571-2-cyndis@kapsi.fi>
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
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, digetx@gmail.com,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 01:02:01PM +0300, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update VIC and Host1x bindings for changes in Tegra234.
> 
> Namely,
> - New compatible strings
> - Sharded syncpoint interrupts
> - Optional reset.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 108 +++++++++++++++---
>  2 files changed, 95 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> index 37bb5ddc1963..7200095ef19e 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
> @@ -21,6 +21,7 @@ properties:
>            - nvidia,tegra210-vic
>            - nvidia,tegra186-vic
>            - nvidia,tegra194-vic
> +          - nvidia,tegra234-vic
>  
>        - items:
>            - const: nvidia,tegra132-vic
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 0adeb03b9e3a..83c58b7dae98 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -24,6 +24,7 @@ properties:
>            - nvidia,tegra210-host1x
>            - nvidia,tegra186-host1x
>            - nvidia,tegra194-host1x
> +          - nvidia,tegra234-host1x
>  
>        - items:
>            - const: nvidia,tegra132-host1x
> @@ -31,23 +32,19 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>  
>    reg-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>  
>    interrupts:
> -    items:
> -      - description: host1x syncpoint interrupt
> -      - description: host1x general interrupt
>      minItems: 1
> +    maxItems: 9
>  
>    interrupt-names:
> -    items:
> -      - const: syncpt
> -      - const: host1x
>      minItems: 1
> +    maxItems: 9
>  
>    '#address-cells':
>      description: The number of cells used to represent physical base addresses
> @@ -110,13 +107,32 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - resets
> -  - reset-names

Shouldn't these still be required on some platforms?

>  
>  additionalProperties:
>    type: object
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-host1x
> +              - nvidia,tegra30-host1x
> +              - nvidia,tegra114-host1x
> +              - nvidia,tegra124-host1x
> +              - nvidia,tegra210-host1x
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: host1x syncpoint interrupt
> +            - description: host1x general interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: syncpt
> +            - const: host1x
>    - if:
>        properties:
>          compatible:
> @@ -133,10 +149,10 @@ allOf:
>  
>          reg:
>            items:
> -            - description: physical base address and length of the register
> -                region assigned to the VM
>              - description: physical base address and length of the register
>                  region used by the hypervisor
> +            - description: physical base address and length of the register
> +                region assigned to the VM

You can't just change the order at least without a good explanation why 
in the commit message. It's an ABI.

>  
>          resets:
>            maxItems: 1
> @@ -144,6 +160,70 @@ allOf:
>          reset-names:
>            maxItems: 1
>  
> +        interrupts:
> +          items:
> +            - description: host1x syncpoint interrupt
> +            - description: host1x general interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: syncpt
> +            - const: host1x
> +
> +        iommu-map:
> +          description: Specification of stream IDs available for memory context device
> +            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
> +            usable stream IDs.
> +
> +      required:
> +        - reg-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-host1x
> +    then:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: common
> +            - const: hypervisor
> +            - const: vm
> +
> +        reg:
> +          items:
> +            - description: physical base address and length of the register
> +                region used by host1x server
> +            - description: physical base address and length of the register
> +                region used by the hypervisor
> +            - description: physical base address and length of the register
> +                region assigned to the VM

I guess this is just copied, but 'physical base address and length of 
the ' is redundant. That's every 'reg'.

> +
> +        interrupts:
> +          items:
> +            - description: host1x syncpoint interrupt 0
> +            - description: host1x syncpoint interrupt 1
> +            - description: host1x syncpoint interrupt 2
> +            - description: host1x syncpoint interrupt 3
> +            - description: host1x syncpoint interrupt 4
> +            - description: host1x syncpoint interrupt 5
> +            - description: host1x syncpoint interrupt 6
> +            - description: host1x syncpoint interrupt 7
> +            - description: host1x general interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: syncpt0
> +            - const: syncpt1
> +            - const: syncpt2
> +            - const: syncpt3
> +            - const: syncpt4
> +            - const: syncpt5
> +            - const: syncpt6
> +            - const: syncpt7
> +            - const: host1x
> +
>          iommu-map:
>            description: Specification of stream IDs available for memory context device
>              use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
> @@ -160,8 +240,8 @@ examples:
>      host1x@50000000 {
>          compatible = "nvidia,tegra20-host1x";
>          reg = <0x50000000 0x00024000>;
> -        interrupts = <0 65 0x04   /* mpcore syncpt */
> -                      0 67 0x04>; /* mpcore general */
> +        interrupts = <0 65 0x04>, /* mpcore syncpt */
> +                     <0 67 0x04>; /* mpcore general */
>          interrupt-names = "syncpt", "host1x";
>          clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
>          clock-names = "host1x";
> -- 
> 2.36.1
> 
> 
