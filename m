Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D598B4AA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686D10E5D9;
	Tue,  1 Oct 2024 06:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J3hqxMrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41E310E16C;
 Tue,  1 Oct 2024 06:42:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A13145C53FD;
 Tue,  1 Oct 2024 06:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBEA6C4CEDB;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727764924;
 bh=eHhi3IE5QYIljEIZfCEN/SVnk/FjMdvW+31klwdSPOA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=J3hqxMrCvJxWVepJQlPHo2PHHZQ4EeFWui20tkpxEkrd5IA45R8yRYZLJMDGN738R
 GUzmf+EjcsZEUuoEmKGi1MDoiBzIHhbxoUKnyi2qnRL8eEi0ald8K90CSD2Mv8YXs8
 VE2wCS9otmwQs9WlG2octRcE2MUrk4ILURn7wHlHpwW8aPpQt/dHKRlYsWBmg39oOa
 OQ4EOHR5wy7LTAuJA1iR2FsfDKqnixBuPo63A/QyPb0VhxqHGZfLERpALSt18NwVSN
 aSGfSj1GXU9U+7hbeZ00vf7uGNl0/Dgt/gdtHFIPZSxA6095gnzDG6WvByTfIZYJiA
 kneJlJ1uVSIng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D3868CEB2E8;
 Tue,  1 Oct 2024 06:42:04 +0000 (UTC)
From: Mahadevan via B4 Relay <devnull+quic_mahap.quicinc.com@kernel.org>
Date: Tue, 01 Oct 2024 12:11:40 +0530
Subject: [PATCH v3 5/5] arm64: dts: qcom: sa8775p: add display dt nodes for
 MDSS0 and DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-patchv3_1-v3-5-d23284f45977@quicinc.com>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
In-Reply-To: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727764922; l=3736;
 i=quic_mahap@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=mwU+T+g7aZfnj3h6yUCl49ZVraCw0HZEXDEFdRAhnjw=;
 b=XcwdYY/DjaO3MExCm5Duwt4n6hGSj6aUbW5VG4zX8y7dIQpI+o6mNcrdOWmbCWFhrz/64xzR9
 /qDLJy8aXk4DndR0Y+SM5Dyy1wchEKngN/LEnenQZ4LEPHsXx9oyYyV
X-Developer-Key: i=quic_mahap@quicinc.com; a=ed25519;
 pk=Xc9CA438o9mZKp4uZ8vZMclALnJ8XtlKn/n3Y42mMBI=
X-Endpoint-Received: by B4 Relay for quic_mahap@quicinc.com/20241001 with
 auth_id=236
X-Original-From: Mahadevan <quic_mahap@quicinc.com>
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
Reply-To: quic_mahap@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mahadevan <quic_mahap@quicinc.com>

Add devicetree changes to enable MDSS0 display-subsystem its
display-controller(DPU) for Qualcomm SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 8fd68a8aa916e6595134b470f87b18b509178a51..66bd5e1c82a426f93097dee63a69c03527f04b3e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
@@ -2937,6 +2938,94 @@ camcc: clock-controller@ade0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss0: display-subsystem@ae00000 {
+			compatible = "qcom,sa8775p-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			/* same path used twice */
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x1000 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss0_mdp: display-controller@ae01000 {
+				compatible = "qcom,sa8775p-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss0_mdp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <0>;
+
+				mdss0_mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+		};
+
 		dispcc0: clock-controller@af00000 {
 			compatible = "qcom,sa8775p-dispcc0";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


