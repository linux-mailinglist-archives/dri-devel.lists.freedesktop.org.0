Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D373096658C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70110E22A;
	Fri, 30 Aug 2024 15:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMtrxct9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1730910E21F;
 Fri, 30 Aug 2024 15:33:16 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so239030966b.0; 
 Fri, 30 Aug 2024 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031994; x=1725636794; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R1ZBcIcsd4bEjsD7xcbVzlCNWsKtjr2ojpG3+aHZkdM=;
 b=gMtrxct92wWt+h9uQ24d/BtovstwURUVx8xJAsQyWel31yOwlQNfT99b7QMaLFs0UW
 LsC8OxP7gphvmqFmCVevR2jFvRObBOB+U9VxINrDW415be8sO9Wb07GO116kxYJ+49tc
 POd9jw7+UncHmu9AnWDgQNrv72J18di7xC5YC3ZlIMoDBnFSeKLDBtZD/JFiTPT12CkX
 vpJpby1kYTtY67wBRhISQZRQl4v2R9CgNJXW2pG9WKkvaDMYJvUpFd/Vo8hAwASIXzyy
 GzXzAE8YMiQtTanEuKKiApAChgkvRzQRt+L1ckFY9CevMYXObGB5EARyug9CUAJGHyB9
 JriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031994; x=1725636794;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1ZBcIcsd4bEjsD7xcbVzlCNWsKtjr2ojpG3+aHZkdM=;
 b=CiFM4RUwcw9apYSgEHLtrCehqmF9A6jsg1gxNoU58scS3OQSjVv+pRrGzeCLoO/kKs
 rdN8JzK9WoGWd27d+Dd1c4hZJcKY43Hp1sbR9+GQkn8SzotO+IeSw0DsjcSvXlDy4n31
 mmnDuT6BXcnfT1bBSoUH13SGLZnynN+tJT/pAnj/xrVjD8wf+VMHc9MFd+MNGXJW2C/v
 eivNHluX1fyfnQ+YWA39JnJDzzUE1QxxSD0klu/ZWvhhio8LUKSb/R3CPIt7ZQAeZK/j
 68gQZAtp0UlSQF7Kf4DGQf2oDbnyVf5HdJjoula8iqxWVbUMaZQhGhzUjiVx713+kdON
 biSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWozK8ydz74g5wt+eWR9n+xX9dr3O5rSEaI0gbLAi88fMrCG7rd2BMHWQtP72X2NLg+IkkA2lGavbS6@lists.freedesktop.org,
 AJvYcCXDmkyE1fp3u064h0kaC4+rS0aib8BmAOfRtP8kgGW4SaOziAbcjy4j6ZVoEGHzHQObsKDzwS0M5I4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwypqvyU+smBrGjRQ1p8yAA4WZtTjqeUOan9xL/CG2fCgPMebSu
 1SY8RVr5aLxxjqIEh12c5c5iGC2A5dVYHeeo4fEHz5PB9CsJJedp
X-Google-Smtp-Source: AGHT+IGr2l5cXWMITLg/oTe7o7MpKjteV67FsCYxIox8G4FTimM1Iyjbl6EHRnVPBUhpI84sgaosgQ==
X-Received: by 2002:a17:907:7e94:b0:a7a:a3f7:389e with SMTP id
 a640c23a62f3a-a897f78daccmr600062466b.6.1725031993536; 
 Fri, 30 Aug 2024 08:33:13 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:13 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v2 0/9] Preemption support for A7XX
Date: Fri, 30 Aug 2024 17:32:42 +0200
Message-Id: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrm0WYC/32NTQ6CMBCFr0Jm7Zj+YcGV9zAsShlgEqGkJURDu
 LuVA7j8Xt773g6JIlOCe7FDpI0ThzmDuhTgRzcPhNxlBiWUEZUscYlE07LmGjpbClyx90S1q4x
 pdQ15lxs9v0/ns8k8clpD/JwXm/yl/2ybRIG27Zy6eW2Eto9hcvy6+jBBcxzHF0f9E6eyAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2848;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+/XloqlmCsquY7kMKECVJCoaSk/Is6TefQiw2Wa+1Fk=;
 b=w9oRe0fzxNWwC/eWWHvVBB6Yv22prxU4QaZz5P1TKaHgZzw762E/J40AjyHtsIWM/tFdIDRSd
 WSpN0PDPkx+AJrp9LYIholowKlxQ+RYnQci5ekgBaJcBY18hAAjWn4T
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

Some commits from this series are based on a previous series to enable
preemption on A6XX targets:

https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
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
Antonino Maniscalco (9):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm: Add submitqueue setup and close
      drm/msm: Add a `preempt_record_size` field
      drm/msm/A6xx: Implement preemption for A7XX targets
      drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/A6xx: Use posamble to reset counters on preemption
      drm/msm/A6xx: Add traces for preemption
      drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
      drm/msm/A6xx: Enable preemption for A750

 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 353 +++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 462 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   8 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   7 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |  13 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 12 files changed, 1062 insertions(+), 40 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

