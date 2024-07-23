Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56193A06E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5475810E293;
	Tue, 23 Jul 2024 12:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FuZjTmV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A72810E293
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3685a5e7d3cso3053851f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737072; x=1722341872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9pEfEv/FNkQSZD98AMQYP11HYqkAXHtxjxFBvV4TOK4=;
 b=FuZjTmV5+RhOCo4wxvhOEHmbL6gB0+nuePIsd2+xjD5b1tQGAle95b5ZickduZquKv
 BWOtYNuCUTxOvuOk9EsyDLalkbPJBuqmeSFr7HFxjCW6lBAHo7p2ATvSu5I+40JqU3U7
 XAU4mKKkx7D6fAWnAakSbVHSiWoowzKBp5C6EpN6jUag1aOkEt1L6NHmyNEf/snWrk70
 293DRA/zmtfYKbbK37fN5em0VW/m+C+YdmssAVFrURx+SVhuKUmmPMNmljqGkhA/cyCG
 cv+aMehgzLcVNAJWCTBomRypTaCYZL1QSnEP/vZX6VQC26ItOHqnFn1lYzQcyRKXAlpv
 DNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737072; x=1722341872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pEfEv/FNkQSZD98AMQYP11HYqkAXHtxjxFBvV4TOK4=;
 b=F7/9eHoRRMdyTXmfWVxniRP4n5POc1oUCFiUS/MbvBl7nissCWVm2Sj8sxHmaI9Gdf
 ASPwiAaalRP3ICKdQu7jxpFkklORqIooBWpYTRBbXEY7Y5pTNzEUuJFgLSd8AogDt+ze
 eHQReC64NGkApnhDi4wXSjSwK/rFbQCUZDvTg6NLmvUCcWxek5fc8seGBVdx+5FKUuBD
 eXRptQSqnbxwltxeyhZbR6rWVaFKJnex37+A87w67w5F/oPJczrPJSLjvgAXv9/lzSyS
 5rApzKCvljzP+po9u9v4m5ktJC5tpFNrl0wWb29tgGpUvt3WPElPvr1QQbs+Kp2bJ/5q
 OrkQ==
X-Gm-Message-State: AOJu0Yy945PdM+E520ddA5kgT1OfRi9BcNf4Eph6DQ/AFhg+In0pMUsQ
 bXBUk07e0TsekWcs2i1KtVJ/N0flnV6KhffGpy9ZPS5E3bxZMVD6
X-Google-Smtp-Source: AGHT+IGDnnV7eZ9l9B3BxW5b5H3yajiHQk/Tvp+iwj3EHgpFo82Lhz9LQj+qdIz7ZjiMKKxOqmrcNw==
X-Received: by 2002:adf:f4d1:0:b0:367:947a:a491 with SMTP id
 ffacd0b85a97d-369dec206c2mr1920290f8f.26.1721737072057; 
 Tue, 23 Jul 2024 05:17:52 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/amdgpu: use GEM references instead of TTMs
Date: Tue, 23 Jul 2024 14:17:43 +0200
Message-Id: <20240723121750.2086-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org
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

