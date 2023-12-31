Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389282094C
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A9C10E0D8;
	Sun, 31 Dec 2023 00:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAAA10E069
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:43:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so4640496e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983437; x=1704588237; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uFdcEklglVMCc5SvkcvBwXoblALE59NOZweHT3jRNTA=;
 b=jjKh5cNCru4ufGKT/yZXgVLJgfDG6P/1QN1U9jv7gWsJizLb2u29l7f4+Q51aP9yLT
 6C/LVImuFbRV9gk/erDtmGFlZZj3wyf1Ce31K0jRxXyfTsxI1x3DA+Xo6g7rcMd3p1qb
 nQYU00MNSfwCRAiV+q8qu6C0ivSoQGXYuKRR+ufbLwDea2qouRhfrM1GWQspJwj5ammV
 N+Kq1gbkXyPezLX9JfQyn0sqn4SPn4LmWSw3PKYiw23BVv6D/SflTRnglXuvWd/Sq891
 2IdotqBeR/B/MltrKp+IuANl6TzNQVsiJfUtnND+nYAdLTo5AopzV0xWQLzpEdhN7Usk
 6jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983437; x=1704588237;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFdcEklglVMCc5SvkcvBwXoblALE59NOZweHT3jRNTA=;
 b=p045NFWppTiLArqYWZt3KYbfa0qehDNhDDTXQxG/Gh670pb/um4EXp/2EqKK0i6DQR
 VD0QHr/haaPI+rqYkMmz24eeXxG/ck7r+EINYWrJmUSBvwz/MpHtlE5YKi/A12C2xPa6
 T8feA6xQ/9iweiVIoR8O2fmipAIgYNPefheaDj7vBtyZmxZk++IkW18naG9S7KyObLQk
 lxwJxgdi5qOl8fD/Iw9Po8L3p9s8R4Ol7K7JbAkGJ0erkXa5XLmRSfF0q0gBM4ydy0za
 dtXXbaindzlluS+k2e5frIeC++8L+Z+lL6f1RW0HSlhEbfFwiw5fbm3kkwQE6aUdMWHK
 yZ+w==
X-Gm-Message-State: AOJu0YzCVLm9GktTWnAHJtpypQmRU2A9Y80UlZ17rOQQB0nHt3MMwOr5
 BAh3OL375gj8YAatGG/xOfuzeTt9nMXj4Q==
X-Google-Smtp-Source: AGHT+IEbsxU1LPMV0eSBJNc42YNvs7W6aovH4q706qKA5nwASqqB5dYIqDRug//C3SBrEw1aEysHJA==
X-Received: by 2002:a05:6512:10cf:b0:50e:7dbe:eba9 with SMTP id
 k15-20020a05651210cf00b0050e7dbeeba9mr3149107lfg.68.1703983436543; 
 Sat, 30 Dec 2023 16:43:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:43:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/15] drm/msm/dp: clear power and parser submodules
 away
Date: Sun, 31 Dec 2023 02:43:47 +0200
Message-Id: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEO5kGUC/53OsQ6CMBDG8VchnT1CS4rWyfcwDBUO2ghtc0WUE
 N7dwuRscst/+H65lUUki5Fds5URzjZa71KIU8Yao12PYNvUTBSi5OmgDRD8GwmCprSFZkDtXgE
 Ullp2SlcXwVlaB8LOfg75XqfuyI8wGUL94wklhKxkkSsuzpJD4kc70ZI/NC3RPP18G6zT5HNP/
 a4aGydPy/HuzHf7L6netu0LMCVjjPsAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gSCAT2zSZoYG95yfZ9I4UoUJFs7cxpxpX5tE2/TTf4A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJHdQmsFHeqgB7p3Ofz4CG5hT6HXzfxtpoJ
 Tj40LfsVqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1cLeCACqY9y+0CFMS+yYXYGemMBrdncF6UuJwK71u686FfT0eeYXBYJzqMynEBMkGUEnuq+723E
 36665tTjYtfYpI53w8kYnDG+yKNxEVxnjIj1drQZX7JhKipjMIXcvbQbbDeSX5+/NGUhtLP23+w
 ISonrc2AHGd/3qF/qKr7SDksr3dzyE+62Ut4pVgTfdgeNDN0xWOPqWlZda64W9essWo4XAiOiYG
 nCsENN+D36cLzJZUTYUTuaDOAgmkFXKjpC2ZExTz21pZcMYJN0qmSMBKj7+mIQRJyJrcWKLsG89
 iFxPguaSqwb9wLuZbFcfG5G8vfIqL3SlCpA0ozF0zt1PS8v6
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
dropping the dp_power and dp_parser submodules.

Initially I started by looking onto stream_pixel clock handling only to
find several wrapping layers around a single clocks. After inlining
and/or dropping them (and thus dp_power submodule), it was more or less
natural to continue cleaning up the dp_parser until it got removed
completely.

---
Changes in v2:
- Fixed unrelated power->ctrl change in comment (Konrad)
- Made sure that all functions use reverse-Christmas-tree flow (Konrad)
- Fixed indents in several moved functions
- Added a patch splitting dp_ctlr_clk_enable
- Link to v1: https://lore.kernel.org/r/20231229225650.912751-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (15):
      drm/msm/dp: drop unused parser definitions
      drm/msm/dp: drop unused fields from dp_power_private
      drm/msm/dp: parse DT from dp_parser_get
      drm/msm/dp: inline dp_power_(de)init
      drm/msm/dp: fold dp_power into dp_ctrl module
      drm/msm/dp: simplify stream clocks handling
      drm/msm/dp: stop parsing clock names from DT
      drm/msm/dp: split dp_ctrl_clk_enable into four functuions
      drm/msm/dp: move phy_configure_opts to dp_ctrl
      drm/msm/dp: remove PHY handling from dp_catalog.c
      drm/msm/dp: handle PHY directly in dp_ctrl
      drm/msm/dp: move all IO handling to dp_catalog
      drm/msm/dp: move link property handling to dp_panel
      drm/msm/dp: move next_bridge handling to dp_display
      drm/msm/dp: drop dp_parser

 drivers/gpu/drm/msm/Makefile        |   2 -
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 156 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 358 ++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  17 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 101 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  66 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 327 --------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 155 ----------------
 drivers/gpu/drm/msm/dp/dp_power.c   | 183 ------------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  95 ----------
 15 files changed, 464 insertions(+), 1017 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231231-dp-power-parser-cleanup-9e3a5f9a6821

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

