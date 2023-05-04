Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742756F6A73
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8861710E235;
	Thu,  4 May 2023 11:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0B510E150;
 Thu,  4 May 2023 11:52:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-959a3e2dc72so64412066b.2; 
 Thu, 04 May 2023 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201130; x=1685793130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HKcjb4A2TTYDdexLlbTkVvJFWrtkj9zvIZy7TFaxEsg=;
 b=Jspnd0OOhfm14JzmgRVrjj1mS+6UUGOd0qO76Qj0X0fx2s6NF/uX/8vaDoSn+5AzAC
 le8rhmxHyHMwVT8DFZWmtm3ycHTZXNsIFv7gG5TQ9Iw6bf0oYoHDyzYEJTwuqdo64nnZ
 IYhwvv8Pxt173zER2BKj5W3Bm8GoQZQtOa+QoTyTwIFshI5QzelTq+7rps1wVAJ7gnkp
 rmJE/LHyJvfq4LiApRO0vhdc7j7LGn5czNXRVPNGwdoTIU8KbFbX6sK1M6oKiNQJBdw9
 LV9E2MKdqoYyqYaXstXgewi0ku0PaZmZRN+dWQCsfTxHDKDFLHvWkwO0bjH6VaS3mJ8X
 WzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201130; x=1685793130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HKcjb4A2TTYDdexLlbTkVvJFWrtkj9zvIZy7TFaxEsg=;
 b=f6ukp24mqLYqDTgGXbbhVB45oTRRuOgLY1GCYvQDWF+rfXMDZeyBLWqhJ2muGTyaof
 2c5Qtx9LndsmVTr3ODAYEP5iQo6P5dTYNPz7BuMCIe3/XjeF08F9/67MZ/CjYC+Uk5gi
 6B/8sAdDOECtZdgl4DDbMnNpj8TAPRWGQrPTJETNixDWrZBnxBIIW6ft/gZJSeHiMQU/
 udZRovXwnlhZzLUm6FylPtsY7slFglOZeeZ1SkxTGSAOoOwRnLRhZtayrnbGJqiWsohi
 KnusXrb0q535UXdy57zuusRjoiYZedYOPQN8LC3QXDkWDWNWclnKPRyClMFeLYwcFJMi
 4A/g==
X-Gm-Message-State: AC+VfDwjuE250NvpEXhgZ2sBNFlnv59e5LuqMs7+hKvWePGx5/OUllqZ
 q5qjjYIrPxTo7FhxsYb4OWE=
X-Google-Smtp-Source: ACHHUZ7+qXe30qIkyJuAcG4eE3/dI2F/nB9eCogZ+B4sxhZ6ZAvObVcG+iNoaJt/oGS0oLFOtEYTkw==
X-Received: by 2002:a17:906:db0b:b0:961:57fb:10c1 with SMTP id
 xj11-20020a170906db0b00b0096157fb10c1mr5919223ejb.63.1683201130505; 
 Thu, 04 May 2023 04:52:10 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Date: Thu,  4 May 2023 13:51:52 +0200
Message-Id: <20230504115159.2245-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
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

Use the new component here as well and remove the old handling.

v2: drop dupplicate handling

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  71 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 210 +++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h      |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  22 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   3 -
 7 files changed, 115 insertions(+), 204 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 02b827785e39..eba3e4f01ea6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -53,7 +53,6 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 252a876b0725..b6298e901cbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -28,6 +28,7 @@
  *    Christian König <deathsimple@vodafone.de>
  */
 
+#include <linux/sort.h>
 #include <linux/uaccess.h>
 
 #include "amdgpu.h"
@@ -50,13 +51,20 @@ static void amdgpu_bo_list_free(struct kref *ref)
 						   refcount);
 	struct amdgpu_bo_list_entry *e;
 
-	amdgpu_bo_list_for_each_entry(e, list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	amdgpu_bo_list_for_each_entry(e, list)
+		amdgpu_bo_unref(&e->bo);
+	call_rcu(&list->rhead, amdgpu_bo_list_free_rcu);
+}
 
-		amdgpu_bo_unref(&bo);
-	}
+static int amdgpu_bo_list_entry_cmp(const void *_a, const void *_b)
+{
+	const struct amdgpu_bo_list_entry *a = _a, *b = _b;
 
-	call_rcu(&list->rhead, amdgpu_bo_list_free_rcu);
+	if (a->priority > b->priority)
+		return 1;
+	if (a->priority < b->priority)
+		return -1;
+	return 0;
 }
 
 int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
