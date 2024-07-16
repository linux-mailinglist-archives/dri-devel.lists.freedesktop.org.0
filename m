Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5C9326A7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1358410E6C2;
	Tue, 16 Jul 2024 12:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PLl+/y7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CDE10E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso34943795e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133323; x=1721738123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xkWu0wnVUnBIUTbb/X438uZmsNXwbFiomGy6Wqo0Alg=;
 b=PLl+/y7imBz6iMtBaQgBddSZMIy7fwQMIu6lFPhL9fYeYXCXa8Gfb1bHQlPcvlgi16
 2axrFLG6RZ5srRglJ4SGGA/nh1xD2o6uq/9jtZsOJufJiXqeT1UxKPKE+Y/lhRFuxpJI
 blimlgtkMnnFpVqpwaW6upqjEgpG9l4TW+KykWREZjEo8lmbddIQa+6M0NyhMmr7QbKZ
 rtjwK4sS33GtCiuK0wROcU+Lnp142LiAEcDV1jf/tj1e/9zFDcC0h/3xeLtP7qBopkCC
 B3yPeWYDdI2oA8tmqJtHTERueXXJiU1oq7aCsrzl3HMlp+bKuT+aU9zKIBrtk1AIE2n2
 ZGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133323; x=1721738123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkWu0wnVUnBIUTbb/X438uZmsNXwbFiomGy6Wqo0Alg=;
 b=Hu8aU9uHcgmu9MEfj1YawWG+X/kBeVpj6+jNWikrvDHl6D9gXggbZWsrMYVN2o/QiP
 h4dRyMVfJ+8l5DYBtpj7YZKtO55JlZaipF3/m+VWEXZS1T0KU6As5WzxOR2RB/V0xsYy
 ZjyjEjQX251Gmt2469C6Qb5GvuPQVeC81bw8VbJUcoqqLkZAcUYAgIrZ9uUoU1avmGEM
 MTOoio0qv0b3Kfyw9KLMjO/8FOFDj9mUnDMfphu5LMJ27R1JwbSP6CeOaUI8vR1dya8e
 RqF4WB9sLK60oE1tYJ0bSlJL6jBhcGA864YcTyv9oej1m9QynFxNyZnFSdCHX2I8XI5v
 WQPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZEwv6lt6JpBhAPZsPndB5KVyylwNpeniy83/bqwIVLKI77NPogYvQfwwKJy7ZsReOlA1KVj/PNHoY35HBjuUdP9moKjsTGfnKNXQ8orRx
X-Gm-Message-State: AOJu0YxMcAFkTysB+O3wppbd+MT4SzFFYMIoslHHIJl63jrNoV2p7qx7
 psqgRqKwByBuUOU/qfvY0IOTWJKehwMsWrVUJD4CwAcp9+g4FoMgmNBCh54x
X-Google-Smtp-Source: AGHT+IFgRanWzT7wRhemjNFTy6OxIXYjtzHQJNA8Wabqt0NePR9CNYpjbjN7sjlRdXCCdedR21Vcmg==
X-Received: by 2002:a05:600c:4f0d:b0:426:6326:4cec with SMTP id
 5b1f17b1804b1-427ba696d55mr15228455e9.29.1721133322995; 
 Tue, 16 Jul 2024 05:35:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/amdgpu: use GEM references instead of TTMs
Date: Tue, 16 Jul 2024 14:35:11 +0200
Message-Id: <20240716123519.1884-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 7 ++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 67c234bcf89f..6be3d7cd1c51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -87,11 +87,11 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
 
 static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 {
-	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
+	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
 
-	if (robj) {
-		amdgpu_hmm_unregister(robj);
-		amdgpu_bo_unref(&robj);
+	if (aobj) {
+		amdgpu_hmm_unregister(aobj);
+		ttm_bo_put(&aobj->tbo);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 8d8c39be6129..6c187e310034 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -853,7 +853,7 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
 	if (bo == NULL)
 		return NULL;
 
-	ttm_bo_get(&bo->tbo);
+	drm_gem_object_get(&bo->tbo.base);
 	return bo;
 }
 
@@ -865,13 +865,10 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
  */
 void amdgpu_bo_unref(struct amdgpu_bo **bo)
 {
-	struct ttm_buffer_object *tbo;
-
 	if ((*bo) == NULL)
 		return;
 
-	tbo = &((*bo)->tbo);
-	ttm_bo_put(tbo);
+	drm_gem_object_get(&(*bo)->tbo.base);
 	*bo = NULL;
 }
 
-- 
2.34.1

