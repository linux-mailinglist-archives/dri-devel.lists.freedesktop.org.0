Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A6AD6F8F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BF510E7E3;
	Thu, 12 Jun 2025 11:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrJgcFim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A865710E7E3;
 Thu, 12 Jun 2025 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729197; x=1781265197;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=uUQTx5mi42VjjGaXoU8tl/WfZwIOMVFPQUOacLgvD6U=;
 b=WrJgcFimq7PbR9DxTxNjy6n0ajpdNGLfkuqjqteZijnsprhqkfBWrLqr
 z0O+s5MQu2/EEfpVSccc7E0AMD2QYgD7F7LA/xSYbo3xx6LDWek6iHJ5W
 Kk6Ok0Yv53A9IPBLwWU1sdbaVh0dk3I3lU5v9QQ+JYMZUtmPP1LY1MfdF
 iRq72Bth2l3cb2DCNeLPiTx8e0JzaVLNj4rEoiu46N8As432b7kGYalZI
 IDFrvRyuLg/Ro6Vbd7LxCFEFP+g/zw/ZmHYaFyLeHmB1H/0QnIbFOrWO6
 YGqRb12LhOaFmxp3AoH1gq2VGanf9sZNcWYvkb5DD9DVy3BxqwQ0f6pPA w==;
X-CSE-ConnectionGUID: n5Pwk2pOSvmIUq/ALyorgw==
X-CSE-MsgGUID: zyRgJmN5RwKhhgt3/ip5nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69342699"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69342699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:53:17 -0700
X-CSE-ConnectionGUID: zBYpDSQYTfSlSn2rO3FgHQ==
X-CSE-MsgGUID: K9tu20mETwmF1NS1Xbwp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="184730305"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.244.165])
 ([10.245.244.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:53:12 -0700
Message-ID: <62c06195-8bc1-4dae-8777-e86d94e4d9d9@linux.intel.com>
Date: Thu, 12 Jun 2025 13:53:09 +0200
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

Here's a pull request for v6.16-rc2, especially the EPROBE_DEFER one seems serious,
I've had the same loop when converting xe/i915 audio to use EPROBE_DEFER. :)

Best regards!
~Maarten

drm-misc-fixes-2025-06-12:
drm-misc-fixes for v6.16-rc2:
- Fix infinite EPROBE_DEFER loop in vc4 probing.
- Fix amdxdna firmware size.
- mode fixes for meson.
- Kconfig fix for st7171-i2c.
- Fix -EBUSY WARN_ON_ONCE in dma-buf
- Use dma_sync_sgtable_for_cpu in udmabuf.
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-06-12

for you to fetch changes up to afe382843717d44b24ef5014d57dcbaab75a4052:

  udmabuf: use sgtable-based scatterlist wrappers (2025-06-11 13:18:07 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc2:
- Fix infinite EPROBE_DEFER loop in vc4 probing.
- Fix amdxdna firmware size.
- mode fixes for meson.
- Kconfig fix for st7171-i2c.
- Fix -EBUSY WARN_ON_ONCE in dma-buf
- Use dma_sync_sgtable_for_cpu in udmabuf.

----------------------------------------------------------------
Christian König (1):
      dma-buf: fix compare in WARN_ON_ONCE

Gabriel Dalimonte (1):
      drm/vc4: fix infinite EPROBE_DEFER loop

Lizhi Hou (1):
      accel/amdxdna: Fix incorrect PSP firmware size

Marek Szyprowski (1):
      udmabuf: use sgtable-based scatterlist wrappers

Martin Blumenstingl (3):
      drm/meson: fix debug log statement when setting the HDMI clocks
      drm/meson: use vclk_freq instead of pixel_freq in debug print
      drm/meson: fix more rounding issues with 59.94Hz modes

Nathan Chancellor (1):
      drm/sitronix: st7571-i2c: Select VIDEOMODE_HELPERS

 drivers/accel/amdxdna/aie2_psp.c           |  4 +--
 drivers/dma-buf/dma-buf.c                  |  2 +-
 drivers/dma-buf/udmabuf.c                  |  5 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  2 +-
 drivers/gpu/drm/meson/meson_vclk.c         | 55 ++++++++++++++++++------------
 drivers/gpu/drm/sitronix/Kconfig           |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 12 +++----
 7 files changed, 47 insertions(+), 34 deletions(-)
