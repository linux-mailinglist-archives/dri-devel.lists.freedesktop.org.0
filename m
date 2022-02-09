Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3F4AECD0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2529310E581;
	Wed,  9 Feb 2022 08:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C349210E512;
 Wed,  9 Feb 2022 08:41:09 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id da4so3586928edb.4;
 Wed, 09 Feb 2022 00:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3TPwqaWMYIln4WJsB/UaKqFa+ZRYcqHO31UqbcIeoc=;
 b=c/YQyM5B4qjtDQh/pwGp96MKHmvANQk/lRTJejh6vXMMDg16RbUx3HIF0K4WBL3/iE
 MqLSB+SiLLpjqNphfODwc4QPumClFV5/5khIyU26LTAtrZkIprLoFvtlCo4TZ+ZTps9B
 hHyHXTYzu51tZBHfGeTtuI+LXybOYl+hF6H3lRLFrIYYTPTDsQCB06Y77fiWyM1FzQ3a
 hDQIy+1WRg8TyzG/oIpVOxH3Pm0l/5jsRkEycAHIMzLB/WC/Lee/HzoxrmWOUkfD3Kg8
 HjwMulF+x4UK89sLGCwtNS4DJnKf6i+HLLI8F8ZFrYII2sKpEKqexjinZCNWMJxxZfrr
 8Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3TPwqaWMYIln4WJsB/UaKqFa+ZRYcqHO31UqbcIeoc=;
 b=OgzcoqK2Ri9tTHMqlhZofCQSyvDC6sSHymbJY17xbqpwPSnjSdVCT6Ee0NUReVvQbF
 +r85mwO2ZTKjtzXACcGynfz/Qiz5fg8GKI5ZA2UO2ieS8yinAWvlj40dvPfJDPmeQ0db
 v9W57NCFfDPNhYd5FMvwYNlc6LaUosukrPCclcs6lbfC+133UiO2KBOevtUHsjfSBEPY
 Mtvp04rTxXukytOTlL2cxKhBerLWn8pdy5QgFBuufuDOudRBK0Zn08HmhgvtuF1S4B6k
 Di1b5A0GieC1qYBa2qd193YKkGlvNrjV93KgmHg/85XEwfUMtR1CrwZvZ9wCuZv0vpON
 ltZQ==
X-Gm-Message-State: AOAM532BfjtIhXjbfz95u1Qf8MBIMPjBwvTHnlGMDV3BfJZb5URs22nm
 gJyr/nJQ8p/XxILznvHbUpI=
X-Google-Smtp-Source: ABdhPJyxtuTYCzyzigDXkciXOY21mqBX5kq1mxKZk9UfiDuI1asA8SoUzK+JyNQy6hUleIxKXHP/PA==
X-Received: by 2002:a05:6402:354c:: with SMTP id
 f12mr1310814edd.210.1644396068274; 
 Wed, 09 Feb 2022 00:41:08 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u6sm3807958eje.101.2022.02.09.00.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 00:41:07 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 7/9] drm/amdgpu: drop amdgpu_gtt_node v2
Date: Wed,  9 Feb 2022 09:40:57 +0100
Message-Id: <20220209084059.1042345-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209084059.1042345-1-christian.koenig@amd.com>
References: <20220209084059.1042345-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have the BO pointer in the base structure now as well.

v2: add lockdep and kerneldoc

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

