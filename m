Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9EB4BD9D0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E6D10E2F4;
	Mon, 21 Feb 2022 13:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861DA10E2EB;
 Mon, 21 Feb 2022 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645449149; x=1676985149;
 h=from:to:cc:subject:date:message-id;
 bh=G7oTbgnW/y7+oRzp7iXZzH5BC58ZLVjZyl7jNT6m2Z8=;
 b=LdPwZU66Nr+bx0t1XDmcph2ydGHan+ebdb65MdBo8c+aUUrNuKIR5iSP
 nBsxNsJCHZFkkNlLQFXBG6oL1N992cBb2hCUg6PZe/MI9McdW98XjBE8i
 Dn+8iUS6bT23MJhNIOSborsemk1yzc7NFQF+CORUe/qVbMIwqU9FyaAhJ M=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2022 05:12:28 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2022 05:12:26 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 21 Feb 2022 18:42:12 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 41F47231E; Mon, 21 Feb 2022 18:42:12 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] arm64/dts/qcom/sc7280: update mdp clk to max supported value to
 support higher refresh rates
Date: Mon, 21 Feb 2022 18:42:06 +0530
Message-Id: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

Panels with higher refresh rate will need mdp clk above 300Mhz.
Select max frequency for mdp clock during bootup, dpu driver will
scale down the clock as per usecase when first update from the framework is received.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index baf1653..7af96fc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2895,7 +2895,7 @@
 				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
 						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
 						<&dispcc DISP_CC_MDSS_AHB_CLK>;
-				assigned-clock-rates = <300000000>,
+				assigned-clock-rates = <506666667>,
 							<19200000>,
 							<19200000>;
 				operating-points-v2 = <&mdp_opp_table>;
-- 
2.7.4

