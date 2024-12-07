Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6767F9E80AC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82D610E421;
	Sat,  7 Dec 2024 16:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hi3Yjv25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67910E41B;
 Sat,  7 Dec 2024 16:17:45 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2163b0c09afso472885ad.0; 
 Sat, 07 Dec 2024 08:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588264; x=1734193064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cLXBR3G1z3bRKzv5+3ECPLKbEckhX9iHHy43Juue4w=;
 b=hi3Yjv25HxXlRkuUIDXxUS3miowCPfLbdG6t6e011NNdxWhYUp+ds3ghcePvDcR/gx
 JvfWKBOpuuJOS+/YHi/2XzIRppL9VYoob93eHq9YVPv0CI+hFD2jKtd6W9DdmxODjwz/
 Hk2Kb/5CAsGbdh5hFfQJVpQtRz6eRpyixNcJZXi35waYxEFbTg7Fj+sNjiXifUH1v+bd
 WC9kxgYnh/yC9fqbgi0A8kj5dXxygtrBE8/rC1nZu1ujx4s0QtdITT+eWaCZ0KRD0tv3
 QCF4W7gNKncIU75GWK6n62psVUvhTLCJMabKlomTWUOaqqhl4DnQFy7aqN+6CWT7NReU
 3fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588264; x=1734193064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cLXBR3G1z3bRKzv5+3ECPLKbEckhX9iHHy43Juue4w=;
 b=HK10TYOR38KEgdAdUnmxSTaaPm5w4J4dC9SDWF1kSoqOAgW03zBxwRJCKgDryVUjYh
 7YeaTnR7RnAAOOxPSTNrPNB19uGMjcwiyC8ZkvaBrHczvD0siB6H4QbzVi/hJam6R7pK
 Hx/Bp5KjVlSqjk7hT9E1X0f5aryqbrd0aRuZ9Zwh4djG+RJgvMYEuR1YfClKlGWbAqQx
 aUNd6Y94tggdjfA91m6rLd2ZOTpy0ipMIijGtvE7xNY62X6ncam+2EkXluGeJzrl1zQi
 VdYrCjhewFTst2yKDwZnysmObVwdocVaQsHrxGPtR7lyM6Ue7EQtv6gSyK7ILzQ9/LQv
 IMhg==
X-Gm-Message-State: AOJu0YzKUuG94OE0qt+WASDxl1QxBanjw9SA04+1cppAGfvDhF434Guk
 qX3G7oci7WtygDZNjaghH3EXYSdLUgpgwlkAkrkG5f+w3SdNHrZRIvquPw==
X-Gm-Gg: ASbGncvmbCfkVKnxXYaZaHr61OzMSmLFZKPbyW1f5GRRsZW1IHYLctnddjZ+9cn4oh5
 j4kJ5anCfcsIyKwbzqbw/7IoYTAeC9kzhenajQLpmQi9LbBnm+m72TMd4E4qkIMgF6g7H7ubqmD
 FuoE8Yt2JM9Cc9vaqLkYKZlaeey9XovEEO1F55NDURInfTf24a8ZNlwUK0IclqP23tMWTvYZEBV
 +a8KzG6+EGLwJapkVun/JbET35qaxmB+wPzagkjjjV7qOasOJ6PWlA7LvONXIpSDmi80PjMowBr
 PYWZu5A+
X-Google-Smtp-Source: AGHT+IFL+Sua+ojXGweDlYroK3L9HhW3YLR6oBasrEevNtDTKzyG2vcnQthcGfElhNM2StSthsN+4w==
X-Received: by 2002:a17:903:18a:b0:20d:cb6:11e with SMTP id
 d9443c01a7336-21614d50de0mr84997175ad.26.1733588264429; 
 Sat, 07 Dec 2024 08:17:44 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2162b13d486sm13240525ad.191.2024.12.07.08.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 09/24] drm/msm: Collapse vma close and delete
Date: Sat,  7 Dec 2024 08:15:09 -0800
Message-ID: <20241207161651.410556-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
MIME-Version: 1.0
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

From: Rob Clark <robdclark@chromium.org>

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6f11ce1d0191..326764026ebb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -349,15 +349,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -368,11 +359,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -391,7 +382,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -556,7 +547,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.47.1

