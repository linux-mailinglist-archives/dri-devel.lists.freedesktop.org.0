Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808E3C2203
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 11:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFBE6E9FA;
	Fri,  9 Jul 2021 09:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 968 seconds by postgrey-1.36 at gabe;
 Fri, 09 Jul 2021 09:59:37 UTC
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4270C6E9FA;
 Fri,  9 Jul 2021 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=COISp
 wghJpsZ4Lc5bzWnX/i5U691H/hAD6H0OTHuz80=; b=pGAAenVqK5T9xibHF3u+P
 xjujH0995EQ9DUWwMmq4Jr95RcZI0lqsZtioBT6QduvKN9hZkt8dT3YEkdtPdmg4
 P4dUhaU0F8LtztzgyZerdF7Qd5clVpEbm6AW0FZb8KbZKb+L75C1rwOfl8nycoXM
 i0ob9C4UZ1vA/4t96epkog=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp11 (Coremail) with SMTP id D8CowAA3P+fzGehglpvgAA--.66S2;
 Fri, 09 Jul 2021 17:42:38 +0800 (CST)
From: dingsenjie@163.com
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu: drm: Remove unneeded variable: "ret"
Date: Fri,  9 Jul 2021 17:41:44 +0800
Message-Id: <20210709094144.118920-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAA3P+fzGehglpvgAA--.66S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr47Kr45tr47AryDWry3Arb_yoW5XF1Dpr
 W5uwn0qry8Zw48Xr4UCFyfuFy3Z3WI9rWxJry2g3sYyF1ayw4DGa45uF4xWF4akFZxCrW2
 qF4fAw1xZF1xWrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UupBhUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbipRq8yFUMe+47egABsH
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
Cc: linux-arm-msm@vger.kernel.org, dingsenjie <dingsenjie@yulong.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dingsenjie <dingsenjie@yulong.com>

remove unneeded variable: "ret".

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c |  4 +---
 drivers/gpu/drm/msm/dp/dp_link.c | 13 ++++---------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5..0d11046 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1052,7 +1052,6 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
 		u8 pattern)
 {
 	u8 buf;
-	int ret = 0;
 
 	DRM_DEBUG_DP("sink: pattern=%x\n", pattern);
 
@@ -1061,8 +1060,7 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
 	if (pattern && pattern != DP_TRAINING_PATTERN_4)
 		buf |= DP_LINK_SCRAMBLING_DISABLE;
 
-	ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
-	return ret == 1;
+	return drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf) == 1;
 }
 
 static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da..fee3bc4 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -782,7 +782,6 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
 bool dp_link_send_test_response(struct dp_link *dp_link)
 {
 	struct dp_link_private *link = NULL;
-	int ret = 0;
 
 	if (!dp_link) {
 		DRM_ERROR("invalid input\n");
@@ -791,10 +790,8 @@ bool dp_link_send_test_response(struct dp_link *dp_link)
 
 	link = container_of(dp_link, struct dp_link_private, dp_link);
 
-	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_RESPONSE,
-			dp_link->test_response);
-
-	return ret == 1;
+	return drm_dp_dpcd_writeb(link->aux, DP_TEST_RESPONSE,
+			dp_link->test_response) == 1;
 }
 
 int dp_link_psm_config(struct dp_link *dp_link,
@@ -829,7 +826,6 @@ int dp_link_psm_config(struct dp_link *dp_link,
 bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
 {
 	struct dp_link_private *link = NULL;
-	int ret = 0;
 
 	if (!dp_link) {
 		DRM_ERROR("invalid input\n");
@@ -838,9 +834,8 @@ bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
 
 	link = container_of(dp_link, struct dp_link_private, dp_link);
 
-	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_EDID_CHECKSUM,
-						checksum);
-	return ret == 1;
+	return drm_dp_dpcd_writeb(link->aux, DP_TEST_EDID_CHECKSUM,
+						checksum) == 1;
 }
 
 static int dp_link_parse_vx_px(struct dp_link_private *link)
-- 
1.9.1

