Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36562A2CCA4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 20:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E1110E298;
	Fri,  7 Feb 2025 19:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PFwFrVO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D34510EBBA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 19:34:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so392699766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 11:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738956861; x=1739561661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QeS+9WJZSrbWBbt9QXqilVKlrmtig3rOwP+M3p8OKjY=;
 b=PFwFrVO4kdFMsh/THnSk2HGe5NoBfRjixmnkXWIfpuodN6AugTRDddb0OpfKp/tyvp
 6SHPbdb7UkTxk8EQaI2AiDmEdnr5CUpcFOaoCYapP4ithfp8saGXR4ViE7am5b7elRVL
 qFi0bCSlJv7fRePfRouc3uOZGI7DJDa9J1hqdvxFFJBI+22DrJ3fJrdpZATxXzmkHq5O
 EPrdmMcHIe4H/H/pJltJsi9aCPS72xX9sdL+3IvWLIdWr+je1ZWDn5JjqKr/TeSgIT6R
 n2J9VY7FuerEWOhwBismI7h/4h6YmJ5xuFkyr6qlWCN3jBgiUWkeL46wpbpOtu+25NzG
 tCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738956861; x=1739561661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QeS+9WJZSrbWBbt9QXqilVKlrmtig3rOwP+M3p8OKjY=;
 b=TUoezosWDTkYuxb3jZzE3pmsO9mx4pqCnYhKXswlgPq1g1nOMHzzyOz5pQMsEgalQt
 lf4+gd+kLSCHJBZY9ifXXPW1ggkzMFqH/YCMrMI5LXBv65zDzLH/KyZ0LHLugsgVZ5Jc
 OB70NPbr959J6dwWOqZ0Veai+v/dY42477RrqhT2RsSom6I1dyBOI2/RRzlGPPv7818r
 RPEHOHvkqltJ7barKviEVsHVHfqi9otxgLwJci3FWYr9UfBREfUgzOVBcw+XnchiOFU2
 RRL5FBtw8Ssq3eAVU715FmndSqqEHpqQQZRQ754GPbyNiyGUEMOv2+yUZkwuCeRMbAb+
 0HPw==
X-Gm-Message-State: AOJu0YzGRCh0qCfhW6J65cqZzWEkePdL56cHxs3f0IQqc69tFXREb7o3
 ahbIXDLcDju5iJQhPMB8rs7zAvF6fM4Jgt9DNLpSwFd7r991N0QW+8H0sFItNwlebCF0NTDTCPB
 0yZkMwkn1Ib2wV7LhQNkjZdSAZsc=
X-Gm-Gg: ASbGncsAkYLN3FHaxmFV2CZnFzdyKiV0+r/Ru5vaBFpfAtgR87mw1N/HA73WrPxXytN
 KgSVbN0AnFP7oRPIDX48llhzIrgEWKt7jKiuxfJP3V2cF/DN3sOzYIbca4wiFn0/AiBxDVOI=
X-Google-Smtp-Source: AGHT+IHOafKpeSEFMi0xRXSjrssnAbCXR+GlLwmssgfpW18MN+M5umsybRvBSIYlTs7ddaoC+meuaxrwWnM28m76Dts=
X-Received: by 2002:a17:907:d01:b0:ab6:d59b:614d with SMTP id
 a640c23a62f3a-ab789b395a1mr546964166b.23.1738956860591; Fri, 07 Feb 2025
 11:34:20 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 8 Feb 2025 05:34:09 +1000
X-Gm-Features: AWEUYZktsJBYh64lbHz693fyJWH_GLSBO6Q6rkjM4bUaxPMm5LI4MI-U1mOSzjE
Message-ID: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc2
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

Just regular drm fixes, amdgpu, xe and i915 mostly, but a few
scattered fixes. I think one of the i915 fixes fixes some build combos
that Guenter was seeing.

Thanks,
Dave.

drm-fixes-2025-02-08:
drm fixes for 6.14-rc2

amdgpu:
- Add new tiling flag for DCC write compress disable
- Add BO metadata flag for DCC
- Fix potential out of bounds access in display
- Seamless boot fix
- CONFIG_FRAME_WARN fix
- PSR1 fix

xe:
- OA uAPI related fixes
- Fix SRIOV migration initialization
- Restore devcoredump to a sane state

i915:
- Fix the build error with clamp after WARN_ON on gcc 13.x+
- HDCP related fixes
- PMU fix zero delta busyness issue
- Fix page cleanup on DMA remap failure
- Drop 64bpp YUV formats from ICL+ SDR planes
- GuC log related fix
- DisplayPort related fixes

ivpu:
- Fix error handling

komeda:
- add return check

zynqmp:
- fix locking in DP code

ast:
- fix AST DP timeout

cec:
- fix broken CEC adapter check
The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b=
:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-08

for you to fetch changes up to 4f6993b3feab7bfb1869a8fa12eb8b375964c19f:

  Merge tag 'drm-intel-fixes-2025-02-06' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
