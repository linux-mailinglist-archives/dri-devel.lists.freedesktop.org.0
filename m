Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621E9B2F29
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC4410E482;
	Mon, 28 Oct 2024 11:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JuVUeuz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D79A10E47D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:49:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539f76a6f0dso3602595e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730116159; x=1730720959; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mb9zRgHMvMC//b1yhfiL4OPzd+wPu7HZpSZkxfRgNjA=;
 b=JuVUeuz4AZd2UY+wz3k+uXHuYZJxq6hO/DDC0oqftIWUh+N16I3O7h+6XEDOCu7TSV
 f9fbtvOwmNHDlDz6oZ/nMxNwiM5OCChmLYz16p+YAjI1lYBfb/6GVfP7iJkV0uTyx79c
 9tMVYga0JT6oRMMJCbQiH8ex/ml6ZERCFRjlegpf5HYNw7UlKXNp9X/Yh6W45w5uG95k
 12c5dpUA1YJVkHj2mlIW/gF1kszxhb8J5H169rwoQQdu+7wiC9n+V9jSaC4BqDujZCAm
 C3Atrpn0rwI+tGnMt5gBOSEcEp6AGhUMpzUaLXYXRhFOKylIvva5BNbkZLrziXqY2CHq
 MRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730116159; x=1730720959;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mb9zRgHMvMC//b1yhfiL4OPzd+wPu7HZpSZkxfRgNjA=;
 b=RURtqOj44FSD2DxwzgKPRYmq3DHcSR1ryHP47d1IjPbtMXL1LtwPI+g1S6eQoAIoV9
 74CwIKN1NrKzjljxKJc+1TVdMqVYY9etwR70a+KP4vGT8CxrRlvgb/RgHvLWgIlYAo2k
 AYu6Mfz+ovAJbqTEBDLN71R+TOzonNrozEmBYahQ++BtPVAJ8SV4ND75p3OVykVDTzER
 Okay4P2yGd7LuOWhG7pIbXbv3iyZvRf1G/XosoAg1SOGfJun7/UbK+kDvMsULWX9JhJZ
 G/fZFKnvz3ZlOoAECE2VeHzT2jokGoPlcRosW0+mNyrPHS7avLkiljErUzg8ZQSVM8gx
 qblw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmDm1pgGDpyB8nxZtX3kmxoqSykrXdxcUYsPb6uGYVsHlpLIuQWUDTsdO+DB6Y9ZYp/s47nvwbhxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsniIiHn35w3bN3X/uLx5HrBz+KquDcKpfcv8VCG/m5MJSmTmb
 Ylkp1SOjChlVyxpbqheAt86RMxHTY9zoGOGWZBlgJyE67UI0NtD39j5w54CT8Ew=
X-Google-Smtp-Source: AGHT+IEXr0XfiZcxDUh4Ya/xhi7vFzeN0peBhYX1m8G09G4UCXSdXYHWqD8Jl8qKxIXMmJy7ffIoxQ==
X-Received: by 2002:a05:6512:10d1:b0:539:89f7:3187 with SMTP id
 2adb3069b0e04-53b3490eef0mr3514599e87.47.1730116159070; 
 Mon, 28 Oct 2024 04:49:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a5c6sm1042385e87.19.2024.10.28.04.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 04:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dp: mass-rename symbols
Date: Mon, 28 Oct 2024 13:49:13 +0200
Message-Id: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl6H2cC/x3MQQqAIBBG4avErBvQyYV0lWgR+Vuz0EIhgujuS
 ctv8d5DFUVRaeweKri06pEbbN/Rui95A2toJjHirBHPqSYOJxfkJYGjAYJ3HjJYas1ZEPX+f9P
 8vh/QXxqbXwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Co+0E9YaF8rU9Lu8dKrUnSBVVrsUQunT/qB+81qDOac=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnH3o8ciOKjsiOAq7UqyEELQvVVIibSVOFsy8AV
 vA8UGDvQnKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx96PAAKCRCLPIo+Aiko
 1UyHB/4vtNQGsmYkJ8efgL4QqmJSOaWdlUjtPu7p/+hvN4kqK4CH5fnnTNh0R7yl+YqUaRw0ibl
 W5lNJs1zLmuAYc3odDWsVFjC/eRTNN9AOAbntyCS7BLMhm0aBtU3nKq4TVlPIijq/CtzM2puyvd
 LQrziQ0aIuzpjScflkArCejxnTIUNdxalWXyyuiOgwIwDofYdSg7Vlt0+R6IlFkqefTltrSqDGs
 JKpmj7HDB4UnLLYhcfu+Eu6Xl1Rd7qMoOEPVfQlBQbLdUgQ5u2Jz0SPg13z1l8XrJtFmLmz4IEY
 yf3OqZzOGXmHQUWl1JkVeYSQN+4mKskfUrIwo4ozW6iiDO9X
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

The LKP reported [1] a symbol clash between the drm/msm/dp and the HIMBC
driver being sumbitted, because both of them use a generic dp_ prefix
for a lot of symbols. It's a hight time we made msm/dp driver use
something less generic, like msm_dp.

[1] https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm/dp: prefix all symbols with msm_dp_
      drm/msm/dp: rename edp_ bridge functions and struct
      drm/msm/dp: tidy up platform data names

 drivers/gpu/drm/msm/dp/dp_audio.c   | 294 ++++++------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     | 148 +++---
 drivers/gpu/drm/msm/dp/dp_aux.h     |  18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 734 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 118 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 482 +++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |  68 +--
 drivers/gpu/drm/msm/dp/dp_debug.h   |  10 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 904 ++++++++++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 142 +++---
 drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c    | 432 ++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.h    |  44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 254 +++++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c   |  20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |   8 +-
 20 files changed, 1918 insertions(+), 1918 deletions(-)
---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241028-msm-dp-rename-f0eed848e231

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

