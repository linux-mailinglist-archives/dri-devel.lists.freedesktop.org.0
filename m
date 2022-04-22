Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372C50C27F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 01:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062C10EC3A;
	Fri, 22 Apr 2022 23:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4481810EC25;
 Fri, 22 Apr 2022 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650668835; x=1682204835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=pqhpbExVaY94OXnBv3lAHoRtKCzHSUV/Ityd7EiT/so=;
 b=vMaMZAMc04SCAwIt078efqSdTOdUotbEKf331MBal/0nnM5xeXigBHUI
 OG7XZf6ZKrjy1ANrY3AJxkh4tB/akaQvCbXuZM35G/yKFuN/5vgVQ1PiL
 mpvIz31Mp6ySN8kGwcdAoXs9mUZhWaYXDM4Y8vUa9eCjLQFQOdSGy9s1A M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Apr 2022 16:07:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 16:07:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 16:07:14 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 16:07:13 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 06/20] drm/msm/dpu: rename dpu_hw_pipe_cdp_cfg to
 dpu_hw_cdp_cfg
Date: Fri, 22 Apr 2022 16:06:41 -0700
Message-ID: <1650668815-7048-7-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650668815-7048-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650668815-7048-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg and move it
to dpu_hw_utils file so that other modules in addition to
SSPP such as writeback can use it as all the fields can
be used by writeback as well.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 18 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 4 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 09cdc35..0a0864d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -627,7 +627,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cdp_cfg *cfg,
+		struct dpu_hw_cdp_cfg *cfg,
 		enum dpu_sspp_multirect_index index)
 {
 	u32 idx;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 92b071b..a81e166 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -193,22 +193,6 @@ enum {
 };
 
 /**
- * struct dpu_hw_pipe_cdp_cfg : CDP configuration
- * @enable: true to enable CDP
- * @ubwc_meta_enable: true to enable ubwc metadata preload
- * @tile_amortize_enable: true to enable amortization control for tile format
- * @preload_ahead: number of request to preload ahead
- *	DPU_SSPP_CDP_PRELOAD_AHEAD_32,
- *	DPU_SSPP_CDP_PRELOAD_AHEAD_64
- */
-struct dpu_hw_pipe_cdp_cfg {
-	bool enable;
-	bool ubwc_meta_enable;
-	bool tile_amortize_enable;
-	u32 preload_ahead;
-};
-
-/**
  * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
  * @size: size to prefill in bytes, or zero to disable
  * @time: time to prefill in usec, or zero to disable
@@ -359,7 +343,7 @@ struct dpu_hw_sspp_ops {
 	 * @index: rectangle index in multirect
 	 */
 	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_cdp_cfg *cfg,
+			struct dpu_hw_cdp_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 3913475..a200df1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -298,6 +298,21 @@ struct dpu_drm_scaler_v2 {
 	struct dpu_drm_de_v1 de;
 };
 
+/**
+ * struct dpu_hw_cdp_cfg : CDP configuration
+ * @enable: true to enable CDP
+ * @ubwc_meta_enable: true to enable ubwc metadata preload
+ * @tile_amortize_enable: true to enable amortization control for tile format
+ * @preload_ahead: number of request to preload ahead
+ *	DPU_*_CDP_PRELOAD_AHEAD_32,
+ *	DPU_*_CDP_PRELOAD_AHEAD_64
+ */
+struct dpu_hw_cdp_cfg {
+	bool enable;
+	bool ubwc_meta_enable;
+	bool tile_amortize_enable;
+	u32 preload_ahead;
+};
 
 u32 *dpu_hw_util_get_log_mask_ptr(void);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c77c3d9d..08b8c64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1246,9 +1246,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_index);
 
 		if (pdpu->pipe_hw->ops.setup_cdp) {
-			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
+			struct dpu_hw_cdp_cfg cdp_cfg;
 
-			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
+			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
 
 			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
 					[DPU_PERF_CDP_USAGE_RT].rd_enable;
-- 
2.7.4

