Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E8AA15362
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE59C10EB24;
	Fri, 17 Jan 2025 16:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Pe9xBcfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C1710EB24
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:01:06 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-215770613dbso32299785ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129666; x=1737734466; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PPKBiO+R3EgZx77A0TPWnAvVcvrAKMzeINEZaeXVJnE=;
 b=Pe9xBcfqf34mm6CE6lHKFGNqqoTy5t19WZ0z1m2PQ+1eJIYnBwIKPrInuwWnyUA0VD
 15RV7U8PPuu4h+ApJID1/V35byb5sW7YQs6uz0aBPFvoBH0C9AJY6yuBiXfZoT+Ydhe4
 BZmtwtaTFGYxtjgvAzTVSZ/PMY1OjVteJ9sa0lO8N/8xAJyUaae8ydbUBo0Fos2cysl1
 LM6bu2z9egr1iZLgH9omyBR96Vp7vjIwGyiz2E4LxZELb3opQZIuYMNBjuDMTjflF3di
 yNSYERRKLZjMW0p6+bQS/XggH5+ONoSh1dJhC4bX/d3tBRuXzBOjDMe30e8hXBd6sxMJ
 PoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129666; x=1737734466;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPKBiO+R3EgZx77A0TPWnAvVcvrAKMzeINEZaeXVJnE=;
 b=VL8egqPY8eAvOlHQcKgN4PhKq9NjO6NjLKlFV0n256Q2DF1lJiKrA8Ky4uCdLkoIBb
 qwxtS020dpXgQsnky3BUiExkFKBieMzLPXytr3KQm6R8Fufhy7f134EJ/XeTG4CDOqIG
 ccm7THahnY8WE/YTGAcyeiu44oRKbRE/uVpCAXALsEK7OaYMbR/3N+iw5N9JpseLqg22
 kA/p8Gcb/fu0pd7JGcrS9aqf2ZKpjomfYhMmkOf6U151GU7L5JOIGytbEQBuJK+BUA9w
 ntFPhZKw7wFiFNo792YFveZr5aYcliWuwb1aa3LVwZYIXd+jCpPfugs8u+b8uOWI6jxR
 xEeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsuEOPXLJExpjLc6vuXKaBS7kgvRi+Yzo08IbZq89eWi3K6+25vszli51yeJDpAtGxvCZHdj7Ke34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+fYE+NCvtMQ85VkJbeCcBPklQmx/s2ZD6xdRFEd/Ba3cuiEgM
 ebaZAGjAnqFVDqyRZulkLnYhQO69KbAnU7Jv89uD7sKCD3yhsKuYamAcimAq0BM=
X-Gm-Gg: ASbGnctHxZrEwnOOpEfXM3YqRCF4xamq35TyljiIeZLnxpmpvKEAsRgJBL++71mvIXb
 HtYXQ50CTzLyiqS4DzbKHrsbZWerQk/8YfVYTuEflD/iiR54nEtyGtHD7ulsYHzjukqLOzDpsvK
 LGBJpgPdnxUnnW9apgqhpYRhW8rottTFEU5Apz1NOBXIeI8oDJ2aa7FINXRN7JN1p1FtyY+RrbE
 kSfpz5YMr3q0juonIF01lsXolYZtcdV/2zIXGlwqQRVlBwfNF2tng==
X-Google-Smtp-Source: AGHT+IFCeX5eddePBHDI+lbpSYeds/KFM0/bcoTWVb9canYO3oKiBovN+3CGC03Ilb7/N7Iwi6Be2g==
X-Received: by 2002:a17:902:ea02:b0:215:19ae:77bf with SMTP id
 d9443c01a7336-21c355028e9mr53570145ad.19.1737129666083; 
 Fri, 17 Jan 2025 08:01:06 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:05 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Sat, 18 Jan 2025 00:00:43 +0800
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKt+imcC/53NSw6CMBSF4a2Qjr2mLwo4ch+GQW0v0GgptkA0h
 L1bWYLD/wzOt5GE0WEil2IjEVeXXBhzlKeCmEGPPYKzuQmnvKSMKUi+ViWFVQETMHgLFs1DRwv
 epgSvRVtYpjRH1B6EgE43lkvLK1Mzkk+niJ17H+CtzT24NIf4OfxV/ta/qVUChUpWsjEK71qI6
 9ONOoZziD1p933/AndkG9LtAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4678;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=g4wHki1acUZ4SGxtT81osJ+lxPcuS+NzxwZWfXfKlgI=;
 b=CDs/fiB1Bs+rHnEJlPaGI1fKDaA9SzbRS4cYP5EftnVMDeA5XA2eTwmk/z5R9xQUw2/jodlEP
 bYJpeUXDWuCAxS32iWtY3cgDvQCowwve9gPXYkCcfJLYLbd1MU56fyH
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

Changes in v5:
- Iterate SSPP flushing within the required mixer pair, instead of all
  active mixers or specific mixer.
- Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
  interfaces case.
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  75 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 404 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 517 insertions(+), 345 deletions(-)
---
base-commit: 793ba0dd2dc6a38180a82d0ad0c58920bcf595b5
change-id: 20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-fa9d24d27c81

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

