Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9165F3E9B8A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 02:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCD26E212;
	Thu, 12 Aug 2021 00:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4A16E207;
 Thu, 12 Aug 2021 00:14:55 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 11 Aug 2021 17:08:51 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Aug 2021 17:08:50 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 05:38:26 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 1F6AF220EC; Thu, 12 Aug 2021 05:38:25 +0530 (IST)
From: Sankeerth Billakanti <sbillaka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org
Subject: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
Date: Thu, 12 Aug 2021 05:38:02 +0530
Message-Id: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SC7280 platform supports an eDP controller, add
compatible string for it to msm/binding.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e..23b78ac 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
+      - qcom,sc7280-edp
 
   reg:
     maxItems: 1
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

