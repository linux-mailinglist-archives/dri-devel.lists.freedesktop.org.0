Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B784E3F8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428EE10E905;
	Thu,  8 Feb 2024 15:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DdeNQ/EO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5501D10E8E4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:20:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5116930e92cso2479758e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707405645; x=1708010445; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pC/PDWcQRheeYf8XjJmgksNYtRgJgVOixG33EFNcwjI=;
 b=DdeNQ/EOLQy8HLQGqxND9Ry3uTsxRyJKSwduQUQHWnlA7ikyVcMUatdPyWaVMU5P+3
 xPH65K193k0cyGd/UzlMfO8oRHMKEQFWuA6uX0X2BB94XKE78yNQVFHDqtz0of+Hsbq7
 LEAu1OjH/ai0R5NUM1GwskcMoqC54LzSQ/6qghIZOjtkD2XBvQriKhAiENQ6DfzCzytL
 UaIGLUZM3yOkmKd0q3I4K/BGflVgvf0QtJ/DfAKkqucaRngv3OhFH1BDB0AnEEUkI/Tl
 YfF5HYAX1rHXkIlfvcb7sx4kJ6ZyVJ1+s+ZeBa1XpSyH42BcpZIVRNm5NPs7Te4FUHR9
 Hlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405645; x=1708010445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pC/PDWcQRheeYf8XjJmgksNYtRgJgVOixG33EFNcwjI=;
 b=IHKMdNTBB1n/2kttj002AM62U3HW4M9tYGD8N9DUgGpaS8bRMuVk1OORxfOiqVHYXE
 huKQrHEorgj84AU0qQOCVXMM/JTFoIklHLQUlT+bA5fbvXtsf9gzX3cve0HpBE9pAB/y
 IzrRz6AwE/HXEpRFNGdiyt1dD8YoKi70AL5teL4kGlKPhL7WPjs1vnvc1QyzTIjBBMom
 6B6QZeF3q7XoVIvk6hG9GyEjA5nHVoU7ZZyw8VScgDrDD+e9SmbTMzordIp1bPhrzVG2
 FQYG9rkfYrHo0Ny/WgpgpDjBHUFsOCq5uywDZQMSKpQVfR9iey5fcA/fzCD+OUzUWqxJ
 gdkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIgdv6WOC1eGj0172DfghW6iCjKCzOgWiqoaIV0kCbQSiUYGIUg4874p3CHNN9A4XAlv3VWFYqpgDmvJJCgj76e1gfnHwKYel+YB+CAKt/
X-Gm-Message-State: AOJu0YxNgdfuZFnSyhP6Z7DmRQBTWIlkHB2PzBE34kHVGpCIR1eTOc2C
 69/XcUEzzO1coJgb3CTlMQVtlBrRsaPdQLLtJ+R8pnjCPu+Ip85pSpIRMSaXdRw=
