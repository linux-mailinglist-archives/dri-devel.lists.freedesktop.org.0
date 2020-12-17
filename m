Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719E2DDF90
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4F88986D;
	Fri, 18 Dec 2020 08:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9D6E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h205so16305675lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IL+NmJVnwmYv/CywH2GUQ/gWpd13f3ajU3NXZlTVbdg=;
 b=txnXuYFD38oIYycrkDEp7M1E/l60Gn9EGGOP70Z7IoC2IEv7vlcHuBGNN1USxI8Df1
 lZ+tV1jE+7wn5LOakTypQ0jf7g3pwep2gPrjG4TibIzjGPBbTrvFQ8xNOqS6EtKUxX/R
 7ivA9xVS/l334/vZy6iSdNXlHwJQtJJLQVyByr+TlMWHwpWEpJRqgJWWQbGKZP8oTzxH
 A4fGWfx9XMexK1Oigz/6pK9i2brj31nE23Yi502J4JJ7+KONZsLDVjzGItG68iTwMJh/
 73qsxsYZu6tMObzfMq3J0fX9R7nGBEESutcb+92cRGJRSwWWAqDSWzw5VaKjqFzEOV5w
 YEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IL+NmJVnwmYv/CywH2GUQ/gWpd13f3ajU3NXZlTVbdg=;
 b=Up2HveT19HdgX/yRNuk0cwL8/YpVGwR70qeot2QIqBSJhifqe5ETxOenjH4bu5pomm
 CP5rEArn+xfhnEUhfSKT58pxnd+mmdZrvPE5GfuYQ2HEoXtK51lo/R5J7xdkQURN/UyX
 p0ii8hxKc2NXbNBpyoOEDjL2MQ3lG40oRL02ZIYDmAi1B5MHZOaAuFKGd6KztPAMWwnO
 zSL4a4bPZZQ0ciJ87zzF8ZG3KQh9zaNWoyYGGGSzNYyeudEHGsGG/U1LMnQuiZYmMYWD
 8sxxflO/R6PbA5jW9VNwkw23XFUd/dSimlBkk9aLoQJ+KFfKcnykuf32G6lCwI8DQSEU
 yHjg==
X-Gm-Message-State: AOAM532ZDxgquye37RRKIteBGicpN/Yk3iMVEKOTQolLod1L+4fTi1W8
 MCEBEGRSP9XH0z/NO3+H/iLhS/ff2w0=
X-Google-Smtp-Source: ABdhPJyZsZFwXs6GG8in3w4PTgG9hVUre0IKpobxJ8T/ror7rKHMqE6PaWeQDgQCnp22EvmI3cNuvw==
X-Received: by 2002:a2e:5756:: with SMTP id r22mr213920ljd.481.1608228491012; 
 Thu, 17 Dec 2020 10:08:11 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:10 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 44/48] ARM: tegra: Add OPP tables and power domains to
 Tegra30 device-tree
Date: Thu, 17 Dec 2020 21:06:34 +0300
Message-Id: <20201217180638.22748-45-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP tables and power domains to Tegra30 device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    4 +
 arch/arm/boot/dts/tegra30-beaver.dts          |    4 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   20 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   20 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    4 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1412 +++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  358 +++++
 7 files changed, 1816 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 7dd2e9b592de..3ded32fdb381 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1047,6 +1047,10 @@ battery_cell: battery-cell {
 		operating-range-celsius = <0 45>;
 	};
 
+	core-domain {
+		power-supply = <&vdd_core>;
+	};
+
 	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e0624b74fb50..bcf421cb7f45 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1965,6 +1965,10 @@ usb-phy@7d008000 {
 		status = "okay";
 	};
 
