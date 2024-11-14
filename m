Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC09C8E0F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B3F10E808;
	Thu, 14 Nov 2024 15:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LFmSqZ53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B0A10E804;
 Thu, 14 Nov 2024 15:30:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso994874a12.3; 
 Thu, 14 Nov 2024 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731598226; x=1732203026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ErkItQWaM7N0kJs1XM7K7VUauKrmuIWKKvWHFPQ8Fxo=;
 b=LFmSqZ53Eaa7WtPJm3gwF+TcIIUtsl+aTHQltl4XTyG8dCoxSpBw6+RmqbQu+zA6/w
 sDkwTxal/ng3bmWZW8n6JkgPBVpoJ/KbrZJ4T6G+8PxlEC7d2Fhu86Yk0w31SHie6G9x
 pz8HovnLIjJSJ2+vVvDroPCc5k3iZbCK8WakYSNBT7sybPEQelePZwOwa8jqXHdhaLjF
 hTuDlJmBGNDOZpnOzxJ4PEc0yTNSep98GajxKgwQ6tXWim1WCHqHsHtu8t5VadRHkyVQ
 wnwzxN8u6SDCgUsfQgzR6COWtLdhbcgMT2dLUaGgdBYodI4RbyEIYE0/ez3exdQWd1ef
 +gQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598226; x=1732203026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ErkItQWaM7N0kJs1XM7K7VUauKrmuIWKKvWHFPQ8Fxo=;
 b=SOdxRpmExmzktxYjXR1Yewv7dldZbYHHwsKu0TWb/Y0SGiOVYFYXAsfyqBEnC+cseI
 v3KmPJFszFFcl3RjLK97Ic5zVWxHQp1uNS04E6Cb/7Y8Bl5PVwTvt6KfPT8gntL4lRS4
 HsgNw0lcPPhLOTfpV/jZL2i51Zk7wkLOliq1LYtftLNK2jaZ5lfXw9lxTm19K/ROipis
 mH3tX724pamiASyuaUjVotM/cUNcc+2y/oF9gyHRJ8jnylcUgBHz1YpCdtLBX4od7Rv+
 WNw/DwAknIlVjgo32ivxlx3dSvYN12lNmsa4Hbih9i6kZq5EEdSfCdqCQWHprVLUawAu
 x09A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWv2sw6jfhP+8ZnUzxh9k+lv78N+LkFaqrAzu9WHKkkCmHOpdgvNjH5msojZjpaTOcp2PYv8U4chsU@lists.freedesktop.org,
 AJvYcCVq0UTPKt3wtSMvvYiIGzqKcEHMjroR/FgT0c6b3dr8zCiPeyHusctGzi6T4n38VOTzJBOUQjoT@lists.freedesktop.org,
 AJvYcCWMtykfF6vPRUfot5aRC3/zpUHcixFleujovVCU1mukRoYAXHPv6n3Cv1ns45nb7wHpwY8xB0toXJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu37o7TRgiw/aj1edCDxLmV4n0cm/zGmLgi16WhpDlQfEm6Ikw
 OEbIoesLOB6+611EBNReRN3sAXvyIAtsZB4+dE1fUGt2hLvFSL73
X-Google-Smtp-Source: AGHT+IGKBHvOM3gtxZsaJmGYhSp9T6ZeHIjigD32WAn1nmdVm1JMzdHnWbyDWVbKR4ezf9kLUGd1BQ==
X-Received: by 2002:a17:907:5cb:b0:a9a:1792:f1a with SMTP id
 a640c23a62f3a-aa1f8043f6amr652788066b.7.1731598226120; 
 Thu, 14 Nov 2024 07:30:26 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c9:2500:bb23:40f5:fe29:201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046919sm74063266b.156.2024.11.14.07.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:30:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/7] drm/vmwgfx: start to phase out ttm_exec
Date: Thu, 14 Nov 2024 16:30:16 +0100
Message-Id: <20241114153020.6209-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114153020.6209-1-christian.koenig@amd.com>
References: <20241114153020.6209-1-christian.koenig@amd.com>
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

Start switching over vmwgfx to drm_exec as well. Replacing some
unnecessary complex calls with just just single BO dma_resv locking.

No intentional functional change, but only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 49 ++++++++----------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index a73af8a355fb..793293b59d43 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -517,7 +517,7 @@ static int
 vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 			  struct vmw_resource *res,
 			  bool interruptible,
-			  struct ttm_validate_buffer *val_buf)
+			  struct ttm_buffer_object **bo)
 {
 	struct ttm_operation_ctx ctx = { true, false };
 	struct list_head val_list;
@@ -532,10 +532,12 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 
 	INIT_LIST_HEAD(&val_list);
 	ttm_bo_get(&res->guest_memory_bo->tbo);
-	val_buf->bo = &res->guest_memory_bo->tbo;
-	val_buf->num_shared = 0;
-	list_add_tail(&val_buf->head, &val_list);
-	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
+
+	*bo = &res->guest_memory_bo->tbo;
+	if (ticket)
+		ww_acquire_init(ticket, &reservation_ww_class);
+
+	ret = ttm_bo_reserve(*bo, interruptible, (ticket == NULL), ticket);
 	if (unlikely(ret != 0))
 		goto out_no_reserve;
 
@@ -555,10 +557,11 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	return 0;
 
 out_no_validate:
-	ttm_eu_backoff_reservation(ticket, &val_list);
+	dma_resv_unlock((*bo)->base.resv);
+	if (ticket)
+		ww_acquire_fini(ticket);
 out_no_reserve:
-	ttm_bo_put(val_buf->bo);
-	val_buf->bo = NULL;
+	ttm_bo_put(*bo);
 	if (guest_memory_dirty)
 		vmw_user_bo_unref(&res->guest_memory_bo);
 
@@ -600,29 +603,6 @@ int vmw_resource_reserve(struct vmw_resource *res, bool interruptible,
 	return 0;
 }
 
-/**
- * vmw_resource_backoff_reservation - Unreserve and unreference a
- *                                    guest memory buffer
- *.
- * @ticket:         The ww acquire ctx used for reservation.
- * @val_buf:        Guest memory buffer information.
- */
-static void
-vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
-				 struct ttm_validate_buffer *val_buf)
-{
-	struct list_head val_list;
-
-	if (likely(val_buf->bo == NULL))
-		return;
-
-	INIT_LIST_HEAD(&val_list);
-	list_add_tail(&val_buf->head, &val_list);
-	ttm_eu_backoff_reservation(ticket, &val_list);
-	ttm_bo_put(val_buf->bo);
-	val_buf->bo = NULL;
-}
-
 /**
  * vmw_resource_do_evict - Evict a resource, and transfer its data
  *                         to a backup buffer.
@@ -642,7 +622,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 
 	val_buf.bo = NULL;
 	val_buf.num_shared = 0;
-	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
+	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf.bo);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -657,7 +637,10 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 	res->guest_memory_dirty = true;
 	res->res_dirty = false;
 out_no_unbind:
-	vmw_resource_backoff_reservation(ticket, &val_buf);
+	dma_resv_unlock(val_buf.bo->base.resv);
+	if (ticket)
+		ww_acquire_fini(ticket);
+	ttm_bo_put(val_buf.bo);
 
 	return ret;
 }
-- 
2.34.1

