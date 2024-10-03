Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0898F3B8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321F10E8A8;
	Thu,  3 Oct 2024 16:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vs7gsOEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C3210E8A8;
 Thu,  3 Oct 2024 16:12:59 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a9909dff33dso186507866b.2; 
 Thu, 03 Oct 2024 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971977; x=1728576777; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lpeWjYXsrE4ZMwk6NM8ToxrdkcEn2cV2v/O/0qLRmyk=;
 b=Vs7gsOEKYyZINnf/9MCQ043uhayYO0rLJctpaZXVp0jS3AjjYuMev8/Wzb8svXlVFj
 eZ2W0j6GD9vPpPOM5t+qeg9CXBP9EFDt16zoGq3CykKcgrsrTGZL9FloDxRLD4ThrjKN
 iJbfdZN+oFwq7fHPKTZfE0DWf+mZvMrFstiJANvwB88NWUm8wHX15e/2+R8Go7MtTQcD
 UqncseU7+roZnsX5TLLa/FOooJ3Bj+saBr3nn18aiR56Nio5gfTHOg1cp/ZOa13gvkn4
 yjJgpVAMYGiMCvuo8yTdzCCN/rdrgTNYQp2DauOuR0YOqlOnaDqBI+8SBc0wcfC2i27t
 8LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971977; x=1728576777;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpeWjYXsrE4ZMwk6NM8ToxrdkcEn2cV2v/O/0qLRmyk=;
 b=ofAqMai8uLSojJW66EKtPZ4YLjjMuLOfeqwR3bd30fdaGRSk91T6yGFLR7zVFn/uO4
 5Pw6g6D7Ho6HofbhM3H+fsl6sP7MBXgvwqf8DKPujmot4hguZqTHWkOZX3I97akL3lc7
 giowSDtpSJ+NyYdSZg5GDJ51h4CbJvNUY8BG5oO7tRzs97gZiX0I53ZMkxs5JxYEC50h
 M36U0MXkaMcvmYGS3k6VoQaQCIqC7VIHx0ZCqlYLg9lnCCACuYW/bwwQz1wxOwskrMnZ
 rrZI2229+EQFOiNDUio+npgr/OeffRueRjy+DryoqmBSe0DSg1vUfsdJFIYIvk7PnSFh
 IWNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9xKEqirX/ZXULMMjd+n8BrHxfYbRCqv58XdnyAgpzkVCnlWbSQTucPYcFpxnItzyYu6dfpTDsKmIB@lists.freedesktop.org,
 AJvYcCWzLvCCVA2V2zFHnpxZ4z6uNIsLWaRyHUzNgznAUHSIQXgH4qC9dpPPOIXuxLknnMOvkN3EtHWw0KU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2NAgHiWvxTjcFFcvkK9ioU6o3jzpNpCOasUg2QFNHuJdFU+aK
 aPXIxmmSyHUjwVNTeFl5AFtC7VsKqwAvnoUwGbpOfnbsmJ2c8o8z
X-Google-Smtp-Source: AGHT+IH63OWRK6OqdMqx/AZ7QzH3uPE/mpjI7459Kq2yzE6mImLT+aHputdeHkan1Do6z15rHgQvPw==
X-Received: by 2002:a17:907:7e94:b0:a8b:6ee7:ba1e with SMTP id
 a640c23a62f3a-a98f83873d3mr636587366b.60.1727971977010; 
 Thu, 03 Oct 2024 09:12:57 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:12:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v8 00/12] Preemption support for A7XX
Date: Thu, 03 Oct 2024 18:12:49 +0200
Message-Id: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILC/mYC/33QTW7DIBAF4KtErEs1wPDXVe9RdYFhSJDqOLItq
 1Xku5d4U+RYXT40fDN6dzbRWGhib6c7G2kpUxmuNbiXE4uXcD0TL6lmJkEiOKH5bSTqb3Md48F
 q4DPPkcgHh9gpz+q/OpHL92Z+fNZ8KdM8jD/bikU8Xv/TFsGB2y4FaaJCUPb93Ify9RqHnj20R
 TaCgiNBVsGZQBSSjMnBXlB/gofDG1QVcvJojffZdnEvYCMIeyRgFbxO6EBIgvAk6EaQeCToKkB
 HsstOROGeejCtYI4EszVpSFBWBl3eC7YRjpu0VUDrQEUbdDDYCuu6/gJPwLNMPgIAAA==
X-Change-ID: 20240815-preemption-a750-t-fcee9a844b39
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=6265;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=rkp7RZ94GbN8pEuZecJnFPn4wVK/JYzqYxT1p88HKmw=;
 b=aFlFHevyD+QE1so4ObJaxnEoxJsHXL440+3PXsAztqmYAwRp22wnI+HJyQ+dsw6nAMorSoMZX
 BEOV8lKUSarBLaF+9afDm74tQakeQDUqJYM92ZaqhE9PX3p+yiJTJ6v
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
Changes in v8:
- Updated commit message on 11/12 to reflect the fact that we are
  enabling on more targets
- Fixed typo in documentation
- Link to v7: https://lore.kernel.org/r/20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com

Changes in v7:
- Enable preemption on more targets
- Move pwrup reglist to a6xx_catalog and get rid of ifpc list
- Split out smmu_info from preemption record in separate GPU_RO
  allocation
- Make postmable buffer GPU_RO
- Link to v6: https://lore.kernel.org/r/20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com

Changes in v6:
- Fixed commit message prefix (A6XX->a6xx)
- Allow preemption to be disabled at run time
- Link to v5: https://lore.kernel.org/r/20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com

Changes in v5:
- Made preemption documentation more detailed
- Added ring ID to preempt_record BO name
- Added Neil's Tested-By tags
- Added Akhil's Reviewed-By tags
- Added Rob's Tested-By tags
- Moved preemption module params to adreno_device.c
- Link to v4: https://lore.kernel.org/r/20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com

Changes in v4:
- Added missing register in pwrup list 
- Removed and rearrange barriers
- Renamed `skip_inline_wptr` to `restore_wptr`
- Track ctx seqno per ring
- Removed secure preempt context
- NOP out postamble to disable it instantly
- Only emit pwrup reglist once
- Document bv_rptr_addr
- Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
- Set name on preempt record buffer
- Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com

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
Antonino Maniscalco (12):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/a6xx: Track current_ctx_seqno per ring
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
      drm/msm/a6xx: Add a pwrup_list field to a6xx_info
      drm/msm/a6xx: Implement preemption for a7xx targets
      drm/msm/a6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/a6xx: Use posamble to reset counters on preemption
      drm/msm/a6xx: Add traces for preemption
      drm/msm/a6xx: Add a flag to allow preemption to submitqueue_create
      drm/msm/a6xx: Enable preemption for tested a7xx targets
      Documentation: document adreno preemption

 Documentation/gpu/msm-preemption.rst               |  99 +++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  42 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 235 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 170 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 457 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  22 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 20 files changed, 1090 insertions(+), 69 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

