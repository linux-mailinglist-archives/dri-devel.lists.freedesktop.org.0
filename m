Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00526A40156
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30BD10EB2D;
	Fri, 21 Feb 2025 20:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUU8kvX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07F710EB2D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:51:45 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abbae92be71so293315066b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 12:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740171104; x=1740775904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x96f1GfMBe0SzhF3gidD9+1z7xQuC/mzsHXfqU7tA9M=;
 b=mUU8kvX5peAn/gl8UZT355iHFooWOZkXmApz8CHhKfiadzYWEVo+QRl7WkFQw47w9i
 kXM+52Onx/rHtKVutotLMNLYny4zUSsargErsxaXlxaqRl/EUVGYQX5n+bLq+qCA9KnR
 oAMOZQNMLWcmq9swK2JAN30+QGYIR9bzwuWHstXHylWnQc5aLRnbWB9CLPlj/l3XixIT
 /XkmlV/TicbtiMWUrqH52JBbbDXAMgrQuoUS1VHN4TnzoVt236LycPf/2fVG92o9E37V
 Kh8+8/HzkOkbhjrL3vx0lN4on6zrMc/6a4gE0FqnLcpU0lRtOSNQbr1tgnRK26X9UVnn
 /QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740171104; x=1740775904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x96f1GfMBe0SzhF3gidD9+1z7xQuC/mzsHXfqU7tA9M=;
 b=CXwsM0XhMQx/wBh1FWAqW/Q5ITDiFMG9YlV5TtOLUseRukLWooQoFG8kjoONwrdi22
 OZNb17FYJ/tHqB1+otAyeIuuMLosHlQ7lg9lQ+9WGD+XFLbMSPlOj53/eQUfuS/vcxNT
 qtu4p2Md09UFV6+mXgus1NDGj30COALd4+jZgNsEERc80Bo8ROgdJoLKoqoK4BxLn1Zs
 59/hci8atg7DtGKvGTbzI4QVC5xiB/iFoYkjojn5Q0edpFPJvN81yYUKGSynJ+PyiIWv
 dsaROb/t1HbIy7wlRfycOgc7bS8qLr8CljAfyyvTCfThj5PWvdG3OnMmqUKUQevKgcUp
 fRcA==
X-Gm-Message-State: AOJu0Ywg/BXcIFdkQzDC2v0+ggskKpBIxwRRcYtnalVFcYxIPLsSBRC+
 9D70k8TlUUeb3bJO8nZCTY8ytkoqLVnzVhWT72+HPf4/78LQfJSIWv+w6y8WGDtpC8N/+r3GMjd
 uXeKqoEKFu6CvgjIj6zkUXlwS0Y4=
X-Gm-Gg: ASbGncuoxeFNdPy6XV1d2IImTmMwNfR1465/o/owz09SP4MUZkAp5HNQ1CF740sB1fR
 6ggO6Yau2+ToLmuyKOrEmSCQBHhFhlTrKfYVj1YOA6Ic9KxDFUH7Qc6p+b0W0edZhdnv6iYO05F
 1Fl9W8gw==
X-Google-Smtp-Source: AGHT+IEBIM3w/S/4VXusmbdzIx6RtxGNJF3Zb9ZxCF2ectBaJO4SRI3P29mXck8mE014TqAR9asMcjXvZEJGv/MBQe0=
X-Received: by 2002:a05:6402:2350:b0:5de:a6a8:5ec6 with SMTP id
 4fb4d7f45d1cf-5e0b70f0872mr9828315a12.10.1740171104188; Fri, 21 Feb 2025
 12:51:44 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 22 Feb 2025 06:51:33 +1000
X-Gm-Features: AWEUYZlHT0KIW6LET21wCc2AX_ISkd6d3ZxA2cwyAdI4KGn4QmjXCgDhU4YQ-2Q
Message-ID: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Weekly drm fixes pull request, lots of small things all over, msm has
a bunch of things but all very small, xe, i915, a fix for the cgroup
dmem controller.

Thanks,
Dave.

drm-fixes-2025-02-22:
drm fixes for v6.14-rc4

core:
- remove MAINTAINERS entry

cgroup/dmem:
- use correct function for pool descendants

panel:
- fix signal polarity issue jd9365da-h3

nouveau:
- folio handling fix
- config fix

amdxdna:
- fix missing header

xe:
- Fix error handling in xe_irq_install
- Fix devcoredump format

i915:
- Use spin_lock_irqsave() in interruptible context on guc submission
- Fixes on DDI and TRANS programming
- Make sure all planes in use by the joiner have their crtc included
- Fix 128b/132b modeset issues

msm:
- More catalog fixes:
- to skip watchdog programming through top block if its not present
- fix the setting of WB mask to ensure the WB input control is programmed
  correctly through ping-pong
- drop lm_pair for sm6150 as that chipset does not have any 3dmerge block
- Fix the mode validation logic for DP/eDP to account for widebus (2ppc)
  to allow high clock resolutions
- Fix to disable dither during encoder disable as otherwise this was
  causing kms_writeback failure due to resource sharing between
  WB and DSI paths as DSI uses dither but WB does not
- Fixes for virtual planes, namely to drop extraneous return and fix
  uninitialized variables
