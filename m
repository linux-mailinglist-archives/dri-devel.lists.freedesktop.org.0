Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19CCFCF3D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D612010E583;
	Wed,  7 Jan 2026 09:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqgartQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFED10E0DC;
 Wed,  7 Jan 2026 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767779108; x=1799315108;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=g34CNZaMIl42jkPXh144x2/ogAY/EtdzkoBasCskQaI=;
 b=QqgartQKf2/frjGixmyZ0tRzCNT0+a/CXicI/pMhq9OgLRT/i1FGNrWF
 YWWbWBcLbE7K5uix25nhNeunnTijU/zWUb/hyHmRGIYBjn4aAwP4ckX2i
 CtGeDIEKgd33SQwM3rZ0WU8S7wAlaOzCbAPbUPrFIPkVd77SNiAICgi/J
 zVWvmObvQTFVPcJgjbAjveFjQL0OsbX3b9A4VT6Ka5rEbEbLskZD/EK8M
 c0pGfQgx6eFiUR+9X5Jwom9nFzxxq1Qy29xalg9jOzm4Xha97tC6uZpoW
 VGsJgtcUWUjO5+m5tIuL7fZsA8MI5keSzH6Nqw8K28W+ClR7TLWuMWxkQ g==;
X-CSE-ConnectionGUID: Ij1HQ8rLSPyx8XJ7tu6W/w==
X-CSE-MsgGUID: V2zrBW+wTXymDZvduikBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68339296"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68339296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:45:07 -0800
X-CSE-ConnectionGUID: d/N1pgI2SYKXs9pwVONoUg==
X-CSE-MsgGUID: OGxF/Ty5TKGABvntQ1bXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207416492"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.135])
 ([10.245.245.135])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:45:03 -0800
Message-ID: <f50067e6-243a-4ed8-9781-1e4e4fdebc8e@linux.intel.com>
Date: Wed, 7 Jan 2026 10:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

First pull request for the new year!

Kind regards,
~Maarten Lankhorst

drm-misc-fixes-2026-01-07:
drm-misc-fixes for v6.19-rc5:

pl111:
- Fix error handling in probe

mediatek/atomic/tidss:
- Fix tidss in another way and revert reordering of pre-enable and post-disable operations,
  as it breaks other bridge drivers.

nouveau:
- Fix regression from fwsec s/r fix.

pci/vga:
- Fix multiple gpu's being reported a 'boot_display'

fb-helper:
- Fix vblank timeout during suspend/reset
The following changes since commit 3fbd97618f49e07e05aad96510e5f2ed22d68809:

  drm/gem-shmem: Fix the MODULE_LICENSE() string (2025-12-21 20:15:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-01-07

for you to fetch changes up to d5bdf88d1f9d1e4808177f03d89de3d0ba6c6e84:

  drm/fb-helper: Fix vblank timeout during suspend/reset (2026-01-06 09:05:06 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.19-rc5:

pl111:
- Fix error handling in probe

mediatek/atomic/tidss:
- Fix tidss in another way and revert reordering of pre-enable and post-disable operations,
  as it breaks other bridge drivers.

nouveau:
- Fix regression from fwsec s/r fix.

pci/vga:
- Fix multiple gpu's being reported a 'boot_display'

fb-helper:
- Fix vblank timeout during suspend/reset

----------------------------------------------------------------
Chengjun Yao (1):
      drm/fb-helper: Fix vblank timeout during suspend/reset

Dave Airlie (1):
      nouveau: don't attempt fwsec on sb on newer platforms.

Linus Walleij (1):
      drm/atomic-helper: Export and namespace some functions

Mario Limonciello (AMD) (1):
      PCI/VGA: Don't assume the only VGA device on a system is `boot_vga`

Miaoqian Lin (1):
      drm/pl111: Fix error handling in pl111_amba_probe

Tomi Valkeinen (3):
      Revert "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
      Revert "drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order"
      drm/tidss: Fix enable/disable order

 drivers/gpu/drm/drm_atomic_helper.c             | 122 +++++++++---
 drivers/gpu/drm/drm_fb_helper.c                 |  10 +
 drivers/gpu/drm/mediatek/mtk_dsi.c              |   6 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  |  23 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c |  15 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c |   3 +
 drivers/gpu/drm/pl111/pl111_drv.c               |   2 +-
 drivers/gpu/drm/tidss/tidss_kms.c               |  30 ++-
 drivers/pci/vgaarb.c                            |   7 -
 include/drm/drm_atomic_helper.h                 |  22 +++
 include/drm/drm_bridge.h                        | 249 +++++++-----------------
 15 files changed, 274 insertions(+), 232 deletions(-)
