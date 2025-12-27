Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE11CDF4BE
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 07:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF6D10E43B;
	Sat, 27 Dec 2025 06:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bOR9uJyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978B810E43B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 06:31:58 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-8886fdf674bso98826476d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766817117; x=1767421917; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VTwSoxhRamQQwpOT1VWnQ56Hbcor5wdGEmquOifNaVM=;
 b=bOR9uJydr5naFcjfRdRsnsaJaUmdW9XwbpkmfQowTk5iNX1SUMd78/GrG8569uDcrG
 vR7+IVdm4xI+FhTbuWp77dNLpO8XE5O2S2DoDiKDt3JIhh4EvUfyVXLXebTIR7GWxPoa
 uhkgVSrlttXXVOONQBpuIYbULd2Zgm34P4XjHvbyZFHbpaZwBZ2Yk9ae+b7QUxu1vSZS
 4c9zhRsauzCFpCP1RB22eYM1T7/IF+0pSPBYVT5EhdhCFDAUMGJvG82vB4v/aXLcxVU4
 D2cTpBV7fDc/BVSU6pdlQxkPbt6rOgVfmocT4UBd7VI8G+/THsBe7BcFGNVE+Ory3GXP
 2Nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766817117; x=1767421917;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VTwSoxhRamQQwpOT1VWnQ56Hbcor5wdGEmquOifNaVM=;
 b=QUt6wXc3/UpF8jrkEptnauolp5wHRhl2ckhvT1kID5KGJqKe8IS9MfYVONQYaq6hDA
 bZ7uk/tTcJTMNfTBR/6VnpDgAyAMTZAXzwHcREIVOIYyaLW6BOem0554V6yQIf9faILa
 BwihW5mAafivjo9THReqPzjsqAOXZP7cpqPPQm5wzsfzmDJ2+Qk7drNc8o+0s3sOLSHU
 JhVBtbSJsjKtntkLkycZ40rHQyKcuqkhHWG1SGZGKI/XOi2+0Qx2XNwhM5Jfr4Pxbykq
 LP968s1eqL6Dsp60Zp//TShT+Kbcmp5gIJODGYZl48l05nOXIkmOqnp4M/iNbNdrFdgI
 dfsQ==
X-Gm-Message-State: AOJu0Yw/BUHb9TfSZ68uGw9UVL/opNtB5WGr64X7PJKLagp7fJ1w432t
 pPpQ7tjW6ix8OAE5rVV9qnZJ0yukHA6fGt4WxI2rcfYBZrTLF5s4yMa3z/9IXCqvdeVg0QdVaXo
 SPmQ6I5jvp4LyOdT/iy9wRYn7SCGjM1o=
X-Gm-Gg: AY/fxX5bDm4LvxNVVxm0GkHGuBw2Ze54ryLRjrGimXWzmnezLExeufvF3B9YKAHp9GH
 UQ2inuPvCa3JNLKLb4ZTTJZJGsrQxRf87Nx047Txv+w1AwCOqjvOmR6mg+nfPrwwg86aJQ1DmCo
 OmnNPl4Kd7W7YA1KMhGUPCOhKYb4zCx6vYoDE67G4ddTTwqqGHa/bAcV8psYtKYCBtlslmxQuKw
 wRpQQDiYFv6trNuAVeZhvkgv8srfleDkbPfFNNoWz/wxZROXkS+GKFBW99JtJsacKqngG5Y
X-Google-Smtp-Source: AGHT+IGw2OiFT2nEvCkbb+rDjBS+yC5rhDkRmFLuijqjXK6HItR9bP6eYkBrEMoxq2R3AsRLgruB7IT8y29zDbzlNyU=
X-Received: by 2002:a05:6214:488f:b0:88f:ca98:b00a with SMTP id
 6a1803df08f44-88fca98b1bcmr280048256d6.49.1766817117452; Fri, 26 Dec 2025
 22:31:57 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 27 Dec 2025 16:31:45 +1000
X-Gm-Features: AQt7F2q_4_r4scwlozvO8W-qSkxPO79MlSJK9xNJFZD5Yr_0eAC-mETZvGWro0I
Message-ID: <CAPM=9tyGDTYxiidazi2j26BbGpoFmw1R8FHs1BZ26qkGcAiTKw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Post overeating fixes, only msm for this week has anything, so quiet
as expected.

Regards,
Dave.

drm-fixes-2025-12-27:
drm fixes for 6.19-rc3

msm:
- GPU:
  - Fix crash on a7xx GPUs not supporting IFPC
  - Fix perfcntr use with IFPC
  - Concurrent binning fix
- DPU:
  - Fixed DSC and SSPP fetching issues
  - Switched to scnprint instead of snprintf
  - Added missing NULL checks in pingpong code
The following changes since commit 9448598b22c50c8a5bb77a9103e2d49f134c9578:

  Linux 6.19-rc2 (2025-12-21 15:52:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-12-27

for you to fetch changes up to 479e25d88d1681e04cac708501180db606aecd1e:

  Merge tag 'drm-msm-fixes-2025-12-26' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-12-27
16:00:47 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc3

msm:
- GPU:
  - Fix crash on a7xx GPUs not supporting IFPC
  - Fix perfcntr use with IFPC
  - Concurrent binning fix
- DPU:
  - Fixed DSC and SSPP fetching issues
  - Switched to scnprint instead of snprintf
  - Added missing NULL checks in pingpong code

----------------------------------------------------------------
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

Alok Tiwari (1):
      drm/msm/a6xx: move preempt_prepare_postamble after error check

Anna Maniscalco (2):
      drm/msm: add PERFCTR_CNTL to ifpc_reglist
      drm/msm: Fix a7xx per pipe register programming

Dave Airlie (1):
      Merge tag 'drm-msm-fixes-2025-12-26' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Evan Lambert (1):
      drm/msm: Replace unsafe snprintf usage with scnprintf

Neil Armstrong (1):
      drm/msm: adreno: fix deferencing ifpc_reglist when not declared

Nikolay Kuratov (1):
      drm/msm/dpu: Add missing NULL pointer check for pingpong interface

Randy Dunlap (19):
      drm/msm/disp: mdp_format: fix all kernel-doc warnings
      drm/msm/dp: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
      drm/msm: msm_fence.h: fix all kernel-doc warnings
      drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
      drm/msm: msm_gpu.h: fix all kernel-doc warnings
      drm/msm: msm_iommu.c: fix all kernel-doc warnings

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  52 ++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  13 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  38 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  29 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  84 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  23 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  47 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |  16 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 139 ++++++---------------
 drivers/gpu/drm/msm/disp/mdp_format.h              |   6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   1 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |   9 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   8 +-
 drivers/gpu/drm/msm/msm_fence.h                    |  36 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   5 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  68 +++-------
 drivers/gpu/drm/msm/msm_iommu.c                    |   4 +-
 drivers/gpu/drm/msm/msm_perf.c                     |  10 +-
 36 files changed, 348 insertions(+), 373 deletions(-)
