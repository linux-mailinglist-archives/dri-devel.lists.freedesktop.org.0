Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0284A4143A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 04:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA4D10E12B;
	Mon, 24 Feb 2025 03:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="laWMqAKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C5C10E10B;
 Mon, 24 Feb 2025 03:45:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6326D5C486B;
 Mon, 24 Feb 2025 03:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA71C4CEE9;
 Mon, 24 Feb 2025 03:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740368745;
 bh=42koWRG4Nt5OGSGJb7NMr+y/fPtNaNyRskHNI2gE81U=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=laWMqAKYVQAXnVx4W/oAOhBswNz1hxhxWsgKscEtN4qNik7+QwQzZlD/ak8ONwwJm
 29vkZn5x7tgzS+ZM+b97b28cAfKcGOJVuBSaPQvSnQkCDvbf2wUzlP0kAaUq8fxmy2
 skJBVi8tyGq82SFuPBs4K1RxV/ecV6i9ExEACUqGP/DYOOR+CTQAaUZM54fTYKhre2
 crjQhUuz0P+mVGCJeK1IZykq5o26XK9tZJld+HiC02MlL1k2gfSPQmk4ciJmTMx5ts
 harq9iFQOwIikOrem7Jli1Cqs8yaBJNpS2JTCtjutwhkv4U4tTgKsl9lyVcfyK5KD1
 42iqtuiYcWmbg==
Date: Sun, 23 Feb 2025 21:45:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-4-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-4-dad7c182cccb@mainlining.org>
Message-Id: <174036874061.769245.15872803802181415691.robh@kernel.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937
 IOMMU to SMMUv1 compatibles
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


On Mon, 24 Feb 2025 02:56:19 +0100, Barnabás Czémán wrote:
> Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
> for the MSM8937 IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v1" implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-4-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

