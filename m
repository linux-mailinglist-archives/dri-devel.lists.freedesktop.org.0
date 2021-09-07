Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B84024CC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F0189D40;
	Tue,  7 Sep 2021 08:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566D7899D6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x6so13024056wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNO/Un7AYJOQK0Z7VeodoQ8LJ9oEV/MpaGgLDSBYFN8=;
 b=ns+hUVEAP7HEJhb0UVyvFvHkHMuOR6foGCIhWQU9EWB9tqfF1isftp8bFNaI1v5rhH
 VMVCKTjhK4NCyc+g23SS0q/5rEHZ733M51O6W79YYLMu37euB3l3fJdngAuTqGy53yM/
 mSSKqnRBLr6+h6Z+LdzFRFXDKx4Fmq7sD/ipI16CADuVd3cJu/+iG5tXYdAcO8dmRixe
 +74U32u+OJFcJSvHeqDEu412v2k97Ag8ujQIiwVRDSYphaAzcl0OnDsfXViE/E2ZfkKQ
 lTJVJqK2ZAwd3Tn9eus5BKD1jpLbbxA6LyCAK0GQYl6dz9tH3XDMSw7dn53cBBqcAmsN
 l3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNO/Un7AYJOQK0Z7VeodoQ8LJ9oEV/MpaGgLDSBYFN8=;
 b=it+ZqmYJQz4TmrC5cM0jHphjT1rHB4WvTIGEexCOG9w+m+9II9RQ316412kJkZkRZg
 syJmkvYWlubfFUS4ObEj4v+ebLdkPv98Tv2d5+1BH3H+xdpvIBSiroLRREGvV3kmffdE
 /neQm21CI//kum3meinV6VaiMnFXMe3Rn/QAmbz+I1kzVjzSFq+EiHldM/MnVGWyte48
 DhNah+yNCFmkwJVRx2V67vW3NAfvMOsYQLf/Ue7dorY2G1gCE21Dx+DMvExAxDyOSV3C
 He7imE9necvZ34bGvPuMEii4YT0a0RPz/ZlDdeFy3AYB7/1WkvOwv4k7fvKe3CcKLDA4
 Ll1g==
X-Gm-Message-State: AOAM5308eOSTZnmaQ28rT8ehPVTsWYB6h7w0qo8QIVUemGMc8yi8Q4Ge
 mDbH1jbaoHpZqKhuYxcicViGCvobPGn6JXoc
X-Google-Smtp-Source: ABdhPJzHrHaHv1rJVfmWCWzeFPC6jFrKXSatbnMD8YQWKGYQ6ILGvPBNrj/j7EP5tBj9uBcaiz+MsA==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr16784665wrr.332.1631001699837; 
 Tue, 07 Sep 2021 01:01:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 4/8] drm/ttm: enable TTM device object kerneldoc
Date: Tue,  7 Sep 2021 10:01:31 +0200
Message-Id: <20210907080135.101452-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907080135.101452-1-christian.koenig@amd.com>
References: <20210907080135.101452-1-christian.koenig@amd.com>
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

Fix the remaining warnings, switch to inline structure documentation
and finally enable this.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 Documentation/gpu/drm-mm.rst |  9 +++++
 include/drm/ttm/ttm_device.h | 73 +++++++++++++++++++++---------------
 2 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index f22c9f9a2c0e..3da81b7b4e71 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -34,6 +34,15 @@ The Translation Table Manager (TTM)
 .. kernel-doc:: include/drm/ttm/ttm_caching.h
    :internal:
 
+TTM device object reference
+---------------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_device.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 07d722950d5b..0b31ec731e66 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -39,31 +39,23 @@ struct ttm_operation_ctx;
 
 /**
  * struct ttm_global - Buffer object driver global data.
- *
- * @dummy_read_page: Pointer to a dummy page used for mapping requests
- * of unpopulated pages.
- * @shrink: A shrink callback object used for buffer object swap.
- * @device_list_mutex: Mutex protecting the device list.
- * This mutex is held while traversing the device list for pm options.
- * @lru_lock: Spinlock protecting the bo subsystem lru lists.
- * @device_list: List of buffer object devices.
- * @swap_lru: Lru list of buffer objects used for swapping.
  */
 extern struct ttm_global {
 
 	/**
-	 * Constant after init.
+	 * @dummy_read_page: Pointer to a dummy page used for mapping requests
+	 * of unpopulated pages. Constant after init.
 	 */
-
 	struct page *dummy_read_page;
 
 	/**
-	 * Protected by ttm_global_mutex.
+	 * @device_list: List of buffer object devices. Protected by
+	 * ttm_global_mutex.
 	 */
 	struct list_head device_list;
 
 	/**
-	 * Internal protection.
+	 * @bo_count: Number of buffer objects allocated by devices.
 	 */
 	atomic_t bo_count;
 } ttm_glob;
@@ -230,50 +222,69 @@ struct ttm_device_funcs {
 
 /**
  * struct ttm_device - Buffer object driver device-specific data.
- *
- * @device_list: Our entry in the global device list.
- * @funcs: Function table for the device.
- * @sysman: Resource manager for the system domain.
- * @man_drv: An array of resource_managers.
- * @vma_manager: Address space manager.
- * @pool: page pool for the device.
- * @dev_mapping: A pointer to the struct address_space representing the
- * device address space.
- * @wq: Work queue structure for the delayed delete workqueue.
  */
 struct ttm_device {
-	/*
+	/**
+	 * @device_list: Our entry in the global device list.
 	 * Constant after bo device init
 	 */
 	struct list_head device_list;
+
+	/**
+	 * @funcs: Function table for the device.
+	 * Constant after bo device init
+	 */
 	struct ttm_device_funcs *funcs;
 
-	/*
+	/**
+	 * @sysman: Resource manager for the system domain.
 	 * Access via ttm_manager_type.
 	 */
 	struct ttm_resource_manager sysman;
+
+	/**
+	 * @man_drv: An array of resource_managers.
+	 */
 	struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
 
 	/*
 	 * Protected by internal locks.
 	 */
+
+	/**
+	 * @vma_manager: Address space manager for finding BOs to mmap.
+	 */
 	struct drm_vma_offset_manager *vma_manager;
+
+	/**
+	 * @pool: page pool for the device.
+	 */
 	struct ttm_pool pool;
 
-	/*
-	 * Protection for the per manager LRU and ddestroy lists.
+	/**
+	 * @lru_lock: Protection for the per manager LRU and ddestroy lists.
 	 */
 	spinlock_t lru_lock;
+
+	/**
+	 * @ddestroy: Destroyed but not yet cleaned up buffer objects.
+	 */
 	struct list_head ddestroy;
+
+	/**
+	 * @pinned: Buffer object which are pinned and so not on any LRU list.
+	 */
 	struct list_head pinned;
 
-	/*
-	 * Protected by load / firstopen / lastclose /unload sync.
+	/**
+	 * @dev_mapping: A pointer to the struct address_space for invalidating
+	 * CPU mappings on buffer move. Protected by load/unload sync.
 	 */
 	struct address_space *dev_mapping;
 
-	/*
-	 * Internal protection.
+	/**
+	 * @wq: Work queue structure for the delayed delete workqueue. Has
+	 * internal protection.
 	 */
 	struct delayed_work wq;
 };
-- 
2.25.1

