Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB0A9FB10
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61DB10EA49;
	Mon, 28 Apr 2025 20:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GHcwzmdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9F210EA42;
 Mon, 28 Apr 2025 20:57:27 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so4378110b3a.1; 
 Mon, 28 Apr 2025 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873846; x=1746478646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMivwjTEQv+Bt6XgKFbGkfEppkRTdRM2MuH4o96ETLo=;
 b=GHcwzmdpR7Yv4cQef/6FRMlgN6mQexZJDaFwzmGdU9KI7NuKQ52cVub492tvmefi2w
 MXF6KecTvVJ/rFtB/LINjJ6rBpacSzlQcIabEjvgkgmS03isp2aJLMIXG/dkRM2mtT/c
 O4mIUK1RszuYGReoKp69oxWnNUa+Uh8bZlAb0eNHunEF4zTkSU9V3kKOfqxo8GIzpWU0
 JCgzERWlU5kc/s+7nqZp3aDh66EX+0p8buJFif9XFLL5TeffH+h5m5jyo7nsilYUzlP3
 qJ2jRQsTnCc/Whc7ce17/j8gZuXFN6hhi1FzhmMGfYXp8CfRI3dn82v5otAMxyUqjJIq
 F2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873846; x=1746478646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMivwjTEQv+Bt6XgKFbGkfEppkRTdRM2MuH4o96ETLo=;
 b=l0vgxHsEtIja4zoJK4bWmEl0vRP0PO72cGotzVAmGoaBZWnbO6qIPQv84l98ilKf33
 eJgL8GG5MmwCv+OhQ4aoUsHNaxgO6zvQM2JLYiOshggGcsD4Txq9sqf7S7lFJXJEnTgd
 PxlE1QszS/yQhUtJuPaYjZUbkoj3BzHm+3GBO9WUpqqRSqrbFbeR8oHdKJMTMKcbYKbm
 GwwM04c79lgbUersCKWxs5in1WIfN3L/Yssflyvnl2IejUOXQghi8RD+CDpyo31zbfOP
 oYgdPcid6cUMfhNfrMYsDHe28T+ismcD2ystarWM34BuGfhhY90KwqliWNygb5zi6kWi
 dNmQ==
X-Gm-Message-State: AOJu0Yzlfj3WpaPadaZarfpJVlIDGw4g0JrH4k0U2t1NV8mZApVpf+9g
 KNMynlvJ5dXNqyrxSM4Uhf8hL7HpB/mCKBZJn+1vp4asiKa4kk37EbvRWw==
X-Gm-Gg: ASbGnctuBo22dr6Iap+MGzDuBD5LzwmJ/RDk87iv0SjwvXfgwCtoUE0OO6AKieFL6ez
 lRgtrlu3pQgx1VXLVSS8bydmEjQyFA8I9EVVnO2xX0u2PRK46Tkwi6UP9A/QVNvV7iGuE7ikkZC
 TRtBDe1pRC/YHVmLV0hKKDQb1sD7tF+Pd/vP5xU5VE82QbuWdthxhWSY11jBPUeJqdiG/ckmcLN
 iCcMDIyZdn7I+lPtZpZJoSlxYlnY/EQGOTpu1TqD8y7MyuWGRlIgOqUCjP7v8O9QDU8r8BoqxfJ
 tOC/JwMuAxV9HSFNBEG8jGAlpoFx+gHzkgFoeq1F59dV9tA0bg9XXxiMucstQGj2gv/8epiqSoz
 iL2yMydn1wQWWogA=
X-Google-Smtp-Source: AGHT+IHemaQe6cVy5mFexg+Mw/1KRtL99pVrjJx6X48nmsxpBiqNp9ayGm8uhMvM+ahMGWIhG2J3UQ==
X-Received: by 2002:a05:6a00:4b15:b0:73d:fa54:afb9 with SMTP id
 d2e1a72fcca58-7402713d46bmr1789183b3a.7.1745873846351; 
 Mon, 28 Apr 2025 13:57:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f77032basm7737395a12.7.2025.04.28.13.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 17/33] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Mon, 28 Apr 2025 13:54:24 -0700
Message-ID: <20250428205619.227835-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9cca5997f45c..d85bd638f684 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -415,7 +415,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -593,7 +593,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0d755b9d5f26..da8f92911b7b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index bbb2ae1cdf45..265c82abc658 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.49.0

