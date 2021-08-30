Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE13FB2C7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A09489DA7;
	Mon, 30 Aug 2021 08:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF189CFA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso11033104wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BfsO1wv7cjR+kzOKp1zgvnKtBlcw7E7DQHYjlHsuzpE=;
 b=QriwFAFq0p7+umBFs3K6O8AjGPZWipbopAkSdrEQOLiKKiD7hoDQNq5SyPxsuMK33b
 NnioLj7fkNG11sY58+umG02EhjpTo1geJ6Ub4WHxFcQYZqDuwfoseLOPwVeE1T2yjP5a
 J/l31N3YjeqgjJLUsAiFr51CckXz312tgxaIjMHSOCfFT6I3cFY6bQ0pWXNrnJedmc/B
 75GI5+KgEhytlhWarFL/W+pzm/nADZvPcnoH3Vg6OeJIkfgKcLmdz5WexCWGwa7xGMKJ
 MPk4MwTzqtv8NdhjI+RRt8bBNHapKWCB4TUCzhFZXkF5OcBQDotC286YJXmgsoZppSnM
 +B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BfsO1wv7cjR+kzOKp1zgvnKtBlcw7E7DQHYjlHsuzpE=;
 b=qml/Ea6iT5vDjMFMCXjUV8GwcGTy4NFSiWx9/etz+FYMrj9uZqLJZOdhpeJGZKjjfZ
 338jiSeyGpf7wgcOYNd/L+esAeHnTmwK5RhsvVrTWODOhXQ8trX6IUQY7iS30y2rUV5Y
 EcnLxvi95T83HV4PUWWOoSst1cC7gJsrdIeuTYqTh4olTGpNc2Nz91lR5mm/WGuobsko
 OrN8q7KXZpM5KHEAaxgfHxyhNGLmILh17zbHQQbXexxnXP0aGENtsM1iNAbHZ0j2xAIO
 jXiaGdI9GJeSWqWvBUSOYM28MgFEyHtbabd+5TklNcsQ9+C5OmWUJlrSP8EgXYqKoO9r
 yiTg==
X-Gm-Message-State: AOAM530AYMmGVWCt0RVE0WiLu50KnvCwqsU1U7dLZUdAkKbUSYfTCY7y
 j2yMqTtY6rB/Drjo6k1M3jxaQtdM/1iUtcMl
X-Google-Smtp-Source: ABdhPJwlbnXiMDUp16ZU5Ewsqv7F6GZ98TrommHkPcf/WHva96NneLxoM/sJU5vZEBnFt5Xc9Fsf3A==
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr31130176wmz.174.1630313838085; 
 Mon, 30 Aug 2021 01:57:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 12/12] drm/amdgpu: drop amdgpu_gtt_node
Date: Mon, 30 Aug 2021 10:57:07 +0200
Message-Id: <20210830085707.209508-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 ++++++++-------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 7085494c6a9f..22506e429a62 100644
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
-- 
2.25.1

