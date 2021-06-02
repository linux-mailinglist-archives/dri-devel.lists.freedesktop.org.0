Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA33985FB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE4A6EC42;
	Wed,  2 Jun 2021 10:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B9C6EC3A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b9so2940617ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xKJZGSPqbfGQ3DZG6nxSrk+zk07qlK/RujsnqYTDQKo=;
 b=tepKWzjD3mLSG5FkPLa/9RNnj8ttXJwE04o/h7F/tlnZ5e6cgMRl/p0E9bntQ04r5t
 ZL6xeHW2JtoypjEdiM1NHf0gHKNGCyhEgs7ZTzhNtZWtuSJ9b6hryVJa+QXKhdqdKbfh
 hCG+0brGq9IowqZ77AFw2eu49dT33FZGQRQhtR22qnJ3gYsyc+dBnF1Wg1TR1gmLJqjP
 46EqRpWnOG/lCh2xrreMt6Gba1J9unDEQV31xr1AQOgF5AGzXY5RHH4/p+HzwCvKpvMq
 R9zczOlXtx9bKE5D+7VfzTUeGKQ2Lsq7YeWuIzSbAIC6UCbX5mmdXngTtXMQyb8Ks4lu
 yX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKJZGSPqbfGQ3DZG6nxSrk+zk07qlK/RujsnqYTDQKo=;
 b=iyWRLdzAlUhGw/1BkF7FzeElsKZ+TLzBzlyuyp6e9pjJeiMsI6r0Cj2LnQkFOr95px
 xnCcBexhbEBYun3cqXkgGQo6q61YzWnQ/26Q3NNRHpe563MURAoGazrJEWt7dJeeLcSs
 UwxxwJRR51rnu3e+pE55vx7v66GQhUcRaLOk5bKXTEJq6NX7zUpqVbAKrB176M2e+b8k
 97XNg4htq9e15STJY5/SLstlbR47VwyHTbH0A5df3xN3v4I5MpnOTG0Ltds/lMQP2odK
 w/gHqJPVpcXfmakLmjG3kEZ03QN161fNDcAQGEB1OVnnqY2U3lcz8XB6LsUPZ4gUloL3
 NyDw==
X-Gm-Message-State: AOAM532vNKAyJoN7GgQ4ShIUOdwQVhyxRbiwPIVIopLJB7S8lduvy55q
 2fWsumK6VCT9O84YaIRuK3mSQ4T9bow=
X-Google-Smtp-Source: ABdhPJyvlQMWSwAUf0F59OUPp2ZFqdcmWKLxTD1JamcXrWq4JdXq5CvtnJVtGAwudDq3U+l/fQqAjQ==
X-Received: by 2002:a17:906:17d8:: with SMTP id
 u24mr34466102eje.106.1622628558039; 
 Wed, 02 Jun 2021 03:09:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/amdgpu: revert "drm/amdgpu: stop allocating dummy
 GTT nodes"
Date: Wed,  2 Jun 2021 12:09:08 +0200
Message-Id: <20210602100914.46246-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
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

TTM is going to need this again since we are moving the resource
allocation into the backend.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 68 ++++++++++++---------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index fac563fb6f0c..cd5c55cb38d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -24,16 +24,22 @@
 
 #include "amdgpu.h"
 
+struct amdgpu_gtt_node {
+	struct drm_mm_node node;
+	struct ttm_buffer_object *tbo;
+};
+
 static inline struct amdgpu_gtt_mgr *
 to_gtt_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_gtt_mgr, manager);
 }
 
-struct amdgpu_gtt_node {
-	struct drm_mm_node node;
-	struct ttm_buffer_object *tbo;
-};
+static inline struct amdgpu_gtt_node *
+to_amdgpu_gtt_node(struct ttm_resource *res)
+{
+	return container_of(res->mm_node, struct amdgpu_gtt_node, node);
+}
 
 /**
  * DOC: mem_info_gtt_total
@@ -99,7 +105,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
  */
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem)
 {
-	return mem->mm_node != NULL;
+	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(mem);
+
+	return drm_mm_node_allocated(&node->node);
 }
 
 /**
@@ -130,12 +138,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	atomic64_sub(mem->num_pages, &mgr->available);
 	spin_unlock(&mgr->lock);
 
-	if (!place->lpfn) {
-		mem->mm_node = NULL;
-		mem->start = AMDGPU_BO_INVALID_OFFSET;
-		return 0;
-	}
-
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node) {
 		r = -ENOMEM;
@@ -143,19 +145,25 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	}
 
 	node->tbo = tbo;
+	if (place->lpfn) {
+		spin_lock(&mgr->lock);
+		r = drm_mm_insert_node_in_range(&mgr->mm, &node->node,
+						mem->num_pages,
+						tbo->page_alignment, 0,
+						place->fpfn, place->lpfn,
+						DRM_MM_INSERT_BEST);
+		spin_unlock(&mgr->lock);
+		if (unlikely(r))
+			goto err_free;
 
-	spin_lock(&mgr->lock);
-	r = drm_mm_insert_node_in_range(&mgr->mm, &node->node, mem->num_pages,
-					tbo->page_alignment, 0, place->fpfn,
-					place->lpfn, DRM_MM_INSERT_BEST);
-	spin_unlock(&mgr->lock);
-
-	if (unlikely(r))
-		goto err_free;
-
-	mem->mm_node = node;
-	mem->start = node->node.start;
+		mem->start = node->node.start;
+	} else {
+		node->node.start = 0;
+		node->node.size = mem->num_pages;
+		mem->start = AMDGPU_BO_INVALID_OFFSET;
+	}
 
+	mem->mm_node = &node->node;
 	return 0;
 
 err_free:
@@ -178,17 +186,19 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 			       struct ttm_resource *mem)
 {
+	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(mem);
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	struct amdgpu_gtt_node *node = mem->mm_node;
 
-	if (node) {
-		spin_lock(&mgr->lock);
-		drm_mm_remove_node(&node->node);
-		spin_unlock(&mgr->lock);
-		kfree(node);
-	}
+	if (!node)
+		return;
 
+	spin_lock(&mgr->lock);
+	if (drm_mm_node_allocated(&node->node))
+		drm_mm_remove_node(&node->node);
+	spin_unlock(&mgr->lock);
 	atomic64_add(mem->num_pages, &mgr->available);
+
+	kfree(node);
 }
 
 /**
-- 
2.25.1

