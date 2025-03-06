Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BAA55467
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA8710EA63;
	Thu,  6 Mar 2025 18:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G/G1BlAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC7610EA5F;
 Thu,  6 Mar 2025 18:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D683D5C53D1;
 Thu,  6 Mar 2025 18:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F82CC4CEE4;
 Thu,  6 Mar 2025 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741284785;
 bh=AxN1u6oltFInfvu7qSHZSegk1bX6prOrSzh5aKa33CY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G/G1BlAgDm4xkro83kl/JIdI77e1eFsC8x+Ww+231RYG/ORbdG4br+38TD1wNSFk0
 qn0xFYXQ4q7Iz+8qxIBrSy/gTiTFYIiKc/8a1Q065Ug4x/PzfvoTt8QaelrtvV/Aqf
 0LHdWG78mAAy3F7gnIubkSzbHVuUpYFdCO+F0heL3uWYy+6IqYO1o3zHkXtecudEdC
 MOAXhsS2zrvZ1LTcr1hXCAtWqoprvBe/U3vIaXpJo4rquqwW7aqHggZeOh0xnjgWQd
 6no2yVPDpMFOg/r0aQ3syUdW9eP9UFMfC3YtIM2CCq/XsiVgZF/qLxsthCP6jjere6
 XLaIUcjtlFdYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:11:22 +0100
Subject: [PATCH 10/11] arm64: dts: qcom: x1e80100-romulus: Drop clock-names
 from PS8830
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1090;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=TJwz5UNs9y8ANzwsPjAzaE0DNH2UeCEPCpr3kIOXIIQ=;
 b=WNN3c71SSHCsEXaxj59pZYDBvAro00o4juePeMQiZPPFZRFKmkQyIKfIWFyMeved3LPkOQ3n8
 QkvH2wb9kwRA22qWYFD9vrQT0AdZfB9JxXdTu9OTkCoQDsnshpOUr6Z
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

The preemptively-merged node contains a property absent from the final
bindings. Remove it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 5867953c73564ca7ae1279b73f6834aa1d732792..f4acca02cd20252067df9e174703d4c52b756eae 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -792,7 +792,6 @@ typec-mux@8 {
 		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK3>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -878,7 +877,6 @@ typec-mux@8 {
 		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK4>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;

-- 
2.48.1

