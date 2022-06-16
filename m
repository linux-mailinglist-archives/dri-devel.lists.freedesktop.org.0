Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1A54E9BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D9C11A4EE;
	Thu, 16 Jun 2022 19:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172CF11A4EB;
 Thu, 16 Jun 2022 19:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655406111; x=1686942111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=lHFm+y5ucgd6orxxm42YZyd5QnhlOerZcbt/dcNUICA=;
 b=kUcDYBFieszYAHAtc44bUYVWkxuJX4j30iui38heoSMboKUtyvbkHY0G
 xnB3s4N9FuXUMrKNZPlxp5EmLGD81Rm7iYKCKCwU0nT5u+tewEGWASN+A
 ozd9m3pkvMk24KJ4x+vhTftKA3vmxlNiXjeOQ01/Gu6wTfGDr3YeMnrRj k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2022 12:01:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 12:01:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:01:50 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:01:49 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/msm/dpu: remove hard-coded linewidth limit for
 writeback
Date: Thu, 16 Jun 2022 12:01:24 -0700
Message-ID: <1655406084-17407-3-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655406084-17407-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1655406084-17407-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the hard-coded limit for writeback and lets start using
the one from catalog instead.

changes in v3:
	- correct the Fixes tag

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 59da348ff339..fc1d4fda69b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -20,8 +20,6 @@
 #include "dpu_crtc.h"
 #include "disp/msm_disp_snapshot.h"
 
-#define DEFAULT_MAX_WRITEBACK_WIDTH 2048
-
 #define to_dpu_encoder_phys_wb(x) \
 	container_of(x, struct dpu_encoder_phys_wb, base)
 
@@ -278,9 +276,9 @@ static int dpu_encoder_phys_wb_atomic_check(
 		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
 				  mode->vdisplay);
 		return -EINVAL;
-	} else if (fb->width > DEFAULT_MAX_WRITEBACK_WIDTH) {
+	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
 		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
-				  fb->width, DEFAULT_MAX_WRITEBACK_WIDTH);
+				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
 		return -EINVAL;
 	}
 
-- 
2.7.4

