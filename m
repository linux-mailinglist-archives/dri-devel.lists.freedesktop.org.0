Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF04F6D31
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97A810E5D7;
	Wed,  6 Apr 2022 21:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A040410E5ED;
 Wed,  6 Apr 2022 21:46:25 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id x16so3667349pfa.10;
 Wed, 06 Apr 2022 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TY916nBD4Ut+Nhr5Owf/4x969nS99vGSEISx8LykC4=;
 b=RJ82q/cfiKsbkefiepDYfZNa42h6RfiRlOx3XMeKBk4g4TZ2bQLywvURpUAagmd82y
 lb+s8YkZD7kduSeDE0YyVYej1NL4LRXN0l9fG3C2MpJx+6SVOx8JeLjmKteMe8SLIfuW
 CGkJ45MNho5W0GFHKF6w5nFbnMQvlMstMOj5hSe5CP/y+RBuMaRdR3vljCA2m0Mv4TSX
 7v+JSNZAVBP5kANIIaTpOj/tc/HWx5NG/OA2utiNpqi0LZ4lp/ZBw7VSWrKJQ3LBRXmH
 KQqHeZ98Jyg1pobH5bGJw1vLEXmeqmi72Xx13uurFTEqzbxOgpY3ehNVLFWULRqpg8lJ
 wTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TY916nBD4Ut+Nhr5Owf/4x969nS99vGSEISx8LykC4=;
 b=M4OqNTomqe0CIRIEMKBTdlKltU4gesjjdkpp9jFLeu5a/9ooqnxjidPc1tjxeDAIhS
 3Gp3IpngGKIXiHi6OlRJZnt2CDp3sUYI1t9KdNEUPu79ZDreuAHS1O/Aq0vm6WuppQIv
 EdcTXko5b5y5WAzn3XY5oIJKTunws95hNrjKRshFkw4+dUxYG1gXtEsuG/AMgXmsWHRJ
 AuznP2l454C+NRZIWn1xnwbEi+X38MXHDzMYgSKMFVjxKSHnKQMWGzh/KVe5RaYnik9i
 nRo0Jf0/5fQ9RBqtQySn8a+3ESv2TK8rP7zlNnwocljZ0107y+lL1zBGyV3Ade2cDBoa
 JMWQ==
X-Gm-Message-State: AOAM533rPohchjJuwpy1IQ6e2PDbJwEcp1X2LZZOcFfY5crMoxp/iTlz
 /F4K6lHYaSgRsGQ/i19En7ig6OQnqso=
X-Google-Smtp-Source: ABdhPJymrujSWdJ9eDIu9KAz2sdq4Y92te8s4WDpBHev2kch1+67MiTS2se5qQj+U0MPP4ns3+HvNw==
X-Received: by 2002:a65:41c3:0:b0:363:5711:e234 with SMTP id
 b3-20020a6541c3000000b003635711e234mr8760600pgq.386.1649281584631; 
 Wed, 06 Apr 2022 14:46:24 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 w129-20020a628287000000b004fdc453b49asm20361537pfd.39.2022.04.06.14.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/10] drm/msm/gem: Move prototypes
Date: Wed,  6 Apr 2022 14:46:17 -0700
Message-Id: <20220406214636.1156978-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406214636.1156978-1-robdclark@gmail.com>
References: <20220406214636.1156978-1-robdclark@gmail.com>
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
index d661debb50f1..000fe649a0ab 100644
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

