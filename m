Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397698448E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D53C10E6C2;
	Tue, 24 Sep 2024 11:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iQN0n64C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320ED10E2AA;
 Tue, 24 Sep 2024 11:30:41 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so5350842a12.2; 
 Tue, 24 Sep 2024 04:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177439; x=1727782239; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8RXumhNxnjiM8fBrcvv7yn8BmJXvo9F+xKOIxhcGDnA=;
 b=iQN0n64CnOGwL8ZVvaQcTnfvhnDfeWViKoFE5ftEPWmLjS8fTUUtB8EWW2UsoHF0nL
 TCW+Vsul6Iac7sgLFQJwTcD/eiGORJBxd0Rs0XIwoEYeRdGZEyZPrIeGLeM3P8G/9ttP
 48E+x0bPa7dJtD/uVJFuAcSOewNOB25+y5qKLhRie7xPNDJ6gVYrp1d5Wpi/sRto2MyX
 Rg9PJbAaQLUT0GruppbQIbEl2J4NGRTb9WI5L8Ec1XxqG13yYgq8kVOt06nRiBYPXTrZ
 bUa0YKUPMB+smjJ0+/BpQoW6HStM7ZW7cdl7YJ/y35QluwlaRK8LUsPrJneUa+d1TIYF
 ZEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177439; x=1727782239;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RXumhNxnjiM8fBrcvv7yn8BmJXvo9F+xKOIxhcGDnA=;
 b=uS8kbTzH53WUFXSjp+pSjJU5OFYIHS+IqKOw99WL1EjhjRi/cHn6O/ycsgJYAOrtKP
 gaRX+IZVga8rmAsR9S6lBNUS8zSsS3TrDCSdiJbLv/BZerl4NgccwbY5wR+ON444wxX6
 vwPpvzAzw56jDcxocWmUBuF701dtxQ0yFrjdjizqszNGYoVgMUcp+d8kQy5PxM9LO4yh
 Z4aSX8O56KM1J+maVvob3UvpfZDkbN7xWVe5kBFCYsViGxwPhoWU9eH+Hh8TTHMtq/7e
 GwbjpkjzfPi7O+v2gDzX1k/CbhIp2BYnHb0lCKDcX+9BRaAi6MUotT0sxdh+m1vdE400
 qYgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyh3NHtBh9JAx1HoImbcBoqbL/EngJGh7XkDKxU07jMNDuaJ5QhMUQQ+X5Ox2/AJkso5Z3cIwXdp0=@lists.freedesktop.org,
 AJvYcCWOFCbqzCL+pcY1Zl5/x32/QJEAjlcoOxERl7ZBpYU5+Rmh666iuvjlRqnfi2eBG3FZvNsdkomJQPff@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv9F+8OeXESkfWbI/BvmjIiTzAuY5TvxnJQtb99GFdKWj13HFH
 qmD8e1yxcAtNGZgpbVsQaEcCod+aZBudvagxxlx9vWzGSJOQugCk
X-Google-Smtp-Source: AGHT+IEBtVEm1LDZ0kRkzH8QS7YqE8JYo+ci0cKJTv5Zn9UNARVwylj8VWa96xVxdKuQaz0TzZsNPQ==
X-Received: by 2002:a17:907:e6d5:b0:a8a:926a:d027 with SMTP id
 a640c23a62f3a-a90d577d59fmr1328908966b.45.1727177439233; 
 Tue, 24 Sep 2024 04:30:39 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:38 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Subject: [PATCH v5 00/11] Preemption support for A7XX
Date: Tue, 24 Sep 2024 13:30:35 +0200
Message-Id: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANui8mYC/33Oyw6CMBAF0F8xXVszfUBbV/6HcVHaQZrII0CIx
 vDvjmxEQ1zeyZ0z82QD9gkHdtw9WY9TGlLbUMj2OxYq31yRp0iZSZAarMh41yPW3Ug17k0GfOR
 lQHTeal0ox2iPGmW6L+b5QrlKw9j2j+XEJN7Tf9okOHBTRC/zoDQoc7rWPt0Ooa3ZW5vkSlCwJ
 UgSbO4RfZQhWvgV1EdwsPmDIqGMTpvcudIU4VfQK0GYLUGT4LKoLQiJ4L+EeZ5f370H3ngBAAA
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=5397;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=9rr2GCwL3Qg4YWNVnVnRFvrFIjI+pbL6A2yKODpAQSk=;
 b=YiBcgR/NhSCrzzgoQcRNq9pKYkW+N8cr+UBt257xG9wRFvx7pi6bmHk+0FTwwz4iLX96FkNVM
 lskgfjLyAKPBZ6BJ8HjcHcwJyk3vTpM/UfvjoIkJRPOTiDAvfAs0Q3m
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
Changes in v5:
- Made preemption documentation more detailed
- Added ring ID to preempt_record BO name
- Added Neil's Tested-By tags
- Added Akhil's Reviewed-By tags
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

 Documentation/gpu/msm-preemption.rst               |  99 +++++
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
 include/uapi/drm/msm_drm.h                         |   5 +-
 20 files changed, 1118 insertions(+), 66 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240815-preemption-a750-t-fcee9a844b39

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

