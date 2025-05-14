Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5479FAB7381
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A59C10E6CD;
	Wed, 14 May 2025 17:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M74TUlIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F423510E6CD;
 Wed, 14 May 2025 17:56:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22e16234307so2003825ad.0; 
 Wed, 14 May 2025 10:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245419; x=1747850219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dc6oh0e0WavCyhwAJpacjMNx18OqBUhzQvT0xVarT0=;
 b=M74TUlIkEMn1VfLjAD8qOaZon7d+2qogMnHwxKQK1bbARleProd7wkMaXvANg+eE2l
 rtkrdQCX9tAIQpuXu/1+IzkU7tg5efmLMVUSZa4bDXdyDdNOr/CAP8P+OAV6yDfrV1P0
 mOP9Hs7mOtSPOv1XFNGwUfkgNGfGWOb+pbaK2qDmratYRP4zgGtZkxO+3cF3S1TlfmDD
 hq9i17NJOzSWhwrFD0wwQHndAfcWvUtru2Tmlv32Xj9HEC+I2DpyrTmR3hYqshu2DnBR
 LeBaLuIqCZP6hntnoB6KngdXXbyO07HzVRCZNHBlySO4pJFQ5vTI+MjGUaRnEMYQpelW
 WtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245419; x=1747850219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dc6oh0e0WavCyhwAJpacjMNx18OqBUhzQvT0xVarT0=;
 b=W1U8W9xGqwmQI8Yvu74bUPCJl35l3ez0yvsUQbBiLEjW6PxnNsGFhthO4RZUWsZh/o
 BNrJJ35OiQVL/ePfMDmyDzp+qGr45EcBidmdKPGlHX+wbztZD2U+uHqHYOnqGPDDS6qQ
 4PVsCbqEjy8AKE2Rqd6N2i04LMnWdBBnOh5WrFi9z/edpIRSchTId/MfCAi6fSx+ThTc
 ilDqLMvVnErvFed0zBGCFVHe7a+qO6TGq327OGkH0cxiZpP2DpBe0k5RrLi+s8XTbwbf
 qeZvbBcuYeRf/rUl/0nwgNtwBaINc1ESjWibczwhV7TZXrVWJlqbzzSQkRUba57dMADk
 hxQA==
X-Gm-Message-State: AOJu0Ywb44rsB3xR1Ahfh1f2hKP1dahkV7aLVrY4riL8MVQJqn73TrD2
 aj46ugGF+G46k8R4h+YrCc/n0Zo5LdiklNBBIdTz1OFW/DTQPya9EsplzQ==
X-Gm-Gg: ASbGnct2xjBR+njgyYuQAOB5UV0ySEfT+Ljwkab14bgOpc2mjej/QJBsXenIf4QyJte
 6Dzbig6DGvvxBaiw7wL3eKhXt8beq8sV+2xQ2sK5+5fwplXzJwqy6qe6AU3bLfexOuHg9Tgj8jc
 sbhI7ntwe85OG9rX1xTQ7QP218IkH/BWPnNWmW5Lg1i0dN44pF+pB8fglXZAZqi2iDxFXrY3iv7
 2COWYK3Y5TRfSvNuNtDi6UV0thkEDv5I5MkXZu96l8H5YZLAJkywlpel0KIVwxecxjl9xKfFgko
 4W9UeBi7ZNVCVCVXAaqKrs0ble0+cvXZqWjKEGs2BGlF1MhjBV0HbIQ719aU6iC8LqKbTWnBJQZ
 RSfrouXdcSkA1ZAiwxV6pl4GyEw==
X-Google-Smtp-Source: AGHT+IFlzNaFmGbXtBc9+69TTIup6InQGI2JT+UoH0sPZLIYJlKUPlIOuA7VfFmugCKqXw6T9X7MiQ==
X-Received: by 2002:a17:903:491:b0:221:751f:cfbe with SMTP id
 d9443c01a7336-231b39a7cb7mr5893315ad.19.1747245418756; 
 Wed, 14 May 2025 10:56:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc754685bsm101534935ad.50.2025.05.14.10.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:56:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 19/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 14 May 2025 10:53:33 -0700
Message-ID: <20250514175527.42488-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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
index 109b985e1d0f..72667316df51 100644
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