- Fix to avoid spill-over of DSC encoder block bits when programming
  the bits-per-component
- Fixes in the DSI PHY to protect against concurrent access of
  PHY_CMN_CLK_CFG regs between clock and display drivers
- Core/GPU:
- Fix non-blocking fence wait incorrectly rounding up to 1 jiffy timeout
- Only print GMU fw version once, instead of each time the GPU resumes
The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319=
:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-22

for you to fetch changes up to 9a1cd7d6df5d708ef244f93715855c8e54d79448:

  Merge tag 'drm-msm-fixes-2025-02-20' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-02-21
10:50:29 +1000)

----------------------------------------------------------------
drm fixes for v6.14-rc4

core:
- remove MAINTAINERS entry

cgroup/dmem:
- use correct function for pool descendants

panel:
- fix signal polarity issue jd9365da-h3

nouveau:
- folio handling fix
- config fix

amdxdna:
- fix missing header

xe:
- Fix error handling in xe_irq_install
- Fix devcoredump format

i915:
- Use spin_lock_irqsave() in interruptible context on guc submission
- Fixes on DDI and TRANS programming
- Make sure all planes in use by the joiner have their crtc included
- Fix 128b/132b modeset issues

msm:
- More catalog fixes:
- to skip watchdog programming through top block if its not present
- fix the setting of WB mask to ensure the WB input control is programmed
  correctly through ping-pong
- drop lm_pair for sm6150 as that chipset does not have any 3dmerge block
- Fix the mode validation logic for DP/eDP to account for widebus (2ppc)
  to allow high clock resolutions
- Fix to disable dither during encoder disable as otherwise this was
  causing kms_writeback failure due to resource sharing between
  WB and DSI paths as DSI uses dither but WB does not
- Fixes for virtual planes, namely to drop extraneous return and fix
  uninitialized variables
- Fix to avoid spill-over of DSC encoder block bits when programming
  the bits-per-component
- Fixes in the DSI PHY to protect against concurrent access of
  PHY_CMN_CLK_CFG regs between clock and display drivers
- Core/GPU:
- Fix non-blocking fence wait incorrectly rounding up to 1 jiffy timeout
- Only print GMU fw version once, instead of each time the GPU resumes

----------------------------------------------------------------
Aaron Kling (1):
      drm/nouveau/pmu: Fix gp10b firmware guard

Abhinav Kumar (1):
      drm/msm/dp: account for widebus and yuv420 during mode validation

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2025-02-20' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-02-20' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-02-20' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-msm-fixes-2025-02-20' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

David Hildenbrand (1):
      nouveau/svm: fix missing folio unlock + put after
make_device_exclusive_range()

Dmitry Baryshkov (3):
      drm/msm/dpu: skip watchdog timer programming through TOP on >=3D SM84=
50
      drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
      drm/msm/dpu: correct LM pairing for SM6150

Ethan Carter Edwards (1):
      drm/msm/dpu: Fix uninitialized variable

Friedrich Vock (1):
      cgroup/dmem: Don't open-code css_for_each_descendant_pre

Hugo Villeneuve (1):
      drm: panel: jd9365da-h3: fix reset signal polarity

Imre Deak (4):
      drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
      drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
      drm/i915/dp: Fix error handling during 128b/132b link training
      drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode

Jessica Zhang (2):
      drm/msm/dpu: Disable dither in phys encoder cleanup
      drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()

Jos=C3=A9 Roberto de Souza (1):
      drm/xe: Make GUC binaries dump consistent with other binaries in
devcoredump

Karol Herbst (1):
      MAINTAINERS: Remove myself

Konrad Dybcio (1):
      drm/msm/a6xx: Only print the GMU firmware version once

Krzysztof Karas (1):
      drm/i915/gt: Use spin_lock_irqsave() in interruptible context

Krzysztof Kozlowski (3):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing
bitclk source

Lucas De Marchi (2):
      drm/xe: Fix error handling in xe_irq_install()
      drm/xe/guc: Fix size_t print format

Marijn Suijten (1):
      drm/msm/dpu: Don't leak bits_per_component into random DSC_ENC fields

Rob Clark (1):
      drm/msm: Avoid rounding up to one jiffy

Su Hui (1):
      accel/amdxdna: Add missing include linux/slab.h

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Make sure all planes in use by the joiner have their
crtc included

 MAINTAINERS                                        |  2 -
 drivers/accel/amdxdna/amdxdna_mailbox.c            |  1 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |  4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  8 ++--
 drivers/gpu/drm/i915/display/intel_display.c       | 18 ++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 15 +++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  8 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  2 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  7 ++-
 drivers/gpu/drm/msm/dp/dp_display.c                | 11 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 53 +++++++++++++++---=
----
 drivers/gpu/drm/msm/msm_drv.h                      | 11 ++---
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 11 ++++-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |  9 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |  2 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  8 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  6 ++-
 drivers/gpu/drm/xe/xe_guc_log.c                    |  3 +-
 drivers/gpu/drm/xe/xe_irq.c                        | 14 +-----
 kernel/cgroup/dmem.c                               | 50 +++++-------------=
--
 30 files changed, 146 insertions(+), 124 deletions(-)
