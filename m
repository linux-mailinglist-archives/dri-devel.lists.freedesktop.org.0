Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7098A5EC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BDC10E4FD;
	Mon, 30 Sep 2024 13:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aC3SgPGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE66510E4FD;
 Mon, 30 Sep 2024 13:52:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c88e4a7c53so2222999a12.0; 
 Mon, 30 Sep 2024 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704360; x=1728309160; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m1Yaj1emHXeiVt+escUx1dJSR3jSAkcCaxo+65UzPS0=;
 b=aC3SgPGG5S7Dcnb3GVkvC6v9075324lKaYk9jjsW/+aPuyXUMpPiyaLZUcZP5MjhgS
 wNnlc6qrzIWItPDjs0kPBj/6zNhBgVP6IyQ23y+Ei+VWcAecgbxgAfX3kzao7sJNzXKL
 62HHeauwV0lluNUWgUuvVLgQirz1sKrYUra2GTyrBPQgowQMOK5ia4U9syBD9eqUa/SL
 LqxKbtSMxyGCQnSyQB2zThi9PRJWnCiHTAHDeV5D1eH3tEN3fA1jgahOyeqd5KnLnRrs
 VJ5XhXg+68Xz9fL7shhE6LOXUAa6SFtBw7jdHAkuVYYL8BNvOfDN9qbKjW6ZMj2yxoKt
 TGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704360; x=1728309160;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1Yaj1emHXeiVt+escUx1dJSR3jSAkcCaxo+65UzPS0=;
 b=UUu9v4axp3o1aZ0OlZwGLSrF6cs8aM0NWQ4xeuYM9SKuccZWRz3TWyv/c/xKKNPIyJ
 lFZ+9csf9y8+r+45uo2aTRiuUch3vuCzu/xvs5K78GsWb5KhNOWFmfZkfHsS2VfAZ+WF
 hVs93yMjUuWn9F3qmlem1GDLPcIQq0Y75tVaP8vE6NrZK/QipZ8P8C/3FH46eHdQLARy
 GUyAUbm8BKEnkPxZcG1LfYxHRwERcxGdGdT8AkzjcyeCDrDVhIm/vZK3mVuORasQbaJa
 yFpkSs9NdqAqfOOCktw2nvQdiLfg4OaMsg5gZzRibN3vUcljTXy9NbcvqX+2KrugyTDY
 IrMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPXacxl6swh/r7kjRmx7EsEDXzJgATtpx0/12ksRrMXj1Y9K65jru+xg3yHpNAhT10CTEV/fFB6+o=@lists.freedesktop.org,
 AJvYcCVyKpprbcjKgU4joQBC3S43xwY4fxb1BHneOcYuOm75g5pO3KwEdXmtnrjYBrWcJdnQReKNuB/+/5nO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgT62vNohimII8KaF39mkXRUhiJEWG6oRxNc84V0PfaOc8CbbR
 nqUS8Fhugf8Iabhr6mNWBuiCZvSVaenrP5WVTPSs3Ku0Z38vP2bR
X-Google-Smtp-Source: AGHT+IHphhp0QM/xcUftLTNQsVQV0LaSqp1tKGukf2qQrSbPCSCdTcjXgoNlLh56IND7C1V2YuWpag==
X-Received: by 2002:a05:6402:34c4:b0:5c8:8381:c1bf with SMTP id
 4fb4d7f45d1cf-5c88381c226mr8679919a12.3.1727704359537; 
 Mon, 30 Sep 2024 06:52:39 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:39 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v7 00/12] Preemption support for A7XX
Date: Mon, 30 Sep 2024 15:52:35 +0200
Message-Id: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOt+mYC/33QzWrDMAwH8FcpPs9D/rZ32nuMHvwht4alKUkIK
 yXvPjeXmdbs+BfST0J3MuNUcCYfhzuZcC1zGS81mLcDiWd/OSEtqWbCgUuwTNHrhDhcl9pGvVF
 AF5ojovNWyiAcqXO1I5ef3fw61nwu8zJOt33Fyh7V/7SVUaAmJM91FBKE+TwNvny/x3EgD23lj
 SCgJ/AqWO0RfeIxWXgWxJ/goHuDqEJOThrtXDYhPguyEZjpCbIKTiVpgXEE/yKoRuCyJ6gqQEA
 esmWR2Zc/6FbQPUHvn9TIMAstbW6Fbdt+ASjaYy78AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=6010;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=C9HvIpNjNeaznQ0MpKwwi8H/OpfNyuIbOnAsOMiC53c=;
 b=6dOUv5VIPtbiaHxFmr6UvOkF+bC2pXfM2L4ibF1oJqJcAs9mDfMkLgmp57EVwHHH4mz7fCOFs
 GbQU7RY5k6xA8yxEUND4ItTe7YysPwO+UkiLk2UBpcN6z3w0CLbNViX
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
      drm/msm/a6xx: Enable preemption for a750
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

