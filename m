Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8EABC62A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537A10E479;
	Mon, 19 May 2025 17:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hkTCH2Ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D38F10E411;
 Mon, 19 May 2025 17:54:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso4623676b3a.2; 
 Mon, 19 May 2025 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677289; x=1748282089; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=hkTCH2OuZTVmjHe1dvoxKnYRoMhhJnHqslutS5nJWPgbF65PgBYZE4AEeywvnY7CDw
 Y4wzW90GvMsIYhl+l1PNuu+tfUkrlxCEu02utWhEz8sDbU0ZEG5pRGo+AoznJQgOjb4H
 En7R9l22Ag7ERpik0t3rvh6eQzz/Ta3V1zbiBN77RHY6lXph+mb4YdZB3Glu8urW8f4F
 mdSqI7IIUioDEj3eaZrs/owvHh0dpKDZxXGcgThtNeIPMUYGkB/wYLsou98y2l2i1/ix
 IOamqwQb7W3nxrEvWzNR/orHQrouvWY/A6Gma+4hhRDxEwTEueJHH8a54TqRBtCDkIy1
 Jlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677289; x=1748282089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=xAfoci4u0QJKQkm6buw11Rab1F/WvhsUCgrPLlEIzPIXT8ED/jLXTgs0Wh6kKpHkVx
 eFPbdX/PkNdQNBmsYHGGv0JHnSz3jGwObNmpt/neftJJ/cw7yGXxMkQwNEAuQESgEF+l
 O/9lQ3Mc9pXPdB69nQwwdwCDCkwO0rAeM+wxucAAnNCuj/nwtqcdg/1ZUlmWqjiLjlK/
 ByvDSh9RvVlAR6fCXkKQRu/dvPvcy35j+9KHX7P5U3o+jSJNJ3pno2Msd1a2lWDKnoJo
 OemguKlS9FOAHqgURnpW0Tkpvrdm6ui8cLbKVnOY1roFmtJtFBMksZKS1IA75oGzS4vq
 UIcg==
X-Gm-Message-State: AOJu0YwP5RFt332+dongkF4x4fvVAweT6us0SlssgBdK76HnwvttXAPd
 6SzGKFRlc2dg5e9PoBdLCvg3AgkNDiKwuNXfi/90BqW/6IXapps1sSkjF6QtFQ==
X-Gm-Gg: ASbGncskX6Jba7zxxuX0ieQshOlL3ejHdxREUZYNELsnPBs+t6zZUDWmTKE+CE4Ic+m
 aCVpZLNwJ0P0syQUzgZdkAPUQwR+tpY14EP8zzKeUf1XzuqVTsvXu7bCFFcIbu4ob2ILTQHeYfU
 Wg34O1i+yo1W5bMDUYVhnSPy1c1jrud/Y2oNxraIH7kJfyOs/wtWglqxyvUPZXHMkIxZ5CPT1hr
 yc4fAiMX0cACg0v0mHulrruqJ5Czl1O8WxkYrfWbQuP6PoKFcA29Oog88WY/T5k4T6z6XfxBZAH
 5V64GchV4vMoSmt3YTSFOS1TqzyKfH0fH8qjFbwi/AVyzi0UeCxN0M5+kDAPujGXzCf9z9O5ZJD
 U5TusjeCug4mzDNjdOueDjNuANtS4uvRKn+bv
X-Google-Smtp-Source: AGHT+IFlxtzSJQGaFgyXf/ZCTkw2+pm26AoftU/iyWEASQCl3jv2lzP8WS3TOfWZ0zhznDu5/OaUmA==
X-Received: by 2002:a05:6a20:9f90:b0:216:5f67:2d90 with SMTP id
 adf61e73a8af0-2170ce0b11bmr22774792637.34.1747677289149; 
 Mon, 19 May 2025 10:54:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf8e05fsm5622749a12.39.2025.05.19.10.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:54:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 11/40] drm/msm: Collapse vma close and delete
Date: Mon, 19 May 2025 10:51:34 -0700
Message-ID: <20250519175348.11924-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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

