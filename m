Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C5210BFF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 15:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3999D6E8D7;
	Wed,  1 Jul 2020 13:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751D36E8CB;
 Wed,  1 Jul 2020 13:19:28 +0000 (UTC)
IronPort-SDR: JvFn6xtZeZqojy0vXlZCIp+wqtoRIytR4EE/Y4y5olIYZEdqdSFZ4Dn/ODbR1jiYdMuKl9dMS7
 /npQUPE3344w==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="208065209"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="208065209"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 06:19:27 -0700
IronPort-SDR: RFL7UQgGLmhdaFyGj5vAh2UK0kTTRsEpEBSXmd7Ln+PULBPC4XHkJYGmcCzbpr13rJq36dvBNZ
 CS5sCvdc1p3Q==
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="455100493"
Received: from gaulion-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.51.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 06:19:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 01 Jul 2020 16:19:21 +0300
Message-ID: <87imf7l6ee.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Pretty quiet in the i915 front.

drm-intel-fixes-2020-07-01:
drm/i915 fixes for v5.8-rc4:
- GVT fixes
- Include asm sources for render cache clear batches

BR,
Jani.

The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-07-01

for you to fetch changes up to 55fd7e0222ea01246ef3e6aae28b5721fdfb790f:

  drm/i915: Include asm sources for {ivb, hsw}_clear_kernel.c (2020-06-29 11:29:12 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.8-rc4:
- GVT fixes
- Include asm sources for render cache clear batches

----------------------------------------------------------------
Colin Xu (4):
      drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
      drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
      drm/i915/gvt: Fix incorrect check of enabled bits in mask registers
      drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context

Jani Nikula (1):
      Merge tag 'gvt-fixes-2020-06-17' of https://github.com/intel/gvt-linux into drm-intel-fixes

Rodrigo Vivi (1):
      drm/i915: Include asm sources for {ivb, hsw}_clear_kernel.c

 drivers/gpu/drm/i915/gt/shaders/README             |  46 ++++++++
 .../gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm   | 119 +++++++++++++++++++++
 .../gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm   | 117 ++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/debugfs.c                 |   2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  24 +++--
 drivers/gpu/drm/i915/gvt/mmio_context.h            |   6 +-
 drivers/gpu/drm/i915/gvt/reg.h                     |   5 +
 7 files changed, 304 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/shaders/README
 create mode 100644 drivers/gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm
 create mode 100644 drivers/gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
