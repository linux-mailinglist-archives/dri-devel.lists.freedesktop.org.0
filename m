Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD4CACCEB
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F39110E41D;
	Mon,  8 Dec 2025 10:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i/GmQuIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C7C10E416
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188538;
 bh=/BIC6PGDg/BHfyWeQS/J3BsSKRq0yXypy/ms+KIAuM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/GmQuIwxRb5IPz7qac3hvDaIpZxbH1m8dI2D18/CdETKXcXg0Cd9qFjbZkIlHq88
 Obd38FHypP9qzAAorZJKmL0Bdl2JCb+DMpH3p2wjp57s+YghfqLKqLJ1FX+LjKnK5c
 uBxj/+pka9XpjdSx4WlxTCdBGSPF1rlkBjBh7a3RynHCLT0FbExcoCDw3E9OyV8R78
 Nz2Ojx14PGlXkb1pNKQHQP+lh8SgZTJpvrp4fUpQBOGzpRIs7KUyBD1nZlo7sRclUU
 C/JIexiQjhr3JWaQMbpjUXNwfarvUl0nA1PslCsvrG3PtAAau4NkWUdRV9fhZiRiiI
 Jet/fpdYQKjdA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4304517E15C9;
 Mon,  8 Dec 2025 11:08:58 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v8 13/13] drm/panfrost: Bump the driver version to 1.6
Date: Mon,  8 Dec 2025 11:08:40 +0100
Message-ID: <20251208100841.730527-14-boris.brezillon@collabora.com>
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
- No changes

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 43a453ee9614..712497729732 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -928,6 +928,9 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
  * - 1.4 - adds SET_LABEL_BO
  * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
  *	   context creation with configurable priorities/affinity
+ * - 1.6 - adds PANFROST_BO_MAP_WB, PANFROST_IOCTL_SYNC_BO,
+ *	   PANFROST_IOCTL_QUERY_BO_INFO and
+ *	   DRM_PANFROST_PARAM_SELECTED_COHERENCY
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -940,7 +943,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
 	.major			= 1,
-	.minor			= 5,
+	.minor			= 6,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import	= panfrost_gem_prime_import,
-- 
2.51.1

