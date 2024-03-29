Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3409892208
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 18:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D6D1127CB;
	Fri, 29 Mar 2024 17:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="s/NFcY4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9217710E16A;
 Fri, 29 Mar 2024 17:00:55 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2915720E6F3E;
 Fri, 29 Mar 2024 10:00:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2915720E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731651;
 bh=R1kI4fSdjXgmDTBK4gwdz/7qy7m6HdXCoh75MR5W1fU=;
 h=From:To:Cc:Subject:Date:From;
 b=s/NFcY4WhBBLC6P0yXaPdWjdSd1KLEhzt5QlU8HUQPolmdd//5jDkAXQu4mn4SjCo
 bn4fbp4Ho3VTBmf5gX48VajFN/A7PdTHE1O7evCm9ovfbS/jyxuny9FcLln7MTu1me
 /f8k2ymXnbN/1Rh3AQVd0O93PYUn/pPgQtCm+y+U=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v0 00/14] Make I2C terminology more inclusive for I2C Algobit
 and consumers
Date: Fri, 29 Mar 2024 17:00:24 +0000
Message-Id: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of the
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

The last patch updating the .master_xfer method to .xfer depends on
patch 1 of Wolfram's series below, but the series is otherwise
independent. It may make sense for the last patch to go in with
Wolfram's patch series via the I2C tree. Please chime in with your
opinions and suggestions.

This series is based on v6.9-rc1.

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Easwar Hariharan (14):
  IB/hfi1, IB/qib: Make I2C terminology more inclusive
  drm/amdgpu,drm/radeon: Make I2C terminology more inclusive
  drm/gma500,drm/i915: Make I2C terminology more inclusive
  media: au0828: Make I2C terminology more inclusive
  media: cobalt: Make I2C terminology more inclusive
  media: cx18: Make I2C terminology more inclusive
  media: cx25821: Make I2C terminology more inclusive
  media: ivtv: Make I2C terminology more inclusive
  media: cx23885: Make I2C terminology more inclusive
  sfc: falcon: Make I2C terminology more inclusive
  fbdev/smscufx: Make I2C terminology more inclusive
  fbdev/viafb: Make I2C terminology more inclusive
  drm/nouveau: Make I2C terminology more inclusive
  i2c and treewide: Make I2C terminology more inclusive

 .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 12 +++----
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 ++---
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 18 +++++-----
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
 .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
 .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
 .../display/include/grph_object_ctrl_defs.h   |  2 +-
 drivers/gpu/drm/amd/include/atombios.h        |  2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h    | 26 +++++++-------
 .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
 .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
 .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
 .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 ++---
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  2 +-
 drivers/gpu/drm/gma500/intel_bios.c           | 22 ++++++------
 drivers/gpu/drm/gma500/intel_bios.h           |  4 +--
 drivers/gpu/drm/gma500/intel_gmbus.c          |  6 ++--
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c    |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h              |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h        |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  4 +--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       | 28 +++++++--------
 drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++----
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++-----
 drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 ++++-----
 drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++-----
 drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++-----
 drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++-----
 drivers/gpu/drm/i915/display/intel_bios.c     | 22 ++++++------
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 .../gpu/drm/i915/display/intel_display_core.h |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 18 +++++-----
 drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++----
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  8 ++---
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 34 +++++++++---------
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
 drivers/gpu/drm/i915/gvt/edid.c               | 28 +++++++--------
 drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
 drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        | 14 ++++----
 .../nouveau/include/nvkm/subdev/bios/dcb.h    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        |  4 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c |  2 +-
 drivers/gpu/drm/radeon/atombios.h             |  2 +-
 drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
 drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++--------
 drivers/gpu/drm/radeon/radeon_i2c.c           | 14 ++++----
 drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
 drivers/i2c/algos/i2c-algo-bit.c              | 12 +++----
 drivers/infiniband/hw/hfi1/chip.c             |  6 ++--
 drivers/infiniband/hw/hfi1/chip.h             |  2 +-
 drivers/infiniband/hw/hfi1/chip_registers.h   |  2 +-
 drivers/infiniband/hw/hfi1/file_ops.c         |  2 +-
 drivers/infiniband/hw/hfi1/firmware.c         | 22 ++++++------
 drivers/infiniband/hw/hfi1/pcie.c             |  2 +-
 drivers/infiniband/hw/hfi1/qsfp.c             | 36 +++++++++----------
 drivers/infiniband/hw/hfi1/user_exp_rcv.c     |  2 +-
 drivers/infiniband/hw/qib/qib_twsi.c          |  6 ++--
 drivers/media/pci/bt8xx/bttv-i2c.c            |  2 +-
 drivers/media/pci/cobalt/cobalt-i2c.c         |  8 ++---
 drivers/media/pci/cx18/cx18-av-firmware.c     |  8 ++---
 drivers/media/pci/cx18/cx18-cards.c           |  6 ++--
 drivers/media/pci/cx18/cx18-cards.h           |  4 +--
 drivers/media/pci/cx18/cx18-gpio.c            |  6 ++--
 drivers/media/pci/cx23885/cx23885-f300.c      |  8 ++---
 drivers/media/pci/cx23885/cx23885-i2c.c       |  8 ++---
 drivers/media/pci/cx25821/cx25821-i2c.c       |  8 ++---
 drivers/media/pci/dm1105/dm1105.c             |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c             | 18 +++++-----
 drivers/media/pci/saa7164/saa7164-i2c.c       |  2 +-
 drivers/media/usb/au0828/au0828-i2c.c         |  6 ++--
 drivers/media/usb/au0828/au0828-input.c       |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c      |  2 +-
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c     |  2 +-
 drivers/video/fbdev/smscufx.c                 |  4 +--
 drivers/video/fbdev/via/chip.h                |  8 ++---
 drivers/video/fbdev/via/dvi.c                 | 24 ++++++-------
 drivers/video/fbdev/via/lcd.c                 |  6 ++--
 drivers/video/fbdev/via/via_aux.h             |  2 +-
 drivers/video/fbdev/via/via_i2c.c             | 12 +++----
 drivers/video/fbdev/via/vt1636.c              |  6 ++--
 94 files changed, 381 insertions(+), 381 deletions(-)

-- 
2.34.1

