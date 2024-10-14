Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9C99C186
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE1B10E3A7;
	Mon, 14 Oct 2024 07:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AkPM3WvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A09E10E3A7;
 Mon, 14 Oct 2024 07:39:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 171725C5A5D;
 Mon, 14 Oct 2024 07:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59887C4CECE;
 Mon, 14 Oct 2024 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728891545;
 bh=SJl4FEfP+nFMTQVy4tk0uK5eIrcooOIDOFEZGLbbHSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AkPM3WvD4Bm+q0U9C6GsoeBUkQCJ/71dmvFjrQY1d28bY6LwJ/sJXX753NAKeaq5b
 k/DuKevASrcm62uL5riOxx5PDaxsxj9Sx4P/2lw/XcMYmZ0em0PJcKigtjjvSfvWOq
 aCtsgfQf6p5H6T3N1I4jJ6r8FncLwTfqwcmUiufajbeCprDXVEW35OfJmQHzrhkzco
 jWwj9pRMyncU/fdEvCw+GIxA/TR59ec0ieHpX0s8xdBHH18SK3HM2qie3D2Q1u8OKe
 zPCWgoMGsWo/wuYEVsjmXSXnPHZEkH3tJzGTi4z9Y3bm+0/cHvSuNT9Gq1w+zi4LbX
 CDz3u/OyWRtaQ==
Date: Mon, 14 Oct 2024 09:39:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <he6cfrofgmdw2se4mcok25c54sboovevmlli42xh6ttnqiogat@ja6el35jyd65>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-2-1e5e91aa95b6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012-gpu-acd-v1-2-1e5e91aa95b6@quicinc.com>
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

On Sat, Oct 12, 2024 at 01:59:29AM +0530, Akhil P Oommen wrote:
> Add a new schema which extends opp-v2 to support a new vendor specific
> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> property called "qcom,opp-acd-level" carries a u32 value recommended
> for each opp needs to be shared to GMU during runtime.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> new file mode 100644
> index 000000000000..9fb828e9da86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Adreno compatible OPP supply
> +
> +description:
> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> +  ACD related information tailored for the specific chipset. This binding
> +  provides the information needed to describe such a hardware value.
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +allOf:
> +  - $ref: opp-v2-base.yaml#
> +
> +properties:
> +  compatible:
> +    const: operating-points-v2-adreno
> +
> +patternProperties:
> +  '^opp-?[0-9]+$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      opp-hz: true
> +
> +      opp-level: true
> +
> +      opp-peak-kBps: true
> +
> +      opp-supported-hw: true
> +
> +      qcom,opp-acd-level:
> +        description: |
> +          A positive value representing the acd level associated with this

What is acd?

> +          OPP node. This value is shared to GMU during GPU wake up. It may

What is GMU?

> +          not be present for some OPPs and GMU will disable ACD while

acd or ACD?

> +          transitioning to that OPP.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - opp-hz
> +      - opp-level
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Drop blank line

> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    gpu_opp_table: opp-table {
> +        compatible = "operating-points-v2-adreno";
> +
> +        opp-550000000 {
> +                opp-hz = /bits/ 64 <550000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                opp-peak-kBps = <6074219>;
> +                qcom,opp-acd-level = <0xc0285ffd>;
> +        };
> +
> +        opp-390000000 {
> +                opp-hz = /bits/ 64 <390000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                opp-peak-kBps = <3000000>;
> +                qcom,opp-acd-level = <0xc0285ffd>;

That's the same value used everywhere. What's the point? Just encode it
in the driver.

> +        };
> +
> +        opp-300000000 {
> +                opp-hz = /bits/ 64 <300000000>;
> +                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +                opp-peak-kBps = <2136719>;
> +                /* Intentionally left out qcom,opp-acd-level property here */
> +        };
> +

Stray blank line

> +    };
> 
> -- 
> 2.45.2
> 
