Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF8BDE9A3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7210E7C8;
	Wed, 15 Oct 2025 13:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p1QOIc4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44C210E7BC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760533278;
 bh=6fiTcDrmtcfUFUMhD9UST8RpN/ZT9xdN/eKH+YnvTNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p1QOIc4v1l2+WnzOY46tkn5UvSMPHBhZckd3NOjMSZyr/G1dzXpa5xHSwBUye4GZ+
 hTl0XtI0KTTk0N2WdBNtmcCaGsLX/zpqtxru4KAYYkRmrCROVkTIvA7DmUDDXv4C0G
 05b86pIRQmIhaqi881twioSrwq7pqALoUvlBW+M3YzMkNXQY+nwETey61Pm6A3skfP
 3nh7TPj+u8SqNSMPbNo05bmNAzStgMH9oLcXxtDrvy2JlyxF50LWB9K0D+2oTWn198
 dKKAPzgjl3ZeHBbv2HIEpg3gw+HN54S8UGUlPkn0zD0AWaqu6jd6qeu4PHjgz06ERb
 yMsM4+dcsV67g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BA3F17E14DD;
 Wed, 15 Oct 2025 15:01:18 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 09/14] drm/panthor: Bump the driver version to 1.6
Date: Wed, 15 Oct 2025 15:00:58 +0200
Message-ID: <20251015130103.3634560-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015130103.3634560-1-boris.brezillon@collabora.com>
References: <20251015130103.3634560-1-boris.brezillon@collabora.com>
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index d2c321404a75..9d626ce66ad7 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1675,6 +1675,10 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - adds DRM_PANTHOR_BO_WB_MMAP flag
+ *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
+ *       - adds DRM_IOCTL_PANTHOR_BO_QUERY_INFO ioctl
+ *       - adds drm_panthor_gpu_info::selected_coherency
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1688,7 +1692,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.51.0

