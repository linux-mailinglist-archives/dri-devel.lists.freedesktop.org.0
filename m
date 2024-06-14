Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0029085D9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1D10EC8C;
	Fri, 14 Jun 2024 08:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6TqFxrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2D410EC79;
 Fri, 14 Jun 2024 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718352798; x=1749888798;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=5Q55qOR8XFcpe/RWFkT6Z2W5vwo+P5OAPe/GbpbFP+0=;
 b=V6TqFxrTRFk/Kfi4fXcI0ftxMV9pxi1CKJ6yeG0Z8E45wL2iRq9k5iKl
 wtnlqrNVkux1FXH0MSRMH+heQu0mrO7+CW9jHrK10hv16APaZUhCSmXVq
 BbiRGjgFuP6wA21qD6QVzb+IIrUV+mRUTiGWvsKYt42Smo5zfAnsnN4bd
 hS6UNXmHlzizuANr2j+muwdyXE2yAVm/GGGyNfbTbxcqNkLZsyyQkZrYY
 E874Qf6whbrKr2hdGK+0Nwj4IBYwGfeYvG9q9G9DgI3z/ShTk6SNu6wEw
 9NcFqRShGunWjXFCk3G6YGUzn/rXOo5XHbS3JNSCUaywn7DzxhN5D/NS8 Q==;
X-CSE-ConnectionGUID: xejjP7cNSf6gIqvIyoAz6A==
X-CSE-MsgGUID: IoXeuUx9SBqtRQk6Y4l3mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25865299"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="25865299"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:13:17 -0700
X-CSE-ConnectionGUID: mot5HTMWQ26BTwg5iBjDzA==
X-CSE-MsgGUID: QMt2FsQYRMyoZDLzb0vAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="44805142"
Received: from kmreisi-mobl1.ger.corp.intel.com (HELO [10.251.214.83])
 ([10.251.214.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:13:13 -0700
Message-ID: <941c0552-3614-4af1-b04a-0a62c99fd7fb@linux.intel.com>
Date: Fri, 14 Jun 2024 10:13:41 +0200
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
Subject: [PULL] drm-misc-fixes
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

Got a bit distracted with drm-misc-next-fixes yesterday, so here's a 
slightly late drm-misc-fixes.

Cheers,
~Maarten

drm-misc-fixes-2024-06-14:
drm-misc-fixes for v6.10-rc4:
- Kconfig fix for WERROR.
- Add panel quirk for Aya Neo KUN
- Small bugfixes in komeda, bridge/panel, amdgpu, nouveau.
- Remove unused nouveau struct.
- Call drm_atomic_helper_shutdown for shmobile and mediatek on shutdown.
- Remove DEBUGFS ifdefs from komeda.
The following changes since commit f1909e859753c9bda87c6d2b82a7f832ef80aa2d:

   Merge tag 'drm-xe-fixes-2024-06-13' of 
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2024-06-14 
11:08:06 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-fixes-2024-06-14

for you to fetch changes up to 14731a640e5513bd514adcf35e96c84ad42f540d:

   Merge drm/drm-fixes into drm-misc-fixes (2024-06-14 09:55:46 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.10-rc4:
- Kconfig fix for WERROR.
- Add panel quirk for Aya Neo KUN
- Small bugfixes in komeda, bridge/panel, amdgpu, nouveau.
- Remove unused nouveau struct.
- Call drm_atomic_helper_shutdown for shmobile and mediatek on shutdown.
- Remove DEBUGFS ifdefs from komeda.

----------------------------------------------------------------
Adam Miotk (1):
       drm/bridge/panel: Fix runtime warning on panel bridge release

Amjad Ouled-Ameur (1):
       drm/komeda: check for error-valued pointer

Arunpravin Paneer Selvam (1):
       drm/amdgpu: Fix the BO release clear memory warning

Douglas Anderson (2):
       drm: renesas: shmobile: Call drm_atomic_helper_shutdown() at 
shutdown time
       drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time

Dr. David Alan Gilbert (1):
       drm/nouveau: remove unused struct 'init_exec'

Jani Nikula (1):
       drm: have config DRM_WERROR depend on !WERROR

Maxime Ripard (1):
       Merge drm/drm-fixes into drm-misc-fixes

Tobias Jakobi (1):
       drm: panel-orientation-quirks: Add quirk for Aya Neo KUN

Vasily Khoruzhick (1):
       drm/nouveau: don't attempt to schedule hpd_work on headless cards

pengfuyuan (1):
       arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations

  drivers/gpu/drm/Kconfig                                    | 1 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                    | 1 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c                 | 2 --
  drivers/gpu/drm/arm/display/komeda/komeda_dev.c            | 8 --------
  drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
  drivers/gpu/drm/bridge/panel.c                             | 7 +++++--
  drivers/gpu/drm/drm_panel_orientation_quirks.c             | 6 ++++++
  drivers/gpu/drm/mediatek/mtk_drm_drv.c                     | 8 ++++++++
  drivers/gpu/drm/nouveau/dispnv04/disp.c                    | 2 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c                    | 2 +-
  drivers/gpu/drm/nouveau/nouveau_bios.c                     | 5 -----
  drivers/gpu/drm/nouveau/nouveau_display.c                  | 6 +++++-
  drivers/gpu/drm/nouveau/nouveau_drv.h                      | 1 +
  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c           | 8 ++++++++
  14 files changed, 38 insertions(+), 21 deletions(-)
