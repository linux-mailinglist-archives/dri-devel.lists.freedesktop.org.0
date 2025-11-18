Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA97C69167
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A3810E47F;
	Tue, 18 Nov 2025 11:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fCdBYV69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68E310E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:30:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99A3540D8D;
 Tue, 18 Nov 2025 11:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8478CC4CEF5;
 Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763465444;
 bh=UaOjEc6c6xEdIBY40he20/uyf9d0mQSW8i2aquCCoEQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=fCdBYV69l6sNp/aHxU/IvOpkkDyNY15nE75LSToHQW4JRtD4pXLr3RLq08AbN7bPo
 OfuVzxNKXFFkreOKYZIKwzd0wj5n6g68FohXySNCeeyQZUs1fHjDP+vAClQ35nzXGp
 HP5z82ymivBg5jrYaP9BcDpuFFtrcfpRFeLECRgFC8w1SCNsRgdVc/oDBIIbVEIfrv
 RTEb+ZTqr389f+OSmldcsunr9iyh8eBrEUsemwfYA4B2XE6+eB51b/ASUvMaaDVMEP
 CxiMrG+csovsI+YsRNK6W8pr4Go0WJvg04mpp3+41BWJ6fzw8bSifStb2F2h+fvQHl
 Coc3gau6Gz+PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4F056CED631;
 Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:43 +0100
Subject: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>, Amit Pundir <amit.pundir@linaro.org>, 
 Casey Connolly <casey@connolly.tech>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=17626; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PJwgO0R+F2VPL4Ce79oQK2wTtxonQ6t2w56PUigsvYo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjgS58ZMjgNrv9dN/zFTCGjnjXdCmp+0Yl5g
 s9lw8wTWo2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cjJFD/9JnvRSLxyVQuc11BaDQAPrurYLAfh/y0gbEYJjOH7OVjVsurxgJS2yaez1kG2vKXI36Qm
 0UQd6ye6yl1dD/1kZGVWpC7JnMqrandDWjC2yO2QvzeTQ/UuvvJP5nGNDzO1JlKI+dBBaDBgoG/
 6ZNrZqb0vY47uVvW1/F44g0iwpFsrSBcFxXgrvZogJy58ANcSn9UavnolR2Q86CDKHqmBVTxfKJ
 AoWPZTckSzBC5VjsVraAg9kPlpqWwPVzCh9E6t4UIi7lvv0TcObBbKPeX3YoELuGu+JZ8kwcCjb
 0g/Sq5hGH7HFKQpMK8yVmNCrYo4EtpndipEMm9dkEblSgMiqYVpuMcVjZbOwhD6L8V6e0sEUD8M
 LTO1QIXOaEgyvDCGT9ZYudpAgxd8l3ncxOnsEd2dcvYgikgltiF1T2Aiv/rFUfrMz7zc2pdNC3v
 qScCTVjlBlWF8by+mThbR7Mlk8g6/+WKwao9kSfiIAxuOOJ8+3vEzW2lGm7fYQuMAigfma07VGS
 yHWQXrhVNaEn1OaYODINMnl+HXIp/F7apimspvyjuNEQoDvmJk+q4soq6XE36dKRndYiJNCFviM
 LTDx1sr3O8MrZ/P744b481jCCJ7rEzD0uXycnyyN2OoPx1bn9Bxe05lEHibu6ZkKjrNmtGNLZkB
 TyizWl62NdkaPSw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

This adds initial device tree support for the following phones:

 - Google Pixel 3 (blueline)
 - Google Pixel 3 XL (crosshatch)

Both phone boards use the same identifiers and differ only slightly
in their connected peripherals.

Supported functionality includes:
 - Debug UART
 - UFS
 - USB-C (peripheral mode)
 - Display (Pixel 3 only, and the driver needs improvements)
 - GPU
 - Bluetooth
 - Wi-Fi

The rmtfs region is allocated using UIO, making it technically "dynamic."

Its address and size can be read from sysfs:

$ cat /sys/class/uio/uio0/name
/sys/class/uio/uio0/maps/map0/addr
0x00000000f2701000

$ cat /sys/class/uio/uio0/maps/map0/size
0x0000000000200000

Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
side of the rmtfs region to work around an XPU bug that would otherwise
cause erroneous violations when accessing the rmtfs_mem region.

Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Co-developed-by: Casey Connolly <casey@connolly.tech>
Signed-off-by: Casey Connolly <casey@connolly.tech>
Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Co-developed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  88 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 515 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  33 ++
 4 files changed, 638 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c4..c853b28b3b198 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -250,6 +250,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
