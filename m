Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5F96412F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC94310E44F;
	Thu, 29 Aug 2024 10:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j5tZGvti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10510E44F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:06 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7142a93ea9cso421253b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926746; x=1725531546; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7iLI7cij8am378pXVWz99+34Fx5KxP/VDjPfueOIZ8k=;
 b=j5tZGvtil1oUmYZLlYiY7DepE10Ff6nRi+6YCFfcFbdLw7jlBwwCzk/Ah+kZpGNwIL
 IpldfJAUD4v+HazSid0vsQPEi+oifHazori4c59jUhoIRk9D3G1cgGPsDd/LCrpY3RLP
 vTpiL4W9/deanusDgDGpK1qXv8eIWg0uvIwNM/ypcL1k0SKFwWjzMIBNy/3d+Rkf+jt5
 NxzkgSsrpqPs8QzJv4NpC1VBvBtoppB78wu5rBmhilIxgj2OSupkmZWHYRTL5s3ikBE0
 rAa7s3AaBrm43P0VpHG3hvl+Qyqz5vv8CKxA7oL28It8uvNJBAAWF4CvnuL7mKh2g1ga
 AwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926746; x=1725531546;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iLI7cij8am378pXVWz99+34Fx5KxP/VDjPfueOIZ8k=;
 b=WqqT75sFobtxj/ZClHzKWb208V6PtQttBGxuaJlWLZwnRO2ypAinVQsYx/TYdvJf87
 mCBVgc/M7FaJb9tEiIgAfhQzOZtZK5i335ssWLWWjImZ4pBaYAdZPbRLTGNLvgNh02zM
 aaxpOEmlRR7iGBx9pY34wY9U90mAmqd1mX2P+jeMfaXb0FbjWmUDD6RVMlNlfAQxOo4K
 CgGYBYgYGMswGIx5Eg4yAuyvKvphy1GFKbJOBBfRUDuJvcS0QUipKLSf/wHahS/KJK7y
 BHgDuBFUcWljpuhCsQWjQgi+Py8nxZmEquzVKZ1Lv/pSTQ1V4h91J/elloHtm5IDb55s
 +Log==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1VdrwEOR2+8niYSoXQwynRJY5Wj3bn2y8LjWCuf54lK7AJ+4WTGdaUcLSKG5jNh+VD5PwMykhT7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVyVbxgb+hiXfAAeMjIsUGXwif22fo8YL5csC+E7cCabQL8EVY
 499XdIwnY7i/seok0ZUjWJdR4v9cXcCm70XGW09sScLJk+JmuWzqqWumnSA5uyg=
X-Google-Smtp-Source: AGHT+IHE4Do/N3GkCtLaAyB3B6mwF3f2W+Yg9mp1g0ej7usEm9UI8mQxD+BXOiKkv6+kMYM4hnVftw==
X-Received: by 2002:a05:6a20:e196:b0:1c3:ff33:277e with SMTP id
 adf61e73a8af0-1cce1016e8emr2628682637.32.1724926746319; 
 Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 00/21] drm/msm: Support quad pipe with dual-DSI
Date: Thu, 29 Aug 2024 18:17:29 +0800
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlK0GYC/x3NQQ6CMBBG4auQWfsnbZVavYpxAcwgXRRqR4gJ4
 e42Lr/NezuplChK92anIlvUuMwV9tTQMHXzSxC5mpxxFxPcDZqCbw02D2sxJUZehhGJVfFeO8a
 a9VOkSwhgx74/S2+5vVIN5iJj/P5nj+dx/ACmY+0hfAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2929;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Iuc0O1yLGF/gyUtcBEXqUDSMK4I5nIldsvZ6bLqKzZQ=;
 b=/XAz7k9LePyEc9Awj75B8UirKvpOKm55t65AeMenHcISQ/oiIJItRucdOO9puyB2zmAPw9AGJ
 hz6VuF0WZetBqwEXHRoMioS3dxbrjgu9ikDjdhx3xAFdSAWcWcnFNfc
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

2 SSPP and dual-DSI interface are need for super wide DSI panel.
This patch set make changes to DSI driver and extend pipes
and related mixer blending logic to support quad pipe.

This patch set is based on virtual plane patch set:
https://patchwork.freedesktop.org/series/131109/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jonathan Marek (3):
      drm/msm/dsi: add support to DSI CTRL v2.8.0
      drm/msm/dsi: fix DSC width for the bonded DSI case
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Jun Nie (18):
      drm/msm/dsi: pass the right width to dsc
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: Add utility to get mixer number
      drm/msm/dpu: Support dynamic DSC number
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: request more mixer for 4K+ DSC case
      drm/msm/dpu: fix lm number counter for quad-pipe
      drm/msm/dpu: Support 4 mixers at most
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: Support quad pipe in header files
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: setup pipes with 2 set of stage config
      drm/msm/dpu: blend pipes by left and right
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: support quad pipe in general operations
      drm/msm/dpu: revise debug info to support quad pipe

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 119 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  73 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 385 ++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 209 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
 drivers/gpu/drm/msm/dsi/dsi.h                    |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c               |  54 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c            |   2 +-
 include/drm/drm_mipi_dsi.h                       |   2 +
 18 files changed, 566 insertions(+), 393 deletions(-)
---
base-commit: 9651fbfb684e7a1288dbae3bf1f15cd484c0217a
change-id: 20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-d2d6b3eb1d57

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

