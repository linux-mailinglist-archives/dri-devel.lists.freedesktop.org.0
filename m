Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1007DA65F43
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 21:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FC010E15D;
	Mon, 17 Mar 2025 20:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fNK+qsZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679EC10E15D;
 Mon, 17 Mar 2025 20:37:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C5D49A48D26;
 Mon, 17 Mar 2025 20:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2036C4CEF3;
 Mon, 17 Mar 2025 20:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742243863;
 bh=EAH6DiCttghSq5ONxKx1j8unsQnFPM5gcsSzH37iVwk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=fNK+qsZMETCsE4vmpMKLZl6mMxKbZdsm1Ao1mDGWMjmPYCVkQXEsVH09rfa1QEZCx
 TXKDmiRQLmQufOImGnEtGDP7Mulf2Rnm4WsbooLztBQdCpHtNPwc1Q6NB9RxZ47fO3
 ZwojOst6zp4Gj5Y2HczDnx1KkC6PVg+0nHIfHM/NG2IpNJkBkIwIpiydFBaU/kJhDd
 5+23T/UpyHw9HRtOO5TqmfrL+7fCf+AsMgNpYaYQXQ3lgiHRWuaTjQPH1gK2reI7aJ
 V0/tCr4gKU5y88UahVcaADEzP8z9wXgLlkpquCy/p2G3ck6oMT8ePuUc21Fl717hWQ
 7SDdACX9nDedQ==
Date: Mon, 17 Mar 2025 15:37:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Kumar Gala <galak@codeaurora.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
 Sean Paul <sean@poorly.run>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 David Heidelberg <david@ixit.cz>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, David Airlie <airlied@gmail.com>, 
 Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Andy Gross <andy.gross@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@codeaurora.org>, Leo Yan <leo.yan@linux.dev>, 
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
Message-Id: <174224352766.683604.12560729798577306237.robh@kernel.org>
Subject: Re: [PATCH 0/9] ARM: qcom: fix APQ8064 schema warnings
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


On Mon, 17 Mar 2025 19:44:35 +0200, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (9):
>       dt-bindings: soc: qcom,rpm: add missing clock-controller node
>       dt-bindings: display/msm: describe SFPB device
>       dt-bindings: soc: qcom: add Smart Peripheral System Interrupt Controller
>       dt-bindings: arm: qcom,coresight-static-replicator: add optional clocks
>       ARM: dts: qcom-apq8064: add missing clocks to the timer node
>       ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
>       ARM: dts: qcom: apq8064: use new compatible for SFPB device
>       ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
>       ARM: dts: qcom: apq8064: move replicator out of soc node
> 
>  .../arm/arm,coresight-static-replicator.yaml       | 10 +++
>  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++
>  .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  8 ++
>  .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 85 +++++++++++-----------
>  5 files changed, 136 insertions(+), 44 deletions(-)
> ---
> base-commit: 2bb3cf7805af73af62ebfcbb55e350549b6a0912
> change-id: 20250317-fix-nexus-4-dd0fe3bca987
> 
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com:

arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: rpm@108000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dtb: rpm@104000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-msm8660-surf.dtb: rpm@104000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#





