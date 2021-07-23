Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A413D321B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 05:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB2E6EB83;
	Fri, 23 Jul 2021 03:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16FF6EB83
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 03:07:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id nb11so1624360ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=UxjupQIYnhw3x6Nf6m3L7R/kGA8zbH/BEWMqX4Kgoxs=;
 b=EopHv/IRB2T/2/3LOit8nS9yOnKYoCR2chdTo9U93gGRBre4rgYZjpSJi0d1GYV4WJ
 yBIptkVtaQFffC1TNcKuyzKB+cdnjBVWEibi1NzGYGeZToeaTI+XOSE9zI3T8rbg5uKc
 t5uUxjqlOCrwh7HlN4x8W1l7dRvuJ6LpzPywhge8Lgln2PVeoDYygg+J578wlwmImQ8i
 CjyN2lVq9dq2x9nx9cwS2c7vIzs4L+Rz/73QSyndj3MUPFgpFjKFjQWZa7BcV6Lqbh37
 CVcd8+grFuWY4vmbqAxVIBuzj844moOWHhiexcmQswKyGR70Zp4QTWO0Koty96etxWpA
 RPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=UxjupQIYnhw3x6Nf6m3L7R/kGA8zbH/BEWMqX4Kgoxs=;
 b=tWOmtO2RZxhHdwjiX+lf8zK3VYuw6RHKwAuFb0Pmr6Crzm61K/WNnXqxcNL5+Ihwcy
 7n0pzOnnk/8kywF0NHSSmikI8BhxRIQtL3CAClOE6yc6HXWjKztVPEQusomDqDlzKhhH
 JhlayHmaBk2f02/vj2EOtr0bAixbVIK+8ieOBY4xhQcFvTmsX06Qmi6xPJO12Nqw/rw5
 lXo7s9+A51AO1L7nldLmdlfx8P63eQ0gFWkJJyl7m187A3wU+LQ4N8uKgo0du0dLXN6P
 woDKB2lvJw6IRo2fDmbvhLTB7oP3tuG6UHIDmmcG5otQNE9vPI38PgQNmHSCjsRT1qHe
 yG3Q==
X-Gm-Message-State: AOAM530PjyjoAafIfnjVqMLN7eNqUIvKUkieJF1VTI/W9chPLfsKkuwi
 BAbB790HatN60xzuaL719ufAB+AxK1LyC/jDwjo=
X-Google-Smtp-Source: ABdhPJwcjfHqga7N278w3EELfCjufIQVJ2cOoU1BiDkjzuAeiW7sWE4+3A6wq9rFAfsqsrEsEfJ3tTQSv2z7WSDbtJQ=
X-Received: by 2002:a17:906:7c6:: with SMTP id
 m6mr2739874ejc.456.1627009646301; 
 Thu, 22 Jul 2021 20:07:26 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Jul 2021 13:07:14 +1000
Message-ID: <CAPM=9ty45KQnKE_02R3jE5fJMhz26T9zU6LgDV92WUTd=0U1FA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular fixes pull request, a bunch of amdgpu fixes are the main thing
mostly for the new gpus. There is also some i915 reverts for older
changes that were having some unwanted side effects. One nouveau fix
for a report regressions, and otherwise just some misc fixes.

Dave.

drm-fixes-2021-07-23:
drm fixes for 5.14-rc3

core:
- fix for non-drm ioctls on drm fd

panel:
- avoid double free

ttm:
- refcounting fix
- NULL checks

amdgpu:
- Yellow Carp updates
- Add some Yellow Carp DIDs
- Beige Goby updates
- CIK 10bit 4K regression fix
- GFX10 golden settings updates
- eDP panel regression fix
- Misc display fixes
- Aldebaran fix
- fix COW checks

nouveau:
- init BO GEM fields

i915:
- revert async command parsing
- revert fence error propagation
- GVT fix for shadow ppgtt

vc4:
- fix interrupt handling
The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c=
:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-07-23

for you to fetch changes up to 2e41a6696bf828a7b06f520d147f6911c947a7af:

  Merge tag 'drm-misc-fixes-2021-07-22' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2021-07-23
11:17:03 +1000)

----------------------------------------------------------------
drm fixes for 5.14-rc3

core:
- fix for non-drm ioctls on drm fd

panel:
- avoid double free

ttm:
- refcounting fix
- NULL checks

