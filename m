Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6223140B343
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAD06E50E;
	Tue, 14 Sep 2021 15:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338656E517
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:39:52 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id w144so19531521oie.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pytaBeGbluvK54KH1JDN0ESm8pJSOqwJ8yT+Ker1A6w=;
 b=OlBm8gDx0hqcGC1NNj5KDfbEL+2DqgekBt8dkheoIydfOs7HUplSChzhGkUF1GfBRq
 61/IvWnLTOpPN869IHa1Fif1uQJp07p3l/4j6C2j8uRHK9fuw00uLv/mJwBkQQH5SblX
 8i3frvSGZ3WszrQMGO1nRzNnXcUT9rwKZ9lDQN/avEStkZfo0C3XUU2xnBFGCJ+vD57y
 U/Vnd8EpacRscOZsPUmUOJyoJ3jZjmGRDtDeV76wvwnBBuUR/uxDKYE4rHMF/mZuea8X
 jXzMkT4iYX/kI6P7EL86xJq6xnU1Peul8Sv//Af98RpZl0ulvvZCKQRzqScu08lreoXy
 gCNw==
X-Gm-Message-State: AOAM530s/0tlpKk79wIV+0ncAkGpqYuWHDDMVmwTDlZCcrQ8IeEwWX2L
 xSLfxFMKgyep06yfiIQ1vA==
X-Google-Smtp-Source: ABdhPJzVFOZqi98MrTq7YmWqyehx/3UeShkeAOC/YJdLh4OxDeJKN67Sh0NUcHVM1M6Q5MBJQclOFg==
X-Received: by 2002:a54:4383:: with SMTP id u3mr1830193oiv.149.1631633991440; 
 Tue, 14 Sep 2021 08:39:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r31sm2735905otv.45.2021.09.14.08.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 08:39:50 -0700 (PDT)
Received: (nullmailer pid 3404699 invoked by uid 1000);
 Tue, 14 Sep 2021 15:39:49 -0000
Date: Tue, 14 Sep 2021 10:39:49 -0500
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YUDCRb75pIqGZX1S@robh.at.kernel.org>
References: <20210910104247.1206716-1-mperttunen@nvidia.com>
 <20210910104247.1206716-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910104247.1206716-2-mperttunen@nvidia.com>
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

On Fri, Sep 10, 2021 at 01:42:45PM +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> new file mode 100644
> index 000000000000..f1f8d083d736
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -0,0 +1,104 @@
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
> +  dma-coherent: true
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
> +  nvidia,host1x-class:
> +    description: Host1x class of the engine. If not specified, defaults to 0xf0.

Define what this is with more than just repeating what is in the 
property name.

> +    $ref: /schemas/types.yaml#/definitions/uint32

default: 0xf0

Is there a range or set of valid values you specify as schema?

Rob
