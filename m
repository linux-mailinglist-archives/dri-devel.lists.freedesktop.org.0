Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DECE82B5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 21:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5632B10E6E7;
	Mon, 29 Dec 2025 20:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d3NoOfFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B646610E6E7;
 Mon, 29 Dec 2025 20:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3502F6001A;
 Mon, 29 Dec 2025 20:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D87C4CEF7;
 Mon, 29 Dec 2025 20:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767041285;
 bh=/HcHUKH9WOn4u11rA/8fd9MG7H3ox7CxfRjWpVBqbEo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d3NoOfFoKEMjGZmhbXTwwY7EDS6Ku7T3w492GkGseh+K35d9e4P6f+N2x6J+ni8Zq
 UBN7sD7unM2e8R9CR7F+Sblj0SX4q9EevF+dx0atb+u/Ld7nkz71lHTspu0ODi1gCn
 oStxDhEIiBGTzU7cre4vfPqp26lm/AAYu5XLJfIw1D5J8UxTsECl0TjotckY3NU/0a
 vkAtHZOuwRrVgw69Oc8JeJbxe0RVc6xDGfzv2BOm/0IgiYd8LhNradgrGJuKykzR5J
 R96paUuGljh+Il6QQEn1dtZ1fOzSIeViLWc80+w3OLpdmmGiwa5BWvLYGGnhhuZcOq
 gJS2PSjSElhkw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 29 Dec 2025 21:47:41 +0100
Subject: [PATCH RFT 3/3] arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-topic-6115_2290_gpu_dbgc-v1-3-4a24d196389c@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767041261; l=1458;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aO7/EdvbRTHMZ0mluFQ6+MO7rNiL4vfNS224/qLOXj8=;
 b=LN4bsZucaHqv8euXO3Ye/44gUvEgjH4WpNQ20/BaxYkzodXoPiNWwdV9m0PnkoNAG1vr+UaIO
 pboJrQisvoEBfNunZ6zbLNk5mrai9x5uA8zhE5CRjKzWNmjfiLRlSD1
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

Describe the GPU register regions, with the former existing but not
being used much if at all on this silicon, and the latter containing
various debugging levers generally related to dumping the state of
the IP upon a crash.

Fixes: 11750af256f8 ("arm64: dts: qcom: sm6115: Add GPU nodes")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 5e2032c26ea3..4dba724f2c75 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1715,8 +1715,12 @@ usb_dwc3_ss: endpoint {
 
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-610.0", "qcom,adreno";
-			reg = <0x0 0x05900000 0x0 0x40000>;
-			reg-names = "kgsl_3d0_reg_memory";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
 
 			/* There's no (real) GMU, so we have to handle quite a bunch of clocks! */
 			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,

-- 
2.52.0