@@ -118,7 +126,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 		entry->priority = min(info[i].bo_priority,
 				      AMDGPU_BO_LIST_MAX_PRIORITY);
-		entry->tv.bo = &bo->tbo;
+		entry->bo = bo;
 
 		if (bo->preferred_domains == AMDGPU_GEM_DOMAIN_GDS)
 			list->gds_obj = bo;
@@ -133,6 +141,8 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 	list->first_userptr = first_userptr;
 	list->num_entries = num_entries;
+	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
+	     amdgpu_bo_list_entry_cmp, NULL);
 
 	trace_amdgpu_cs_bo_status(list->num_entries, total_size);
 
@@ -141,16 +151,10 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	return 0;
 
 error_free:
-	for (i = 0; i < last_entry; ++i) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(array[i].tv.bo);
-
-		amdgpu_bo_unref(&bo);
-	}
-	for (i = first_userptr; i < num_entries; ++i) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(array[i].tv.bo);
-
-		amdgpu_bo_unref(&bo);
-	}
+	for (i = 0; i < last_entry; ++i)
+		amdgpu_bo_unref(&array[i].bo);
+	for (i = first_userptr; i < num_entries; ++i)
+		amdgpu_bo_unref(&array[i].bo);
 	kvfree(list);
 	return r;
 
@@ -182,41 +186,6 @@ int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
 	return -ENOENT;
 }
 
-void amdgpu_bo_list_get_list(struct amdgpu_bo_list *list,
-			     struct list_head *validated)
-{
-	/* This is based on the bucket sort with O(n) time complexity.
-	 * An item with priority "i" is added to bucket[i]. The lists are then
-	 * concatenated in descending order.
-	 */
-	struct list_head bucket[AMDGPU_BO_LIST_NUM_BUCKETS];
-	struct amdgpu_bo_list_entry *e;
-	unsigned i;
-
-	for (i = 0; i < AMDGPU_BO_LIST_NUM_BUCKETS; i++)
-		INIT_LIST_HEAD(&bucket[i]);
-
-	/* Since buffers which appear sooner in the relocation list are
-	 * likely to be used more often than buffers which appear later
-	 * in the list, the sort mustn't change the ordering of buffers
-	 * with the same priority, i.e. it must be stable.
-	 */
-	amdgpu_bo_list_for_each_entry(e, list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-		unsigned priority = e->priority;
-
-		if (!bo->parent)
-			list_add_tail(&e->tv.head, &bucket[priority]);
-
-		e->user_pages = NULL;
-		e->range = NULL;
-	}
-
-	/* Connect the sorted buckets in the output list. */
-	for (i = 0; i < AMDGPU_BO_LIST_NUM_BUCKETS; i++)
-		list_splice(&bucket[i], validated);
-}
-
 void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
 {
 	kref_put(&list->refcount, amdgpu_bo_list_free);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index ededdc01ca28..26c01cb131f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -23,7 +23,6 @@
 #ifndef __AMDGPU_BO_LIST_H__
 #define __AMDGPU_BO_LIST_H__
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/amdgpu_drm.h>
 
 struct hmm_range;
@@ -36,7 +35,7 @@ struct amdgpu_bo_va;
 struct amdgpu_fpriv;
 
 struct amdgpu_bo_list_entry {
-	struct ttm_validate_buffer	tv;
+	struct amdgpu_bo		*bo;
 	struct amdgpu_bo_va		*bo_va;
 	uint32_t			priority;
 	struct page			**user_pages;
@@ -60,8 +59,6 @@ struct amdgpu_bo_list {
 
 int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
 		       struct amdgpu_bo_list **result);
-void amdgpu_bo_list_get_list(struct amdgpu_bo_list *list,
-			     struct list_head *validated);
 void amdgpu_bo_list_put(struct amdgpu_bo_list *list);
 int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 				      struct drm_amdgpu_bo_list_entry **info_param);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 08eced097bd8..9e751f5d4aa7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -65,6 +65,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
 	}
 
 	amdgpu_sync_create(&p->sync);
+	drm_exec_init(&p->exec, true);
 	return 0;
 }
 
