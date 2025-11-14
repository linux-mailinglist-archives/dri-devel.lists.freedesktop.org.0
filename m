Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EEC5EE9A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 19:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0FA10E275;
	Fri, 14 Nov 2025 18:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="DxWec65e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com
 [209.85.221.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A3410E275
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 18:47:11 +0000 (UTC)
Received: by mail-vk1-f226.google.com with SMTP id
 71dfb90a1353d-559836d04f6so1506838e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 10:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763146030; x=1763750830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8JGkoxTeKr4qSjbqBvDZD4zUKhRx3fGe1mdM2SN/j7I=;
 b=J3sA6AiVXz30lzAXV3uNBgcMcsqUXS1lQLft6f8AsgTq4lOyzocTCsbh54tIb1xIbQ
 gu+Jw+yy00munetDwa3uJDAJJtPbnrAg3gUbeREyHtLHcA5chQ6k/K43snSChlW+sdvB
 fV2tMRrpVEA2X53pivcueOepqUg07FPX80E4YDPcrTG/uBRMtPwsIEWfabNVnc4rLGQW
 zgoSYSIVRMkqeTiYeGkYjG4tUVFp9QzhhTD//TOI5WWRskN8FSkLJMcubWK8u0MuSQZB
 KCSh30PL0JLARCuF8f0ekljmeLuTun5LJYuxxDzNIibTUwU+wc20qL+Ndq4di6bXt6yO
 e2Yg==
X-Gm-Message-State: AOJu0Ywsw86iUF603OK2TIOGS4fIMOT+IKMbnVp/oVoqQhfh3sLXP1IC
 lgXNrK+qiF4qp+9XApFuV+ds3Jm7K/XTlm2mHJ/DiGnKVYREe8p5036pXbivsYxjwoca5WRe+np
 vLd5A+Z51Hpoeh5w5kBPa6eO4SxHXieCbYZyNrRS6LQVBSkt74FK/w0NXSCgPTMmqxF8je2Kbld
 rbxu0lHcUPe0gIksPVm1+49cz/64N9qK3nVC9Xjq+lqGZJ0Lua+lXGrI1WZDnezVN+yofGIJglz
 M7WLzLQXax9A++cRehz
X-Gm-Gg: ASbGncv3tBPH8ar+cZJpBGK/FR5YbEMHHWk5wO6rB1uLwMFGtyBJLxKDR4SaDo8SpTc
 ThxjqMjsB2m47TGC2MEz9sL14neBzVd/DtyYwsqQaZVUJntKHR88Zx9d6h29atvdt+XdHmd7jkE
 c+XlLaO6gWztp6Iagcanv7WUsSfZ4oYrmHfsonnd3ZL5G8n0e3zgbw0T5Ng5B4dX+23mTDHDdSz
 N43KnCvzMeEoSvldzXZe+8dK7DgeyUd0MLtdR8epO/2ZYRQGMThUBJUHMAezh8N7PiVB/vgiVXz
 iM8WH32KejwgkZqVjwvzsnEqL7kJqL8CMV6oFQ6oiQhBI5rqdanUPcLVjTQVWiOUer+/P0u0xKq
 cLO4yKTqQGA8KbyKBIZhdzhBoAH0/izUv/ZxS3+SdbH9+JWeFYIZ2TxzADMVadlhvDCx0CicqEt
 KkEInhzxpyOFLn3Ch/EGQVxxekdXCwgAkf9A==
X-Google-Smtp-Source: AGHT+IHmGupsTWhMDxQp4mq7uBMKGgjbqVc9vXmTIwSSC8c25Zq56N5QkWRdeIFz8njsz9Nq1t96ox6RQEhf
X-Received: by 2002:a05:6122:8c27:b0:557:98ab:8a27 with SMTP id
 71dfb90a1353d-55b1bccc081mr1760202e0c.3.1763146030190; 
 Fri, 14 Nov 2025 10:47:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-55b0f48ca70sm658782e0c.7.2025.11.14.10.47.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Nov 2025 10:47:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b630b4d8d52so2012915a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 10:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1763146028; x=1763750828;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8JGkoxTeKr4qSjbqBvDZD4zUKhRx3fGe1mdM2SN/j7I=;
 b=DxWec65e561dkXLY9UiBX+qL+H8K6Swy6tb2X4ju4S1fSCHpKy9Prh8QY1W6bVg2du
 YJdu1xsCZ5ibxMin5iFsXq+cH72RNN9XwRjeaVguONHE5WpohvGFZ9aDeMqR/j+qIBke
 eputzqNss9LDS/Mg264rlQlvF+0QvgYryV4H8=
X-Received: by 2002:a05:7023:a82:b0:119:e56b:91f5 with SMTP id
 a92af1059eb24-11b41407573mr1054978c88.38.1763146028048; 
 Fri, 14 Nov 2025 10:47:08 -0800 (PST)
X-Received: by 2002:a05:7023:a82:b0:119:e56b:91f5 with SMTP id
 a92af1059eb24-11b41407573mr1054961c88.38.1763146027290; 
 Fri, 14 Nov 2025 10:47:07 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885d8sm12223106c88.2.2025.11.14.10.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 10:47:06 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2] drm/vmwgfx: Move the validation duplicates hashtable onto
 the stack
