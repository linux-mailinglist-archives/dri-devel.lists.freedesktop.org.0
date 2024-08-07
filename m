Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940CC94ACA8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27B410E197;
	Wed,  7 Aug 2024 15:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GAsphRfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3686010E197;
 Wed,  7 Aug 2024 15:20:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 154D5CE0FD8;
 Wed,  7 Aug 2024 15:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2BCC32781;
 Wed,  7 Aug 2024 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723044027;
 bh=xERSTfQqUvdd2k3tAtUqyYEs/LVRZsmS4yVoWayUT+E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GAsphRfeDUfnMH1Vai3L+59Pwz/5hOlhZEhnZy+82Suaphx0tjjim+AGlEAmMYCPd
 Y3X2HhARfVMOiaCGSNUbBGPn9+xxpJbiUhPx9/ENpXhS5XAI4DwQYIFQu1OFpvV3aP
 IKtlwiR2xXYrj6+pX6aJjJFYCCaF+smjFYI3M6EoE8Ov/w1HzlvfJsZPUomkJtmnnW
 jvFCjYz5BPtoRVAb9a+lZjpNrKp55P6oxsN5dZgGmEw7rbUUZPmb7sSn6U1IzfsKse
 YHho8C49xpNHhT3yZBexGxnwtfdWptmblEY1ST+dRHAQ+r/vELsBXhMovmXw+/C7BV
 VHzNOJNBio1Rg==
Date: Wed, 07 Aug 2024 09:20:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
Message-Id: <172304385687.2508167.11953351079557363254.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and
 Pixel 3a
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


On Tue, 06 Aug 2024 17:44:54 -0400, Richard Acayan wrote:
> This adds support for the speed-binned A615 GPU on SDM670.
> 
> Changes since v1 (20240730013844.41951-6-mailingradian@gmail.com):
> - add Acked-by tag (1/4)
> - add OPPs exclusive to some speed bins (3/4)
> - enable GMU by default (3/4)
> 
> Richard Acayan (4):
>   dt-bindings: display/msm/gmu: Add SDM670 compatible
>   drm/msm/adreno: add a615 support
>   arm64: dts: qcom: sdm670: add gpu
>   arm64: dts: qcom: sdm670-google-sargo: enable gpu
> 
>  .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
>  .../boot/dts/qcom/sdm670-google-sargo.dts     |   9 +
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          | 180 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
>  4 files changed, 217 insertions(+)
> 
> --
> 2.46.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/sdm670-google-sargo.dtb' for 20240806214452.16406-7-mailingradian@gmail.com:

arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: iommu@5040000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too long
	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too short
	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
	'qcom,sdm845-smmu-v2' was expected
	'marvell,ap806-smmu-500' was expected
	'qcom,sdm670-smmu-v2' is not one of ['nvidia,tegra186-smmu', 'nvidia,tegra194-smmu', 'nvidia,tegra234-smmu']
	'arm,mmu-500' was expected
	'qcom,sdm670-smmu-v2' is not one of ['arm,mmu-400', 'arm,mmu-401']
	'qcom,sdm670-smmu-v2' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
	'qcom,smmu-v2' was expected
	'qcom,smmu-500' was expected
	'nvidia,smmu-500' was expected
	'arm,smmu-v2' was expected
	'arm,smmu-v1' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/iommu@5040000: failed to match any schema with compatible: ['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2']





