Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993E790D0A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAA210E0F9;
	Sun,  3 Sep 2023 17:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF1B10E0DB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:08:48 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A739766071FD;
 Sun,  3 Sep 2023 18:08:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693760927;
 bh=a3Jl5T1JBxJ69b0aFO2DL1kTq5IjHG08e/SOb/CCWQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iZbRYAMPFji3mJWz1xKN7F+VJe2LDEWD4DEbTdt4DyOx3DfcI3i2NnlpS0NEafN58
 720DGnQrzexbAHwpfRcNiw7lORE6UB0nRDLaHxpO78QMiJXg3U1MmGkshwneX5Yxc9
 I3C8h+37do6fYmDtF67pdOs7E0JE/dGPRFybf4oCdjS442aH8o13rqX0ghcwidSI3u
 5uYLu24KKLB7CfTOAqQhHa29skfVpbfUgOE/M1rXOa31Y3pQaWlTKeYwjZXj7RjgYG
 eqbXu8PwUFBglEImOUFz3aEys1AD+d5EHG5S0ZDV0gpadYXIQktCZU5MSPAQ8FnwDj
 heOCinEXA5kUA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v16 07/20] drm/shmem-helper: Make all exported symbols GPL
Date: Sun,  3 Sep 2023 20:07:23 +0300
Message-ID: <20230903170736.513347-8-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make all drm-shmem exported symbols GPL to make them consistent with
the rest of drm-shmem symbols.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 848435e08eb2..5c777adf1bcb 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -228,7 +228,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_put_pages);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
 
 static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -273,7 +273,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_shmem_pin);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_pin);
 
 /**
  * drm_gem_shmem_unpin - Unpin backing pages for a shmem GEM object
@@ -292,7 +292,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 	drm_gem_shmem_unpin_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 }
-EXPORT_SYMBOL(drm_gem_shmem_unpin);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
 
 /*
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
@@ -362,7 +362,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_shmem_vmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap);
 
 /*
  * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
@@ -398,7 +398,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 
 	shmem->vaddr = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_vunmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap);
 
 static int
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
@@ -437,7 +437,7 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 
 	return (madv >= 0);
 }
-EXPORT_SYMBOL(drm_gem_shmem_madvise);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
 
 void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
@@ -469,7 +469,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
 }
-EXPORT_SYMBOL(drm_gem_shmem_purge);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
 
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
@@ -644,7 +644,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
-EXPORT_SYMBOL(drm_gem_shmem_print_info);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
 
 /**
  * drm_gem_shmem_get_sg_table - Provide a scatter/gather table of pinned
-- 
2.41.0

