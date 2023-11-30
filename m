Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F77FFD0B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 21:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5126010E02B;
	Thu, 30 Nov 2023 20:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA2110E751;
 Thu, 30 Nov 2023 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1701376553; bh=dIpkZwLcU5LO2iRQ3FvNUd54eLsB8oPxrLiyGCwvIk0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=LHvHwkM+dXQfRQrcZqNmeRe/WEqzq/9iDRtfutrR/NE0ybkVqggRDkNbZhCVwzReN
 ef+shYUnwWGlgWkwlRuTBYDEn5SjuLj+Efr6aWub7cOUNEZCNreSbVMNaleD81Lauh
 Z0iKXz4W+gT1Hz88O6VlmdqZEqJfnO/ulCHVqHRo=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 30 Nov 2023 21:35:20 +0100
Subject: [PATCH 3/3] ARM: dts: qcom: msm8226: Add GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-msm8226-gpu-v1-3-6bb2f1b29e49@z3ntu.xyz>
References: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
In-Reply-To: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=dIpkZwLcU5LO2iRQ3FvNUd54eLsB8oPxrLiyGCwvIk0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlaPIlnpx7RKRqFvmDkHiyz3LX+JZOWvUXys5LH
 u+C4lYbvniJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWjyJQAKCRBy2EO4nU3X
 VrgND/9nZ8rJNVtr/QjArZe3c3cRpOuXXFaFMZrWx8Wru4JrOcqubLb3fcvQ/mvnH4vKkvTpdxL
 m00Xh5X8lgMIYWzqbW+W2Zid0JsoST7c6cZXezgAleXkXPvFJb/gf+ExtL68MmQu/tAdzRblYW4
 aiYY6LrBZ3u7+XRk+Vez2qUzhZYOiolCTq5li/rAdDzZuQbA4lQaj3TzBjnZaYbEFQTQiMuHaCO
 iGW7ZQTCKPhcGMA2RXEfD+t4Ns8/L6EHRV//Jhs9TTOWk3xktSdAWRgzOS6ffRJ6fso54txIiFx
 stqfeXeBPDakjtq25ynw+ULehXb7JxlTm9DlcRZHjZ9B1Q5ixfIzdaitG6SEUFEFkIEFLOU+p3t
 Zaf0SA8thvQ5SgFIyrTsjpekMABAPfe5GmKBWDpAIW4UTQb/lFOJ5bFw+T7ulcd64u0snYVfU5R
 61bXapRbk6tXDNoW7/01/oGtot+dUOVoronedMMy2DgQiYH6PtTCYtxf/zYr/2mLbc/oqBmA4Ht
 D6LF9rVI1mlUR7qb4l91ZWAZIKnEwC6Au5FywG2q/P9HZzoWXymbcdjjLtJ0xXHDliEdqExEVhX
 VSDPGXqDamO4aFncQhIMlQFdkXmWiQeklCGb+DYvLGzcFGkR1C+Xi/W8eEmU3xkf2RSlyWrArvu
 ReX1PTtBVBAGqkg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm8226 SoC contains an Adreno 305B. Add a node to configure it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 5cd03ea7b084..9b43766df8f8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -1006,6 +1006,46 @@ mdss_dsi0_phy: phy@fd922a00 {
 					      "ref";
 			};
 		};
+
+		gpu: adreno@fdb00000 {
+			compatible = "qcom,adreno-305.18", "qcom,adreno";
+			reg = <0xfdb00000 0x10000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+
+			clocks = <&mmcc OXILI_GFX3D_CLK>,
+				 <&mmcc OXILICX_AHB_CLK>,
+				 <&mmcc OXILICX_AXI_CLK>;
+			clock-names = "core", "iface", "mem_iface";
+
+			sram = <&gmu_sram>;
+			power-domains = <&mmcc OXILICX_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-450000000 {
+					opp-hz = /bits/ 64 <450000000>;
+				};
+
+				opp-320000000 {
+					opp-hz = /bits/ 64 <320000000>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+				};
+
+				opp-19000000 {
+					opp-hz = /bits/ 64 <19000000>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.43.0

