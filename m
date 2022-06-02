Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B2F53B780
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509D610E0F5;
	Thu,  2 Jun 2022 10:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B1A10E0F5;
 Thu,  2 Jun 2022 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654167014; x=1685703014;
 h=from:to:cc:subject:date:message-id;
 bh=ijYj7RlDEKtmAr/NFLRL0Xa0SCVOGON0rxxx2IQa9a0=;
 b=AAbHiPn/KVC4Z3oNwjmAj5JcSoIZlQ9JnM+SIp+Dwer4kq4PmktI8Foi
 1uMi4waN5IbhDGyQApyZExHj8V0bc8Vh456u+Bx0SKJ9qcrO3049L81sI
 4jD8A906wsJ76WUeY2xUBjNO9RPKbBrkcIXmRxsBIIQv7nCO81lpULnUI k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 02 Jun 2022 03:50:13 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 02 Jun 2022 03:50:11 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 02 Jun 2022 16:20:00 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id B94451FA84; Thu,  2 Jun 2022 16:19:59 +0530 (IST)
From: Krishna <quic_mkrishn@quicinc.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v1] dt-bindings: msm: update maintainers list with proper id
Date: Thu,  2 Jun 2022 16:19:58 +0530
Message-Id: <1654166998-14907-1-git-send-email-quic_mkrishn@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krishna Manikandan <quic_mkrishn@quicinc.com>

Use quic id instead of codeaurora id in maintainers list
for display devicetree bindings.

Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml          | 2 +-
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml          | 2 +-
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml          | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml        | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml        | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml        | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml        | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml      | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index b41991e..d3c3e4b 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DPU dt properties for SC7180 target
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 6e417d0..f427eec 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DPU dt properties for SC7280
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
   Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 1a42491..2bb8896 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DPU dt properties for SDM845 target
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7095ec3c8..880bfe9 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DSI controller
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
   - $ref: "../dsi-controller.yaml#"
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index 2d5a766..716f921 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DSI 10nm PHY
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
   - $ref: dsi-phy-common.yaml#
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 81dbee4..1342d74 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DSI 14nm PHY
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
   - $ref: dsi-phy-common.yaml#
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
index b8de785..9c1f914 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DSI 20nm PHY
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
   - $ref: dsi-phy-common.yaml#
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 69eecaa..3d8540a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DSI 28nm PHY
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
   - $ref: dsi-phy-common.yaml#
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
index 502bdda..76d40f7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Description of Qualcomm Display DSI PHY common dt properties
 
 maintainers:
-  - Krishna Manikandan <mkrishn@codeaurora.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
   This defines the DSI PHY dt properties which are common for all
-- 
2.7.4

