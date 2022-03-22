Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62F4E376C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 04:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C3E10E506;
	Tue, 22 Mar 2022 03:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3243C10E506;
 Tue, 22 Mar 2022 03:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647919651; x=1679455651;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=GBCchohdMxPmdCyHwZJ3vkgN2swoKj239vTmkcRZUrE=;
 b=RKsl7yY7BuSnwrU39gRuzNTwwLSG/nUs0OFft5MhHsa9kQARw/VwHMkD
 T8tv1+0AeaBXugjf+7EPlLW8lkfpN3VPO/YhViD7gBY3wJYvHUhN+0Dbj
 A2eC7KpZNAQHBPEMhnhr0Xs8M9Bx+xs3i8AMW56Dsi/+s3XqJgGLCODj0 E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 20:27:31 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Mar 2022 20:27:29 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 22 Mar 2022 08:57:13 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 38BD85422; Tue, 22 Mar 2022 08:57:13 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 2/5] arm64: dts: qcom: sm7280: remove assigned-clock-rate
 property for mdp clk
Date: Tue, 22 Mar 2022 08:57:08 +0530
Message-Id: <1647919631-14447-3-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the assigned clock rate property and vote on the mdp clock as per
calculated value during the usecase.

This patch is dependent on the patch ("drm/msm/disp/dpu1: set mdp clk
to the maximum frequency in opp table during probe") [1].

[1] https://lore.kernel.org/r/1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com/

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c07765d..a3c768c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3086,9 +3086,6 @@
 				      "ahb",
 				      "core";
 
-			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			assigned-clock-rates = <300000000>;
-
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -3122,11 +3119,9 @@
 					      "lut",
 					      "core",
 					      "vsync";
-				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
-						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
 						<&dispcc DISP_CC_MDSS_AHB_CLK>;
-				assigned-clock-rates = <300000000>,
-							<19200000>,
+				assigned-clock-rates = <19200000>,
 							<19200000>;
 				operating-points-v2 = <&mdp_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
-- 
2.7.4

