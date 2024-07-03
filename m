Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13DD9261C2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B9110E117;
	Wed,  3 Jul 2024 13:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i3triMcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3610E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:26:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so38397385e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720013169; x=1720617969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umrby2MQnpwBnZqHdFG3/JwLGYUDmvuInXq96jEbSz4=;
 b=i3triMcp+/cE7i2FS5CTGN0PFiFbBO2rUqiZij+OpGFthiZjm0y+2R5igGCCoT8Yx/
 e0nrut8fkCBuLthbsmK96LHZe/GkTRfBoJ4+Qi3hkFxzsyIcgaqWmKLRLBCHrATpsjlb
 hQBgHwmQeu0fZ7LCVew8jTpdQeC9qOCOIrzGCBw7MEQVB8kUyOePtRzQDjTCZtXDOB0q
 WPouZ3UCnpz0qEqzqhxiS65qBfWBomTk4Tes5ZjjcngjndeRzbu8Ph5RzVXq+3HDF3rs
 vLwGRY2PSd0MuHuEKMZpLrHbH9qiJKhGp3/TB7wH6NhIUg8OzDsvmX+tUg0q4S7GzIUX
 fM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013169; x=1720617969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umrby2MQnpwBnZqHdFG3/JwLGYUDmvuInXq96jEbSz4=;
 b=l0y+vUA6pLhQmbhBh7HYNwm9u3UNK5HpLCCOqZyhH0HTv48gssda7bx67xGAkwREYa
 H9rZh5MPA9M5OKokLbQ6bZ2UM2tekrFPM+D+uTZ6ES5Kbq3XUPQBzIJ1uizg6LHO+zjl
 jlQ8HilTXw/T9TNngYFqzrGRblBnVKmKC6TVSYa58l6PfYruTwwFGET202QAnnxB9NY+
 K6qDiwuWA7hdXF2h2rJxiCNi6QRd+PGc+fOkazsmg6TaOwuKCY8Kco+efT32GId3j5Wm
 ik9WmK7qn9YwuI+W/KZ939UJER0NOuCPgGLteDRA9X9BZYFRvl/+/H3KUL9mU43xZawB
 Cmtg==
X-Gm-Message-State: AOJu0Yy9gssDHlYm2/7jKjwQk/2MSDyX/Tyif3ALvQVLBumXXkxA0PYe
 387LP8aHIW4OEsWeBek7i+t1yqYpNiFJylLzme5KPzWfAC0bk+/JCAKvKA/mZ4c=
X-Google-Smtp-Source: AGHT+IF+aebT6ghtWznbaMa6abj2AESMVteNbaKi9hoeHwOUM1L0+O9di3rbFJTrl5Z1XIW4oOVbQg==
X-Received: by 2002:a05:600c:3541:b0:425:62f7:92ea with SMTP id
 5b1f17b1804b1-4257a02f7c9mr76978295e9.14.1720013167981; 
 Wed, 03 Jul 2024 06:26:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1559:9300:5f5d:6303:9414:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm237197665e9.12.2024.07.03.06.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:26:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amdgpu: use drm_exec during BO validation
Date: Wed,  3 Jul 2024 15:26:02 +0200
Message-Id: <20240703132602.4756-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703132602.4756-1-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
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

This allows to detect deadlocks happening because of resource
constraints.

Especially submissions which want to use all of GDS doesn't result in
sporadic -ENOMEM any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 86 ++++++++++++++------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..ff532c8b7a62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -782,7 +782,7 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
-		.resv = bo->tbo.base.resv
+		.exec = &p->exec,
 	};
 	uint32_t domain;
 	int r;
@@ -834,7 +834,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct ttm_operation_ctx ctx = { true, false };
+	struct ttm_operation_ctx ctx = {
+		.interruptible =true,
+		.exec = &p->exec
+	};
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *obj;
@@ -919,50 +922,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			if (unlikely(r))
 				goto out_free_user_pages;
 		}
-	}
-
-	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct mm_struct *usermm;
 
-		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
-		if (usermm && usermm != current->mm) {
-			r = -EPERM;
-			goto out_free_user_pages;
-		}
+		amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+			struct mm_struct *usermm;
 
-		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
-		    e->user_invalidated && e->user_pages) {
-			amdgpu_bo_placement_from_domain(e->bo,
-							AMDGPU_GEM_DOMAIN_CPU);
-			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
-					    &ctx);
-			if (r)
+			usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
+			if (usermm && usermm != current->mm) {
+				r = -EPERM;
 				goto out_free_user_pages;
+			}
+
+			if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
+			    e->user_invalidated && e->user_pages) {
+				amdgpu_bo_placement_from_domain(e->bo,
+								AMDGPU_GEM_DOMAIN_CPU);
+				r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
+						    &ctx);
+				drm_exec_retry_on_contention(&p->exec);
+				if (r)
+					goto out_free_user_pages;
+
+				amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
+							     e->user_pages);
+			}
 
-			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
-						     e->user_pages);
+			kvfree(e->user_pages);
+			e->user_pages = NULL;
 		}
 
-		kvfree(e->user_pages);
-		e->user_pages = NULL;
-	}
+		amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
+						  &p->bytes_moved_vis_threshold);
+		p->bytes_moved = 0;
+		p->bytes_moved_vis = 0;
 
-	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
-					  &p->bytes_moved_vis_threshold);
-	p->bytes_moved = 0;
-	p->bytes_moved_vis = 0;
+		r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
+				       amdgpu_cs_bo_validate, p);
+		drm_exec_retry_on_contention(&p->exec);
+		if (r) {
+			DRM_ERROR("amdgpu_vm_validate() failed.\n");
+			goto out_free_user_pages;
+		}
 
-	r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
-			       amdgpu_cs_bo_validate, p);
-	if (r) {
-		DRM_ERROR("amdgpu_vm_validate() failed.\n");
-		goto out_free_user_pages;
-	}
+		drm_exec_for_each_locked_object(&p->exec, index, obj) {
+			r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
+			drm_exec_retry_on_contention(&p->exec);
+			if (unlikely(r))
+				goto out_free_user_pages;
+		}
 
-	drm_exec_for_each_locked_object(&p->exec, index, obj) {
-		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
-		if (unlikely(r))
-			goto out_free_user_pages;
+		amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
+					     p->bytes_moved_vis);
 	}
 
 	if (p->uf_bo) {
@@ -973,9 +982,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
 	}
 
-	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
-				     p->bytes_moved_vis);
-
 	for (i = 0; i < p->gang_size; ++i)
 		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
 					 p->bo_list->gws_obj,
-- 
2.34.1

