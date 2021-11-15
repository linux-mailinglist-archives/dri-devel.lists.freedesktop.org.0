Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4B4504BF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99A6ED24;
	Mon, 15 Nov 2021 12:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624616EC2A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:55:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF8871FD69;
 Mon, 15 Nov 2021 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636980943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=My+lMTyOWKKTjo1fpBjGFGPy0C5ADlNnDiIH0zhKjLQ=;
 b=Ku+75HPSOHzZcZb7C0UmXAvvjdOffgq25dTZOuaeyYGYWXDfip5k+s2yDbdlYP7wv18rQa
 X5lLVg59gzThS/XXC+FFkSYKxmCpDfILemxCIBvsH91F0yDD5PH1KiedgZH2vqS6S3eBQf
 Nrg6k+aEGpUrvlfcA8xQOT9cyVMTSBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636980943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=My+lMTyOWKKTjo1fpBjGFGPy0C5ADlNnDiIH0zhKjLQ=;
 b=um6n//lVBQzjfrA81MGDNOk0bHAplRRORVhBDp2ZbyzhOrFjfF3h57joLRM3lQ62oFmm5d
 mrNvOHQ7/28zWaBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A0E313E6D;
 Mon, 15 Nov 2021 12:55:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gA3UIM9YkmEFcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Nov 2021 12:55:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, christian.koenig@amd.com,
 ray.huang@amd.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm: Declare hashtable as legacy
Date: Mon, 15 Nov 2021 13:55:39 +0100
Message-Id: <20211115125539.1730-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115125539.1730-1-tzimmermann@suse.de>
References: <20211115125539.1730-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM hashtable code is only used by internal functions for legacy
UMS drivers. Move the implementation behind CONFIG_DRM_LEGACY and the
declarations into legacy header files. Unexport the symbols.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile      |  6 +--
 drivers/gpu/drm/drm_hashtab.c | 10 +----
 drivers/gpu/drm/drm_legacy.h  | 40 +++++++++++++++++-
 include/drm/drm_device.h      |  5 +--
 include/drm/drm_hashtab.h     | 79 -----------------------------------
 include/drm/drm_legacy.h      | 15 ++++++-
 6 files changed, 59 insertions(+), 96 deletions(-)
 delete mode 100644 include/drm/drm_hashtab.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1c41156deb5f..bc5f0db63cba 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -6,7 +6,7 @@
 drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_file.o drm_gem.o drm_ioctl.o \
 		drm_drv.o \
-		drm_sysfs.o drm_hashtab.o drm_mm.o \
+		drm_sysfs.o drm_mm.o \
 		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
 		drm_trace_points.o drm_prime.o \
 		drm_vma_manager.o \
@@ -20,8 +20,8 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_managed.o drm_vblank_work.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
-			    drm_irq.o drm_legacy_misc.o drm_lock.o drm_memory.o \
-			    drm_scatter.o drm_vm.o
+			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
+			    drm_memory.o drm_scatter.o drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
index c50fa6f0709f..60afa1865559 100644
--- a/drivers/gpu/drm/drm_hashtab.c
+++ b/drivers/gpu/drm/drm_hashtab.c
@@ -32,16 +32,16 @@
  * Thomas Hellström <thomas-at-tungstengraphics-dot-com>
  */
 
-#include <linux/export.h>
 #include <linux/hash.h>
 #include <linux/mm.h>
 #include <linux/rculist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-#include <drm/drm_hashtab.h>
 #include <drm/drm_print.h>
 
+#include "drm_legacy.h"
+
 int drm_ht_create(struct drm_open_hash *ht, unsigned int order)
 {
 	unsigned int size = 1 << order;
@@ -58,7 +58,6 @@ int drm_ht_create(struct drm_open_hash *ht, unsigned int order)
 	}
 	return 0;
 }
-EXPORT_SYMBOL(drm_ht_create);
 
 void drm_ht_verbose_list(struct drm_open_hash *ht, unsigned long key)
 {
@@ -135,7 +134,6 @@ int drm_ht_insert_item(struct drm_open_hash *ht, struct drm_hash_item *item)
 	}
 	return 0;
 }
