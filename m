Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A4D309F9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 12:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF0410E879;
	Fri, 16 Jan 2026 11:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkyViYxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B49610E86F;
 Fri, 16 Jan 2026 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768564001; x=1800100001;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=GBKaodGhra2VQepQQ7Xg+rEauVjQTk0O5E68nqVwRlE=;
 b=OkyViYxbhMk1h7mVaP9J/eSC5ba6tv52gXJJ/r9N3Gm6g9HTmSx5Nf2b
 QNVfyI4yHaCE+oCCWWHpADObhNX2F7ECT8k23pku/xl38WWgGY8ffB8CD
 6qHTWHkEg1/6KTLWLklrvN6zXffAwNYxLzeZs+MwXIrQ/naTB16a4MpBq
 A/+LSVfHhkhFX5/w6IKVVcgNmwznpA507Z0YdwtyL8hk0MJhQ6uFvuYQR
 rmQZlrtjbUZbyvxUD5DEDoflEMYxpbp+/Nm/KjFzFhWWsBEZdy82WAxXy
 aD/WOAKutZtfHafRnblOkO2zLGm5coTxRxfIsOGW/w+Lgt0S/Y1ZeSfwT Q==;
X-CSE-ConnectionGUID: 7e6I+glqTC6go6bX+B15wQ==
X-CSE-MsgGUID: f/Dpu633Sdil7CztbYhyBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69969256"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="69969256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:46:40 -0800
X-CSE-ConnectionGUID: xp0JfnKuS/m//zmB1C5ZfQ==
X-CSE-MsgGUID: TW3srg4BQj2ACbjZQLvFVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205642159"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.179])
 ([10.245.245.179])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:46:37 -0800
Message-ID: <ce0acfe2-9c1a-42b7-8782-f1e7f34b8544@linux.intel.com>
Date: Fri, 16 Jan 2026 12:46:34 +0100
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

Nature made it a bit hard to send a pull request, but ready now!
Nothing that stood out to me, all just minor fixes.

Kind regards,
~Maarten Lankhorst

drm-misc-fixes-2026-01-16:
drm-misc-fixes for v6.19-rc6:

vmwgfx:
- Fix hw regression from refactoring cursor handling on v10 'hardware'
- Fix warnings in destructor by merging the 2 release functions
- kernel doc fix
- error handling in vmw_compat_shader_add()

rockchip:
- fix vop2 polling
- fix regression waiting for cfgdone without config change
- fix warning when enabling encoder

core:
- take gem lock when preallocating in gpuvm.
- add single byte read fallback to dp for broken usb-c adapters
- remove duplicate drm_sysfb declarations

gud:
- Fix oops on usb disconnect

Simple panel:
- Re-add fallback when connector is not set to fix regressions
- Set correct type in DataImage SCF0700C48GGU18

nouveau:
- locking fixes for cursor handling.
The following changes since commit d5bdf88d1f9d1e4808177f03d89de3d0ba6c6e84:

  drm/fb-helper: Fix vblank timeout during suspend/reset (2026-01-06 09:05:06 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-01-16

for you to fetch changes up to b91a565ed14fcf900b4d95e86882b4b763860986:

  drm/sysfb: Remove duplicate declarations (2026-01-14 11:03:56 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.19-rc6:

vmwgfx:
- Fix hw regression from refactoring cursor handling on v10 'hardware'
- Fix warnings in destructor by merging the 2 release functions
- kernel doc fix
- error handling in vmw_compat_shader_add()

rockchip:
- fix vop2 polling
- fix regression waiting for cfgdone without config change
- fix warning when enabling encoder

core:
- take gem lock when preallocating in gpuvm.
- add single byte read fallback to dp for broken usb-c adapters
- remove duplicate drm_sysfb declarations

gud:
- Fix oops on usb disconnect

Simple panel:
- Re-add fallback when connector is not set to fix regressions
- Set correct type in DataImage SCF0700C48GGU18

nouveau:
- locking fixes for cursor handling.

----------------------------------------------------------------
Alice Ryhl (1):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()

Andy Yan (2):
      drm/rockchip: vop2: Add delay between poll registers
      drm/rockchip: vop2: Only wait for changed layer cfg done when there is pending cfgdone bits

Bartlomiej Kubik (1):
      drm/vmwgfx: Fix kernel-doc warnings for vmwgfx_fence

Chia-Lin Kao (AceLan) (1):
      drm/dp: Add byte-by-byte fallback for broken USB-C adapters

Cristian Ciocaltea (1):
      drm/rockchip: dw_hdmi_qp: Switch to gpiod_set_value_cansleep()

Haoxiang Li (1):
      drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()

Ian Forbes (2):
      drm/vmwgfx: Fix KMS with 3D on HW version 10
      drm/vmwgfx: Merge vmw_bo_release and vmw_bo_free functions

Ludovic Desroches (1):
      drm/panel: simple: restore connector_type fallback

Lyude Paul (2):
      drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
      drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in nv50_head_flush_*

Marek Vasut (1):
      drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel

Sebastian Reichel (1):
      drm/bridge: dw-hdmi-qp: Fix spurious IRQ on resume

Shenghao Yang (1):
      drm/gud: fix NULL fb and crtc dereferences on USB disconnect

Thomas Zimmermann (1):
      drm/sysfb: Remove duplicate declarations

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |   9 ++
 drivers/gpu/drm/drm_gpuvm.c                    |  75 +++++++++++------
 drivers/gpu/drm/gud/gud_pipe.c                 |  20 ++---
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c    |   1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c        |   5 ++
 drivers/gpu/drm/panel/panel-simple.c           | 110 ++++++++++++-------------
 drivers/gpu/drm/panthor/panthor_mmu.c          |  10 ---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  14 +++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c   |  17 +++-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h       |   9 --
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c             |  22 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c          |  10 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c            |  14 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c         |   4 +-
 include/drm/bridge/dw_hdmi_qp.h                |   1 +
 include/drm/display/drm_dp_helper.h            |  57 ++++++++-----
 16 files changed, 216 insertions(+), 162 deletions(-)
