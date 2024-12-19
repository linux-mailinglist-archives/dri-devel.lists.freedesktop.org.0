Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C39F82F1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 19:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57210ED96;
	Thu, 19 Dec 2024 18:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOSpyfZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D32510ED8B;
 Thu, 19 Dec 2024 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734631807; x=1766167807;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=ZPMk7Ft/Zc7XyDnuYJbj9B6KzeSSI77pqZT6TqTGymY=;
 b=SOSpyfZWBU5RPDs6j52v7xkQt+w6kJpQIhSMKwI9JIQ9EtT40EkJ9GTs
 qhT1y99/Atqtm5riRtW9vVjzDaZPgSG9La5puv9oUFLJR1Y6SeUCX3jMv
 SMQdwNXeAgHhKUGHOu3CLO5sicEl2izzmbZt0OXTDqbBuKXCxgj4Q8mI3
 zYGhGw308IkTvGT/HWkUn1lTVPhxm42sOeIChxPR2Cc07HGRuDQwQzYwO
 ph4BfWJZGjRZnDuDcUlSUeLQr1zUfcIJfmPFqOmAM6pdhAC3H5dQunJ8i
 2e1Vvbndop3wZNzfbTnw6C9SqH9u94XHwE6stVrcY/hphRYhu5pEn2npc g==;
X-CSE-ConnectionGUID: JjLpmH0KQ+S50HYRu7fz4g==
X-CSE-MsgGUID: yb/kyIsFS8GGZgvgC+2rhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35325585"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35325585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:10:06 -0800
X-CSE-ConnectionGUID: jQliL760SrCQ2Xf+s2e6Kg==
X-CSE-MsgGUID: nqP/jU6/R8qwam9dJXhZ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129238853"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.64])
 ([10.245.245.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 10:10:02 -0800
Message-ID: <d0763051-87b7-483e-89e0-a9f993383450@linux.intel.com>
Date: Thu, 19 Dec 2024 19:10:00 +0100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

(Second?) last pull request for the year. Happy holidays!

Cheers,
~Maarten

drm-misc-fixes-2024-12-19:
drm-misc-fixes for v6.13-rc4:
- udma-buf fixes related to sealing.
- dma-buf build warning fix when debugfs is not enabled.
- Assorted drm/panel fixes.
- Correct error return in drm_dp_tunnel_mgr_create.
- Fix even more divide by zero in drm_mode_vrefresh.
- Fix FBDEV dependencies in Kconfig.
- Documentation fix for drm_sched_fini.
- IVPU NULL pointer, memory leak and WARN fix.
The following changes since commit 471f3a21addd4e5f170ab1364f11c3e4823e687d:

   Merge tag 'drm-misc-fixes-2024-12-05' of 
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes 
(2024-12-06 08:40:47 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-fixes-2024-12-19

for you to fetch changes up to 1b684ca15f9d78f45de3cdba7e19611387e16aa7:

   drm/sched: Fix drm_sched_fini() docu generation (2024-12-19 16:03:56 
+0100)

----------------------------------------------------------------
drm-misc-fixes for v6.13-rc4:
- udma-buf fixes related to sealing.
- dma-buf build warning fix when debugfs is not enabled.
- Assorted drm/panel fixes.
- Correct error return in drm_dp_tunnel_mgr_create.
- Fix even more divide by zero in drm_mode_vrefresh.
- Fix FBDEV dependencies in Kconfig.
- Documentation fix for drm_sched_fini.
- IVPU NULL pointer, memory leak and WARN fix.

----------------------------------------------------------------
Arnd Bergmann (2):
       drm: rework FB_CORE dependency
       drm: rework FB_CORE dependency

Bagas Sanjaya (1):
       drm/sched: Fix drm_sched_fini() docu generation

Danilo Krummrich (1):
       MAINTAINERS: align Danilo's maintainer entries

Jacek Lawrynowicz (3):
       accel/ivpu: Fix general protection fault in ivpu_bo_list()
       accel/ivpu: Fix memory leak in ivpu_mmu_reserved_context_init()
       accel/ivpu: Fix WARN in ivpu_ipc_send_receive_internal()

Jann Horn (3):
       udmabuf: fix racy memfd sealing check
       udmabuf: also check for F_SEAL_FUTURE_WRITE
       udmabuf: fix memory leak on last export_udmabuf() error path

Krzysztof Karas (1):
       drm/display: use ERR_PTR on DP tunnel manager creation fail

Marek Vasut (1):
       drm/panel: st7701: Add prepare_prev_first flag to drm_panel

Michael Trimarchi (1):
       drm/panel: synaptics-r63353: Fix regulator unbalance

T.J. Mercier (1):
       dma-buf: Fix __dma_buf_debugfs_list_del argument for !CONFIG_DEBUG_FS

Thomas Zimmermann (2):
       fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
       drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

Ville Syrjälä (1):
       drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

Yang Yingliang (1):
       drm/panel: novatek-nt35950: fix return value check in nt35950_probe()

Zhang Zekun (1):
       drm/panel: himax-hx83102: Add a check to prevent NULL pointer 
dereference

  MAINTAINERS                                    |  4 +--
  arch/powerpc/configs/pmac32_defconfig          |  1 +
  arch/powerpc/configs/ppc6xx_defconfig          |  1 +
  drivers/accel/ivpu/ivpu_gem.c                  |  2 +-
  drivers/accel/ivpu/ivpu_mmu_context.c          | 10 ++++--
  drivers/accel/ivpu/ivpu_pm.c                   |  2 +-
  drivers/auxdisplay/Kconfig                     |  2 +-
  drivers/dma-buf/dma-buf.c                      |  2 +-
  drivers/dma-buf/udmabuf.c                      | 43 
++++++++++++++++----------
  drivers/gpu/drm/Kconfig                        |  4 +++
  drivers/gpu/drm/display/drm_dp_tunnel.c        | 10 +++---
  drivers/gpu/drm/drm_modes.c                    | 11 ++++---
  drivers/gpu/drm/panel/panel-himax-hx83102.c    |  2 ++
  drivers/gpu/drm/panel/panel-novatek-nt35950.c  |  4 +--
  drivers/gpu/drm/panel/panel-sitronix-st7701.c  |  1 +
  drivers/gpu/drm/panel/panel-synaptics-r63353.c |  2 +-
  drivers/gpu/drm/scheduler/sched_main.c         |  3 +-
  drivers/macintosh/Kconfig                      |  1 +
  drivers/staging/fbtft/Kconfig                  |  1 +
  drivers/video/fbdev/Kconfig                    | 18 ++++++++---
  drivers/video/fbdev/core/Kconfig               |  3 +-
  21 files changed, 82 insertions(+), 45 deletions(-)
