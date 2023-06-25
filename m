Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E373CE85
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 07:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4AB10E147;
	Sun, 25 Jun 2023 05:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32C3810E105;
 Sun, 25 Jun 2023 05:09:02 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxlfDty5dk628BAA--.2239S3;
 Sun, 25 Jun 2023 13:09:01 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxxszty5dk80sGAA--.8429S2; 
 Sun, 25 Jun 2023 13:09:01 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH] drm: Remove the deprecated drm_put_dev() function
Date: Sun, 25 Jun 2023 13:09:01 +0800
Message-Id: <20230625050901.393055-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxxszty5dk80sGAA--.8429S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZryfCw1xGrWDGF17uF4rZwc_yoW5CF1rpF
 43JasakrW8tFZ8K3yUAFnrCFy5Ja17GayI9ryUG3sxWr4qvry7AF98JFyUJ345XrWkCF1a
 v3ZxXFyUZFy0krcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
 AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0Urc3UUUUU==
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As this function can be replaced with drm_dev_unregister() + drm_dev_put(),
it is already marked as deprecated, so remove it. No functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/drm_drv.c           | 28 ----------------------------
 drivers/gpu/drm/drm_pci.c           |  3 ++-
 drivers/gpu/drm/radeon/radeon_drv.c |  3 ++-
 include/drm/drm_drv.h               |  1 -
 4 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 12687dd9e1ac..5057307fe22a 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -406,34 +406,6 @@ void drm_minor_release(struct drm_minor *minor)
  * possibly leaving the hardware enabled.
  */
 
-/**
- * drm_put_dev - Unregister and release a DRM device
- * @dev: DRM device
- *
- * Called at module unload time or when a PCI device is unplugged.
- *
- * Cleans up all DRM device, calling drm_lastclose().
- *
- * Note: Use of this function is deprecated. It will eventually go away
- * completely.  Please use drm_dev_unregister() and drm_dev_put() explicitly
- * instead to make sure that the device isn't userspace accessible any more
- * while teardown is in progress, ensuring that userspace can't access an
- * inconsistent state.
- */
-void drm_put_dev(struct drm_device *dev)
-{
-	DRM_DEBUG("\n");
-
-	if (!dev) {
-		DRM_ERROR("cleanup called no dev\n");
-		return;
-	}
-
-	drm_dev_unregister(dev);
-	drm_dev_put(dev);
-}
-EXPORT_SYMBOL(drm_put_dev);
-
 /**
  * drm_dev_enter - Enter device critical section
  * @dev: DRM device
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 39d35fc3a43b..b3a68a92eaa6 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -257,7 +257,8 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
 					 legacy_dev_list) {
 			if (dev->driver == driver) {
 				list_del(&dev->legacy_dev_list);
-				drm_put_dev(dev);
+				drm_dev_unregister(dev);
+				drm_dev_put(dev);
 			}
 		}
 		mutex_unlock(&legacy_dev_list_lock);
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index e4374814f0ef..a4955ae10659 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -357,7 +357,8 @@ radeon_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	drm_put_dev(dev);
+	drm_dev_unregister(dev);
+	drm_dev_put(dev);
 }
 
 static void
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 89e2706cac56..289c97b12e82 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -511,7 +511,6 @@ void drm_dev_unregister(struct drm_device *dev);
 
 void drm_dev_get(struct drm_device *dev);
 void drm_dev_put(struct drm_device *dev);
-void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
-- 
2.25.1

