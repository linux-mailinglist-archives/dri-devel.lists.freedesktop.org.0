Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB37B84CEB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936B410E8A7;
	Thu, 18 Sep 2025 13:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VzgBqAFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09410E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:29:14 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso916800b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758202154; x=1758806954; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dOwkfE/lpu4kqNhIAjD42/DYM6juoh5ZfCsmQbeSZjo=;
 b=VzgBqAFIzBSbLneM9zpinPr2oqe2jN9A32zXNRS9frVzHwkObYsP2dULUHGsIZu/JA
 i82KAnAsrs5csbL95aunby0ex6BVaEJJME7fuiEbzIvTRzt2CJNAm2a6Zs0IpBAFUZoG
 T4NRZDdchF5l136oLOFnzmins24rQiQVamtGE4QaAHBRr0nvUh/ENb2vvAVvS8YXQ2JD
 sXc9G7tm312KavkHeJWv6T2Zey6/0CrcA/4ULfWCnvrcUhGWcDk7j/e845CYA7P8Ri4Q
 AO3jBhnrjtpzNBDAzUk45Ad1JXMAromgpIrpsKgINv3ks8K1hMPEA4EneeGI0yA3h6VF
 rFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758202154; x=1758806954;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dOwkfE/lpu4kqNhIAjD42/DYM6juoh5ZfCsmQbeSZjo=;
 b=OJe4rxud0iRAUHbpcTtaRcPPr3r3Wp1/UjylEHLoyPDi7TQm7OHaLWV1fuvMRc5HSA
 nVERFvAcEORvqoHQC8t2gXRG4BFpVxx17DoBQcRqZHnWGFy0OJIwJnd6X8AMb1/HqFqE
 Qttop6VPVjXTl6P0MT5vUgZbKKXUoZtJDWOErEDkrJf5CwCnPtOePj0jsF/CJbpAeuLD
 dHpcdmUNPvfe8bTFOsVInkzzNMpmkBxYVyh2qADaVXPPWCiBZdkUY5nM1bLaeLlaBVyX
 phtC23HC/kyglgVkCMlgtWbmKnUQX7VSaBHHL6pBjogz1WltV8j37py3GObuQ7c9uNym
 LTOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4KKrPdsOrtOQh9PyxNZIrNq+Q4eYtyfDoQHgpioTdmLIy4l6AalzQ2wRwTZ8F/WSMQH4TE+Aa6Sc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwjMX8W2p2T6W4veZ3anpsu9JrVLn3En+KfwPyTZI+FRpBEtS/
 8cQLJJtO5Hx7sYt2ERkR5nwbTk8PC0I4N7XqMTzHQ3Gbgz6o0xNEBNICFcpM97T4Zm0=
X-Gm-Gg: ASbGnctIbm/1nHX8iL1fvYmNuj8NXhil/yqOEOKKNRMxrEDgyybRY+myMgCrnXX6sMM
 Q7j5ShDuUL8LUBnmyBarOGNQhrkHTFgAWPyuH/vUSO+xftipWFd8ERakBuatxrQOJfO/LBuimza
 4fENjfchO6bkXfff6ZJHXDUVwx9iSy8ISxABTDniVkxWge58PlTuuUSvf65ZOe6MMJWlL1Jeuhd
 bl9YVVJ7H27AjKzeYK1jffsZqw+6n22rWRn4zxwUIDRgP9FavN2BfjWW/WSlXbTonw9yY5A7MrG
 0vg73f+4/GyltjIcNcqth0Q0ixM/jppy+ugTsVOrIdUVxwb7cdzFxU6oPiDnjXvs10hn9W6CzuX
 +8zOINcXofus2KvRyIlAkdOG9sN0cEwocMMg=
X-Google-Smtp-Source: AGHT+IEpk629RS8fvEtFqPQj48Mq3PuG8sH11LgAqCd0Tch4SuTCKn12502XheLVfe0ehKSN+CMKOg==
X-Received: by 2002:a05:6a20:6a07:b0:252:f0b6:bf3 with SMTP id
 adf61e73a8af0-27aa99c1a50mr9502181637.55.1758202153598; 
 Thu, 18 Sep 2025 06:29:13 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:29:13 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with dual-interface
Date: Thu, 18 Sep 2025 21:28:52 +0800
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQJzGgC/x2NwQ6CMBAFf4Xs2Ze0FSv4K8RDWVbdg1i3QkwI/
 27jceYws1ERUyl0aTYyWbXoa67g46EhfqT5LtCpCgounFzvO6wRPsI44L2kCVmzYMnlY5KeaMH
 d2bPj/jiyoxrJJjf9/g/Ddd9/I0rt73EAAAA=
X-Change-ID: 20250918-v6-16-rc2-quad-pipe-upstream-4-c871c0c93bc0
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=8439;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=jAA0W9zivzFc518ni2wZlLuH0VRfMnxoZMcCbTcN7r8=;
 b=lftdvCy9O4XgO//pcDx9P7ejbk886Fv3HysOiyJVohn9NXtITkUGiktKi+nBh3dh9F2PSaTIS
 b9psga5t02cAoe6dHNTT0oIQu4h/wMFLIoYKEJyTFE1ID3fMA+550aB
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
    
    Changes in v16:
    - Rebase to latest branch msm-next-lumag.
    - Fix IGT test failures.
    - Drop patches that have been merged.
    - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org
    
    Changes in v15:
    - Polish logic in sspp check and assignment.
    - Link to v14: https://lore.kernel.org/r/20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org
    
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
Jun Nie (10):
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 115 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 428 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 380 insertions(+), 248 deletions(-)
---
base-commit: 01f31f83a125db48c058e1864cbfe877c086b6fb
change-id: 20250918-v6-16-rc2-quad-pipe-upstream-4-c871c0c93bc0

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

