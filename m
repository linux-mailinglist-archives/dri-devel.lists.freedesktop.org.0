Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2626B35B8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 05:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6C310E029;
	Fri, 10 Mar 2023 04:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889C410E029
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 04:44:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ay14so15599276edb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 20:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678423486;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=APGAiUlIJpJRbYAIZ5nOkr0hb7mWXQrPffrcm6b20tU=;
 b=TXuOteR1nB594M1W2K9ahWNO5scYh2QRDv2zkmHCQBvkqn3pkbWyAmRF9QyT9UgXyC
 W7TsMrRrmgVdxppiFCgPz3IO+fK9d2rmkN3+d8wqd/BBrDcsf29/JdgaR70CEHPswAIw
 WGleQ3ex3JWMebDv/s9EoQprvJ2ejuz0J709uVA/YzdCMSvG0tSjxVfgHN54XmIoi7LW
 8cSYTOCrQCmZmvxa5QQJsTAMdkVzMb26buBXoUAxrEgM4pXHDIdg8Zr7+JI+5pf2knBZ
 ctUlAU4PltbSCHICndar9dKCRZbTDeNOVoaEMH6BUuPR9n/O+uDCJEu0wUBtpDdJbTOt
 /KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678423486;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APGAiUlIJpJRbYAIZ5nOkr0hb7mWXQrPffrcm6b20tU=;
 b=JMwO3FRwpneolyKmkwB3ZDSS6JNmymM1GmYxar9+4cO3ead0B7lzwJJzz06gcb+7+D
 3Z6eJK5iZX7gRTRk94ElnsIU2s+l3TGdct3+mb6SQ5/7o9ISo/2NIQkva1dSKFtCWHqM
 pxjmIWQt8GdAFEsTiFsdyz9FBLvquq8LctigCetH+r18yKRnaYyVquyuPpIltNHCwk9W
 XnA2bmhWuGzkYT9it8hKet5ohGxlHDKS++edquoWYL2v48pVkqYpAxLOdsCfAjlc/S+S
 UVaL4kWsfjPWWS4ZMIMGy3XvqF/EWkihGWOZuqD4CQ2/gM+ox7vIjkKsEaHyTx3+YVzY
 /3EA==
X-Gm-Message-State: AO0yUKX+pixYNkXTJsAV4gzEhNvBlOHoRjrAeGgUcNrasIFetXt9FYIv
 wf4fNeKJSJ102YTzJQiibXmSGQJkWgaeuL+Bzin2dDPGkQQriA==
X-Google-Smtp-Source: AK7set9yoa4QwF4rkrjxDH7pV8iyy+fdFGuFgU9IA0gRWkBHTEs8N7wextGh/oXfUpFzo7kZaIkQ+EXAkqfRMBzhpjI=
X-Received: by 2002:a17:906:a14:b0:8b1:38d6:9853 with SMTP id
 w20-20020a1709060a1400b008b138d69853mr11495105ejf.2.1678423485737; Thu, 09
 Mar 2023 20:44:45 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Mar 2023 14:44:33 +1000
Message-ID: <CAPM=9tw4eFsBCha-h2FvM_ofXMcEJAEsoT_HqxZc9gWe20J+yA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.3-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Weekly fixes, msm and amdgpu are the vast majority of these, otherwise
some straggler misc from last week for nouveau and cirrus and a
mailmap update for a drm developer.

Regards,
Dave.

drm-fixes-2023-03-10:
drm fixes for 6.3-rc2

mailmap
- add an entry

nouveau:
- fix system shutdown regression
- build warning fix

cirrus:
- NULL ptr deref fix

msm:
- fix invalid ptr free in syncobj cleanup
- sync GMU removal in teardown
- a5xx preemption fixes
- fix runpm imbalance
- DPU hw fixes
- stack corruption fix
- clear DSPP reservation

amdgpu:
- Misc display fixes
- UMC 8.10 fixes
- Driver unload fixes
- NBIO 7.3.0 fix
- Error checking fixes for soc15, nv, soc21 read register interface
- Fix video cap query for VCN 4.0.4

