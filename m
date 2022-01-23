Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE684973BD
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 18:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A8910E7F3;
	Sun, 23 Jan 2022 17:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62510E7F6
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:38:26 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4JhgM473tJz4x1HQ
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:38:24 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="aZjz54pS"
Date: Sun, 23 Jan 2022 17:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1642959499;
 bh=Qf+0G/vNvsPSOhdptviIIOyzdnIqt+s5w5bcbOwWUzA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=aZjz54pSYym/REbsjyKq25OJR3aF7wP5osqpeP/utr7rSTMWnROe3mEPnZ7399kCC
 8Pxd3XOIQJr9Sh+dlnHIa3AVj/MT3zC4JZQMhlYIT4a91uX4Zrj/up0xKonjwgoQPe
 CNhtTaVeVXPCxH+b0E+9Tt+OXHPaL47bfH4lv0ac=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Harigovindan P <harigovi@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Alexander Martinz <amartinz@shiftphones.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 6/6] arm64: dts: qcom: sdm845: add device tree for SHIFT6mq
Message-ID: <20220123173650.290349-7-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Martinz <amartinz@shiftphones.com>

Add initial support for the SHIFT SHIFT6mq (axolotl) based on
the sdm845-mtp DT.

Currently supported features:
* Buttons (power, volume)
* Bluetooth, DSPs and modem
* Display and GPU
* Touch
* UART
* USB peripheral mode
* WLAN

Co-developed-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 736 ++++++++++++++++++
 2 files changed, 737 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index f7232052d286..6e6f53f501e6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-sony-xperia-tama-=
