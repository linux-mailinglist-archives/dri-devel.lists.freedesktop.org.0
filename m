Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FE964155
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93EB10E626;
	Thu, 29 Aug 2024 10:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QUgvsW2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8635C10E624
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:39 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-70f60d73436so220614a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926839; x=1725531639; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1Q+hoiaQgUkbwBnUwr/XhQnF7bzaey6Ce3LFLI7Ja2A=;
 b=QUgvsW2eTGIL8A1fqcOElKlQfSvNN2QKgbDqofh4vR9dJpJyOGHu4D4DXR7WXxKBil
 6W8IYGXNhJ6WlUHRIJS/7H0jviTo4luGmPJ0v9JekXVo68N1XGy6aBuC1UjS3RCA4SyZ
 DEoVCvOdb12riqJFW4ZB8YAevpHkhxUrgGTO1BaQGTOMZZR+dGmy72jE/1cVQ8eC94LO
 QgplumOnIUHvVWwZ0+daoLI0naJLhWu2Z9x6RF4uRhVX8lPKIpW91sOEddYh9okGqqmA
 1xftezD0L33SPiJv8gadgclzVaZF8wOLMHLzQkQGp1iKe2o9ohY6eMsK0Tpo+qIGpo58
 IUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926839; x=1725531639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Q+hoiaQgUkbwBnUwr/XhQnF7bzaey6Ce3LFLI7Ja2A=;
 b=J9BGLannDeVUf+R0z1paE83Uh85PheNkG2F5g16c4wQl2dRgbcxItLVdOn4b162j54
 KClc7KhOicvzbbO5ZKq7E8k7N8j86OCQwpyx4SKhn6ehiJxzwNXF3YTM8vyizaRvtg8E
 AIxHEhxzKKNZjOAjp621uqXF7QKNE7HIgWSseWDK0GvYfyeoeq0qqPVYuGi60thzgZYd
 16wtELNiriDN/PdeIakxT/n8CVU1ov4joc3o9krs7kmMIw7oWvCU1qtrnR+f+Nwqwc9e
 jdQVR7eFcb+ICeGXHh16k6wNx0vv8cS+iYsL8AX4a3bh0SWhEKoNaYy0hpjMG1odaOBE
 sh7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQy/SwuZHuzwkyFtJO/1S6V942hmURGWF6TXNego3S6fIBhgBVGACxsz7ja1ZRrUGxMdtn68xpkkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR/69Uk3qAzJSRfFUZsLJP5rPeyPXexv4V+dIOjFyvo/w8azYB
 7KKHbZvUgDHEnMEUhMJCoKTiY1qJ6C+iZAFviNIZiLpiCu2UiTRVPwrKyPfq578=
X-Google-Smtp-Source: AGHT+IHURAx1tsooOQ3BpeNpvN7C+aX7izExrX/ejBiTLN/buCsOS1Ed3EVamPLK9mdcOKp9oyzFHg==
X-Received: by 2002:a05:6358:720d:b0:1b5:a060:678b with SMTP id
 e5c5f4694b2df-1b603bedfacmr293928955d.3.1724926838743; 
 Thu, 29 Aug 2024 03:20:38 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:20:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:40 +0800
Subject: [PATCH 11/21] drm/msm/dpu: Support 4 mixers at most
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-11-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2904;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kZcvFgM7BrpSSre+N3AhgJe8dih69TpaDCUeGk49yQg=;
 b=mFqZD0eT2dw9oeR2ZHc0FiJ57u/AjSO6ItzK6quKx8cKBjBQSZcjkn0eto2YSWy861soD7tvs
 4mW+Vaq5lU8A//Ocif+sSqA4ajsQ0iqXDMNcWh8CU+Q4fsNjOfNLRbn
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Support 4 mixers case with increasing array size and checking
the usage case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   | 1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d9f26e189eebf..2c21a1e13d32f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	u32 crcs[CRTC_QUAD_MIXERS];
 
 	int rc = 0;
 	int i;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 701c35803633d..08fc88d03bf6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e77ebe3a68da9..c877ee45535ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -324,7 +324,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
+		dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf86d643887dd..f79ecd409a830 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -25,6 +25,7 @@
 #define MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 

-- 
2.34.1

