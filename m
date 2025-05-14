Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC22AB7232
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5910E6B4;
	Wed, 14 May 2025 17:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FDpeGoox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D4F10E6A8;
 Wed, 14 May 2025 17:03:47 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7423fb98cb1so126100b3a.3; 
 Wed, 14 May 2025 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242226; x=1747847026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=FDpeGooxxbXUvWHdHMychMJkPXQZAKArIRYb9pDOORmG+EDJCAV3e5KVvpsP8fqmXc
 e5k3on7mn9FRI+TYuSO4xMx/0Uu4Uve8axceqscIouHEkn8LsBL7xKhao8DvZeDSbEQS
 01nnl/Qr2GCKoQJlR00tFibtK8zbHAChQL2GBKitNJxRvEroVMXktLRqxpDCyC5SW6lY
 paLO0+KyHtVgCQJ4nJmtLVlQvwTtEJ9rYJ8AFaXaLz1Sar/+fVnp5rcQsbXbQA2VqCF4
 0Itdol0tHELHwZtxe9PsH/BBTZ/ebvsjpNYaioEGOVYMWpSENNFDIYfp+PycEaUTkZe9
 O81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242226; x=1747847026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=Qam2RU6W8zcz3luySFI7V6GoliyNnc9tnq/zpLC9zbvaJs24lvurb+Gvoe9bTkOZCh
 HGSnY4kv4EKmHkoLJZoPWKI1EnlEsP2tSG51dMnMU+UT86+CCOnXZ9I7w0nKWjiWYpBf
 yeXqVF001ZMjOc2sAiWSn/AD18NHoUomYiFr/U5UySkeoDqhnbTkQ2fS8aqtK8rOpsnD
 h+ieMbT2JVQ0KD/vhG45p/bH7sViETZo4eq1mPpqxistpWJg8XKBj53EGrMGMy5nhYUm
 MIH+o3NlKnparRsqdX1qmw7XAX4AaT3EGPTIfhzq3qtK/oUuOG/hvQn5LaXy5Qk+fch2
 VqYg==
X-Gm-Message-State: AOJu0YyOiw9UrNyyS80Rp+RTzreUpu+aqOxUJO+SgFXHI4qhCOGBy/tF
 sWq0ruK6lZObV4hQyTDL0xfH9OohT6jLg/1YvlTrLtHwEkXozzLsuyCzig==
X-Gm-Gg: ASbGncseOByVP4gTo4B+7M2D/4azNCNi8egd8CUwV4xk0Vg4xoZxVBiL3HhKw/3Mj1+
 fcRfunt697qfVPLxmT42tue2RkuVnnmt5fsxCkSawEaiJhsSqsNG6kxpVErcmf171qiXzh67Gq0
 E5hDDJuaKoNs0/P7dwRG+H+SUakNN2wQmD1SpLtUErOqXgcb9Y5dvVr+CaOTgAJNbnIjSK4RFUR
 PSZ+ZtSEM8GvDw9etCEJOvFTYBzSVsTIyA/pdu/T7mDbGCibKFdc9IMyJpfTaO47VP4IeczJvyf
 VVyNJ+mzikH7SQvXqBwxEt8PJqjPdmdM3iobkOB4qtO/rqXSrOx5GhwKaXEG2b0zb4N2Rp+Eplx
 SPFAQNugwwyQlq3sz/k42GsxmEg==
X-Google-Smtp-Source: AGHT+IEudCs3epNgOzH45zFKhF3wF3KgAJNaSNIjJuJ3OYrje+XY0VybCKKMR36pmLxg8on8O/Cqug==
X-Received: by 2002:a05:6a21:6d88:b0:1f5:5ca4:2744 with SMTP id
 adf61e73a8af0-215ff0d4647mr5220628637.17.1747242226550; 
 Wed, 14 May 2025 10:03:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2349dd1fd8sm9172819a12.26.2025.05.14.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/40] drm/msm: Collapse vma close and delete
Date: Wed, 14 May 2025 09:59:10 -0700
Message-ID: <20250514170118.40555-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
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
@@ -372,11 +363,11 @@ static void
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
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
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
2.49.0