+	core-domain {
+		power-supply = <&core_vdd_reg>;
+	};
+
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index dab9989fa760..d74c9ca78a7f 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -272,9 +272,14 @@ vdd2_reg: vdd2 {
 
 				vddctrl_reg: vddctrl {
 					regulator-name = "vdd_cpu,vdd_sys";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
 					regulator-always-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				vio_reg: vio {
@@ -342,17 +347,22 @@ temperature-sensor@4c {
 			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		tps62361@60 {
+		vdd_core: tps62361@60 {
 			compatible = "ti,tps62361";
 			reg = <0x60>;
 
 			regulator-name = "tps62361-vout";
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1500000>;
+			regulator-coupled-with = <&vddctrl_reg>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
 			regulator-boot-on;
 			regulator-always-on;
 			ti,vsel0-state-high;
 			ti,vsel1-state-high;
+
+			nvidia,tegra-core-regulator;
 		};
 	};
 
@@ -418,6 +428,10 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
+	core-domain {
+		power-supply = <&vdd_core>;
+	};
+
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index e36aa3ce6c3d..96ad01f9c89a 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -764,9 +764,14 @@ vdd1_reg: vdd1 {
 
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
@@ -889,18 +894,23 @@ temp-sensor@4c {
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
 
@@ -960,6 +970,10 @@ usb-phy@7d004000 {
 		vbus-supply = <&reg_lan_v_bus>;
 	};
 
+	core-domain {
+		power-supply = <&vdd_core>;
+	};
+
 	clk32k_in: xtal1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 74da1360d297..0223328bdfed 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -377,6 +377,10 @@ usb-phy@7d008000 {
 		status = "okay";
 	};
 
+	core-domain {
+		power-supply = <&vdd_core>;
+	};
+
 	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
 	clk32k_in: clock {
 		compatible = "fixed-clock";
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index cbe84d25e726..983db1a06682 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -1,6 +1,56 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	core_opp_table: core-power-domain-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		core_opp_950: opp@950000 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-level = <950000>;
+		};
+
+		core_opp_1000: opp@1000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-level = <1000000>;
+		};
+
+		core_opp_1050: opp@1050000 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-level = <1050000>;
+		};
+
+		core_opp_1100: opp@1100000 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-level = <1100000>;
+		};
+
+		core_opp_1150: opp@1150000 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-level = <1150000>;
+		};
+
+		core_opp_1200: opp@1200000 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-level = <1200000>;
+		};
+
+		core_opp_1250: opp@1250000 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-level = <1250000>;
+		};
+
+		core_opp_1300: opp@1300000 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-level = <1300000>;
+		};
+
+		core_opp_1350: opp@1350000 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-level = <1350000>;
+		};
+	};
+
 	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
 		compatible = "operating-points-v2";
 
@@ -8,258 +58,301 @@ opp@12750000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@12750000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@12750000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@25500000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@25500000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@25500000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@27000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@27000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@27000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@51000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@51000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@51000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@54000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@54000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@54000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@102000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@102000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@102000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@108000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@108000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@204000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@204000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@333500000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@333500000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@333500000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@375000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@375000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@375000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@400000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@400000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@400000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@416000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@416000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@450000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@450000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@533000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@533000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@625000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@625000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@667000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <667000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@750000000,1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <750000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
 		};
 
 		opp@800000000,1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <800000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
 		};
 
 		opp@900000000,1350 {
 			opp-microvolt = <1350000 1350000 1350000>;
 			opp-hz = /bits/ 64 <900000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
 		};
 	};
 
@@ -380,4 +473,1323 @@ opp@900000000 {
 			opp-peak-kBps = <7200000>;
 		};
 	};
