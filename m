Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC176E12A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D12110E5A1;
	Thu,  3 Aug 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262510E22E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 02:26:18 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGXJy3Q5KzNmk9;
 Thu,  3 Aug 2023 10:06:42 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 10:10:08 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <daniel@ffwll.ch>, <deller@gmx.de>
Subject: [PATCH] fbcon: Make fbcon_registered_fb and fbcon_num_registered_fb
 static
Date: Thu, 3 Aug 2023 10:09:39 +0800
Message-ID: <20230803020939.491-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 03 Aug 2023 07:21:52 +0000
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbcon_registered_fb and fbcon_num_registered_fb is not referred outside
drivers/video/fbdev/core/fbcon.c, so make them static.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/video/fbdev/core/fbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 887fad44e7ec..976900d6893c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -102,8 +102,8 @@ enum {
 
 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 
-struct fb_info *fbcon_registered_fb[FB_MAX];
-int fbcon_num_registered_fb;
+static struct fb_info *fbcon_registered_fb[FB_MAX];
+static int fbcon_num_registered_fb;
 
 #define fbcon_for_each_registered_fb(i)		\
 	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
-- 
2.17.1

