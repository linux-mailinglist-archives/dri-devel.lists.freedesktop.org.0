Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7597BB358
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE6E10E4CA;
	Fri,  6 Oct 2023 08:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE79910E4CA;
 Fri,  6 Oct 2023 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696581467; x=1728117467;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=s4mfXA5Mm8tVk2Yv+B1aUlpArlGzdcWw9CEnhAW82gk=;
 b=efiLyAdt9DqY1pQzoemgzscAuST3WNdED1ZDwtSOZSadQutGb5lZQRZP
 Zv3GMDnDVObcxHCU1sR2guxeNvBKts6/MmVFBK6U+yWFbD9T1vJ7I9ZK+
 AFuwK49RytZN04qMuvNCZuHPu2WQt4t49L9Jpj7e9I11SV1foRX0kA2Cz
 VZySmY8U+Be3t2ENEpec+1datdW5t3WwBmI9Jdi06ooy1izMDyEcrxn7G
 LsLBjqj0eW119Cd+ib17TFQ4+ev7EXfG1gvy98sjLSVEeWr9UmzYDLkdv
 /wXKs17c5qxTlGlN6CSX/Ey/uHUk05R3ra/dn+61zNxKow3KbNcEXYkaq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383596057"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383596057"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745776407"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745776407"
Received: from sfriis-mobl.ger.corp.intel.com (HELO [10.252.57.149])
 ([10.252.57.149])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:37:43 -0700
Message-ID: <583bec13-28db-973e-e97b-319aed400732@linux.intel.com>
Date: Fri, 6 Oct 2023 10:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2023-10-06:
drm-misc-next for v6.7:

Cross-subsystem Changes:
- drm-misc now matches all drivers to ensure it goes to the correct
   tree.
- Clarify NXP i.MX 8MQ DCSS goes through drm-misc tree in MAINTAINERS.

Core Changes:
- Assorted small fixes in gpuvm, bridge.
- Improve format conversion tests.
- Document DRM device reset expectations.
- Warn when vblank worker is cancelled.
- Allow more accurate reporting of RSS and use it in panfrost.
- Use struct drm_edid in drm_dp_downstream helpers.

Driver Changes:
- Assorted small fixes in gma500, ivpu, nouveau, bridge/lt9611uxc,
   amdgpu, exynos/dsi.
- Convert quite a few drm/bridge drivers to use maple tree register
   cache.
- Add BOE RM692E5 AMOLED, Anbernic 351V panels.
- Add fdinfo support for panfrost memor ystat and gpu load metrics,
   including some documentation updates.
