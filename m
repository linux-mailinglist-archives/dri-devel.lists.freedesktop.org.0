Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638D3BDE997
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD410E7C9;
	Wed, 15 Oct 2025 13:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WdBss+yF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601B10E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760533281;
 bh=SXObLk9ZV4Gvsj90HTb1QaUCUxdna/rFwkU2KJXTF2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WdBss+yFN6ghfSZe5ux9sUePebna6d9xc0aq4qZgPc2tCjUZUWdfBwM7AOyYeP7iK
 /o5XGwv/Rs10+UsHeapA5eQDTPcdbOptRfwfCKLREkGne9eu265TQ+y11RUd5y2iK+
 B60xyDlN/nR8FD0ktllW9t3pY2sIvQ/iNaaTkvNw923TqLk2df+70DXig/4JxXbmuz
 MRXPN6YjiaqH4SDuaMuwrMcb+9pPZEbg9kq1xm8+GptT9iBI3NCldAl1/Z2WDyld9c
 WQdFZUaDb82juT4aeGoJ+EkwTehYb1YaKIz3KqTbg8J8JC8M1WUd+6YAyRn+PnYtu7
 cYOEm/32ryOWw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CA3E717E13A5;
 Wed, 15 Oct 2025 15:01:20 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 14/14] drm/panfrost: Bump the driver version to 1.6
Date: Wed, 15 Oct 2025 15:01:03 +0200
Message-ID: <20251015130103.3634560-15-boris.brezillon@collabora.com>
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f51b1dc1abc..9316daa91543 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -934,6 +934,9 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
  * - 1.4 - adds SET_LABEL_BO
  * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
  *	   context creation with configurable priorities/affinity
+ * - 1.6 - adds PANFROST_BO_MAP_WB, PANFROST_IOCTL_SYNC_BO,
+ *	   PANFROST_IOCTL_QUERY_BO_INFO and
+ *	   DRM_PANFROST_PARAM_SELECTED_COHERENCY
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -946,7 +949,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
 	.major			= 1,
-	.minor			= 5,
+	.minor			= 6,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
-- 
2.51.0

