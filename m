Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C1CC908E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EE610E8D2;
	Wed, 17 Dec 2025 17:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ExGZ+get";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32EE10E587;
 Wed, 17 Dec 2025 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765992247;
 bh=+PpC+4mgo85FzfqJLBbiUr6rR7AC9pRiqaqgBeRBpAU=;
 h=From:To:Cc:Subject:Date:From;
 b=ExGZ+getoiIFwkhtGNHVOrtgI9i8MiFxWP42OhDKr6HJPCA5wmaKYBqJBrzzYeFV1
 5FXwwJDPrpW6E8m+ByvTXWMnF/k55FCCFYxAE9UIyiHQA0TUrTXLLLA0AgG5MCjdo+
 5/MgpBfd16BvwS8sfFrQiqpVn0b1PZN/SSJ9t65hGM8NgoCBF1uSQqAArbe+TSlm3v
 pZI9Ljdlk+okzT6e8a1146jm+NVk/ln8FX54VB5JNAQlJgctiuY/XppXyhSRTPcBbI
 XYns2QsGiY+KjtLUQKtY6LNwbsS5JWyPhnlyWOmcbloxS9XPItEXZsQjE26LEYGISp
 6tQVMP3JurXsQ==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:2e0:4cff:fe03:d8c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2231917E127F;
 Wed, 17 Dec 2025 18:24:07 +0100 (CET)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Devel Mailing List <dri-devel@lists.freedesktop.org>,
 Intel Graphics Mailing List <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Collabora Kernel Mailing List <kernel@collabora.com>
Subject: [PATCH] drm/gem: Fix kerneldoc warnings
Date: Wed, 17 Dec 2025 18:24:04 +0100
Message-ID: <20251217172404.31216-1-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix incorrect parameters in drm_gem_shmem_init() and missing " *" on
empty lines in drm_gem_get_huge_mnt().

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
 include/drm/drm_gem.h                  | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 29174ab58ff3..fbd1164174b0 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -94,9 +94,12 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
 }
 
 /**
- * drm_gem_shmem_init - Initialize an allocated object.
+ * drm_gem_shmem_init - Initialize an allocated object of the given size
  * @dev: DRM device
- * @obj: The allocated shmem GEM object.
+ * @shmem: shmem GEM object to initialize
+ * @size: Size of the object to initialize
+ *
+ * This function initializes an allocated shmem GEM object.
  *
  * Returns:
  * 0 on success, or a negative error code on failure.
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index f4da8ed0d630..86f5846154f7 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -508,11 +508,11 @@ static inline int drm_gem_huge_mnt_create(struct drm_device *dev,
 /**
  * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM device
  * @dev: DRM device
-
+ *
  * This function gets the huge tmpfs mountpoint used by DRM device @dev. A huge
  * tmpfs mountpoint is used instead of `shm_mnt` after a successful call to
  * drm_gem_huge_mnt_create() when CONFIG_TRANSPARENT_HUGEPAGE is enabled.
-
+ *
  * Returns:
  * The huge tmpfs mountpoint in use, NULL otherwise.
  */
-- 
2.47.3

