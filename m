Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01719A98EF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CF910E1AA;
	Tue, 22 Oct 2024 05:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sTr0kkj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0021610E1AA;
 Tue, 22 Oct 2024 05:49:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C30BC5C5D26;
 Tue, 22 Oct 2024 05:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F00C4CEC3;
 Tue, 22 Oct 2024 05:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729576185;
 bh=J+BMzdYAVIwsWyzJPi9J0gP7+XqHtYLXb7+Voj/ccWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTr0kkj6mLVsNwMy25WhjN9EkizDQBRwDIo81ackxO79r1N0S6UUzVMo0sUn8WxVK
 A3B7FcFaJdNN+Q3TyTTTB/fKMc/JsGog/AsS63Ub+aGI7X9nImuW62qy4GjsgMWuoU
 RQvWpHl7Nw1hGQvpC4ePhArG9s6BTy/CLcYwM/9tDte/PIdLg1Yuo+G9cSfA/mOYJg
 l9wnQ/K6BtP7XgMpJ5qA1DTRCWgdYw48mAVwK3XF8cUWxgIQyTp3JVph+2Iw4ePa93
 ZfxLL5My7klK9BTRC9wNKoptNMboXBTJEHkiRlXnjPvHON5juqh01XuENiT0mOPMBD
 N7gaZ71qbc28g==
Date: Tue, 22 Oct 2024 07:49:40 +0200
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
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-2-9c25a62803bc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021-gpu-acd-v2-2-9c25a62803bc@quicinc.com>
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

On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
> Add a new schema which extends opp-v2 to support a new vendor specific
> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> property called "qcom,opp-acd-level" carries a u32 value recommended
> for each opp needs to be shared to GMU during runtime.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> new file mode 100644
> index 000000000000..6d50c0405ef8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -0,0 +1,96 @@
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
> +    items:
> +      - const: operating-points-v2-adreno
> +      - const: operating-points-v2
> +
> +patternProperties:
> +  '^opp-?[0-9]+$':

'-' should not be optional. opp1 is not expected name.

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
> +          A positive value representing the ACD (Adaptive Clock Distribution,
> +          a fancy name for clk throttling during voltage droop) level associated
> +          with this OPP node. This value is shared to a co-processor inside GPU
> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
> +          be present for some OPPs and GMU will disable ACD while transitioning
> +          to that OPP. This value encodes a voltage threshold and few other knobs
> +          which are identified by characterization of the SoC. So, it doesn't have
> +          any unit.

Thanks for explanation and other updates. I am still not happy with this
property. I do not see reason why DT should encode magic values in a
quite generic piece of code. This creates poor ABI, difficult to
maintain or understand.


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
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    gpu_opp_table: opp-table {
> +        compatible = "operating-points-v2-adreno", "operating-points-v2";
> +
> +        opp-687000000 {
> +                opp-hz = /bits/ 64 <687000000>;

Messed indentation.

Best regards,
Krzysztof

