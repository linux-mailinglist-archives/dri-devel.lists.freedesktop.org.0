Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617543A77E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AE66E3BB;
	Mon, 25 Oct 2021 22:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8706E332
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z6so213720lji.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1KbAPm4DdML0UKLYCRuxwK7QZwf/tFMj+PdghHAnNSA=;
 b=SzSRIYbPjMmp6Y8bfRr6KnmIrziBP3/QtAWk73ht78ez9cIqpokXKGBI44OJD1gNCV
 e9pZ2eVPEppp9YIQmhGQXzEvif0nYwqeui+aRpcKNTMmj7Zrd9mw6Hj4TwSQteRl59F6
 l8ea/90pB83b6lWj7GOU40nqm9wIuLcYfPzxTG0ilBUkAe4PGy6CQj9lL/BcTcEK0Nsh
 hTwMAOwwT4aTbxGqNUVGkCTvF6jgjo5lk9exCh5JwHjSuLabfHT4yLsorXXPBLatyBrK
 uK0ong+9XRsgi1m9MOd3Wlcc3hkonIGrzrVFZCrZQ1qSI8zF/7LLVhXjUiiBrdohiA5C
 Msbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KbAPm4DdML0UKLYCRuxwK7QZwf/tFMj+PdghHAnNSA=;
 b=2FgfQ0PeRefCwnKiI9EocEfNE8S3gpKGBCNxE6+ParyyMHTDw8irsiH5FxWkoqRNnw
 Tb2bEnd3Z5GhVomJhhhC7fM1pwOBM2Fj98rS5Pb4Wm9WLPQrxi+oeFx4RORlPd0oERFD
 wliHn4VnCGa7UVVNjP1aF9B7fRwl8xDyoM9Xf1GGRXVGKmNyMiaMInBnf0uqwvWqfOPu
 Mo4I41amg68j6FpnDHfiv3RJ8siykDO5EiPiZSujMH6OgJudZ0d0j3yiWiY1aadquMYH
 l/wBnoE5tRmvz/zc/1y4rLag/WMtr1lrSbjICaoHseGrdGwwUONGg7qIOJN2SGBRW1Yu
 b0ew==
X-Gm-Message-State: AOAM531mdLpDHRqjI0m4fkzCoRE/Jo/NCPxx7NOx0YU6Kn6iRnyLC9G8
 rGsEcdrKhMr4ExuP4lI9Rk8=
X-Google-Smtp-Source: ABdhPJzSk1oVa5bOYrbjpaiyB2q1FRcabYkKIBUyL4geJx/BHzjCTM9ff793cUHyzVfwdZ3ZxmF+Ag==
X-Received: by 2002:a05:651c:511:: with SMTP id
 o17mr22446701ljp.441.1635201979406; 
 Mon, 25 Oct 2021 15:46:19 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 36/39] ARM: tegra: Add OPP tables and power domains to
 Tegra30 device-trees
Date: Tue, 26 Oct 2021 01:40:29 +0300
Message-Id: <20211025224032.21012-37-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP tables and power domains to all peripheral devices which
support power management on Tegra30 SoC.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-trimslice.dts       |    2 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    1 +
 arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |    1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   17 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    1 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1227 ++++++++++++++++-
 arch/arm/boot/dts/tegra30.dtsi                |  153 ++
 8 files changed, 1398 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 582dc7910ff8..d6c99e17f28b 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -445,7 +445,7 @@ pci_vdd_reg: regulator@4 {
 		regulator-always-on;
 	};
 
