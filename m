Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7D5B87D3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 14:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6210E179;
	Wed, 14 Sep 2022 12:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2259110E179
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 12:08:43 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 d25-20020a9d72d9000000b00655d70a1aeaso7087141otk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 05:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=hMLOKeXHOSnfU4zqlH09bFkg9yKTy1Fq4MgQhLwV+DM=;
 b=CRnDzLoYAbF4yNSMGJqL/9Iea0uZX2J69xvWEVZAMuILVG4G0H/ocyLh4JiC3mH4qF
 Xdsy+K8y3i00LRJKd4JyMAAfuom/aZxwLp7GNiHfSCjo95eFf4FbEm+swx/G7uqnZpB9
 oYI4ktls7Rz8jVtdKhpZtBdt201tUnI3z6ARqAlx0oF7+9ppPmeROQf9v/+1ntvc35hK
 pkl43Ktg0AW47F8YlKYow8NU/WAovQCNlwD3w7BQDLyRk3yD1JsbtP5ygKp/etXKPApo
 Hx1aXHyNKOavkDGazbXWJlBP0KDx0wtCcbQWvqjqNIW2zkS3tI7Ba2fvWlcGkKtOuruk
 r8Iw==
X-Gm-Message-State: ACgBeo1NQskdBT7s7n0D6fA7ziUk6kawwFT9kLndTQf92lBngKybt6Uy
 OzraTH8bLcojH9GkwBs+vQ==
X-Google-Smtp-Source: AA6agR4qmKdSRMjr6cCYgddorY7oSjwFoX8ZUGglOu9qJOO8G4H+NFYqgp2cN0UGOoshspqJbqDiNQ==
X-Received: by 2002:a05:6830:6104:b0:654:fb1:faba with SMTP id
 ca4-20020a056830610400b006540fb1fabamr10605314otb.183.1663157322251; 
 Wed, 14 Sep 2022 05:08:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m26-20020a0568301e7a00b006339b36127dsm7172351otr.3.2022.09.14.05.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 05:08:41 -0700 (PDT)
Received: (nullmailer pid 1869045 invoked by uid 1000);
 Wed, 14 Sep 2022 12:08:40 -0000
Date: Wed, 14 Sep 2022 07:08:40 -0500
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v2 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Message-ID: <20220914120840.GA1837218-robh@kernel.org>
References: <20220913131447.2877280-1-cyndis@kapsi.fi>
 <20220913131447.2877280-4-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913131447.2877280-4-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 04:14:41PM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update NVDEC bindings for Tegra234. This new engine version only has
> two memory clients, but now requires three clocks, and as a bigger
> change the engine loads firmware from a secure carveout configured by
> the bootloader.
> 
> For the latter, we need to add a phandle to the memory controller
> to query the location of this carveout, and several other properties
> containing offsets into the firmware inside the carveout. These
> properties are intended to be populated through a device tree overlay
> configured at flashing time, so that the values correspond to the
> flashed NVDEC firmware.
> 
> As the binding was getting large with many conditional properties,
> also split the Tegra234 version out into a separate file.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> - Split out into separate file to avoid complexity with
>   conditionals etc.
> ---
>  .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
> new file mode 100644
> index 000000000000..eab0475ca983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra234 NVDEC
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
> +      - nvidia,tegra234-nvdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: nvdec
> +      - const: fuse
> +      - const: tsec_pka
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
> +      - description: DMA write memory client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +      - const: write
> +
> +  nvidia,memory-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the memory controller for determining carveout information.
> +
> +  nvidia,bl-manifest-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset to bootloader manifest from beginning of firmware. Typically set as
> +      part of a device tree overlay corresponding to flashed firmware.
> +
> +  nvidia,bl-code-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset to bootloader code section from beginning of firmware. Typically set as
> +      part of a device tree overlay corresponding to flashed firmware.
> +
> +  nvidia,bl-data-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset to bootloader data section from beginning of firmware. Typically set as
> +      part of a device tree overlay corresponding to flashed firmware.
> +
> +  nvidia,os-manifest-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset to operating system manifest from beginning of firmware. Typically set as
> +      part of a device tree overlay corresponding to flashed firmware.
> +
> +  nvidia,os-code-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset to operating system code section from beginning of firmware. Typically set as
> +      part of a device tree overlay corresponding to flashed firmware.
> +
> +  nvidia,os-data-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Offset to operating system data section from beginning of firmware. Typically set as
> +      part of a device tree overlay corresponding to flashed firmware.

I don't think DT is the place for describing your runtime loaded 
firmware layout.

Rob
