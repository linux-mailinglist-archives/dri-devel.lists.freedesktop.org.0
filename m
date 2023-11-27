Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585887FA499
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D4410E386;
	Mon, 27 Nov 2023 15:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374F710E379
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:29:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54afdbdb7d2so3977560a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098954; x=1701703754; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9K/KL6rUHA7mDcBMrrqIFDkXaVSeDD2iYf5D2W8YBIg=;
 b=J5neZy+/QVFo7VXkJul8+/L+j7rN8HN3abmsEbPdrUQarfrMDaIM/UfOhaHR9DbaBt
 Q2u1/NuGC0fEwp9A1Vn1s2YEl4b/3K88FPcgiOJUgCuX4QrNpBa7EwG0qEIT3MSOBuw/
 vVg/asC1KvhhM6h+t7Rye19zr9DFQdNbynIaU4EtAuVHf+sA7XUObwGiAh+WBaKeBnDX
 6tUS4hBSWIttbHg0mkuL6N9fsNVU3gyCQINEPZMGjfhyBnpFP5g/EpeR9j61UBGKDS6T
 mqE7yAZ1ey2RyKfwMk/vG2uRnhbwa19Se/QXEACjtDzZN/EXTspjLGHZP1H6YRdYjjKT
 MP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098954; x=1701703754;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9K/KL6rUHA7mDcBMrrqIFDkXaVSeDD2iYf5D2W8YBIg=;
 b=d2T+xPR/skzTdzcGLHLffV0elRP7uZ8Gbd4bd+fVPo4EkB9ee/LMCv9eV43hfvTeHw
 4YyNECkwpK0C52iumnHD+8W+hIjf4Uj+kx7k/WhO2I18quRIpWKlEtd8hHDndwcX/m/Z
 aZoznTXsnUiG/YheHOvSElve4A1QfKBF4iIxuM78vXS4L/EtZGuKZflz1Bf/bkLlhoe1
 M2Qkmtfthmvln//miYLZe8v0Il/Wq/oKeoHUKam9yvVQB5jvwXtuu0SwoTblSxc8sIDh
 yOSNtsYwHfIDxGfjIGymLSIBpD+5Gq6au6hNhaVesuXndTMnWgJIml4kiYBGlK8TTc4R
 231Q==
X-Gm-Message-State: AOJu0Yw4h8U+7b9PK4bLnz8LRwTtJBfr2SI3KVUnZj5cmu9lJ3SXDdDI
 XvIyA2GYBdO2yi83EMyXbCE7iQ==
X-Google-Smtp-Source: AGHT+IEIiagBs4pKlQcv6cU58laBuVympuk9luCBlm1ZQI6HobNWAnEpM0jGc9hClEDNkc6Pr54I+w==
X-Received: by 2002:a50:c04a:0:b0:53d:d913:d3cb with SMTP id
 u10-20020a50c04a000000b0053dd913d3cbmr9226012edd.28.1701098954710; 
 Mon, 27 Nov 2023 07:29:14 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:29:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:47 +0100
Subject: [PATCH v2 07/12] arm64: dts: qcom: sc7280: Add the missing MDSS
 icc path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-7-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=1493;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RpzLMWuMbYjvqQjs1yjMVMPj1VmkWicMXA9dO0pSXPQ=;
 b=R55EDfVA3vNj1gKF5/rCo8RrwCBiKh1MWLkiyJUgCpQVrEUf8nd/J8yIoPfGKZI92hXoMX4hD
 5r03X65uJfzC/GqWapMJgl2lg6iTLvi+NlygsZ5KcTfiGZHefthMnG8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDSS, aside from the MDP-MEM path, also requires the CPU-DISP_CFG one.
Failing to provide it may result in register accesses failing and that's
never good.

Add the missing path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 04bf85b0399a..41d327b1f1b6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -3958,8 +3959,12 @@ mdss: display-subsystem@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc2 SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			iommus = <&apps_smmu 0x900 0x402>;
 

-- 
2.43.0

