Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B630A6915C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA5A10E529;
	Wed, 19 Mar 2025 14:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbmyZK2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DC810E527;
 Wed, 19 Mar 2025 14:55:32 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ff615a114bso1332406a91.0; 
 Wed, 19 Mar 2025 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396131; x=1743000931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RNXaYltKdqI4pcwHv3VKQ0s77cLhZEAL3udH6bNlA1k=;
 b=bbmyZK2sgthTH0tnn1/pyeq5IHAxPbg+fqMrCk4Ll5VpZ3IQJrVVXynhHKIBbM4+x3
 MHrC0CqGSzTnvp60j4BHwfGa7DGDCbo6rxINwxyzeFUHAaN9HGl7NZr0NhuosL0gbNvD
 RC1JsYtvtLaHhEfcfPuOLj3UW21eeIBuhgMaVpTbKMwkKCg3GVcFrLrBEXnfPGFZgNss
 K2G9xtLNfDstY2dt+aIB6/7zF0cpGs9uc7xbH+6E+G32UerIX/Ga6uOklJLlDfALJ+yD
 qUSVUl6wVYyC8h+87qDGdP65ggkr6JjKytKg+FnNM0EVUgmAkHmf8fEk5VH45q857G37
 Nsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396131; x=1743000931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNXaYltKdqI4pcwHv3VKQ0s77cLhZEAL3udH6bNlA1k=;
 b=ARSEixf7kf6O5pOHGyGT89kxnfEOzlBfHf/6fk7tIYs6AXCVs02VIlIWjQhZgP7dtt
 uu/LWJ6YZ+lPWLfIzn95VHELIGHPW0G8jFoVn68ISGdtUcqFt9yoMI5GnRrLTfG2VBxl
 04E9PdMqb6a3K6+SJDETaHUITWeA6IJ58Kzb2/0kjt/lktaEZPAqgPim781JTTeJMsyn
 Vk59o3OWuUYnv0vJSTYh3o5wUuiWcO/E4Ha2ogm6NwrZccZBRXLl91MvppGZRQc1o3TQ
 2kIaBxeD13ArCArWYYIuW3zJUcdcJmU/CBslV8TAarDA3bCaeenmgFY8f7U0i91YL0qR
 bStg==
X-Gm-Message-State: AOJu0YzS/65Ud4P6CCbdP9Yv1s/ujVGl/sVbaw5b09vtJfnLxu3Jys3m
 RSBDKmL5QfD+0dqZakxG17xDoIzjdS9aCUYZVL6mex5kO6Vpa/ZDQ1AgHw==
X-Gm-Gg: ASbGncvjuxoa3edgUnyAvv25BC+pggFGFPKdGPu+H7WyuuW0NQUKT6sD6cqgnKFGdPO
 E2LdpnfzV0+FolgJdDEnRqq0iOoKLa0Mg1dLAtrkfdCULmFZ7w1ivlAql90VbywJzoJHULNBXIl
 rTsrLaTwCE5z4nvqfR7bv8kEB+scWTp3zNgm3LfFJAcVURCfWWD8bht+yhwcgv2Pskbz2NeA9oO
 iuewk47ABNmzHbbXM0Pm6rsb4duOfM/2zzIaojn+YBkTszViPzLMk9utTNlJZ5d7DotQm7IqIdl
 7SGQu/s0STHL7hNbxOhILwnPQtXSNCGCRLMkGgc1hRRTGGmFkucAvPiOSyulbuoqHQFNqSuvTgB
 Hruep8+n7CllywPSkdvc=
X-Google-Smtp-Source: AGHT+IHYkvTd6Ji85eeGfR6RC4/2eCSeeWGGiU/i0Z4s8dLAfPk1JpKwIwLzLzIY/Vr8CeGvJLiqjQ==
X-Received: by 2002:a17:90b:2f48:b0:2fa:1e56:5d82 with SMTP id
 98e67ed59e1d1-301bdb1074cmr5400280a91.17.1742396131316; 
 Wed, 19 Mar 2025 07:55:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf58b360sm1682942a91.20.2025.03.19.07.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 13/34] drm/msm: Split submit_pin_objects()
Date: Wed, 19 Mar 2025 07:52:25 -0700
Message-ID: <20250319145425.51935-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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

For VM_BIND, in the first step, we just want to get the backing pages,
but defer creating the vma until the map/unmap/ops are evaluated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 998cedb24941..c65f3a6a5256 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -292,12 +292,16 @@ static int submit_fence_sync(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_pin_objects(struct msm_gem_submit *submit)
+static int submit_pin_vmas(struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = submit->dev->dev_private;
-	int i, ret = 0;
+	int ret = 0;
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuva *vma;
 
@@ -315,6 +319,13 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		submit->bos[i].iova = vma->va.addr;
 	}
 
+	return ret;
+}
+
+static void submit_pin_objects(struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = submit->dev->dev_private;
+
 	/*
 	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
 	 * the LRU lock for each individual bo, while (b) avoiding holding the
@@ -323,14 +334,12 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	 * could trigger deadlock with the shrinker).
 	 */
 	mutex_lock(&priv->lru.lock);
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (int i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
 	}
 	mutex_unlock(&priv->lru.lock);
 
 	submit->bos_pinned = true;
-
-	return ret;
 }
 
 static void submit_unpin_objects(struct msm_gem_submit *submit)
@@ -760,10 +769,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	ret = submit_pin_objects(submit);
+	ret = submit_pin_vmas(submit);
 	if (ret)
 		goto out;
 
+	submit_pin_objects(submit);
+
 	for (i = 0; i < args->nr_cmds; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
-- 
2.48.1