@@ -122,7 +123,6 @@ static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
 				   uint32_t *offset)
 {
 	struct drm_gem_object *gobj;
-	struct amdgpu_bo *bo;
 	unsigned long size;
 	int r;
 
@@ -130,21 +130,16 @@ static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
 	if (gobj == NULL)
 		return -EINVAL;
 
-	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
-	p->uf_entry.priority = 0;
-	p->uf_entry.tv.bo = &bo->tbo;
-	/* One for TTM and two for the CS job */
-	p->uf_entry.tv.num_shared = 3;
-
+	p->uf_bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
 	drm_gem_object_put(gobj);
 
-	size = amdgpu_bo_size(bo);
+	size = amdgpu_bo_size(p->uf_bo);
 	if (size != PAGE_SIZE || (data->offset + 8) > size) {
 		r = -EINVAL;
 		goto error_unref;
 	}
 
-	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
+	if (amdgpu_ttm_tt_get_usermm(p->uf_bo->tbo.ttm)) {
 		r = -EINVAL;
 		goto error_unref;
 	}
@@ -154,7 +149,7 @@ static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
 	return 0;
 
 error_unref:
-	amdgpu_bo_unref(&bo);
+	amdgpu_bo_unref(&p->uf_bo);
 	return r;
 }
 
@@ -310,7 +305,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		goto free_all_kdata;
 	}
 
-	if (p->uf_entry.tv.bo)
+	if (p->uf_bo)
 		p->gang_leader->uf_addr = uf_offset;
 	kvfree(chunk_array);
 
@@ -355,7 +350,7 @@ static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
 	ib = &job->ibs[job->num_ibs++];
 
 	/* MM engine doesn't support user fences */
-	if (p->uf_entry.tv.bo && ring->funcs->no_user_fence)
+	if (p->uf_bo && ring->funcs->no_user_fence)
 		return -EINVAL;
 
 	if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
@@ -814,55 +809,18 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	return r;
 }
 
-static int amdgpu_cs_list_validate(struct amdgpu_cs_parser *p,
-			    struct list_head *validated)
-{
-	struct ttm_operation_ctx ctx = { true, false };
-	struct amdgpu_bo_list_entry *lobj;
-	int r;
-
-	list_for_each_entry(lobj, validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(lobj->tv.bo);
-		struct mm_struct *usermm;
-
-		usermm = amdgpu_ttm_tt_get_usermm(bo->tbo.ttm);
-		if (usermm && usermm != current->mm)
-			return -EPERM;
-
-		if (amdgpu_ttm_tt_is_userptr(bo->tbo.ttm) &&
-		    lobj->user_invalidated && lobj->user_pages) {
-			amdgpu_bo_placement_from_domain(bo,
-							AMDGPU_GEM_DOMAIN_CPU);
-			r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-			if (r)
-				return r;
-
-			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm,
-						     lobj->user_pages);
-		}
-
-		r = amdgpu_cs_bo_validate(p, bo);
-		if (r)
-			return r;
-
-		kvfree(lobj->user_pages);
-		lobj->user_pages = NULL;
-	}
-	return 0;
-}
-
 static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct ttm_operation_ctx ctx = { true, false };
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
-	struct list_head duplicates;
+	struct drm_gem_object *obj;
+	unsigned long index;
 	unsigned int i;
 	int r;
 
-	INIT_LIST_HEAD(&p->validated);
-
 	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
 	if (cs->in.bo_list_handle) {
 		if (p->bo_list)
@@ -882,25 +840,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 	mutex_lock(&p->bo_list->bo_list_mutex);
 
-	/* One for TTM and one for the CS job */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 2;
-
-	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
-
-	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
-
-	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
-		list_add(&p->uf_entry.tv.head, &p->validated);
-
 	/* Get userptr backing pages. If pages are updated after registered
 	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
 	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
 	 */
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 		bool userpage_invalidated = false;
+		struct amdgpu_bo *bo = e->bo;
 		int i;
 
 		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
@@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		e->user_invalidated = userpage_invalidated;
 	}
 
