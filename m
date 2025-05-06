Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF875AAC9CF
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F93110E6E7;
	Tue,  6 May 2025 15:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LxitwZ7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F35710E6E6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:47:44 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-30a8c9906e5so1138020a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546463; x=1747151263; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NsrOsUBqCO5Q5SZFn+5AGarKR0SfFGjvJfXesi7IMTs=;
 b=LxitwZ7WVxdyFlboGsLJjLAL3UJLDzVIjsX6tQA5fiEbuOLhJwGcAXJBHI2h7MVJ33
 57r9nhKdFhEeSKerMTpuQODWbjDTQyKr2WA4ig/TVzCoeSLYB9hdFxlbwXHP7lUQdxMw
 g6BjmsOaQcVJdMpNg4wEgRSD1PqjDqxPH0fyLCVXl5k32nPUIdCraDvsv9h2cnYYhIVm
 CMzMTu6DQwjl1XAKtcK4xQLndSotHgc/aadK2GJ7dn94BLa3GGq47cTl7Jxc+pRwIfSF
 ZeZifKZ5zISlffizcQz4Ze5hST4OJgkgJmcVvCYsFljNnN/424AJGDpqAcqfgycI9oxE
 Nf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546463; x=1747151263;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NsrOsUBqCO5Q5SZFn+5AGarKR0SfFGjvJfXesi7IMTs=;
 b=nSxj4nlZIZnQ5wfX4etOQyqWSXNRykO1UT6y/wyxKXsKTWv7xoxQdjoO4vc3tVgFiB
 uUM1MHoCJoC0g9kHecnVs+uJfnxvwLfsX4phjrMzU75TLvO01fdLn3CUaM53L1ypUqf+
 39CEGDLi+87SobYzCfckxDcmK863TPOJBtztEorn5S4vs7anIC/tqeGzVq5z0aGNmYWU
 GcQiTmDH4yyzYCZpBW7bMg5CUbh4pr7k73Er2i/QVwc/x1sXySddzJ2WtzXRqcrkny9w
 WMkPLuPWyWZvtM0uD8VLFa0LNj/+N1rQGt2vV86tVJskjfVK3PVqR1TJVc/Kkiuh74kH
 3g6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLL8vFnGE5DJTlVufGOYR8oidQO3jFsRJQdJuB9zrReNBg3/Ji2H3YRRof9DTpVpmUAfY/5ThMneE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLsF6NTeiC+9anFBNL8iatPdFKsL1cgT6cfeONRxyOOjbWwok+
 1eUwZLMzZBEbMeMvk97yXPIreY/DNAGU7Au1lxdJ2v/1Gs7xCJyCLcDkXgNcZFk=
X-Gm-Gg: ASbGnct3DCqbQ8EJmwhCzMo4jbZOToUt3WgUCNFa9a+cRc5WT2yW+mlQaxg0wM1hAdY
 1od32JlGtxDn/+Bb+xEw+k/P/7/TQzY+uHzQXGwe+hN/gk6P6oPodzX4eCsyUvc+bXKRRwij9mC
 Qz21IfszjcGgrX0GN3XOJnFYsq1kjqtDny6ABDZcjTCb3iKppKW0uZ0wfqUSPaCb8xsvyDAAb1l
 DoJFfUtfrp5owXripbGreJ3el/rUd9aQbChvmZGLf9HLlnAZiCuDEjGn5Rs8Ka8o6hz6+OVB1CM
 l12P8EBoVJUUBHYLvQ+SCOAOXsPxKgC8jO4hIA==
X-Google-Smtp-Source: AGHT+IGYXZGu5JQQL5rWHElY0maLlBnpq0XUa98OP7P+l31dS5z2od40yCJMbghY3JLbEzXjU84fWA==
X-Received: by 2002:a17:90b:562f:b0:309:cf0b:cb37 with SMTP id
 98e67ed59e1d1-30a6196ef18mr17984829a91.7.1746546463540; 
 Tue, 06 May 2025 08:47:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:47:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v9 00/14] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Tue, 06 May 2025 23:47:30 +0800
Message-Id: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMvGmgC/x3MQQqAIBBA0avIrBswKaGuEi00p5pFZZoRhHdPW
 r7F/y9ECkwRevFCoJsjH3tBVwmYVrMvhOyKQUnVylZqPJNx6NkTJh+vQGZDoxvp3KRtbTWU0Ae
 a+fmnw5jzBwTgcDxkAAAA
X-Change-ID: 20250506-quad-pipe-upstream-a640ddc6b1b6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=6078;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=fRsSE07MO5RUSBN9OSYwWzEbBbJmQQggB3I2E+b9zdk=;
 b=epsXReT144s5pEJd7o6nTP7dmucju7dZPM6w4s37QKyOAtEO+QdijmP34TGUgrfVTKRPN0MgS
 kkAvAHBS9dyDt+F6s0WDdzT96oK+YVrBEYHFtOhwfWzCEjbDf5N+Dd5
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
Jun Nie (14):
      drm/atomic-helper: Add crtc check before checking plane
      drm/msm/dpu: check every pipe per capability
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

 drivers/gpu/drm/drm_atomic_helper.c              |  19 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 115 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 408 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 11 files changed, 403 insertions(+), 247 deletions(-)
---
base-commit: 227403a8562686275197009528ff9f1b440cb20f
change-id: 20250506-quad-pipe-upstream-a640ddc6b1b6

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

