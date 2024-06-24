Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFA9915894
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B0710E256;
	Mon, 24 Jun 2024 21:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YLnWhhny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCAC10E266
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:52 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso58638091fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263630; x=1719868430; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
 b=YLnWhhnyASSskgZFLUvQ4EKiwoNsow6BIpoKW0KTJvJooSbq6XJLG27M3lOj5prl95
 gkwg+ebP3lKPeRrjdN/zVjJ256EyQzrz7SyUVRyBALHodUfU4TkSygoq18rDqatpG84G
 Td1OqUE+vs/WbLE7Hif33JuHz2xs+1uf2M4oct1NwMAZj0cor+oXu3XCdC6Z0L0hoZgw
 VJChSOdRJO0gLEuoI5fYufm0OAGV2JF6qZ24lKc+LHxhCbBV9symMlaKwSmbIxyiaWHR
 Q1FM5sQdwOQeicvnAw67uJp+spfvYGT4aGnM91IuH0rfyE1670AJhi4YLNTWMI5VQgKZ
 RO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263630; x=1719868430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
 b=d+xN7WPEmMvsdHvRy7pRvEi7GuQ3OkmUAsJYh0Z1cGORoupSov8cK7ATxUOZzU108K
 7QQ+df1hOLB8xMuKfq9w5fd64WcCZWEZDrWTGLNYZ8i94yF9/SRaQgmaokTFfoCfdEnh
 T+CEj1MbeR1K4Q/UkoUhI1BQ7lXWU6CrDCVYLTFPpmoyOZH3ByoaZ2sG9gvOsEOUEokn
 ade5Iu1Fw8pHeoxGXpOS06vDfCx4NxJOUpd55ECdQiR6UTOMez8ogGH3pWSI93lYk4V9
 vqtgr07BbzsJp7uhmC2InkoRT/got7QFcjUadneqBBQSX5caSqMx6I48IOs2kM1BXRL4
 vgLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGz3g15eeO3haK2evJMdkwR3zQXqhrffF2I4Z2JoOIomx9nbImN2jiRBVJgZzjoRYLXC8uJ+Uvu82w0AXdu+ZwGbVvcIkFU5P3PBWTOsck
X-Gm-Message-State: AOJu0YybrdDBcoVIDoUb2J3Hg2Fy9JBn3Dz7+DUM8sLkfzijVtaS9hQy
 mdajhIL7INeTDpMoQe8PVkqHTn8vWY2eZqkB66ctU6d3jn5u0PtA4cL5J0WiGMs=
X-Google-Smtp-Source: AGHT+IGyGPp99oq4Tb6z7Mf6u8KLobjMdJrAmeINy0arfJBBJO7Y5Kp2tYMUAvNgwH7MdlLaiJXaag==
X-Received: by 2002:a05:6512:b1d:b0:52c:84d1:180e with SMTP id
 2adb3069b0e04-52cdf826746mr5092059e87.67.1719263630644; 
 Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:46 +0300
Subject: [PATCH v5 06/16] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-6-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EolmHRhwGXXQUzrkytdeQx4Mh8dKlNx5sMNxyMkQHl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGH4G8AYzcLriv7wCQKxlgJ7zw7WmKapFAg4
 hnWwOtHK1eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1adgCACCOrmmoWBBeDESFtrf3scoGYQE8Lvq4b+Xt9enahMjE8eBGftf5YG50NEjkLlIIKDD3qL
 3ILskOYwmjKRZaAp4zEM4OlL4fOAankKF82agbLZzmobJKpGjv2UrYQi4JzFfF1DrElnB3GtQnN
 gKYwRT4CvKbhHAJQmoctC2rT2pS2ptkkvdzLNAUmb2o5e8hRr3w3A2IIg48q4E6HabUbMXyXQis
 X91MSSqLgOinZQ4cQJZo2omRhtJykqqM43Kt6Hu9OtCFjGDcejLq9tV0y+k9crg/I45/BoOyEG1
 eIuJnrNvBOKuFIkL8yvRk9hN2VnO0pnS+TYonSaSjGtkNAXz
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

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index eabc4813c649..241c2d7a218a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		if (pstate->aspace)
@@ -1103,17 +1103,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1128,12 +1117,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