-	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
-				   &duplicates);
-	if (unlikely(r != 0)) {
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
-		goto out_free_user_pages;
+	drm_exec_while_not_all_locked(&p->exec) {
+		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
+		drm_exec_continue_on_contention(&p->exec);
+		if (unlikely(r))
+			goto out_free_user_pages;
+
+		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
+			drm_exec_break_on_contention(&p->exec);
+			if (unlikely(r))
+				goto out_free_user_pages;
+
+			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
+			e->range = NULL;
+		}
+		drm_exec_continue_on_contention(&p->exec);
+
+		if (p->uf_bo) {
+			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
+						 2);
+			drm_exec_continue_on_contention(&p->exec);
+			if (unlikely(r))
+				goto out_free_user_pages;
+		}
 	}
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+		struct mm_struct *usermm;
 
-		e->bo_va = amdgpu_vm_bo_find(vm, bo);
+		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
+		if (usermm && usermm != current->mm) {
+			r = -EPERM;
+			goto out_free_user_pages;
+		}
+
+		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
+		    e->user_invalidated && e->user_pages) {
+			amdgpu_bo_placement_from_domain(e->bo,
+							AMDGPU_GEM_DOMAIN_CPU);
+			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
+					    &ctx);
+			if (r)
+				goto out_free_user_pages;
+
+			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
+						     e->user_pages);
+		}
+
+		kvfree(e->user_pages);
+		e->user_pages = NULL;
 	}
 
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
@@ -951,25 +935,21 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 				      amdgpu_cs_bo_validate, p);
 	if (r) {
 		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
-		goto error_validate;
+		goto out_free_user_pages;
 	}
 
-	r = amdgpu_cs_list_validate(p, &duplicates);
-	if (r)
-		goto error_validate;
-
-	r = amdgpu_cs_list_validate(p, &p->validated);
-	if (r)
-		goto error_validate;
-
-	if (p->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
+	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
+		if (unlikely(r))
+			goto out_free_user_pages;
+	}
 
-		r = amdgpu_ttm_alloc_gart(&uf->tbo);
-		if (r)
-			goto error_validate;
+	if (p->uf_bo) {
+		r = amdgpu_ttm_alloc_gart(&p->uf_bo->tbo);
+		if (unlikely(r))
+			goto out_free_user_pages;
 
-		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(uf);
+		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
 	}
 
 	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
@@ -981,12 +961,9 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 					 p->bo_list->oa_obj);
 	return 0;
 
-error_validate:
-	ttm_eu_backoff_reservation(&p->ticket, &p->validated);
-
 out_free_user_pages:
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+		struct amdgpu_bo *bo = e->bo;
 
 		if (!e->user_pages)
 			continue;
@@ -1093,7 +1070,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct amdgpu_bo_va *bo_va;
-	struct amdgpu_bo *bo;
 	unsigned int i;
 	int r;
 
@@ -1122,11 +1098,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	}
 
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		/* ignore duplicates */
-		bo = ttm_to_amdgpu_bo(e->tv.bo);
-		if (!bo)
-			continue;
-
 		bo_va = e->bo_va;
 		if (bo_va == NULL)
 			continue;
@@ -1164,7 +1135,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (amdgpu_vm_debug) {
 		/* Invalidate all BOs to test for userspace bugs */
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+			struct amdgpu_bo *bo = e->bo;
 
 			/* ignore duplicates */
 			if (!bo)
@@ -1181,8 +1152,9 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct drm_gpu_scheduler *sched;
-	struct amdgpu_bo_list_entry *e;
+	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	unsigned long index;
 	unsigned int i;
 	int r;
 
@@ -1193,8 +1165,9 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		return r;
 	}
 
