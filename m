Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF38A513B46
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B71F10E9B5;
	Thu, 28 Apr 2022 18:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBD710E1A9;
 Thu, 28 Apr 2022 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651169813; x=1682705813;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=S4ej8cAaExSyWS0YJOGhu3zdFKhnoSxnIcZpa0GFhkE=;
 b=fheTdMqD+Lt3tXv7z5lp8wGlj/KJFPZQePKVdsz9WYOypbChbsP8/B0r
 VVkLaSs/YBxL6yCf6QuWA/z/8JBDGD79G1bvgI6sm4KfmYFnuIqoB3yMX
 wjxA/arNzkNTmuL8VhTvOa0tX7vtWzy81Sp1T3QzLrt0cyLnyVuXxJftc k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 28 Apr 2022 11:16:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 11:16:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Apr 2022 11:16:12 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Apr 2022 11:16:12 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2] drm/msm/dpu: remove unused refcount for encoder_phys_wb
Date: Thu, 28 Apr 2022 11:15:59 -0700
Message-ID: <1651169759-29760-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the unused local variable refcount for encoder_phys_wb
as the one part of wb_enc is used directly.

changes in v2:
	- remove usage of ret variable also
	- remove the if (ret) code as it was dead-code anyway

Fixes: 0ce51f19453e ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index cb5c7da53c29..f4a79715a02e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -406,22 +406,13 @@ static void dpu_encoder_phys_wb_irq_ctrl(
 {
 
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
-	int ret = 0;
-	int refcount;
-
-	refcount = atomic_read(&wb_enc->wbirq_refcount);
 
-	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1) {
+	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
 		dpu_core_irq_register_callback(phys->dpu_kms,
 				phys->irq[INTR_IDX_WB_DONE], dpu_encoder_phys_wb_done_irq, phys);
-		if (ret)
-			atomic_dec_return(&wb_enc->wbirq_refcount);
-	} else if (!enable &&
-			atomic_dec_return(&wb_enc->wbirq_refcount) == 0) {
+	else if (!enable &&
+			atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
-		if (ret)
-			atomic_inc_return(&wb_enc->wbirq_refcount);
-	}
 }
 
 static void dpu_encoder_phys_wb_atomic_mode_set(
-- 
2.7.4

