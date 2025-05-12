Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117DEAB3502
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 12:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27810E3A9;
	Mon, 12 May 2025 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOFln+K1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DAD10E385;
 Mon, 12 May 2025 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747046168; x=1778582168;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=6Et9ns4r4tzVyB2E+/7EfSWmT59u5UnD8ZpY3+WemEQ=;
 b=ZOFln+K1lY2Btvqyl3H0dW7VtVoj8dpRrCLbT7zZ5cH0wplYiuQIHZHf
 R0nnkmdRz3/Eud3fq1fB83Jt4aYHETmu3o90wtdkz/9XDgRarfesQwcoc
 H3Tu8ogAUldacGbZvNlooMaK/oMINlbaT03LCe8LkN342IZ2BYsEyAmOh
 PKg7B44xGU7AMnSQ3vBn6moha/WS7WeKkD1TvIIwIjvNkGwVg2BXxLr6W
 qiYnhy322Lt8FStJd4ySKxjdjrJXY248T68Bl72qnr5/LqDFGAgrPXFb6
 Xjhq5JaSfRxhGmOsqa0KnAqaxKWXGLDE1gPo0/wBD7/6sI2nJNR3+P5/m Q==;
X-CSE-ConnectionGUID: 6cMFRf00R7CLM9wO5EaBlw==
X-CSE-MsgGUID: TZdtSZhLTIefsIFwGTVH9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="60177836"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="60177836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:36:05 -0700
X-CSE-ConnectionGUID: 5F032XMfSP6V5w9fSdJ3zw==
X-CSE-MsgGUID: +7Dgr3i9TD+LDogtRcL+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137230037"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.251])
 ([10.245.245.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:36:01 -0700
Message-ID: <23ded62c-6a62-4195-9c08-4dfb81eafd72@linux.intel.com>
Date: Mon, 12 May 2025 12:35:29 +0200
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

One more pull request, requested by Jani for async flips.

Cheers,
~Maarten

drm-misc-next-2025-05-12:
drm-misc-next for v6.16-rc1:

Once more, with async flips.

UAPI Changes:
- Add IN_FORMATS_ASYNC property, use in i915.

Cross-subsystem Changes:
- Remove some unused debug code in dma-buf.

Core Changes:

Driver Changes:
- Add Novatek NT37801 panel.
- Allow submitting empty commands in amdxdna.
- Convert cirrus to use managed request_all_regions.
- Move Sitronix from tiny to their own place.
The following changes since commit 78184f6e3db16c05ad5933b411faa416bb68ac1e:

  gpu: host1x: Use for_each_available_child_of_node_scoped() (2025-05-07 18:09:30 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-05-12

for you to fetch changes up to 9b8f32002cddf792fc6657c6f084585c7af1a858:

  drm/sitronix: move tiny Sitronix drivers to their own subdir (2025-05-12 10:26:40 +0200)

----------------------------------------------------------------
drm-misc-next for v6.16-rc1:

Once more, with async flips.

UAPI Changes:
- Add IN_FORMATS_ASYNC property, use in i915.

Cross-subsystem Changes:
- Remove some unused debug code in dma-buf.

Core Changes:

Driver Changes:
- Add Novatek NT37801 panel.
- Allow submitting empty commands in amdxdna.
- Convert cirrus to use managed request_all_regions.
- Move Sitronix from tiny to their own place.

----------------------------------------------------------------
Arun R Murthy (5):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to acommodate async
      drm/i915/display: Acomodate format check in intel_plane_can_async_flip()
      drm/i915/display: Add i915 hook for format_mod_supported_async
      drm/i915/display: Indexed 8bit format does not support async flip

Dr. David Alan Gilbert (1):
      dma-buf/sw-sync: Remove unused debug code

Krzysztof Kozlowski (2):
      dt-bindings: display: panel: Add Novatek NT37801
      drm/panel: Add Novatek NT37801 panel driver

Lizhi Hou (1):
      accel/amdxdna: Support submit commands without arguments

Marcus Folkesson (1):
      drm/sitronix: move tiny Sitronix drivers to their own subdir

Neil Armstrong (1):
      dt-bindings: display: panel: convert truly,nt35597.txt to dt-schema

Philipp Stanner (1):
      drm/cirrus: Use non-hybrid PCI devres API

 .../bindings/display/panel/novatek,nt37801.yaml    |  69 +++++
 .../display/panel/truly,nt35597-2K-display.yaml    |  97 ++++++
 .../devicetree/bindings/display/truly,nt35597.txt  |  59 ----
 MAINTAINERS                                        |  12 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |  22 +-
 drivers/dma-buf/sync_debug.c                       |  49 ---
 drivers/dma-buf/sync_debug.h                       |   2 -
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/drm_mode_config.c                  |   7 +
 drivers/gpu/drm/drm_plane.c                        |  52 +++-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  18 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  14 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   5 +-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      | 340 +++++++++++++++++++++
 drivers/gpu/drm/sitronix/Kconfig                   |  51 ++++
 drivers/gpu/drm/sitronix/Makefile                  |   3 +
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c    |   0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c        |   0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c       |   0
 drivers/gpu/drm/tiny/Kconfig                       |  41 ---
 drivers/gpu/drm/tiny/Makefile                      |   3 -
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |   2 +-
 include/drm/drm_mode_config.h                      |   6 +
 include/drm/drm_plane.h                            |  17 ++
 29 files changed, 699 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt35597-2K-display.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/truly,nt35597.txt
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37801.c
 create mode 100644 drivers/gpu/drm/sitronix/Kconfig
 create mode 100644 drivers/gpu/drm/sitronix/Makefile
 rename drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c (100%)
 rename drivers/gpu/drm/{tiny => sitronix}/st7586.c (100%)
 rename drivers/gpu/drm/{tiny => sitronix}/st7735r.c (100%)
