Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1331330D4F0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B5C6EA0E;
	Wed,  3 Feb 2021 08:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17640.qiye.163.com (mail-m17640.qiye.163.com
 [59.111.176.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148986E152
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 12:32:29 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 66E035401D8;
 Tue,  2 Feb 2021 20:32:25 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Bernard Zhao <bernard@vivo.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: remove unneeded variable: "rc"
Date: Tue,  2 Feb 2021 04:32:03 -0800
Message-Id: <20210202123214.15787-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHUJLTk4aTh1JGElKVkpNSklJTUJKT05MSElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46CCo4Fj8cFzY6Ii9NLCEQ
 DwEKFDVVSlVKTUpJSU1CSk9NS0JMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSU9ISzcG
X-HM-Tid: 0a7762bace45d995kuws66e035401d8
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

remove unneeded variable: "rc".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d1780bcac8cc..9cc816663668 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -409,7 +409,6 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 {
-	int rc = 0;
 	struct drm_display_mode *drm_mode;
 
 	drm_mode = &dp_panel->dp_mode.drm_mode;
@@ -436,7 +435,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 					min_t(u32, dp_panel->dp_mode.bpp, 30));
 	DRM_DEBUG_DP("updated bpp = %d\n", dp_panel->dp_mode.bpp);
 
-	return rc;
+	return 0;
 }
 
 struct dp_panel *dp_panel_get(struct dp_panel_in *in)
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
