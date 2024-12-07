Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216EB9E80C4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4910E63E;
	Sat,  7 Dec 2024 16:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YUUx9ckd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC8710E303;
 Sat,  7 Dec 2024 16:18:12 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso2799462b3a.0; 
 Sat, 07 Dec 2024 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588291; x=1734193091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SNShEp4K4WM48mYMhdPsbSo9pFVciKzwPQ20GScC7s=;
 b=YUUx9ckdTyURzZA8PsHFLVw16XuMCEfjyb2mW8fDS/XtDB+o8uW/+WN5IA63WdUL2O
 yqmH39YY+R7SkohczoHipS4uSLE/XjaJrPxafTy7dHwDe8tpZd+fWECye2AeC26S01Jh
 vWzboVlkEzJsd1tCisGbxqj0KT94kVZdhFbuFpYNjlOVnCiWGhVkb8ItZyDPZp0LiB/R
 PnOoj13PnxlqyCs4gUF2D5evIwZ5CHv7KE0GcSKMoPcxeza0X5aFTzlGxZaXwJC4RHRQ
 MCN1V8HRmrNcmeICG/YJjHdFY7HQkgOcJqC1+zsm9DpHd/54bfJcosIWjopzAmCLYck6
 4q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588291; x=1734193091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SNShEp4K4WM48mYMhdPsbSo9pFVciKzwPQ20GScC7s=;
 b=ZF64dfYs5iCEmZTSi9HMd77Uu9kvg1DkNMPy2W7/KIdMYuAxRGsZDEeDZPfV5EZvhq
 OAsoR+6US2CEpPusMXiCK3pUENFZOmuO/+j80nH3B3DzBJ6qJ+9j3N6GKreCLqTrGiw4
 tx19e5tNfT4p2WsO6FsoLkUkZyWjsp1jlpWOvVIpbSo2nzpIRKw6lM3/NoNmeqfq5tuL
 kdPUFQSwtQPQZvjKP4ubhuRh+8hr3gbi8Qeh7JRGLdPJYaEtfqYwzvgkrfwwhHjiaQpj
 cHELsCpSKUp0NXMEuLMIv3YSDdx08k0OxyC784zp+ly/uLE6TLYFklMG1bf0fTS12cpT
 lb6g==
X-Gm-Message-State: AOJu0Yzuaz7OKMvJ1P6b/DC/wQ/mj9uwq9ZJJ7yrPLMbVN2c8wI3W9g3
 lCQ8LyN/guZefTNL2gRjQDwod7fPdJDthYfhy4jAlJDF0VjBb5hRVOpkpw==
X-Gm-Gg: ASbGncsQ9P96frW+f5hobGlg4WJBT9ldGzdU3lj1g26tYpkypbTYUhl1BKiipPaCzlL
 OFN/iO2TbdA/O+PD5D8lHSJZftUK1DkXxBagNEOgweKi5onbh6EMvohIol7ZFNB802XPGXeEyIN
 vvLAxaIenUu/B/PRwuBDfNjZVjqBTp9s5xvbTP9sYPXA8WLFDCPNI5I2r1gQ8ikpGfos1LXe5JD
 oeQcTiLvm0U/KTQyWyZJODfMxiw4VzN3/2LxZKgin5YcoKVTC7Yq6+aVJ8EL6thWN7frvH4YrHn
 //x/b1RY
X-Google-Smtp-Source: AGHT+IG538J1QokDjPJHjgNZ+sHayhY29qYDR8B7YchPK8u7YmQbZ+Ik3gDvEojKkQdXazUhqeQ8gA==
X-Received: by 2002:a05:6a00:13a4:b0:725:9f02:489a with SMTP id
 d2e1a72fcca58-725b8177bbdmr11676460b3a.17.1733588291585; 
 Sat, 07 Dec 2024 08:18:11 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a29c5d28sm4676949b3a.17.2024.12.07.08.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:18:11 -0800 (PST)
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
Subject: [RFC 19/24] drm/msm: Split out helper to get iommu prot flags
Date: Sat,  7 Dec 2024 08:15:19 -0800
Message-ID: <20241207161651.410556-20-robdclark@gmail.com>
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c21e1284f289..7cc4b8955687 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -443,10 +443,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -458,6 +457,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a2255fd269ca..a00149d66d37 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -188,6 +188,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.47.1

