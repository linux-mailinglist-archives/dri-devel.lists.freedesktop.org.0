Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C237E9DA98F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0F10EAF1;
	Wed, 27 Nov 2024 14:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Et5dkxSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02F710EAE6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:04:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de852a287so2377911e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732716284; x=1733321084; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4Ts7aUIWizov/NLYuaDxwP3nX1iyB8pequrCUYPZSs=;
 b=Et5dkxSyFilGGvSV/HD/6j4swjplUn1UbN0mIuQKJ7r5IkmI6ETXKXq+VJfOtAHeIk
 KJ7aY5ur6Ios1xUyO7Rlh/Xw1ZKlP3rWLsMIrABBXKgFnsjqVHHOdRzV69mBhmyDDs8k
 UBL/ZzKM/AZMqcamMgknJVc61U+/qly64LlAKkupLMJluwNAFXWBl9W7U43DE8vBT1lA
 dkAEgMBMRx0GER4zkfX8/udAC1YMlEQYldljjFPKJ6vNkLApXgwKF5ox3Jl7qtQnJQOF
 F0yb9wNdT9nIhaYHbmSH2zi+GvQehjRu5FRPMx7wYXA1wFv+KAQSkLw7CXQJoJqcOR1A
 //NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732716284; x=1733321084;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4Ts7aUIWizov/NLYuaDxwP3nX1iyB8pequrCUYPZSs=;
 b=wut0pOjeCSCe+XDt/JtADgaEiXvgLj1VYEQHoIEzuPmW24ty+p0syCssKr3kHk+mOU
 V0deRXK438x/zDH+Jit2S18c2u6XxrJaRPsyfEp+vR8sbrSeeCD/ruSZ31oYH84hrvZK
 XUkiRAFqxxgfk4UsyuMFNkYN0EowgB5Bvtc7vsMKoYcc45U9cnwFsSZA0QmavZIIqk64
 q9Z8qNxPXQ2eDp7MGQCma7lBwbxYyIwZDuG5PJu/TY1mkvh/+L2/fSQE5z0JMXXIurYJ
 OaKqU5WqEZLzQTRFIXq9CGwwKfFX9GKpGYW74B+rgR4yfJjQkZ4Re+e6cGNC8nGhbkzk
 HgMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQnFEUUfXQH2o9EVYDb2jz7F0urQYDeaEgbyD5u1fV7J9k2K/69FDSL7ivkg0pbrf0DTcXmRNJCnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEdSaXKpLfRMkWsVugCGhjw3KYwP+JK0lr5tN7I57RzqhQzOt7
 80Ht2x7NKtRw0br7AvG0JgpZvZNJZ6w/SWuN1mVabIlTNVX0m+Qf3pblsnUdP8w=
X-Gm-Gg: ASbGncuwJlpugmvO8nZ6LKabWdLB7Rj3/1ZLw5eODElUpENxYqfFV1LbJFAhZFf5qWi
 vIvAzLMaK3WfyE7/n0tdORM7bJAqgtkBib57DPwnAAhSZLDz1zk/gsJoKQYBu+mh3HbjLxuDa8f
 5s1UvsdxjgqnGr1B4WuZbotzderUIeZUhCdfibnvFjijgMtXhGRSh44dgn00/hx5fg/GHSZ+SkK
 0J3G0gob0QM0wsngcpBZnWxqCNFpMc/sicLfJ5Wktb2a8EFETt5hB/H3A==
X-Google-Smtp-Source: AGHT+IGKW7mqkMGNSg9jVL3UeUo9m2hpnWRcx4+XgEbh8rHW/MWq3FNhz3Cl3UMtUlWPz/sntopdTA==
X-Received: by 2002:a05:6512:3d0f:b0:53d:ab0d:b9f9 with SMTP id
 2adb3069b0e04-53df00d3e42mr812209e87.23.1732716276835; 
 Wed, 27 Nov 2024 06:04:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd44cb7c5sm2157291e87.122.2024.11.27.06.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 06:04:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Wed, 27 Nov 2024 16:04:31 +0200
Message-Id: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8mR2cC/3XMSwrCMBSF4a2UjI3k5iHGkfsQB21y0wZsI4lGp
 WTvph0ICg7Pge+fScLoMZFDM5OI2ScfpjrEpiFmaKceqbd1E864ZJoDHdNIR5sSvXcPQ4Eptdf
 IlBOKVHON6Pxz7Z3OdQ8+3UJ8rfkMy/uvlIEyKgGscYJpy9Tx4qc2hm2IPVlSmX84ABe/nK9cS
 NmZHTptvngp5Q1c7rZL6gAAAA==
X-Change-ID: 20240921-msm-mdss-ubwc-105589e05f35
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Awfx1uj7GWmNyTbncLyYqj3YeiEUQM92uIC4PxSF4K4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnRybyTdBGPMzM2WIyfuTcNhdMbTAUb/2tvctHL
 Jam+Z4nmBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0cm8gAKCRCLPIo+Aiko
 1Rx5B/9lunJDTciQmLjaJcsjsjKWM5jxx+FakpMngARXvBBZo4b2ntmIWJbBk00P6yfPhJjWkCk
 +S6QuYEw52Blfvsi7T5rFVqVeZ+2YcxiI8PDutT75UtGvfubgbXvOWxvGlDALnPw0NzzkLY/xs8
 KEf1p15baAKO19G1vZz97uQa+lMFNvRuHAur0PaAA6pMh/R48B9WfbziqlSltAgd5QYkDWf2fTo
 4foNKhePqDMVnwobTAUrSinMNNUBpK+y6krSYAfO2Mbds0An0Cc1NJYYF/MNz7jqzouSE/SCIvv
 7ATxElK5TwgWRF1qufGQ4yUxwkJcdl80acOpx3DgCUhwAUte
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

Current way of programming of the UBWC-related registers has been
inherited from vendor's drivers. The ubwc_static was supposed to contain
raw data to be programmed to the hardware, but was later repurposed to
define of the bits. As it can be seen by the commit 3e30296b374a
("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
gets out of sync.

Rework existing msm_mdss_setup_ubwc_dec_NN() functions to be closer to
the actual hardware bit definitions. Drop the ubwc_static field.

Unfortunately this also introduces several "unknown" bits, for which we
do not document the actual purpose. Hopefully comparing this data with
the more documented Adreno UBWC feature bits will provide information
about the meaning of those bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Changed UBWC_MIN_ACC_LEN to be two-bit field (Abhinav)
- Link to v2: https://lore.kernel.org/r/20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org

Changes in v2:
- Dropped applied patches
- Added defines for UBWC_AMSBC, UBWC_MIN_ACC_LEN and UBWC_BANK_SPREAD
  and .ubwc_bank_spread flag in struct msm_mdss_data (kudos to Abhinav
  for helping to handle this on Qualcomm side)
- Changed msm_mdss_data to use true/false to set macrotile_mode
- Link to v1: https://lore.kernel.org/r/20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode

 drivers/gpu/drm/msm/msm_mdss.c                 | 71 ++++++++++++++++----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  4 +-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++-
 3 files changed, 55 insertions(+), 31 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240921-msm-mdss-ubwc-105589e05f35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

