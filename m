Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59070BA501D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 21:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CED10EADB;
	Fri, 26 Sep 2025 19:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="bWERDzCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com
 [209.85.214.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FB910EAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 19:54:42 +0000 (UTC)
Received: by mail-pl1-f227.google.com with SMTP id
 d9443c01a7336-2698e4795ebso26067675ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758916482; x=1759521282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WrtUYuMNmwfBmZ1ARChhzNskfzPCo3hlTDOo+3D4HQg=;
 b=leoyaATMnX/WyKP6dotlv59auL5iWV8JDzUF+leAWWAuFGaD28Brn6s7ODnWZyCXOC
 EL+klQtUEz/oWj8DSeMOU4w+5wLIK63GDq1siAUs0tFSODRpIMe3jdXvp1cLWF319Ik6
 GmynNDx+TCjp/1GRQFSqgCLCRbbRUF1gmSXPFq317UOyu7SYpCuZubPqCq/pYkgw8ZI3
 NVi9KkLxileBFNr3e+bZmfND1pGaAzlR0t1V0E4k9fiPbR+0I+22DwgS67u8LqmTF2CD
 j0903Ii8feGXir5ca7Ssm3ZKz6/fmEUzK1bdvYgMX1SbSfYFSMkE9z5Tlg3itilphHXr
 5KYQ==
X-Gm-Message-State: AOJu0YyR36MPvhbiWYMewvTg2jXNVMkEAlA3IvetEopEjAEJ4mIsniST
 TPn0aldhN6gxHCNs3qoegu7QB8F18KAjcz9e3zg/j7uwGK94S5zO1RsKTR6qp4RwjdJGuP0WGEa
 daN8lBk4E00HhWsT6V4GowCVbyx2RUSQ3oRME0QWiMDW5AeRijbzJ+qpPajrtBcdSv9ZRPgzYFF
 h0aUH8Ad6rdvqPKqCxB0+dwG6JEjSwmQNetiJVztecD3KKynUiH8MXxWSwfyNd36zw6L1XCuUYN
 pmaJkkKVlp2qDSM+DUl
X-Gm-Gg: ASbGnctY72Bx85Ua9cgWRHhlBhcBusBvsM/FEVHI1YpAkNiOv7tj9IbpgwAAzJSZURH
 a49SQs3I+HXGZfiqqHYJ2Dd+QH0b63rTX9CQYKnAopd4XmpNxEDmCesjkn0CzDPkH52Lg/YUy8e
 x7De/j8x2F1MitGyI2CiJ8CLe6Z63fVb3WnlMYU3+vBd3p94Wgz2KAHQ5698iM5Bz6HMZiQkxao
 jprcY+tI4JwZqMVUHS18gREdrh65VTjTYosjAb43UOc7aJsrPcVyrBSBXBvyzR1mu/pGhwfX6yD
 JDkjFHqE/GH0bbAiVAah8kQNS0odlSbavdTkua5iizLUDeJ4zBpTVv80jPxP4t7Sc2HP/zjfzfb
 D0A7h2h2yFmTm30g2PwNML6rQJCyXOfrIt7Y9NnGOplsuViJsTxAq9Ebde6amqip/v8Fi5FPS
X-Google-Smtp-Source: AGHT+IHgtdIkkgDe2RpVFOg75iYhEW5Z/gLcI62I7kCDVBuz6Udbk9+mqEHVl/fjpTaBoIz8mAq4F1NMBm+9
X-Received: by 2002:a17:903:2b05:b0:274:746c:b09 with SMTP id
 d9443c01a7336-27ed4a89201mr86722275ad.55.1758916481591; 
 Fri, 26 Sep 2025 12:54:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-27eda7f1331sm3873665ad.26.2025.09.26.12.54.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Sep 2025 12:54:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7916b05b94bso74482126d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1758916480; x=1759521280;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrtUYuMNmwfBmZ1ARChhzNskfzPCo3hlTDOo+3D4HQg=;
 b=bWERDzCxRYS3uqbh0bm7fb2a0xBOBPQuqg9ON/7gRr5QZ2DyGCOXVfTUgpEqehP+8L
 xV880vhzLVO7xXvnodCCG0ZU3ya3yTiilFFkx5y2GO0nUZVRaIaS6P3dKfBNq5hvpwu/
 ZBKWCesXajiIIOqeiDEWFIJfFXKd9MJVNRcOE=
X-Received: by 2002:a05:6214:27e6:b0:7ea:50f9:3e7f with SMTP id
 6a1803df08f44-7fc28741d7dmr121368026d6.11.1758916479919; 
 Fri, 26 Sep 2025 12:54:39 -0700 (PDT)
X-Received: by 2002:a05:6214:27e6:b0:7ea:50f9:3e7f with SMTP id
 6a1803df08f44-7fc28741d7dmr121367736d6.11.1758916479383; 
 Fri, 26 Sep 2025 12:54:39 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8016ce9a3cbsm31004076d6.56.2025.09.26.12.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 12:54:38 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, maaz.mombasawala@broadcom.com,
 zack.rusin@broadcom.com, praveen.singh@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 3/3] drm/vmwgfx: Move the validation duplicates hashtable onto
 the stack
