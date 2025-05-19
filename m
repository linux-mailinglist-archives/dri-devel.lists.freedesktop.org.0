Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8ECABC651
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC6C10E3F1;
	Mon, 19 May 2025 17:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmeTmoXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF1610E3F4;
 Mon, 19 May 2025 17:58:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-742c27df0daso1692631b3a.1; 
 Mon, 19 May 2025 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677500; x=1748282300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZR45HonzG0kOSwz0CHVhwP/iZ2n3XMsmuHYxia7o9s=;
 b=fmeTmoXNWNMVrCEjhGQgENhRud1iUUaXxBCWD1CvwYHFmin5HNoCJflndwv59zeDrj
 ZiGq7Y+s+qA58uGs60NkyY+bFBhfM3TgqnlCUsnrZEnDG3reiqA6FpDm0lsGuDFdyQI0
 NbHXbjAyEyI1CDwDVCtJeLtQ/su45wC6u7Mvd/cKCOEuBy3061lzy1vamn28zxHckXVC
 EsZMdLOB76HsIZpkoyPrXJMOvKqaAVUo0RoTtyZmHpn+HUDbs3+qro1Wut6MMBOf5WJi
 +VBQNb+GSL1zB33CfDJ/ctf1Ku94uR3+wUpl/gCxVc+qSVaXpZzx9CNvs5hy8Pf42bl6
 G1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677500; x=1748282300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZR45HonzG0kOSwz0CHVhwP/iZ2n3XMsmuHYxia7o9s=;
 b=O/KLxSN9RB7gKUK6RzBplFnmhjd7BvExmvCWGlTUtj5oAeKEooxlqLwWF6WWlES/q3
 tyuMgJyx5dg/f4AcpwbPiNQ9A6F4xe+Hp5uI3eIc0vN0MGGHIE9/MDEzdLqRYutWGhdN
 Eg8ffqRMFOI9q2Mj0pI8lK65C3qrQKRfc2zJvm+bXWjVrT3IQB1IMKFtu57aHX5jEZIh
 BwJ+RkhQEGKtohVwIY1V7dhIPjmtJJAfwZQReacKzlOnSlMT0coLwm3jLa5vNNgrJdU0
 aQbV85EanYHXFnX9CIBqbuZiBXfrSEE3lieV9eU2LBHYCzlTcg1qx2IEcPMv7uqrsxS9
 /jfQ==
X-Gm-Message-State: AOJu0YzU22WJdzZr6TOmm8IjYSCZ0v7xP1/DmwpgszUXqSx3QOX6x5KX
 1D+MXpMRIOAaUKyh+tKC3HtUGtmFEU6xc2XLoHrqL7ag0PK9+cLauWFm6rALaQ==
X-Gm-Gg: ASbGncsAhod+SQlhLVA6Jk6uVa8fwXPQypgi6OMlnMK4y1u1fxiWVreGqvAMZmqEjlt
 m966ng7wWzsdlhwBNlO1rhDo6/YgX8aLonBw8eSQbkjUKXvLL1X7Sa21/ptKx6f/10u20xJxLdd
 5obq+1l1gpcQV7oFcyMcI2CxDqvVuSynx12j17Yz0SNjttzcdWfDNnHu3/ipri0XDv/A0dTrc9W
 ggcIeExDtdW2RWxvE65MGZrKfVs0hkquNrc/9CVPD42LJJiDNDhjjmqDtDEdZjhXRDB6E7lsLJb
 MMGLNlLIBgIKOsEcPwEZG7H8xynyNQav8R8nxcAzfiVvvtrqngnNQ/soSijmTbBzPso7fayg4qK
 SSzXtA49EXBXXpjEv2xM1jMm9Ng==
X-Google-Smtp-Source: AGHT+IHOuR52fY/COtpZM6lIOPAeDrtBd0ZuNPdb6M1SPZESV1zaVwdxxix9u7E3jidU4bsfhrIuRw==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id
 adf61e73a8af0-216218f7a98mr18397671637.19.1747677499805; 
 Mon, 19 May 2025 10:58:19 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb081aafsm6516577a12.47.2025.05.19.10.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 19/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Mon, 19 May 2025 10:57:16 -0700
Message-ID: <20250519175755.13037-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 738620603d2c..bdcb90a295fc 100644
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