- Update drivers variable sized ararys by using __counted_by.
-
The following changes since commit 78f54469b871db5ba8ea49abd4e5994e97bd525b:

   drm/nouveau: uvmm: rename 'umgr' to 'base' (2023-09-26 01:58:29 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-10-06

for you to fetch changes up to c1698c73f4aaef2fd406da1c0a92e1c8f7b7780c:

   drm: exynos: dsi: Convert to platform remove callback returning void 
(2023-10-06 08:58:44 +0200)

----------------------------------------------------------------
drm-misc-next for v6.7:

Cross-subsystem Changes:
- drm-misc now matches all drivers to ensure it goes to the correct
   tree.
- Clarify NXP i.MX 8MQ DCSS goes through drm-misc tree in MAINTAINERS.

Core Changes:
- Assorted small fixes in gpuvm, bridge.
- Improve format conversion tests.
- Document DRM device reset expectations.
- Warn when vblank worker is cancelled.
- Allow more accurate reporting of RSS and use it in panfrost.
- Use struct drm_edid in drm_dp_downstream helpers.

Driver Changes:
- Assorted small fixes in gma500, ivpu, nouveau, bridge/lt9611uxc,
   amdgpu, exynos/dsi.
- Convert quite a few drm/bridge drivers to use maple tree register
   cache.
- Add BOE RM692E5 AMOLED, Anbernic 351V panels.
- Add fdinfo support for panfrost memor ystat and gpu load metrics,
   including some documentation updates.
- Update drivers variable sized ararys by using __counted_by.
-

----------------------------------------------------------------
Adrián Larumbe (5):
       drm/panfrost: Add cycle count GPU register definitions
       drm/panfrost: Add fdinfo support GPU load metrics
       drm/panfrost: Add fdinfo support for memory stats
       drm/drm_file: Add DRM obj's RSS reporting function for fdinfo
       drm/panfrost: Implement generic DRM object RSS reporting function

André Almeida (1):
       drm/doc: Document DRM device reset expectations

Arnd Bergmann (1):
       drm/nouveau/kms/nv50: hide unused variables

Arthur Grillo (2):
       drm/tests: Add calls to drm_fb_blit() on supported format 
conversion tests
       drm/tests: Add new format conversion tests to better cover 
drm_fb_blit()

Chris Morgan (2):
       dt-bindings: display: newvision,nv3051d: Add Anbernic 351V
       drm/panel: nv3051d: Add Support for Anbernic 351V

Danilo Krummrich (1):
       drm/gpuvm: doc: fix filename references

Douglas Anderson (1):
       MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver goes thru 
drm-misc

Jani Nikula (3):
       drm/bridge: use drm_bridge_get_edid() instead of using ->get_edid 
directly
       drm/bridge: lt9611uxc: use drm_bridge_get_edid() instead of using 
->get_edid directly
       drm/dp: switch drm_dp_downstream_*() helpers to struct drm_edid

Justin Stitt (1):
       drm/gma500: refactor deprecated strncpy

Kees Cook (9):
       drm/amd/pm: Annotate struct smu10_voltage_dependency_table with 
__counted_by
       drm/amdgpu/discovery: Annotate struct ip_hw_instance with 
__counted_by
       drm/i915/selftests: Annotate struct perf_series with __counted_by
       drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
       drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
       drm/vc4: Annotate struct vc4_perfmon with __counted_by
       drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
       drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
       drm/v3d: Annotate struct v3d_perfmon with __counted_by

Konrad Dybcio (2):
       dt-bindings: display: panel: Add Raydium RM692E5
       drm/panel: Add driver for BOE RM692E5 AMOLED panel

Mark Brown (8):
       drm/bridge: adv7511: Convert to use maple tree register cache
       drm/bridge: dpc3433: Convert to use maple tree register cache
       drm/bridge: tc358767: Convert to use maple tree register cache
       drm/bridge: icn6211: Convert to use maple tree register cache
       drm/bridge: lt9211: Convert to use maple tree register cache
       drm/bridge: sn65dsi83: Convert to use maple tree register cache
       drm/panel: ili9322: Remove redundant volatle_reg() operation
       drm/panel: ili9322: Convert to use maple tree register cache

Maxime Ripard (1):
       MAINTAINERS: Update drm-misc entry to match all drivers

Stanislaw Gruszka (2):
       accel/ivpu: Update debugfs to latest changes in DRM
       accel/ivpu: Compile ivpu_debugfs.c conditionally

Uwe Kleine-König (1):
       drm: exynos: dsi: Convert to platform remove callback returning void

Ville Syrjälä (1):
       drm/vblank: Warn when silently cancelling vblank works

Wayne Lin (1):
       drm/amd/display: Fix mst hub unplug warning

  .../bindings/display/panel/newvision,nv3051d.yaml  |   5 +-
  .../bindings/display/panel/raydium,rm692e5.yaml    |  73 ++++
  Documentation/gpu/drm-mm.rst                       |  20 +-
  Documentation/gpu/drm-uapi.rst                     |  77 ++++
  Documentation/gpu/drm-usage-stats.rst              |   1 +
  Documentation/gpu/panfrost.rst                     |  40 ++
  MAINTAINERS                                        |  22 +-
  drivers/accel/ivpu/Makefile                        |   3 +-
  drivers/accel/ivpu/ivpu_debugfs.c                  |  50 +--
  drivers/accel/ivpu/ivpu_debugfs.h                  |   8 +-
  drivers/accel/ivpu/ivpu_drv.c                      |   6 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +-
  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  38 +-
  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |   2 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   4 +-
  drivers/gpu/drm/bridge/chipone-icn6211.c           |   2 +-
  drivers/gpu/drm/bridge/lontium-lt9211.c            |   2 +-
  drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   2 +-
  drivers/gpu/drm/bridge/samsung-dsim.c              |   6 +-
  drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
  drivers/gpu/drm/bridge/ti-dlpc3433.c               |   2 +-
  drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   2 +-
  drivers/gpu/drm/display/drm_dp_helper.c            |  39 +-
  drivers/gpu/drm/drm_bridge_connector.c             |   2 +-
  drivers/gpu/drm/drm_file.c                         |   8 +-
  drivers/gpu/drm/drm_vblank_work.c                  |   3 +
  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   2 +-
  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |   2 +-
  .../gpu/drm/i915/display/intel_display_debugfs.c   |   3 +-
  drivers/gpu/drm/i915/display/intel_dp.c            |  10 +-
  drivers/gpu/drm/i915/selftests/i915_request.c      |   2 +-
  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            |   4 +-
  drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h      |   2 +-
  drivers/gpu/drm/panel/Kconfig                      |   9 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   8 +-
  drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   7 +
  drivers/gpu/drm/panel/panel-raydium-rm692e5.c      | 423 
+++++++++++++++++++++
  drivers/gpu/drm/panfrost/Makefile                  |   2 +
  drivers/gpu/drm/panfrost/panfrost_debugfs.c        |  21 +
  drivers/gpu/drm/panfrost/panfrost_debugfs.h        |  14 +
  drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   8 +
  drivers/gpu/drm/panfrost/panfrost_devfreq.h        |   3 +
  drivers/gpu/drm/panfrost/panfrost_device.c         |   2 +
  drivers/gpu/drm/panfrost/panfrost_device.h         |  13 +
  drivers/gpu/drm/panfrost/panfrost_drv.c            |  60 ++-
  drivers/gpu/drm/panfrost/panfrost_gem.c            |  30 ++
  drivers/gpu/drm/panfrost/panfrost_gem.h            |   5 +
  drivers/gpu/drm/panfrost/panfrost_gpu.c            |  41 ++
  drivers/gpu/drm/panfrost/panfrost_gpu.h            |   4 +
  drivers/gpu/drm/panfrost/panfrost_job.c            |  24 ++
  drivers/gpu/drm/panfrost/panfrost_job.h            |   5 +
  drivers/gpu/drm/panfrost/panfrost_mmu.c            |   1 +
  drivers/gpu/drm/panfrost/panfrost_regs.h           |   5 +
  drivers/gpu/drm/tests/drm_format_helper_test.c     | 284 ++++++++++++++
  drivers/gpu/drm/v3d/v3d_drv.h                      |   2 +-
  drivers/gpu/drm/vc4/vc4_drv.h                      |   2 +-
  drivers/gpu/drm/virtio/virtgpu_drv.h               |   2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   2 +-
  include/drm/bridge/samsung-dsim.h                  |   2 +-
  include/drm/display/drm_dp_helper.h                |  12 +-
  include/drm/drm_gem.h                              |   9 +
  63 files changed, 1309 insertions(+), 140 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
  create mode 100644 Documentation/gpu/panfrost.rst
  create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm692e5.c
  create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
  create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
