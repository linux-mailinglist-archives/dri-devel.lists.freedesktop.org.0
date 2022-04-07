Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E091A4F7D52
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 12:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2C810E0B7;
	Thu,  7 Apr 2022 10:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC4D10E9A7;
 Thu,  7 Apr 2022 10:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649328985; x=1680864985;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=Ht2T6rVrGztyvBUWIGSshl9b6ltd8WD+Wj6Vs2aI5vM=;
 b=OUOWZmZXkBMBTmvda3no4NmAurNK2kEIATKEBs6skDBNWUkSNIrTsVFU
 un88bDSakh4ruHjwSHI17tFDxMSiHlsk4e+pJnhS8fq+dvEvRmj99nPTV
 2tYFS1+Til4BrPQdMM3Jc8euYXWwl4c9jFxPMSVu0s1ZEYA5V2Y4zS4Vg
 rQAyLKUHEljBOONTuG4zJTVE+yWs5wJdLPPcZLisUhb3rxdPreME8w7/n
 cStzkvI0Ew4dOyrpikDDRBgcgc14LyJ71DpEv8gtvWnLKZZDnmhk5hPxv
 NPasFNBc9NPsVKXbqW2u58kl1KDDYowgP2rz7Bqc/ufI7Uy0eVui0yIio g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="321982819"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="321982819"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 03:56:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="549997455"
Received: from dzinchen-mobl1.ccr.corp.intel.com (HELO [10.252.52.87])
 ([10.252.52.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 03:56:21 -0700
Message-ID: <58fa2262-3eb6-876d-7157-ab7a135696b7@linux.intel.com>
Date: Thu, 7 Apr 2022 12:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-fixes-2022-04-07:
drm-misc-fixes for v5.18-rc2:
- Fix a crash when booting with nouveau on tegra.
- Don't require input port for MIPI-DSI, and make width/height mandatory.
- Fix unregistering of framebuffers without device.
-
The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-04-07

for you to fetch changes up to 1ecc0c09f19f8e10a2c52676f8ca47c28c9f73c7:

  dt-bindings: display: panel: mipi-dbi-spi: Make width-mm/height-mm mandatory (2022-04-07 03:28:10 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.18-rc2:
- Fix a crash when booting with nouveau on tegra.
- Don't require input port for MIPI-DSI, and make width/height mandatory.
- Fix unregistering of framebuffers without device.
-

----------------------------------------------------------------
Christian König (5):
      dma-buf: Add dma_fence_array_for_each (v2)
      dma-buf: add dma_fence_unwrap v2
      dma-buf/sync-file: fix warning about fence containers
      dma-buf/sync-file: fix logic error in new fence merge code
      dma-buf: handle empty dma_fence_arrays gracefully

Karol Herbst (1):
      drm/nouveau/pmu: Add missing callbacks for Tegra devices

Marek Vasut (1):
      dt-bindings: display: panel: mipi-dbi-spi: Make width-mm/height-mm mandatory

Maxime Ripard (3):
      dt-bindings: display: bridge: Drop requirement on input port for DSI devices
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm-misc/drm-misc-next-fixes into drm-misc-fixes

Paul Kocialkowski (1):
      drm: of: Properly try all possible cases for bridge/panel detection

Thomas Zimmermann (1):
      fbdev: Fix unregistering of framebuffers without device

 .../bindings/display/bridge/chipone,icn6211.yaml   |   1 -
 .../bindings/display/bridge/toshiba,tc358762.yaml  |   1 -
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |   2 +
 Documentation/driver-api/dma-buf.rst               |   6 +
 drivers/dma-buf/Makefile                           |   1 +
 drivers/dma-buf/dma-fence-array.c                  |  32 +++
 drivers/dma-buf/selftests.h                        |   1 +
 drivers/dma-buf/st-dma-fence-unwrap.c              | 261 +++++++++++++++++++++
 drivers/dma-buf/sync_file.c                        | 141 +++++------
 drivers/gpu/drm/drm_of.c                           |  99 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   4 +-
 drivers/video/fbdev/core/fbmem.c                   |   9 +-
 include/linux/dma-fence-array.h                    |  19 ++
 include/linux/dma-fence-chain.h                    |   2 +
 include/linux/dma-fence-unwrap.h                   |  95 ++++++++
 19 files changed, 557 insertions(+), 122 deletions(-)
 create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
 create mode 100644 include/linux/dma-fence-unwrap.h
