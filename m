Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF4919A01
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6748110E9D6;
	Wed, 26 Jun 2024 21:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="toH814em";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384F910E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:08 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so80491931fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438366; x=1720043166; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iE6HtgQd+Mx8Lu8xmMVxcDxjcKP5NsJsVfSIeNxRays=;
 b=toH814emkLURTG9HZeraNT/ru0dHjxrimMCXR66nxUkRLQI9QEW4WweHZzYLI+KwWu
 ovXW2CR1HCOwUHLH4mAmaQk98PYC9jGeJPb2ZAQBUOUQW9QFRFzHkYH8GvWB7M9OBmXD
 udsmv9rvShsQlwKPfJ0CtrfWG/b7PjB3oAihUpepXgyGNsBbrhVe9rLdUszyYLyx4etm
 Od7OBbOD8Rhqvvfiph5wR9C1zPLIUTOiL2o/0xoIaZFGQ8pQJWzM1RpEzofhQLIxBnHl
 5sHjXuWAl0UaKi1c46RVMGccEGnfzhRAN8Z1joojPNxk3pBEtF2+aaoympRoRNOS2zwz
 iNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438366; x=1720043166;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iE6HtgQd+Mx8Lu8xmMVxcDxjcKP5NsJsVfSIeNxRays=;
 b=cnGZMMdSiM5lXrdKXZRFkn4trymOCmy+Tjeq3QMJfjMWYydr168xEQdnkDpgKRXiBM
 ZZkGGPCWS8qrgUaDgjIGhQQY01DbHH+E+hQdDnkmv3sJvCnbqC97CiBvDvO08C5SyrRC
 /+psdA7MUt+0zhv/Z/s9I2CcyHjknBv/A/j6cgc2qPa1E/svPgbHgDE2bY+CCuDumF6Q
 grg2hDT9MehYSnszM9NT1UPblbzmtVXR60XahYdSkDQOX6T4cZH7b+H6cxZWBZWWM1wu
 0joGGRV8rq+2GnmTUbiovHBOU6eGc6YbDO1eN1DzWIZtbMgvluVwmnnc43CUhOXrGdpS
 G9Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj8j8CO2qScrMeGF7VYuacHBTuQf97wfJeRQgJoxlxJxUltJ4EcjTGctg0AYovJcKIia1ErYXq40dbKNTO0lDiyXa7PmCG1Q1Jju00KSQg
X-Gm-Message-State: AOJu0YyPJlJ9kgOBG91HhZfzNxl4eW50U+SsGzM/9JfRbiv0hcuMiW/v
 D0RZTwZESjn/rCnX0R1H1fq6pJEE8Ok6/RZS+REpjw9Cb0r5AT3WMoTu/1Pjrqw=
X-Google-Smtp-Source: AGHT+IEcbqPIXB+PkfdI8Yo0kLZq1BBtRqDahg0rt437G73mUya9VhLJ8pWt8yUjhAYLKQa85KaTeg==
X-Received: by 2002:a2e:8416:0:b0:2ec:500c:b2db with SMTP id
 38308e7fff4ca-2ec5b37a4bfmr67252731fa.22.1719438366287; 
 Wed, 26 Jun 2024 14:46:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:58 +0300
Subject: [PATCH v5 04/12] drm/msm/dpu: use drm_rect_fp_to_int()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-4-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8yHv1uDtNh1zFe+evsAaAR7pHsAK+9eMVbKmkVZHZ3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwYzzhIPw7sJS2U0UBMC5r5eumxFeTQOFjn+
 xuuS/LmwFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGAAKCRCLPIo+Aiko
 1WTqCACJo+fFyJf1Chi3/W+DgOXcyhvo9JItDrAOrp0c44p8n+h9IBsRPTFGinOlQkNK07lHQMq
 UqiAYoPt81sPwVEZSuAawZ1wTUBl+AOSg9LmxqyVdw9df4omxB3WZNqsUs8qSgnFB8Yb7ieb8/f
 r2RK1JWI3ZxOP7FpMei07VkIlmoz0eFgNuiOVC5sqOk9BXJ35IrFjAAYpaDbkXkY65aveRHcrjx
 G90yQ2O+51lHWOCu6qKcsCGD9NRLYdUkPZQoP7RMf5LnvSmrdK1tbaIkoRFFFkVqrAW0t3d9d8g
 iHIBPOUJ29AjqSd7AA1RLaKzTjQm/mTz9fFAQq4pPmhL8Ynb
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

Use the drm_rect_fp_to_int() helper instead of using the hand-written
code.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8f2759d16247..4abaf2bb8a08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -837,13 +837,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
 	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 

-- 
2.39.2

