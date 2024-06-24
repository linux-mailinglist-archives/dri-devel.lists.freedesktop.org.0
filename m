Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4C914397
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68E810E389;
	Mon, 24 Jun 2024 07:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="fMk0ZfL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C17710E149
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:37:31 +0000 (UTC)
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719192649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdqygHfViL9O/zUZ3QM7PLkF0Ly4AFpo9SWCPyO7oLU=;
 b=fMk0ZfL+fuUTfmXKewUVOc5g5K13KYVVmUEZmSYh/atecpRkcMoJFsGdUmUH90+wi64knh
 mJL83oO6WYUok/ot4zSOaNtivEzBdZmNsKB46DNFfGJRJkAs9DMm4GT67glWmAgcmpEdRT
 d55ddC2GOEUxwBko6IdspukTwio0A3ZttwVmwEco0e+j0EKUqz093KSUtdxy2npp5aCIMf
 gVyQbYEk3sCL8Ibm3C+9PJjzHXud3KkJJtwNWzHjUu/dRDi/+3B8KktaeZaNAmHM2GGXK2
 4Oadb3je/79yCNLxGB5rq8m9PJH+iuu03XjxA/B5FGur9JBHdkBx1SwW3y9i4A==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: frieder.hannenheim@proton.me
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Mon, 24 Jun 2024 03:30:31 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: add OnePlus 8T (kebab)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-7-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Frieder Hannenheim <frieder.hannenheim@proton.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=22978;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=GR3UO6RqGdlxDSgvkYUQ4Zm74Wetwn+yVmZs9nLiloo=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw8s1fcYAnV6zyPjXLImWH3PZz7XSCjDyQEM
 fAeROjWgRuJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMPAAKCRAFgzErGV9k
 tmquEACeAr17Ga2OLpxgW1wVR20oppjK3DQ/82okIAnSCwxfy0Vs9lTmPiQei1A7OgtHvB6eAb2
 7Awqj4UGPDsSUSffVtCif9RUSoUjfBM2k48TaqP0vlrpQqygp3m/n5TYvmWOszt9vgu41Jnn5nx
 jTtEjk9M76rEi/mHTzxuPbo6qDv2HcuSUfpW7gvMxsYVbv9XeX3T4h7vMaXrGrf2fkIg3896dcF
 9lDb2L6GyEREPRohNeOSDZeirdgTEqIWwnijRlPSNuee7OZyOFXhagsDzP+evHDP14DOk+U9+4P
 Mygyu93gnVuvgfTURhHR3v7MjMErE9HkDiyrDEelVPerqrFkrSsCoCasCXSpvSgNtRJ41QmmOJz
 wu6oiodafbzX3oyOWsGmreO2nH36pwaiNmzWMLbc87P/adBhOkFIwsMsBjzVORZwwUPEbxUPXsn
 H/6nod1JfvMFDid8wqAONirESRcU7gCGcrAZ1k005xHl7qgZBtcR88aBT1Ko6+4D0ASahsJ+Xg8
 X7rRzuc+J0FUdXhPFA0ITZbMMXhZbQVLxLh9xoXaiTlG6xYVjX45kNr8hdw0e8e74WVONGRikaE
 C2WzJ9kuPgK+oVhXZDmxOnJw2sTa8EW74zbuo0igEoJaOp+oqwico6VqDRJNixmPrr/j1whTJzj
 Vx8LVLCJQaD0+JQ==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

Initial support for USB, UFS, touchscreen, panel, wifi, and bluetooth.

Co-developed-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
Signed-off-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 866 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  |  36 +
 3 files changed, 903 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5576c7d6ea06..14efed297df3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -231,8 +231,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-oneplus-kebab.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish-csot.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
