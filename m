Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB46A3D02B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4FF10E023;
	Thu, 20 Feb 2025 03:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nmnoWnfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38710E023
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:59:30 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54622e97753so508017e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740023968; x=1740628768; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l+8oUVrZ0gAKzCyuhlLRqWxp+1Id8wqmg/252Do9Ydw=;
 b=nmnoWnfumC/n6RlVz/T/QGVtKflKzCmwjp1OKPxNtd5gHFZCDvjQs7UwwDR6ZhAD66
 xh0LwOQg9vhsWcZc5COMnVHMY3eauuF73r0pzZiq1trk7ohPMGnG+llDAAbQoH77Mhku
 soHI1q2SwA0pE3y8HZTJLtP2NM4QF8R92jdSHaZb/LrxDp26WGK8VOxBEBiqZ6hf4WRm
 VXCK/fryjFxE/1GYdcglMcl04o1wAdZrZiDKJzkKJ0IFpFElrBjhWUHRil+90RXH0TPz
 iubvNyWeCC5qrgwRFafc6ZSsq911r8mPFVxaV3s3ou1JxpJEMiQpFUyBdp/GJ8NipTg4
 SbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740023968; x=1740628768;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l+8oUVrZ0gAKzCyuhlLRqWxp+1Id8wqmg/252Do9Ydw=;
 b=fGTr9XKhuciOv+J/HxdPBy0NSA8xC0Mp+Bq6FwcP2sBGNH045PkLyYEklNdH9YDxGS
 RRJsHzeBTNYFoWySO9E+/+tznEzaFxfZBLkKARn/FdTP20BWNguhI4y0qOixoT5xV0uT
 0apNyI2BZH+xBTX/7rOO50djlej+51R/DmRiwu1PTln+HUBZ5odxtpNIMqPRrM0oQIWO
 Ghw+nubC4G7o7eSgKa7qGg/4ILFfcCVJTUWqVvZqiCPoavUkvyky6sMu/m2nIx8P1TYp
 YyimFSquxER+0fWD7K7ZSYWBovLs+cK7gTWPRIW/VM7UxA70d9n4YVt8JLwk74pAZuvX
 4qbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm8jv0tKyqC+SvaoeSsa+cRRzGJPg1Z4JRV37Gi6+haSzadvvEmjlvo6m9oj86dIWoVd1n3xbxw68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMV6fVcpBLqEy1Mm36AjOy8p8lbXZ9cOXxgsLCO9/bRAhSqTkc
 l5jBWOwIJf0favf9sduO/+3ny/i2hcnNaT7Ti1hGe3yb4m7aHQOq48HxePhMD8g=
X-Gm-Gg: ASbGncsD6aJJ6S9mMM1oFAqoqWYY104KEI7ZRWry5Geb8putr5zcQIeUJamw8dTiQPQ
 v6Gzu2weVnf2dQDN44rNKGEXMH1SyFg/f7j/xa+E3tD+PuSj4aWVGsV7KZS/kPPrvp87zDxR6kE
 ea3RBmm0zb1rkYLjQRNsBZvWTkkThNhYEeiV+XwocRTZA7qYY7dmwg4TMJfZPCi4kXNrQAHmEjk
 /1dgpqFfL85M+/abEKsiA1ITgfwoEGHxmkwkp/N+4LvlmqmI9pJQS2vnWzds1WZ4H0nIv5x7KwP
 l7hd6tTqAAkI/4uffetjpj0=
X-Google-Smtp-Source: AGHT+IFR1Xxw2/2J7IszS20njZUSb8dM0NewRClc21MyDyNGIYBFhanjrEfVphFRJXFqUOvj8IX8Jw==
X-Received: by 2002:a19:5e56:0:b0:545:81b:1516 with SMTP id
 2adb3069b0e04-546e4b2c993mr487354e87.15.1740023968414; 
 Wed, 19 Feb 2025 19:59:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:59:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] drm/msm/dpu: enable CDM for all supported platforms
Date: Thu, 20 Feb 2025 05:59:21 +0200
Message-Id: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmotmcC/1XMyw6CMBCF4Vchs3YMHakiK9/DsOgVJlFKWiUa0
 ne3Ejcu/5Ocb4XkIrsEXbVCdAsnDlMJ2lVgRjUNDtmWBqqpESQk2vmJylo09o61lvpM7cF71UJ
 5zNF5fm3atS89cnqE+N7wRXzXn0PNn7MIrPGklPZGy5aa4+XGk4phH+IAfc75AzU+aNinAAAA
X-Change-ID: 20241215-dpu-add-cdm-0b5b9283ffa8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CR+cW2pe/0YDUERdzuk05bH+pxYUGyqM9a7zB7Nk7So=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqicJhCSgswxcqrbREVcRq9vfVTW6veEIobsT
 SxuNriiWGOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonAAKCRCLPIo+Aiko
 1RDTB/9js86og50XT9YheQJ8Sj3BKuy1rIPhU8Ix3yDbtYoXtnA4IdjPPKm6PPE5aZLpJa76N7p
 N46YW699wYfCK+uAO+df0Nf3Nosn9ZCvwT6XV2tnS2O+8vV11katQ7QlR+malmFoJDpqVTS4D4T
 w+JZFNzvdwqdfTPfq9CR5vXvRNQEuDVvUSvRrJs0O9zarj0wDtJ1thHTGYD55eIr30RyIdnjChD
 H4dPNCRvDrYPvNNo8W5T5n8U7Jx6VEPTncn4dMPmqoqLXJmrme8mquXO6wlD8V0JtDl0VO4SfFN
 /ldaS1YHqJZOisvP5J/UOX9HcKG+g7jJus4mzLqiZ6njzbme
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

Enable CDM block on all the platforms where it is supposed to be
present. Notably, from the platforms being supported by the DPU driver
it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
(DPU 6.9)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Split CDM addition to two patches: DPU 1.x - 4.x and 5.x+
- Corrected CDM size on DPU 1.x - 4.x (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: rename CDM block definition
      drm/msm/dpu: enable CDM_0 for DPUs 5.x+
      drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
      drm/msm/dpu: enable CDM_0 for SC8280XP platform
      drm/msm/dpu: enable CDM_0 for X Elite platform

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 9 ++++++++-
 26 files changed, 33 insertions(+), 4 deletions(-)
---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20241215-dpu-add-cdm-0b5b9283ffa8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