-	vdd_core: regulator@5 {
+	vdd_core: regulator-core {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_core";
 		regulator-min-microvolt = <1300000>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 07d4ea130964..6f88fb1ed873 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -980,6 +980,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	ahub@70080000 {
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e159feeedef7..b54cbb24c4d3 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1915,6 +1915,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&core_vdd_reg>;
 	};
 
 	ahub@70080000 {
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 448f1397e64a..b2bba923eb93 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -391,6 +391,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	ahub@70080000 {
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 413e35215804..0627b64f044d 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -765,9 +765,14 @@ vdd1_reg: vdd1 {
 
 				vddctrl_reg: vddctrl {
 					regulator-name = "+V1.0_VDD_CPU";
-					regulator-min-microvolt = <1150000>;
-					regulator-max-microvolt = <1150000>;
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
 					regulator-always-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				reg_1v8_vio: vio {
@@ -890,18 +895,23 @@ temp-sensor@4c {
 		};
 
 		/* SW: +V1.2_VDD_CORE */
-		regulator@60 {
+		vdd_core: regulator@60 {
 			compatible = "ti,tps62362";
 			reg = <0x60>;
 
 			regulator-name = "tps62362-vout";
 			regulator-min-microvolt = <900000>;
 			regulator-max-microvolt = <1400000>;
+			regulator-coupled-with = <&vddctrl_reg>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
 			regulator-boot-on;
 			regulator-always-on;
 			ti,vsel0-state-low;
 			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
 			ti,vsel1-state-low;
+
+			nvidia,tegra-core-regulator;
 		};
 	};
 
@@ -914,6 +924,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Set DEV_OFF bit in DCDC control register of TPS65911 PMIC */
 		i2c-thermtrip {
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index e63f82f619e9..a93bc452d315 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -277,6 +277,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <458>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	mc_timings: memory-controller@7000f000 {
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index af9640401402..44c0a8c105ec 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -1,6 +1,56 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	core_opp_table: opp-table-core {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		core_opp_950: opp-950000 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-level = <950000>;
+		};
+
+		core_opp_1000: opp-1000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-level = <1000000>;
+		};
+
+		core_opp_1050: opp-1050000 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-level = <1050000>;
+		};
+
+		core_opp_1100: opp-1100000 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-level = <1100000>;
+		};
+
+		core_opp_1150: opp-1150000 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-level = <1150000>;
+		};
+
+		core_opp_1200: opp-1200000 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-level = <1200000>;
+		};
+
+		core_opp_1250: opp-1250000 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-level = <1250000>;
+		};
+
+		core_opp_1300: opp-1300000 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-level = <1300000>;
+		};
+
+		core_opp_1350: opp-1350000 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-level = <1350000>;
+		};
+	};
+
 	emc_icc_dvfs_opp_table: opp-table-emc {
 		compatible = "operating-points-v2";
 
@@ -8,126 +58,147 @@ opp-12750000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-12750000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-12750000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-25500000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-25500000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-25500000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-27000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-27000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-27000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-51000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-51000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-51000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-54000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-54000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-54000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-102000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-102000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-102000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-108000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-108000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-204000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
 			opp-suspend;
 		};
 
@@ -135,6 +206,7 @@ opp-204000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 			opp-suspend;
 		};
 
@@ -142,138 +214,161 @@ opp-333500000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-333500000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-333500000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-375000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-375000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-375000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-400000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-400000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-400000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-416000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-416000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-450000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-450000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-500000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <500000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-500000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <500000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-533000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-533000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-625000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-625000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp-667000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <667000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-750000000-1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <750000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
 		};
 
 		opp-800000000-1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <800000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
 		};
 
 		opp-900000000-1350 {
 			opp-microvolt = <1350000 1350000 1350000>;
 			opp-hz = /bits/ 64 <900000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
 		};
 	};
 
@@ -401,4 +496,1134 @@ opp-900000000 {
 			opp-peak-kBps = <7200000>;
 		};
 	};
