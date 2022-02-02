Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD274A71E5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0310E66E;
	Wed,  2 Feb 2022 13:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB6B10E63C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:46:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u15so38499408wrt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 05:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ff7SToZ1lQJNjXgIFmILnthRBmfksMfE/0q9+copp7E=;
 b=N3uX1j0WQhoGWNnpnKhmgtjzWjch1xaF8kVeXaI1NFYJDZItfpPvLYOXp3Kngtjj9P
 k4vYciDAXu0ri+ZYTXOm/+0ZZsOcjsDmgt2SAhkrx34ajF0LlDtW8j1vb09nSIppF4/S
 CH5QObDNF0hkvQT/Fmuy6YTKirCll1HoRybSU3aHf0tlp9HJSrz0ACKc0b3Z+ozuyeT/
 1x7/OVvGP2c9dRyryyMglFhcZuincEVsWePRpB2qxYxMSvW0UmhcwWcKxtynEVeLMBxG
 3wVphteNf857Gp0XCVd6iDwhU/77FWe6D1UsVj8jt+uY0kEpIlXkRNIUPwgclY1X3JbC
 io4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ff7SToZ1lQJNjXgIFmILnthRBmfksMfE/0q9+copp7E=;
 b=Y2KgwcmdcMPVPHF/kSwA94vOKLqkMZ7pf7vQ1fBw6MMuqqT8GlWHOKjLK8s5QpwAoL
 vU7nJ4JcgBaZ5mRjuSE4xgDdvItdJN6542EwvFuXNItL8cTET2E33EjQ70pogvpvnrG2
 PHvVeIH5MCGaujR5NM9q5T7CM2qhzramczxfic+9H9z1TtI0PwaLbdyQ/IWrAdQfGWxo
 5KwJInGKsTZWu6oEujkZSNz3gMuKDUg1MS0GTPUPJfOy3C++57K8XV+i6/vooCCL8Rsh
 m5vG7erB2Y0lDpr8/8gZj0msT5e9RZc0UOM3N6rRsiQzvoF4E55Px/63g05N5vHncjz4
 g1LQ==
X-Gm-Message-State: AOAM530jb95T63vOQr3p7SKmSJYrX8VKo/1SKt1KlVuKT2byQzQenz2R
 i6lWyAosoyOFKN/Fpr/GbLmqTSq+Wak=
X-Google-Smtp-Source: ABdhPJxmw7S9mPHKD8AedxCZzkAK2LMfueWw+afJP3Ly3sYo8sA0HMEL9FL+rbFUovnfPnBs/MMwNg==
X-Received: by 2002:adf:edc7:: with SMTP id v7mr24869110wro.584.1643809618269; 
 Wed, 02 Feb 2022 05:46:58 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id c13sm17471876wrv.24.2022.02.02.05.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:46:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH 7/9] drm/amdgpu: drop amdgpu_gtt_node v2
Date: Wed,  2 Feb 2022 14:46:49 +0100
Message-Id: <20220202134651.296584-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202134651.296584-1-christian.koenig@amd.com>
References: <20220202134651.296584-1-christian.koenig@amd.com>
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

We have the BO pointer in the base structure now as well.

v2: add lockdep and kerneldoc

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 ++++++++-------------
 drivers/gpu/drm/ttm/ttm_resource.c          |  4 ++
 include/drm/ttm/ttm_resource.h              |  8 ++++
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index ce5eeb3c1097..a55bbe1a154c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -26,23 +26,12 @@
 
 #include "amdgpu.h"
 
-struct amdgpu_gtt_node {
-	struct ttm_buffer_object *tbo;
-	struct ttm_range_mgr_node base;
-};
-
 static inline struct amdgpu_gtt_mgr *
 to_gtt_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_gtt_mgr, manager);
 }
 
