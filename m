Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E059914F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA0E10E0F5;
	Thu, 18 Aug 2022 23:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E6910E2ED;
 Thu, 18 Aug 2022 23:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866149; x=1692402149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eV0E4jkfNL69I9vzKY4E5A1pzBOP/qxSlpjyuDG2a/g=;
 b=A7JM76hHq/g+Wfv1ZyAqiE0mUZq5GxVomyGvXHDPTerTquc9bBsNmV1a
 UkHQ1yu5kF5c/5hnRf0wI2u02EJNKfT4bc0T8OHnqy1FjONuO2AjMe9D3
 Qf2puY+mafi35QrPfF66P6j7y3m3oKfVkcvPSS5eEUWpGg5qCPHKNfXRr
 8eSRileE4+UDkV0aNtD8Xn43RwNLaUBFvq+fWE1ptUp2n4yg1zj8oOFrH
 qFUD/cCbPLcunbbtMhFXqhFMLsP/okEHEyIdgaiqwpQzKjmZB1VnazVEQ
 2jpk/1+eT6McmVY7pgbXAA7mHcZq0N+f2ph34O5SvTTiXA0kGa9O1MmJS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938509"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938509"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953282"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/21] Initial Meteorlake Support
Date: Thu, 18 Aug 2022 16:41:41 -0700
Message-Id: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PCI Id's and platform definition are posted earlier.
This series adds handful of early enablement patches including
support for display power wells, VBT and AUX Channel mapping,
PCH and gmbus support, dbus, mbus, sagv and memory bandwidth support.

This series also add the support for a new way to read Graphics,
Media and Display versions. 

Clint Taylor (1):
  drm/i915/mtl: Fix rawclk for Meteorlake PCH

Imre Deak (3):
  drm/i915/mtl: Add VBT port and AUX_CH mapping
  drm/i915/mtl: Add display power wells
  drm/i915/mtl: Add DP AUX support on TypeC ports

José Roberto de Souza (2):
  drm/i915: Parse and set stepping for platforms with GMD
  drm/i915/display/mtl: Extend MBUS programming

Madhumitha Tolakanahalli Pradeep (1):
  drm/i915/mtl: Update CHICKEN_TRANS* register addresses

Matt Roper (4):
  drm/i915: Read graphics/media/display arch version from hw
  drm/i915/mtl: MMIO range is now 4MB
  drm/i915/mtl: Don't mask off CCS according to DSS fusing
  drm/i915/mtl: Define engine context layouts

Radhakrishna Sripada (10):
  drm/i915/mtl: Add PCH support
  drm/i915/mtl: Add gmbus and gpio support
  drm/i915/mtl: Add support for MTL in Display Init sequences
  drm/i915: Extract wm latency adjustment to its own function
  drm/i915/mtl: memory latency data from LATENCY_LPX_LPY for WM
  drm/i915/mtl: Obtain SAGV values from MMIO instead of GT pcode mailbox
  drm/i915/mtl: Update memory bandwidth parameters
  drm/i915/mtl: Update MBUS_DBOX credits
  drm/i915/mtl: Reuse adl-p DBUF calculations
  drm/i915/mtl: Do not update GV point, mask value

 drivers/gpu/drm/i915/display/intel_bios.c     |  14 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  82 +++++++-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  14 +-
 .../drm/i915/display/intel_display_power.c    |   5 +-
 .../i915/display/intel_display_power_map.c    | 115 ++++++++++-
 .../i915/display/intel_display_power_well.c   |  44 +++++
 .../i915/display/intel_display_power_well.h   |   4 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |  53 +++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   5 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  17 ++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |   1 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   6 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  47 ++++-
 drivers/gpu/drm/i915/i915_driver.c            |  80 +++++++-
 drivers/gpu/drm/i915/i915_drv.h               |  18 +-
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/i915_reg.h               |  91 ++++++++-
 drivers/gpu/drm/i915/intel_device_info.c      |  32 ++--
 drivers/gpu/drm/i915/intel_device_info.h      |  14 ++
 drivers/gpu/drm/i915/intel_dram.c             |  41 +++-
 drivers/gpu/drm/i915/intel_pch.c              |   9 +-
 drivers/gpu/drm/i915/intel_pch.h              |   4 +
 drivers/gpu/drm/i915/intel_pm.c               | 180 +++++++++++++-----
 drivers/gpu/drm/i915/intel_step.c             |  60 ++++++
 drivers/gpu/drm/i915/intel_uncore.c           |  11 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   1 +
 29 files changed, 848 insertions(+), 112 deletions(-)

-- 
2.25.1

