Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6491A6917B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3710E538;
	Wed, 19 Mar 2025 14:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Al3kly+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F8E10E535;
 Wed, 19 Mar 2025 14:55:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-223fd89d036so140754025ad.1; 
 Wed, 19 Mar 2025 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396151; x=1743000951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0exLxAAAlQWwVFJcNsbOVvtN8oA++7dfPbHDbFWzdQ=;
 b=Al3kly+8LKbP9cs5QtF5BRk05PL05qzfjJDy7XDgxBfpPDF+Je7XhJCLRXhamJNytW
 db8pVh5OxoaJDUpEEFgyARduUZbyH6Rm/QmNe67EKOWi7mLe6Bh31mWrxeFHDInmjay/
 sOsZByicNLhwe5Me3vU1Afr9DWz0TE6RPHYWHlpMMnxpXjsGCY2ZsnRVRwwkHiMvOwXX
 garqDt2GEc92ZLE+iFdj2F6uHrHG7iUAhNSjJEz3y1MZ2ktIQ113LFSbYa51RSmAzlhh
 aPRGMhF/HI4XiWJkfAWqtwBsWZXLmLGjeD9l8Go4n+0zhHFlUDgIwX+Ze9Bx7mAOaTpE
 97RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396151; x=1743000951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0exLxAAAlQWwVFJcNsbOVvtN8oA++7dfPbHDbFWzdQ=;
 b=SG7ZdxoqaVsUUp55R4tkPTd71sZvK66Y7KboTXK93cqoYAyp2S4j9dVJnrmufXclSU
 WDfN+XYO74cl3BBBz8tHAyBYmyHOFMKtNLiY9TP2ua9POUqP/81rBndNOcc6j1xsAYsf
 ys7hgG/pFNh8igCe5mt/NH9yb2KxgwtOs5S6Yb4wx15EdZx9/uazVbAaRwlZ7uVDrWon
 Trq8oeg+IKBayqEIuwcaJ/iwKohFz0F87cCvnQRs87CH4MOAg2ZKwYekESUxR90vgVSw
 adSf0mU9uBypaaXN5AMRNeQ5yGQKRSVCCz5mwDTExXqMDCBgTAus70eUD0PkDm/akjPP
 DrJw==
X-Gm-Message-State: AOJu0YxceIBsXV7c3YuiD9ahDPq1Tui9weSxj5KRlxxuHDNqaj0lRlP+
 M7sA5LNtTrcRwetI1WaW/KxcQl7gGqbFF/3mhkd3pvXOrtnM7/x+nq0C4Q==
X-Gm-Gg: ASbGncuuNA4pwbGnVHvG6u5jIfnPlXGvuEvunb6JdM6qOPyOAPKFOFs+YA/Mj6R4zFN
 N4NDCg4wA8+WDAPFQ/HUKaiXvnUs4GGzgAafzouLUjHjqRceM8BhG5OQ6nRZPeXLxHB6VP/r9y2
 jRevcWyDlQD1tN4x7nEaLU5RXe4Z+QZGDLL/q3b/qvkt04XyltQkORbNV/+FAI1KuzuzCHrwuxG
 oLQt//u92IUYEoTQHHbLSl4yBNmnn+KcUHbUX/HZLUmBVyQDfROAQGzHgloiOxRvwzhtks4I6IJ
 G+ETJGsKh64TunZ2OtX5EDHNdUD4iz/k0S+kY4CfL4fSzgUNKhfX6BPWndmEGrur3jwGbtDUvSB
 6KWhgsYkIY4OPFlrI4FSjzzQlzi2N9Q==
X-Google-Smtp-Source: AGHT+IFoDLZMYe7t6b2/oYO0pMxb9/WPero4OWX4DxcDjSMBc4z23b1LAAx4FG3aJW9vP0kMLtgYMg==
X-Received: by 2002:a17:902:ecc5:b0:224:1221:1ab4 with SMTP id
 d9443c01a7336-22649a39fd5mr44273665ad.22.1742396151063; 
 Wed, 19 Mar 2025 07:55:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbe8f9sm114441635ad.175.2025.03.19.07.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 23/34] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 19 Mar 2025 07:52:35 -0700
Message-ID: <20250319145425.51935-24-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 577da3c54c8c..dcf5f6a25f87 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -421,7 +421,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -600,7 +600,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3919b384d599..1622d557ea1f 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -141,7 +141,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d51d54c0da33..baa5c6a0ff22 100644
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
2.48.1

