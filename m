Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322674EB648
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9210EF21;
	Tue, 29 Mar 2022 23:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC610EE5D;
 Tue, 29 Mar 2022 23:00:19 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l129so7511700pga.3;
 Tue, 29 Mar 2022 16:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HO6I2POm0u4zmwdpBLxU6r8WEEIUM7eXGwS51/lbXgI=;
 b=kEg96PXe7kAMjNNH7hBJWDHdNlDN5mHc9bWx0I2xN9o+wbqkHmapOpDlZDNsc7e33w
 b2ogxdGajq4JEeGf2XoHa0UH6Zye9U7yOnXOJdt1HYeNs0hI7EPgu9HY4VdHqZuzFxob
 ofmEXNN5JZBCEEFahP2Jy6ka5N0x+mKrnVWQeDHi8EtLGOozvKtMXF9Ho4FKcMKfeJJk
 QENhX0mFmBhlXpIHk0UBsVadlH0n7C8ubUm9rj0PvooeXSIV+0jfUlWzfobnMDYBzUUe
 jb9bxnly6PW5Y0vL6VMZtWS7eAPCvxlYUO5sLPiVgVDoI5dd5XtFSFYKuT0/L5WFQkzn
 Wmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HO6I2POm0u4zmwdpBLxU6r8WEEIUM7eXGwS51/lbXgI=;
 b=Fnl5YTZ/VsLacvrHsNWkB5Iwb/k7FEpwtN3OdnCep2Ljj+BcgRL8qZ8srihNVQ5rOa
 icYkLr5ViZbWa1FeWUlQwpHURfAfR1kphrrIXgXJHlkwXd3dN4FfoyhMb9EMLsKnNpry
 MCIOS9M01NJJe59h7wfnb9HnIsKgY3dslWAInVLPTGvZMOucK/kQz5IJaCOBmlTSsar0
 izxjnV2l1THFqFuMtlDnYuXZtVFPNxlIhtarYNqtR2b5wap89fJb+PubdW1el5225uzW
 Z5mvwQwmrsrC70W6MAL1z9Ek+ObVle8hFnV+XYHYr1O33GrKPX1iz5+jMaXlyL/UbGNc
 eolA==
X-Gm-Message-State: AOAM5315PxkG4a8ezlJAgflPM6QXnhbFJtlurAtciX66PxHCiuOMJGb9
 lmW/tv2IpmEeEFn8Vz+d9jLnGv+hlHQ=
X-Google-Smtp-Source: ABdhPJz/VyzhfFtTmkbZ9ttUTwWM3Qh9cRS9VCNwxkdTgpEnA9rzY4JZBVLnGdiNnF8Kk/BmZk4/AA==
X-Received: by 2002:a63:b20a:0:b0:398:9e3e:d581 with SMTP id
 x10-20020a63b20a000000b003989e3ed581mr1694271pge.236.1648594818129; 
 Tue, 29 Mar 2022 16:00:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a056a00125200b004fb112ee9b7sm15742821pfi.75.2022.03.29.16.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/msm/gem: Move prototypes
Date: Tue, 29 Mar 2022 16:00:49 -0700
Message-Id: <20220329230105.601666-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329230105.601666-1-robdclark@gmail.com>
References: <20220329230105.601666-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These belong more cleanly in the gem header.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 23 -----------------------
 drivers/gpu/drm/msm/msm_gem.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f68aa685ed7..daf60d219463 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -250,29 +250,6 @@ void msm_atomic_state_free(struct drm_atomic_state *state);
 int msm_crtc_enable_vblank(struct drm_crtc *crtc);
 void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 
-int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int npages,
-		u64 range_start, u64 range_end);
-void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma);
-void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma);
-int msm_gem_map_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int prot,
-		struct sg_table *sgt, int npages);
-void msm_gem_close_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma);
-
-
-struct msm_gem_address_space *
-msm_gem_address_space_get(struct msm_gem_address_space *aspace);
-
-void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
-
-struct msm_gem_address_space *
-msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size);
-
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 58e11c282928..947ff7d9b471 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -40,6 +40,15 @@ struct msm_gem_address_space {
 	int faults;
 };
 
+struct msm_gem_address_space *
+msm_gem_address_space_get(struct msm_gem_address_space *aspace);
+
+void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
+
+struct msm_gem_address_space *
+msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+		u64 va_start, u64 size);
+
 struct msm_gem_vma {
 	struct drm_mm_node node;
 	uint64_t iova;
@@ -49,6 +58,19 @@ struct msm_gem_vma {
 	int inuse;
 };
 
+int msm_gem_init_vma(struct msm_gem_address_space *aspace,
+		struct msm_gem_vma *vma, int npages,
+		u64 range_start, u64 range_end);
+void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
+		struct msm_gem_vma *vma);
+void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
+		struct msm_gem_vma *vma);
+int msm_gem_map_vma(struct msm_gem_address_space *aspace,
+		struct msm_gem_vma *vma, int prot,
+		struct sg_table *sgt, int npages);
+void msm_gem_close_vma(struct msm_gem_address_space *aspace,
+		struct msm_gem_vma *vma);
+
 struct msm_gem_object {
 	struct drm_gem_object base;
 
-- 
2.35.1