new file mode 100644
index 0000000000000..cdaa0a76256ce
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sdm845-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3";
+	compatible = "google,blueline", "qcom,sdm845";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <2970000>;
+	voltage-min-design-microvolt = <3600000>;
+	voltage-max-design-microvolt = <4400000>;
+};
+
+&cont_splash_mem {
+	reg = <0 0x9d400000 0 0x02400000>;
+};
+
+&framebuffer0 {
+	width = <1080>;
+	height = <2160>;
+	stride = <(1080 * 4)>;
+	format = "a8r8g8b8";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43408-lh546wf1-ed01", "lg,sw43408";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p88>;
+		vpnl-supply = <&vreg_l28a_3p0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&panel_reset_pins &panel_te_pin>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+	qcom,te-source = "mdp_vsync_e";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
+};
+
+&tlmm {
+	panel_te_pin: panel-te-state {
+		pins = "gpio12";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_reset_pins: panel-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_suspend: panel-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
new file mode 100644
index 0000000000000..f8323b1ec861d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/delete-node/ &mpss_region;
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &mba_region;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &rmtfs_mem;
+
+/ {
+	chassis-type = "handset";
+	qcom,board-id = <0x00021505 0>;
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
+
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart6;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer-0 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: splash@9d400000 {
+			no-map;
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x9800000>;
+			no-map;
+		};
+
+		venus_mem: venus@97800000 {
+			reg = <0 0x97800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp-mem@97D00000 {
+			reg = <0 0x97D00000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: mba@98500000 {
+			reg = <0 0x98500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: slpi@98700000 {
+			reg = <0 0x98700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: spss@99B00000 {
+			reg = <0 0x99B00000 0 0x100000>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs-region@f2700000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xf2700000 0 0x202000>;
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "Volume keys";
+		autorepeat;
+
+		pinctrl-0 = <&volume_up_gpio>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";
+
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8998-rpmh-regulators";
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
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+		vdd-s13-supply = <&vph_pwr>;
+		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
+		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l9-supply = <&vreg_bob>;
+		vdd-l10-l23-l25-supply = <&vreg_bob>;
+		vdd-l13-l19-l21-supply = <&vreg_bob>;
+		vdd-l16-l28-supply = <&vreg_bob>;
+		vdd-l18-l22-supply = <&vreg_bob>;
+		vdd-l20-l24-supply = <&vreg_bob>;
+		vdd-l26-supply = <&vreg_s3a_1p35>;
+		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s5a_2p04: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7a_1p025: smps7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vdda_mipi_dsi0_pll:
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p88: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			/*
+			 * We can't properly bring the panel back if it gets turned off
+			 * so keep it's regulators always on for now.
+			 */
+			regulator-always-on;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a_3p3: ldo19 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/*
+			 * The touchscreen needs this to be 3.3v, which is apparently
+			 * quite close to the hardware limit for this LDO (3.312v)
+			 * It must be kept in high power mode to prevent TS brownouts
+			 */
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2968000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2968000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_mipi_dsi0_1p2:
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-boot-on;
+			/*
+			 * We can't properly bring the panel back if it gets turned off
+			 * so keep it's regulators always on for now.
+			 */
+			regulator-always-on;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmi8998-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s3c_0p6: smps3 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+	};
+};
+
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/Google/blueline/cdsp.mbn";
+
+	status = "okay";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/Google/blueline/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/Google/blueline/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mss_pil {
+	firmware-name = "qcom/sdm845/Google/blueline/mba.mbn",
+			"qcom/sdm845/Google/blueline/modem.mbn";
+
+	status = "okay";
+};
+
+&pm8998_gpios {
+	volume_up_gpio: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <0>;
+	};
+};
+
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
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
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&tlmm {
+	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
+			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
+
+	touchscreen_reset: ts-reset-state {
+		pins = "gpio99";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	touchscreen_pins: ts-pins-gpio-state {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_i2c_pins: qup-i2c2-gpio-state {
+		pins = "gpio27", "gpio28";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <800000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
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
+	vdd-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l26a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p875>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sdm845/Google/blueline/venus.mbn";
+
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+
+	qcom,snoc-host-cap-8bit-quirk;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
new file mode 100644
index 0000000000000..ca534f0950a19
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sdm845-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3 XL";
+	compatible = "google,crosshatch", "qcom,sdm845";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <3480000>;
+	voltage-min-design-microvolt = <3600000>;
+	voltage-max-design-microvolt = <4400000>;
+};
+
+&cont_splash_mem {
+	reg = <0 0x9d400000 0 0x02400000>;
+};
+
+&framebuffer0 {
+	width = <1440>;
+	height = <2960>;
+	stride = <(1440 * 4)>;
+	format = "a8r8g8b8";
+};
+
+&mdss {
+	/* until the panel is prepared */
+	status = "disabled";
+};
+

-- 
2.51.0


