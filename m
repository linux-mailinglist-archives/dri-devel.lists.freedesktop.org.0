Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9BA94B62
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 05:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3674A10E1CF;
	Mon, 21 Apr 2025 03:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="bmmBAkN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (unknown [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38D310E1E2;
 Mon, 21 Apr 2025 03:09:45 +0000 (UTC)
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
 by mail.mainlining.org (Postfix) with ESMTPSA id ADECDBBB03;
 Mon, 21 Apr 2025 03:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745204970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4erXkx1N6odG+LR0LejQIlj+eK/ZO/Lp1JgPLjIo9Q=;
 b=bmmBAkN95K4IlrqMxNY9XRjPbRR7+U9XQ1PN253AF6O+qtZ/rJ2zhkfdBuujpGAjswLrk5
 uc2dsvR+fC5qjaRUWDwvgNhR98xeuuN3dp5sJSBdtuC96w74VTehS4kSC7FgQDnSqexoxc
 Lq2KADQU1Lm8/0KUCYsQsIjoenI/eeqZnKUJ4twcgFlIPOY1WcBZbbh7Be6Uk0Q4rrWG4W
 VS7iUEhEU3MtgKez7B5XoZUKtkxnsOjvxTNdLnepRgfOysoen2GwhkSzYHcLUNZQ9GUXvG
 7BpoFv64ZFzt2luPMYJ1CqSwgyorNPrEQ17kK4ZBdyfSGm02+W02HLmz6T3fnw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 05:09:23 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: msm8976: sort adreno clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-a5xx-schema-v1-3-7d96b889322a@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=1290;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fAfyXieDjeLVW7PmrL+oK+9YbBprYzNzlpQ7ltV8A0Q=;
 b=k+ltu8PJiKWj7fBFhPfjLb0vyR3IdskK9K/Dotz1CAdug3F4FC1aBBsn6aKX4LIQxplwPNPg5
 2kURV563nu8CQVvBohjt8M6PWcd+KTqeVtpyZvpvbGipgmfjYTTsLcg
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
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index e2ac2fd6882fcf47e846a92d45e0fcb9beba633a..86a9d24da0faab2dc7ecc53d60aa0c78703eef91 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1129,18 +1129,18 @@ adreno_gpu: gpu@1c00000 {
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "kgsl_3d0_irq";
 
-			clocks = <&gcc GCC_GFX3D_OXILI_CLK>,
+			clocks = <&gcc GCC_GFX3D_OXILI_AON_CLK>,
+				 <&gcc GCC_GFX3D_OXILI_CLK>,
 				 <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
 				 <&gcc GCC_GFX3D_OXILI_GMEM_CLK>,
 				 <&gcc GCC_GFX3D_BIMC_CLK>,
-				 <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
-				 <&gcc GCC_GFX3D_OXILI_AON_CLK>;
-			clock-names = "core",
+				 <&gcc GCC_GFX3D_OXILI_TIMER_CLK>;
+			clock-names = "alwayson",
+				      "core",
 				      "iface",
 				      "mem",
 				      "mem_iface",
-				      "rbbmtimer",
-				      "alwayson";
+				      "rbbmtimer";
 
 			power-domains = <&gcc OXILI_GX_GDSC>;
 

-- 
2.49.0

