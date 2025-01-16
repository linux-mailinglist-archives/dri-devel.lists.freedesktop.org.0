Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143FA142B9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 21:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6643310E9F4;
	Thu, 16 Jan 2025 20:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn8S4bRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF12C10E22D;
 Thu, 16 Jan 2025 20:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737057784; x=1768593784;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=D0pi96GtS0YTXJVodQd3dKmPd1Nx2xamjqLflmmjzR8=;
 b=Qn8S4bRJV9DyPkStBrQ3PnWXA09ZjRsZwK3oLBEDLELTRZyYqaq8+bN/
 0LfmqMRrZf02GT6ECsx19ERoRgnuCDa+4VcnMCyv3PnrCgVAgS3cWJtyS
 1UuJgtBmKQuKTV6JiSXw1C3nDufZgQxk/m0nhxdLuWb/OmdQTxpZNorpj
 FSj2XM9BrAUVV5eYcj0ea20DdWXXW206q1jdI3tG2HCNGi1zoGy97rL6h
 qmTeVnkvvwMXDKnH+OD8dpPJ0KhzsBsNQIquMqUX7N2vn0xFKWPTM5mOt
 lcC6rNWcLtEKTX1ZMfDA+iijDb8SNcrIVpLjIogB3jEMa5SEMEZeGlMnn w==;
X-CSE-ConnectionGUID: XdIhpU0TQYC/HByQQmOIfw==
X-CSE-MsgGUID: X6yQw7QLSkKnNqUzSTa+sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37348741"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37348741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 12:03:04 -0800
X-CSE-ConnectionGUID: 2OIN4ePAQOCvYgiSxbV0Eg==
X-CSE-MsgGUID: BEYQQSGhSxyF2PmD04awLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110226623"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.246.184])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 12:02:59 -0800
Date: Thu, 16 Jan 2025 21:02:36 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <Z4ll3F1anLEwCvrf@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave, Simona!

The hopefully last drm-xe-fixes for 6.13 It's a little bigger than
I was hoping for but nothing that really stands out.

Thanks,
Thomas

drm-xe-fixes-2025-01-16:
Driver Changes:
- Add steering info support for GuC register lists (Jesus Narvaez)
- Add means to wait for reset and synchronous reset (Maciej)
- Make changing ccs_mode a synchronous action (Maciej)
- Add missing mux registers (Ashutosh)
- Mark ComputeCS read mode as UC on iGPU, unblocking ULLS on iGPU (Matt Brost)
The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-01-16

for you to fetch changes up to b1231ff7ea0689d04040a44864c265bc11612fa8:

  drm/xe: Mark ComputeCS read mode as UC on iGPU (2025-01-16 20:03:11 +0100)

----------------------------------------------------------------
Driver Changes:
- Add steering info support for GuC register lists (Jesus Narvaez)
- Add means to wait for reset and synchronous reset (Maciej)
- Make changing ccs_mode a synchronous action (Maciej)
- Add missing mux registers (Ashutosh)
- Mark ComputeCS read mode as UC on iGPU, unblocking ULLS on iGPU (Matt Brost)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/oa: Add missing VISACTL mux registers

Jesus Narvaez (1):
      drm/xe/guc: Adding steering info support for GuC register lists

Maciej Patelczyk (2):
      drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
      drm/xe: make change ccs_mode a synchronous action

Matthew Brost (1):
      drm/xe: Mark ComputeCS read mode as UC on iGPU

 drivers/gpu/drm/xe/tests/xe_bo.c    |  7 +++----
 drivers/gpu/drm/xe/tests/xe_mocs.c  |  3 +--
 drivers/gpu/drm/xe/xe_gt.h          | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  4 +---
 drivers/gpu/drm/xe/xe_gt_mcr.c      |  6 +++---
 drivers/gpu/drm/xe/xe_gt_mcr.h      |  4 ++++
 drivers/gpu/drm/xe/xe_guc_ads.c     | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c   |  2 +-
 drivers/gpu/drm/xe/xe_oa.c          |  1 +
 10 files changed, 55 insertions(+), 14 deletions(-)