amdgpu:
- Yellow Carp updates
- Add some Yellow Carp DIDs
- Beige Goby updates
- CIK 10bit 4K regression fix
- GFX10 golden settings updates
- eDP panel regression fix
- Misc display fixes
- Aldebaran fix
- fix COW checks

nouveau:
- init BO GEM fields

i915:
- revert async command parsing
- revert fence error propogation
- GVT fix for shadow ppgtt

vc4:
- fix interrupt handling

----------------------------------------------------------------
Aaron Liu (2):
      drm/amdgpu: update yellow carp external rev_id handling
      drm/amdgpu: add yellow carp pci id (v2)

Bindu Ramamurthy (2):
      drm/amd/display: Populate socclk entries for dcn3.02/3.03
      drm/amd/display: Populate dtbclk entries for dcn3.02/3.03

Camille Cho (1):
      drm/amd/display: Only set default brightness for OLED

Charles Baylis (1):
      drm: Return -ENOTTY for non-drm ioctls

Christian K=C3=B6nig (1):
      drm/nouveau: init the base GEM fields for internal BOs

Colin Xu (1):
      drm/i915/gvt: Clear d3_entered on elsp cmd submission.

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.14-2021-07-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2021-07-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2021-07-22' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Eric Yang (2):
      drm/amd/display: implement workaround for riommu related hang
      drm/amd/display: change zstate allow msg condition

Felix Kuehling (1):
      drm/amdgpu: workaround failed COW checks for Thunk VMAs

Jason Ekstrand (4):
      drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
      Revert "drm/i915: Propagate errors on awaiting already signaled fence=
s"
      drm/ttm: Force re-init if ttm_global_init() fails
      drm/i915: Correct the docs for intel_engine_cmd_parser

Lijo Lazar (1):
      drm/amd/pm: Support board calibration on aldebaran

Likun Gao (1):
      drm/amdgpu: update golden setting for sienna_cichlid

Liviu Dudau (1):
      drm/amd/display: Fix 10bit 4K display on CIK GPUs

Maxime Ripard (2):
      drm/vc4: hdmi: Drop devm interrupt handler for CEC interrupts
      drm/panel: raspberrypi-touchscreen: Prevent double-free

Mikita Lipski (1):
      drm/amd/display: Remove MALL function from DCN3.1

Nevenko Stupar (1):
      drm/amd/display: Line Buffer changes

Nicholas Kazlauskas (3):
      drm/amd/display: Fix max vstartup calculation for modes with borders
      drm/amd/display: Query VCO frequency from register for DCN3.1
      drm/amd/display: Update bounding box for DCN3.1

Pavel Skripkin (1):
      drm/ttm: add missing NULL checks

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2021-07-15' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Stylon Wang (1):
      drm/amd/display: Fix ASSR regression on embedded panels

Tao Zhou (2):
      drm/amdgpu: update gc golden setting for dimgrey_cavefish
      drm/amd/pm: update DRIVER_IF_VERSION for beige_goby

Veerabadhran Gopalakrishnan (3):
      amdgpu/nv.c - Added video codec support for Yellow Carp
      amdgpu/nv.c - Optimize code for video codec support structure
      drm/amdgpu - Corrected the video codecs array name for yellow carp

Victor Lu (1):
      drm/amd/display: Fix comparison error in dcn21 DML

Xiaojian Du (1):
      drm/amdgpu: update the golden setting for vangogh

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   9 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 248 +++++------------=
----
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 176 ++-------------
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   4 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  59 ++++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |  54 -----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  10 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |   7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  50 +++--
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  16 --
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |   3 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |  13 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  18 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   4 +
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |   3 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   1 +
 drivers/gpu/drm/amd/pm/inc/aldebaran_ppsmc.h       |   3 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   3 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  46 +++-
 drivers/gpu/drm/drm_ioctl.c                        |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 227 ++---------------=
--
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |   4 +
 drivers/gpu/drm/i915/gvt/handlers.c                |  15 ++
 drivers/gpu/drm/i915/i915_cmd_parser.c             | 136 +++++------
 drivers/gpu/drm/i915/i915_drv.h                    |   7 +-
 drivers/gpu/drm/i915/i915_request.c                |   8 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   6 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |   3 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   3 +
 drivers/gpu/drm/ttm/ttm_device.c                   |   2 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  49 ++--
 include/drm/drm_ioctl.h                            |   1 +
 44 files changed, 457 insertions(+), 788 deletions(-)