+
+	gr2d_dvfs_opp_table: gr2d-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	gr3d_dvfs_opp_table: gr3d-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@234000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>, <&core_opp_1000>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>, <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>, <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>, <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>, <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>, <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>, <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>, <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>, <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>, <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>, <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>, <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>, <&core_opp_1350>;
+		};
+	};
+
+	afi_dvfs_opp_table: afi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@250000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	cve_dvfs_opp_table: cve-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@297000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp1_dvfs_opp_table: disp1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@155000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@190000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@268000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp2_dvfs_opp_table: disp2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@155000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@190000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@268000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	dsia_dvfs_opp_table: dsia-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@275000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	dsib_dvfs_opp_table: dsib-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@275000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	epp_dvfs_opp_table: epp-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	fuse_burn_dvfs_opp_table: fuse_burn-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@26000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <26000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	hdmi_dvfs_opp_table: hdmi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@148500000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <148500000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	host1x_dvfs_opp_table: host1x-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@152000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@188000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <188000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@222000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <222000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@242000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <242000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@254000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <254000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@267000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@300000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	mipi_dvfs_opp_table: mipi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@60000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	mpe_dvfs_opp_table: mpe-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@234000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	sclk_dvfs_opp_table: sclk-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@51000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@136000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <136000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@164000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <164000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@191000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <191000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@205000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <205000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@216000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@227000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <227000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@267000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@334000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <334000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@378000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <378000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	se_dvfs_opp_table: se-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+
+		opp@625000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <625000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	ndflash_dvfs_opp_table: ndflash-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@200000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <200000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	nor_dvfs_opp_table: nor-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@108000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <108000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@115000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <115000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@130000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <130000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@133000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	pcie_dvfs_opp_table: pcie-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@250000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_c_dvfs_opp_table: pll_c-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@533000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@667000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@800000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@1066000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@1200000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	pll_e_dvfs_opp_table: pll_e-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@100000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_m_dvfs_opp_table: pll_m-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@533000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@667000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@800000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@1066000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	pwm_dvfs_opp_table: pwm-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@408000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sata_dvfs_opp_table: sata-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sata_oob_dvfs_opp_table: sata_oob-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sbc1_dvfs_opp_table: sbc1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc2_dvfs_opp_table: sbc2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc3_dvfs_opp_table: sbc3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc4_dvfs_opp_table: sbc4-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc5_dvfs_opp_table: sbc5-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc6_dvfs_opp_table: sbc6-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sdmmc1_dvfs_opp_table: sdmmc1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@104000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@208000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sdmmc3_dvfs_opp_table: sdmmc3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@104000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@208000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	spdif_out_dvfs_opp_table: spdif-out-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@26000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <26000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	tvdac_dvfs_opp_table: tvdac-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@220000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <220000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	tvo_dvfs_opp_table: tvo-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@297000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	usbd_dvfs_opp_table: usbd-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	usb2_dvfs_opp_table: usb2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	usb3_dvfs_opp_table: usb3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	vde_dvfs_opp_table: vde-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@228000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@275000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@352000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <352000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@400000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@437000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <437000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	vi_dvfs_opp_table: vi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@219000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <219000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@267000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@300000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@371000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <371000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@409000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <409000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@425000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <425000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@470000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <470000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 44a6dbba7081..fdf7b66cb92d 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -123,6 +123,8 @@ host1x@50000000 {
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
+		operating-points-v2 = <&host1x_dvfs_opp_table>;
+		power-domains = <&pd_heg>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -136,6 +138,7 @@ mpe@54040000 {
 			clocks = <&tegra_car TEGRA30_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
 		};
@@ -147,6 +150,7 @@ vi@54080000 {
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
 			reset-names = "vi";
+			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 		};
@@ -158,6 +162,7 @@ epp@540c0000 {
 			clocks = <&tegra_car TEGRA30_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
 		};
@@ -169,6 +174,7 @@ isp@54100000 {
 			clocks = <&tegra_car TEGRA30_CLK_ISP>;
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
+			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
 		};
@@ -180,6 +186,8 @@ gr2d@54140000 {
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			operating-points-v2 = <&gr2d_dvfs_opp_table>;
+			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_G2>;
 		};
@@ -193,6 +201,9 @@ gr3d@54180000 {
 			resets = <&tegra_car 24>,
 				 <&tegra_car 98>;
 			reset-names = "3d", "3d2";
+			operating-points-v2 = <&gr3d_dvfs_opp_table>;
+			power-domains = <&pd_3d0>, <&pd_3d1>;
+			power-domain-names =  "3d0", "3d1";
 
 			iommus = <&mc TEGRA_SWGROUP_NV>,
 				 <&mc TEGRA_SWGROUP_NV2>;
@@ -207,6 +218,8 @@ dc@54200000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			operating-points-v2 = <&disp1_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
@@ -237,6 +250,8 @@ dc@54240000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			operating-points-v2 = <&disp2_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
@@ -357,6 +372,288 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		clocks {
+			2d {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&gr2d_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_GR2D>;
+				power-domains = <&pd_core>;
+			};
+
+			3d {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&gr3d_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_GR3D>;
+				power-domains = <&pd_core>;
+			};
+
+			3d2 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&gr3d_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_GR3D2>;
+				power-domains = <&pd_core>;
+			};
+
+			afi {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&afi_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_AFI>;
+				power-domains = <&pd_core>;
+			};
+
+			cve {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&cve_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_CVE>;
+				power-domains = <&pd_core>;
+			};
+
+			dsia {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&dsia_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_DSIA>;
+				power-domains = <&pd_core>;
+			};
+
+			dsib {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&dsib_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_DSIB>;
+				power-domains = <&pd_core>;
+			};
+
+			epp {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&epp_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_EPP>;
+				power-domains = <&pd_core>;
+			};
+
+			fuse_burn {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&fuse_burn_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_FUSE_BURN>;
+				power-domains = <&pd_core>;
+			};
+
+			hdmi {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&hdmi_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_HDMI>;
+				power-domains = <&pd_core>;
+			};
+
+			host1x {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&host1x_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
+				power-domains = <&pd_core>;
+			};
+
+			mipi {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&mipi_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_MIPI>;
+				power-domains = <&pd_core>;
+			};
+
+			mpe {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&mpe_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_MPE>;
+				power-domains = <&pd_core>;
+			};
+
+			sclk {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sclk_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SCLK>;
+				power-domains = <&pd_core>;
+			};
+
+			se {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&se_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SE>;
+				power-domains = <&pd_core>;
+			};
+
+			ndflash {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&ndflash_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_NDFLASH>;
+				power-domains = <&pd_core>;
+			};
+
+			nor {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&nor_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_NOR>;
+				power-domains = <&pd_core>;
+			};
+
+			pcie {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pcie_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PCIE>;
+				power-domains = <&pd_core>;
+			};
+
+			pll_c {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pll_c_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_C>;
+				power-domains = <&pd_core>;
+			};
+
+			pll_e {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pll_e_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_E>;
+				power-domains = <&pd_core>;
+			};
+
+			pll_m {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pll_m_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
+				power-domains = <&pd_core>;
+			};
+
+			pwm {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pwm_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PWM>;
+				power-domains = <&pd_core>;
+			};
+
+			sata {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sata_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SATA>;
+				power-domains = <&pd_core>;
+			};
+
+			sata_oob {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sata_oob_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SATA_OOB>;
+				power-domains = <&pd_core>;
+			};
+
+			sbc1 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sbc1_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SBC1>;
+				power-domains = <&pd_core>;
+			};
+
+			sbc2 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sbc2_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SBC2>;
+				power-domains = <&pd_core>;
+			};
+
+			sbc3 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sbc3_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SBC3>;
+				power-domains = <&pd_core>;
+			};
+
+			sbc4 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sbc4_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SBC4>;
+				power-domains = <&pd_core>;
+			};
+
+			sbc5 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sbc5_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SBC5>;
+				power-domains = <&pd_core>;
+			};
+
+			sbc6 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sbc6_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SBC6>;
+				power-domains = <&pd_core>;
+			};
+
+			sdmmc1 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sdmmc1_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SDMMC1>;
+				power-domains = <&pd_core>;
+			};
+
+			sdmmc3 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&sdmmc3_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
+				power-domains = <&pd_core>;
+			};
+
+			spdif_out {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&spdif_out_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SPDIF_OUT>;
+				power-domains = <&pd_core>;
+			};
+
+			tvdac {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&tvdac_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_TVDAC>;
+				power-domains = <&pd_core>;
+			};
+
+			tvo {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&tvo_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_TVO>;
+				power-domains = <&pd_core>;
+			};
+
+			usbd {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&usbd_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_USBD>;
+				power-domains = <&pd_core>;
+			};
+
+			usb2 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&usb2_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_USB2>;
+				power-domains = <&pd_core>;
+			};
+
+			usb3 {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&usb3_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_USB3>;
+				power-domains = <&pd_core>;
+			};
+
+			vde {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&vde_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_VDE>;
+				power-domains = <&pd_core>;
+			};
+
+			vi {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&vi_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_VI>;
+				power-domains = <&pd_core>;
+			};
+		};
 	};
 
 	flow-controller@60007000 {
@@ -466,6 +763,8 @@ vde@6001a000 {
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
 		iommus = <&mc TEGRA_SWGROUP_VDE>;
+		operating-points-v2 = <&vde_dvfs_opp_table>;
+		power-domains = <&pd_vde>;
 	};
 
 	apbmisc@70000800 {
@@ -763,6 +1062,58 @@ tegra_pmc: pmc@7000e400 {
 		clocks = <&tegra_car TEGRA30_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 		#clock-cells = <1>;
+
+		powergates {
+			pd_3d0: 3d0 {
+				clocks = <&tegra_car TEGRA30_CLK_GR3D>;
+				resets = <&tegra_car TEGRA30_CLK_GR3D>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_3d1: 3d1 {
+				clocks = <&tegra_car TEGRA30_CLK_GR3D2>;
+				resets = <&tegra_car TEGRA30_CLK_GR3D2>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA30_CLK_ISP>,
+					 <&tegra_car TEGRA30_CLK_VI>,
+					 <&tegra_car TEGRA30_CLK_CSI>;
+				resets = <&tegra_car TEGRA30_CLK_ISP>,
+					 <&tegra_car 20 /* VI */>,
+					 <&tegra_car TEGRA30_CLK_CSI>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_vde: vdec {
+				clocks = <&tegra_car TEGRA30_CLK_VDE>;
+				resets = <&tegra_car TEGRA30_CLK_VDE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_mpe: mpe {
+				clocks = <&tegra_car TEGRA30_CLK_MPE>;
+				resets = <&tegra_car TEGRA30_CLK_MPE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_heg: heg {
+				clocks = <&tegra_car TEGRA30_CLK_GR2D>,
+					 <&tegra_car TEGRA30_CLK_EPP>,
+					 <&tegra_car TEGRA30_CLK_HOST1X>;
+				resets = <&tegra_car TEGRA30_CLK_GR2D>,
+					 <&tegra_car TEGRA30_CLK_EPP>,
+					 <&tegra_car TEGRA30_CLK_HOST1X>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+		};
 	};
 
 	mc: memory-controller@7000f000 {
@@ -783,6 +1134,7 @@ emc: memory-controller@7000f400 {
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
+		power-domains = <&pd_core>;
 
 		nvidia,memory-controller = <&mc>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
@@ -1057,6 +1409,12 @@ phy3: usb-phy@7d008000 {
 		status = "disabled";
 	};
 
+	pd_core: core-domain {
+		compatible = "nvidia,tegra30-core-domain";
+		operating-points-v2 = <&core_opp_table>;
+		#power-domain-cells = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
