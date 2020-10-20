Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE0A2948BC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC756E9B0;
	Wed, 21 Oct 2020 07:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAFC6ED16
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:00:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603213228; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=UvDGTaz8J2/Cnaz46As0MAOMJxrv3yTPNC6RTt8QiVA=;
 b=xQcQSfKzt0RMnB74hW8vlGWzs1l4Rd5hmAmmWC+Y/pWyjEEVJIwWxQAbdKz8Qriihpr9XrD0
 IJnzv0fdZAP/BZDV5CYjo2PbydctyWVtrtsA+lJN+FXFvuGiH/mVzK39DFbny270z3XiIRro
 GeqCH3qjeMNs4wOYSxm1HV8cDtk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f8f179e856d9308b53a655a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 17:00:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8106CC43395; Tue, 20 Oct 2020 17:00:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B748EC433FE;
 Tue, 20 Oct 2020 17:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B748EC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
Date: Tue, 20 Oct 2020 09:59:59 -0700
Message-Id: <20201020165959.7441-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to check LINK_STATuS_UPDATED bit before
return 6 bytes of link status during link training.
This patch also fix phy compliance test link rate
conversion error.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++--------------
 drivers/gpu/drm/msm/dp/dp_link.c | 24 +++++++++++-------------
 2 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6bdaec778c4c..76e891c91c6e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1061,23 +1061,15 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
 static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
 				    u8 *link_status)
 {
-	int len = 0;
-	u32 const offset = DP_LANE_ALIGN_STATUS_UPDATED - DP_LANE0_1_STATUS;
-	u32 link_status_read_max_retries = 100;
-
-	while (--link_status_read_max_retries) {
-		len = drm_dp_dpcd_read_link_status(ctrl->aux,
-			link_status);
-		if (len != DP_LINK_STATUS_SIZE) {
-			DRM_ERROR("DP link status read failed, err: %d\n", len);
-			return len;
-		}
+	int ret = 0, len;
 
-		if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
-			return 0;
+	len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+	if (len != DP_LINK_STATUS_SIZE) {
+		DRM_ERROR("DP link status read failed, err: %d\n", len);
+		ret = len;
 	}
 
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index c811da515fb3..58d65daae3b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -773,7 +773,8 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
 			link->request.test_lane_count);
 
 	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
-	link->dp_link.link_params.rate = link->request.test_link_rate;
+	link->dp_link.link_params.rate =
+		drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
 
 	return 0;
 }
@@ -939,20 +940,17 @@ static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
  */
 static int dp_link_process_link_status_update(struct dp_link_private *link)
 {
-	if (!(get_link_status(link->link_status,
-				DP_LANE_ALIGN_STATUS_UPDATED) &
-				DP_LINK_STATUS_UPDATED) ||
-			(drm_dp_clock_recovery_ok(link->link_status,
-					link->dp_link.link_params.num_lanes) &&
-			drm_dp_channel_eq_ok(link->link_status,
-					link->dp_link.link_params.num_lanes)))
-		return -EINVAL;
+	bool channel_eq_done = drm_dp_channel_eq_ok(link->link_status,
+			link->dp_link.link_params.num_lanes);
+
+	bool clock_recovery_done = drm_dp_clock_recovery_ok(link->link_status,
+			link->dp_link.link_params.num_lanes);
 
 	DRM_DEBUG_DP("channel_eq_done = %d, clock_recovery_done = %d\n",
-			drm_dp_clock_recovery_ok(link->link_status,
-			link->dp_link.link_params.num_lanes),
-			drm_dp_clock_recovery_ok(link->link_status,
-			link->dp_link.link_params.num_lanes));
+			channel_eq_done, clock_recovery_done);
+
+	if (channel_eq_done && clock_recovery_done)
+		return -EINVAL;
 
 	return 0;
 }

base-commit: 0855cb4b31953b8c539e57b970da8146bcd4405a
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
