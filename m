Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D81AC3CB2
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5946A10E2E7;
	Mon, 26 May 2025 09:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oGm0RC4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE10710E300
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:28:32 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-742af848148so1161403b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251712; x=1748856512; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FR+PHGPVJCSXO6Ljla8wClhFRVs2i9P25mgTuKSnMzM=;
 b=oGm0RC4Cs6A7ReBh4dw1qp0TkKD6QIFfQipM+8OzNKxQ5DHcBfc9FsgYNO9oZ2cKP1
 xxjwkrWzc9tJYjpkV7imhnTSr31+sL2Ewr9nue7YfxdUhggDCvr2UdHYve769pDTfxKp
 jcOuhGuddBn27YGMuB2/iIF2sscX7emMtkcAQNrYNDUfDolnAogtcfIz/ZAXYoA8SVPh
 oBbYupd06vgMXu2VBlT9ukU7ctJPKaPaaUF0WGR1V1a6Snf//Y5d7vHcEcYeYVNDQcT/
 hSVuRPmm9WVvAiw84O3+r4NY5KL4ObZ5x4HDOlGPFE5SWoDUoDM4f7Wp5wDSoE3w9G4m
 gJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251712; x=1748856512;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FR+PHGPVJCSXO6Ljla8wClhFRVs2i9P25mgTuKSnMzM=;
 b=JfQYHVvr7tLN90zzXOHZ46ZgHMyWLkln8WGDykubfvx088Ea8sYr415LuLAfoTjzed
 Rx0geR80ipcLO+OIKfM2+k8R9QragutP4W4i1vrSTT8gQtu5b+hDBIzkkCUoRVCvUT5+
 bEEO5Lmn236+83/lzXBpghb299FHnl9KHtaaM6uJH0DjllAt/6ln47FAzPJCeaJioHWm
 gJAupWaKatmDopXvs8bcw1xfXw77bD/w4ntpnOdkGgBQYmJUEsMDLgS0O9FO95W6RJsE
 N1sVh0Al18AMQKw/AArd7keH4Owb0LNOvCYBqF2mt18Mvrg6Pi+KLW2nbEoE5k9JmTKj
 6I5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiIR4fBz+B32ZxMsnz2faMGHsYZHxYWQCjnZ4iJ3a7964jNQIBvGEf3em0Ka9nfCbZbTkqcI1mFQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIjG/bS8RJKSSVVgF+tAgxfP1gE/HGGqUJQF+YOyuy68MfUPx7
 FI1mXuBGjBpaW4/Q9+ZyuzQqqDRUzvITTK2zkLvNNapgtVMOs/b4WZSsXHoR0qhm4FI=
X-Gm-Gg: ASbGncvzYtCef4YM+wN4ElgtKo4yGICJouCzgYON3ZTpeIuumBjMd4x0PTV+Gbsrez7
 7OEVqOcU5sCFjX87850s1GKwLYBimEwS1bFUGIwmb+GbPDYR3jiB+C3JoYh0VYj/KKINVHTzq+I
 n9V/ZGQeOuiDuCwxRxkGxw26Oa15Tck8lB75sgrErL4haMoRhGsS//Nw74oDCGgKo5wWrtWhacb
 WcQ5oRf5pY+rRGiLNqdoh7UpkflpiAuSyjSP6pDyEPKXLVle/MoNleh7qRWpHFbfv+ok45gUalL
 HkgQvH2SAey0bqEN9fAq5bUhByk9w/Skwx04RLECiOcbn4+mf69cu7nJVTgY
X-Google-Smtp-Source: AGHT+IGnc73btOrsjWDntnsm8IkznTP7wick+3W4Gpyj8p+oNZouMsPWugDgy9IsyVVAgcWJTmc2lg==
X-Received: by 2002:a05:6a00:140f:b0:742:a0c8:b5cd with SMTP id
 d2e1a72fcca58-745fe035e53mr12257432b3a.19.1748251712209; 
 Mon, 26 May 2025 02:28:32 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:28:31 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v10 00/12] drm/msm/dpu: Support quad pipe with dual-interface
