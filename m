Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFFD8C142F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 19:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B8210E831;
	Thu,  9 May 2024 17:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jM/Y9IfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1487810E831;
 Thu,  9 May 2024 17:39:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e9so8608105e9.3; 
 Thu, 09 May 2024 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715276389; x=1715881189; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXUU3H+PgMe++t6s6Yb4nLqL9mCXFnF+1t6Xu9YIDmo=;
 b=jM/Y9IfKP5y7OuxpTO4ywxL8BuIak+Sm2HPO1MVQKyffrx/4MAUsu5i6ezhwHmtoPW
 MnnXd1wH5pvuKCCZEx/P+Xjt7ZT5ZtBx27iQKhCLnbwoAclkzYcUQNTHmrUFJIyZmkT2
 CuisQzr9aKF9rXUD0a2h+ouhwXk4BRvMfDlU02EP3CVdM9fFIihsV9jHw+dWyG37mPOD
 OvsBAtaxQL4MnR827RYxcb6kLVx3EM/0ndOLbOzHGY0FZHiwPHIAtF95QGvKbKjWvyqM
 v59DOI1SUH0oWSm/mrwTvgjtV7vgpKFISuuvLp3mivqMjAYj4R5qPM6/6nIAKQnpmbIA
 inPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715276389; x=1715881189;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZXUU3H+PgMe++t6s6Yb4nLqL9mCXFnF+1t6Xu9YIDmo=;
 b=pIb2Ug1ucJpZO/yqUQe6EOvQTjvV3EZCXEzXNXGcP7zFkGFwg293lAGBSI9J3dBWta
 5I9o0m+dgld8T2zc2tQ4lrcdbL/uLxfoycCQILg8B9XHOK9qUoQ8hBic0zFovTmz+XpZ
 NHkSNLGkeZwryquzsNeW0JD12aEPMXnVh5XcT3eCh+D8vOXJJHs3QZMWdD0BsCQqDcAZ
 nK/6hK3zBt1J6KwZSFdhWMICbvHzCuZ4CgFPf5bg/FAfFrp5Zf8Cwyt/7zhjwxYk5Wle
 os6wCvGVsQ9Y+vw3bmInFB1WC+iENj+L2aEyeYJcQ201JJYz9NpwzBkafFKVGwqUTPUu
 1vRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDCITKHgZ/+NmJ2lw756/pJ41lZluSkosUoY5o8fW8sMHbU1xL1PCBfzWpuexk2JkxGQYDGMm5phm80lYs9nvmDnG74daoh9n5TNhyLETF3RCMLp4GTKoBtRiznKuIH/8KjIQbuHBQO+TThVw2+Ben
X-Gm-Message-State: AOJu0YwoEUVM5iWfETzxtiNlimdwsbYb6ffTxHuqfLzNGjT1w0k7wJBu
 X08KWbHPYZtv+bn8dDTUdEQUcD6Hvq2oNbbjMW8hriGkmhqY8137
X-Google-Smtp-Source: AGHT+IE/7GfRfJfa/usca0jgdG6bN6wknL+/x51vAqqUu0ualXn47t8uTJpGHDXedlmsL6jkzbA3kQ==
X-Received: by 2002:a5d:550b:0:b0:34c:67d6:8dec with SMTP id
 ffacd0b85a97d-3504a62fec5mr244132f8f.6.1715276389048; 
 Thu, 09 May 2024 10:39:49 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu.
 [81.182.220.224]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc99sm2268546f8f.11.2024.05.09.10.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:39:48 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 19:39:30 +0200
Subject: [PATCH] drm/msm/dpu: fix encoder irq wait skip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-irq_wait-v1-1-41d653e3784e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFEKPWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3cyiwvjyxMwSXRNLExOT5NREc/NUIyWg8oKi1LTMCrBR0bG1tQD
 MGOmlWgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
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

The irq_idx is unsigned so it cannot be lower than zero, better
to change the condition to check if it is equal with zero.
It could not cause any issue because a valid irq index starts from one.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..cf7d769ab3b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		return -EWOULDBLOCK;
 	}
 
-	if (irq_idx < 0) {
+	if (irq_idx == 0) {
 		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
 			      DRMID(phys_enc->parent), func);
 		return 0;

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-irq_wait-49444cea77e2

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

