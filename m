Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206076B332D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052FC10E922;
	Fri, 10 Mar 2023 00:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346910E904
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d36so4607433lfv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9A1yItHnVjLCkkrvFzWKL06/fFB2ivnHBT1T8+CFDyw=;
 b=hqNtdpeN0qA/VDzX+xaYgXdG1SGV4mkzKGwKdgAEzTbRbplqCdlOHjIt9wsuvDGXLq
 dp6/6cutFqLqDcgWGUj+9By9Eaie6E9b10xw/CWCbECapkvakU07fWIcS8vjPDixbD3j
 yOufhnQ7wbQqP0nlwjINmC3uMc4Mm2lrPz1fhFOSagyrjRyVML68MhVa+jopN9tO4aXX
 nLzKA2swfO2UxqQbPY1UTVr48jRGwC5VzDcvWthc41b8ZfSTeAfrv70x7bBmzRnJaskS
 GPiAHozg3aAjmX9FO5rikOhhxMM5hZ37uJ+nFhJ+dp1QsKUWkPfDJinSDRlpAxS2MjNN
 WNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9A1yItHnVjLCkkrvFzWKL06/fFB2ivnHBT1T8+CFDyw=;
 b=EFLGAKX+t7PXjvuW9uruGPFjJkZ5Msp+z5as4We4pExbc4jAeYgazKFb0KhQvW6lhk
 J0IQCiSgVT9Iay/Baobhi2I7DR1sFu4nDwpIVhE2kyaLRuV1yg4knSSGmZtpKkr3DuZP
 Wzu6Fg4KYUufMguIH1TsRVKAw0Sdo9JnVEbOmHDNAaM6sDb1gxNKHGarfkpLfSLUbyqd
 +oGgKJWtavaIxMgwdSeg8wH0U5n0TpjEBsI7zNIffhSV61Eghvfsl4FecsCtny8d8DIX
 XNUBm/JanUN0HW6avVkLI+gBJ1Qw3/KUlAva3jsgugch2c71w0rDXAiOINoTVHBVFbNc
 v9Ag==
X-Gm-Message-State: AO0yUKWYNNQ/NBzCQOVviqp9YYuqn0cxT6PDZ/V8ZUOKu5JTcnsLj7i7
 xNj9Gy6g+eEiPHdMTKGVD+AR3A==
X-Google-Smtp-Source: AK7set8PF3o93TT82oaIRMCY/7HXjV3rnm1RFw71tbPGgfwLNNSXTr0cds2GA5c1spUaRPlphlvLfA==
X-Received: by 2002:ac2:533c:0:b0:4dd:a7fb:1e7c with SMTP id
 f28-20020ac2533c000000b004dda7fb1e7cmr7447177lfh.3.1678409837022; 
 Thu, 09 Mar 2023 16:57:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 13/32] drm/msm/dpu: rename dpu_hw_sspp_cfg to
 dpu_sw_pipe_cfg
Date: Fri, 10 Mar 2023 02:56:45 +0200
Message-Id: <20230310005704.1332368-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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
2.39.2

