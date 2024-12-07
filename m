Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394C9E80C9
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE70210E428;
	Sat,  7 Dec 2024 16:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXVVtm4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4017D10E428;
 Sat,  7 Dec 2024 16:18:17 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7256dc42176so3399411b3a.3; 
 Sat, 07 Dec 2024 08:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588296; x=1734193096; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7rYcDWqXxEUEa2Af4XZ/usxa/bFTIN296GBT4M9754=;
 b=gXVVtm4drSkJI/6LJDpGzYh0GlhT2RowtErb9E0CQ59URKI2oVpDcAn/fbs4TmUQtO
 msCzWUPBfro/imaPUn6TuPEPzIyFiCizxCfjvOYnIRdtblBBuU8x35xR97HRFbNwt0Y0
 JZOohbMUqGBXVuW3ptOA3YlyXaLHuhKBaYVlP/Jn4uBuXbcbgB/u/V/6/+gmxqm1KkDC
 tQ4LxJRvKTEvNMD2qDe28WfzI9Lqy682nT8FcuWvj1R7HtgVNJJK91wdR6TK2WqFZ51X
 mEfeWMWefRS4UmDLA0mV514Ikl48TyWOu62WKR6huYKsOk1xDNzZ4MHgVHnX4v6y6S83
 0i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588296; x=1734193096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D7rYcDWqXxEUEa2Af4XZ/usxa/bFTIN296GBT4M9754=;
 b=dMUwOEwATRwsaJuRE2cBg7ub5BWgvg8dXOiciqN4DbgMarhK/RvXzbG7cBenFQqgb0
 Odl9J/+oRDm+UJ9gijLE5v76pAuby1668LoEujj+M8Aka39jlll57pidKjiB9dV43lZY
 x/ZIiSzls6zGAZDYWbQpU8GbiWzqF2QL2wKvleqQV51XhisgG+O9lIi5Tvdkni8TBBy2
 Qt5HVCDweEaiPESK+i4BI+Vu0CRLSuKlGik3pEdgHzvglTmuJvbygUQg4Hx93aDQUnE8
 HFFfSkzjKW2i4M3L4pYo5TvkFzBCtpwXuhB7PnVxOlLH6txVcUQVnxhtFASaowcaVLgK
 PRSg==
X-Gm-Message-State: AOJu0YyIwv3Rv/y3owYrySZNkKwUVBtT+Uep8UeTcEoul8bfsCkGZ8FA
 hDD2A4tL9OUcfxB60owprxZ9sthCS2yT5Zfjj/KehuUinjkG0TtGFFTwSw==
X-Gm-Gg: ASbGncsWUwkhIjbiOdw+AZ5o9rOmWDjHNIjGfu07tlZoN5Jwu8jrbLYd+tzDL4iS04I
 L+xYLMRsrUwGjsWVPmWUJ1bmuYu4722EYLNFhco6iuKAdmzxusuZlfxPN3uOx8JqteEdWk4UxT4
 xCgPDZaUHRuzHvMjZHEnBv6M277vM9z2f8hOWOyQvBYJOOE9+YkVqguBvXP9JTXZ9PQagSbXIfL
 kGWAkO6yPsicoGummJQcsDPFvm0p9qlpeZo2AfrGu3ehmDq4720xwQm1buOrSJ0K8+8bqdOOeXk
 /SzdSMQb1yWg
X-Google-Smtp-Source: AGHT+IEzKmW3bzXgODVcqBwDW1qOiEHNm8CJqYXGejknfGCaBwshShHfgB3H/YbzCZsR9HcoHiUjdA==
X-Received: by 2002:a05:6a00:1d8b:b0:725:dab9:f732 with SMTP id
 d2e1a72fcca58-725dab9f7f2mr1849376b3a.22.1733588296403; 
 Sat, 07 Dec 2024 08:18:16 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725dc0bb650sm632191b3a.101.2024.12.07.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:18:15 -0800 (PST)
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
Subject: [RFC 22/24] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sat,  7 Dec 2024 08:15:22 -0800
Message-ID: <20241207161651.410556-23-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b6bad702e0c8..7dd881f8eaff 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -399,7 +399,7 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
 		struct drm_gpuva *vma, *vmatmp;
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -589,7 +589,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 71499ec60a5d..27ed5bde7893 100644
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
index 035d29623519..8d79e123ed9a 100644
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
2.47.1

