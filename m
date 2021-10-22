Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B814A437B28
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 18:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4723E6EDA8;
	Fri, 22 Oct 2021 16:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9F46EDA8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 16:54:21 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id k19so2799497qvm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b2w3PlPqpKQiMzqSOq5AVpJBVHNhIVKPGfoHVzEVCds=;
 b=LMCZZ0U72keGDqd5g6LTFWWQiy/YVwZc2dAtLXVKcrdmCzA12oJxAZH5SvZ3f1H8bL
 tu1tWEQevUx5Pw2nn+MvTcDRic/fdC2Ek13oTIxJ8sObiivCqSYWNecE0DEsV7rDem22
 njqjHUvJLa4TbcemjASBSKJhnCYr9lJKJywmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b2w3PlPqpKQiMzqSOq5AVpJBVHNhIVKPGfoHVzEVCds=;
 b=0uxN5SP54i79wb7PI4dzNRyu9BIedXFMmnvfnptZClTPpi4SN0y96k5aahjBATq8l8
 O2XDvPe+OKiuN6wb4NCDIAvNbEBsRfa2AzcE/uJtpfuFQGoaBf/gUKcWx9mAA1KQ0JW/
 BQWKrl0CamXvj6pcA/qWwvSzC35BA4W3K0w/pKQHKRG8YbXD3xGwYIBSMgZafreClssm
 e/Ij7/UcpSGV1Glpcwzf9CCxGhSHuJEYr36BKCYa2xsdpZfbkJzNUq/J/btVcTUEA4aM
 SHn+yDXPKxkcDBwZcXXhy3ugbX9q9DRCeoCyI2YlaMNVfUjgBcarsIfl59OaCJFXm1B6
 ktVA==
X-Gm-Message-State: AOAM531JhnaYmJrmWFELKFhlnTaZXq30WBs5W1QM0yumTaahwzprU7IQ
 bUK8PDsnAkLdl8dVpDNiHdVbkg==
X-Google-Smtp-Source: ABdhPJxDLKxCGk4B/SAq3N2iCVgytTX5QVoCrgIAKMUMHGtLMrozyd23amkOxXpGmY0w2Lb7ge9JfA==
X-Received: by 2002:a0c:aac2:: with SMTP id g2mr696582qvb.41.1634921659807;
 Fri, 22 Oct 2021 09:54:19 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:6c36:8d9f:c50a:b0f0])
 by smtp.gmail.com with ESMTPSA id p19sm4432133qtk.20.2021.10.22.09.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 09:54:19 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Set Rotation default value to 1.
Date: Fri, 22 Oct 2021 12:54:02 -0400
Message-Id: <20211022165409.178281-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
The Rotation prob is a bitmask value. It must always have a valid value.
A default NO rotation is equal to 1 not 0.

[How]
1. At the reset hook, call __drm_atomic_helper_plane_reset which is
called at the initialization of the plane and sets the default value of
all planes to DRM_MODE_ROTATE_0 which is equal to 1.
2. At the ovl layer check, do no overwrite the state->rotation value 0
if DRM_MODE_ROTATE_0 is set. We should not change the value that the
userspace has set, especially if it's an unsupported value.

Tested on Jacuzzi(MTK).
Fixes IGT@kms_properties@plane-properties-{legacy,atomic} and
IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 20 +++++++-------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  3 ++-
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 86c3068894b11..2fc566964f68e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -64,7 +64,7 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			struct mtk_plane_state *mtk_state);
+			const struct mtk_plane_state *mtk_state);
 void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			  struct mtk_plane_state *state,
 			  struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index ea5760f856ec6..13999564304bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -190,19 +190,15 @@ unsigned int mtk_ovl_supported_rotations(struct device *dev)
 }
 
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
-			struct mtk_plane_state *mtk_state)
+			const struct mtk_plane_state *mtk_state)
 {
-	struct drm_plane_state *state = &mtk_state->base;
-	unsigned int rotation = 0;
+	const struct drm_plane_state *state = &mtk_state->base;
+	unsigned int rotation = drm_rotation_simplify(
+		state->rotation,
+		DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y);
 
-	rotation = drm_rotation_simplify(state->rotation,
-					 DRM_MODE_ROTATE_0 |
-					 DRM_MODE_REFLECT_X |
-					 DRM_MODE_REFLECT_Y);
-	rotation &= ~DRM_MODE_ROTATE_0;
-
-	/* We can only do reflection, not rotation */
-	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+	/* We can only do reflection, not non-zero rotation */
+	if (((rotation & ~DRM_MODE_ROTATE_0) & DRM_MODE_ROTATE_MASK) != 0)
 		return -EINVAL;
 
 	/*
@@ -212,8 +208,6 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 	if (state->fb->format->is_yuv && rotation != 0)
 		return -EINVAL;
 
-	state->rotation = rotation;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1b582262b682b..530bdd031933f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -53,9 +53,8 @@ struct mtk_ddp_comp_funcs {
 	void (*disable_vblank)(struct device *dev);
 	unsigned int (*supported_rotations)(struct device *dev);
 	unsigned int (*layer_nr)(struct device *dev);
-	int (*layer_check)(struct device *dev,
-			   unsigned int idx,
-			   struct mtk_plane_state *state);
+	int (*layer_check)(struct device *dev, unsigned int idx,
+			   const struct mtk_plane_state *state);
 	void (*layer_config)(struct device *dev, unsigned int idx,
 			     struct mtk_plane_state *state,
 			     struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index e6dcb34d30522..accd26481b9fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
 		state = kzalloc(sizeof(*state), GFP_KERNEL);
 		if (!state)
 			return;
-		plane->state = &state->base;
 	}
 
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+
 	state->base.plane = plane;
 	state->pending.format = DRM_FORMAT_RGB565;
 }
-- 
2.33.0.1079.g6e70778dc9-goog

