Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5CFA3CD7A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF8310E8AD;
	Wed, 19 Feb 2025 23:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UcpBcpZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E86810E8A9;
 Wed, 19 Feb 2025 23:27:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6A51611F3;
 Wed, 19 Feb 2025 23:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE72C4CED1;
 Wed, 19 Feb 2025 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740007627;
 bh=WX6lVmo/c25XHWA8ptWmTZ5D0wvhqhVJVdh7eGhlPHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcpBcpZpcjx53AjXDByVc1qriePQTt9PzfDcUl6el/oToFwGynzQcj26tNfwh0jFu
 jdDPRzx00n37KeNGxvhBjv00PW5UwN4cAkFpoMC6QMrTIhLArLkj5pfb33H389BN6S
 WfCRzQcTcByYd5g2voFukcfKrEcPbtuNco9AQAs/uuN8G2K2Ab6ZD3FGYa8f7/IH1I
 sWXgNGRRsKtutwIXQ4bKy2nnjGCvdHOeV27RIqbJjRlctjffOzOsFLhyNwITtTVvry
 aX5+xO3L1IPFYn3uzP5qfPJDMVmvZ9gIA6AeDgkjEeAAaW/eWU4khjoAwP82e8IO+v
 EbAqdSScg90Ag==
Date: Wed, 19 Feb 2025 17:27:05 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 07/16] dt-bindings: display/msm: qcom, sm8750-mdss: Add
 SM8750
Message-ID: <20250219232705.GA3166541-robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-7-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-7-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:28PM +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
> with two revisions up of the IP block comparing to SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 +++++++++++++++++++++
>  1 file changed, 460 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..cfa21b0d081338f1b94779594798f86284ba0677
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> @@ -0,0 +1,460 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8750 Display MDSS
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +
> +description:
> +  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8750-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,sm8750-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm8750-dp
> +          - const: qcom,sm8650-dp

Just use 'contains' here with the 8750 compatible. We'll check the order 
when the DP schema is applied.

Up to you what to do on the ones with a single compatible.

Rob
