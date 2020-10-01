Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C728096F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 23:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9586E226;
	Thu,  1 Oct 2020 21:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299C06E226;
 Thu,  1 Oct 2020 21:32:34 +0000 (UTC)
IronPort-SDR: P7V1femI1OUkFbE9+ztBsj0lhOpD7xc0s5jLKHdetrYnIBIodwGNlVgzGg9a/ffeRMUQiv2biH
 Z7t9uUlYonVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="226968560"
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="226968560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 14:32:31 -0700
IronPort-SDR: cpA11V1tub7YOvO2NuPc5SPAytr+rWIB2z410tLoh3dvVTI8BYGrSS8gBUYR+mNdAO+vikiMx3
 oe9Ac+e7+9CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="339714746"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 14:32:28 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 james.ausmus@intel.com, matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Subject: [PATCH v3 0/2] drm/i915/jsl: Update JSL Voltage swing table
Date: Fri,  2 Oct 2020 02:54:33 +0530
Message-Id: <20201001212435.269840-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch series covers following thigns:

1. Split and differentiate between EHL and JSL platfrom
2. Update voltage swing table for eDP on JSL platform

Changes since V2 :
	- Added IS_EHL_JSL to replace IS_ELKHARTLAKE
	- EHL/JSL PCI ids split added
	- Rebased to drm master commit
Changes since V1 :
        - IS_ELKHARTLAKE and IS_JASPERLAKE is replaced with
          HAS_PCH_MCC(EHL) and HAS_PCH_JSP(JSL) respectively
        - Reverted EHL/JSL PCI ids split change

Tejas Upadhyay (2):
  drm/i915/jsl: Split EHL/JSL platform info and PCI ids
  drm/i915/edp/jsl: Update vswing table for HBR and HBR2

 drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 95 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 16 ++--
 drivers/gpu/drm/i915/gt/intel_sseu.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  5 +-
 drivers/gpu/drm/i915/i915_pci.c               |  9 ++
 drivers/gpu/drm/i915/intel_device_info.c      |  1 +
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 drivers/gpu/drm/i915/intel_pch.c              |  6 +-
 include/drm/i915_pciids.h                     |  9 +-
 15 files changed, 134 insertions(+), 36 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
