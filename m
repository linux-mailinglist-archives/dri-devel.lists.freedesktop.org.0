Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CEAA782B
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADB810E96F;
	Fri,  2 May 2025 17:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mq/CnMxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A138E10E966;
 Fri,  2 May 2025 17:08:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-736dd9c4b40so3311845b3a.0; 
 Fri, 02 May 2025 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205717; x=1746810517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oImRguuO9CgxvXeMtYQm2slMQDfx+h9LrYW6SXxZmNE=;
 b=Mq/CnMxVRclsF/VtoYcZDwKWlDTJ3UfibnAv800CS8dT97i0OW7VvmXl6fMvQgDNg5
 EmQpk41rSVXjzRh7hNjForYpbEG4UVXrnl5mD/Z8uHl4EuXEFgNTCt+J/ucyqAAQ86er
 7VdhYV02Lkx2TL+R3Z6gbBZJ+/pTbLBg1urzlrXIODVpUpxlk8tNUXH1ClqvRYzVYajr
 xjwLcvSjqr/qNDZ1hNiKOwAkn3NeaLp9DDSySknKYlFlHdtjvI+GgAjS7KCPRJc1E1xi
 pWawFJns5v94Q3dBoMDckk6sazC9NxkLubRobLSRCf2ZY2JFC+IzwEUAMwOk6WcpQKok
 i+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205717; x=1746810517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oImRguuO9CgxvXeMtYQm2slMQDfx+h9LrYW6SXxZmNE=;
 b=wAXtrPqCHA6fheZ6Os3sSjxncvnk40OgA/I2QCvaAItZFwjpEVGishYGZNzJpQEt7+
 BAY7W329Llha4CyHARgutzJPkrweGVZJRyxXdBbqdgMhvvi/aBULKpOL2WIODGAdIHB5
 TfxwtgLphVGhqNYapFaH7gAu5WXNWd2boCG5ufPowK/1IR9ti9HLK3YlikkXctIx5MY2
 VH2PJxmafioqHDIfmiD84lyIncLgejk3TDXsI28P2NVnfiuwgv+mkx0MD4STObkAsIo8
 WnYoEEHbfTwhFFC1IpjC7go2an8yUDuhJDzTNCWnRre4TmFt0INxBxS2bHS7I5MvPuNA
 BCjA==
X-Gm-Message-State: AOJu0Ywp6hKLv4gGGAKvmOX6+iHG/WZKDbWWxGsEfuwvdn2VxTvNvqyn
 opJz1iIWMJSD5SRbll62MYxDQ7vZcYZra2mWycrZBqTy36EGnyqu03YtKg==
X-Gm-Gg: ASbGncsKV7ovYeKnBoCHLomDBbeHq2dNQRTbt7UwUVgG5d0xfSHb/ThpMmLpCcLlwgB
 pHT1Rn8HiK+7AFEvWIt102M0uwImFbkcO11EargrOw8+xjaaO4rTwzYE49R6hWci0IvlDaHEo24
 917fKYTChw5aED4G6gqvKetZwl/Xq+Z5EtsV/1mSH+fUeBoQ8cPGxfxGsEKZf0uUUbDawOKCmDw
 KPnB4LJRJwhRiK5U+ks/YXV/I2cRY/4ET2pZ2kQzhpA1GVITHoy3PM1gE5rWxLYiG3JYALMPgI4
 zhDkYZbp/kBH9xD5YqtEMlT+TCzJoRZtV3G89juxPbkhK2mWkI0qtJ//sEFUftL4nyzcUb9wv2G
 OAdvIMiq0SzXfKxE=
X-Google-Smtp-Source: AGHT+IHBVfECa7MHwJ/CWx6XiOelQJGyDiB77wRm7JtyMpFRnEWD8K53dfuLCH+0Bl3zeJx9xaDJZA==
X-Received: by 2002:a05:6a21:3416:b0:1ee:450a:8259 with SMTP id
 adf61e73a8af0-20bd8d4b1cdmr10325594637.18.1746205717511; 
 Fri, 02 May 2025 10:08:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1fb3b5683esm1035432a12.24.2025.05.02.10.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:08:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 17/33] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Fri,  2 May 2025 09:56:44 -0700
Message-ID: <20250502165831.44850-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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
index c3bd89243a71..079f6587ab8e 100644
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

