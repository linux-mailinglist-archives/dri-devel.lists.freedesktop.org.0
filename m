Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9DAD5D4B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 19:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D4310E6D8;
	Wed, 11 Jun 2025 17:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsO2MG/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50510E6DD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 17:32:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46D0F5C385A;
 Wed, 11 Jun 2025 17:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61536C4CEEA;
 Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749663159;
 bh=bRM3LfTaCoklm62WkDu5Lqp1zfV1Oa3CIVtDIVt+xks=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=SsO2MG/dYSTnGXSknY9EKLxp9xuOI/v4MF0ZpZlNvQqGmE0FVIAZW15Sg5940yL6c
 3si20e1QaWSdCbUDx+Dtc8uIY8Or8d8zq0qisYomTp5UMdDkNo1lL12pChXCnPzQ0y
 gvIc6jE5jQ1SogEr6lQj+dQVOc7CvblmeXv08ImSjP8Uzrk9oZ0U0HhtFB0ClJ0kfC
 OQOJzAAvpk26FNUpBHnzldo8rrM850o3/Jl8fBiLb9+AxJecIvtmnQc3Z1/bPu0FLu
 TYCx4Ch4A59dFRy9nj3xb16ODIqUoYqWhEfV5eHRNnNfHocp+b9rkttzCuoUmhhX2a
 b/q+wPl2KuRSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 50C12C71143;
 Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 11 Jun 2025 19:32:17 +0200
Subject: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749663157; l=9121;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=dHo4NuQQ30tCV5k9Ip37kxDFTRR/INCJCzoQsAaFR4E=;
 b=2lN4t3g1K5qrJ6Bl4nyaHiUg3pSKWm/Nb1L02Hu8I0APcDNOfKSzUlaMfn7yDT89roBWaVHfO
 W1pesjSyeFwAW+QfReL8gYKwpDkIZ62zTl628sJOlb29orWiiTVb6I/
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for GPUs in M-series SoCs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 198 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
index 89c3b211b116e96ee0a5ea0c923c3ab824008307..3b60842045d4c3277e9530a13ef2811774209697 100644
--- a/arch/arm64/boot/dts/apple/t6000.dtsi
+++ b/arch/arm64/boot/dts/apple/t6000.dtsi
@@ -16,3 +16,7 @@ / {
 };
 
 /delete-node/ &pmgr_south;
+
+&gpu {
+	compatible = "apple,agx-g13s", "apple,agx-g13x";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index d2cf81926f284ccf7627701cc82edff31d4d72d6..60c65ad8fabccc153aa98f4431dc11f7551eca77 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -62,3 +62,7 @@ p-core-pmu-affinity {
 		};
 	};
 };
+
+&gpu {
+	compatible = "apple,agx-g13c", "apple,agx-g13x";
+};
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4..501ca82f41827e4882683e583b6feaf25a34321d 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -300,3 +300,7 @@ &ps_gfx {
 	// On t6002, the die0 GPU power domain needs both AFR power domains
 	power-domains = <&ps_afr>, <&ps_afr_die1>;
 };
+
+&gpu {
+	compatible = "apple,agx-g13d", "apple,agx-g13x";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
index 87dfc13d74171f62bf3087401918d9d41eaac560..329bd084b63e3688547166a8d0c3d9ace5d6d937 100644
--- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
@@ -11,6 +11,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -378,4 +382,34 @@ nco_clkref: clock-ref-nco {
 		#clock-cells = <0>;
 		clock-output-names = "nco_ref";
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_handoff: uat-handoff {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_pagetables: uat-pagetables {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_ttbs: uat-ttbs {
+			reg = <0x0 0 0 0>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 110bc6719512e334e04b496fb157cb4368679957..140e0ebc0421881899f276b81f3d747ae67a8871 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -302,6 +302,34 @@ mca: mca@39b600000 {
 		#sound-dai-cells = <1>;
 	};
 
+	gpu: gpu@406400000 {
+		compatible = "apple,agx-g13x";
+		reg = <0x4 0x6400000 0 0x40000>,
+			<0x4 0x4000000 0 0x1000000>;
+		reg-names = "asc", "sgx";
+		mboxes = <&agx_mbox>;
+		power-domains = <&ps_gfx>;
+		memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+				<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+		memory-region-names = "ttbs", "pagetables", "handoff",
+				      "hw-cal-a", "hw-cal-b", "globals";
+
+		apple,firmware-compat = <0 0 0>;
+	};
+
+	agx_mbox: mbox@406408000 {
+		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
+		reg = <0x4 0x6408000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1059 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1060 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1061 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 1062 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "send-empty", "send-not-empty",
+			"recv-empty", "recv-not-empty";
+		#mbox-cells = <0>;
+	};
+
 	pcie0_dart_0: iommu@581008000 {
 		compatible = "apple,t6000-dart";
 		reg = <0x5 0x81008000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 20faf0c0d80927b2e18dd966a61b5507b322c72f..eeaea35a89e2f2c7f8e04d95e22ed6cc0ec3d5c9 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -19,6 +19,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -351,6 +355,36 @@ nco_clkref: clock-ref-nco {
 		clock-output-names = "nco_ref";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_handoff: uat-handoff {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_pagetables: uat-pagetables {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_ttbs: uat-ttbs {
+			reg = <0x0 0 0 0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -359,6 +393,34 @@ soc {
 		ranges;
 		nonposted-mmio;
 
+		gpu: gpu@206400000 {
+			compatible = "apple,agx-g13g";
+			reg = <0x2 0x6400000 0 0x40000>,
+				<0x2 0x4000000 0 0x1000000>;
+			reg-names = "asc", "sgx";
+			mboxes = <&agx_mbox>;
+			power-domains = <&ps_gfx>;
+			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+			memory-region-names = "ttbs", "pagetables", "handoff",
+					      "hw-cal-a", "hw-cal-b", "globals";
+
+			apple,firmware-compat = <0 0 0>;
+		};
+
+		agx_mbox: mbox@206408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x6408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		cpufreq_e: performance-controller@210e20000 {
 			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
 			reg = <0x2 0x10e20000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..b8fcfb6d93b27d4e314e706eb1f10eb58b15462b 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -19,6 +19,10 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gpu = &gpu;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -366,6 +370,36 @@ nco_clkref: clock-ref-nco {
 		clock-output-names = "nco_ref";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpu_globals: globals {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_a: hw-cal-a {
+			reg = <0x0 0 0 0>;
+		};
+
+		gpu_hw_cal_b: hw-cal-b {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_handoff: uat-handoff {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_pagetables: uat-pagetables {
+			reg = <0x0 0 0 0>;
+		};
+
+		uat_ttbs: uat-ttbs {
+			reg = <0x0 0 0 0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -374,6 +408,34 @@ soc {
 		ranges;
 		nonposted-mmio;
 
+		gpu: gpu@206400000 {
+			compatible = "apple,agx-g14g";
+			reg = <0x2 0x6400000 0 0x40000>,
+				<0x2 0x4000000 0 0x1000000>;
+			reg-names = "asc", "sgx";
+			mboxes = <&agx_mbox>;
+			power-domains = <&ps_gfx>;
+			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+					<&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+			memory-region-names = "ttbs", "pagetables", "handoff",
+					      "hw-cal-a", "hw-cal-b", "globals";
+
+			apple,firmware-compat = <0 0 0>;
+		};
+
+		agx_mbox: mbox@206408000 {
+			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x6408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		cpufreq_e: cpufreq@210e20000 {
 			compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
 			reg = <0x2 0x10e20000 0 0x1000>;

-- 
2.49.0


