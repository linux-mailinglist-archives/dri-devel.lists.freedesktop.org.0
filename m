Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56C9431F6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 16:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E36E10E636;
	Wed, 31 Jul 2024 14:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I3RGX8ly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CA510E636;
 Wed, 31 Jul 2024 14:25:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D9ED6245B;
 Wed, 31 Jul 2024 14:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE780C116B1;
 Wed, 31 Jul 2024 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722435941;
 bh=iLMn/G9k1cRR/ZvGnS+j1lMkO0nrAGYKNimaeBu6t1U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=I3RGX8lym/EOh1geccrd6PVCQnKFPmYWLZ5q2JkquVTv1jsee5AVkkxm+SYAq3JZJ
 uNM4OeEHyNLO5kdR9hr022TmTXz8abOHYq15/wTIuCakLijIONShCtscBCVnOHjb/L
 BOsjYnFI92tGIU5fReojLwCBoAXSC7zhqKHCT3TZKhYUlOfA8f/ceRfrO2HCea58FZ
 S+uK2oeFYoqka34nkhRz85VtkPneaKbXXxNid+IUyharxvK3aOB1bSC6XIC4hIXvAa
 qUzt52WuCRljc9VHz0bxj7E+0sVI28G8O2rOnaDRH8yV7/NsZlmT4rXIGZYZT2r9os
 cbApfycMneubg==
Date: Wed, 31 Jul 2024 08:25:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
Message-Id: <172243537297.718676.16575598294797737179.robh@kernel.org>
Subject: Re: [PATCH 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
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


On Mon, 29 Jul 2024 21:38:45 -0400, Richard Acayan wrote:
> This adds support for the speed-binned A615 GPU on SDM670.
> 
> Richard Acayan (4):
>   dt-bindings: display/msm/gmu: Add SDM670 compatible
>   drm/msm/adreno: add a615 support
>   arm64: dts: qcom: sdm670: add gpu
>   arm64: dts: qcom: sdm670-google-common: enable gpu
> 
>  .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
>  .../boot/dts/qcom/sdm670-google-sargo.dts     |  13 ++
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          | 168 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
>  4 files changed, 209 insertions(+)
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y qcom/sdm670-google-sargo.dtb' for 20240730013844.41951-6-mailingradian@gmail.com:

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