-EXPORT_SYMBOL(drm_ht_insert_item);
 
 /*
  * Just insert an item and return any "bits" bit key that hasn't been
@@ -164,7 +162,6 @@ int drm_ht_just_insert_please(struct drm_open_hash *ht, struct drm_hash_item *it
 	}
 	return 0;
 }
-EXPORT_SYMBOL(drm_ht_just_insert_please);
 
 int drm_ht_find_item(struct drm_open_hash *ht, unsigned long key,
 		     struct drm_hash_item **item)
@@ -178,7 +175,6 @@ int drm_ht_find_item(struct drm_open_hash *ht, unsigned long key,
 	*item = hlist_entry(list, struct drm_hash_item, head);
 	return 0;
 }
-EXPORT_SYMBOL(drm_ht_find_item);
 
 int drm_ht_remove_key(struct drm_open_hash *ht, unsigned long key)
 {
@@ -197,7 +193,6 @@ int drm_ht_remove_item(struct drm_open_hash *ht, struct drm_hash_item *item)
 	hlist_del_init_rcu(&item->head);
 	return 0;
 }
-EXPORT_SYMBOL(drm_ht_remove_item);
 
 void drm_ht_remove(struct drm_open_hash *ht)
 {
@@ -206,4 +201,3 @@ void drm_ht_remove(struct drm_open_hash *ht)
 		ht->table = NULL;
 	}
 }
-EXPORT_SYMBOL(drm_ht_remove);
diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index c9206840c87f..70c9dba114a6 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -35,9 +35,47 @@
 #include <drm/drm_legacy.h>
 
 struct agp_memory;
+struct drm_buf_desc;
 struct drm_device;
 struct drm_file;
-struct drm_buf_desc;
+struct drm_hash_item;
+struct drm_open_hash;
+
+/*
+ * Hash-table Support
+ */
+
+#define drm_hash_entry(_ptr, _type, _member) container_of(_ptr, _type, _member)
+
+/* drm_hashtab.c */
+#if IS_ENABLED(CONFIG_DRM_LEGACY)
+int drm_ht_create(struct drm_open_hash *ht, unsigned int order);
+int drm_ht_insert_item(struct drm_open_hash *ht, struct drm_hash_item *item);
+int drm_ht_just_insert_please(struct drm_open_hash *ht, struct drm_hash_item *item,
+			      unsigned long seed, int bits, int shift,
+			      unsigned long add);
+int drm_ht_find_item(struct drm_open_hash *ht, unsigned long key, struct drm_hash_item **item);
+
+void drm_ht_verbose_list(struct drm_open_hash *ht, unsigned long key);
+int drm_ht_remove_key(struct drm_open_hash *ht, unsigned long key);
+int drm_ht_remove_item(struct drm_open_hash *ht, struct drm_hash_item *item);
+void drm_ht_remove(struct drm_open_hash *ht);
+#endif
+
+/*
+ * RCU-safe interface
+ *
+ * The user of this API needs to make sure that two or more instances of the
+ * hash table manipulation functions are never run simultaneously.
+ * The lookup function drm_ht_find_item_rcu may, however, run simultaneously
+ * with any of the manipulation functions as long as it's called from within
+ * an RCU read-locked section.
+ */
+#define drm_ht_insert_item_rcu drm_ht_insert_item
+#define drm_ht_just_insert_please_rcu drm_ht_just_insert_please
+#define drm_ht_remove_key_rcu drm_ht_remove_key
+#define drm_ht_remove_item_rcu drm_ht_remove_item
+#define drm_ht_find_item_rcu drm_ht_find_item
 
 /*
  * Generic DRM Contexts
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 604b1d1b2d72..9923c7a6885e 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -6,16 +6,13 @@
 #include <linux/mutex.h>
 #include <linux/idr.h>
 
-#include <drm/drm_hashtab.h>
+#include <drm/drm_legacy.h>
 #include <drm/drm_mode_config.h>
 
 struct drm_driver;
 struct drm_minor;
 struct drm_master;
-struct drm_device_dma;
 struct drm_vblank_crtc;
-struct drm_sg_mem;
-struct drm_local_map;
 struct drm_vma_offset_manager;
 struct drm_vram_mm;
 struct drm_fb_helper;
diff --git a/include/drm/drm_hashtab.h b/include/drm/drm_hashtab.h
deleted file mode 100644
index bb95ff011baf..000000000000
--- a/include/drm/drm_hashtab.h
+++ /dev/null
@@ -1,79 +0,0 @@
-/**************************************************************************
- *
- * Copyright 2006 Tungsten Graphics, Inc., Bismack, ND. USA.
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- *
- **************************************************************************/
-/*
- * Simple open hash tab implementation.
- *
- * Authors:
- * Thomas Hellström <thomas-at-tungstengraphics-dot-com>
- */
-
-#ifndef DRM_HASHTAB_H
-#define DRM_HASHTAB_H
-
-#include <linux/list.h>
-
-#define drm_hash_entry(_ptr, _type, _member) container_of(_ptr, _type, _member)
-
-struct drm_hash_item {
-	struct hlist_node head;
-	unsigned long key;
-};
-
-struct drm_open_hash {
-	struct hlist_head *table;
-	u8 order;
-};
-
-int drm_ht_create(struct drm_open_hash *ht, unsigned int order);
-int drm_ht_insert_item(struct drm_open_hash *ht, struct drm_hash_item *item);
-int drm_ht_just_insert_please(struct drm_open_hash *ht, struct drm_hash_item *item,
-			      unsigned long seed, int bits, int shift,
-			      unsigned long add);
-int drm_ht_find_item(struct drm_open_hash *ht, unsigned long key, struct drm_hash_item **item);
-
-void drm_ht_verbose_list(struct drm_open_hash *ht, unsigned long key);
-int drm_ht_remove_key(struct drm_open_hash *ht, unsigned long key);
-int drm_ht_remove_item(struct drm_open_hash *ht, struct drm_hash_item *item);
-void drm_ht_remove(struct drm_open_hash *ht);
-
-/*
- * RCU-safe interface
- *
- * The user of this API needs to make sure that two or more instances of the
- * hash table manipulation functions are never run simultaneously.
- * The lookup function drm_ht_find_item_rcu may, however, run simultaneously
- * with any of the manipulation functions as long as it's called from within
- * an RCU read-locked section.
- */
-#define drm_ht_insert_item_rcu drm_ht_insert_item
-#define drm_ht_just_insert_please_rcu drm_ht_just_insert_please
-#define drm_ht_remove_key_rcu drm_ht_remove_key
-#define drm_ht_remove_item_rcu drm_ht_remove_item
-#define drm_ht_find_item_rcu drm_ht_find_item
-
-#endif
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index 58dc8d8cc907..0fc85418aad8 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -37,7 +37,6 @@
 
 #include <drm/drm.h>
 #include <drm/drm_auth.h>
-#include <drm/drm_hashtab.h>
 
 struct drm_device;
 struct drm_driver;
@@ -51,6 +50,20 @@ struct pci_driver;
  * you're doing it terribly wrong.
  */
 
+/*
+ * Hash-table Support
+ */
+
+struct drm_hash_item {
+	struct hlist_node head;
+	unsigned long key;
+};
+
+struct drm_open_hash {
+	struct hlist_head *table;
+	u8 order;
+};
+
 /**
  * DMA buffer.
  */
-- 
2.33.1

