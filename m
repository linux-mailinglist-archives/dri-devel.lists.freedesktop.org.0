Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12A8BFB15
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1638E11358B;
	Wed,  8 May 2024 10:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr0Svj1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4C3113587;
 Wed,  8 May 2024 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715164571; x=1746700571;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=WGv/5VuYW2r16KYJevf+UCY0ndkpQZYpWB/W5sNTOCM=;
 b=Rr0Svj1LElbFnA1aKt4MtjXk/e+2JI78w2bQkoDjKlFZJkYI0jE6LZz3
 qLSA3oyo7j0fggdz/u+hDbH+qkFlOdGRfjn82zYza0Fqk/P77m3eZw+M7
 G1AD9ksFz79LBhldogG1puvaqotQPWtxMpKwI8N5DlycBBbeiUZ/LUxhb
 58GY7qbTX+FQTyxUl7ffHKpZ2rsXvDNpVD9YqsN1zKrI7zNKMzMOEc4oY
 FGASEizVGEn6pgO0qfLVR1sQzwtZoMddEhsU8GS1iWYAFQjjj4YJdXFq8
 MQVv0ElLBWXHMuVmN5jCJZRViLYAP+aNQ79V1QY8Si2epCcLcY0jwMq+f g==;
X-CSE-ConnectionGUID: C9p72SBqRRi613aTJ7knYw==
X-CSE-MsgGUID: 8J54EH+zQ9ymJ2hQiNN6qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28491397"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28491397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:36:10 -0700
X-CSE-ConnectionGUID: iHM+A9pUQd+gwaioNRs+dg==
X-CSE-MsgGUID: 3gKs9FuXSGqcqEjEmedIkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33677494"
Received: from tgorgenx-mobl.ger.corp.intel.com (HELO [10.252.34.133])
 ([10.252.34.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:36:05 -0700
Message-ID: <fe630414-d13e-4052-86f3-ce3155eb3e44@linux.intel.com>
Date: Wed, 8 May 2024 12:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Subject: [PULL] drm-misc-next-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dave, Sima,

drm-misc-next-fixes for v6.10-rc1.

There was some discussion on certain cherry picks I did,
specifically the one for hiding fbdev address. There is some potential
to cause regressions on ARM by hiding the physical address, but I think 
it should be fine to move ahead. This is why a pull request didn't make 
it in time last week.

Hope the extra time at least gave more chance of detection of potential 
regressions.

Cheers,
Maarten

drm-misc-next-fixes-2024-05-08:
drm-misc-next-fixes for v6.10-rc1:
- panthor fixes.
- Reverting Kconfig changes, and moving drm options to submenu.
- Hide physical fb address in fb helper.
- zynqmp bridge fix.
- Revert broken ti-sn65dsi83 fix.
The following changes since commit 4a56c0ed5aa0bcbe1f5f7d755fb1fe1ebf48ae9c:

   Merge tag 'amd-drm-next-6.10-2024-04-26' of 
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-04-30 
14:43:00 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-fixes-2024-05-08

for you to fetch changes up to be3f3042391d061cfca2bd22630e0d101acea5fc:

   drm: zynqmp_dpsub: Always register bridge (2024-05-02 23:40:56 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v6.10-rc1:
- panthor fixes.
- Reverting Kconfig changes, and moving drm options to submenu.
- Hide physical fb address in fb helper.
- zynqmp bridge fix.
- Revert broken ti-sn65dsi83 fix.

----------------------------------------------------------------
Boris Brezillon (3):
       drm/panthor: Kill the faulty_slots variable in 
panthor_sched_suspend()
       drm/panthor: Make sure we handle 'unknown group state' case properly
       drm/panthor: Fix the FW reset logic

Geert Uytterhoeven (11):
       Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2"
       Revert "drm/display: Select DRM_KMS_HELPER for DP helpers"
       Revert "drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable"
       Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
       Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"
       Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on"
       Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
       Revert "drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on"
       Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
       Revert "drm: Make drivers depends on DRM_DW_HDMI"
       Revert "drm/display: Make all helpers visible and switch to 
depends on"

Jocelyn Falempe (1):
       drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()

Luca Ceresoli (1):
       Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"

Masahiro Yamada (1):
       drm: move DRM-related CONFIG options into DRM submenu

Sean Anderson (1):
       drm: zynqmp_dpsub: Always register bridge

Thomas Zimmermann (1):
       drm/fbdev-generic: Do not set physical framebuffer address

  drivers/gpu/drm/Kconfig                 | 20 +++++++-------
  drivers/gpu/drm/amd/amdgpu/Kconfig      | 12 ++++-----
  drivers/gpu/drm/bridge/Kconfig          | 28 ++++++++++----------
  drivers/gpu/drm/bridge/analogix/Kconfig | 18 ++++++-------
  drivers/gpu/drm/bridge/cadence/Kconfig  |  8 +++---
  drivers/gpu/drm/bridge/imx/Kconfig      |  4 +--
  drivers/gpu/drm/bridge/synopsys/Kconfig |  6 ++---
  drivers/gpu/drm/bridge/ti-sn65dsi83.c   |  1 -
  drivers/gpu/drm/display/Kconfig         | 32 +++++++++-------------
  drivers/gpu/drm/drm_fb_dma_helper.c     |  3 +++
  drivers/gpu/drm/drm_fbdev_generic.c     |  1 -
  drivers/gpu/drm/exynos/Kconfig          |  4 +--
  drivers/gpu/drm/i915/Kconfig            |  8 +++---
  drivers/gpu/drm/imx/ipuv3/Kconfig       |  5 ++--
  drivers/gpu/drm/ingenic/Kconfig         |  2 +-
  drivers/gpu/drm/mediatek/Kconfig        |  6 ++---
  drivers/gpu/drm/meson/Kconfig           |  2 +-
  drivers/gpu/drm/msm/Kconfig             |  8 +++---
  drivers/gpu/drm/nouveau/Kconfig         | 10 +++----
  drivers/gpu/drm/panel/Kconfig           | 32 +++++++++++-----------
  drivers/gpu/drm/panthor/panthor_fw.c    |  7 ++---
  drivers/gpu/drm/panthor/panthor_sched.c | 47 
++++++++++++++++++++++++++-------
  drivers/gpu/drm/radeon/Kconfig          |  8 +++---
  drivers/gpu/drm/renesas/rcar-du/Kconfig |  2 +-
  drivers/gpu/drm/rockchip/Kconfig        | 10 +++----
  drivers/gpu/drm/sun4i/Kconfig           |  2 +-
  drivers/gpu/drm/tegra/Kconfig           |  8 +++---
  drivers/gpu/drm/vc4/Kconfig             | 10 +++----
  drivers/gpu/drm/xe/Kconfig              | 13 ++++-----
  drivers/gpu/drm/xlnx/Kconfig            |  8 +++---
  drivers/gpu/drm/xlnx/zynqmp_dpsub.c     |  7 +++--
  31 files changed, 172 insertions(+), 160 deletions(-)