Date: Fri, 26 Sep 2025 14:54:27 -0500
Message-ID: <20250926195427.1405237-3-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926195427.1405237-1-ian.forbes@broadcom.com>
References: <20250926195427.1405237-1-ian.forbes@broadcom.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  9 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  3 --
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    |  3 --
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 43 +++-------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h |  5 ++-
 5 files changed, 9 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8ff958d119be..4b53d751b0e0 100644
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
index eda5b6f8f4c4..e8004a0a68c9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -78,7 +78,6 @@
 #define VMW_RES_STREAM ttm_driver_type2
 #define VMW_RES_FENCE ttm_driver_type3
 #define VMW_RES_SHADER ttm_driver_type4
-#define VMW_RES_HT_ORDER 12
 
 #define MKSSTAT_CAPACITY_LOG2 5U
 #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
@@ -347,7 +346,6 @@ struct vmw_ctx_validation_info;
 
 /**
  * struct vmw_sw_context - Command submission context
- * @res_ht: Pointer hash table used to find validation duplicates
  * @kernel: Whether the command buffer originates from kernel code rather
  * than from user-space
  * @fp: If @kernel is false, points to the file of the client. Otherwise
@@ -377,7 +375,6 @@ struct vmw_ctx_validation_info;
  * @ctx: The validation context
  */
 struct vmw_sw_context{
-	DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
 	bool kernel;
 	struct vmw_fpriv *fp;
 	struct drm_file *filp;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 819704ac675d..6a7a9fc13a7f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4172,8 +4172,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 	if (unlikely(ret != 0))
 		goto out_err;
 
-	vmw_validation_drop_ht(&val_ctx);
-
 	ret = mutex_lock_interruptible(&dev_priv->binding_mutex);
 	if (unlikely(ret != 0)) {
 		ret = -ERESTARTSYS;
@@ -4282,7 +4280,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 		__vmw_execbuf_release_pinned_bo(dev_priv, NULL);
 out_unlock:
 	vmw_cmdbuf_res_revert(&sw_context->staged_cmd_res);
-	vmw_validation_drop_ht(&val_ctx);
 	WARN_ON(!list_empty(&sw_context->ctx_list));
 	mutex_unlock(&dev_priv->cmdbuf_mutex);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index 35dc94c3db39..1da7dbef905f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -166,7 +166,7 @@ vmw_validation_find_bo_dup(struct vmw_validation_context *ctx,
 		struct vmwgfx_hash_item *hash;
 		unsigned long key = (unsigned long) vbo;
 
-		hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash, head, key) {
+		hash_for_each_possible(ctx->res_ht, hash, head, key) {
 			if (hash->key == key) {
 				bo_node = container_of(hash, typeof(*bo_node), hash);
 				break;
@@ -208,7 +208,7 @@ vmw_validation_find_res_dup(struct vmw_validation_context *ctx,
 		struct vmwgfx_hash_item *hash;
 		unsigned long key = (unsigned long) res;
 
-		hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash, head, key) {
+		hash_for_each_possible(ctx->res_ht, hash, head, key) {
 			if (hash->key == key) {
 				res_node = container_of(hash, typeof(*res_node), hash);
 				break;
@@ -258,8 +258,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 
 		if (ctx->sw_context) {
 			bo_node->hash.key = (unsigned long) vbo;
-			hash_add_rcu(ctx->sw_context->res_ht, &bo_node->hash.head,
-				bo_node->hash.key);
+			hash_add(ctx->res_ht, &bo_node->hash.head, bo_node->hash.key);
 		}
 		val_buf = &bo_node->base;
 		vmw_bo_reference(vbo);
@@ -305,11 +304,11 @@ int vmw_validation_add_resource(struct vmw_validation_context *ctx,
 
 	if (ctx->sw_context) {
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
 
@@ -611,38 +610,6 @@ int vmw_validation_res_validate(struct vmw_validation_context *ctx, bool intr)
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
index 353d837907d8..2b82a1a3110d 100644
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
@@ -55,6 +56,7 @@
  */
 struct vmw_validation_context {
 	struct vmw_sw_context *sw_context;
+	DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
 	struct list_head resource_list;
 	struct list_head resource_ctx_list;
 	struct list_head bo_list;
@@ -84,6 +86,7 @@ struct vmw_fence_obj;
 #define DECLARE_VAL_CONTEXT(_name, _sw_context, _merge_dups)		\
 	struct vmw_validation_context _name =				\
 	{ .sw_context = _sw_context,					\
+	  .res_ht = {},							\
 	  .resource_list = LIST_HEAD_INIT((_name).resource_list),	\
 	  .resource_ctx_list = LIST_HEAD_INIT((_name).resource_ctx_list), \
 	  .bo_list = LIST_HEAD_INIT((_name).bo_list),			\
-- 
2.51.0