amdkfd:
- Fix return check in doorbell handling
The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-10

for you to fetch changes up to 519b23310aa100073f0b58c39df120a486ed7f8e:

  Merge tag 'amd-drm-fixes-6.3-2023-03-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-03-10
14:17:35 +1000)

----------------------------------------------------------------
drm fixes for 6.3-rc2

mailmap
- add an entry

nouveau:
- fix system shutdown regression
- build warning fix

cirrus:
- NULL ptr deref fix

msm:
- fix invalid ptr free in syncobj cleanup
- sync GMU removal in teardown
- a5xx preemption fixes
- fix runpm imbalance
- DPU hw fixes
- stack corruption fix
- clear DSPP reservation

amdgpu:
- Misc display fixes
- UMC 8.10 fixes
- Driver unload fixes
- NBIO 7.3.0 fix
- Error checking fixes for soc15, nv, soc21 read register interface
- Fix video cap query for VCN 4.0.4

amdkfd:
- Fix return check in doorbell handling

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv

Alexandr Sapozhnikov (1):
      drm/cirrus: NULL-check pipe->plane.state->fb in cirrus_pipe_update()

Ben Skeggs (1):
      drm/nouveau/fb/gp102-: cache scrubber binary on first load

Candice Li (2):
      drm/amdgpu: Support umc node harvest config on umc v8_10
      drm/amd/pm: Enable ecc_info table support for smu v13_0_10

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2023-02-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      mailmap: add mailmap entries for Faith.
      Merge tag 'drm-msm-fixes-2023-03-09' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-6.3-2023-03-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Dmitry Baryshkov (18):
      drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
      drm/msm/a5xx: fix highest bank bit for a530
      drm/msm/a5xx: fix the emptyness check in the preempt code
      drm/msm/a5xx: fix context faults during ring switch
      drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
      drm/msm/dpu: disable features unsupported by QCM2290
      drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
      drm/msm/dpu: fix len of sc7180 ctl blocks
      drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
      drm/msm/dpu: correct sm8550 scaler
      drm/msm/dpu: correct sc8280xp scaler
      drm/msm/dpu: correct sm8450 scaler
      drm/msm/dpu: correct sm8250 and sm8350 scaler
      drm/msm/dpu: correct sm6115 scaler
      drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
      drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
      drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
      drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage

Douglas Anderson (1):
      drm/msm/a6xx: Make GPU destroy a bit safer

Harry Wentland (2):
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs

Jiri Slaby (SUSE) (1):
      drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype

Johan Hovold (1):
      drm/msm/adreno: fix runtime PM imbalance at unbind

Kalyan Thota (1):
      drm/msm/dpu: clear DSPP reservations in rm release

Kuogee Hsieh (1):
      drm/msm/disp/dpu: fix sc7280_pp base offset

Mario Limonciello (1):
      drm/amd: Fix initialization mistake for NBIO 7.3.0

Randy Dunlap (1):
      drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed

Rob Clark (2):
      Merge tag 'drm-msm-fixes-2023-01-16' into msm-fixes
      drm/msm: Fix potential invalid ptr free

Shashank Sharma (1):
      drm/amdgpu: fix return value check in kfd

Swapnil Patel (1):
      drm/amd/display: Update clock table to include highest clock setting

Thomas Zimmermann (1):
      drm/msm: Fix possible uninitialized access in fbdev

Veerabadhran Gopalakrishnan (1):
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4

lyndonli (2):
      drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
      drm/amdgpu: Fix the warning info when removing amdgpu device

 .mailmap                                           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   7 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   8 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |  19 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  75 ++++++++++
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   6 +-
 drivers/gpu/drm/drm_atomic.c                       |   1 +
 drivers/gpu/drm/msm/Kconfig                        |   1 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   2 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 166 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   2 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |   5 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |  21 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c     |  41 ++---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c     |   4 +-
 drivers/gpu/drm/tiny/cirrus.c                      |   2 +-
 37 files changed, 280 insertions(+), 191 deletions(-)
