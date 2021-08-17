Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B231C3EF4D1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 23:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4C56E243;
	Tue, 17 Aug 2021 21:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E366E243
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 21:20:43 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id w6so1167999oiv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eCXPgeE54uSJrkBMXZBCaQAwfnK0FBzk/itLBzBmeoc=;
 b=Ib4maw+CbZ/Gs4IdYz6xmFJW9MQyMF0LhtMUmRkZCs7UR4crGjigPgF9UBBhgmO7GF
 v90O7Iazaazud0hEjEuift3uHouZPaRlSpmss0VSL2NGzqqRJ+J1okT4klZDGDVSGBHQ
 8KzRV26t80Z9XiAdUvTFHI+dZf5GrBSPcBqez8HncneGTgAGDAm7L5PFVNZI6gFgJKk1
 23yLam97RnQFI48hZjmwCFdxJxiUWR15oTbxX+C8HXpbnk5OM2sh1FFlAiwihS9hTths
 ARTTpd3Y0Zy7/nfummnF8KjWbJJ1V89GVF5ckW6H01AEyY7E0pr9dWttsMC5Db6rFJe7
 or1w==
X-Gm-Message-State: AOAM532rGck6YxKBEhk/V0aPAU0N2IzcvWbUBlL6ecI0TVT6Jq+ReTMb
 XX891vfmjLx3Dk2cFrkYEg==
X-Google-Smtp-Source: ABdhPJxGcmgNfXGXRqvUVG0Uxf3PdVGDZR7OfnAFYrzZW6zrd13jd0hXY5ZwFvAsIMGi3LjuIiuFgg==
X-Received: by 2002:a05:6808:20e:: with SMTP id
 l14mr4087131oie.87.1629235242406; 
 Tue, 17 Aug 2021 14:20:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y138sm732191oie.22.2021.08.17.14.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:20:42 -0700 (PDT)
Received: (nullmailer pid 860581 invoked by uid 1000);
 Tue, 17 Aug 2021 21:20:41 -0000
Date: Tue, 17 Aug 2021 16:20:41 -0500
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YRwoKW4nOc52MAQV@robh.at.kernel.org>
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
 <20210811105030.3458521-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811105030.3458521-2-mperttunen@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 11, 2021 at 01:50:28PM +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> new file mode 100644
> index 000000000000..571849625da8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra NVDEC
> +
> +description: |
> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> +  and newer chips. It is located on the Host1x bus and typically
> +  programmed through Host1x channels.
> +
> +maintainers:
> +  - Thierry Reding <treding@gmail.com>
> +  - Mikko Perttunen <mperttunen@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^nvdec@[0-9a-f]*$"
> +
> +  compatible:
> +    enum:
> +      - nvidia,tegra210-nvdec
> +      - nvidia,tegra186-nvdec
> +      - nvidia,tegra194-nvdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nvdec
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: nvdec
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: DMA read memory client
> +      - description: DMA read 2 memory client
> +      - description: DMA write memory client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +      - const: read-1
> +      - const: write
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nvidia,tegra194-host1x

host1x? This will never be true as the schema is only applied to nodes 
with the nvdec compatible.

> +then:
> +  properties:
> +    nvidia,instance:
> +      items:
> +        - description: 0 for NVDEC0, or 1 for NVDEC1

What's this for? We generally don't do indices in DT.

> +
> +additionalProperties: true

This should be false or 'unevaluatedProperties: false'

Rob
