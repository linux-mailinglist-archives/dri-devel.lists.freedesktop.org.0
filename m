Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B8CACCE7
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457E510E420;
	Mon,  8 Dec 2025 10:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JUoLvpaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62D810E413
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188535;
 bh=5/dccKoTNhJGpxMGVF+rsEpYXdKVHFCsr7UWYiuxxiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JUoLvpaYs4/63uJ6RVczvBcJ8LWMSQR/qdhnVIvlYGexvvdo8GTKpYRGOZODUqCr0
 R1UKQ3sS8/1jHUbZxfAEfK7oDK04WybE7UUFzGjdNnoXGf09JDzNAyIN/ahGSsG1MF
 o0wZtAIftEpqQI8keQdyHVS8UH28Qqav+I/uxuI7TowT4WaQAn6f09lcsab/K0YU/C
 TZhF0CYrhOSpmXnESHEFD3dpYs/aBtcjO/JLVWhqZV/8PLHhCl/Wp2pmk8UcNGTK/1
 qs6D7IOwHgE5ZA7PKiAqtTnbZGHF7ioGplNiKAXPN8+v2fUxJO1dZ7nhlVMIEWZeBH
 LZ2NJhYkyMiyA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 21EB717E361C;
 Mon,  8 Dec 2025 11:08:55 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v8 07/13] drm/panthor: Bump the driver version to 1.7
Date: Mon,  8 Dec 2025 11:08:34 +0100
Message-ID: <20251208100841.730527-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208100841.730527-1-boris.brezillon@collabora.com>
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Faith Ekstrand <faith.ekstrand@collabora.com>

Bump the driver version to reflect the new cached-CPU mapping
capability.

v2:
- Quickly describe what the new version exposes in the commit message

v3:
- Add Steve's R-b

v4:
- No changes

v5:
- No changes

v6:
- No changes

v7:
- No changes

v8:
- Bump to 1.7 (1.6 was picked in the meantime)

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 2d726e4cc66f..cc4153d51414 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1673,6 +1673,10 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
  * - 1.6 - enables GLB_COUNTER_EN
+ * - 1.7 - adds DRM_PANTHOR_BO_WB_MMAP flag
+ *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
+ *       - adds DRM_IOCTL_PANTHOR_BO_QUERY_INFO ioctl
+ *       - adds drm_panthor_gpu_info::selected_coherency
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1686,7 +1690,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 6,
+	.minor = 7,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.51.1

