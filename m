Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE777BAE2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4F510E0B1;
	Mon, 14 Aug 2023 14:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6291510E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 14:05:18 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RPbjS54rNzrSMF;
 Mon, 14 Aug 2023 22:03:56 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 14 Aug
 2023 22:05:15 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <deller@gmx.de>, <yuehaibing@huawei.com>
Subject: [PATCH -next] video: fbdev: kyro: Remove unused declarations
Date: Mon, 14 Aug 2023 22:05:10 +0800
Message-ID: <20230814140510.42408-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These declarations is never implemented since the beginning of git history.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 include/video/kyro.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/video/kyro.h b/include/video/kyro.h
index b958c2e9c915..418eef6c5523 100644
--- a/include/video/kyro.h
+++ b/include/video/kyro.h
@@ -38,18 +38,6 @@ struct kyrofb_info {
 	int wc_cookie;
 };
 
-extern int kyro_dev_init(void);
-extern void kyro_dev_reset(void);
-
-extern unsigned char *kyro_dev_physical_fb_ptr(void);
-extern unsigned char *kyro_dev_virtual_fb_ptr(void);
-extern void *kyro_dev_physical_regs_ptr(void);
-extern void *kyro_dev_virtual_regs_ptr(void);
-extern unsigned int kyro_dev_fb_size(void);
-extern unsigned int kyro_dev_regs_size(void);
-
-extern u32 kyro_dev_overlay_offset(void);
-
 /*
  * benedict.gaster@superh.com
  * Added the follow IOCTLS for the creation of overlay services...
-- 
2.34.1