(2025-02-07 15:42:21 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc2

amdgpu:
- Add new tiling flag for DCC write compress disable
- Add BO metadata flag for DCC
- Fix potential out of bounds access in display
- Seamless boot fix
- CONFIG_FRAME_WARN fix
- PSR1 fix

xe:
- OA uAPI related fixes
- Fix SRIOV migration initialization
- Restore devcoredump to a sane state

i915:
- Fix the build error with clamp after WARN_ON on gcc 13.x+
- HDCP related fixes
- PMU fix zero delta busyness issue
- Fix page cleanup on DMA remap failure
- Drop 64bpp YUV formats from ICL+ SDR planes
- GuC log related fix
- DisplayPort related fixes

ivpu:
- Fix error handling

komeda:
- add return check

zynqmp:
- fix locking in DP code

ast:
- fix AST DP timeout

cec:
- fix broken CEC adapter check

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Fix out-of-bound accesses

Ankit Nautiyal (2):
      drm/i915/dp: fix the Adaptive sync Operation mode for SDP
      drm/i915/dp: Return min bpc supported by source instead of 0

Ashutosh Dixit (2):
      drm/xe/oa: Preserve oa_ctrl unused bits
      drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked

Brian Geffon (1):
      drm/i915: Fix page cleanup on DMA remap failure

Daniele Ceraolo Spurio (1):
      drm/i915/guc: Debug print LRC state entries only if the context is pi=
nned

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.14-2025-02-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-02-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-02-06' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-02-06' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

Guenter Roeck (1):
      drm/i915/backlight: Return immediately when scale() finds
invalid parameters

Gustavo Sousa (1):
      drm/print: Include drm_device.h

Hans Verkuil (1):
      gpu: drm_dp_cec: fix broken CEC adapter properties check

Haoxiang Li (1):
      drm/komeda: Add check for komeda_get_layer_fourcc_list()

Jacek Lawrynowicz (3):
      accel/ivpu: Fix error handling in ivpu_boot()
      accel/ivpu: Clear runtime_error after pm_runtime_resume_and_get() fai=
ls
      accel/ivpu: Fix error handling in recovery/reset

Jani Nikula (2):
      drm/i915/dp: Iterate DSC BPP from high to low on all platforms
      drm/i915/dp: Fix potential infinite loop in 128b/132b SST

Lo-an Chen (1):
      drm/amd/display: Fix seamless boot sequence

Lucas De Marchi (2):
      drm/xe/devcoredump: Move exec queue snapshot to Contexts section
      drm/xe: Fix and re-enable xe_print_blob_ascii85()

Marek Ol=C5=A1=C3=A1k (1):
      drm/amdgpu: add a BO metadata flag to disable write compression for V=
ulkan

Mario Limonciello (1):
      accel/amdxdna: Add MODULE_FIRMWARE() declarations

Maxime Ripard (1):
      Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into
drm-misc-fixes

Michal Wajdeczko (1):
      drm/xe/pf: Fix migration initialization

Nathan Chancellor (1):
      drm/amd/display: Respect user's CONFIG_FRAME_WARN more for dml files

Suraj Kandpal (2):
      drm/i915/hdcp: Fix Repeater authentication during topology change
      drm/i915/hdcp: Use correct function to check if encoder is HDMI

Thomas Zimmermann (1):
      drm/ast: astdp: Fix timeout for enabling video signal

Tom Chung (1):
      Revert "drm/amd/display: Use HW lock mgr for PSR1"

Umesh Nerlige Ramappa (1):
      drm/i915/pmu: Fix zero delta busyness issue

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes

 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  5 ++
 drivers/accel/ivpu/ivpu_drv.c                      |  8 ++-
 drivers/accel/ivpu/ivpu_pm.c                       | 84 ++++++++++++------=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  8 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  5 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        | 14 ++--
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       | 22 +++---
 .../dc/dml2/dml21/dml21_translation_helper.c       |  4 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  6 +-
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |  3 +-
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |  3 +-
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |  3 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |  3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |  2 +
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |  2 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  3 +-
 .../drm/arm/display/komeda/komeda_wb_connector.c   |  4 ++
 drivers/gpu/drm/ast/ast_dp.c                       |  2 +-
 drivers/gpu/drm/display/drm_dp_cec.c               | 14 +---
 drivers/gpu/drm/i915/display/intel_backlight.c     |  5 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 12 ++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  4 ++
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 15 +++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 --
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 36 ++++++++--
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |  6 ++
 drivers/gpu/drm/xe/xe_devcoredump.c                | 42 ++++-------
 drivers/gpu/drm/xe/xe_devcoredump.h                |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                         |  4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                | 14 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |  6 ++
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  3 +-
 drivers/gpu/drm/xe/xe_guc_log.c                    |  4 +-
 drivers/gpu/drm/xe/xe_oa.c                         | 21 +++---
 include/drm/drm_print.h                            |  1 +
 include/uapi/drm/amdgpu_drm.h                      |  9 ++-
 41 files changed, 250 insertions(+), 149 deletions(-)
