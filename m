Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4FB88533
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86310E95D;
	Fri, 19 Sep 2025 08:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E85710E95D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:07:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4562169E;
 Fri, 19 Sep 2025 01:07:14 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC1E33F673;
 Fri, 19 Sep 2025 01:07:21 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: Bump the minor version number
Date: Fri, 19 Sep 2025 09:07:00 +0100
Message-Id: <20250919080700.3949393-1-steven.price@arm.com>
X-Mailer: git-send-email 2.39.5
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

Commit a017f7b86051 ("drm/panfrost: Expose JM context IOCTLs to UM")
added new ioctls to the driver and was meant to bump the version number.
However it actually only added a comment and didn't change the exposed
version number. Bump the number to be consistent with the comment.

Fixes: a017f7b86051 ("drm/panfrost: Expose JM context IOCTLs to UM")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 3af4b4753ca4..22350ce8a08f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -853,7 +853,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
 	.major			= 1,
-	.minor			= 4,
+	.minor			= 5,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
-- 
2.39.5

