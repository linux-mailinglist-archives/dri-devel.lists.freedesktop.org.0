Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20663E14A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A651110E4E0;
	Wed, 30 Nov 2022 20:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F21310E4D3;
 Wed, 30 Nov 2022 20:10:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a7so22145928ljq.12;
 Wed, 30 Nov 2022 12:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n6KtEaf/qmwW9+C/8cbU0t4+fA9tt0ZOxNed3iCE/Io=;
 b=RMNPXwu82W0pG+t8O8HH/V7/u2v+Vb1SNXjosRZzZHhmrwA+iIzc6j4yoh/J5PKFWD
 eQ4dJienr68cFYcN9+7621V4XOUvPqhLYVckFsDWVz3X731w3G6Xho2trunsXRaCmwjl
 H5p23onyZ4R3c3r2McKVkJFw0nYUqHfjyaHU7dXl/g3GIfbk6hYqs1GRvnk3tMMmhJFq
 fQouhvwvVYcMWh+PE/7UfPsB79vxnL1MgA/MhfNcFSFpfL6nrZbO1CqlgDUX+WsRVGXX
 jTHj1l0ReWwPNXykNaBU4U+F+A4WTMEOucQrHwuPEM6bNpT2+++YJ5MFk9Y+71tM69GO
 ARdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n6KtEaf/qmwW9+C/8cbU0t4+fA9tt0ZOxNed3iCE/Io=;
 b=LTbwlHPGmoTdyRAqLl4dtqa+4MIjich8TpNt5cGRu4Ovd4/YhygkMCwJFJRtft204/
 790+yDy/pcLclDNV5W3eu4Jo6hv6Dx8fevPQUQTaRJ2qdWZgT1Iz8PJV+uyLwf8vYbYS
 7C8IiRR8X2wnuGU/eOZA8Ws716/re/yl/xONzTjR6lgwpSJrp03FlqlYtJ7dnalIlyMP
 78Vt0kcRm+HrwHpRJYM151bcH2WGTaaD9nRLz0HJx/M5ZPSkPi0epzSuPT3E07OclOYP
 QyD3yv35UBDsFa/FI+/G8ZmxNTO0QMTx9TAYPNftcC0kqcy4eVqUHTt/wRJ+Z/L/mEWv
 UODg==
X-Gm-Message-State: ANoB5pl400sOOiX6TACFyhsrAKVJ2pfHC/xvULISmz3ca74beNRZbeH/
 YPU6UvfiAYRq9b49lREp9GE=
X-Google-Smtp-Source: AA0mqf5P05TtUcf7Z754qXf11Dn1gzaFO/dbcqSzW1O9opHt5eNJRN1EWK5T5FTIteTnINe3RsNLOA==
X-Received: by 2002:a05:651c:1244:b0:278:a461:cb7d with SMTP id
 h4-20020a05651c124400b00278a461cb7dmr14760527ljh.246.1669839003243; 
 Wed, 30 Nov 2022 12:10:03 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:10:02 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 03/12] arm64: dts: qcom: sm6115: Add cpufreq-hw support
Date: Wed, 30 Nov 2022 21:09:41 +0100
Message-Id: <20221130200950.144618-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130200950.144618-1-a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cpufreq-hw node and assign qcom,freq-domain properties
to CPUs to enable CPU clock scaling.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0340ed21be05..2a55087b103e 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -41,6 +41,7 @@ CPU0: cpu@0 {
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -55,6 +56,7 @@ CPU1: cpu@1 {
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 		};
 
 		CPU2: cpu@2 {
@@ -65,6 +67,7 @@ CPU2: cpu@2 {
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 		};
 
 		CPU3: cpu@3 {
@@ -75,6 +78,7 @@ CPU3: cpu@3 {
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 		};
 
 		CPU4: cpu@100 {
@@ -85,6 +89,7 @@ CPU4: cpu@100 {
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			next-level-cache = <&L2_1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -99,6 +104,7 @@ CPU5: cpu@101 {
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 		};
 
 		CPU6: cpu@102 {
@@ -109,6 +115,7 @@ CPU6: cpu@102 {
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 		};
 
 		CPU7: cpu@103 {
@@ -119,6 +126,7 @@ CPU7: cpu@103 {
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
 			next-level-cache = <&L2_1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 		};
 
 		cpu-map {
@@ -842,6 +850,17 @@ intc: interrupt-controller@f200000 {
 			redistributor-stride = <0x0 0x20000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		cpufreq_hw: cpufreq@f521000 {
+			compatible = "qcom,cpufreq-hw";
+			reg = <0x0f521000 0x1000>, <0x0f523000 0x1000>;
+
+			reg-names = "freq-domain0", "freq-domain1";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.25.1

