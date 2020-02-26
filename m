Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91E170478
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 17:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FA26EA93;
	Wed, 26 Feb 2020 16:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BD06E406;
 Wed, 26 Feb 2020 16:33:44 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i6so3512986otr.7;
 Wed, 26 Feb 2020 08:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lbFvo5HuT3obVT0xk8fNIbu0p3dI4t+br6icB8M92zo=;
 b=QS3xA37vp+lavZ3vht6pr6uxXsbhmJQenBcHmbzpaMIpsmTTM4MvzZ2lpFuwl9ZXEd
 uRKdkaU8oBalZT0pKX7arH1uXoFIHhtE1Sn0wO+3OdB/5o92p1FM9dK2b2ZLmSsfODct
 ipYDzbonuyQMnHRCE7eyWk8lRkEExaNa03lGV9jXQjmeWFZyez0XvPP9wmChhxp4LvQG
 hjx10JV9t8BA+wqhO8VUekVNaFgqmFJ6FdQrcRw1iwLn7JO7/SsBuYgX0HnfLApaPysN
 PjACURkUKXtuH4HIC6JHyJBukjqBRd1xhx/1v+xoRkjI7fw4LVvEHPjrHUcslmAgZ4Ci
 DJgg==
X-Gm-Message-State: APjAAAVyX7fRoLAjkWlHG+2sxwBOnzw+qZqdv2pCIIqmLVJwxeVZFmNw
 Odm09HJMGjZYmxNTbPxDcA==
X-Google-Smtp-Source: APXvYqxAh2WjxmOlqFeKqAx/quOrMLgdoA8tQvbTL8tmC9NEpFZlnmrg8hnVq+U0peeFAT+su5Ug4A==
X-Received: by 2002:a9d:7c95:: with SMTP id q21mr1668568otn.278.1582734823559; 
 Wed, 26 Feb 2020 08:33:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm970117oib.42.2020.02.26.08.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 08:33:42 -0800 (PST)
Received: (nullmailer pid 30554 invoked by uid 1000);
 Wed, 26 Feb 2020 16:33:42 -0000
Date: Wed, 26 Feb 2020 10:33:42 -0600
From: Rob Herring <robh@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: msm: Convert GMU bindings
 to YAML
Message-ID: <20200226163342.GA26694@bogus>
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
 <1582223216-23459-2-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582223216-23459-2-git-send-email-jcrouse@codeaurora.org>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 smasetty@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 11:26:53AM -0700, Jordan Crouse wrote:
> Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> text bindings.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  .../devicetree/bindings/display/msm/gmu.txt        | 116 ------------------
>  .../devicetree/bindings/display/msm/gmu.yaml       | 130 +++++++++++++++++++++
>  2 files changed, 130 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml


> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> new file mode 100644
> index 0000000..776ff92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright 2019-2020, The Linux Foundation, All Rights Reserved
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/display/msm/gmu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Devicetree bindings for the GMU attached to certain Adreno GPUs
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  These bindings describe the Graphics Management Unit (GMU) that is attached
> +  to members of the Adreno A6xx GPU family. The GMU provides on-device power
> +  management and support to improve power efficiency and reduce the load on
> +  the CPU.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,adreno-gmu-630.2
> +      - const: qcom,adreno-gmu
> +
> +  reg:
> +    items:
> +      - description: Core GMU registers
> +      - description: GMU PDC registers
> +      - description: GMU PDC sequence registers
> +
> +  reg-names:
> +    items:
> +      - const: gmu
> +      - const: gmu_pdc
> +      - const: gmu_pdc_seq
> +
> +  clocks:
> +    items:
> +     - description: GMU clock
> +     - description: GPU CX clock
> +     - description: GPU AXI clock
> +     - description: GPU MEMNOC clock
> +
> +  clock-names:
> +    items:
> +      - const: gmu
> +      - const: cxo
> +      - const: axi
> +      - const: memnoc
> +
> +  interrupts:
> +    items:
> +     - description: GMU HFI interrupt
> +     - description: GMU interrupt
> +
> +
> +  interrupt-names:
> +    items:
> +      - const: hfi
> +      - const: gmu
> +
> +  power-domains:
> +     items:
> +       - description: CX power domain
> +       - description: GX power domain
> +
> +  power-domain-names:
> +     items:
> +       - const: cx
> +       - const: gx
> +
> +  iommus:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. Just need to define how many entries (maxItems).

> +    description:
> +       Phandle to a IOMMU device and stream ID. Refer to ../../iommu/iommu.txt
> +       for more information.

Drop. That's all iommus entries.

> +
> +  operating-points-v2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the OPP table for the available GMU frequencies. Refer to
> +      ../../opp/opp.txt for more information.

Just 'true' is enough here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - power-domains
> +  - power-domain-names
> +  - iommus
> +  - operating-points-v2
> +
> +examples:
> + - |
> +   #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
> +   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +   #include <dt-bindings/interrupt-controller/irq.h>
> +   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +   gmu: gmu@506a000 {
> +        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
> +
> +        reg = <0x506a000 0x30000>,
> +              <0xb280000 0x10000>,
> +              <0xb480000 0x10000>;
> +        reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> +
> +        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +                 <&gpucc GPU_CC_CXO_CLK>,
> +                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +        clock-names = "gmu", "cxo", "axi", "memnoc";
> +
> +        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "hfi", "gmu";
> +
> +        power-domains = <&gpucc GPU_CX_GDSC>,
> +                        <&gpucc GPU_GX_GDSC>;
> +        power-domain-names = "cx", "gx";
> +
> +        iommus = <&adreno_smmu 5>;
> +        operating-points-v2 = <&gmu_opp_table>;
> +   };
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
