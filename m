Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98C9158A3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227310E587;
	Mon, 24 Jun 2024 21:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qaWHP3gt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8891310E578
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:58 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52cdb0d816bso2513456e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263637; x=1719868437; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
 b=qaWHP3gt5K9+YKuZs7VtzRauis4ScOeJ4oA32Q9cdVytxRXvWX/xNQRVGgl21Mwo5F
 JcFSoQhpZo94R3g+QdJvcQg2ZFVRrrxqfEh2CXuLMyLdFttdmr7eBvxgswwXu8QTp5Sz
 +QLrmu1rWep4bl+tmdYez+mJRoAARvTUBVtpMaaetDKbtql6LpQAK55R+Bw0D0IL5TvC
 Hyl2OTHkwKe+v7E+rMPM+UpKUGM4UV+eO+c5MWFkSCBMKLyUm3S60IUebETIgUi2sBEi
 6UxP3qkm/e8Te0JXAYgSI25xlZF5qQKOJXWjSSQGK/IwbEDSRo5YfOlvFRHp7YR/oLZw
 Z9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263637; x=1719868437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
 b=Iq4qmosrbB2967WZC/1QsZjyFB7fhhfyEfgMl15fT2k9qQOQ7iCbcPLVORWx4Ut/+1
 s8tOgEeC8FH7yDuwnQkeOkBI/GJgkBEFufXYzxRORcF1bsIcQP0oAhef/B8DqHBGy44R
 b1gIX+slNfqiH7U3qFP9GRutPB2lMVT1UoyxyFIJqwPJeR37jUG7MP/K4z6pz7vvenKw
 BCAgeHsTcsDCk30z4uo8/zEOCbNZz8TjCCoPr8EZdAsvomvAEyKktClhXuhQbKQPAmMy
 iZogBpYIEEA1TDCK5PgS690POfWuPJ4AoD29OLphzXItBH/vJtARR45nmTjhVMaYCIic
 vZ3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDekFzLOgGpIE0r16l0JxFApJhnHWAyV0QEJfWfvh6Q8eDJljjiEdYV1UkF1rECMXEUZOausgyr/jwiwyONeULg/Ev4/iryQmURxkCM+VT
X-Gm-Message-State: AOJu0Yz7njxWCmJLDRfnUotinT3myDwPkKwJWkv3ehnMySocee6t0Tmv
 rS5f/HhZMKxnyy9d+JL2SyoLI2fHBAvBgLcA1Cbb5heDVP7Q+yLt5Vha6uKJe5A=
X-Google-Smtp-Source: AGHT+IFn/jsZJwn9C0ZfSVQu5ro2YDWqj62VOTDL/RnBepxagmDc8HYifcBlPbf2LuVVX5p7BmhWzw==
X-Received: by 2002:ac2:46d5:0:b0:52b:c14e:3b5a with SMTP id
 2adb3069b0e04-52cdf25d968mr1915087e87.31.1719263636737; 
 Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:54 +0300
Subject: [PATCH v5 14/16] drm/msm/dpu: check for the plane pitch overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-14-501d984d634f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+RF/P7K64SGg/tQu4deWbHOf+YbNZCIL5VEgg9w8tfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJpghx/E1Zz6KI64+fN6lonXR6KaAjCZwF9
 OquGYfR9oaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1YHKB/0by3KyQlGCiAbP7nZWTbNgO7bwSoVt1iVQ2SiTb+0iPX5obGQJ7CnJvGMv594tF39vR+a
 78Qoxi6kGNVtNJToC5I8Vn1U/bGEJ6Nr9d/BKzSkjMisCecY1nv1kEPndpPeQos/SRy/RMjA2pm
 Si9uSiNMxqBQid7rLKr3ztxTI9TCbu2fK7IjqbHIQfuKRpQY4x1Ib2sWL4bSbUuONl1T4wfk+mv
 m5zgfO+Kv7/6uC1vdhswVcEeQsSX8H1vS4M6aFPBCYGvkwAjz+Ov3EF3iFtJzWwHXJyeB/8hfXB
 YbPgNgR0OJ6+nxaY7wJQkAWixKFlyJu5xEVnWLY9k+QWp9Pb
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

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a309b06b0992..a629eb3a6436 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -782,7 +782,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -856,6 +856,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

