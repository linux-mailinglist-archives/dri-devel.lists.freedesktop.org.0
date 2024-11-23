Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7B9D6919
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 13:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8BF10E21C;
	Sat, 23 Nov 2024 12:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LubYlHIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36010E21C
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 12:59:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A365E5C55A5;
 Sat, 23 Nov 2024 12:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BA45C4CEDB;
 Sat, 23 Nov 2024 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732366739;
 bh=rJ3P/EwNpRpfkOloeZcwIZCsX0PzORmTXOM1R5SR4gU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=LubYlHIMr5OnyMfeNHXytxf+Hr0BMlp2/kvtWYg2mp5b/Gji9qDwA82Ku0QUm85Vq
 Wup9CUG2gc60FI+ZowAHyx5vA7m+Giiu5jkxNaNjVE8M1356NFHWTsZ9Z5lzh6GaRY
 oUBXMNENXQ8y9VXpLXtz53m4z8lTEUQ8YxqAJZAaJGK+mwpvgo8XF8227K0ssDI9H4
 yJh64C69ds+u5wFiJf1EdIxSn8UFxUCgGUIUtSXzkhzef10ZP3oCw5/Kxwb0D/ePR0
 yCrXMcGPKSvp4hXOXubDoGYLvfW9RTogreThW34h87s642UmbwMFKNBw1AkTnMsYN8
 Ghxm8A5JFWccA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 19A81E6ADFF;
 Sat, 23 Nov 2024 12:58:59 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Nov 2024 13:58:56 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-asus_qcom_display-v2-4-a0bff8576024@hotmail.com>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
In-Reply-To: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732366736; l=1600;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=vMJXwGXqcYHA1iOq+F9o2RBWr2fMV7IxMGdC4E6B5Pk=;
 b=365x96YE6AP/LybGpULNt3Vr0JG9Hmfnj6O5ZshBhwY8zwRr+XMHMUjn9K5v/i9xyCtSGfNCA
 g3MHJQw82pbDiDQAjwkV5+BmmzWObPa1+W1LULiSmFWb4nvQy0K9mvZ
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maud_spierings@hotmail.com>

Add bluetooth for the asus vivobook s15

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index d0bee4b6fc0be6fe40d335f4d50dde495853b315..caf7509692db84c69ad375b5dd07054ac0adcb52 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -18,6 +18,11 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-0 = <&hall_int_n_default>;
@@ -545,6 +550,14 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	bt_en_default: bt-en-sleep {
+		pins = "gpio116";
+		function = "gpio";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <16>;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
@@ -624,6 +637,17 @@ tpad_default: tpad-default-state {
 	};
 };
 
+&uart14 {
+	status = "okay";
+	bluetooth: bt_wcn7850 {
+		compatible = "qcom,wcn7850-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_default>;
+		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		max-speed = <3200000>;
+	};
+};
+
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;

-- 
2.47.0


