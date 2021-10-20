Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A2435BA3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597E66E40A;
	Thu, 21 Oct 2021 07:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4E66E284;
 Wed, 20 Oct 2021 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634732446; x=1666268446;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NDa9KEOle5Dvn0boViSDp3mupUuPQQnHaePh4Ug4R4E=;
 b=QXMSRJo400FKFHtkqhEY6eML1iZTVGj+apnu/2JKwut3NyD1FjP/a80e
 gJC4mDng3OQg02ZQBZFFcalzL9vOFqNQX6SlUqW5h2DVR6BcJcnwEjdwL
 HzZ0JLhJUXV8ZUGlbypdDU6TKXI0Y3eJ96nJFqptL6uEKmNkAVkhtWS/v 0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 05:14:43 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Oct 2021 05:14:41 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 20 Oct 2021 17:44:27 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 5E91420E29; Wed, 20 Oct 2021 17:44:26 +0530 (IST)
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org, Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
Date: Wed, 20 Oct 2021 17:44:11 +0530
Message-Id: <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailman-Approved-At: Thu, 21 Oct 2021 07:25:31 +0000
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

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

The Qualcomm SC7280 platform supports an eDP controller, add
compatible string for it to dp-controller.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 63e585f..ab2bb1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
 
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

