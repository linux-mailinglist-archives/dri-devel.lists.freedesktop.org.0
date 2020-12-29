Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9DC2E6F7B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 10:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B56892EA;
	Tue, 29 Dec 2020 09:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5B5892C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 09:17:33 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D4phB0DPjz7M5V;
 Tue, 29 Dec 2020 17:16:42 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 17:17:26 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/dp: Delete unused local parameters
Date: Tue, 29 Dec 2020 17:17:27 +0800
Message-ID: <1609233447-61380-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:42:26 +0000
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warnings:
drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret".
Return "0" on line 880

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da..0c9a79f 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -845,8 +845,6 @@ bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
 
 static int dp_link_parse_vx_px(struct dp_link_private *link)
 {
-	int ret = 0;
-
 	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
 		drm_dp_get_adjust_request_voltage(link->link_status, 0),
 		drm_dp_get_adjust_request_voltage(link->link_status, 1),
@@ -877,7 +875,7 @@ static int dp_link_parse_vx_px(struct dp_link_private *link)
 			link->dp_link.phy_params.v_level,
 			link->dp_link.phy_params.p_level);
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
