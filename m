Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34232481E7D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB89510E21D;
	Thu, 30 Dec 2021 17:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9818F10E338;
 Thu, 30 Dec 2021 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640856323; x=1672392323;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=M9srDHgF2HXjdAEDI9jfUw9b/BSChoOvhhcJFE1IyQk=;
 b=JY+qGtRuB7YFfnUElTxdfhyj5zTVW7yVQetMFuUbsgSnfl1jxBQSs4bK
 R/7KiG79RcILmg6hNgrcCFDOm+yZHesbt45urhLY4SsSB15w6rkTU7gNE
 p/PrsEJaPIBVfbmqXlTsIh0vY4tdwt6C4b08/bhLg5rEVHLhFxkfsTkIa E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 30 Dec 2021 01:25:23 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 Dec 2021 01:25:21 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 30 Dec 2021 14:55:02 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 1F7FB21A28; Thu, 30 Dec 2021 14:55:00 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 1/2] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Date: Thu, 30 Dec 2021 14:54:35 +0530
Message-Id: <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 10nm dsi phy tuning properties for phy drive strength and
phy drive level adjustemnt.

Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
---
 .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index 4399715..9406982 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -35,6 +35,18 @@ properties:
       Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
       connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
 
+  phy-drive-strength-cfg:
+    type: array
+    description:
+      Register values of DSIPHY_RESCODE_OFFSET_TOP and DSIPHY_RESCODE_OFFSET_BOT
+      for all five lanes to adjust the phy drive strength.
+
+  phy-drive-level-cfg:
+    type: array
+    description:
+      Register values of DSIPHY_RESCODE_OFFSET_TOP for all five lanes to adjust
+      phy drive level/amplitude.
+
 required:
   - compatible
   - reg
@@ -64,5 +76,12 @@ examples:
          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
                   <&rpmhcc RPMH_CXO_CLK>;
          clock-names = "iface", "ref";
+
+         phy-drive-strength-cfg = [00 00
+                                   00 00
+                                   00 00
+                                   00 00
+                                   00 00];
+         phy-drive-level-cfg = [59 59 59 59 59];
      };
 ...
-- 
2.7.4

