Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1B70AFDB
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 21:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BD510E1F7;
	Sun, 21 May 2023 19:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253910E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 19:22:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f380cd1019so5985553e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684696952; x=1687288952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
 b=jnxrhtGKPOnumKOFqmzCjKhWr/QccFJoU/UZOXeSqL5f3kHkgcBzhZnUjDuCDhs/F7
 +RQQmrsw3aK3fNvSBSlwUgudk61C6ZLlpob/qYb8B78Eu1xMOOAeojlfCNa95eZ3NiGM
 Od0Q1D5wCC3TaUs1niVVVSKgrKr5g2UsqrwbaPYGEGeRyM9qtcG2omxbLkR4CSqDWSNn
 ulVPXnIOi+kgmu+4uP64hXECDqbRjWnnBlCFLyX/dQlBljIBazh1NDxGxOPreQ/EJVFX
 hFT80C7JeJIazxgw0ASdDcvZPq4m/JaO8LhyMLvVcrhZMu4h63PcZ0TQDgOdn0IgDP52
 dhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684696952; x=1687288952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
 b=VqYJ8ZRqY1ouag2PZXeQjdc6OzFqz/yWbsKsohO/5gd6wLDpPqnyO0YKp4TWyK+xXG
 utDDXP7mpaTrGRIT2qiPpl5KEoKsdmrC36kj2qQX2AYsVkI7Ya6revBUfNJkDB6xS4OS
 IWJvYRezBrQxGbJ5muvUrG4Xv9sGFbJBSc/6QXMV0a/jjMD9iGeItQtNBPK91rhe5dzy
 hK8S5GFNLVoUK4rnePMlYi/GuQE/55Xy2uHqmTvqjYMd0BcNukt1z4pc45P0+NecAHZV
 fUjkNHxslPYQtwXiBV7BwGk/KEdwbfy5cPHN31MFvga9FjFhAh7VNhPWJlCtnAr2trIV
 mdbQ==
X-Gm-Message-State: AC+VfDzLSVgK4HqLLLhaUfj42BZHPfsf6iMDdHvwg1AtDdfoPDZokYdI
 MKQm0hE2IgLOKXWrai4z5SmJJg==
X-Google-Smtp-Source: ACHHUZ4K/Tv/eWzuvSp2fQQkhbRq8GcIGoMuPJcUj1H+iiYPZC4+lBWGJCFv93++OxrjrVvbXntzVw==
X-Received: by 2002:ac2:5298:0:b0:4f3:7c24:1025 with SMTP id
 q24-20020ac25298000000b004f37c241025mr2693894lfm.26.1684696951949; 
 Sun, 21 May 2023 12:22:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a19f80d000000b004edc9da63bdsm692707lff.160.2023.05.21.12.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 12:22:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
Date: Sun, 21 May 2023 22:22:29 +0300
Message-Id: <20230521192230.9747-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This define is used only in one place, in dpu_encoder debugfs code.
Inline the value and drop the define completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c771383446f2..af34932729db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2116,14 +2116,14 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	char name[DPU_NAME_SIZE];
+	char name[12];
 
 	if (!drm_enc->dev) {
 		DPU_ERROR("invalid encoder or kms\n");
 		return -EINVAL;
 	}
 
-	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
+	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
 
 	/* create overall sub-directory for the encoder */
 	dpu_enc->debugfs_root = debugfs_create_dir(name,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 66209e2448d2..c4f82180ad10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -63,8 +63,6 @@
 #define ktime_compare_safe(A, B) \
 	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
 
-#define DPU_NAME_SIZE  12
-
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe30611..ac75ba13aa01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -42,8 +42,6 @@
 #define SHARP_SMOOTH_THR_DEFAULT	8
 #define SHARP_NOISE_THR_DEFAULT	2
 
-#define DPU_NAME_SIZE  12
-
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
 #define DPU_ZPOS_MAX 255
 
-- 
2.39.2