new file mode 100644
index 000000000000..ea5b46b54183
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
@@ -0,0 +1,866 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (c) 2024, Frieder Hannenheim <frieder.hannenheim@proton.me>
+ * Copyright (c) 2024, Caleb Connolly <caleb@postmarketos.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/usb/pd.h>
+#include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+
+/* removed_mem @ 0x80b00000 is bigger so we gotta shift everything up... */
+/delete-node/ &removed_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &wlan_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &npu_mem;
+/delete-node/ &video_mem;
+/delete-node/ &cvp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &slpi_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &cdsp_secure_heap;
+
+
+/ {
+	aliases {
+		serial0 = &uart12;
+		serial1 = &uart6;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		framebuffer: framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x9c000000 0 0x2300000>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-vol-up {
+			label = "Volume up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+		};
+
+		key-vol-dowm {
+			label = "Volume down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reserved-memory {
+		camera_mem: camera@8dc00000 {
+			reg = <0x0 0x8dc00000 0x0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: wlan@8e100000 {
+			reg = <0x0 0x8e100000 0x0 0x100000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@8e200000 {
+			reg = <0x0 0x8e200000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@8e210000 {
+			reg = <0x0 0x8e210000 0x0 0xa000>;
+			no-map;
+		};
+
+		gpu_mem: gpu@8e21a000 {
+			reg = <0x0 0x8e21a000 0x0 0x2000>;
+			no-map;
+		};
+
+		npu_mem: memory@8e300000 {
+			reg = <0x0 0x8e300000 0x0 0x500000>;
+			no-map;
+		};
+
+		video_mem: video@8e800000 {
+			reg = <0x0 0x8e800000 0x0 0x500000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@8ed00000 {
+			reg = <0x0 0x8ed00000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@8f200000 {
+			reg = <0x0 0x8f200000 0x0 0x1400000>;
+			no-map;
+		};
+
+		slpi_mem: slpi@90600000 {
+			reg = <0x0 0x90600000 0x0 0x1500000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@91b00000 {
+			reg = <0x00 0x91b00000 0x00 0x2500000>;
+			no-map;
+		};
+
+		spss_mem: spss@94000000 {
+			reg = <0x0 0x94000000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap: cdsp-secure@94100000 {
+			reg = <0x0 0x94100000 0x0 0x4600000>;
+			no-map;
+		};
+
+		framebuffer@9c000000 {
+			reg = <0 0x9c000000 0 0x2300000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+	};
+
+	vreg_s4a_1p8: vreg-s4a-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	panel_avdd_5p5: panel-avdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_avdd_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		regulator-enable-ramp-delay = <233>;
+		gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		/* FIXME: we don't yet support power cycling the panel so keep this on */
+		regulator-always-on;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_avdd_pins>;
+	};
+
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p3>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p3>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/OnePlus/adsp.mbn";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p95>;
+		vdd-l6-l9-supply = <&vreg_s8c_1p3>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p9: ldo3 {
+			regulator-name = "vreg_l3a_0p9";
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <932000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* l4 = VDD_SSC_MX (lmx.lvl) */
+
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p7: ldo7 {
+			regulator-name = "vreg_l7a_1p7";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p2: ldo9 {
+			regulator-name = "vreg_l9a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-name = "vreg_l10a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* l11 = VDD_SSC_CX (lxc.lvl) */
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_ts_3p0: ldo13 {
+			regulator-name = "vreg_l13a_ts_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-name = "vreg_l14a_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-name = "vreg_l15a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* Fingerprint reader power (goodix_fp) */
+		vreg_l16a_2p7: ldo16 {
+			regulator-name = "vreg_l16a_2p7";
+			regulator-min-microvolt = <3024000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-name = "vreg_l17a_3p0";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_0p92: ldo18 {
+			regulator-name = "vreg_l18a_0p92";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_1p9: smps5 {
+			regulator-name = "vreg_s5a_1p9";
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a_0p95: smps6 {
+			regulator-name = "vreg_s6a_0p95";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
+		vdd-l2-l3-supply = <&vreg_s8c_1p3>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p2: ldo2 {
+			regulator-name = "vreg_l2c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_1p7: ldo4 {
+			regulator-name = "vreg_l4c_1p7";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-name = "vreg_l5c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p96: ldo6 {
+			regulator-name = "vreg_l6c_2p96";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_cam_vcm0_2p85: ldo7 {
+			regulator-name = "vreg_l7c_cam_vcm0_2p85";
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p0: ldo10 {
+			regulator-name = "vreg_l10c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-name = "vreg_l11c_3p3";
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			/* FIXME: we don't yet support power cycling the panel */
+			regulator-always-on;
+		};
+
+		vreg_s8c_1p3: smps8 {
+			regulator-name = "vreg_s8c_1p3";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/OnePlus/cdsp.mbn";
+};
+
+&crypto {
+	status = "disabled";
+};
+
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sm8250/OnePlus/a650_zap.mbn";
+	};
+};
+
+/* LS-I2C1 */
+&i2c15 {
+	status = "okay";
+
+	// fcs,fsa4480 @ 42
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l9a_1p2>;
+
+	display_panel: panel@0 {
+		reg = <0>;
+		vddio-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l11c_3p3>;
+		avdd-supply = <&panel_avdd_5p5>;
+		/* FIXME: There is a bug somewhere in the display stack and it isn't
+		 * possible to get the panel to a working state after toggling reset.
+		 * At best it just shows one or more vertical red lines. So for now
+		 * let's skip the reset GPIO.
+		 */
+		// reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&panel_reset_pins &panel_vsync_pins &panel_vout_pins>;
+		pinctrl-names = "default";
+
+		status = "disabled";
+
+		port {
+			panel_in_0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
+&pm8150_adc {
+	channel@4c {
+		reg = <ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "xo_therm";
+	};
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "skin_therm";
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "wifi_therm";
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	skin-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	wifi-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&pm8150_gpios {
+	gpio-reserved-ranges = <2 1>, <4 1>, <8 1>;
+};
+
+&pm8150b_adc {
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "conn_therm";
+	};
+};
+
+&pm8150b_adc_tm {
+	status = "okay";
+
+	conn-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150b_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pm8150l_adc {
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "skin_msm_therm";
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "pm8150l_therm";
+	};
+};
+
+&pm8150l_adc_tm {
+	status = "okay";
+
+	skin-msm-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150l_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	pm8150l-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150l_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	bt_en_state: bt-default-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-default-state {
+		wlan-en-pins {
+			pins = "gpio20";
+			function = "gpio";
+
+			drive-strength = <16>;
+			output-low;
+			bias-pull-up;
+		};
+	};
+
+	panel_reset_pins: panel-reset-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_vsync_pins: panel-vsync-state {
+		pins = "gpio66";
+		function = "mdp_vsync";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	panel_vout_pins: panel-vout-state {
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+	};
+
+	panel_avdd_pins: panel-avdd-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		output-high;
+	};
+
+	touch_irq_active: touch-irq-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+		output-disable;
+	};
+
+	touch_rst_active: touch-rst-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
+&uart12 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p92>;
+};
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
new file mode 100644
index 000000000000..642c19321e03
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (c) 2024, Caleb Connolly <caleb.connolly@linaro.org>
+ */
+
+#include "sm8250-oneplus-common.dtsi"
+
+/ {
+	model = "OnePlus 8T";
+	compatible = "oneplus,kebab", "qcom,sm8250";
+};
+
+&i2c13 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@4b {
+		compatible = "syna,s3908";
+		reg = <0x4B>;
+
+		pinctrl-0 = <&touch_irq_active &touch_rst_active>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 39 0x2008>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_l13a_ts_3p0>;
+		vcc-supply = <&vreg_l1c_1p8>;
+	};
+};
+
+&display_panel {
+	compatible = "samsung,amb655x";
+	status = "okay";
+};

-- 
2.45.0

