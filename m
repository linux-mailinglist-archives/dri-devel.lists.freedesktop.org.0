Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773375FE72A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 04:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3076910EA56;
	Fri, 14 Oct 2022 02:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A05A10EA56
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 02:55:06 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MpW880xjszHtgm;
 Fri, 14 Oct 2022 10:50:00 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 10:50:02 +0800
From: Yuan Can <yuancan@huawei.com>
To: <tomba@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <neil.armstrong@linaro.org>, <bparrot@ti.com>, <cai.huoqing@linux.dev>,
 <arnd@arndb.de>, <guozhengkui@vivo.com>, <jsarha@ti.com>,
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/omapdrm: Remove unused struct csc_coef_rgb2yuv
Date: Fri, 14 Oct 2022 02:48:10 +0000
Message-ID: <20221014024810.21675-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Cc: yuancan@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 64ff18911878, struct csc_coef_rgb2yuv is not used any more
and can be removed as well.

Fixes: 64ff18911878 ("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for planes")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
changes in v2:
- adjust commit msg
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 0ee344ebcd1c..aacad5045e95 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -855,11 +855,6 @@ struct csc_coef_yuv2rgb {
 	bool full_range;
 };
 
-struct csc_coef_rgb2yuv {
-	int yr, yg, yb, cbr, cbg, cbb, crr, crg, crb;
-	bool full_range;
-};
-
 static void dispc_ovl_write_color_conv_coef(struct dispc_device *dispc,
 					    enum omap_plane_id plane,
 					    const struct csc_coef_yuv2rgb *ct)
-- 
2.17.1

