Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB4BF631C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8E210E5D1;
	Tue, 21 Oct 2025 11:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NwFuJJU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16A10E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E1E749C4C;
 Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC279C116C6;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761047588;
 bh=fj87h6fHhPiKSl6C5poX504gv/9y/218PwQyedWdhg8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=NwFuJJU5vMMje1o9FS3cTBBT8Izn7i/8faRGaxEOI4bLpe+a+Y2kTMZvrIugMuTPe
 3fek92YoK7nPY3AnMoANHkzZ2it4YyW5jTmR/0JC+mNOHr/dP1ISgF+jXPv6Y+UkBV
 rASTSVRDUlooecuMux0CuBM9soTzeJivtakTuilOoWlPFYY/XzYb/VdX1pGqnlfyva
 PN3MRqrg2Q/ZadK0aIjgt+EE2m5az616tT5p257NkYHYlq0bj2NkccvpUp4V9+VFET
 RKay/RlTgmmaDoRKlarquQv4WPWFslLZ3PSNzoyaw8twb5XPI3WdoWxrVZe3stkjrE
 CtaKIpRhu5YBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E140FCCD1AB;
 Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:04 +0200
Subject: [PATCH v4 4/7] arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-4-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KTrLESxmqDJURSGJs44NIqxmLK4hwbD8ph2DGEQH+CE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93QhYI72W+xL1iYR88xJCffoEAu642WnVDrao
 s6SRRtq/dOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 clv6EACVHWSXf8INehHmARalnfS2d8uET3mOQRebSwlbgVKmeQntR6cmrg9LGNOck6cod4zRIzC
 ZSB0DUjS1eKC+Dy6HM6gxpNI9F1NWIlv8cC6X6tj4isG+wUXeu6fGvTXrJk9m67fh0ZxFjSRSbd
 o7BBbzrWtgqpGbjtLpxLu0tRnhaULOF/5lHWcCvTMUHcSjcx99arDFSVd8/+4QPUtdjBhVCcLwP
 Naqj3RIad4j5qHt1t9uiowVqpvxQ0K1hYjn64AAajW9+5mAEPkOD7ZbspRc6njSAQpb0yktcpbL
 LNUTS6cXL6IV7R0GlSMFkTEYMy6s1TS/fBz18y+/iMcm0ZEuL0n72OOK3Palr34WOjf3M+UsQ7j
 HkTfK1mWg5HbSPCrVx+JlpboizW8Z6zexy/3xPkIgaMSZ2iSJH7s0UhAQhlGie5JYWdqwXM4oNK
 9KOn/Jl1kz0VYLneK4yuSO0W4F6CKEbOpstc9T5iMwwX8THJ0sZ+o/Kn9ty1Gk1sFTou6VHleYo
 aIJ7NrWw0lLtlsUw1zSTyLzBWrjXOYOzHiriR5iFIZNhMjIrdw5DalOo2Px9hQKVu/ZBATfSkyM
 lAvI518j9mmulDWEEzi0cpU7ek08GELVHfoK+H5xdejDqPcZwFEhdItAjCoZF90n3mFeH2808qg
 WCAHQYlKOUi/xFg==
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

As these pins won't be used outside the group, let's group them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 1cf03047dd7ae..9b571fab9c80c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -463,7 +463,7 @@ display_panel: panel@0 {
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
+		pinctrl-0 = <&panel_default>;
 
 		port {
 			panel_in: endpoint {
@@ -847,6 +847,29 @@ panel_poc_default: poc-state {
 		bias-disable;
 	};
 
+	panel_default: panel-default-state {
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
+			drive-strength = <8>;
+			bias-disable;
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
@@ -861,27 +884,6 @@ ts_default_pins: ts-int-state {
 		bias-pull-up;
 	};
 
-	panel_reset_pins: panel-reset-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	panel_te_pin: panel-te-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	panel_esd_pin: panel-esd-state {
-		pins = "gpio30";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	speaker_default: speaker-default-state {
 		pins = "gpio69";
 		function = "gpio";

-- 
2.51.0


