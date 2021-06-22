Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1A3B04F9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6056E4E8;
	Tue, 22 Jun 2021 12:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563726E4D7;
 Tue, 22 Jun 2021 12:43:10 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2021 05:43:10 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Jun 2021 05:43:09 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 22 Jun 2021 18:12:39 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 0FE6420FA1; Tue, 22 Jun 2021 18:12:38 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
Date: Tue, 22 Jun 2021 18:12:26 +0530
Message-Id: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: jonathan@marek.ca, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 robdclark@gmail.com, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v2:
- New
  This patch depends on [1] (dt-bindings: msm: dsi: add missing 7nm bindings)

[1] https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/

 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c0077ca..d282b00 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - const: qcom,dsi-phy-7nm
       - const: qcom,dsi-phy-7nm-8150
+      - const: qcom,sc7280-dsi-phy-7nm
 
   reg:
     items:
-- 
2.7.4

