Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E5336EC8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4CD6EB66;
	Thu, 11 Mar 2021 09:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8916EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:48 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CA4111F46010;
 Thu, 11 Mar 2021 09:25:46 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 7/7] drm/panfrost: Bump minor version to reflect the
 feature additions
Date: Thu, 11 Mar 2021 10:25:39 +0100
Message-Id: <20210311092539.2405596-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311092539.2405596-1-boris.brezillon@collabora.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We now have a new ioctl that allows submitting multiple jobs at once
(among other things) and we support timelined syncobjs. Bump the
minor version number to reflect those changes.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b3cc6fecb18d..7fb9b20ba27f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -855,6 +855,7 @@ DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
  * Panfrost driver version:
  * - 1.0 - initial interface
  * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
+ * - 1.2 - adds BATCH_SUBMIT ioctl and SYNCOBJ_TIMELINE feature
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -868,7 +869,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.desc			= "panfrost DRM",
 	.date			= "20180908",
 	.major			= 1,
-	.minor			= 1,
+	.minor			= 2,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
