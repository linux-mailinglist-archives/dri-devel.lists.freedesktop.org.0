Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F83442A77
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 10:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C444B72D21;
	Tue,  2 Nov 2021 09:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265566FC40;
 Tue,  2 Nov 2021 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635839360; x=1667375360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JgtzhM5uHq22p0kNDKdr5arFTdi04se34+KztOlnDWI=;
 b=AWC+Zc/sQx59ES7Ny9uO+2Xg7woZFkupqNS+3/XlPa31JMUl5s6X9dFN
 5x0C19yx+048zQ36FbAvWnTYVbGeBNMj5lsdKleMPeXZHtNAb5QFQOwjS
 BPdzQj1HEBI4AiCJqExu4ud/dJnIiiX0uk6gOhL2pcZTY9uu1wuGiesG9 g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2021 00:49:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 00:49:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 2 Nov 2021 00:49:18 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 2 Nov 2021 00:49:14 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/5] dt-bindings: msm/dp: Add DP compatible strings for
 sc7280
Date: Tue, 2 Nov 2021 13:18:41 +0530
Message-ID: <1635839325-401-2-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:36:34 +0000
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_khsieh@quicinc.com, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, quic_mkrishn@quicinc.com,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

The Qualcomm SC7280 platform supports one eDP controller
and a DP controller. This change will add the compatible
string for both eDP and DP to msm dp-controller binding.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

changes in v3:
    - Modify the subject (Doug Anderson)
    - Add sc7280-dp also to the list (Stephen Boyd)

changes in v2:
    - Sort alphabetically (Stephen Boyd)
    - Cleanup residual stale changes in the patch (Matthias Kaehlcke)
    - Modify the subject (Doug Anderson)
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 63e585f..5457612 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc7280-dp
+      - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
 
-- 
2.7.4

