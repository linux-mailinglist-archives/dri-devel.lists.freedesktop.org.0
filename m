Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FACA45F1A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36C10E1DE;
	Wed, 26 Feb 2025 12:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G8UaB7XY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B034410E1DE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:32:16 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2fe82414cf7so1136099a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573135; x=1741177935; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nLwMDc9HvQFeLzMA/QjMcCF3FmyqVGFtUL4wI4RN+NY=;
 b=G8UaB7XYkBVhgucTmU1+DaejiGdXCD3HqtbhHgoXL5WqIblCxxhk8qTR3Bc1DBVg4p
 x1ogaYgkxe2gvHdRExJQ8cmSFrnioGAzbQrJKyhQCYrvhOwBWDYMRpx3iEoeLIldiFm9
 AYRs1cqkxeWKscPd3nlnGVxM+FEmhKz5Kjw1POPfUZ0D0fIB5KzzS253sFtzmRABiw+T
 ve97TNzkmIz3iRval74FSFdbIly+2qQDdP8g/P62g95bUjpszZF9sUi6u8t+2MMbfCs8
 iOaWQV/ETjpIsG/sdZ6K6CFTRbWlKLaIBq96vLGFlZEzEpVHy+S8HorRQpFoJsaNtLWM
 fIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573135; x=1741177935;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLwMDc9HvQFeLzMA/QjMcCF3FmyqVGFtUL4wI4RN+NY=;
 b=L6owiG8OQ0+zOO1Y7kK3UBkyOTteFAWEE+E3K0GhE2zGVGIJDV7/hvQjhSKNFdCI73
 wvkCbR6T9v4iKMMaLt+4XCgpis/lLmrdbzQYADwj0KO2DZmVzwXFGx0E42ja8JcojGly
 KUdA2E1OUtzmxLMwOT8KiyaOJLgqjDwoa1L8v8XlZwPelny6ZWASjwdt2J5FJYcX2Xbc
 /zOFOEJ+ATm0fSz6u1linSb3MqbtG+/NCyfYe6VCFCoQZqwLtFZaumkYVcsQdFAWuCrb
 6uf93dYazfIzrMXo68dZpQR491SRbcx8k5khTeiig2KKsmC1fBoMKY2uzbeYp2qX5y6x
 gdYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy/4SusPrvDdluZ8kXWHsyEIw3nawzI315xTgLyQ4qWQ0oKwFpMEl1o4HH7OsTHZ3FTBrnT+CvtLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMTByFVClnnQhCz+km14a+wHOZjU4CXB8V/Xn6FkBBN2Os67dv
 12YP62rlk+UE6v2duW9jG3nLPsrXao4oTHut/xTNVFqI9dmjW1R2+NWIvQA7L47JplHGFzQryiZ
 SHxahT/07
X-Gm-Gg: ASbGncs1O79HZPeZS4AaqpR0IVUWki78z3ZY62obl5WD0tgmFKN75d/WOERRYT9voHH
 Xu3bwPI/kLvuHKgVn31l0mYP6H+FiWPSQRj3iDFItZRULtIfbJD936IO6B/0xeRoeN8EyQVTRiY
 qB8qQvvxzept4v/x+qv/lGXbFQWZlyYaTVTwREhG7VVcjMaat2CNF7ZJ6ab65J43WXnA7URjcrV
 xUhcxEcs6OL4iUJTQcspBe0+UB1p8BdX4pFttrLbDLTORI/uWTVGT6ofwi7XhyU6ngJRWBvJ8/t
 0HsHmbBoG/Dpx29zuNId8gY=
X-Google-Smtp-Source: AGHT+IEbAyFBBOMkxX8iii+oG2zEvN+iVSKnB8HOk1y0lYNcQvxQ9iWW6DeYSTP1NWuOybRV4hR6Ag==
X-Received: by 2002:a17:90b:2e08:b0:2f5:88bb:12f with SMTP id
 98e67ed59e1d1-2fe68ae74ebmr10318377a91.21.1740573135543; 
 Wed, 26 Feb 2025 04:32:15 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:32:15 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v7 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Wed, 26 Feb 2025 20:30:49 +0800
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHkJv2cC/62OTQ6CMBBGr0K6dkyh0IIr72FYVDpAI9A6BdQQ7
 m7lDC7fS76fjQUki4Fdko0RrjZYN0VQp4Q1vZ46BGsis4xnBc9SBWEsZcFhlZDm0I8GDDYPTQZ
 GEwI8F21g8WEm1CO4wdydm1+kvUcCIcETekDBq7ZqSyGkZnEoyta+jxO3OnJvw+zoc3xa5c/+d
 T5mOTRpmsdOlQuproOdNLmzo47V+75/AeTMizQVAQAA
X-Change-ID: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=5416;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=VBK03V2F6vXX1tPpdWKGvw2UDlBxDRc/SEGCFWAoghw=;
 b=hscE8wpDC3R8ueN5JF46sO3IoxiKACWus9Wa5L/Y69195ArHTygUgkfnmSuo1hX1EwUw3hJUj
 bpmj+o80zo6Cf2m8H5K/8P721uK7s9gO4b7AogkHyngNh2iiB+E3PZh
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

To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
are needed:
https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads

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
Jun Nie (15):
      drm/msm/dpu: check every pipe per capability
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  88 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  70 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 411 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 516 insertions(+), 348 deletions(-)
---
base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
change-id: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