-	list_for_each_entry(e, &p->validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
 		struct dma_resv *resv = bo->tbo.base.resv;
 		enum amdgpu_sync_mode sync_mode;
 
@@ -1258,6 +1231,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
+	struct drm_gem_object *gobj;
+	unsigned long index;
 	unsigned int i;
 	uint64_t seq;
 	int r;
@@ -1296,9 +1271,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	 */
 	r = 0;
 	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-		r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
+		r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm,
+							e->range);
 		e->range = NULL;
 	}
 	if (r) {
@@ -1307,20 +1281,22 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	p->fence = dma_fence_get(&leader->base.s_fence->finished);
-	list_for_each_entry(e, &p->validated, tv.head) {
+	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
+
+		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
 
 		/* Everybody except for the gang leader uses READ */
 		for (i = 0; i < p->gang_size; ++i) {
 			if (p->jobs[i] == leader)
 				continue;
 
-			dma_resv_add_fence(e->tv.bo->base.resv,
+			dma_resv_add_fence(gobj->resv,
 					   &p->jobs[i]->base.s_fence->finished,
 					   DMA_RESV_USAGE_READ);
 		}
 
-		/* The gang leader is remembered as writer */
-		e->tv.num_shared = 0;
+		/* The gang leader as remembered as writer */
+		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
 	}
 
 	seq = amdgpu_ctx_add_fence(p->ctx, p->entities[p->gang_leader_idx],
@@ -1336,7 +1312,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	cs->out.handle = seq;
 	leader->uf_sequence = seq;
 
-	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
+	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
 	for (i = 0; i < p->gang_size; ++i) {
 		amdgpu_job_free_resources(p->jobs[i]);
 		trace_amdgpu_cs_ioctl(p->jobs[i]);
@@ -1345,7 +1321,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
-	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 
 	mutex_unlock(&p->adev->notifier_lock);
 	mutex_unlock(&p->bo_list->bo_list_mutex);
@@ -1366,6 +1341,8 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 	unsigned i;
 
 	amdgpu_sync_free(&parser->sync);
+	drm_exec_fini(&parser->exec);
+
 	for (i = 0; i < parser->num_post_deps; i++) {
 		drm_syncobj_put(parser->post_deps[i].syncobj);
 		kfree(parser->post_deps[i].chain);
@@ -1386,11 +1363,7 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 		if (parser->jobs[i])
 			amdgpu_job_free(parser->jobs[i]);
 	}
-	if (parser->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(parser->uf_entry.tv.bo);
-
-		amdgpu_bo_unref(&uf);
-	}
+	amdgpu_bo_unref(&parser->uf_bo);
 }
 
 int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
@@ -1451,7 +1424,6 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	return 0;
 
 error_backoff:
-	ttm_eu_backoff_reservation(&parser.ticket, &parser.validated);
 	mutex_unlock(&parser.bo_list->bo_list_mutex);
 
 error_fini:
@@ -1786,7 +1758,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
 	*map = mapping;
 
 	/* Double check that the BO is reserved by this CS */
-	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->ticket)
+	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->exec.ticket)
 		return -EINVAL;
 
 	if (!((*bo)->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index fb3e3d56d427..39c33ad100cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -24,6 +24,7 @@
 #define __AMDGPU_CS_H__
 
 #include <linux/ww_mutex.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_job.h"
 #include "amdgpu_bo_list.h"
@@ -62,11 +63,9 @@ struct amdgpu_cs_parser {
 	struct amdgpu_job	*gang_leader;
 
 	/* buffer objects */
-	struct ww_acquire_ctx		ticket;
+	struct drm_exec			exec;
 	struct amdgpu_bo_list		*bo_list;
 	struct amdgpu_mn		*mn;
-	struct amdgpu_bo_list_entry	vm_pd;
-	struct list_head		validated;
 	struct dma_fence		*fence;
 	uint64_t			bytes_moved_threshold;
 	uint64_t			bytes_moved_vis_threshold;
@@ -74,7 +73,7 @@ struct amdgpu_cs_parser {
 	uint64_t			bytes_moved_vis;
 
 	/* user fence */
-	struct amdgpu_bo_list_entry	uf_entry;
+	struct amdgpu_bo		*uf_bo;
 
 	unsigned			num_post_deps;
 	struct amdgpu_cs_post_dep	*post_deps;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 594442d23242..1dbe75b008a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -313,28 +313,6 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 	amdgpu_vm_bo_evicted(base);
 }
 
-/**
- * amdgpu_vm_get_pd_bo - add the VM PD to a validation list
- *
- * @vm: vm providing the BOs
- * @validated: head of validation list
- * @entry: entry to add
- *
- * Add the page directory to the list of BOs to
- * validate for command submission.
- */
-void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
-			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry)
-{
-	entry->priority = 0;
-	entry->tv.bo = &vm->root.bo->tbo;
-	/* Two for VM updates, one for TTM and one for the CS job */
-	entry->tv.num_shared = 4;
-	entry->user_pages = NULL;
-	list_add(&entry->tv.head, validated);
-}
-
 /**
  * amdgpu_vm_lock_pd - lock PD in drm_exec
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index ed987f73e3a6..38902fbce8f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -389,9 +389,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
-void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
-			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry);
 int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.34.1

