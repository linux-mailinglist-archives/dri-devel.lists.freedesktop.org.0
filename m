Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140EC035FC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7819710E19E;
	Thu, 23 Oct 2025 20:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FmC9tbc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BDE10E1B1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:24:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43AD964141;
 Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5CD2C16AAE;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761251069;
 bh=w69+lORHLBk1YdMhMA8T+HNY3dQ1RRGhVGhjM7xFxkw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=FmC9tbc5kRg+NF12d27xWTOlZLpWXXRBKPo0taZ28QTxbIX7nyPV8G8vA+XzlLwdJ
 WU80VpwP4fwRT6RN3t2TEf87pPgxXBN67oMdGDCb4mI/GDwc89Sr/0MObbLZyhjMUW
 DDVPJx3D1FYHIlY6JJdpFtVdDpA19KoLzhug256VODj5iETYM+OnGyEm7tlgEj8eOM
 SLIqgbAPlgHy8ud8Hs21uQ1QD+4+c3/m/O4TKkIUdCEK5r5+W7h808JXUTBfTf1QYF
 a9YgIThoUtvH3AvPIeR3BJOFZzWE+By5zbhHzsF6R1cnJA61/CjiWfxUtqOvxa2871
 aUYDNmpA1rCGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A3C0FCCD193;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 23 Oct 2025 22:24:27 +0200
Subject: [PATCH v5 3/6] arm64: dts: qcom: sdm845-oneplus: Update
 compatbible and add DDIC supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-s6e3fc2x01-v5-3-8f8852e67417@ixit.cz>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
In-Reply-To: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3556; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=5dCLbwr33VzKhLnq/J0O1v2W9AA33R5EWabu34Rbafs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo+o77ChGvSmGX+VIDV6A2kjVD+RpaEcXHIutyG
 TlEjfIexxuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPqO+wAKCRBgAj/E00kg
 coj8D/4hVb9PG8DpG0fvuKXZVaOPwx4TrVLD7D6GSsX+Y4qKmleVvqgdhn6vR0OeO/rr3kUKjsx
 Vvo7iuMfjJto+zWo3+QQsXwJinYmS1XlaujAgfDhk9XzcRW4G5O32Ci6RW4j8/dZQAHNFMmzghs
 K0Zbrcxn5EE7OAKPI8USf5LiER+2/R5xmb67lY1r2lLKX6TncWi4bICFqp6djcRjjFxf5FWw3b1
 XnMbEnE8Zo9TOs766BNEHyHkvslBtKb3CXhzTeKfyuJ/d3UYc1AvY2bYF0xgN2e1nLj0Hv3WltZ
 l+RhKyG9qpsWMn20Axmw3uHjEaaAnGUSb+ytUOiTcZs5zhpSdZ9OyOu/veosBSZX2IwM6m5gx1j
 yG5DDNOYOCeP2f8IkQ4RRPOIs5PtKPwfz6YYi4HH9WXEQkSYbBl93gZPlu2t/Mdb97ft856GdKZ
 hAN1JUNuGdA0xjADjjR47LctAoynJVRMsnNbhOVkQOLrPrfqdkq9WEPzzhagc2lacjTGBaV7hJl
 TlApWuErZKGwh69CY3CERj0Icc7q/Orh8F6XRJjB+e1caQLsb5iSpXNYazlZB0SFslpFPRhJVdJ
 NW6sCWiysLHexq3YUP+ZegJU05VVDUUfLbIdSM3sJ/rA7z5+r8EyAeijqTYPisF7O4hzX+9dA33
 Fm6MH1J9tAwFe+g==
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

Update the compatible to reflect combination of DDIC and panel.

Original compatible describing only the DDIC used, but omit describing
the panel used (Samsung AMS641RW), which we have no way to detect.

There are two additional supplies used by the panel, both are GPIO
controlled and are left enabled by the bootloader for continuous splash.

Previously these were (incorrectly) modelled as pinctrl. Describe them
properly so that the panel can control them.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |  2 +-
 2 files changed, 46 insertions(+), 2 deletions(-)

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
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7e75decfda052..d6cd873aef0de 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -32,7 +32,7 @@ battery: battery {
 &display_panel {
 	status = "okay";
 
-	compatible = "samsung,s6e3fc2x01";
+	compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
 };
 
 &i2c4 {

-- 
2.51.0