-static inline struct amdgpu_gtt_node *
-to_amdgpu_gtt_node(struct ttm_resource *res)
-{
-	return container_of(res, struct amdgpu_gtt_node, base.base);
-}
-
 /**
  * DOC: mem_info_gtt_total
  *
@@ -107,9 +96,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 
-	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
+	return drm_mm_node_allocated(&node->mm_nodes[0]);
 }
 
 /**
@@ -129,15 +118,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	uint32_t num_pages = PFN_UP(tbo->base.size);
-	struct amdgpu_gtt_node *node;
+	struct ttm_range_mgr_node *node;
 	int r;
 
-	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
+	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
 
-	node->tbo = tbo;
-	ttm_resource_init(tbo, place, &node->base.base);
+	ttm_resource_init(tbo, place, &node->base);
 	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
 	    ttm_resource_manager_usage(man) > man->size) {
 		r = -ENOSPC;
@@ -146,8 +134,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
-		r = drm_mm_insert_node_in_range(&mgr->mm,
-						&node->base.mm_nodes[0],
+		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
 						num_pages, tbo->page_alignment,
 						0, place->fpfn, place->lpfn,
 						DRM_MM_INSERT_BEST);
@@ -155,18 +142,18 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		if (unlikely(r))
 			goto err_free;
 
-		node->base.base.start = node->base.mm_nodes[0].start;
+		node->base.start = node->mm_nodes[0].start;
 	} else {
-		node->base.mm_nodes[0].start = 0;
-		node->base.mm_nodes[0].size = node->base.base.num_pages;
-		node->base.base.start = AMDGPU_BO_INVALID_OFFSET;
+		node->mm_nodes[0].start = 0;
+		node->mm_nodes[0].size = node->base.num_pages;
+		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
-	*res = &node->base.base;
+	*res = &node->base;
 	return 0;
 
 err_free:
-	ttm_resource_fini(man, &node->base.base);
+	ttm_resource_fini(man, &node->base);
 	kfree(node);
 	return r;
 }
@@ -182,12 +169,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 			       struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 
 	spin_lock(&mgr->lock);
-	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
-		drm_mm_remove_node(&node->base.mm_nodes[0]);
+	if (drm_mm_node_allocated(&node->mm_nodes[0]))
+		drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&mgr->lock);
 
 	ttm_resource_fini(man, res);
@@ -204,16 +191,16 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
+	struct ttm_range_mgr_node *node;
 	struct amdgpu_device *adev;
-	struct amdgpu_gtt_node *node;
 	struct drm_mm_node *mm_node;
 	int r = 0;
 
 	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
 	spin_lock(&mgr->lock);
 	drm_mm_for_each_node(mm_node, &mgr->mm) {
-		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
-		r = amdgpu_ttm_recover_gart(node->tbo);
+		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
+		r = amdgpu_ttm_recover_gart(node->base.bo);
 		if (r)
 			break;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 5bfe6eed8f82..e3301f6277ba 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -399,6 +399,8 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 {
 	struct ttm_resource *res;
 
+	lockdep_assert_held(&man->bdev->lru_lock);
+
 	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
 	     ++cursor->priority)
 		list_for_each_entry(res, &man->lru[cursor->priority], lru)
@@ -420,6 +422,8 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res)
 {
+	lockdep_assert_held(&man->bdev->lru_lock);
+
 	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
 		return res;
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index cd3a6ed0c82c..cc452a7aa016 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -347,6 +347,14 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res);
 
+/**
+ * ttm_resource_manager_for_each_res - iterate over all resources
+ * @man: the resource manager
+ * @cursor: struct ttm_resource_cursor for the current position
+ * @res: the current resource
+ *
+ * Iterate over all the evictable resources in a resource manager.
+ */
 #define ttm_resource_manager_for_each_res(man, cursor, res)		\
 	for (res = ttm_resource_manager_first(man, cursor); res;	\
 	     res = ttm_resource_manager_next(man, cursor, res))
-- 
2.25.1

