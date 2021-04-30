Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EDB370130
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 21:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AF86F5A0;
	Fri, 30 Apr 2021 19:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191A76F59E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 19:31:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so2296551pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCEZUZsej6PYGYdfrUSAPElJP+cMh+qBBhd7LIg8wdA=;
 b=KoB3ejoz2F2gX3PDhdj/9gZXL01KuXoWg+k+QDyqJvO3zdZBamHkKjdfpDYEjKvt67
 +L4tRNbFUd8f5kLuSaQoJ6Y225lSdr/EGRvlVZ567+pRV8SCOghVvu2vv/vtXah3AVZM
 O9suig51wjCyf/OdskvmTGYMBq01LKFlippMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XCEZUZsej6PYGYdfrUSAPElJP+cMh+qBBhd7LIg8wdA=;
 b=tC5u1BqSkhmrHeLPBvywmgSZHVNk9vAEJlZJfW7wcKhxYkqoI7YGB9WZUI9EeC5FTQ
 p3acM0MjLbsk9QEnT7WvjULeOD1vhsemSDzZyDkXVzEOfHp5Kp3/cC9hgpVG9JuZ8IWg
 gzqG+cq1kKkRc1EKXPQQZqsuuExb9dv5KkV20E8B40+1aaZN77zOhl5ydttzVgaHPvWb
 99yuis2JEL342bNWz/uDK2NSF4eALrpqSKM6Y4DNutzGO6Gi0jX+GqTmVOhQ55bPnK9y
 w51IgNaSaSrN/9H21Li6nB32TYpCSQKC5zaMRiykQ0r0DpmsptfvyT7L5kejLGAGbw1R
 x3MQ==
X-Gm-Message-State: AOAM53133ydszy8mr/XV460ohoHOecUE9uNn1h8UkJD0gaNsGm17I7T4
 JfyYQWt86mnb63Cuo/iNB0OtIQ==
X-Google-Smtp-Source: ABdhPJzfRGR6XuD7lIQKGyXCXKEG4HC9T/S8Nnlka/0tDSwrbt4yC2zH6wZ/u2spHOidfnmVgIGaeQ==
X-Received: by 2002:a17:90a:a78c:: with SMTP id
 f12mr16598779pjq.219.1619811066715; 
 Fri, 30 Apr 2021 12:31:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
 by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:31:06 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/6] drm/msm: Trim down drm debugging logs
Date: Fri, 30 Apr 2021 12:30:58 -0700
Message-Id: <20210430193104.1770538-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series attempts to trim down the drm logging in the msm
driver to make it useable with DRM_UT_DRIVER, DRM_UT_KMS, and DRM_UT_DP
levels enabled. Right now the log is really spammy and prints multiple
lines for what feels like every frame. I moved those prints off to
other DRM_UT_* levels that felt appropriate. Please review.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>

Stephen Boyd (6):
  drm/msm: Move vblank debug prints to drm_dbg_vbl()
  drm/msm: Use VERB() for extra verbose logging
  drm/msm/dp: Drop malformed debug print
  drm/msm: Move FB debug prints to drm_dbg_state()
  drm/msm/disp: Use plane debug print helper
  drm/msm/disp: Move various debug logs to atomic bucket

 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 16 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 22 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 38 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 10 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 19 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 14 +++----
 drivers/gpu/drm/msm/dp/dp_panel.c             |  1 -
 drivers/gpu/drm/msm/msm_drv.c                 |  4 +-
 drivers/gpu/drm/msm/msm_fb.c                  |  8 ++--
 12 files changed, 67 insertions(+), 75 deletions(-)


base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
