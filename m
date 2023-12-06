Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585E806BAA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A29A10E6D7;
	Wed,  6 Dec 2023 10:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB60A10E682
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 10:14:59 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9fe0ef02aso7475461fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701857698; x=1702462498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRXp7Tk+V86C1yaIiO+GTt7udFDOuzNm3PPg635Y8sk=;
 b=zXx7c5o/cUro793z0PbONDSgZ3p3pQlTXpJkQQE0LNFqeiX/s9FR0TjFYIZ8jwZE8L
 9eAaXDL1j8xsszIxB2iRkWZgUJXwNJglFz2mAkfqQQZN0h5BTpoqR22wH2FnMaeb02o+
 YZ84rwydW4GoLvRYXQT950LGlj4PNmCaagBKLSmF/ieukE/JCHrAL+7F9+Bs+tgL2+fn
 RSSt1pkNpY8byHIot2ezq5F4ENyh4so6SE5L7Ktp+kQ5y8DDTadaO6idiT0tveEG5IOI
 Kwl58/I5bhCkGdL12bMcBvQ8LqGBkIGqaQm9xsqnIFCUWs9YS9lhm+HDMsjHU1puf61o
 5u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701857698; x=1702462498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRXp7Tk+V86C1yaIiO+GTt7udFDOuzNm3PPg635Y8sk=;
 b=XYIV5B7p9E3uc2IISLThnfRzR1eT2UZnF4lOF/HWFzUdy56gy7M7hH7bBjKIgKCsGe
 1pgTTnC7Qh9WHA6AETH/hjK3NowYaNQFyu5B/8XkQ96WhpGdB4qCYUYgwm/5QTTm6w+e
 OzPMwiJdQdqjHnnDqsRLTvW3MA9GtLbNVMJCOl0bfc1fM2hy4l8br42zXtyiYzGA8tEm
 wxqCUawu4HpVpK7xY8WuqcbSRwcJ+KkIx6iL0CS/ygkrkNgUxtqtTjj4Hp5CTUolC5pN
 WQc+WWv9gvNcPVdF/nB/sZXt5J2+QKL7pnZYJOtEPDaJk2SepBe53FfrtWPPiyjsYo6T
 j9RQ==
X-Gm-Message-State: AOJu0YxvOmBBYQ8YNyd3jDQraA3so+AeSPcwO/YOAfhx6yXOY8bZPmuP
 4DFlGdu0W0wYxqTgeAFOMmhALQ==
X-Google-Smtp-Source: AGHT+IGMbYMSqyqDdJKBk/0nGjgxdwMTkaGVRTb1v+YfO6mN8GKGOSE5+h1FhJ1u/6em+Ea/fawNTA==
X-Received: by 2002:a2e:6a10:0:b0:2c9:f3d6:e1d with SMTP id
 f16-20020a2e6a10000000b002c9f3d60e1dmr576604ljc.15.1701857698158; 
 Wed, 06 Dec 2023 02:14:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c03c100b002c9e6cbf78esm1519012ljp.19.2023.12.06.02.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 02:14:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v3 2/2] drm/vkms: move wb's atomic_check from encoder to
 connector
Date: Wed,  6 Dec 2023 13:14:55 +0300
Message-Id: <20231206101455.1664463-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the renamed drm_atomic_helper_check_wb_connector_state() now accepts
drm_writeback_connector as the first argument (instead of drm_encoder),
move the VKMS writeback atomic_check from drm_encoder_helper_funcs to
drm_connector_helper_funcs. Also drop the vkms_wb_encoder_helper_funcs,
which have become empty now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 28 ++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 23c4f7b61cb6..bc724cbd5e3a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,20 +30,25 @@ static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static int vkms_wb_atomic_check(struct drm_connector *connector,
+				struct drm_atomic_state *state)
 {
-	struct drm_connector *connector = conn_state->connector;
-	struct drm_writeback_connector *wb_conn =
-		drm_connector_to_writeback(connector);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
 	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
+	const struct drm_display_mode *mode;
 	int ret;
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
 
+	if (!conn_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->mode;
+
 	fb = conn_state->writeback_job->fb;
 	if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
 		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
@@ -51,17 +56,13 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
+	ret = drm_atomic_helper_check_wb_connector_state(connector, state);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
-	.atomic_check = vkms_wb_encoder_atomic_check,
-};
-
 static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -164,6 +165,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.prepare_writeback_job = vkms_wb_prepare_job,
 	.cleanup_writeback_job = vkms_wb_cleanup_job,
 	.atomic_commit = vkms_wb_atomic_commit,
+	.atomic_check = vkms_wb_atomic_check,
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
@@ -174,7 +176,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-					    &vkms_wb_encoder_helper_funcs,
+					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
 					    1);
-- 
2.39.2

