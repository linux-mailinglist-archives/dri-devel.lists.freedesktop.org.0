Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E484D318
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 21:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD3E10E160;
	Wed,  7 Feb 2024 20:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NARnY1kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B3F10E160;
 Wed,  7 Feb 2024 20:42:23 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so1376876a12.1; 
 Wed, 07 Feb 2024 12:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707338542; x=1707943342; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i7SRBxYoK9LHUFD9hGgBcXZ8tzxyzNmubya79xIxsbE=;
 b=NARnY1kQKiUOQo2AZceZGKL35iXI7+Ub6wlpMikTljZyUSAyMdsx+T6Immv2yfba+m
 PERQ+40JGfJQt0K4dyLFbgPUxRcijeJIOBeFP5ZCVic2YEwXv5OmS4t0dzIgS0VAVSfh
 IzNINatmmFeyowiNKr9LzNJ/Fkl8NIt28yA9HilbfmGZiIHHt6MyeBUO5YPogMrG/kOE
 7GbiL/0fx27/DqcW/mkvNxs+7BYZ6guWdHWlteCDCEVBK/Ddw2od6zL/O1DOc0CrCmtF
 tPA00lJNWwPXMSsFfZkxAkJAk9ofUNJIo2w+Gj9R4EBT4lpokxPeBUsW8DdIgR3rmZgo
 z5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707338542; x=1707943342;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i7SRBxYoK9LHUFD9hGgBcXZ8tzxyzNmubya79xIxsbE=;
 b=ZzjYJykGsv4Jz8elZ5GYFVR7rhd3hqSPX+mHBqft9dc4Det0sT6oMMa4lxwN1BcZ7r
 JhJoCIEQ4RTPZLUf7KOCJvZqHjt17vEgSbeW1w0Oy1d6LQ7B4KU4AclJrJmcL85ZUBFp
 +CkXidEXyaI9+OqdGxtaa6yrvSqvo8w7Vz4Cs8R7ajg7Eg7h7ko8LDNCnTK1cHJXbY3q
 ihbFI8wN/eg21eKY1hhnk8shGZophCsruPgOOoo1dev84qCeX+xvk/grqmU+TQs59MPW
 K0MKHSHDuthej7Em0UgIasJQnPgZDKOezli7RhHC8U379zjCLBQ6epBhqtXF8darpqxC
 pq0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtCn7TDuvFTpi0hFaxFQEY5suVKJ8hYAcYf00RmW4cbC21X88igqBopi5z7cNalEklSSiI2zTpRrWRrQaxyfpnpyLm1VFml80NKD3tTXi7
X-Gm-Message-State: AOJu0Yxcz5SQ4LfgnqPfSYFWadtP+11qRKQmbheEhfcsKc6739WIDOk4
 SJm4jBxq1ZdWFXp94JvD7EeIeXzgGHwAKbgKeBlgerpZy/8R/fuYomzqWnL3AHDx3lpz6HG5TdC
 AFMcjyNGvUmQ0cpz6/HbLlQEkkWLImk72y+M=
X-Google-Smtp-Source: AGHT+IFY3hjMz3ULM/3LgTj/OI5mPF5L/7niwSxy11z7IHfIRFUyp2boumPUFmr4o9DUWE5Yb2lHWlai8l/DVZmKoMc=
X-Received: by 2002:a50:fb0b:0:b0:55f:ff7b:3a00 with SMTP id
 d11-20020a50fb0b000000b0055fff7b3a00mr4783718edq.8.1707338541881; Wed, 07 Feb
 2024 12:42:21 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Feb 2024 12:42:09 -0800
Message-ID: <CAF6AEGv+tb1+_cp7ftxcMZbbxE9810rvxeaC50eL=msQ+zkm0g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-02-07 for v6.8-rc4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Dave,

A few fixes for v6.8, description below

The following changes since commit d4ca26ac4be0d9aea7005c40df75e6775749671b:

  drm/msm/dp: call dp_display_get_next_bridge() during probe
(2023-12-14 09:27:46 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-07

for you to fetch changes up to 8d35217149daa33358c284aca6a56d5ab92cfc6c:

  drm/msm/mdss: specify cfg bandwidth for SDM670 (2024-01-25 14:36:04 -0800)

----------------------------------------------------------------
Fixes for v6.8-rc4

DPU:
- fix for kernel doc warnings and smatch warnings in dpu_encoder
- fix for smatch warning in dpu_encoder
- fix the bus bandwidth value for SDM670

DP:
- fixes to handle unknown bpc case correctly for DP. The current code was
  spilling over into other bits of DP configuration register, had to be
  fixed to avoid the extra shifts which were causing the spill over
- fix for MISC0 programming in DP driver to program the correct
  colorimetry value

GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup

Dmitry Baryshkov (1):
      drm/msm/mdss: specify cfg bandwidth for SDM670

Kuogee Hsieh (2):
      drm/msms/dp: fixed link clock divider bits be over written in
BPC unknown case
      drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case

Randy Dunlap (1):
      drm/msm/dpu: fix kernel-doc warnings

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            |  5 -----
 drivers/gpu/drm/msm/dp/dp_link.c            | 22 ++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_reg.h             |  3 +++
 drivers/gpu/drm/msm/msm_mdss.c              |  1 +
 6 files changed, 22 insertions(+), 20 deletions(-)
