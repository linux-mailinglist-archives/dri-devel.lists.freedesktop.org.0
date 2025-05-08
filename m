Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39DAAF442
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 09:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9B010E8C7;
	Thu,  8 May 2025 07:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4g1z6OU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D537E10E8C7;
 Thu,  8 May 2025 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746687927; x=1778223927;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=RqT3kW2wMOPrxLlHpKlZGoVGCDP+V7/YwOR2zY+0aGc=;
 b=W4g1z6OUGVFGHV0jkmbdv0H2MZgRXhn1AlN1nYpQslfx49c/MchibCdA
 WGmQo2WJlGllK0wp0oq6grbnuBvE7VtRZjv7pM/DRiEu508dapsnChHrR
 EPGH0wA5LpA2oYXU0tI6WAu3nP45ZGWdNgGt3LyDYpBpuwc4NdaIyK3qz
 yYnPbpnZdVmCXJbKYaqnd6icb5JxelDC/sEkvDWyl8m/iA2JzrnSa4T4b
 THwIe5g2PzqrhmpIlpou00/bCi3Pq4naCcMlvwS1ISGZ8GeO1pQSwFS1r
 uaLkAj+OAxyXYayMLPN0l2hEnufKfpyC1HhyoClBSdaY5ReiDjorbbyCz Q==;
X-CSE-ConnectionGUID: Lg0bY1yoTg2mx6Ww2YP2dg==
X-CSE-MsgGUID: 1uuI+KiiTWa+Lqv4fv1s3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48539058"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48539058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 00:05:26 -0700
X-CSE-ConnectionGUID: 50AKNdfcS4yLnRfHcrGySQ==
X-CSE-MsgGUID: xHbiHxnAT0mhJdaLfbKSVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="140965806"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 00:05:23 -0700
Message-ID: <5428be12-fc08-4e28-8c5f-85d73b8a7e04@linux.intel.com>
Date: Thu, 8 May 2025 09:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

A final pull request for drm-misc-next. It's been mostly fixes, adding some panels, and not much new features,
so I feel sending a final drm-misc-next PR is a good idea before switching to drm-misc-next-fixes,
especially since the previous one landed a bit early.

Cheers,
~Maarten

drm-misc-next-2025-05-08:
drm-misc-next for v6.16-rc1:

Cross-subsystem Changes:
- Change vsprintf %p4cn to %p4chR, remove %p4cn.

Core Changes:
- Documentation updates (fb rendering, actual_brightness)

Driver Changes:
- Small fixes to appletbdrm, panthor, st7571-i2c, rockchip, renesas,
  panic handler, gpusvm, vkms, panel timings.
- Add AUO B140QAN08.H, BOE NE140WUM-N6S, CSW MNE007QS3-8, BOE TD4320 panels.
- Convert rk3066_hdmi to bridge driver.
- Improve HPD on anx7625.
- Speed up loading tegra firmware, and other small fixes to tegra & host1x.

