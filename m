Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3659D8CA3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 20:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55810E2F3;
	Mon, 25 Nov 2024 19:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qB2ov1bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E697D10E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 19:11:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF199A4190A;
 Mon, 25 Nov 2024 19:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30E0BC4CECF;
 Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732561891;
 bh=8sJw68/x7LRX6GAezVBs9korCRxUnf0mjseISjnG5/M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=qB2ov1bWH4QCG8eIBFCAijU1v7sO1es4a1kjwJ0z6Sl2iMUyO5jbHnW4PDGFFjJMx
 Jn318kwEQRKfTt9+VCTu99SDFox46tyX+hBlJ2UYdVEWCY5XqdSamPRB835OjgHwLQ
 tBzgzqK3lC6lvE5KCVGkHjaEXzwPDVeqyludROMJfZzJqtaSId+UmDv6jEsLjirqod
 tRxzijEC/W/Cu7ssWQIVD1h1jgQs1LIQGofcGSQ0jepm9032VM9MbBxZ9DQD2GmdPc
 fcUwkarAtkHkcQtdyTXCDTQwBWAI6sW61E0eNiMKMl4zyFYz0dczKy3ItVGgaVbuKo
 D7iLaozhRYfjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1E564D59D63;
 Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Mon, 25 Nov 2024 20:11:18 +0100
Subject: [PATCH v4 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-asus_qcom_display-v4-2-61a4da162406@hotmail.com>
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
In-Reply-To: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732561888; l=1659;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=dtYV+z9lYSzEf2bGKf8JU+PRYZscyBu18hsPuUz7+R4=;
 b=ghzjrMjlhBAs8cX/JpCUp9nqvj2YH6ZkPiXEliEnVHiyTdizACb8S+EYJpzv8gGccwNj267AF
 KgqBK/3N7YEAB0IwGAtgszOfVHVHepX2nO+ZHvHE2IloJfhKx/YKYtN
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

Add the lid switch for the Asus vivobook s15

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 8cdb2888d10a1dfc0c28480b6636584ab06853bb..7269f8e7709988657b363004875163a69142f16c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -17,6 +18,20 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -539,6 +554,12 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

-- 
2.47.1


