Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E7BE4836
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD0710EA41;
	Thu, 16 Oct 2025 16:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ofKSPSEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24E10EA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4B9AE4517C;
 Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CC13C116D0;
 Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760631420;
 bh=uuKGdgf3GGKMZ/344Y7i/bDx9cX8qCe+sQapVjsDsWg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ofKSPSEInqFCGlRlS0QxfZO3UMRN4PqztTssYIZaSl6DbaYHgpXsL16248VuKzQ5m
 BM62GN0XFF4K8n0BY72cjK/qk7EtnscNKZFaiH0IYakv4qzRrjYsfMrctKMwHygrjJ
 jRii2qB7M/Ub56vt6bPrN9JFZdcZgFdSy738S7rark6YMukZFYNI8K6j4/G4yW8X7G
 sC/qNlUdlADtTLk8JlFdoYWbR+bdtv6hO1hUKfQcmdZ2Y/EonISYBQ2jRyH/v2Qyl+
 rctFM1COyRbd6qPMdO6gZKklUYOSMBbYnVdCh3Llx40F9Mdyk4uATwsO4UmuUCD/MP
 EkA2eUmJ3HQaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F16F6CCD19A;
 Thu, 16 Oct 2025 16:16:59 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 18:17:01 +0200
Subject: [PATCH v3 6/8] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
In-Reply-To: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
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
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=IdGkA2BKwmHx0VWG6UhlzI4rKDrzt5SVgWCdxZMctQg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8Rp5vN8HQcZ54pdipCWfyIN70cVAsyHq2daOQ
 59LWvnxPvCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPEaeQAKCRBgAj/E00kg
 cpSKEACUZgZD3YpZbH/UXmE7NJ+MyBRKPn0g/VuLazxFylvuV1y4an2YgZX3mChsVlfkimxaUiR
 RMwSSNyGFm+JFaHYGSMtSkCnnERaLN1iJpiAjLJ7rSom8kNnng+Ld6tb8BdWgpuFKvtmQxsbnK+
 NCFidN1kjIiRc8cL8FN1PT6GW4xMqInCIU5HFlvYjsQsPTHrAxJe1QJFp7te9LT6KcSrLtlGtgw
 Bg6pwROadutE9XK9L1Y87wSZlGMXM6B725B+ku5gaqNRNdhJZABJf9gfphRzeVKDxyCUavfRD4t
 dRp26jwtS67lutsf8MiYutI0Al1yjc2pt9JGT47Q4MigGbQocPLpcouqQK/uBlXo+2LEEdah+UB
 3jYdPofturtqmzoifL8PkHyjwsIS19t9Kmr8/GFvyq5YHFUUsD84MROXXYqA7pMWZuocZhFUOdi
 hS9QB/cSd7vtknj+Fl6q3sVIN25N7m1qIrPZKv/I2TrksgNLy1rUmrl2Gw0ZMp6FiPCqw8ZUfzQ
 aVvtEj9gpdQZSg4ODqkLJTbP71SOY9l11v7f0U8b4wITpcNxy13TXku8JuRYdTW04GKUfOHU1uI
 XOLtLFfCVgptECqMQ9SocP2boATCJ/EgWwHWQHGVLoGe1rWnm7nqonaJ0pisBB4O0BOGEFJJqrc
 fVEErpNohgoEptw==
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

We can DSI pin from 8mA to 2mA while suspend, do it.

In theory, should give us extra 2 hours of idle battery life.

cosmetic: sort pinctrl properties.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 9b571fab9c80c..a8e87507d667b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -462,8 +462,9 @@ display_panel: panel@0 {
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default>;
+		pinctrl-1 = <&panel_sleep>;
+		pinctrl-names = "default", "sleep";
 
 		port {
 			panel_in: endpoint {
@@ -870,6 +871,29 @@ te-pins {
 		};
 	};
 
+	panel_sleep: panel-sleep-state {
+		esd-pins {
+			pins = "gpio30";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		te-pins {
+			pins = "gpio10";
+			function = "mdp_vsync";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	tri_state_key_default: tri-state-key-default-state {
 		pins = "gpio40", "gpio42", "gpio26";
 		function = "gpio";

-- 
2.51.0


