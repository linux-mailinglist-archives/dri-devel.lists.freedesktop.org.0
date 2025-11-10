Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E741C45412
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0C110E2E4;
	Mon, 10 Nov 2025 07:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="saykSZDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C057A10E2E4;
 Mon, 10 Nov 2025 07:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0783B6013A;
 Mon, 10 Nov 2025 07:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F6AC19422;
 Mon, 10 Nov 2025 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762761093;
 bh=bApvZHKXsJmb8jKSRYJlnAZDkVWRrU6RYJOz67z8jh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=saykSZDddicJyqUayksM7BoUv/MK95zjeR+7tr7lepP5DNlF+8M7k76jyVEGNuuIF
 PH+4nK87M6C9hxH0MZsZml5b6PAf0bkfVXchXFWsYbkKU3o4shP/2dvCQM815j+KQ7
 4cHzbWYiT2iNjNkvi1tfSS9VXtFk2Noc9euXitXDf/SmcidC6JyOSwHwXjI4qxxQyz
 gvYJvNYgPbIigPqH7hsHDNpBDe9B/ypU5QZmBhrRnU3Lk90DGcXXlNSHmEaCv7WrDb
 TP3KusXOBuLV40OUaofnGIys5cnu0v9QugmEnJoXNw5PLJyESMoNUV6Qs+sV1gkVS/
 AaD0zOawyRd1A==
Date: Mon, 10 Nov 2025 08:51:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
Message-ID: <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
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

On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> support. Compared to GMU, it doesn't manage GPU clock, voltage
> scaling, bw voting or any other functionalities. All it does is detect
> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> it doesn't require iommu.
> 
> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
> schema.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 132 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
> new file mode 100644
> index 000000000000..7621556477d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml

Filename matching compatible, so qcom,adreno-rgmu.yaml


> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RGMU attached to certain Adreno GPUs
> +
> +maintainers:
> +  - Rob Clark <robin.clark@oss.qualcomm.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
> +  belong to Adreno A6xx family. It is a small state machine that helps to
> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
> +  power.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,adreno-rgmu-612.0
> +      - const: qcom,adreno-rgmu
> +
> +  reg:
> +    items:
> +      - description: Core RGMU registers
> +
> +  reg-names:
> +    items:
> +      - const: gmu

Drop reg-names, useless for one entry with same name as the block name.

> +
> +  clocks:
> +    items:
> +      - description: GMU clock
> +      - description: GPU CX clock
> +      - description: GPU AXI clock
> +      - description: GPU MEMNOC clock
> +      - description: GPU SMMU vote clock
> +
> +  clock-names:
> +    items:
> +      - const: gmu
> +      - const: cxo
> +      - const: axi
> +      - const: memnoc
> +      - const: smmu_vote
> +
> +  power-domains:
> +    items:
> +      - description: CX GDSC power domain
> +      - description: GX GDSC power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: gx
> +
> +  interrupts:
> +    items:
> +      - description: GMU OOB interrupt
> +      - description: GMU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: oob
> +      - const: gmu
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +required:

compatible

> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - interrupts
> +  - interrupt-names

Keep the same order as in properties.

> +  - operating-points-v2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    rgmu: rgmu@506a000 {

Drop label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof

