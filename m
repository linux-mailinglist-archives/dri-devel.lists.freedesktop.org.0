Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AEBA6CCAD
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF9110E18A;
	Sat, 22 Mar 2025 21:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="XX1OXok4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517510E18A
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678961; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OpEbS8G9gvCiSuf6FMNzU1NhcNS67IfkUCfl8COpJRyE1LFPl2VGyAIFnAo+F8uqVUcW6fSvltqO5cBGPuDssV2wI0z6AT3x5kZ5wdyIUDtLSjCFFYaaGwLn+Sfpi3GaWYGJrTTLjbXvwG2h+sF/4KvqFbB6LNBzmIwqabVW7Jw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678961;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=eEUouV2acFUuLu+TzNveWrlkZ7fzrOon+eQdIQR+dqo=; 
 b=eArLIXI3dJgdZU4IdcfeIH0CKBFAP6wXiXPYJZTVqs3D1CdQs2IV6h1eb22x1hc7c44gzmPiU/kzUQ1s5Kzv59gXj+vCwhrSqVJH4ntlx4r60LwKBx3ASsK+RJwWqRCIvaURZWsIv/rwRdBEQ7IR03Zao2+IxFUsEg5E5JYC0EU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678961; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=eEUouV2acFUuLu+TzNveWrlkZ7fzrOon+eQdIQR+dqo=;
 b=XX1OXok44GcbZ+ZUwiZt84HVWMqXcsbG5MuTW4OBatIYYDzZCDKB2EpqALFqn654
 rFoxmNZ5stRMnn5I0wxqpHqrF35M+Zhssky4BKn8s7p6No+ZOoarWh/igIAjWmPSCT7
 /PiNhBu3+2eKwwCtYpt0CQC+oJUbArH0MkaUo8gQ=
Received: by mx.zohomail.com with SMTPS id 1742678960850190.5623409219578;
 Sat, 22 Mar 2025 14:29:20 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 04/10] drm/shmem-helper: Make all exported symbols GPL
Date: Sun, 23 Mar 2025 00:26:02 +0300
Message-ID: <20250322212608.40511-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Make all drm-shmem exported symbols GPL to make them consistent with
the rest of drm-shmem symbols.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d99dee67353a..98c68999d61a 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -247,7 +247,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_put_pages);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
 
 int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -296,7 +296,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_shmem_pin);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_pin);
 
 /**
  * drm_gem_shmem_unpin - Unpin backing pages for a shmem GEM object
@@ -315,7 +315,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 	drm_gem_shmem_unpin_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
 }
-EXPORT_SYMBOL(drm_gem_shmem_unpin);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
 
 /*
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
@@ -385,7 +385,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_shmem_vmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap);
 
 /*
  * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
@@ -421,7 +421,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 
 	shmem->vaddr = NULL;
 }
-EXPORT_SYMBOL(drm_gem_shmem_vunmap);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap);
 
 static int
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
@@ -460,7 +460,7 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 
 	return (madv >= 0);
 }
-EXPORT_SYMBOL(drm_gem_shmem_madvise);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
 
 void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
@@ -492,7 +492,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
 }
-EXPORT_SYMBOL(drm_gem_shmem_purge);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
 
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
@@ -670,7 +670,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
-EXPORT_SYMBOL(drm_gem_shmem_print_info);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
 
 /**
  * drm_gem_shmem_get_sg_table - Provide a scatter/gather table of pinned
-- 
2.49.0

