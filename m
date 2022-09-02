Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A545AA621
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 05:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A8A10E4BC;
	Fri,  2 Sep 2022 03:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Fri, 02 Sep 2022 03:03:59 UTC
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB68410E337
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 03:03:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-03 (Coremail) with SMTP id rQCowADHzkq8cBFjs39uAA--.13267S2;
 Fri, 02 Sep 2022 10:55:56 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: deller@gmx.de, broonie@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel.vetter@ffwll.ch
Subject: [PATCH 1/2] video: fbdev: gbefb: Convert to use dev_groups
Date: Fri,  2 Sep 2022 10:55:55 +0800
Message-Id: <20220902025555.3833920-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADHzkq8cBFjs39uAA--.13267S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4xAF4kJrWkXFWxuw1rZwb_yoW8ur1fpa
 n5JFySgr4UG3WUGw47Cr4UWa45Ar1vva4rXryxKw4S9r15ZrW8Wa4kJa4UA3s5JFykW3Wj
 qr1Dtay8CF4qgF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
 6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbb18P
 UUUUU==
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: linux-fbdev@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver core supports the ability to handle the creation and removal
of device-specific sysfs files in a race-free manner. Moreover, it can
guarantee the success of creation. Therefore, it should be better to
convert to use dev_groups.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/video/fbdev/gbefb.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 6b4d5a7f3e15..1582c718329c 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1072,17 +1072,12 @@ static ssize_t gbefb_show_rev(struct device *device, struct device_attribute *at
 
 static DEVICE_ATTR(revision, S_IRUGO, gbefb_show_rev, NULL);
 
-static void gbefb_remove_sysfs(struct device *dev)
-{
-	device_remove_file(dev, &dev_attr_size);
-	device_remove_file(dev, &dev_attr_revision);
-}
-
-static void gbefb_create_sysfs(struct device *dev)
-{
-	device_create_file(dev, &dev_attr_size);
-	device_create_file(dev, &dev_attr_revision);
-}
+static struct attribute *gbefb_attrs[] = {
+	&dev_attr_size.attr,
+	&dev_attr_revision.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(gbefb);
 
 /*
  * Initialization
@@ -1221,7 +1216,6 @@ static int gbefb_probe(struct platform_device *p_dev)
 	}
 
 	platform_set_drvdata(p_dev, info);
-	gbefb_create_sysfs(&p_dev->dev);
 
 	fb_info(info, "%s rev %d @ 0x%08x using %dkB memory\n",
 		info->fix.id, gbe_revision, (unsigned)GBE_BASE,
@@ -1248,7 +1242,6 @@ static int gbefb_remove(struct platform_device* p_dev)
 	gbe_turn_off();
 	arch_phys_wc_del(par->wc_cookie);
 	release_mem_region(GBE_BASE, sizeof(struct sgi_gbe));
-	gbefb_remove_sysfs(&p_dev->dev);
 	framebuffer_release(info);
 
 	return 0;
@@ -1259,6 +1252,7 @@ static struct platform_driver gbefb_driver = {
 	.remove = gbefb_remove,
 	.driver	= {
 		.name = "gbefb",
+		.dev_groups	= gbefb_groups,
 	},
 };
 
-- 
2.25.1

