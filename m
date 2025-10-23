Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE98BC035E9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576410E1B1;
	Thu, 23 Oct 2025 20:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NHJSLV5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7374710E17F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 20D554A8D0;
 Thu, 23 Oct 2025 20:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD837C19421;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761251069;
 bh=fj87h6fHhPiKSl6C5poX504gv/9y/218PwQyedWdhg8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=NHJSLV5+88kZwCR8iJcmWJRCHAko+rMx2Ljp3gDX1+ln0pXXR1/PWHuP8eI6Sv/1z
 hg2g7Q/ZD/DWLGXso8OGHZhEYOhoFfW3Zv2OY26uipQJf056nklKuxrDOOC9CqnxUU
 q5nX1LjCHNQw6jsY8RiyrsSZHqar3/yqHMUfXxUwBpvbVrogftNIvL41YedhMwudyV
 B+rVcEiwNqII+pry7aujARPsu+iJWP3quyvkrbuw7oIYFOGTvWgbLrpBVJxrg+Xfrj
 CdwJsQbO6UA74I1B73j0xUNB6gcJ2KFKvOpOsCwwHt03UXNmklqgMZw74Us2uQT2LN
 JK0k7MSG+XWUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B25AFCCF9E8;
 Thu, 23 Oct 2025 20:24:29 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 23 Oct 2025 22:24:28 +0200
Subject: [PATCH v5 4/6] arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-s6e3fc2x01-v5-4-8f8852e67417@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KTrLESxmqDJURSGJs44NIqxmLK4hwbD8ph2DGEQH+CE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo+o77uujFsltfqo96ZmYTTpTKudcPgXAiLNZMK
 57CyEoqosuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPqO+wAKCRBgAj/E00kg
 cvKDD/4uAgtvDiH/ltiaHqvj7IFbcebHfyl00hQgCIjDDd8AMrsrWD5yt9QOnN0QtlGtevy18Ea
 aIPh3tMoC2sNfXog6tWKoUg8FJRkyGHB4WuJi8dCAdfFCf71Fz63dBhVd27cClPSZWGJf6+fs7K
 +LCtVV5WDNAUvQxAfMg96ykmgStd1DVh589zCxofIK2HfEKFIu5wI0844olnVcTXkoIXNss1A2M
 lL/Npa9uqDajLv8ONLrTN3N9oRi6PiNy/e8vSZHSb0bNVLQv943lGhPv46f3KJVDH2SHZvIffD6
 lgCU6qmT6HNsZC/46LfoW0VTMAlo9eEw1CVEEHz9PCtnjGygLIkZxRWa4m4a+1xY3PWihG5iZFj
 zsrXKnemAjqM3mxx+MTx97+BklvqvdibBBJMcbVBqXLSWDw/h/dbYSGlHQp6nUGyTtezL+40Ju2
 6ra0th6kdSHYgCwPbUIrJsOLDJ3jqKDEVkvHviTJKTOobGw+cRr3tv3WA8/+2kbtAx1sYDz63Ss
 CIiMNmzV+OYzAHtw/f75YVFXsaT9qoKpBlv4uUXvJy36tSvTtv1Gg7gm8Ex253GkeZliTJwhkeX
 7o0vLn/6J8SYpX7X6pDOfDFs+8lly2rZk1SPjDPwbNxnYIbjFEBTKmCmOXDWPez9+y5gg4sMWzQ
 lTJb0ZpFzVxDTUA==
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