The following changes since commit 5e0c67998152bdb91b056160449ee542b86271a5:

  BackMerge tag 'v6.15-rc5' into drm-next (2025-05-06 16:39:25 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-05-08

for you to fetch changes up to 78184f6e3db16c05ad5933b411faa416bb68ac1e:

  gpu: host1x: Use for_each_available_child_of_node_scoped() (2025-05-07 18:09:30 +0200)

----------------------------------------------------------------
drm-misc-next for v6.16-rc1:

Cross-subsystem Changes:
- Change vsprintf %p4cn to %p4chR, remove %p4cn.

Core Changes:
- Documentation updates (fb rendering, actual_brightness)

Driver Changes:
- Small fixes to appletbdrm, panthor, st7571-i2c, rockchip, renesas,
  panic handler, gpusvm, vkms, panel timings.
- Add AUO B140QAN08.H, BOE NE140WUM-N6S, CSW MNE007QS3-8, BOE TD4320 panels.
- Convert rk3066_hdmi to bridge driver.
- Improve HPD on anx7625.
- Speed up loading tegra firmware, and other small fixes to tegra & host1x.

----------------------------------------------------------------
Aditya Garg (2):
      drm/appletbdrm: Make appletbdrm depend on X86
      checkpatch: remove %p4cn

Adrián Larumbe (1):
      drm/panthor: Fix build warning when DEBUG_FS is disabled

Andy Yan (5):
      drm/rockchip: rk3066_hdmi: switch to drm bridge
      dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036 compatible
      dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
      drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
      drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting for rk3036

Arnd Bergmann (1):
      drm/rockchip: add CONFIG_OF dependency

Ayushi Makhija (4):
      drm/bridge: anx7625: enable HPD interrupts
      drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
      drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
      drm/bridge: anx7625: change the gpiod_set_value API

Barnabás Czémán (2):
      dt-bindings: display: panel: Add BOE TD4320
      drivers: gpu: drm: panel: Add BOE TD4320

Biju Das (2):
      drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
      drm/tegra: rgb: Fix the unbound reference count

Dafna Hirschfeld (1):
      drm/gpusvm: remove unused pages pointer

Dan Carpenter (1):
      drm/st7571-i2c: Fix IS_ERR() vs NULL checks in probe()

Heiko Stuebner (2):
      dt-bindings: display: ltk050h3146w: add port property
      dt-bindings: display: ltk500hd1829: add port property

Jiapeng Chong (1):
      drm: Remove unused function rcar_cmm_write

Jinjie Ruan (1):
      gpu: host1x: Use for_each_available_child_of_node_scoped()

Jocelyn Falempe (1):
      drm/panic: Use a decimal fifo to avoid u64 by u64 divide

Jon Hunter (1):
      drm/tegra: Remove unneeded include

Kees Cook (1):
      drm/vkms: Adjust vkms_state->active_planes allocation type

Kevin Baker (1):
      drm/panel: simple: Update timings for AUO G101EVN010

Mario Limonciello (1):
      docs: backlight: Clarify `actual_brightness`

Mikko Perttunen (2):
      drm/tegra: falcon: Pipeline firmware copy
      gpu: host1x: Remove mid-job CDMA flushes

Pekka Paalanen (1):
      drm/doc: document front-buffer rendering

Petr Mladek (1):
      vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering

Qiu-ji Chen (1):
      drm/tegra: Fix a possible null pointer dereference

Thierry Reding (1):
      drm/tegra: Assign plane type before registration

Thomas Zimmermann (1):
      Merge drm/drm-next into drm-misc-next

Zhang Enpei (1):
      drm/tegra: dpaux: Use dev_err_probe()

Zhengqiao Xia (3):
      drm/panel-edp: Add support for AUO B140QAN08.H panel
      drm/panel-edp: Add support for BOE NE140WUM-N6S panel
      drm/panel-edp: Add support for CSW MNE007QS3-8 panel

 Documentation/ABI/stable/sysfs-class-backlight     |   7 +-
 Documentation/core-api/printk-formats.rst          |  10 +-
 .../bindings/display/panel/boe,td4320.yaml         |  65 +++++
 .../display/panel/leadtek,ltk050h3146w.yaml        |   1 +
 .../display/panel/leadtek,ltk500hd1829.yaml        |   1 +
 .../display/rockchip/rockchip,inno-hdmi.yaml       |  20 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  34 ++-
 drivers/gpu/drm/drm_blend.c                        |   6 +
 drivers/gpu/drm/drm_gpusvm.c                       |   4 -
 drivers/gpu/drm/drm_panic_qr.rs                    |  71 +++--
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-td4320.c           | 247 ++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c                  |  10 +
 drivers/gpu/drm/panel/panel-simple.c               |  25 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   5 +
 drivers/gpu/drm/panthor/panthor_gem.h              |   8 -
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c         |   5 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |  10 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  55 +++-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 315 ++++++++++-----------
 drivers/gpu/drm/tegra/dc.c                         |  17 +-
 drivers/gpu/drm/tegra/dpaux.c                      |  11 +-
 drivers/gpu/drm/tegra/falcon.c                     |  20 +-
 drivers/gpu/drm/tegra/falcon.h                     |   1 +
 drivers/gpu/drm/tegra/gem.c                        |   1 -
 drivers/gpu/drm/tegra/hub.c                        |   4 +-
 drivers/gpu/drm/tegra/hub.h                        |   3 +-
 drivers/gpu/drm/tegra/rgb.c                        |  14 +-
 drivers/gpu/drm/tiny/Kconfig                       |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  |  10 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   2 +-
 drivers/gpu/host1x/bus.c                           |  11 +-
 drivers/gpu/host1x/cdma.c                          |   7 +-
 lib/tests/printf_kunit.c                           |   4 +-
 lib/vsprintf.c                                     |  11 +-
 scripts/checkpatch.pl                              |   2 +-
 38 files changed, 717 insertions(+), 312 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-td4320.c