Date: Mon, 26 May 2025 17:28:18 +0800
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADI0NGgC/x2MQQqAIBAAvxJ7bsEElfpKdBDdag+VaUkg/T3pO
 AMzBRJFpgRDUyBS5sTHXqETbQNutftCyL4KkEIqoaTGrLFTeN7WY+BAeId0RbIbzkZ7KZzvjbN
 Q8xBp5ud/j9P7frumJ+BrAAAA
X-Change-ID: 20250526-v6-15-quad-pipe-upstream-f76d20cd97ca
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=6454;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=VRIB9TvG2hUh9wimHv6fQoaJBGhT+dC4OrXW8LmGVGc=;
 b=9b/pprogDtWzvbo/BL8ltIL0diylc8OC9nqF5nXpr3lzabgNvyGFvveaQ2/K1qIQMzZw8b4LS
 glFcQKq2M9ZBkPNNSlSQHXhj29S3UctlnBxWjqxOBEEeM86MBu9q/C5
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

2 or more SSPPs and dual-DSI interface are need for super wide panel.
And 4 DSC are preferred for power optimal in this case due to width
limitation of SSPP and MDP clock rate constrain. This patch set
extends number of pipes to 4 and revise related mixer blending logic
to support quad pipe. All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

Changes in v10:
- Drop changes in drm helper side, because num_lm == 0 does not lead to
  any issue in the first call to dpu_plane_atomic_check_nosspp() with
  latest repo. It is initialized properly right after the call in
  drm_atomic_helper_check_planes(), thus the later plane splitting works
  as expected.
- Rebase to latest msm-next branch.
- Fix PIPES_PER_STAGE to PIPES_PER_PLANE where handling all pipes, instead
  of stages.
- Link to v9: https://lore.kernel.org/r/20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org

Changes in v9:
- Rebase to latest mainline and drop 3 patches as mainline already cover
  the logic.
  "Do not fix number of DSC"
  "configure DSC per number in use"
  "switch RM to use crtc_id rather than enc_id for allocation"
- Add a patch to check crtc before checking plane in drm framework.
- Add a patch to use dedicated WB number in an encoder to avoid regression.
- Revise the condition to decide quad-pipe topology.
- Link to v8: https://lore.kernel.org/r/20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org

Changes in v8:
- Fix looping pipes of a plane in _dpu_plane_color_fill()
- Improve pipe assignment with deleting pipes loop in stage.
- Define PIPES_PER_PLANE properly when it appears fisrt.
- rename lms_in_pair to lms_in_stage to avoid confusion.
- Add review tags.
- Link to v7: https://lore.kernel.org/r/20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org

Changes in v7:
- Improve pipe assignment to avoid point to invalid memory.
- Define STAGES_PER_PLANE as 2 only when quad-pipe is introduced.
- Polish LM number when blending pipes with min() and pull up to caller func.
- Add review tags.
- Link to v6: https://lore.kernel.org/r/20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org

Changes in v6:
- Replace LM number with PP number to calculate PP number per encoder.
- Rebase to Linux v6.14-rc2.
- Add review tags.
- Link to v5: https://lore.kernel.org/r/20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org

Changes in v5:
- Iterate SSPP flushing within the required mixer pair, instead of all
  active mixers or specific mixer.
- Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
  interfaces case.
- Remove valid flag and use width for pipe validation.
- Polish commit messages and code comments.
- Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org

Changes in v4:
- Restrict SSPP flushing to the required mixer, instead of all active mixers.
- Polish commit messages and code comments.
- Rebase to latest msm/drm-next branch.
- Move pipe checking patch to the top of patch set.
- Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (12):
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: Use dedicated WB number definition
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 115 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 406 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 388 insertions(+), 241 deletions(-)
---
base-commit: a9a5d1e329d508972cd86b6f76866d7ecb45a5f6
change-id: 20250526-v6-15-quad-pipe-upstream-f76d20cd97ca

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