akari.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-sony-xperia-tama-akatsuki.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-sony-xperia-tama-apollo.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-xiaomi-beryllium.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-shift-axolotl.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm6125-sony-xperia-seine-pdx201.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm6350-sony-xperia-lena-pdx213.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64=
/boot/dts/qcom/sdm845-shift-axolotl.dts
new file mode 100644
index 000000000000..8553c8bf79bd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022, Alexander Martinz <amartinz@shiftphones.com>
+ * Copyright (c) 2022, Caleb Connolly <caleb@connolly.tech>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/ {
+=09model =3D "SHIFT SHIFT6mq";
+=09compatible =3D "shift,axolotl", "qcom,sdm845";
+=09qcom,msm-id =3D <321 0x20001>;
+=09qcom,board-id =3D <11 0>;
+
+=09aliases {
+=09=09display0 =3D &framebuffer0;
+=09=09serial0 =3D &uart9;
+=09};
+
+=09chosen {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09stdout-path =3D "serial0";
+
+=09=09/* Use framebuffer setup by the bootloader. */
+=09=09framebuffer0: framebuffer@9d400000 {
+=09=09=09compatible =3D "simple-framebuffer";
+=09=09=09reg =3D <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
+=09=09=09width =3D <1080>;
+=09=09=09height =3D <2160>;
+=09=09=09stride =3D <(1080 * 4)>;
+=09=09=09format =3D "a8r8g8b8";
+=09=09};
+=09};
+
+=09gpio-keys {
+=09=09compatible =3D "gpio-keys";
+=09=09autorepeat;
+
+=09=09pinctrl-names =3D "default";
+=09=09pinctrl-0 =3D <&volume_up_gpio>;
+
+=09=09vol-up {
+=09=09=09label =3D "volume_up";
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09=09gpios =3D <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+=09=09=09debounce-interval =3D <15>;
+=09=09};
+=09};
+
+=09reserved-memory {
+=09=09framebuffer_region@9d400000 {
+=09=09=09reg =3D <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ramoops: ramoops@b0000000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0 0xb0000000 0 0x00400000>;
+=09=09=09record-size =3D <0x40000>;
+=09=09=09console-size =3D <0x40000>;
+=09=09=09ftrace-size =3D <0x40000>;
+=09=09=09pmsg-size =3D <0x200000>;
+=09=09=09ecc-size =3D <0x0>;
+=09=09};
+=09};
+
+=09battery: battery {
+=09=09compatible =3D "simple-battery";
+
+=09=09charge-full-design-microamp-hours =3D <3850000>;
+=09=09voltage-min-design-microvolt =3D <3600000>;
+=09=09voltage-max-design-microvolt =3D <4400000>;
+=09};
+
+=09vph_pwr: vph-pwr-regulator {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vph_pwr";
+=09=09regulator-min-microvolt =3D <3700000>;
+=09=09regulator-max-microvolt =3D <3700000>;
+=09};
+
+=09vreg_s4a_1p8: pm8998-smps4 {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vreg_s4a_1p8";
+
+=09=09regulator-min-microvolt =3D <1800000>;
+=09=09regulator-max-microvolt =3D <1800000>;
+
+=09=09regulator-always-on;
+=09=09regulator-boot-on;
+
+=09=09vin-supply =3D <&vph_pwr>;
+=09};
+};
+
+&adsp_pas {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/axolotl/adsp.mbn";
+};
+
+&apps_rsc {
+=09pm8998-rpmh-regulators {
+=09=09compatible =3D "qcom,pm8998-rpmh-regulators";
+=09=09qcom,pmic-id =3D "a";
+
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+=09=09vdd-s5-supply =3D <&vph_pwr>;
+=09=09vdd-s6-supply =3D <&vph_pwr>;
+=09=09vdd-s7-supply =3D <&vph_pwr>;
+=09=09vdd-s8-supply =3D <&vph_pwr>;
+=09=09vdd-s9-supply =3D <&vph_pwr>;
+=09=09vdd-s10-supply =3D <&vph_pwr>;
+=09=09vdd-s11-supply =3D <&vph_pwr>;
+=09=09vdd-s12-supply =3D <&vph_pwr>;
+=09=09vdd-s13-supply =3D <&vph_pwr>;
+=09=09vdd-l1-l27-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd-l2-l8-l17-supply =3D <&vreg_s3a_1p35>;
+=09=09vdd-l3-l11-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd-l4-l5-supply =3D <&vreg_s7a_1p025>;
+=09=09vdd-l6-supply =3D <&vph_pwr>;
+=09=09vdd-l7-l12-l14-l15-supply =3D <&vreg_s5a_2p04>;
+=09=09vdd-l9-supply =3D <&vreg_bob>;
+=09=09vdd-l10-l23-l25-supply =3D <&vreg_bob>;
+=09=09vdd-l13-l19-l21-supply =3D <&vreg_bob>;
+=09=09vdd-l16-l28-supply =3D <&vreg_bob>;
+=09=09vdd-l18-l22-supply =3D <&vreg_bob>;
+=09=09vdd-l20-l24-supply =3D <&vreg_bob>;
+=09=09vdd-l26-supply =3D <&vreg_s3a_1p35>;
+=09=09vin-lvs-1-2-supply =3D <&vreg_s4a_1p8>;
+
+=09=09vreg_s2a_1p125: smps2 {
+=09=09=09regulator-min-microvolt =3D <1100000>;
+=09=09=09regulator-max-microvolt =3D <1100000>;
+=09=09};
+
+=09=09vreg_s3a_1p35: smps3 {
+=09=09=09regulator-min-microvolt =3D <1352000>;
+=09=09=09regulator-max-microvolt =3D <1352000>;
+=09=09};
+
+=09=09vreg_s5a_2p04: smps5 {
+=09=09=09regulator-min-microvolt =3D <1904000>;
+=09=09=09regulator-max-microvolt =3D <2040000>;
+=09=09};
+
+=09=09vreg_s7a_1p025: smps7 {
+=09=09=09regulator-min-microvolt =3D <900000>;
+=09=09=09regulator-max-microvolt =3D <1028000>;
+=09=09};
+
+=09=09vdd_qusb_hs0:
+=09=09vdda_hp_pcie_core:
+=09=09vdda_mipi_csi0_0p9:
+=09=09vdda_mipi_csi1_0p9:
+=09=09vdda_mipi_csi2_0p9:
+=09=09vdda_mipi_dsi0_pll:
+=09=09vdda_mipi_dsi1_pll:
+=09=09vdda_qlink_lv:
+=09=09vdda_qlink_lv_ck:
+=09=09vdda_qrefs_0p875:
+=09=09vdda_pcie_core:
+=09=09vdda_pll_cc_ebi01:
+=09=09vdda_pll_cc_ebi23:
+=09=09vdda_sp_sensor:
+=09=09vdda_ufs1_core:
+=09=09vdda_ufs2_core:
+=09=09vdda_usb1_ss_core:
+=09=09vdda_usb2_ss_core:
+=09=09vreg_l1a_0p875: ldo1 {
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <880000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vddpx_10:
+=09=09vreg_l2a_1p2: ldo2 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09=09regulator-always-on;
+=09=09};
+
+=09=09vreg_l3a_1p0: ldo3 {
+=09=09=09regulator-min-microvolt =3D <1000000>;
+=09=09=09regulator-max-microvolt =3D <1000000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vdd_wcss_cx:
+=09=09vdd_wcss_mx:
+=09=09vdda_wcss_pll:
+=09=09vreg_l5a_0p8: ldo5 {
+=09=09=09regulator-min-microvolt =3D <800000>;
+=09=09=09regulator-max-microvolt =3D <800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vddpx_13:
+=09=09vreg_l6a_1p8: ldo6 {
+=09=09=09regulator-min-microvolt =3D <1856000>;
+=09=09=09regulator-max-microvolt =3D <1856000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l7a_1p8: ldo7 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l8a_1p2: ldo8 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1248000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l9a_1p8: ldo9 {
+=09=09=09regulator-min-microvolt =3D <1704000>;
+=09=09=09regulator-max-microvolt =3D <2928000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l10a_1p8: ldo10 {
+=09=09=09regulator-min-microvolt =3D <1704000>;
+=09=09=09regulator-max-microvolt =3D <2928000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l11a_1p0: ldo11 {
+=09=09=09regulator-min-microvolt =3D <1000000>;
+=09=09=09regulator-max-microvolt =3D <1048000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vdd_qfprom:
+=09=09vdd_qfprom_sp:
+=09=09vdda_apc1_cs_1p8:
+=09=09vdda_gfx_cs_1p8:
+=09=09vdda_qrefs_1p8:
+=09=09vdda_qusb_hs0_1p8:
+=09=09vddpx_11:
+=09=09vreg_l12a_1p8: ldo12 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vddpx_2:
+=09=09vreg_l13a_2p95: ldo13 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l14a_1p88: ldo14 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l15a_1p8: ldo15 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l16a_2p7: ldo16 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2704000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l17a_1p3: ldo17 {
+=09=09=09regulator-min-microvolt =3D <1304000>;
+=09=09=09regulator-max-microvolt =3D <1304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l18a_2p7: ldo18 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l19a_3p0: ldo19 {
+=09=09=09regulator-min-microvolt =3D <2856000>;
+=09=09=09regulator-max-microvolt =3D <3104000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l20a_2p95: ldo20 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l21a_2p95: ldo21 {
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l22a_2p85: ldo22 {
+=09=09=09regulator-min-microvolt =3D <2864000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l23a_3p3: ldo23 {
+=09=09=09regulator-min-microvolt =3D <3000000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vdda_qusb_hs0_3p1:
+=09=09vreg_l24a_3p075: ldo24 {
+=09=09=09regulator-min-microvolt =3D <3088000>;
+=09=09=09regulator-max-microvolt =3D <3088000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l25a_3p3: ldo25 {
+=09=09=09regulator-min-microvolt =3D <3300000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vdda_hp_pcie_1p2:
+=09=09vdda_hv_ebi0:
+=09=09vdda_hv_ebi1:
+=09=09vdda_hv_ebi2:
+=09=09vdda_hv_ebi3:
+=09=09vdda_mipi_csi_1p25:
+=09=09vdda_mipi_dsi0_1p2:
+=09=09vdda_mipi_dsi1_1p2:
+=09=09vdda_pcie_1p2:
+=09=09vdda_ufs1_1p2:
+=09=09vdda_ufs2_1p2:
+=09=09vdda_usb1_ss_1p2:
+=09=09vdda_usb2_ss_1p2:
+=09=09vreg_l26a_1p2: ldo26 {
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l28a_3p0: ldo28 {
+=09=09=09regulator-min-microvolt =3D <2856000>;
+=09=09=09regulator-max-microvolt =3D <3008000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_lvs1a_1p8: lvs1 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+
+=09=09vreg_lvs2a_1p8: lvs2 {
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09};
+=09};
+
+=09pmi8998-rpmh-regulators {
+=09=09compatible =3D "qcom,pmi8998-rpmh-regulators";
+=09=09qcom,pmic-id =3D "b";
+
+=09=09vdd-bob-supply =3D <&vph_pwr>;
+
+=09=09vreg_bob: bob {
+=09=09=09regulator-min-microvolt =3D <3312000>;
+=09=09=09regulator-max-microvolt =3D <3600000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_AUTO>;
+=09=09=09regulator-allow-bypass;
+=09=09};
+=09};
+
+=09pm8005-rpmh-regulators {
+=09=09compatible =3D "qcom,pm8005-rpmh-regulators";
+=09=09qcom,pmic-id =3D "c";
+
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+
+=09=09vreg_s3c_0p6: smps3 {
+=09=09=09regulator-min-microvolt =3D <600000>;
+=09=09=09regulator-max-microvolt =3D <600000>;
+=09=09};
+=09};
+};
+
+&cdsp_pas {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/axolotl/cdsp.mbn";
+};
+
+&dsi0 {
+=09status =3D "okay";
+=09vdda-supply =3D <&vdda_mipi_dsi0_1p2>;
+
+=09panel@0 {
+=09=09compatible =3D "visionox,rm69299-shift";
+=09=09status =3D "okay";
+=09=09reg =3D <0>;
+=09=09vdda-supply =3D <&vreg_l14a_1p88>;
+=09=09vdd3p3-supply =3D <&vreg_l28a_3p0>;
+
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+
+=09=09reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+=09=09pinctrl-names =3D "default", "sleep";
+=09=09pinctrl-0 =3D <&sde_dsi_active &sde_te_active>;
+=09=09pinctrl-1 =3D <&sde_dsi_suspend &sde_te_suspend>;
+
+=09=09port {
+=09=09=09panel_in_0: endpoint {
+=09=09=09=09remote-endpoint =3D <&dsi0_out>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&dsi0_out {
+=09remote-endpoint =3D <&panel_in_0>;
+=09data-lanes =3D <0 1 2 3>;
+};
+
+&dsi0_phy {
+=09status =3D "okay";
+=09vdds-supply =3D <&vdda_mipi_dsi0_pll>;
+};
+
+&gcc {
+=09protected-clocks =3D <GCC_QSPI_CORE_CLK>,
+=09=09=09   <GCC_QSPI_CORE_CLK_SRC>,
+=09=09=09   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+=09=09=09   <GCC_LPASS_Q6_AXI_CLK>,
+=09=09=09   <GCC_LPASS_SWAY_CLK>;
+};
+
+&gmu {
+=09status =3D "okay";
+};
+
+&gpu {
+=09status =3D "okay";
+
+=09zap-shader {
+=09=09memory-region =3D <&gpu_mem>;
+=09=09firmware-name =3D "qcom/sdm845/axolotl/a630_zap.mbn";
+=09};
+};
+
+&i2c5 {
+=09status=3D"okay";
+
+=09touchscreen@38 {
+=09=09compatible =3D "focaltech,fts8719";
+=09=09reg =3D <0x38>;
+=09=09wakeup-source;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <125 0x2>;
+=09=09vdd-supply =3D <&vreg_l28a_3p0>;
+=09=09vcc-i2c-supply =3D <&vreg_l14a_1p88>;
+
+=09=09pinctrl-names =3D "default", "suspend";
+=09=09pinctrl-0 =3D <&ts_int_active &ts_reset_active>;
+=09=09pinctrl-1 =3D <&ts_int_suspend &ts_reset_suspend>;
+
+=09=09reset-gpio =3D <&tlmm 99 GPIO_ACTIVE_HIGH>;
+=09=09irq-gpio =3D <&tlmm 125 GPIO_TRANSITORY>;
+=09=09touchscreen-size-x =3D <1080>;
+=09=09touchscreen-size-y =3D <2160>;
+=09=09focaltech,max-touch-number =3D <5>;
+=09};
+};
+
+&ipa {
+=09status =3D "okay";
+
+=09memory-region =3D <&ipa_fw_mem>;
+=09firmware-name =3D "qcom/sdm845/axolotl/ipa_fws.mbn";
+};
+
+&mdss {
+=09status =3D "okay";
+};
+
+&mss_pil {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/axolotl/mba.mbn", "qcom/sdm845/axolotl/m=
odem.mbn";
+};
+
+&pm8998_gpio {
+=09volume_up_gpio: pm8998_gpio6 {
+=09=09pinconf {
+=09=09=09pins =3D "gpio6";
+=09=09=09function =3D "normal";
+=09=09=09input-enable;
+=09=09=09bias-pull-up;
+=09=09=09qcom,drive-strength =3D <0>;
+=09=09};
+=09};
+};
+
+&pm8998_pon {
+=09volume_down_resin: resin {
+=09=09compatible =3D "qcom,pm8941-resin";
+=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+=09=09debounce =3D <15625>;
+=09=09bias-pull-up;
+=09=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09};
+};
+
+&qup_uart9_default {
+=09pinconf-rx {
+=09=09pins =3D "gpio5";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09pinconf-tx {
+=09=09pins =3D "gpio4";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+};
+
+&qupv3_id_0 {
+=09status =3D "okay";
+};
+
+&qupv3_id_1 {
+=09status =3D "okay";
+};
+
+&tlmm {
+=09gpio-reserved-ranges =3D <0 4>, <81 4>;
+
+=09sde_dsi_active: sde-dsi-active {
+=09=09mux {
+=09=09=09pins =3D "gpio6", "gpio11";
+=09=09=09function =3D "gpio";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio6", "gpio11";
+=09=09=09drive-strength =3D <8>;
+=09=09=09bias-disable =3D <0>;
+=09=09};
+=09};
+
+=09sde_dsi_suspend: sde-dsi-suspend {
+=09=09mux {
+=09=09=09pins =3D "gpio6", "gpio11";
+=09=09=09function =3D "gpio";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio6", "gpio11";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09};
+=09};
+
+=09sde_te_active: sde-te-active {
+=09=09mux {
+=09=09=09pins =3D "gpio10";
+=09=09=09function =3D "mdp_vsync";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio10";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09};
+=09};
+
+=09sde_te_suspend: sde-te-suspend {
+=09=09mux {
+=09=09=09pins =3D "gpio10";
+=09=09=09function =3D "mdp_vsync";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio10";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09};
+=09};
+
+=09ts_int_active: ts-int-active {
+=09=09mux {
+=09=09=09pins =3D "gpio125";
+=09=09=09function =3D "gpio";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio125";
+=09=09=09drive-strength =3D <8>;
+=09=09=09bias-pull-up;
+=09=09=09input-enable;
+=09=09};
+=09};
+
+=09ts_int_suspend: ts-int-suspend {
+=09=09mux {
+=09=09=09pins =3D "gpio125";
+=09=09=09function =3D "gpio";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio125";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09=09input-enable;
+=09=09};
+=09};
+
+=09ts_reset_active: ts-reset-active {
+=09=09mux {
+=09=09=09pins =3D "gpio99";
+=09=09=09function =3D "gpio";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio99";
+=09=09=09drive-strength =3D <8>;
+=09=09=09bias-pull-up;
+=09=09};
+=09};
+
+=09ts_reset_suspend: ts-reset-suspend {
+=09=09mux {
+=09=09=09pins =3D "gpio99";
+=09=09=09function =3D "gpio";
+=09=09};
+
+=09=09config {
+=09=09=09pins =3D "gpio99";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09};
+=09};
+};
+
+&uart6 {
+=09status =3D "okay";
+
+=09bluetooth {
+=09=09compatible =3D "qcom,wcn3990-bt";
+
+=09=09vddio-supply =3D <&vreg_s4a_1p8>;
+=09=09vddxo-supply =3D <&vreg_l7a_1p8>;
+=09=09vddrf-supply =3D <&vreg_l17a_1p3>;
+=09=09vddch0-supply =3D <&vreg_l25a_3p3>;
+=09=09max-speed =3D <3200000>;
+=09};
+};
+
+&uart9 {
+=09status =3D "okay";
+};
+
+&ufs_mem_hc {
+=09status =3D "okay";
+
+=09reset-gpios =3D <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+=09vcc-supply =3D <&vreg_l20a_2p95>;
+=09vcc-max-microamp =3D <600000>;
+};
+
+&ufs_mem_phy {
+=09status =3D "okay";
+
+=09vdda-phy-supply =3D <&vdda_ufs1_core>;
+=09vdda-pll-supply =3D <&vdda_ufs1_1p2>;
+};
+
+&usb_1 {
+=09status =3D "okay";
+};
+
+&usb_1_dwc3 {
+=09dr_mode =3D "peripheral";
+};
+
+&usb_1_hsphy {
+=09status =3D "okay";
+
+=09vdd-supply =3D <&vreg_l1a_0p875>;
+=09vdda-phy-dpdm-supply =3D <&vreg_l24a_3p075>;
+=09vdda-pll-supply =3D <&vreg_l12a_1p8>;
+};
+
+&usb_1_qmpphy {
+=09status =3D "okay";
+
+=09vdda-phy-supply =3D <&vreg_l26a_1p2>;
+=09vdda-pll-supply =3D <&vreg_l1a_0p875>;
+};
+
+&venus {
+=09status =3D "okay";
+=09firmware-name =3D "qcom/sdm845/axolotl/venus.mbn";
+};
+
+&wifi {
+=09status =3D "okay";
+
+=09vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
+=09vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
+=09vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
+=09vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
+=09vdd-3.3-ch1-supply =3D <&vreg_l23a_3p3>;
+
+=09qcom,snoc-host-cap-8bit-quirk;
+};
--
2.34.1


