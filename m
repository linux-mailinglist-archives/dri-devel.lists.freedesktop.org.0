Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E93FFFBF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA626E884;
	Fri,  3 Sep 2021 12:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4376E885
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:31:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso3666488wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p9/lQtbDU3qwmXaGnetxOrcxbNaLxJtMNDb950Jhzlw=;
 b=HEj8AJoavXwZgd8XLxDe2/3M0ADmSGa0wrY5SDf57squkCxTie6FECsDgkfl7UoQGS
 zEswR5sqZ5krZ6TNuG17/HAs/NGCJC+RUVrmZesGbz3FtpMrMU6Wg1YJHSk8CVep/kuf
 evIW5sxlALLGYVXZhQ0xl3RcmyXLc4KDtxEOrFu7gwStiOrjr2qc/phlMFuIwj7G9hv/
 hFIxiULCvU5NkzgyxvIuTpA/pkN5Zyn4rNVsqdCk4kNMad3T6ofJK9gIq2lfYxL47CPV
 1/WS53djjoEw1L2LtWMKV3XFOVr+YvkBQH1H6clUvuzEQJpYEaRVyPNfNtO/W3HVk05i
 6VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9/lQtbDU3qwmXaGnetxOrcxbNaLxJtMNDb950Jhzlw=;
 b=Un3nmh1hCW0vQM0B9GZzYUlawpBnaxL3fQXx4Ro7+jgmJh3Gt9tNdDHyW9F9HZWo+g
 PafQ2tx1V/k9WwLUyLR1IMFWQEM9tAbqQHTg3xVmPTq4RheGUxkYqxsZPvrCsUgnjLHk
 XYv8HBGc4cqMkO9sX8dQO3wAUR7vWubNlvcsGzrDeLlM5o01G9RSffm7JJuHFVlZu0mb
 mB5WWRdDkuPY6PASu2CGxB120ZvjJOH1w2Oyj/dKtTCtaV3OtHrPVmey6Lku2lYOgh/q
 FinXvGwvPRuDTbT0Y6yvJaQwmtbVccRv2jEIE0bPzvuyOoKu/k1AahqpaRZlVLmVykR4
 3ydg==
X-Gm-Message-State: AOAM533yw46OYqRmQSZcNsWZ5BT1tzfNfE0cOHkUX8uNGkrp2LbqUipv
 F1zZYskQJF1thDEi9ppSmRioW15femUqPnZH
X-Google-Smtp-Source: ABdhPJyti/noRTb4nEcV4onzXh6v8+hp6o+fd0fQL8HwBoNN57bDOkeRbrvi5n2R2f5jT4CWI36MaA==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id
 f11mr92809wmq.165.1630672292308; 
 Fri, 03 Sep 2021 05:31:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 x11sm4564873wro.83.2021.09.03.05.31.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:31:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: enable TTM device object kerneldoc
Date: Fri,  3 Sep 2021 14:31:20 +0200
Message-Id: <20210903123123.116575-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903123123.116575-1-christian.koenig@amd.com>
References: <20210903123123.116575-1-christian.koenig@amd.com>
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
---
 Documentation/gpu/drm-mm.rst |  9 +++++
 include/drm/ttm/ttm_device.h | 73 +++++++++++++++++++++---------------
 2 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 8ca981065e1a..56b7b581567d 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -30,6 +30,15 @@ The Translation Table Manager (TTM)
 
 TTM design background and information belongs here.
 
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

