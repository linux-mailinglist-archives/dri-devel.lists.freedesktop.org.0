Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9298D7863
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 23:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA34F10E0E8;
	Sun,  2 Jun 2024 21:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YRM/SSxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152C10E0DB
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:57 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so4178323e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364396; x=1717969196; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=phfbeBe/wHZzaldGp3CTSm4jkvtTaBdaWvDYoOuNwVE=;
 b=YRM/SSxivLp3CJbt+JViMHeOkpwAgPXYPQf89YvCM/wiJwRv7AA4Z0kXutQAS8rzT+
 Yj8LGXa0ZehLmPov7Z78wSQ4hx+5RdH75FPRBkxnZiAyeqT54jITwoFlDNth4jQlwEoK
 Z3n7tbxNN4i6KDTOJmPNsYxgzJ57ObSYboGLjOy1YONHo8OUdzzN2k7JrGaSQeWZjIvd
 +YF94oPeqz89UxaClJKPr5JnrosKwOYeO1WWMG8TZ0HU8W1ILCTmXcJ/Eqphcebhjy53
 e/Nhdw1qbwybd2GBpjPVOJa7PuqDMzyu32124c4rQAqUlOPdUN8HmB4SlzJV1PMI71i3
 ri1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364396; x=1717969196;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phfbeBe/wHZzaldGp3CTSm4jkvtTaBdaWvDYoOuNwVE=;
 b=S5Ynv6PGlqLBkd+W4C6f9RIXpqLI0t2Rsai/WDvJEl88GTHtnwZqXYK0z+iuif4I7w
 6QgKQmvMdh2ofWXdPKWI0x36M3s0TEjVDAG0/VxIrsttizfZZYpLvIlYO+LDDkimHDML
 NsSoY9DDljUGNHU8CWeL4BKL/vMppOssLq0YqGFtiL5zb8NaTI28JsuiHHYkNQXhUw4a
 YNSWXhsOWbUOSKGsIsSiluVO0pzBowMSg9WllNPf4tzfiIBwZl56lTmlPswiv48nx6Hq
 9tF1w3LRW8jSyD8JhPOeZpm0reEWVxyp6cIXellGZMH+bjULhzozakyZJP7Z7DoFASqZ
 q0bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa5D9VU1s1z+ujXcx34KFrUh+UIxhviOxZZvghQagXhkDjadKdOT8ysgiHkieYeltwx+L5rSof6f4e3aJJmf3n9Fh2gi+o//kYutpyKgXC
X-Gm-Message-State: AOJu0YwwqX+r9K4aOK4QTKa/kefHKFXlXESeN3pMvpf+3JC9/st0QHCN
 3sVPuaWqBAppeks0UZeusoYbWDTirWMrcWw7c/soHR23JXIpcNP/LOwbjz+TzSs=
X-Google-Smtp-Source: AGHT+IGxRw+MhZXwLFb5hrNZP2u+vz4lRcl9eHFkm0LNpEaolt2v0LY1NkMZg/P1qibIuuIkHVUuAA==
X-Received: by 2002:a19:7403:0:b0:523:b272:c73 with SMTP id
 2adb3069b0e04-52b89569542mr4347003e87.7.1717364395710; 
 Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:52 +0300
Subject: [PATCH v2 6/9] drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds
 from atomic_begin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-6-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7R5XEZiZYJZfV3EIl1ZYgtEVpBJ16B4QkvSZSHsPzGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalI8O2Gf9SxPwCXo1gr5Krf6S3U1zjqsmVd
 jLGSJZ+Jm2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1fOEB/4g7Qy70gGV6VTyC8hNhK+NYtc6tOoGcIm0WmQZhwToK8OfvQ9J4VMZn0xxqYJvKLLrGt4
 9zfYGnpuYD8LKcpDlqmi70GSz/E49iYgwoh4IjJWAg+rxSUikIkWyJjDfFRY0KTtMUxzXrToRni
 R6EcAlwQnPscsCRBjgsOIRTwS7F4czKxDMnRAWoMUkQF5oGN8wG6oRTUvAn+VTQaS5D9947SX7s
 kauLgM5n5CwnXNCFChuvJRxxcNKu01o0e6z3RhErUr4SOF7p5UJ3eJCvd5vgH5TCC9+1iq7MOsB
 NEXyWBfv7jBiO30j+QlkPqtd7uqNmrfWMfwk8zg5Wrr4rm0V
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

The dpu_crtc_atomic_check() already calls _dpu_crtc_setup_lm_bounds().
There is no need to call it from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..e3b1e5f55a92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -803,8 +803,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);

-- 
2.39.2

