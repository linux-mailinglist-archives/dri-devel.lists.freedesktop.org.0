Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F9A133C0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D397F10E8D4;
	Thu, 16 Jan 2025 07:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QfqaLg9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0D110E8DD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:01 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-216281bc30fso13447425ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012361; x=1737617161; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gmSZKP5nRN+Q6NlmFK451aMopBVPJnHJqMeCmEC5sBE=;
 b=QfqaLg9CTNN0FT/FOSkqYg1tgIpxgnG4NeerVPR1eYVPrq7VRp2i3bwRrWRyQ9NOVO
 aToA03rn+y83gwvXaOz1SikhNJOYD48Lt6/8RSVt+bTPvLi8O5CEbp5Yn1+EEylR8fx5
 wBkNjMLjm8JActHl36eU17k05CMmTS2bs/MIM8N2I8I19CKUxy+EhWlFquP+g9To6wb8
 xJVTYGjBEQahCd/7Bs8Zfh9eTqrQ/EzlKZs1Y6NR9KFpIEzwfcvp8FG/Hel/TV/6ucNM
 dh6SN3WmiKiCi/GbSWNHiQPW4H3YABcM3ckvFykKnGPqpcHUrc6WOQvdqwIUbl9HKtFZ
 XscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012361; x=1737617161;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gmSZKP5nRN+Q6NlmFK451aMopBVPJnHJqMeCmEC5sBE=;
 b=mg1FQl/UQrzJoli51cfYauJHP4niiN2cjS4SWpcCV3kko8Ky11DQjitGONCIGWb7om
 4FdF293YL7TxU6iYcNJ7PmSv/jDWqLRt6V1x9Mq1q2P5SJhSa4T+WPA0qKLUELxvUJ9n
 iZH21MQhxmgYm977nd/X15KyPwU8MG9huEiKC783bdbKmMV0oNI03jKz3GtYH5br4bck
 CN5mhXrA2FRztgqiNiOFk4ofK0d+SC4Y1Wl9ZRCYt5Ms6nFllkBb2jrrNKmeiDwOmtvu
 mSkYehTasnU4n8TL4YNSszlsWBamNzcDKWXDNPqREbw0ldIJWBlSPN9xOXReNb0Jskew
 q9sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWWYq+Gn3i4y8Rx8p3z0r8VMi/s/kitw/LZNC/ZLLdhzG8xwcwzuYdqrAvFHJXRLgEmZC+joDGBSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye6sRVFYqw6inj4RbAYHAiQPKNcoXQXUgCjvMmlhQloj7wZUCR
 AzrjpqAGgVbXzYUegP7kdNTt/eygiCdPLNfyVBO5ZkgkVaNveZSVCITGeyXhZsM=
X-Gm-Gg: ASbGncujSseyMtrF4gVYmfNPVwFa/jCPfPnPIIZo1JRTWVlwxmp/lp1xAC8Ax53fhTp
 Yy/C1gohQ+iF6vqr/lBv+acHcblz+oJHWo9xEnoGTunnzrEtHh2s02eBlJDDv1rGe4fzQlYtoEL
 uLbJzj4JZ/1uIyLZ0TQ+0Fp6Kv6L2BtI/9FWVgM9QYDzXUg53eoY2+vEFU40OcuvKgRPie622qY
 DSqiMl/Er7mHrD6pLJ16xjGru7YqpegjtKQcJKl8lIborueCKYdVg==
X-Google-Smtp-Source: AGHT+IFTIvI5EkuaQ6KqfaH3qw31GwmqkJoOy5oKdbitVNylLzy29o6du0CVwp87h9+cDIRz70pxdg==
X-Received: by 2002:a05:6a00:6c89:b0:725:936d:4187 with SMTP id
 d2e1a72fcca58-72d21fcec01mr42147603b3a.17.1737012360682; 
 Wed, 15 Jan 2025 23:26:00 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:00 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v4 00/16] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Thu, 16 Jan 2025 15:25:49 +0800
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH20iGcC/x3Nyw6CMBBG4Vchs/ZPegFEX8W4aDqDNKaIHSEmh
 He3cfltztlJpSRRujY7FdmSptdc0Z4ailOYH4LE1eSM64y1PTQPfWew9bAeU2awxGcojMyqeK+
 BsS76KRIyvMcYLuxaduc4WKrRpciYvv/h7X4cPy25C2yAAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4359;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=iN3rkkVVQ1U6oQTbbwJT5ewJ9MwWXVsxDdoLcCK8c4k=;
 b=I9iV2vxjX1FrPV/0K21/6N1u9Xo4urLeZKSu8Im1n/io/Imj14vC4Epxxqht1iMJjvg/eHh8s
 mrvGefbyNRHB/kjUkWDaXDjffJ7Bg0QfqaQ3zZ8irs1uj6JXNfrjnlG
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

2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
And 4 DSC are preferred for power optimal in this case. This patch set
extend number of pipes to 4 and revise related mixer blending logic
to support quad pipe.  All these changes depends on the virtual plane
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

Changes in v4:
- Restrict SSPP flushing to the required mixer, instead of all active mixers.
- Polish commit messages and code comments.
- Rebase to latest msm/drm-next branch.
- Move pipe checking patch to the top of patch set.
- Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org/

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org/

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (16):
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
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: Disable SSPP multi-rect mode for every pair
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  85 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  76 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 405 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 13 files changed, 516 insertions(+), 347 deletions(-)
---
base-commit: 793ba0dd2dc6a38180a82d0ad0c58920bcf595b5
change-id: 20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-fa9d24d27c81

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

