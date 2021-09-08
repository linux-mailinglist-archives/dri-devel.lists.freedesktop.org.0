Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDE403A9D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3CD6E1B2;
	Wed,  8 Sep 2021 13:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1406E1A8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1554755wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VRiQiAfh4aWlyCBzPZskZLhwC/Ct6jq6iiXSc+kPpfo=;
 b=P96Z6i0tjmD1qJHvaNInM34s8FzDgmgOSVVqo1VoVOCVJQED/SMpXtbix+RINVU+lm
 kzOGiCZvLvL9up8JPSMACV8+BU8tMbXuHWP6rUMap1pjb/owJH3kBauIHElswmQyJr0g
 TmnyEcbbEX6VcyBXbH6D8NY/gYj6vUyPOE+t02IGjGm0hWn9vGPtT0no3o75uJyk2WFs
 8KLL9zOrnCwnAbXSH8lQAnsvsq5x7HVrj8EJAy7RmVZAxGYlnGBY98SmRU3b2I3Y2ahP
 TO+eKQ0EQY8ZqALFiZGH82oKqY7E8X79uu1WCqWCdkEv8P/WpQTXSTi8c2YHTBzUkvc5
 hYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VRiQiAfh4aWlyCBzPZskZLhwC/Ct6jq6iiXSc+kPpfo=;
 b=ZP1actFEK1R/9s6FAnCRXtUzjWhjXagmvAvqkzM+uFS9IUeB2RdsI7efN5vScHepxB
 j9l6lGd2b3XoxMXACoMkEUSdHd3jZoJbimKHR45Ow1XsOsjc2eHOB5MGQyqWc/foBNvK
 HDE7cYdp5zM4jz95MHtynLUYPEC2sffoG8ZqJ62l9x519P1DragDiaJ3iSgPEDVZHDi0
 itLF9mwVt0tT96LLGEI2ONP8coBTEvrUR54IfjpwP/rJYfT3BFTHHU7VJ3MCYAAPJGtb
 JRNZ3ixeOxg7LsAzop9A++8PBfs5qoEc3L5KTYGRSx1o6ZHz0tU3tqkCyO3ZOAQLwSq2
 QliA==
X-Gm-Message-State: AOAM531ZR8D7CKvr3fo1MjVBnq3lvf1O2G0xE1MatC4b2z9BWxZUJ80k
 YpH+aVDoIyI6A0OwwY8RSE45PVtoRDtrzZ0d
X-Google-Smtp-Source: ABdhPJzT0GSmgqBvrl2LBzpHtidEoefJc+Yw/1UhK/pcp9Shq6jtGU90tRilW31zmP3unUWG/TKNxA==
X-Received: by 2002:a05:600c:3542:: with SMTP id
 i2mr3565012wmq.170.1631107780488; 
 Wed, 08 Sep 2021 06:29:40 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 4/8] drm/ttm: enable TTM device object kerneldoc v2
Date: Wed,  8 Sep 2021 15:29:29 +0200
Message-Id: <20210908132933.3269-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908132933.3269-1-christian.koenig@amd.com>
References: <20210908132933.3269-1-christian.koenig@amd.com>
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

v2: adjust based on suggestions from Alex

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 Documentation/gpu/drm-mm.rst |  9 +++++
 include/drm/ttm/ttm_device.h | 72 +++++++++++++++++++-----------------
 2 files changed, 48 insertions(+), 33 deletions(-)

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
index 07d722950d5b..3cc1d9b76131 100644
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
@@ -230,50 +222,64 @@ struct ttm_device_funcs {
 
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
+	 * @man_drv: An array of resource_managers, one per resource type.
+	 */
 	struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
 
-	/*
-	 * Protected by internal locks.
+	/**
+	 * @vma_manager: Address space manager for finding BOs to mmap.
 	 */
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
+	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
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
+	 * @wq: Work queue structure for the delayed delete workqueue.
 	 */
 	struct delayed_work wq;
 };
-- 
2.25.1

