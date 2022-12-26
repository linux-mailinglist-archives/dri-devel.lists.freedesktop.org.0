Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E06563ED
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DD610E251;
	Mon, 26 Dec 2022 15:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1863610E244;
 Mon, 26 Dec 2022 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wCkwnKyVnNlCcwUvRlGs3jpInf3FOmDQ9chM1+XfHRE=; b=CihnBgoSU/lhybzAyjyfMUYuIP
 d0XYdA+KE4xCmNGRHqewaHvsWodIavMknXgYMij3uFQAk7Vo9c8OZYLPsfVKz586SRGUgwAToAVaA
 U+T1BU5kTepqpU4hNtVzjTgk4l65quJp2xbLJhBrgw5IDif8lMny0febZfqmzg4y0LFQ0wWgi+FKf
 IQfgw1N3rwwBI2d7avG/mUNad9rxhglgvHXHboCi6gRbpLYgPS6J2QBY4vSw8fwQJK1/MUC0sX1MQ
 C5nC8sgwuonKoYSondKk9N+LFHGh26q/R2GWTD3OXOciQZWu/CmfcW9d15OcA/I00S3W/OeSQGs09
 nxS7cUHA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9pmX-00AXBr-2P; Mon, 26 Dec 2022 16:52:53 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] drm/qxl: remove unused debugfs structure
Date: Mon, 26 Dec 2022 12:50:28 -0300
Message-Id: <20221226155029.244355-9-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221226155029.244355-1-mcanal@igalia.com>
References: <20221226155029.244355-1-mcanal@igalia.com>
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
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Liviu Dudau <liviu.dudau@arm.com>, etnaviv@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current debugfs structure was introduced at f64122c1f6ad and it was
never used by the driver. Considering the addition of more
device-centered functions to the DRM core, remove the current debugfs
structure.

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
2.38.1

