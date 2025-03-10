Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E780A58D13
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658D410E3A9;
	Mon, 10 Mar 2025 07:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MLLZEVEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE8410E3A8;
 Mon, 10 Mar 2025 07:40:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18BBDA40429;
 Mon, 10 Mar 2025 07:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23303C4CEE5;
 Mon, 10 Mar 2025 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741592428;
 bh=A1+vd1+iI7U2juLRNkQfIRGQ+caFncDP5Th5PCoA3dA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MLLZEVEGzufs0VlS6qieY+pMhoUDMxcouSNcWPOVrGjQx1+BmVdccK1B31g4zgat+
 S9t+CMks5K+WhoLTpoMllIS9jxMDecewNqkeTry3J7MakMz75SFX8FcMghXi9kWwe2
 zasatPj38fuVJw5Y0DyKT93QDXjrJAsokH92ZYbWZKtJDWadI05auP+gsW0ntdETMp
 tUbEVpawx/nm2mYD23HNeUigHTu5sAsLfltu4Z5t2rYDgYfXK/RNWoDfOPB/E8pCx7
 lqUncZbsrTer3uvAWWEbtP0sXsfjpqQJ/RIejBYs++63rs2P/+NPR6I/rg9lTWSI8Y
 QJC0gyvxVCyHQ==
Date: Mon, 10 Mar 2025 08:40:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
Message-ID: <20250310-impressive-cherry-bullfrog-cbd8fd@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
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

On Sat, Mar 08, 2025 at 03:42:23AM +0200, Dmitry Baryshkov wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sar2130p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sar2130p-dp
> +          - const: qcom,sm8350-dp
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sar2130p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Drop last compatible here and use contains (see v3 of my sm8750)

> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sar2130p-dsi-phy-5nm
> +
> +required:
> +  - compatible

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