Date: Fri, 14 Nov 2025 12:38:20 -0600
Message-ID: <20251114184702.1909989-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

This hashtable is only used under a lock in vmw_execbuf_process and needs
to be cleared before vmw_execbuf_process returns otherwise bad things
happen because the nodes that are stored in the table come from an arena
allocator that is cleared at the end of the function.

Rather than wasting time cleaning up the hashtable move it onto the stack
so we don't have to do any cleanup.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---

v2:
 - remove sw_context from the validation context

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  9 --
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    |  7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 98 ++++------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h | 18 ++--
 8 files changed, 32 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index abceffea3683..3ac9eb8a2e21 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -814,13 +814,6 @@ static void vmw_write_driver_id(struct vmw_private *dev)
 	}
 }
 
-static void vmw_sw_context_init(struct vmw_private *dev_priv)
-{
-	struct vmw_sw_context *sw_context = &dev_priv->ctx;
-
-	hash_init(sw_context->res_ht);
-}
-
 static void vmw_sw_context_fini(struct vmw_private *dev_priv)
 {
 	struct vmw_sw_context *sw_context = &dev_priv->ctx;
@@ -836,8 +829,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	enum vmw_res_type i;
 	bool refuse_dma = false;
 
-	vmw_sw_context_init(dev_priv);
-
 	mutex_init(&dev_priv->cmdbuf_mutex);
 	mutex_init(&dev_priv->binding_mutex);
 	spin_lock_init(&dev_priv->resource_lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 62db3f3f3aa0..f7c760d72b85 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -79,7 +79,6 @@
 #define VMW_RES_STREAM ttm_driver_type2
 #define VMW_RES_FENCE ttm_driver_type3
 #define VMW_RES_SHADER ttm_driver_type4
-#define VMW_RES_HT_ORDER 12
 
 #define MKSSTAT_CAPACITY_LOG2 5U
 #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
@@ -348,7 +347,6 @@ struct vmw_ctx_validation_info;
 
 /**
  * struct vmw_sw_context - Command submission context
- * @res_ht: Pointer hash table used to find validation duplicates
  * @kernel: Whether the command buffer originates from kernel code rather
  * than from user-space
  * @fp: If @kernel is false, points to the file of the client. Otherwise
@@ -378,7 +376,6 @@ struct vmw_ctx_validation_info;
  * @ctx: The validation context
  */
 struct vmw_sw_context{
-	DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
 	bool kernel;
 	struct vmw_fpriv *fp;
 	struct drm_file *filp;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 3057f8baa7d2..3a211baa8b88 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4094,7 +4094,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 	int ret;
 	int32_t out_fence_fd = -1;
 	struct sync_file *sync_file = NULL;
-	DECLARE_VAL_CONTEXT(val_ctx, sw_context, 1);
+	DECLARE_VAL_CONTEXT(val_ctx, 1);
 
 	if (flags & DRM_VMW_EXECBUF_FLAG_EXPORT_FENCE_FD) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
@@ -4184,8 +4184,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 	if (unlikely(ret != 0))
 		goto out_err;
 
-	vmw_validation_drop_ht(&val_ctx);
-
 	ret = mutex_lock_interruptible(&dev_priv->binding_mutex);
 	if (unlikely(ret != 0)) {
 		ret = -ERESTARTSYS;
@@ -4294,7 +4292,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 		__vmw_execbuf_release_pinned_bo(dev_priv, NULL);
 out_unlock:
 	vmw_cmdbuf_res_revert(&sw_context->staged_cmd_res);
-	vmw_validation_drop_ht(&val_ctx);
 	WARN_ON(!list_empty(&sw_context->ctx_list));
 	mutex_unlock(&dev_priv->cmdbuf_mutex);
 
@@ -4363,7 +4360,7 @@ void __vmw_execbuf_release_pinned_bo(struct vmw_private *dev_priv,
 {
 	int ret = 0;
 	struct vmw_fence_obj *lfence = NULL;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 
 	if (dev_priv->pinned_bo == NULL)
 		goto out_unlock;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 07f2a5ead34b..4446f25e526d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1739,7 +1739,7 @@ int vmw_du_helper_plane_update(struct vmw_du_update_plane *update)
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect clip;
 	struct drm_rect bb;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 	uint32_t reserved_size = 0;
 	uint32_t submit_size = 0;
 	uint32_t curr_size = 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 5f5f5a94301f..4e85ba5206ae 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -1104,7 +1104,7 @@ int vmw_kms_sou_do_surface_dirty(struct vmw_private *dev_priv,
 	struct vmw_framebuffer_surface *vfbs =
 		container_of(framebuffer, typeof(*vfbs), base);
 	struct vmw_kms_sou_surface_dirty sdirty;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 	int ret;
 
 	if (!srf)
@@ -1219,7 +1219,7 @@ int vmw_kms_sou_do_bo_dirty(struct vmw_private *dev_priv,
 		container_of(framebuffer, struct vmw_framebuffer_bo,
 			     base)->buffer;
 	struct vmw_kms_dirty dirty;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 	int ret;
 
 	vmw_bo_placement_set(buf, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
@@ -1327,7 +1327,7 @@ int vmw_kms_sou_readback(struct vmw_private *dev_priv,
 	struct vmw_bo *buf =
 		container_of(vfb, struct vmw_framebuffer_bo, base)->buffer;
 	struct vmw_kms_dirty dirty;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 	int ret;
 
 	vmw_bo_placement_set(buf, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 37cb742ba1d9..faacfef7baa5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -566,7 +566,7 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
 		container_of(vfb, struct vmw_framebuffer_bo, base)->buffer;
 	struct vmw_stdu_dirty ddirty;
 	int ret;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 
 	/*
 	 * The GMR domain might seem confusing because it might seem like it should
@@ -733,7 +733,7 @@ int vmw_kms_stdu_surface_dirty(struct vmw_private *dev_priv,
 	struct vmw_framebuffer_surface *vfbs =
 		container_of(framebuffer, typeof(*vfbs), base);
 	struct vmw_stdu_dirty sdirty;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
+	DECLARE_VAL_CONTEXT(val_ctx, 0);
 	int ret;
 
 	if (!srf)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index 35dc94c3db39..508809712398 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -162,24 +162,13 @@ vmw_validation_find_bo_dup(struct vmw_validation_context *ctx,
 	if (!ctx->merge_dups)
 		return NULL;
 
-	if (ctx->sw_context) {
-		struct vmwgfx_hash_item *hash;
-		unsigned long key = (unsigned long) vbo;
-
-		hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash, head, key) {
-			if (hash->key == key) {
-				bo_node = container_of(hash, typeof(*bo_node), hash);
-				break;
-			}
-		}
-	} else {
-		struct  vmw_validation_bo_node *entry;
+	struct vmwgfx_hash_item *hash;
+	unsigned long key = (unsigned long)vbo;
 
-		list_for_each_entry(entry, &ctx->bo_list, base.head) {
-			if (entry->base.bo == &vbo->tbo) {
-				bo_node = entry;
-				break;
-			}
+	hash_for_each_possible(ctx->res_ht, hash, head, key) {
+		if (hash->key == key) {
+			bo_node = container_of(hash, typeof(*bo_node), hash);
+			break;
 		}
 	}
 
@@ -204,35 +193,15 @@ vmw_validation_find_res_dup(struct vmw_validation_context *ctx,
 	if (!ctx->merge_dups)
 		return NULL;
 
-	if (ctx->sw_context) {
-		struct vmwgfx_hash_item *hash;
-		unsigned long key = (unsigned long) res;
-
-		hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash, head, key) {
-			if (hash->key == key) {
-				res_node = container_of(hash, typeof(*res_node), hash);
-				break;
-			}
-		}
-	} else {
-		struct  vmw_validation_res_node *entry;
-
-		list_for_each_entry(entry, &ctx->resource_ctx_list, head) {
-			if (entry->res == res) {
-				res_node = entry;
-				goto out;
-			}
-		}
+	struct vmwgfx_hash_item *hash;
+	unsigned long key = (unsigned long)res;
 
-		list_for_each_entry(entry, &ctx->resource_list, head) {
-			if (entry->res == res) {
-				res_node = entry;
-				break;
-			}
+	hash_for_each_possible(ctx->res_ht, hash, head, key) {
+		if (hash->key == key) {
+			res_node = container_of(hash, typeof(*res_node), hash);
+			break;
 		}
-
 	}
-out:
 	return res_node;
 }
 
@@ -256,10 +225,9 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 		if (!bo_node)
 			return -ENOMEM;
 
-		if (ctx->sw_context) {
+		if (ctx->merge_dups) {
 			bo_node->hash.key = (unsigned long) vbo;
-			hash_add_rcu(ctx->sw_context->res_ht, &bo_node->hash.head,
-				bo_node->hash.key);
+			hash_add(ctx->res_ht, &bo_node->hash.head, bo_node->hash.key);
 		}
 		val_buf = &bo_node->base;
 		vmw_bo_reference(vbo);
@@ -303,13 +271,13 @@ int vmw_validation_add_resource(struct vmw_validation_context *ctx,
 		return -ENOMEM;
 	}
 
-	if (ctx->sw_context) {
+	if (ctx->merge_dups) {
 		node->hash.key = (unsigned long) res;
-		hash_add_rcu(ctx->sw_context->res_ht, &node->hash.head, node->hash.key);
+		hash_add(ctx->res_ht, &node->hash.head, node->hash.key);
 	}
 	node->res = vmw_resource_reference_unless_doomed(res);
 	if (!node->res) {
-		hash_del_rcu(&node->hash.head);
+		hash_del(&node->hash.head);
 		return -ESRCH;
 	}
 
@@ -611,38 +579,6 @@ int vmw_validation_res_validate(struct vmw_validation_context *ctx, bool intr)
 	return 0;
 }
 
-/**
- * vmw_validation_drop_ht - Reset the hash table used for duplicate finding
- * and unregister it from this validation context.
- * @ctx: The validation context.
- *
- * The hash table used for duplicate finding is an expensive resource and
- * may be protected by mutexes that may cause deadlocks during resource
- * unreferencing if held. After resource- and buffer object registering,
- * there is no longer any use for this hash table, so allow freeing it
- * either to shorten any mutex locking time, or before resources- and
- * buffer objects are freed during validation context cleanup.
- */
-void vmw_validation_drop_ht(struct vmw_validation_context *ctx)
-{
-	struct vmw_validation_bo_node *entry;
-	struct vmw_validation_res_node *val;
-
-	if (!ctx->sw_context)
-		return;
-
-	list_for_each_entry(entry, &ctx->bo_list, base.head)
-		hash_del_rcu(&entry->hash.head);
-
-	list_for_each_entry(val, &ctx->resource_list, head)
-		hash_del_rcu(&val->hash.head);
-
-	list_for_each_entry(val, &ctx->resource_ctx_list, head)
-		hash_del_rcu(&val->hash.head);
-
-	ctx->sw_context = NULL;
-}
-
 /**
  * vmw_validation_unref_lists - Unregister previously registered buffer
  * object and resources.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 353d837907d8..9f48bc0fad38 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -37,10 +37,11 @@
 #define VMW_RES_DIRTY_NONE 0
 #define VMW_RES_DIRTY_SET BIT(0)
 #define VMW_RES_DIRTY_CLEAR BIT(1)
+#define VMW_RES_HT_ORDER 7
 
 /**
  * struct vmw_validation_context - Per command submission validation context
- * @ht: Hash table used to find resource- or buffer object duplicates
+ * @res_ht: Hash table used to find resource- or buffer object duplicates
  * @resource_list: List head for resource validation metadata
  * @resource_ctx_list: List head for resource validation metadata for
  * resources that need to be validated before those in @resource_list
@@ -54,7 +55,7 @@
  * @page_address: Kernel virtual address of the last page in @page_list
  */
 struct vmw_validation_context {
-	struct vmw_sw_context *sw_context;
+	DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
 	struct list_head resource_list;
 	struct list_head resource_ctx_list;
 	struct list_head bo_list;
@@ -70,20 +71,15 @@ struct vmw_bo;
 struct vmw_resource;
 struct vmw_fence_obj;
 
-#if 0
 /**
  * DECLARE_VAL_CONTEXT - Declare a validation context with initialization
  * @_name: The name of the variable
- * @_sw_context: Contains the hash table used to find dups or NULL if none
- * @_merge_dups: Whether to merge duplicate buffer object- or resource
- * entries. If set to true, ideally a hash table pointer should be supplied
- * as well unless the number of resources and buffer objects per validation
- * is known to be very small
+ * @_merge_dups: Whether to merge duplicate buffer objects or resource entries.
  */
-#endif
-#define DECLARE_VAL_CONTEXT(_name, _sw_context, _merge_dups)		\
+
+#define DECLARE_VAL_CONTEXT(_name, _merge_dups)				\
 	struct vmw_validation_context _name =				\
-	{ .sw_context = _sw_context,					\
+	{ .res_ht = {},							\
 	  .resource_list = LIST_HEAD_INIT((_name).resource_list),	\
 	  .resource_ctx_list = LIST_HEAD_INIT((_name).resource_ctx_list), \
 	  .bo_list = LIST_HEAD_INIT((_name).bo_list),			\
-- 
2.51.1

