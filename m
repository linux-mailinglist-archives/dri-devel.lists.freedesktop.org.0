Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758566624DE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF7B10E3F7;
	Mon,  9 Jan 2023 11:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930C510E3F5;
 Mon,  9 Jan 2023 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V2Sga8W8H54grHYU1BZudixfV9fBRbe1j67/AT8fq7g=; b=Pt14+87EfHwxIH7IcP38Lua8rp
 1JQnsZIvA5TMNFchtpINI0xBmoDgmD13yrpJmP3CIN4JwyNTsjMAvZ8mjrvPirrccIpKrfaW7Qs9a
 so88dwuw/NoUW1lGc9d/hTL7M1k1JwK1E4rM8Wi86AXtlQpv0wvIP4fPOSfsVfuSLyYwOOB4kL0LN
 ZHoRr0R80L7khbVqUdzqQOGvzumxQWIsa0JmtZsaIIsqvUrYSX6GqGWz0vo/gs61r4wZy/3pb3fpO
 n9uN3nmVzw3J2M4FiMeLyJY+WcAdB1uvSgqXhcrOmomcYfrkYE453P2TBEMDHMBsRkm3eU3H8rLYM
 PUELLu5g==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEqm2-003LkJ-Gj; Mon, 09 Jan 2023 12:57:07 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Emma Anholt <emma@anholt.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 6/7] drm/qxl: remove unused debugfs structure
Date: Mon,  9 Jan 2023 08:55:20 -0300
Message-Id: <20230109115520.40088-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109115520.40088-1-mcanal@igalia.com>
References: <20230109115520.40088-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current debugfs structure was introduced at commit f64122c1f6ad
("drm: add new QXL driver. (v1.4)") and it was never used by the driver.
Considering the addition of more device-centered functions to the DRM core,
remove the current debugfs structure.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 29 -----------------------------
 drivers/gpu/drm/qxl/qxl_drv.h     | 20 --------------------
 2 files changed, 49 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..bdfce1a8f006 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -95,32 +95,3 @@ qxl_debugfs_init(struct drm_minor *minor)
 	qxl_ttm_debugfs_init(dev);
 #endif
 }
-
-void qxl_debugfs_add_files(struct qxl_device *qdev,
-			   struct drm_info_list *files,
-			   unsigned int nfiles)
-{
-	unsigned int i;
-
-	for (i = 0; i < qdev->debugfs_count; i++) {
-		if (qdev->debugfs[i].files == files) {
-			/* Already registered */
-			return;
-		}
-	}
-
-	i = qdev->debugfs_count + 1;
-	if (i > QXL_DEBUGFS_MAX_COMPONENTS) {
-		DRM_ERROR("Reached maximum number of debugfs components.\n");
-		DRM_ERROR("Report so we increase QXL_DEBUGFS_MAX_COMPONENTS.\n");
-		return;
-	}
-	qdev->debugfs[qdev->debugfs_count].files = files;
-	qdev->debugfs[qdev->debugfs_count].num_files = nfiles;
-	qdev->debugfs_count = i;
-#if defined(CONFIG_DEBUG_FS)
-	drm_debugfs_create_files(files, nfiles,
-				 qdev->ddev.primary->debugfs_root,
-				 qdev->ddev.primary);
-#endif
-}
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index ea993d7162e8..0868d5d2a839 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -60,8 +60,6 @@ struct iosys_map;
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
-#define QXL_DEBUGFS_MAX_COMPONENTS		32
-
 extern int qxl_num_crtc;
 
 #define QXL_INTERRUPT_MASK (\
@@ -165,14 +163,6 @@ struct qxl_drm_image {
 	struct list_head chunk_list;
 };
 
-/*
- * Debugfs
- */
-struct qxl_debugfs {
-	struct drm_info_list	*files;
-	unsigned int num_files;
-};
-
 struct qxl_device {
 	struct drm_device ddev;
 
@@ -228,10 +218,6 @@ struct qxl_device {
 	wait_queue_head_t io_cmd_event;
 	struct work_struct client_monitors_config_work;
 
-	/* debugfs */
-	struct qxl_debugfs	debugfs[QXL_DEBUGFS_MAX_COMPONENTS];
-	unsigned int debugfs_count;
-
 	struct mutex		update_area_mutex;
 
 	struct idr	surf_id_idr;
@@ -256,8 +242,6 @@ struct qxl_device {
 
 #define to_qxl(dev) container_of(dev, struct qxl_device, ddev)
 
-int qxl_debugfs_fence_init(struct qxl_device *rdev);
-
 int qxl_device_init(struct qxl_device *qdev, struct pci_dev *pdev);
 void qxl_device_fini(struct qxl_device *qdev);
 
@@ -430,10 +414,6 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
 
-void qxl_debugfs_add_files(struct qxl_device *qdev,
-			   struct drm_info_list *files,
-			   unsigned int nfiles);
-
 int qxl_surface_id_alloc(struct qxl_device *qdev,
 			 struct qxl_bo *surf);
 void qxl_surface_id_dealloc(struct qxl_device *qdev,
-- 
2.39.0

