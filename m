Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D331E19C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 22:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EC06E7E2;
	Wed, 17 Feb 2021 21:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867AB6E7E2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 21:49:38 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id s6so69302otk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 13:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MQrhHntybbtOQIKdhkyNrYB4LvfyYJUtAAIM+y9Y6O0=;
 b=jrCAf2er/SWnHDFisYr9oF/0qLa63LPeZXrW1qzp56gFHXsvryjFFE0ioHj6k2IVqQ
 f6T8yaV3LP9LE0UbC8DAQvwO6w3wy9rtewTD6xnlqP7TSi+zcvjC2BFs7owpkooqksIW
 +iGrUnsKzi8GRroFx1BkdXNXCAYD1f/AiSfY20V+yaFEFUXxh7cSa2VLqP7e+M8WerGa
 t6s4gx3GfDUqek3Xt2wVMtascPcUOZ/1mAON8psrFCTft8J+IG79rkmdxoPHxZ14d2l0
 //GPgqlqa5HLHTi63yqtcIHHuRpEfDoW6YHnJ3+QIMe8cdlmcjz2ZZacN+em02PPzxAo
 43yQ==
X-Gm-Message-State: AOAM533ZISpe/voF9jot8IYQU5kUkx/RnoTpynjEvMhFqvjPCtePzaV7
 7/PqZc95Nl0bMLb2S+LrTlLeTWn2sA==
X-Google-Smtp-Source: ABdhPJyy9LuosTQc8qqTn7CCNW/STJlhzgJMf7ZKV8dapt/QrGMd95d2GdEVysk3/ifTrUEUBO5Z6Q==
X-Received: by 2002:a9d:6086:: with SMTP id m6mr833839otj.340.1613598577685;
 Wed, 17 Feb 2021 13:49:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s2sm619829ooc.5.2021.02.17.13.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 13:49:36 -0800 (PST)
Received: (nullmailer pid 2831317 invoked by uid 1000);
 Wed, 17 Feb 2021 21:49:35 -0000
Date: Wed, 17 Feb 2021 15:49:35 -0600
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
Message-ID: <20210217214935.GA2804400@robh.at.kernel.org>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <20210213101512.3275069-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210213101512.3275069-2-mperttunen@nvidia.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 13, 2021 at 12:15:10PM +0200, Mikko Perttunen wrote:
> Convert the original Host1x bindings to YAML and add new bindings for
> NVDEC, now in a more appropriate location. The old text bindings
> for Host1x and engines are still kept at display/tegra/ since they
> encompass a lot more engines that haven't been converted over yet.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> new file mode 100644
> index 000000000000..613c6601f0f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra20-host1x.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Host1x
> +
> +maintainers:
> +  - Thierry Reding <treding@gmail.com>
> +  - Mikko Perttunen <mperttunen@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^host1x@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra20-host1x
> +      - const: nvidia,tegra30-host1x
> +      - const: nvidia,tegra114-host1x
> +      - const: nvidia,tegra124-host1x
> +      - items:
> +          - const: nvidia,tegra132-host1x
> +          - const: nvidia,tegra124-host1x
> +      - const: nvidia,tegra210-host1x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Syncpoint threshold interrupt
> +      - description: General interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: syncpt
> +      - const: host1x
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: host1x
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: host1x
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +
> +additionalProperties:
> +  type: object
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        anyOf:
> +          - const: nvidia,tegra186-host1x
> +          - const: nvidia,tegra194-host1x

Just use 'enum' instead of 'anyOf' and 'const'.

> +then:
> +  properties:
> +    reg:
> +      items:
> +        - description: Hypervisor-accessible register area
> +        - description: VM-accessible register area

If you test this, it will fail due to the 'maxItems: 1' above. The main 
section has to pass for all conditions and then if/them schema add 
constraints.

> +    reg-names:
> +      items:
> +        - const: hypervisor
> +        - const: vm
> +  required:
> +    - reg-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    host1x@50000000 {
> +        compatible = "nvidia,tegra20-host1x";
> +        reg = <0x50000000 0x00024000>;
> +        interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
> +                      <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
> +        interrupt-names = "syncpt", "host1x";
> +        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
> +        clock-names = "host1x";
> +        resets = <&tegra_car 28>;
> +        reset-names = "host1x";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        ranges = <0x54000000 0x54000000 0x04000000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> new file mode 100644
> index 000000000000..9a6334d930c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra VIC

I'm left wondering what NVDEC and VIC are?

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
> +      - description: DMA write memory client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    nvdec@15480000 {
> +            compatible = "nvidia,tegra186-nvdec";
> +            reg = <0x15480000 0x40000>;
> +            clocks = <&bpmp TEGRA186_CLK_NVDEC>;
> +            clock-names = "nvdec";
> +            resets = <&bpmp TEGRA186_RESET_NVDEC>;
> +            reset-names = "nvdec";
> +
> +            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
> +            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
> +                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
> +            interconnect-names = "dma-mem", "write";
> +            iommus = <&smmu TEGRA186_SID_NVDEC>;
> +    };
> +
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8170b40d6236..b892419c6564 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5950,6 +5950,7 @@ L:	linux-tegra@vger.kernel.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/tegra/linux.git
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +F:	Documentation/devicetree/bindings/gpu/host1x/
>  F:	drivers/gpu/drm/tegra/
>  F:	drivers/gpu/host1x/
>  F:	include/linux/host1x.h
> -- 
> 2.30.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
