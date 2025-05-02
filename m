Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2803AA7825
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1610E980;
	Fri,  2 May 2025 17:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZfZ1tIi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7F10E97D;
 Fri,  2 May 2025 17:08:31 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-af5085f7861so1717763a12.3; 
 Fri, 02 May 2025 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205711; x=1746810511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
 b=ZfZ1tIi7phu7PNnWq+b3IGs5yyTjAtVg31c4bW0q5Y18cnOVv8YTPQYV6SECfAXGU8
 PQ2OvehRdRFvJotG4BWKuNtQh18zjqPnwdXDetTS2IUd00z60zeRGHoRosMT1/m5cF5S
 XSziO4qjDctKpJT4qN5C+JKq5D9td+ks1deWGENYn3cHohLvszRGtAafWQ1OhRw9xYNi
 6T3UzG3AR5v+DN8v2mke/vP4QU2t9jSbankThJU/V365RwvVA5HZFgjLOO10nBsoHH+1
 zc+rLZOlyB26CURv1WUOuiVCtzgOnkV8jIMiR2X/i+HdzgJ/ND/yc8jaMFRNvlRUSyKK
 jIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205711; x=1746810511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
 b=jxXO1SlljdzCdGvnXD3r48+QrTl4b/oqtNYSDkw2DdlPYOrc23n78+m9k0Oisjwux0
 aF/ZyC/9VA0rTa6r4rrzPpdAW+4SVx26/LgnUxQHzPe857feqNPyFFvpFOohWj9T50XT
 SOV5Vz6H2NDeEVYcTwtTHXlPVjd3dI22o6DZf6UQ+WDsl2udMn8M+3lbOxpkB/aT9D/X
 X/e/XJb8Se4Xsqr1hUMBR9XOjLT/rxipk/wd7SQhv2cpSN8UEV/p6maZ7IG+qU4lYJ6F
 iV0kmlcZez5sf4IzUSNRFyzXWx3+NKt5z8kPX7i2ZwiSW/R3gxKEnAifSanEc4DFZQ+n
 ejNg==
X-Gm-Message-State: AOJu0YzVcKVhA5+5GK9hSBMe3Ricxvl1Pa6ff9mEmhLQWftdrd2EQ8Ii
 af8XVWafzQAV9SZ5sU2vEYtpTx0cGcOFSFCzQ0ff68luqSfMKR7/ZGs/dw==
X-Gm-Gg: ASbGncufvUJPeyMyxyyzHoi3xNYrU/e5Rr+xMCCTHwvBXhp94CRKL46BqM5IYFpUEAJ
 4hJpquS/wgArw405PC4ZDbiO18YMFnwGf3HPy/wwxPLbsUqBEaTimZB1R9v7xC0MVb0e2P2P+yH
 uUIRFDLBq4KxrNXa182R27Ukm3tgLRp9w/p3mZSt5Hy1mtdmWSj7BBRxoD2q/ZtBMIzlHA2FyGJ
 Pykd57YQkAD0uCsN8uPNHrikrRNeVMUunRI137bzelhbBSeFjjToPnwHB+sFPuRQK+ijHVqNagB
 Mq3j6haf7xY6Sbcz2WnJ1oLrpnXmEE/OizQTEvaZTgF4SLOupeCZYjQkewkB1qs0eC5LAwsCdoH
 ffBoKfhtFiVHn+iE=
X-Google-Smtp-Source: AGHT+IFRs9s1zvJ2sIcC2vxf3EfjnMsTcV6crkXiUi8h852MPLYvXaJfrqAA6aYjxElybWjBLIhbUw==
X-Received: by 2002:a17:90a:c88b:b0:2fe:ac91:4667 with SMTP id
 98e67ed59e1d1-30a4e686b4emr5451445a91.29.1746205710645; 
 Fri, 02 May 2025 10:08:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a474768eesm3272255a91.16.2025.05.02.10.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:08:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 14/33] drm/msm: Split out helper to get iommu prot flags
Date: Fri,  2 May 2025 09:56:41 -0700
Message-ID: <20250502165831.44850-15-robdclark@gmail.com>
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 688b0c4e2a3f..ecafc6b4a6b4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -444,10 +444,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -463,6 +462,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
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
index 813e886bc43f..3a853fcb8944 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.49.0