X-Google-Smtp-Source: AGHT+IGfkvIBl1tCwMg5S6aud6q+dr/3WHXR31fCRRsRnKqaJGem0mdsIVcVwnYFuH7kEKG14V1OUQ==
X-Received: by 2002:a05:651c:40e:b0:2d0:b244:5f09 with SMTP id
 14-20020a05651c040e00b002d0b2445f09mr6464940lja.51.1707405645506; 
 Thu, 08 Feb 2024 07:20:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXfDRmeFtvjafuLJlpzLb6nxj2j5UcyZx7RPqnyhU3LWCLiiDzxIHShSK52CbLOxI3RYPAMrtJildE6cZJz09ucZ5JjQPYYWD2bzAnTWgISfE6NmyMtkQqoNmcLS8+QatnTALLnADvIPDh44CfbGuCnhF0S5Jaj65kz+jkdFMwcTKwZn/A0dWDDpZv+qcYS3PfjkR3ucqJKQApLqpDXACPGwMpSke1X5FaucJHkhHpD6J/q/IbuvrQcyomS+C7W8x2eiQQFPerYQcwtbm9l1gpC4uryjZpaGmhU56Vh48eEILhIYJDNiv5BAfm3T7XgK08rVJpNU3QURTz/ts=
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:20:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:44 +0200
Subject: [PATCH v4 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8940;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2rCn7C1YhtjsYqne1aRvV4AlIBM4M2R0IVdZGBbTf9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFKdlklz9ZdGTp6kloAC8JZdl6sbDcdFvOxT
 1pUkLWY2n+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSgAKCRCLPIo+Aiko
 1XTZB/9GLQx27iJL+ayqixz9YFJufLioA43Y5hINTMpvUvWgvFxgeAEslxPQX/fL4fejZFz9MuA
 bcC36wv4WdBIZrPk71bd+KBZ9amJmLkCldzBC5gU0Bjsjqx/E0+nKmInWlyC0+uaJ+amu7SGsRu
 2rTnKw63cyIaZ/o5PuptNcE396cl6sksla29EjtREBTn4i8CHQbfwgRWldx1LyGfi32cSUyGLqV
 8OPHPqGH4hmhwryJ6+mVKDMA5wY1UhXolKnik9mjKptvlkOGblJwijI2EcYzGwC9Y4NUvXMByGk
 TW/594NgkB33DvxZ+HTAy8BGchIsp3NRXnm3ISP4F3z+gHC8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
Move corresponding checks to drm_writeback_connector's implementation
and drop the dpu_encoder_phys_wb_atomic_check() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 54 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  9 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 61 +++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  3 +-
 4 files changed, 68 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a0a28230fc31..8220cd920e6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -354,59 +354,6 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
-/**
- * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
- * @phys_enc:	Pointer to physical encoder
- * @crtc_state:	Pointer to CRTC atomic state
- * @conn_state:	Pointer to connector atomic state
- */
-static int dpu_encoder_phys_wb_atomic_check(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
-
-	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
-
-	if (!conn_state || !conn_state->connector) {
-		DPU_ERROR("invalid connector state\n");
-		return -EINVAL;
-	} else if (conn_state->connector->status !=
-			connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n",
-				conn_state->connector->status);
-		return -EINVAL;
-	}
-
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
-		return 0;
-
-	fb = conn_state->writeback_job->fb;
-
-	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
-			fb->width, fb->height);
-
-	if (fb->width != mode->hdisplay) {
-		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
-				mode->hdisplay);
-		return -EINVAL;
-	} else if (fb->height != mode->vdisplay) {
-		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
-				  mode->vdisplay);
-		return -EINVAL;
-	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
-		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
-				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
-		return -EINVAL;
-	}
-
-	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
-}
-
-
 /**
  * _dpu_encoder_phys_wb_update_flush - flush hardware update
  * @phys_enc:	Pointer to physical encoder
@@ -777,7 +724,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->is_master = dpu_encoder_phys_wb_is_master;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
-	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..48728be27e15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -630,23 +630,26 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
+	const enum dpu_wb wb_idx = WB_2;
+	u32 maxlinewidth;
 	int rc;
 
 	memset(&info, 0, sizeof(info));
 
 	info.num_of_h_tiles = 1;
 	/* use only WB idx 2 instance for DPU */
-	info.h_tile_instance[0] = WB_2;
+	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
 
+	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
+
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
 		return PTR_ERR(encoder);
 	}
 
-	rc = dpu_writeback_init(dev, encoder, wb_formats,
-			n_formats);
+	rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats, maxlinewidth);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 2a5a68366582..16f144cbc0c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_framebuffer.h>
 
 #include "dpu_writeback.h"
 
@@ -24,6 +25,61 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 			dev->mode_config.max_height);
 }
 
+static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
+				    struct drm_atomic_state *state)
+{
+	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *fb;
+
+	DPU_DEBUG("[atomic_check:%d]\n", connector->base.id);
+
+	if (!conn_state || !conn_state->connector) {
+		DPU_ERROR("invalid connector state\n");
+		return -EINVAL;
+	} else if (conn_state->connector->status != connector_status_connected) {
+		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
+		return -EINVAL;
+	}
+
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return 0;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	mode = &crtc_state->mode;
+
+	fb = conn_state->writeback_job->fb;
+
+	DPU_DEBUG("[fb_id:%u][fb:%u,%u][mode:\"%s\":%ux%u]\n", fb->base.id, fb->width, fb->height,
+		  mode->name, mode->hdisplay, mode->vdisplay);
+
+	if (fb->width != mode->hdisplay) {
+		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width, mode->hdisplay);
+		return -EINVAL;
+	} else if (fb->height != mode->vdisplay) {
+		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height, mode->vdisplay);
+		return -EINVAL;
+	} else if (fb->width > dpu_wb_conn->maxlinewidth) {
+		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
+			  fb->width, dpu_wb_conn->maxlinewidth);
+		return -EINVAL;
+	}
+
+	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
+}
+
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -59,12 +115,13 @@ static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
 
 static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
 	.get_modes = dpu_wb_conn_get_modes,
+	.atomic_check = dpu_wb_conn_atomic_check,
 	.prepare_writeback_job = dpu_wb_conn_prepare_job,
 	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
 };
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats)
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth)
 {
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
@@ -73,6 +130,8 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 
+	dpu_wb_conn->maxlinewidth = maxlinewidth;
+
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
 	/* DPU initializes the encoder and sets it up completely for writeback
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
index 5a75ea916101..4b11cca8014c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -18,6 +18,7 @@
 struct dpu_wb_connector {
 	struct drm_writeback_connector base;
 	struct drm_encoder *wb_enc;
+	u32 maxlinewidth;
 };
 
 static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
@@ -26,6 +27,6 @@ static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_conne
 }
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats);
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth);
 
 #endif /*_DPU_WRITEBACK_H */

-- 
2.39.2

