Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF0BC55B2
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3910E81D;
	Wed,  8 Oct 2025 14:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e407VxQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7109F10E824
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:05:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E5FFB46587;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3D90C4CEF4;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759932330;
 bh=fAswzPV9nMqsv7sYEBsIdB1TES3apuonI/p0V1BpQPw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=e407VxQ0oaLWTQenTBVvoskctGhibB8j/T7lwWStZo24tU/7Rs21olM4ZTsO9Xrfc
 i7XxEqGG3bsPHVk6jW9f3rcQUBek6GBvYkKiLQWuaISOHvWhNpWbZHqgPap3CJLrlJ
 pCkaUX+IWTEtnT//FzCuS4iPNUefx+gQ5miLeFkuEm7kHroTReP+YXNRYeVsT/DkR5
 PRq00bQPKPz5G5E6ZmC4vDmhaKRojAtSQpuq5W+WXwzVSnOiB41S97OEM7d1QFsz58
 14/tHdI/MNlQqDwX+Ywnd6A++U697bXo1Q/MDEayo5aBecE1pJNzXv3ZIfkWSPqM7y
 UvLVFu446TMRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AAC5CCCD183;
 Wed,  8 Oct 2025 14:05:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 08 Oct 2025 16:05:29 +0200
Subject: [PATCH v2 2/7] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-s6e3fc2x01-v2-2-21eca1d5c289@ixit.cz>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
In-Reply-To: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=wyoU9d3slp1a80oxXbHjL+liib53t7o67lGGsu4UofI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo5m+o/N70RMmKbpya5C49r3Zhi+XRA9f3ThwXQ
 xw4DfoQ1XOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOZvqAAKCRBgAj/E00kg
 cm4oD/9veQ1Fva2ST9eui0bvKdUa3yIQjbTIlupsMfsYRwVRJiy+AMQVlXeTmb5s5Clc4Kqw2VR
 mhZ8TFW9bwbX69RbbC5QiSloR8cb/NEULUatLEmL3+OT0bFBCy4LRxKRRarJFuAxTDEYvadOKsk
 /Xl/mFNx8L6gBiuMiRhSq15eHnG0F9Ava5jbv2DEKBPDdVQcrspodv0bMOqOhLmWhWcmutF4J/9
 Tm4yPSodpBAEorQO48ZAR+MYnn0YuQrCyNBFW73QGGEip7A32TZeo6+UgUSCssMUT1O6hIE6cMe
 EzJKUwG/4+ujeglV+1f8ntdJU9KTu/GJS8HnTUHzArGJlz/Dy9+RqGDTOBNElrYZ+Oh3apJpcyC
 dxOna3pBwP/f0I+kcox1DnL3m1Zy+cUYAUtJL0/cNbiWPGz1YwOx78f2ZUGfju5ZYqPhpm5wnzU
 QFV9uHjEf7eTADmViz+jbRuHR9gifNqVsn5L7kRw0SbzPnhYz67WRBMuW/7QsTPoj/EBtsW/8l2
 Cd43rbRGc85bvz150fB1xY0h9NTugM7CN3B++69JDhHnyik7N9dvFXbxmTxbKQSGmIDSykqlwTz
 7ud14j7J+zw36PYfBQsy6WhAYgIEVtoTqoGbn6mLc3C+wC1ARfX2CLJy00mm4mG0PYIQjA7q44p
 cOGmjhf1xYDpJ3A==
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

From: Casey Connolly <casey.connolly@linaro.org>

There are two additional supplies used by the panel, both are GPIO
controlled and are left enabled by the bootloader for continuous splash.

Previously these were (incorrectly) modelled as pinctrl. Describe them
properly so that the panel can control them.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index dcfffb271fcf3..1cf03047dd7ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -162,6 +162,34 @@ ts_1p8_supply: ts-1p8-regulator {
 		enable-active-high;
 		regulator-boot-on;
 	};
+
+	panel_vci_3v3: panel-vci-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_VCI_3V";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&panel_vci_default>;
+		pinctrl-names = "default";
+		regulator-boot-on;
+	};
+
+	panel_vddi_poc_1p8: panel-vddi-poc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDI_POC";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&panel_poc_default>;
+		pinctrl-names = "default";
+		regulator-boot-on;
+	};
 };
 
 &adsp_pas {
@@ -429,6 +457,8 @@ display_panel: panel@0 {
 		reg = <0>;
 
 		vddio-supply = <&vreg_l14a_1p88>;
+		vci-supply = <&panel_vci_3v3>;
+		poc-supply = <&panel_vddi_poc_1p8>;
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
@@ -803,6 +833,20 @@ hall_sensor_default: hall-sensor-default-state {
 		bias-disable;
 	};
 
+	panel_vci_default: vci-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_poc_default: poc-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	tri_state_key_default: tri-state-key-default-state {
 		pins = "gpio40", "gpio42", "gpio26";
 		function = "gpio";
@@ -818,7 +862,7 @@ ts_default_pins: ts-int-state {
 	};
 
 	panel_reset_pins: panel-reset-state {
-		pins = "gpio6", "gpio25", "gpio26";
+		pins = "gpio6";
 		function = "gpio";
 		drive-strength = <8>;
 		bias-disable;

-- 
2.51.0


