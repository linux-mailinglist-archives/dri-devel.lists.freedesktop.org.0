Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50525EE002
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 17:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28A10E9ED;
	Wed, 28 Sep 2022 15:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1171 seconds by postgrey-1.36 at gabe;
 Wed, 28 Sep 2022 15:20:35 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194E910E9ED
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 15:20:34 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Md0240j6Sz1P6mn;
 Wed, 28 Sep 2022 22:56:44 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 23:01:00 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <deller@gmx.de>, <javierm@redhat.com>, <tzimmermann@suse.de>,
 <maxime@cerno.tech>, <zengheng4@huawei.com>
Subject: [PATCH -next] video: fbdev: add missing MODULE_DEVICE_TABLE
Date: Wed, 28 Sep 2022 23:17:10 +0800
Message-ID: <20220928151710.1951969-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
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
Cc: linux-fbdev@vger.kernel.org, liwei391@huawei.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds missing MODULE_DEVICE_TABLE definition
which generates correct modalias for automatic loading
of this driver when it is built as an external module.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/video/fbdev/vga16fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 35cf51ae3292..af47f8217095 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1421,6 +1421,7 @@ static const struct platform_device_id vga16fb_driver_id_table[] = {
 	{"vga-framebuffer", 0},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, vga16fb_driver_id_table);
 
 static struct platform_driver vga16fb_driver = {
 	.probe = vga16fb_probe,
-- 
2.25.1

