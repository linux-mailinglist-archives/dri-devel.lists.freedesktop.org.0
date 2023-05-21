Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A188E70AFBC
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 21:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEFF10E0A2;
	Sun, 21 May 2023 19:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6777310E0A2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 19:04:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so1035180e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684695884; x=1687287884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
 b=PdWPwOSn4lfj7ffc4GHQUp7BAeYOBLWIOAI8sZh83v5fokUirhtuSPDdqughJXa8FJ
 aZtdOyWWqwFc/sP13sEQHwgiOaPRZ0hceKvr4An6GjFbTprd/Lf0ldcJo+1Ad+H+SkWE
 7Pdy/iEUuZRynHn3w/UKObFQWLIm/yjXeOxuV6gnX7ZVF2vu90pB+2cEvmcVY/ObLzn8
 fvYo9jdw+fGLCAyZ4C7N+rT3eL0BHm5HF6jF7d2dA8jXG5XwXa9Tp2pFdGV4DxDKjUKy
 cuXUMqMkaR8pytZ/+1YN1b8TOpmL3SMBmG1xyJDuQ6rlVEYl1kPpqYikyEiGlxdi3+wE
 wlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684695884; x=1687287884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
 b=UGIQdHrhwTnn6zA4iMNVWoOkc2RqzvCPIBXXi0iDyPpYQTbJ6LsFC3/PZaaY60Avwp
 KdaZRkC0aQaBOoFnJSOWCO8z+tr5zp1VbLm47Q/wEr9LUMy91HJ51BC63kZpe97ME5RZ
 I6BYeH1Ivse0bEHLmDAiMZRDarMLg/sCszFCmapsf87keP8OSip7QQwHxWSgU1Tvnoy0
 F8EOIKsT5VAmHmRPXMqoiKMDaJ0+4akCvPr8GAm5bvvUiVIMm/RuuDk/bOQhZrl0V1l3
 6wlEQrYp5eGkK0+/sLfT4xc57TsUgWPectF/oR7aioEzNl+jpePZbYw7PTmj+5ISF73a
 cHdw==
X-Gm-Message-State: AC+VfDxbAQAHJEsKVVhooLSbrdRwGXpY2+INIYB/KIgjSmoZE5OK3AnU
 Phsx+dSpdRBjJ6PpHMmVff118g==
X-Google-Smtp-Source: ACHHUZ5KLyPcDMihVmWbsBXJBaR7W4XAp5A315zXXHlc1KZhux+m/uzZjrknqXCRVOC4stVRYAVugQ==
X-Received: by 2002:ac2:4e63:0:b0:4f3:5038:5857 with SMTP id
 y3-20020ac24e63000000b004f350385857mr2289443lfs.55.1684695884594; 
 Sun, 21 May 2023 12:04:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r22-20020ac252b6000000b004f1d884a4efsm694495lfm.242.2023.05.21.12.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 12:04:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
Date: Sun, 21 May 2023 22:04:41 +0300
Message-Id: <20230521190442.8293-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
References: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
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

