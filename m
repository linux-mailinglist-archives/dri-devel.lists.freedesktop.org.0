Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D24E2779
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ACD10E30D;
	Mon, 21 Mar 2022 13:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142610E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:26:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m30so10851905wrb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KEOttOzqZgauNDJe/0AFGLl4JN/b2v2XP6JYejUPAtE=;
 b=QX/pC9XB/jm8DatyryGZC3jmza7SVJACL5ULtR46ZyTwsn2NmiJeTdmYna/Uvx2TIL
 07z8jdosrU1SITVBf83Zsyfblt2lLcRMYl8vEqzKzgyuAM4OZMBnEH9Xv9jvJeEzSB0v
 QubbyoP5r60FIl7L8cuO7DK9Ml59fHJPgPB0Q8MuzsY1yX7lXxbCwoAVDCTks2Kv3i87
 7dN5Cksj8aJOZncc0n4vL7u5rnjefZFB9jffPXb1vhOtDoraTJ1vKC9O4awp5qCdkiZx
 C1XKzH8oNUIIRkqM8pMa/reZ0isD7ew7FBg9QGbKmV+V2t2dz9O2cZLjsOxlt0B8PiKj
 8Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KEOttOzqZgauNDJe/0AFGLl4JN/b2v2XP6JYejUPAtE=;
 b=kg+X+J+CcXbKHdMP9+eOJG2H6+l507Jmn1RULJqVtpkOKWcKNX0O7iqKJJuFqOeHF/
 rUSAcxLG6F2McMwnfiu03pqSNYCFup0onNp12eAgEPhtGnrlNfj56XpYvuUWvKaUl238
 9AXsPZYuRwJaSZly3QnXFGsP/YEKZoKq9X9z+rNH7iJP7FRsW2Auy/HzdnCze5gfEVfk
 GfS9/SamlXl7U9hGGU8xLYKv8MFaeOiNs/u9STvIZwjkDwxUYB2PbcA51VZ4k53Vz6Ll
 UFxZ9gEbP0+qBW9QYlbDusdVtP4AMoGEQ3yje8LpcL5iaDwtUufVXzrSbGNBgw582Qfn
 WsCA==
X-Gm-Message-State: AOAM5302eqfkOZAoVyD2h6vwG/HNxTJrjLn5Vt4QpwXIm+5BDfCPnt71
 9C73JCqAQAr0CrsJbfIhwqo=
X-Google-Smtp-Source: ABdhPJzHWcDc0jhR+jNC09jUpc+lkLbZNJGJAZ5XX0yss1rmHczY2SNBmTFPIIki5Rn2UluCUABG4g==
X-Received: by 2002:a05:6000:1e09:b0:204:44a:7837 with SMTP id
 bj9-20020a0560001e0900b00204044a7837mr7859076wrb.6.1647869169540; 
 Mon, 21 Mar 2022 06:26:09 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm13714494wma.21.2022.03.21.06.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:26:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, felix.kuehling@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: drop amdgpu_gtt_node
Date: Mon, 21 Mar 2022 14:26:01 +0100
Message-Id: <20220321132601.2161-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321132601.2161-1-christian.koenig@amd.com>
References: <20220321132601.2161-1-christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have the BO pointer in the base structure now as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 ++++++++-------------
 include/drm/ttm/ttm_resource.h              |  8 ++++
 2 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 3bcd27ae379d..68494b959116 100644
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
@@ -106,9 +95,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
 {
-	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 
-	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
+	return drm_mm_node_allocated(&node->mm_nodes[0]);
 }
 
 /**
@@ -128,15 +117,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
@@ -145,8 +133,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
-		r = drm_mm_insert_node_in_range(&mgr->mm,
-						&node->base.mm_nodes[0],
+		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
 						num_pages, tbo->page_alignment,
 						0, place->fpfn, place->lpfn,
 						DRM_MM_INSERT_BEST);
@@ -154,18 +141,18 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
@@ -181,12 +168,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
@@ -202,7 +189,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
  */
 int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 {
-	struct amdgpu_gtt_node *node;
+	struct ttm_range_mgr_node *node;
 	struct drm_mm_node *mm_node;
 	struct amdgpu_device *adev;
 	int r = 0;
@@ -210,8 +197,8 @@ int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
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
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 07a17b22cf39..a1f495b1dd55 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -350,6 +350,14 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
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

