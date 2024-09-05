Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C384C96DC67
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847310E0DB;
	Thu,  5 Sep 2024 14:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIAdM+U4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D63410E08F;
 Thu,  5 Sep 2024 14:51:27 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c27067b81aso974328a12.0; 
 Thu, 05 Sep 2024 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547886; x=1726152686; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=khBp+7bVE0pRYL+IURNeyyKfZwQKei0LfxEqGUBU3As=;
 b=UIAdM+U4wMyutpB/KHfQ5kpEvOE0JePkEhCB6wt+nb6bxQHivMQ46pX/tAbd/adaCG
 GwFWkMZ8byzR/pLMLAAgz3gZGe5tQffLk0E+N9+3ovAqMVRloVNiWyF/rAecVLe7VZpn
 xFMMITz7u0+kEP4+/DsNzIglyguYmTMnEhofIr9YWm+CUykXxpdGJ2aCLc4w6pUEsnaM
 lbIoL3v3ddRlc/MSBdd9oIfc4OHTSF868fn0QY/fOR7fOnJ8KlKvrE/M8WqWEd6wfAhj
 +1lTZ30hBdiGZiIVvdZF8qIo0ONlF9e7ZJx5smE2cXfv6OTRJtweWQI8w2YiBIG5TvcX
 vVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547886; x=1726152686;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khBp+7bVE0pRYL+IURNeyyKfZwQKei0LfxEqGUBU3As=;
 b=kbgaPjIDnat6f8D6DLtV/pIbYM9hWFaNIUZ/shHm/vQOEeqw3ocgAczkjwVhNUduMj
 zrGmTx+PA8EqRkz6qVpVm1iBIzUSmlZX7cRrVKDPPdXz4aUWNaE8s2JQotgSYgqYZwiK
 2HaMgmbEl5S9zPjCO6Gyad2Ie1kLg8z6ymLpmNrS6hFvRi1pKR6GnwwRYkvhVnftpSMD
 B7zah+uTOwlFQZWjqHfHb8+DiOLHBr26D1NNaeiBydmeXMeyPDqMqgKcW3SoHX+ltZUG
 1pdfST4Gjwdgqr8vuL222sioW1LqvpKq7tFTndLKL7WCsO5RWq6Va5wBbQ7yWnvU6+Pl
 QShQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjaDIQ0pGNHgaweAT7EjnYNaazWNrORfKROv05Un+w/JLZCO0CSzk2tLIN5ZJoonIIfy/DZ7Al7zS@lists.freedesktop.org,
 AJvYcCWqL1SSWXK0fOW7R7LnPHGpVu1kNjXhkmIrDnYPnAI1vUgG34xUd4uNLR/74IArxmwN5YKsQa4yDEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDvTTacDfUM9911To+mnm2y9BvMo5fHI45ECN3/6FPWuhCQW+d
 elYVZRtK9B8GgvrkBzhgscyZgx0fcSJyNf87jKQaFpkXNNsgBtQh
X-Google-Smtp-Source: AGHT+IFmlJ+ocz+T/WgmYTqPNQl/xNecdLVUrUif/9DJxq37qVefgp0MMq8SLucOpU0+y5Dvnw0LKQ==
X-Received: by 2002:a05:6402:848:b0:5c0:b33d:5fcc with SMTP id
 4fb4d7f45d1cf-5c21ed52b2amr20478966a12.20.1725547884673; 
 Thu, 05 Sep 2024 07:51:24 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:24 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v3 00/10] Preemption support for A7XX
Date: Thu, 05 Sep 2024 16:51:18 +0200
Message-Id: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbF2WYC/33NTQ6DIBAF4KsY1p0GARW76j2aLhBGnaT+BAxpY
 7x70ZWLpss3ee+blQX0hIHdspV5jBRoGlOQl4zZ3owdArmUmeBCcZ0XMHvEYV5SDUxVcFigtYi
 10Uo1smZplxotvQ/z8Uy5p7BM/nO8iPl+/afFHDhUjTOitFJxWd27wdDraqeB7VoUJ0HyX4JIg
 i4NonHCOs3PwrZtX3ik/nn0AAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=4165;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=0370zKmzY2AWzHv1mdoNPa7o5cPmRzdjitFQ21GHXIc=;
 b=mCl24BQ75phDXeT/B5kU0POxdwZ7HTJ42T58Nh/mIbwJGbUETSfM0cs6ORunMLC0gHfH3LAvQ
 ehiWRn83Kv+De33cw9aPnQ0ULw34nC1xKtqkWAePe81KAz7CSvkG2dQ
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

This series implements preemption for A7XX targets, which allows the GPU to
switch to an higher priority ring when work is pushed to it, reducing latency
for high priority submissions.

This series enables L1 preemption with skip_save_restore which requires
the following userspace patches to function:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544

A flag is added to `msm_submitqueue_create` to only allow submissions
from compatible userspace to be preempted, therefore maintaining
compatibility.

Preemption is currently only enabled by default on A750, it can be
enabled on other targets through the `enable_preemption` module
parameter. This is because more testing is required on other targets.

For testing on other HW it is sufficient to set that parameter to a
value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
allows to run any application as high priority therefore preempting
submissions from other applications.

The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
added in this series can be used to observe preemption's behavior as
well as measuring preemption latency.

Some commits from this series are based on a previous series to enable
preemption on A6XX targets:

https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
Changes in v3:
- Added documentation about preemption
- Use quirks to determine which target supports preemption
- Add a module parameter to force disabling or enabling preemption
- Clear postamble when profiling
- Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
- Make preemption records MAP_PRIV
- Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
  anymore
- Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com

Changes in v2:
- Added preept_record_size for X185 in PATCH 3/7
- Added patches to reset perf counters
- Dropped unused defines
- Dropped unused variable (fixes warning)
- Only enable preemption on a750
- Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
- Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
- Added Neil's Tested-By tags
- Added explanation for UAPI changes in commit message
- Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com

---
Antonino Maniscalco (10):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
      drm/msm/A6xx: Implement preemption for A7XX targets
      drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/A6xx: Use posamble to reset counters on preemption
      drm/msm/A6xx: Add traces for preemption
      drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
      drm/msm/A6xx: Enable preemption for A750
      Documentation: document adreno preemption

 Documentation/gpu/msm-preemption.rst               |  98 +++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 14 files changed, 1094 insertions(+), 42 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

