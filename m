Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8576B999F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9110EAA8;
	Tue, 14 Mar 2023 15:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7A610EA9A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by8so16435551ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k60sFdJN1kPn6kscyvUp0PFhXvrM4Q5nS6rIPfuIuR0=;
 b=Q3Q+s/+D2Ka3JzKAEWLqfiUtK5BqfX3YomkIj9jSV3o+804aON7rZRHl5nDx40gHwC
 F2m37aiN3gifb2tz1nxJABzBquItEbIwpftNHJPJbxMCpCrRZIeKYvHV87VhVqV/QZft
 keqzG2xYhJqezklOia7lKF0nuT/BNS0kS1XXL3QFj5zy95rDQ0dYJntfDEmv95s4O0W4
 trMWJgBgrQ5SH+0ojan0ulNI+GBl6s1l+k/U+aCwfoY6YzV4m4pusABuOOylj4sOUYQE
 cWPZpekVvBcD3V5e3IHDCCbuvg+u4txgxAlJWy+BQeFWu6pae4NXnLel02goBh2ZqbUA
 wXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k60sFdJN1kPn6kscyvUp0PFhXvrM4Q5nS6rIPfuIuR0=;
 b=5sPQBWvjPQ6Yfg34rYvev2EZwy/9aeZuw7NBVTdI/hicr0xgu7zVoe3A8BW/WtUFUr
 SekgeMYBEGIQlN3GOhxdigy1L4KII2JK9K32aCEiW6Xm2naVYJoBrFMmeSaKf3VOHclz
 aBYm9kN45/lLFa/4WIrZWO0Q9UOacXLx1GKW11Emkie+FUWH6jChEozINI1sur0egyd9
 xqti6OoQoYu9JF7GKW73k7NVh4astehLCVtOOho+IBt+4m0Sanf6ZwMGtTXdgd203AUe
 krQPzqMNa/eYMAOKmTOJzN/FJeENq4L5q2t5jUlBN58oH3bPIiPU65T4tLc7gD7ZLvEZ
 waqg==
X-Gm-Message-State: AO0yUKXkmbVK3kWYnVGow0TjKDuVQYeMnvmV4GJCLVXKEy5JwQPA29Sd
 Z/bJG+QZ7CbZuCvMfkNbT52cxg==
X-Google-Smtp-Source: AK7set8NPTdyXNGPppQPMA/e4lR11TMKXWQcL4UY0T7G7LkmfK9pPnqFGu0/yJLXDGAIHKaVt127vg==
X-Received: by 2002:a05:651c:50a:b0:295:ba23:44ea with SMTP id
 o10-20020a05651c050a00b00295ba2344eamr14934435ljp.44.1678808155483; 
 Tue, 14 Mar 2023 08:35:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 13/32] drm/msm/dpu: rename dpu_hw_sspp_cfg to
 dpu_sw_pipe_cfg
Date: Tue, 14 Mar 2023 18:35:26 +0300
Message-Id: <20230314153545.3442879-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As struct dpu_hw_sspp_cfg describes only the source and destination
rectangles, it is a software pipe configuration now. Rename it
accordingly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ++++++++--------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index e87c6377f315..6e5b62f3276f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -447,7 +447,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
  * dpu_hw_sspp_setup_rects()
  */
 static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_sspp_cfg *cfg)
+		struct dpu_sw_pipe_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 100d8e06c90d..e73d6ac863ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -153,12 +153,12 @@ struct dpu_hw_pixel_ext {
 };
 
 /**
- * struct dpu_hw_sspp_cfg : SSPP configuration
+ * struct dpu_sw_pipe_cfg : software pipe configuration
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  */
-struct dpu_hw_sspp_cfg {
+struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 };
@@ -228,7 +228,7 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe config structure
 	 */
 	void (*setup_rects)(struct dpu_sw_pipe *pipe,
-			    struct dpu_hw_sspp_cfg *cfg);
+			    struct dpu_sw_pipe_cfg *cfg);
 
 	/**
 	 * setup_pe - setup pipe pixel extension
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4ae70d21c37a..ce01a602cbc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -136,7 +136,7 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	struct drm_framebuffer *fb,
-	struct dpu_hw_sspp_cfg *pipe_cfg)
+	struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
@@ -191,7 +191,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_sspp_cfg *pipe_cfg)
+static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
@@ -275,7 +275,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb, struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct drm_framebuffer *fb, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
@@ -421,7 +421,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
-		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct drm_crtc *crtc, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
@@ -635,7 +635,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 
 static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_hw_sspp_cfg *pipe_cfg,
+		struct dpu_sw_pipe_cfg *pipe_cfg,
 		unsigned int rotation)
 {
 	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
@@ -694,7 +694,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	struct dpu_hw_sspp_cfg pipe_cfg;
+	struct dpu_sw_pipe_cfg pipe_cfg;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -1130,9 +1130,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_sspp_cfg pipe_cfg;
+	struct dpu_sw_pipe_cfg pipe_cfg;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_sspp_cfg));
+	memset(&pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
 
 	_dpu_plane_set_scanout(plane, pstate, fb);
 
-- 
2.30.2

