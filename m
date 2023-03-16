Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B546BD40C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 16:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7628310E26B;
	Thu, 16 Mar 2023 15:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2464D10ED0C;
 Thu, 16 Mar 2023 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678981203; x=1710517203;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=bDtGESVL4IZh5+VMHNy71xLV6TxJ6m3CpZKIDYjbawA=;
 b=NiBHYi6VsMvYMeuXByi5t5diwjI8x8JhImjG3prwIdTjRf1VPctD5vn7
 sEOKonKbJv1S8Z7W3KuUuBUVz/W7wDtakOoGp/3b0uR2FhfJUxX9+Ty35
 KmRQyLNBDVmzcx1HP/s4ysI8ZMvR7mewiQgDhhFlpccusrMYFGhZ2/mbq
 LNviZDYQwSedasOQbq9nDgnyI0BkME+akUFrqIUD+wDYYIrLk919pLS4z
 hzVYZSLrNHowhDtYoHtkKG9DrIysBTlG4Ir3UgbB/MCMHjIG4/pGQEtFC
 sFp7vjPgvC/vomXOSG2my8fmehZsw+4H2r873QNeJgjTDBJ9RYycCzYEC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="400617472"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="400617472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712410783"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="712410783"
Received: from dekblom-mobl1.ger.corp.intel.com (HELO [10.249.43.98])
 ([10.249.43.98])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:39:40 -0700
Message-ID: <f7b765c7-d49d-edb5-2a6a-4f7a7be16a59@linux.intel.com>
Date: Thu, 16 Mar 2023 16:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Here's the new weekly pull request for v6.4-rc1.

I've omitted the diffstat, as it was huge because v6.3-rc1 was backmerged.

Cheers,

~Maarten

drm-misc-next-2023-03-16:

drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- Add drm_bridge.h to drm_bridge maintainers.

Core Changes:
- Assorted fixes to TTM, tests, format-helper, accel.
- Assorted Makefile fixes to drivers and accel.
- Implement fbdev emulation for GEM DMA drivers, and convert a lot of
   drivers to use it.
- Use tgid instead of pid for tracking clients.

Driver Changes:
- Assorted fixes in rockchip, vmwgfx, nouveau, cirrus.
- Add imx25 driver.
- Add Elida KD50T048A, Sony TD4353, Novatek NT36523, STARRY 
2081101QFH032011-53G panels.
- Add 4K mode support to rockchip.
- Convert cirrus to use regular atomic helpers, and more cirrus
   improvements.
- Add damage clipping to cirrus, virtio.
The following changes since commit 9228742caf899fa72230dd8da19ca4c7528badb8:

   drm/nouveau/hwmon: Use sysfs_emit in show function callsbacks 
(2023-03-06 19:42:50 -0500)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-16

for you to fetch changes up to b24343eaceedb902c1625854f85a193b0549d85f:

   drm/nouveau/nvfw/acr: set wpr_generic_header_dump 
storage-class-specifier to static (2023-03-16 14:53:15 +0100)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- Add drm_bridge.h to drm_bridge maintainers.

Core Changes:
- Assorted fixes to TTM, tests, format-helper, accel.
- Assorted Makefile fixes to drivers and accel.
- Implement fbdev emulation for GEM DMA drivers, and convert a lot of
   drivers to use it.
- Use tgid instead of pid for tracking clients.

Driver Changes:
- Assorted fixes in rockchip, vmwgfx, nouveau, cirrus.
- Add imx25 driver.
- Add Elida KD50T048A, Sony TD4353, Novatek NT36523, STARRY 
2081101QFH032011-53G panels.
- Add 4K mode support to rockchip.
- Convert cirrus to use regular atomic helpers, and more cirrus
   improvements.
- Add damage clipping to cirrus, virtio.

----------------------------------------------------------------
Fabio Estevam (2):
       dt-bindings: display: seiko,43wvf1g: Add the 'enable-gpios' property
       drm/panel: seiko-43wvf1g: Add the 'enable-gpios' property

Gerald Loacker (1):
       drm/rockchip: vop2: add polarity flags to RGB output

Jacob Keller (1):
       drm/rockchip: vop2: use struct_size() in vop2_bind

Javier Martinez Canillas (2):
       drm/format-helper: Make conversion_buf_size() support sub-byte 
pixel fmts
       drm/virtio: Enable fb damage clips property for the primary plane

Jianhua Lu (2):
       dt-bindings: display: panel: Add Novatek NT36523 bindings
       drm/panel: Add driver for Novatek NT36523

Jiapeng Chong (1):
       drm/rockchip: dsi: Remove the unused function dsi_read()

