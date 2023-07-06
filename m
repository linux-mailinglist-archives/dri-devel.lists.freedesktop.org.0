Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1CC749770
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 10:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E508010E475;
	Thu,  6 Jul 2023 08:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8D10E473;
 Thu,  6 Jul 2023 08:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688631899; x=1720167899;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=OsGmHaR/5g8kc4cXhdJcJfObUwVgdzNtkM/QGVAF1MY=;
 b=LDxcNOTfe1tt7jIXER774zw7dMzoj9z5RgxDIhZ5dS1lGVShAvHHFaBx
 mPC3S3rS63Cog2qo1R2yVruDlwsa1s7p0tqbZhS6S7apxauY0fjewETZJ
 dDVxy1CeUlnCYQKDKFezgj9juoQbi91dCIdOzB2GyTkSvr/V288HHAHjq
 ANlR7s6ylq7qIH9JVbAvkOSZZWSZdeAPY+S9wijqAaxpouiiSTONQ4cxB
 JwfjxRKpFZXU71YSHU/hYAzHP6qIegCWxfJK18sZn/N2nkgSvWwZ9UZc1
 K3/Ykn99jJHpR4Nf6nqQqCyuYyhEfqZ7Lfj4cYV0d53kJC/6A0jCaWzUV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429583973"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="429583973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 01:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="864019242"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="864019242"
Received: from dnatta1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.201.247])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 01:24:55 -0700
Date: Thu, 6 Jul 2023 09:24:52 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZKZ6VIeInBYrBuph@tursulin-desk>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A weekly collection of fixes for the drm-next/6.5 merge window.

Mostly small display fixups, one for GuC/SLPC and one header file tidy.

I see last week did not get pulled so this week contains those ones plus
two more fixups - one code tidy actually and one fixup.

Regards,

Tvrtko

drm-intel-next-fixes-2023-06-29:
- Allow DC states along with PW2 only for PWB functionality [adlp+] (Imre Deak)
- Fix SSC selection for MPLLA [mtl] (Radhakrishna Sripada)
- Use hw.adjusted mode when calculating io/fast wake times [psr] (Jouni Högander)
- Apply min softlimit correctly [guc/slpc] (Vinay Belgaumkar)
- Assign correct hdcp content type [hdcp] (Suraj Kandpal)
- Add missing forward declarations/includes to display power headers (Imre Deak)

drm-intel-next-fixes-2023-07-06:
- Fix BDW PSR AUX CH data register offsets [psr] (Ville Syrjälä)
- Use mock device info for creating mock device (Jani Nikula)
The following changes since commit 274d4b96b12f78cef4f72a97a4967032233f6cae:

  drm/i915: Fix a NULL vs IS_ERR() bug (2023-06-20 08:54:47 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-07-06

for you to fetch changes up to f6cf3883df471abbcf1553127681dc244c8ff8dd:

  drm/i915: use mock device info for creating mock device (2023-07-04 10:40:29 +0100)

----------------------------------------------------------------
drm-intel-next-fixes-2023-06-29:
- Allow DC states along with PW2 only for PWB functionality [adlp+] (Imre Deak)
- Fix SSC selection for MPLLA [mtl] (Radhakrishna Sripada)
- Use hw.adjusted mode when calculating io/fast wake times [psr] (Jouni Högander)
- Apply min softlimit correctly [guc/slpc] (Vinay Belgaumkar)
- Assign correct hdcp content type [hdcp] (Suraj Kandpal)
- Add missing forward declarations/includes to display power headers (Imre Deak)

drm-intel-next-fixes-2023-07-06:
- Fix BDW PSR AUX CH data register offsets [psr] (Ville Syrjälä)
- Use mock device info for creating mock device (Jani Nikula)

----------------------------------------------------------------
Imre Deak (2):
      drm/i915/adlp+: Allow DC states along with PW2 only for PWB functionality
      drm/i915: Add missing forward declarations/includes to display power headers

Jani Nikula (1):
      drm/i915: use mock device info for creating mock device

Jouni Högander (1):
      drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake times

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix SSC selection for MPLLA

Suraj Kandpal (1):
      drm/i915/hdcp: Assign correct hdcp content type

Ville Syrjälä (1):
      drm/i915/psr: Fix BDW PSR AUX CH data register offsets

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Apply min softlimit correctly

 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  3 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |  4 ++
 .../gpu/drm/i915/display/intel_display_power_map.c | 16 ++++----
 .../drm/i915/display/intel_display_power_well.h    |  2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  4 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   | 45 ++++++++++++----------
 9 files changed, 45 insertions(+), 35 deletions(-)
