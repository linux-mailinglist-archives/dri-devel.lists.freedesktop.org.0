Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC7FAFFD3C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79110E89C;
	Thu, 10 Jul 2025 08:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TydfJyNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D3E10E1E9;
 Thu, 10 Jul 2025 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752137940; x=1783673940;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=GXW0pIuhEHX7YZkDZv4Rdo2g0JmXlihzCrkS3y3V6Js=;
 b=TydfJyNAy4Ww9jcD9pXU3cFLyTb5hJSktaMDknDpAG1HLaQTYVQWzsHq
 l3RyQ0HJdfR8pCpLazRxd/XcqgOMHge1bttl+FAUWopukK277aRew72ix
 p6FRU/0K3sRcmmRh/3AcQ9trbHC1ALzMVoTQigqkqv+yrKSV0DT5ovLJg
 qtgaQZWlmYV6/6+SlCo6T6nyB0FiLhhafWkk10BSpA3QZt3u8jO8/3FA+
 u7KyGJ++pJXtBidU6ODA/5J5oj4zN/QXB5Pi8x5Eo3kzTqFU0zEk99v/q
 A3uGxBperOs5rCQAEoNTpgNdTqZXk7MMURrJB+TUvVxG3jMP9kZmJJuML w==;
X-CSE-ConnectionGUID: irPX+2WHQx+CsnKj+4UdEg==
X-CSE-MsgGUID: ytrT/rRRSbGHvvCpUKLMZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65862151"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65862151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:59:00 -0700
X-CSE-ConnectionGUID: K88X3eenT3GbfPkTYGvO0g==
X-CSE-MsgGUID: Z4EO+Bf9Qu+w6oTU4VDjcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="161574256"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.111])
 ([10.245.244.111])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:58:55 -0700
Message-ID: <e522cdc7-1787-48f2-97e5-0f94783970ab@linux.intel.com>
Date: Thu, 10 Jul 2025 10:59:19 +0200
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

Pull request for v6.16!

Best regards,
~Maarten

drm-misc-fixes-2025-07-10:
drm-misc-fixes for v6.16-rc6 or final:
- Fix nouveau fail on debugfs errors.
- Magic 50 ms to fix nouveau suspend.
- Call rust destructor on drm device release.
- Fix DMA api error handling in tegra/nvdec.
- Fix PVR device reset.
- Habanalabs maintainer update.
- Small memory leak fix when nouveau acpi init fails.
- Do not attempt to bind to any PCI device with AGP capability.
- Make FB's acquire handles on backing object, same as i915/xe already does.
- Fix race in drm_gem_handle_create_tail.
The following changes since commit 226862f50a7a88e4e4de9abbf36c64d19acd6fd0:

  drm/v3d: Disable interrupts before resetting the GPU (2025-07-02 19:08:11 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-07-10

for you to fetch changes up to bd46cece51a36ef088f22ef0416ac13b0a46d5b0:

  drm/gem: Fix race in drm_gem_handle_create_tail() (2025-07-09 15:53:34 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc6 or final:
- Fix nouveau fail on debugfs errors.
- Magic 50 ms to fix nouveau suspend.
- Call rust destructor on drm device release.
- Fix DMA api error handling in tegra/nvdec.
- Fix PVR device reset.
- Habanalabs maintainer update.
- Small memory leak fix when nouveau acpi init fails.
- Do not attempt to bind to any PCI device with AGP capability.
- Make FB's acquire handles on backing object, same as i915/xe already does.
- Fix race in drm_gem_handle_create_tail.

----------------------------------------------------------------
Aaron Thompson (1):
      drm/nouveau: Do not fail module init on debugfs errors

Alessio Belle (1):
      drm/imagination: Fix kernel crash when hard resetting the GPU

Ben Skeggs (1):
      drm/nouveau/gsp: fix potential leak of memory used during acpi init

Danilo Krummrich (1):
      rust: drm: device: drop_in_place() the drm::Device in release()

Dave Airlie (1):
      nouveau/gsp: add a 50ms delay between fbsr and driver unload rpcs

Lukas Wunner (1):
      agp/amd64: Check AGP Capability before binding to unsupported devices

Mikko Perttunen (1):
      drm/tegra: nvdec: Fix dma_alloc_coherent error check

Ofir Bitton (1):
      MAINTAINERS: Change habanalabs maintainer

Simona Vetter (1):
      drm/gem: Fix race in drm_gem_handle_create_tail()

Tamir Duberstein (1):
      rust: drm: remove unnecessary imports

Thomas Zimmermann (1):
      drm/framebuffer: Acquire internal references on GEM handles

 MAINTAINERS                                        |  2 +-
 drivers/char/agp/amd64-agp.c                       | 16 ++++----
 drivers/gpu/drm/drm_framebuffer.c                  | 31 +++++++++++++-
 drivers/gpu/drm/drm_gem.c                          | 48 +++++++++++++++-------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       | 16 ++++----
 drivers/gpu/drm/drm_internal.h                     |  2 +-
 drivers/gpu/drm/drm_panic_qr.rs                    |  2 +-
 drivers/gpu/drm/imagination/pvr_power.c            |  4 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |  6 +--
 drivers/gpu/drm/nouveau/nouveau_debugfs.h          |  5 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 27 +++++++++---
 drivers/gpu/drm/tegra/nvdec.c                      |  6 +--
 include/drm/drm_file.h                             |  3 ++
 include/drm/drm_framebuffer.h                      |  7 ++++
 rust/kernel/drm/device.rs                          | 12 +++++-
 rust/kernel/drm/driver.rs                          |  1 -
 17 files changed, 130 insertions(+), 62 deletions(-)
