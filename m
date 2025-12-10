Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789BECB2D28
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6874810E255;
	Wed, 10 Dec 2025 11:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJWNvIUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAB610E1B5;
 Wed, 10 Dec 2025 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765366127; x=1796902127;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=bSa2eZJn7c1j4+GswkUhM8ob23WoftjxztphAtsWLRo=;
 b=lJWNvIUaFgyxS2Sdi7UkpuWZrnYWKeiqcEBvFKkyoMWUak9NkzkrcWly
 6Lj0Gx4vWr0IiorRECKTfAuGJ2qhrGQuNTNDrHcdzlVij+aI/9qOPKxz8
 XkbYzafVJDphslC59FbY/F6w8RfBeELPVOUmF1zDD/EuABc6X8Y8ET2KP
 MMOgVJKEAAn+3vAKDltTUbG/8p9NBrGSGF+2q+9mjWK1ohPiIOoEI+nf4
 kGh51Q4lLE6MNp2CI0VK1ZjwDB11jA1NI3KOIZZBuLzmIYjD3cbii7xAd
 H53Ajx0LuKTN/FCKsjiByDi2Kw5wpioDGFeF/7n6RKth7jWvPKAfQscqF A==;
X-CSE-ConnectionGUID: xyJ0ZT1+QdWJaZgiOeWmdw==
X-CSE-MsgGUID: AG29nsA1RjCoSK71Xxg6vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78447333"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78447333"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:28:45 -0800
X-CSE-ConnectionGUID: HUU2aglYSeaL1+wpuQeNEA==
X-CSE-MsgGUID: dVY02wNWSF6Tz9m4my4/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="227147451"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.102])
 ([10.245.244.102])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:28:39 -0800
Message-ID: <6c371dc1-08bf-4a34-895c-9ef348b6061b@linux.intel.com>
Date: Wed, 10 Dec 2025 12:29:17 +0100
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
Subject: [PULL] drm-misc-fixes
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

drm-misc-fixes for v6.19-rc1.

Kind regards,
~Maarten Lankhorst

drm-misc-fixes-2025-12-10:
drm-misc-fixes for v6.19-rc1:
- Fix stack usage warning in novatek-nt35560.
- Fix s/r, i2c issues in nouveau and update string handling.
- Ignore spurious PLL_UNLOCK bit in ti-sn65dsi83.
- Handle IS_ERR vs NULL in drm_plane_create_hotspot_properties().
- Fix devcoredump crash on reading evicted bo's.
- Fix bigendian handling in mgag200.
- Fix probe failure in tilcdc.
The following changes since commit eb76d0f5553575599561010f24c277cc5b31d003:

  drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup (2025-11-25 09:08:32 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-12-10

for you to fetch changes up to 6cb31fba137d45e682ce455b8ea364f44d5d4f98:

  drm/mgag200: Fix big-endian support (2025-12-10 09:33:53 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.19-rc1:
- Fix stack usage warning in novatek-nt35560.
- Fix s/r, i2c issues in nouveau and update string handling.
- Ignore spurious PLL_UNLOCK bit in ti-sn65dsi83.
- Handle IS_ERR vs NULL in drm_plane_create_hotspot_properties().
- Fix devcoredump crash on reading evicted bo's.
- Fix bigendian handling in mgag200.
- Fix probe failure in tilcdc.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/panel: novatek-nt35560: avoid on-stack device structure

Dan Carpenter (1):
      drm/plane: Fix IS_ERR() vs NULL check in drm_plane_create_hotspot_properties()

Kory Maincent (TI.com) (1):
      drm/tilcdc: Fix removal actions in case of failed probe

Luca Ceresoli (1):
      drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors

Lyude Paul (1):
      drm/nouveau/gsp: Allocate fwsec-sb at boot

Madhur Kumar (2):
      drm/nouveau: refactor deprecated strcpy
      drm: nouveau: Replace sprintf() with sysfs_emit()

René Rebe (2):
      drm/nouveau: fix circular dep oops from vendored i2c encoder
      drm/mgag200: Fix big-endian support

Simon Richter (1):
      drm/ttm: Avoid NULL pointer deref for evicted BOs

 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 11 +++-
 drivers/gpu/drm/drm_plane.c                        |  8 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c             | 25 +++++++++
 .../gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c | 20 -------
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 19 ++++++-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  4 ++
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  6 +--
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |  4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    | 61 +++++++++++++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |  3 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 10 +++-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |  8 +--
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 53 ++++++++++++-------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  6 +++
 16 files changed, 166 insertions(+), 76 deletions(-)
