Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA114ECE31
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B008910E8D5;
	Wed, 30 Mar 2022 20:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E21910E93E;
 Wed, 30 Mar 2022 20:47:53 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id y16so9142010pju.4;
 Wed, 30 Mar 2022 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldA9Mhj+0mZCxGshcEo9t/60BKvUL5CRDf8xGkXfdGo=;
 b=lPIT/WDBI7h0jSYCTMxfH2uW+XNKl+dSPF9A6KLgXLvPui73Swrq3Q1Q3AZg/DX0q3
 +ILslReszOaZipmEUbTHMLnsqVfTJ9yEiM8hbPd/AXsL6lLCbhjBxI5szwGsTeuz4PXN
 JGTd7r9ax2P4rnbV+gzD6ftAIBm8grCaA0+C+YWplgI/cEU+729K+Dw2xjeRsRAbs1Mj
 jEUx5VvmE6Y75RXC5s8Yl+rJMHsTz5FZLydGXMPv0N/0XWKtiEHKeM3tOd+nxuDuUrng
 6Guam7SiAaXysw5rNN8ugEYxVvLXAd/7Y4pidtUZj8kdg/fJ6Djy34tH5qFwpyI1LWBK
 y/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldA9Mhj+0mZCxGshcEo9t/60BKvUL5CRDf8xGkXfdGo=;
 b=Wp/wmBjM74PB13zT/6TSf7FcdCWJYGrPiGquCLGsxZYFn6TwJyngXeEmELIGtVpjIq
 q9z/Peu8ipwkoIRbttDDVagEmPNissKP3mftNpmYhbZ1Tm74HIGZHAv5ozixq2IyLQZ4
 31hHKdWU4FiE5ja62HrjuvUjc8rwULD7JM6n98DeUhFpriIPXtgBcD0oYe4E+hlxcBye
 W8EiDTpSA9zd4ZGuru5+cvz82s9s+pP0A2f2ofxdv+GSI+cnZfhWtr7MZS5cFyEKL6fu
 IWA4V3J2FohuoxiCfeJsBD0rxHgdYzo8K7kqJ+23pWRqMOlloTb+0FO2pZNF+/yM7QSe
 uJAg==
X-Gm-Message-State: AOAM533isC5AfFvqOKGDt+CWYai+3jWgbTkURc32JxlsEFA6h2nHPMKV
 AOyyxKQizFa7xNdUHWdL2RJ/yOdGk3c=
X-Google-Smtp-Source: ABdhPJysfQC0ENwfzI6jQB6u/35Gy9KhZqGh43AyIEW8pA1f1g9B+MQW/gPexaDjtmrxvOJnE1wXDA==
X-Received: by 2002:a17:902:ab59:b0:156:17a5:5de7 with SMTP id
 ij25-20020a170902ab5900b0015617a55de7mr1592725plb.6.1648673272187; 
 Wed, 30 Mar 2022 13:47:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a150200b001c9f1a7aafesm3448919pja.29.2022.03.30.13.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:47:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/10] drm/msm/gem: Move prototypes
Date: Wed, 30 Mar 2022 13:47:46 -0700
Message-Id: <20220330204804.660819-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330204804.660819-1-robdclark@gmail.com>
References: <20220330204804.660819-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These belong more cleanly in the gem header.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

