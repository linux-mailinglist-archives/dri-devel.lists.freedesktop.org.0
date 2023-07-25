Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1C76051B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 04:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C0810E046;
	Tue, 25 Jul 2023 02:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42210E046
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 02:13:24 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R90pt5xPvzNm9h;
 Tue, 25 Jul 2023 10:09:58 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 10:13:20 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 -next] drm/fb-helper: Remove unused inline function
 drm_fb_helper_defio_init()
Date: Tue, 25 Jul 2023 10:13:17 +0800
Message-ID: <20230725021317.8080-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8e86dee02253 ("drm/fb-helper: Remove drm_fb_helper_defio_init() and update docs")
this inline helper not used anymore.

Fixes: 8e86dee02253 ("drm/fb-helper: Remove drm_fb_helper_defio_init() and update docs")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2: Add Fixes tag
---
 include/drm/drm_fb_helper.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 4863b0f8299e..375737fd6c36 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -368,11 +368,6 @@ static inline void drm_fb_helper_deferred_io(struct fb_info *info,
 {
 }
 
-static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
-{
-	return -ENODEV;
-}
-
 static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
 					     bool suspend)
 {
-- 
2.34.1