-};
+
+	pcie_dvfs_opp_table: opp-table-pcie {
+		compatible = "operating-points-v2";
+
+		opp-250000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	host1x_dvfs_opp_table: opp-table-host1x {
+		compatible = "operating-points-v2";
+
+		opp-152000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-188000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <188000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-222000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <222000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-242000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <242000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-254000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <254000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-267000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-300000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	mpe_dvfs_opp_table: opp-table-mpe {
+		compatible = "operating-points-v2";
+
+		opp-234000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-247000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-285000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-304000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-332000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-361000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-380000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-408000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-416000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-446000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-484000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-520000000-1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-600000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	vi_dvfs_opp_table: opp-table-vi {
+		compatible = "operating-points-v2";
+
+		opp-216000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-219000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <219000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-267000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-285000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-300000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-371000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <371000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-409000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <409000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-425000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <425000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-470000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <470000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	epp_dvfs_opp_table: opp-table-epp {
+		compatible = "operating-points-v2";
+
+		opp-267000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-285000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-304000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-332000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-361000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-380000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-408000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-416000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-446000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-484000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-520000000-1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-600000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	gr2d_dvfs_opp_table: opp-table-gr2d {
+		compatible = "operating-points-v2";
+
+		opp-267000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-285000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-304000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-332000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-361000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-380000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-408000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-416000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-446000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-484000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-520000000-1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-600000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	gr3d_dvfs_opp_table: opp-table-gr3d {
+		compatible = "operating-points-v2";
+
+		opp-234000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>, <&core_opp_1000>;
+		};
+
+		opp-247000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>, <&core_opp_1000>;
+		};
+
+		opp-285000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>, <&core_opp_1050>;
+		};
+
+		opp-304000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>, <&core_opp_1050>;
+		};
+
+		opp-332000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>, <&core_opp_1100>;
+		};
+
+		opp-361000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>, <&core_opp_1100>;
+		};
+
+		opp-380000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>, <&core_opp_1150>;
+		};
+
+		opp-408000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>, <&core_opp_1150>;
+		};
+
+		opp-416000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>, <&core_opp_1200>;
+		};
+
+		opp-446000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>, <&core_opp_1200>;
+		};
+
+		opp-484000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>, <&core_opp_1250>;
+		};
+
+		opp-520000000-1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>, <&core_opp_1300>;
+		};
+
+		opp-600000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>, <&core_opp_1350>;
+		};
+	};
+
+	disp1_dvfs_opp_table: opp-table-disp1 {
+		compatible = "operating-points-v2";
+
+		opp-120000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-155000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-190000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-268000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp2_dvfs_opp_table: opp-table-disp2 {
+		compatible = "operating-points-v2";
+
+		opp-120000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-155000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-190000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-268000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	hdmi_dvfs_opp_table: opp-table-hdmi {
+		compatible = "operating-points-v2";
+
+		opp-148500000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <148500000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	tvo_dvfs_opp_table: opp-table-tvo {
+		compatible = "operating-points-v2";
+
+		opp-297000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	dsia_dvfs_opp_table: opp-table-dsia {
+		compatible = "operating-points-v2";
+
+		opp-275000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	dsib_dvfs_opp_table: opp-table-dsib {
+		compatible = "operating-points-v2";
+
+		opp-275000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sclk_dvfs_opp_table: opp-table-sclk {
+		compatible = "operating-points-v2";
+
+		opp-51000000-950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-136000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <136000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-164000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <164000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-191000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <191000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-205000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <205000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-216000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-227000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <227000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-267000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-334000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <334000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-378000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <378000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	pll_c_dvfs_opp_table: opp-table-pllc {
+		compatible = "operating-points-v2";
+
+		opp-533000000-950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-667000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-800000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-1066000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-1200000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	pll_e_dvfs_opp_table: opp-table-plle {
+		compatible = "operating-points-v2";
+
+		opp-100000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_m_dvfs_opp_table: opp-table-pllm {
+		compatible = "operating-points-v2";
+
+		opp-533000000-950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-667000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-800000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-1066000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	vde_dvfs_opp_table: opp-table-vde {
+		compatible = "operating-points-v2";
+
+		opp-228000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-247000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-275000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-304000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-332000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-352000000-1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <352000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-380000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-400000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp-416000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-437000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <437000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-484000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-520000000-1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-600000000-1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	fuse_burn_dvfs_opp_table: opp-table-fuseburn {
+		compatible = "operating-points-v2";
+
+		opp-26000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <26000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	nor_dvfs_opp_table: opp-table-nor {
+		compatible = "operating-points-v2";
+
+		opp-108000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <108000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-115000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <115000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-130000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <130000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-133000000-1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	pwm_dvfs_opp_table: opp-table-pwm {
+		compatible = "operating-points-v2";
+
+		opp-408000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sbc1_dvfs_opp_table: opp-table-sbc1 {
+		compatible = "operating-points-v2";
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-60000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-100000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc2_dvfs_opp_table: opp-table-sbc2 {
+		compatible = "operating-points-v2";
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-60000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-100000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc3_dvfs_opp_table: opp-table-sbc3 {
+		compatible = "operating-points-v2";
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-60000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-100000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc4_dvfs_opp_table: opp-table-sbc4 {
+		compatible = "operating-points-v2";
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-60000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-100000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc5_dvfs_opp_table: opp-table-sbc5 {
+		compatible = "operating-points-v2";
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-60000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-100000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc6_dvfs_opp_table: opp-table-sbc6 {
+		compatible = "operating-points-v2";
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-60000000-1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-100000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sdmmc1_dvfs_opp_table: opp-table-sdmmc1 {
+		compatible = "operating-points-v2";
+
+		opp-104000000-950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-208000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sdmmc3_dvfs_opp_table: opp-table-sdmmc3 {
+		compatible = "operating-points-v2";
+
+		opp-104000000-950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-208000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	usbd_dvfs_opp_table: opp-table-usbd {
+		compatible = "operating-points-v2";
+
+		opp-480000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	usb2_dvfs_opp_table: opp-table-usb2 {
+		compatible = "operating-points-v2";
+
+		opp-480000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	usb3_dvfs_opp_table: opp-table-usb3 {
+		compatible = "operating-points-v2";
+
+		opp-480000000-1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+};
+
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index ae3df73c20a7..e40d5563778b 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -55,6 +55,8 @@ pcie@3000 {
 			 <&tegra_car 72>,
 			 <&tegra_car 74>;
 		reset-names = "pex", "afi", "pcie_x";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&pcie_dvfs_opp_table>;
 		status = "disabled";
 
 		pci@1,0 {
@@ -124,6 +126,8 @@ host1x@50000000 {
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
+		power-domains = <&pd_heg>;
+		operating-points-v2 = <&host1x_dvfs_opp_table>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -137,6 +141,8 @@ mpe@54040000 {
 			clocks = <&tegra_car TEGRA30_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+			power-domains = <&pd_mpe>;
+			operating-points-v2 = <&mpe_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
 		};
@@ -148,6 +154,8 @@ vi@54080000 {
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
 			reset-names = "vi";
+			power-domains = <&pd_venc>;
+			operating-points-v2 = <&vi_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 		};
@@ -159,6 +167,8 @@ epp@540c0000 {
 			clocks = <&tegra_car TEGRA30_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+			power-domains = <&pd_heg>;
+			operating-points-v2 = <&epp_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
 		};
@@ -170,6 +180,7 @@ isp@54100000 {
 			clocks = <&tegra_car TEGRA30_CLK_ISP>;
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
+			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
 		};
@@ -181,6 +192,8 @@ gr2d@54140000 {
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			power-domains = <&pd_heg>;
+			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_G2>;
 		};
@@ -194,6 +207,9 @@ gr3d@54180000 {
 			resets = <&tegra_car 24>,
 				 <&tegra_car 98>;
 			reset-names = "3d", "3d2";
+			power-domains = <&pd_3d0>, <&pd_3d1>;
+			power-domain-names = "3d0", "3d1";
+			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_NV>,
 				 <&mc TEGRA_SWGROUP_NV2>;
@@ -208,6 +224,8 @@ dc@54200000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&disp1_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
@@ -238,6 +256,8 @@ dc@54240000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&disp2_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
@@ -268,6 +288,8 @@ hdmi@54280000 {
 			clock-names = "hdmi", "parent";
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&hdmi_dvfs_opp_table>;
 			status = "disabled";
 		};
 
@@ -276,6 +298,8 @@ tvo@542c0000 {
 			reg = <0x542c0000 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_TVO>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&tvo_dvfs_opp_table>;
 			status = "disabled";
 		};
 
@@ -287,6 +311,8 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&dsia_dvfs_opp_table>;
 			status = "disabled";
 		};
 
@@ -298,6 +324,8 @@ dsi@54400000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 84>;
 			reset-names = "dsi";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&dsib_dvfs_opp_table>;
 			status = "disabled";
 		};
 	};
@@ -358,6 +386,34 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		sclk {
+			compatible = "nvidia,tegra30-sclk";
+			clocks = <&tegra_car TEGRA30_CLK_SCLK>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&sclk_dvfs_opp_table>;
+		};
+
+		pll-c {
+			compatible = "nvidia,tegra30-pllc";
+			clocks = <&tegra_car TEGRA30_CLK_PLL_C>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&pll_c_dvfs_opp_table>;
+		};
+
+		pll-e {
+			compatible = "nvidia,tegra30-plle";
+			clocks = <&tegra_car TEGRA30_CLK_PLL_E>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&pll_e_dvfs_opp_table>;
+		};
+
+		pll-m {
+			compatible = "nvidia,tegra30-pllm";
+			clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&pll_m_dvfs_opp_table>;
+		};
 	};
 
 	flow-controller@60007000 {
@@ -468,6 +524,8 @@ vde@6001a000 {
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
 		iommus = <&mc TEGRA_SWGROUP_VDE>;
+		power-domains = <&pd_vde>;
+		operating-points-v2 = <&vde_dvfs_opp_table>;
 	};
 
 	apbmisc@70000800 {
@@ -565,6 +623,8 @@ gmi@70009000 {
 		clock-names = "gmi";
 		resets = <&tegra_car 42>;
 		reset-names = "gmi";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&nor_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -575,6 +635,8 @@ pwm: pwm@7000a000 {
 		clocks = <&tegra_car TEGRA30_CLK_PWM>;
 		resets = <&tegra_car 17>;
 		reset-names = "pwm";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&pwm_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -676,6 +738,8 @@ spi@7000d400 {
 		reset-names = "spi";
 		dmas = <&apbdma 15>, <&apbdma 15>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc1_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -690,6 +754,8 @@ spi@7000d600 {
 		reset-names = "spi";
 		dmas = <&apbdma 16>, <&apbdma 16>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc2_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -704,6 +770,8 @@ spi@7000d800 {
 		reset-names = "spi";
 		dmas = <&apbdma 17>, <&apbdma 17>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -718,6 +786,8 @@ spi@7000da00 {
 		reset-names = "spi";
 		dmas = <&apbdma 18>, <&apbdma 18>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc4_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -732,6 +802,8 @@ spi@7000dc00 {
 		reset-names = "spi";
 		dmas = <&apbdma 27>, <&apbdma 27>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc5_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -746,6 +818,8 @@ spi@7000de00 {
 		reset-names = "spi";
 		dmas = <&apbdma 28>, <&apbdma 28>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc6_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -765,6 +839,72 @@ tegra_pmc: pmc@7000e400 {
 		clocks = <&tegra_car TEGRA30_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 		#clock-cells = <1>;
+
+		pd_core: core-domain {
+			#power-domain-cells = <0>;
+			operating-points-v2 = <&core_opp_table>;
+		};
+
+		powergates {
+			pd_3d0: td {
+				clocks = <&tegra_car TEGRA30_CLK_GR3D>;
+				resets = <&mc TEGRA30_MC_RESET_3D>,
+					 <&tegra_car TEGRA30_CLK_GR3D>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_3d1: td2 {
+				clocks = <&tegra_car TEGRA30_CLK_GR3D2>;
+				resets = <&mc TEGRA30_MC_RESET_3D2>,
+					 <&tegra_car TEGRA30_CLK_GR3D2>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA30_CLK_ISP>,
+					 <&tegra_car TEGRA30_CLK_VI>,
+					 <&tegra_car TEGRA30_CLK_CSI>;
+				resets = <&mc TEGRA30_MC_RESET_ISP>,
+					 <&mc TEGRA30_MC_RESET_VI>,
+					 <&tegra_car TEGRA30_CLK_ISP>,
+					 <&tegra_car 20 /* VI */>,
+					 <&tegra_car TEGRA30_CLK_CSI>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_vde: vdec {
+				clocks = <&tegra_car TEGRA30_CLK_VDE>;
+				resets = <&mc TEGRA30_MC_RESET_VDE>,
+					 <&tegra_car TEGRA30_CLK_VDE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_mpe: mpe {
+				clocks = <&tegra_car TEGRA30_CLK_MPE>;
+				resets = <&mc TEGRA30_MC_RESET_MPE>,
+					 <&tegra_car TEGRA30_CLK_MPE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_heg: heg {
+				clocks = <&tegra_car TEGRA30_CLK_GR2D>,
+					 <&tegra_car TEGRA30_CLK_EPP>,
+					 <&tegra_car TEGRA30_CLK_HOST1X>;
+				resets = <&mc TEGRA30_MC_RESET_2D>,
+					 <&mc TEGRA30_MC_RESET_EPP>,
+					 <&mc TEGRA30_MC_RESET_HC>,
+					 <&tegra_car TEGRA30_CLK_GR2D>,
+					 <&tegra_car TEGRA30_CLK_EPP>,
+					 <&tegra_car TEGRA30_CLK_HOST1X>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+		};
 	};
 
 	mc: memory-controller@7000f000 {
@@ -785,6 +925,7 @@ emc: memory-controller@7000f400 {
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
+		power-domains = <&pd_core>;
 
 		nvidia,memory-controller = <&mc>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
@@ -799,6 +940,8 @@ fuse@7000f800 {
 		clock-names = "fuse";
 		resets = <&tegra_car 39>;
 		reset-names = "fuse";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&fuse_burn_dvfs_opp_table>;
 	};
 
 	tsensor: tsensor@70014000 {
@@ -921,6 +1064,8 @@ mmc@78000000 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc1_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -943,6 +1088,8 @@ mmc@78000400 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -967,6 +1114,8 @@ usb@7d000000 {
 		reset-names = "usb";
 		nvidia,needs-double-reset;
 		nvidia,phy = <&phy1>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&usbd_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -1008,6 +1157,8 @@ usb@7d004000 {
 		resets = <&tegra_car 58>;
 		reset-names = "usb";
 		nvidia,phy = <&phy2>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&usb2_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -1048,6 +1199,8 @@ usb@7d008000 {
 		resets = <&tegra_car 59>;
 		reset-names = "usb";
 		nvidia,phy = <&phy3>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&usb3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
-- 
2.33.1

