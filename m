Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F91AB18472
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61210E8A1;
	Fri,  1 Aug 2025 15:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WBPQ0nIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C4510E8A1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:07:47 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23ffa7b3b30so10406565ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060867; x=1754665667; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=106+qj6fPtqcw4cgNYXTkI8WumvzYf5yx+BSbDzApRc=;
 b=WBPQ0nImI1v0dHs5mYd2B35/PVwqOJ6pbJ6rct54gUZ/vUkcAynEFZLAi57rpF68js
 2l0Ae7m2x4I9n423IlGRlxMW0hRgppCQl3UC0vEWHvgu7d5Dl2P5t9hKAHMmeiTPls+1
 0VrNyqSDmgdKHD5T3CLEX754LAF+/eTuG2qkihUQAfYAASX+bZInd432BkG3WeOtMkGt
 GhX/tAWnsXxyyue6eaBlGwKo7Pz5knK3Ui5ep23iimUgCfP5ndOqyXFkKXP5qhh1/Fmq
 W70yuUC2iZ8IPsjo2zG3X0lwNXuP2TWMK32s0Nqu+hnSB9xLmEncMEiyjg54mr4oSFrM
 p15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060867; x=1754665667;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=106+qj6fPtqcw4cgNYXTkI8WumvzYf5yx+BSbDzApRc=;
 b=HkxCUmxecUI/F+ijoVSRvnbGH0OeA/XrnwfYnTw0sbz30SMQ9pJ/4APKNKbWv0ifuR
 i/m364sXZ8C1U/2fAux1LHpDFFxrAHbiNZmqyUwti+d736P2r+OSuI8gOWb+uHWVTbZw
 8qIaO+RCUI/wZHcn8OSbjN6hHggOCsByRBtcOT5/m9fzsNjyizmwwliKnnvmxVHAjV3G
 Krh+ka2FNFahcRAmCnNFdenycY3ul+/ruNYvYoVXC73vWh4mb49wbfogtNSAt6vxjT4Q
 xtmmxgGAvMTVyxZyuwxrN7XcIy1uDRVqjzPvIcxGCsKqqseRZOAlUyzM9Xm61lQVqW6i
 N9yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRwSwqVgxCDUEF/RW3Fgo4MHKEpu62nKD3dFhpeX8ELoH45Ldxp5yRNyw2VXmm97dohu0MI7N5DFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7pmGwL8XftK81FL4mhMx8W2U2vV7huTcSPVu88IwxmM7AuiZh
 b2HRhW1gdSNJ8WPJESfULjht9b32BYq7/edcYpPoyTUw9tgrbi3G5mX/uC01j/XIwK0=
X-Gm-Gg: ASbGncug63yMSUxxtEYzPUhZocdPOBTL6P+j/e/Sz9NEmWi+8qfpCVMk5/cf+tHxd9N
 PRb4EttcG0sYx0qBNBCrGbLuYH28WLLpscabOlaGDfzxu9cEosLB5K7/h9+fSloKNzZf8rmYLis
 IItajvugl0Gg8y23OMxrgxmlt9qbTfzV42n36fWxVq2b60xQliE4h35HlzSldrKO0yXpVpA0H14
 7Cw6iCt0o0yE4k8WfgiXlcwzOctXjz8hAsdD3t2xblFbd0ygGfUxihR4Jl6rjU0oFMwEK+D95ij
 t95HCFmNy+Kr9Ogo57kH1tMmrYeaa0h6xGZWYBn8oRPWZypvLS6TjpsJgOv9RNZlAu0flFrCblf
 MfRBJoT5yqwIxM5B3qg==
X-Google-Smtp-Source: AGHT+IGqeDKUAlkYy4GOeCgxdJf59+m6ATh2vqP1BwPmMrCzXl2Vz8y53rzBOY6r5v7je774FoaNkw==
X-Received: by 2002:a17:903:1746:b0:240:6aad:1c43 with SMTP id
 d9443c01a7336-24096b548b8mr174514895ad.48.1754060867130; 
 Fri, 01 Aug 2025 08:07:47 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:46 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v14 00/13] drm/msm/dpu: Support quad pipe with dual-interface
Date: Fri, 01 Aug 2025 23:07:24 +0800
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzYjGgC/32NywrCMBBFf0WydiSPJhFX/od0EZpJG9AmTtqil
 P67seDW5Tlczl1ZQYpY2OWwMsIllpjGCqI5Hlg3uLFHiL4KJrnU3HIDiwFhgDoJz9l5yDEjzLl
 MhO4B2nCltVchNIHVRCYM8bX3b23lIZYp0Xu/W4T86l/Z/i/XNXAwFpWVAq0/q+s9jo7SKVHP2
 m3bPqKZRR/MAAAA
X-Change-ID: 20250706-v6-16-rc2-quad-pipe-upstream-560355d3ff4f
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=7751;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uA2ixnnoXafXruIUteuT3qqmY9e8PDC/kHFAhbO3cd4=;
 b=QY/SXpKDAL8jD4MdGcdh4/bW5eZ5zcbfjIQyxoSQmzg0eNBKZeFpW1iBxJxpxtgxStxPdPPDC
 SB65hz8Sx6DBZmLA59UFLYjxUCbP6AdJ5lbndNO3qo3HZwVOdtBvgd2
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

Changes in v14:
- Add patch to fix null pointer bug SSPP sharing, which is missed in
  the last version.
- Polish single pipe check with removing loop.
- Polish logic of SSPP sharing test in dpu_plane_virtual_assign_resources()
- Polish argument of dpu_plane_virtual_assign_resources().
- Link to v13: https://lore.kernel.org/r/20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org

Changes in v13:
- Modify the SSPP assignment patch for sharing SSPP among planes in
  quad-pipe case.
- Link to v12: https://lore.kernel.org/r/20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org
    
Changes in v12:
- Polish single pipe case detection in a plane. Add stage index check when
  sharing SSPP with multi-rect mode in 2 planes.
- Abstract SSPP assignment in a stage into a function.
- Rebase to latest msm/msm-next.
- Link to v11: https://lore.kernel.org/r/20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org

Changes in v11:
- Change function name from dpu_plane_check_single_pipe to
  dpu_plane_get_single_pipe.
- Abstract SSPP assignment in stage into a function.
- Link to v10: https://lore.kernel.org/r/20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org

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
Jun Nie (13):
      drm/msm: Do not validate SSPP when it is not ready
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 120 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 445 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 414 insertions(+), 259 deletions(-)
---
base-commit: c7f3b7e47fcc7bcb5326275e38c203770e21357e
change-id: 20250706-v6-16-rc2-quad-pipe-upstream-560355d3ff4f

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

