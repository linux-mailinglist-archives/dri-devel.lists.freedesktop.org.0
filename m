Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CFA94B68
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 05:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD5E10E345;
	Mon, 21 Apr 2025 03:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="dI/DmWz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (unknown [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23110E295;
 Mon, 21 Apr 2025 03:09:45 +0000 (UTC)
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
 by mail.mainlining.org (Postfix) with ESMTPSA id 095F6BBB02;
 Mon, 21 Apr 2025 03:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745204969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wv+9auBazsXKRxnpNGjY94AHAY380sF3mVbWNFTcSIE=;
 b=dI/DmWz4BMQRwpDUkcE7ume6kI/K/r36eiPebrJ69AjBWdhXGbhBlWLvgxoRGCDIUGkGB6
 zi+Y6cYXK8orlbt/YoEBSxo9ENQvDJTr+EnrGJeppDjr9E+0d9AZPK0XzTytnSwX7EttE1
 PXxWcz+oXCNEmm1VhMZs0jBeY5tnMfNUJBlH7rZsvU77mMKgagedfh6H7fhoygscamuiz2
 Qymc+iGyJ+YGBk0b+trUt6DDTIg5lLVSneD9rUSmcYiewy8dHxpBxlyxDLSF2bRm1PyvsV
 O1GOv4rN3QrjpeE8PXlfRqNlAFBCaPPNNEuzWTVMnvNh/cicBzoVeYs4SsYfdw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 05:09:22 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
In-Reply-To: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=1346;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=8CGVttQ4brRRp/Et9bfjInhjPjjWXhiu3XI2uNWNBZM=;
 b=TjyYsd76Y3LeeiryRw3AdtOVuspeapRONKo4JRNMab7nsDwXiG/D8gu1tLp+pMJjsqwxG8PuL
 S2cpia1wU0UAxBLR8M9G+Je7G9I2nNCzUdkTCHxt5I/uey7X6zCiYb6
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Sort adreno clocks in alphabetical order.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
 			reg-names = "kgsl_3d0_reg_memory";
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
+			clocks = <&gcc GCC_BIMC_GPU_CLK>,
+				 <&gcc GCC_OXILI_AON_CLK>,
+				 <&gcc GCC_OXILI_GFX3D_CLK>,
 				 <&gcc GCC_OXILI_AHB_CLK>,
 				 <&gcc GCC_BIMC_GFX_CLK>,
-				 <&gcc GCC_BIMC_GPU_CLK>,
-				 <&gcc GCC_OXILI_TIMER_CLK>,
-				 <&gcc GCC_OXILI_AON_CLK>;
-			clock-names = "core",
+				 <&gcc GCC_OXILI_TIMER_CLK>;
+			clock-names = "alt_mem_iface",
+				      "alwayson",
+				      "core",
 				      "iface",
 				      "mem_iface",
-				      "alt_mem_iface",
-				      "rbbmtimer",
-				      "alwayson";
+				      "rbbmtimer";
 			power-domains = <&gcc OXILI_GX_GDSC>;
 
 			iommus = <&gpu_iommu 0>;

-- 
2.49.0

