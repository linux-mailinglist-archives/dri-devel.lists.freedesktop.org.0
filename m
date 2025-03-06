Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF951A55456
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E710EA62;
	Thu,  6 Mar 2025 18:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V1CpKZLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B00D10EA60;
 Thu,  6 Mar 2025 18:12:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1CD05C03E3;
 Thu,  6 Mar 2025 18:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A84C4CEE0;
 Thu,  6 Mar 2025 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741284736;
 bh=askH3R6sG+btM9xBpzTtVzTNW9Ie7Dc8X3GibawDEK8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=V1CpKZLpE4FBZwBY+tvJ1CneJ92Q34Fb3T3hhREYTSVcJDvpw2D5Wo8/sCHbg0JPE
 ZTFdvyPoxhNohxduSSrjip/izwhQBSPtI35HruIS6IOd91KEeVizF47o+zXMBp8P7k
 Ot0qYMGvc/dwdfAlX9mZSZJiI0vqxT7tTEpxSg/cPdZ/hk6UoOfXU1QdV1Fp0N9qzr
 eZwnOpdvKQMd9qBlu5YO+TUnQH9c+Ff2zrxC5uh6SWI/xo5Vjs1SSgm4fwiJufYBEd
 ssr+2Iv0fGB8oXWA35xeWLiiigd2p6NACuIzAPKRTrV2ZlmeBqyUaw7VTT8V2ihYM4
 RFaIsF3kFa7bw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:17 +0100
Subject: [PATCH 05/11] arm64: dts: qcom: sdx75: Fix up the USB interrupt
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-5-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1543;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=e+qbnc3LyUlQz9wgVj1yFHcotV4iEwr4WI+oHfwIjHQ=;
 b=IdembhZwx0PUrERAy2tXMG4dFVARwNQxDWKRfrRVWphYUz8RItpicLd9pZarKxaEI4X9xViEK
 3ZsRDVh2jAqC9rjuOrmv79vFRA1btjMFgva3GisZ5tcfjOWCf3G81o5
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
reworked the dt-bindings to accurately represent the hardware.

Execute the second half of the cleanup by wiring up the missing
pwr_event IRQ and adjusting the entry order.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index b0a8a0fe5f39ffcd0da1f9fd9f4f5564412f76ec..8da2383861e4321d91be0e23a2f1ade9914e8416 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1008,14 +1008,16 @@ usb: usb@a6f8800 {
 					  <&gcc GCC_USB30_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 9 IRQ_TYPE_EDGE_RISING>,
-					      <&pdc 10 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "hs_phy_irq",
-					  "ss_phy_irq",
+					      <&pdc 10 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
 					  "dm_hs_phy_irq",
-					  "dp_hs_phy_irq";
+					  "dp_hs_phy_irq",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc GCC_USB30_GDSC>;
 

-- 
2.48.1