Konrad Dybcio (2):
       dt-bindings: display/panel: Add Sony Tama TD4353 JDI display panel
       gpu/drm/panel: Add Sony TD4353 JDI panel driver

Linus Walleij (1):
       drm/mcde: Do not use dirty GEM FB handling

Liu Ying (1):
       MAINTAINERS: Add include/drm/drm_bridge.h to DRM DRIVERS FOR 
BRIDGE CHIPS

Marian Cichy (1):
       drm/imx/lcdc: Implement DRM driver for imx25

Maya Matuszczyk (3):
       dt-bindings: display: panel: sitronix,st7701: Add Elida KD50T048A 
Panel
       drm: panel: Add Elida KD50T048A to Sitronix ST7701 driver
       drm: panel: Add orientation support for st7701

Ruihai Zhou (2):
       dt-bindings: display: panel: Add compatible for Starry 
2081101QFH032011-53G
       drm/panel: support for STARRY 2081101QFH032011-53G MIPI-DSI panel

Sascha Hauer (4):
       drm/rockchip: vop: limit maximum resolution to hardware capabilities
       drm/rockchip: dw_hdmi: relax mode_valid hook
       drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
       drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks

Stanislaw Gruszka (1):
       accel: Build sub-directories based on config options

Thomas Hellström (3):
       drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
       drm/ttm: Unexport ttm_global_swapout()
       drm/ttm: Don't print error message if eviction was interrupted

Thomas Zimmermann (42):
       Merge drm/drm-next into drm-misc-next
       drm/cirrus: Compute blit destination offset in single location
       drm/cirrus: Replace cpp value with format
       drm/cirrus: Use drm_fb_blit() to update scanout buffer
       drm/cirrus: Move drm_dev_{enter, exit}() into DRM helpers
       drm/cirrus: Split cirrus_mode_set() into smaller functions
       drm/cirrus: Integrate connector into pipeline code
       drm/cirrus: Move primary-plane format arrays
       drm/cirrus: Convert to regular atomic helpers
       drm/cirrus: Enable damage clipping on primary plane
       drm/cirrus: Inline cirrus_fb_blit_rect()
       drm/cirrus: Remove format test from cirrus_fb_create()
       drm/cirrus: Remove size test from cirrus_fb_create()
       drm/cirrus: Test mode against video-memory size in device-wide 
mode_valid
       drm/cirrus: Inline cirrus_check_size() into primary-plane 
atomic_check
       drm/cirrus: Introduce struct cirrus_primary_plane_state
       drm/cirrus: Store HW format/pitch in primary-plane state
       drm/cirrus: Use VGA macro constants to unblank
       drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers
       arm/hdlcd: Use GEM DMA fbdev emulation
       arm/malidp: Use GEM DMA fbdev emulation
       drm/aspeed: Use GEM DMA fbdev emulation
       drm/atmel-hlcdc: Use GEM DMA fbdev emulation
       drm/fsl-dcu: Use GEM DMA fbdev emulation
       drm/imx/dcss: Use GEM DMA fbdev emulation
       drm/imx: Use GEM DMA fbdev emulation
       drm/kmb: Use GEM DMA fbdev emulation
       drm/logicvc: Use GEM DMA fbdev emulation
       drm/meson: Use GEM DMA fbdev emulation
       drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
       drm/mxsfb: Use GEM DMA fbdev emulation
       drm/sti: Use GEM DMA fbdev emulation
       drm/stm: Use GEM DMA fbdev emulation
       drm/sun4i: Use GEM DMA fbdev emulation
       drm/tidss: Use GEM DMA fbdev emulation
       drm/tilcdc: Use GEM DMA fbdev emulation
       drm/arcpgu: Use GEM DMA fbdev emulation
       drm/tve200: Use GEM DMA fbdev emulation
       drm/vc4: Use GEM DMA fbdev emulation
       drm/xlnx: Use GEM DMA fbdev emulation
       drm/mcde: Use GEM DMA fbdev emulation
       drm/pl111: Use GEM DMA fbdev emulation

Tom Rix (3):
       drm/nouveau/fifo: set gf100_fifo_nonstall_block_dump 
storage-class-specifier to static
       drm/nouveau/fifo: set nvkm_engn_cgrp_get storage-class-specifier 
to static
       drm/nouveau/nvfw/acr: set wpr_generic_header_dump 
storage-class-specifier to static

Tvrtko Ursulin (1):
       drm: Track clients by tgid and not tid

Uwe Kleine-König (3):
       drm/tests: helpers: Drop empty platform remove function
       dt-bindings: display: imx: Describe drm binding for fsl,imx-lcdc
       drm: Drop ARCH_MULTIPLATFORM from dependencies

Zack Rusin (1):
       drm/vmwgfx: Fix src/dst_pitch confusion

