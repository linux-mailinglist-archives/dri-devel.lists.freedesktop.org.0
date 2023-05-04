Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399006F6C88
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 15:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4474A10E500;
	Thu,  4 May 2023 13:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AB010E4AD;
 Thu,  4 May 2023 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683205276; x=1714741276;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=3J58zSri10ncu9Xj/OsgRj91xUKLMIrMXcPfvxTn/6Y=;
 b=GW3feksJGFnVIua16ZxfLaTr/UbxSD0aRham8uPn/a0Xym22Wprcv4Gd
 MmqLGXoY0D5B/hA/msFQHcxEeYu5dRUliIQUgMtkJTmTXrSJt0xvVnzcX
 57H/WQfc1+0fpm84eJIl90aR/HkGYQIVv6tH9/vpA7/E3nC+8EvVC0i80
 948fkc6eq5CBumk00XD7shYsL6W7i7vn8ZxHMVCCRkNfSzFmkkTNJ6hLx
 c7yroCF303S35H5MMm0QUwkfKCfsRwoSNGvl+/BhKqf1np/puDRQkPJ8k
 TFxjk/i2M7QzthwSx0u3sz/jyCT0rlZWYuy0mwNxoZjf53vO5YFkKiu6Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412108547"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="412108547"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="691124884"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="691124884"
Received: from saviv1-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.18.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:01:08 -0700
Date: Thu, 4 May 2023 16:01:05 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZFOskabVuN45dNaA@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave & Daniel,

One Cc stable DSI sequence fix and missing CPU transcoders for MTL plus
a smaller GuC cornern case fix.

Best Regards, Joonas

***

drm-intel-next-fixes-2023-05-04-1:

Add missing GPU transcoder masks for MTL and fix DSI power on sequence
for Nextbook Ares 8A. Fix GuC version corner case.

The following changes since commit 2c69679626d5daa680d71c77ad58af0088db537f:

  drm/i915/dp_mst: Fix active port PLL selection for secondary MST streams (2023-04-19 17:25:29 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-05-04-1

for you to fetch changes up to c8c2969bfcba5fcba3a5b078315c1b586d927d9f:

  drm/i915/dsi: Use unconditional msleep() instead of intel_dsi_msleep() (2023-05-03 08:31:24 +0300)

----------------------------------------------------------------
Add missing GPU transcoder masks for MTL and fix DSI power on sequence
for Nextbook Ares 8A. Fix GuC version corner case.

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/dsi: Use unconditional msleep() instead of intel_dsi_msleep()

John Harrison (1):
      drm/i915/guc: Actually return an error if GuC version range check fails

Radhakrishna Sripada (1):
      drm/i915/mtl: Add the missing CPU transcoder mask in intel_device_info

Ville Syrjälä (1):
      drm/i915: Check pipe source size when using skl+ scalers

 drivers/gpu/drm/i915/display/icl_dsi.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 11 -----------
 drivers/gpu/drm/i915/display/intel_dsi_vbt.h |  1 -
 drivers/gpu/drm/i915/display/skl_scaler.c    | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 22 +++++-----------------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     | 20 ++++++++++++--------
 drivers/gpu/drm/i915/i915_pci.c              |  2 ++
 7 files changed, 37 insertions(+), 38 deletions(-)
