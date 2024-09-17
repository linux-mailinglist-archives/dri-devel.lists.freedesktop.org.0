Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6497AF50
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2BB10E168;
	Tue, 17 Sep 2024 11:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FRCJmKZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8110E053;
 Tue, 17 Sep 2024 11:14:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso778913866b.0; 
 Tue, 17 Sep 2024 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571655; x=1727176455; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UayKS1Ryd/2ZU19LR8Ae6STsmhjtxW8blequ0WcRifc=;
 b=FRCJmKZl6PQ6gcjlE5GrVGW5LWKhKn5jZnk1SAYWVFLKgbTjTQRRX+dt/Yn03Dbvhm
 Y4WHoqLHI83sFDbsB2ix+v/9HAv6+lgVLOIGMZP2uPedfQRgDoq9z5lIGyZlxtEp6QZ8
 bLJSjOd8sku2OG+M9Z8rZHFXIBVn/H8bDDfIPJEEnNlT2DLQEMiGJohzIGg3jyB+dRZo
 Wrlw95TRaaa7HBeNqkClG/Cx2OdcvweX+4QWwl9F31L+nHjH52Nbv6faaD62avAFBF/a
 W2PKe7AjC18vnfpePV+31kxTtITuyivClGE1faFmIxGFr4wa+/E8kTqjwQG88qIpqkoY
 xoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571655; x=1727176455;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UayKS1Ryd/2ZU19LR8Ae6STsmhjtxW8blequ0WcRifc=;
 b=EfR4R3OBVV4xM0FRRxfINKgQwJqjYkyIeyF+Wiz+YaFcfc08TU4zw4w+gQMaLj90Ae
 2iGyzPTkmk6TFBB9IL+vE77aNVb+g+XfuN507N20jBqrgx9Ka82TiiTdRtLS/EFn7fQG
 4zxKEOGgSV/Bg4vlnMKQnDTzSoavQ4Rt8jmt8a+TSWv1QUjf2w6T3+W9kB1hJhongvjU
 C2nztLIP00JdODcOxgtsuybyiNT0Bu8H8kVIsLzm2eCr579x3/izPaJsvq5TvUnEBzkv
 2dkXpp/Pxn8it6FUzWo3khAMp/FGp69Omr8hCFO3oFyvupkCSJdPJ4J89iy17AhgKTSu
 IkSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzpduQUNb/UV4DdoQBWj6rur9IdyiKfVGG0+Fuyc2wvcvBdtU13jn8N+kODJ9aaCvWAj+m3UmuYLuI@lists.freedesktop.org,
 AJvYcCWpj+Zt3og3SwlfhlFzbgsmG1H2kpg69a6L4ci66dEtrWqaAhPe9s3XWvC7AA3UBzM7zW0E61HTr6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywen+P0M92bA0WfiUca36RdCzrrrMyEKAKUKDVPBU0OHKBCKvBr
 UNkhVAIZcMTbvTtXXpBhio5m8bWhryfEqSSZBWuhL5UpIaD0R2et
X-Google-Smtp-Source: AGHT+IECSFVHLSs2BEa6gNEYukMuwIRh8+PAJowLHgFybu70GwUbv7gOL7Z/0OHAwrPcrtKgysbISw==
X-Received: by 2002:a17:906:730d:b0:a86:ab84:7fc1 with SMTP id
 a640c23a62f3a-a9029620359mr2320985366b.50.1726571654929; 
 Tue, 17 Sep 2024 04:14:14 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:14 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v4 00/11] Preemption support for A7XX
Date: Tue, 17 Sep 2024 13:14:10 +0200
Message-Id: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJk6WYC/33OTQ7CIBAF4KsY1mIo0AKuvIdxQWFoSexPoCGap
 neXdmNjGpdv8uabmVGE4CGi62lGAZKPfuhz4OcTMq3uG8De5owooZzIosRjAOjGKdewFiXBE3Y
 GQGnJec0Uynu54fxrM++PnFsfpyG8txOpWKf/tFRggkVtNa0M44SJW9Np/7yYoUOrluhOYORIo
 FmQlQbQlhorya/AvoIihz+wLDiruKiUcqI2e2FZlg/ji2hINgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=5075;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p43bASK1vfwUMiWcV6qCQue61/vpDXfDQ0kldeq7A80=;
 b=hk5Iub5XOWrLjQszZCzHusnMkYZMvOSGsyYwmJgPjMZhgjDUDdjGbekIQLR9r72L6BMNoffeD
 XKuvlYiVfcWCTqekKi63nJNgN73JaxnMY4NUpexaqmORj/amq7uhrBu
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
Antonino Maniscalco (11):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/A6XX: Track current_ctx_seqno per ring
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
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 20 files changed, 1117 insertions(+), 66 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

