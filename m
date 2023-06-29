Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1ED74239B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FED910E0DC;
	Thu, 29 Jun 2023 10:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA1A10E0D7;
 Thu, 29 Jun 2023 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688032939; x=1719568939;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=e0GsmxDF/0B70oIffNikdt43opDRvsPxlyK1zw4AqNc=;
 b=CRFzq2qfy6m89MBuG8g9RisrrCgWkus+8OZsCle4gYEXOrm2mw3j4YSh
 v3uB4CXv9r1sc4Ya2iLOmRN3vUF32mF+4B1RqFMfvXwCkyo66blvzk29I
 a7kLY1tj7mg5Hq5uOJ/niNlfey9f05j/hyM9wWLUvLxJzQv1GO9yvKBef
 nx967oDILFhSYs69zabIvxnKiy6QaPMqPBlHQWjij9YXCwX/TsKzQMiQZ
 Xoyh8OMTV0mS4+aquRvvFVUaS/msW4ijh9LuR7533FPWsQbwcsHgRTPxC
 j4WiCbLgk+QStI+lRrwCl9ErfsDhll1Bg8rBMKuD0LlLWiiDptrRYUj2j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425741237"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="425741237"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="667452445"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="667452445"
Received: from coflynn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.199.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:02:15 -0700
Date: Thu, 29 Jun 2023 11:02:13 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZJ1WpY+GF9NcsWXp@tursulin-desk>
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

Regards,

Tvrtko

drm-intel-next-fixes-2023-06-29:
- Allow DC states along with PW2 only for PWB functionality [adlp+] (Imre Deak)
- Fix SSC selection for MPLLA [mtl] (Radhakrishna Sripada)
- Use hw.adjusted mode when calculating io/fast wake times [psr] (Jouni Högander)
- Apply min softlimit correctly [guc/slpc] (Vinay Belgaumkar)
- Assign correct hdcp content type [hdcp] (Suraj Kandpal)
- Add missing forward declarations/includes to display power headers (Imre Deak)
The following changes since commit 274d4b96b12f78cef4f72a97a4967032233f6cae:

  drm/i915: Fix a NULL vs IS_ERR() bug (2023-06-20 08:54:47 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-06-29

for you to fetch changes up to 5b7826355e5b9f48eea29275215fc55165cd17c3:

  drm/i915: Add missing forward declarations/includes to display power headers (2023-06-27 09:48:17 +0100)

----------------------------------------------------------------
- Allow DC states along with PW2 only for PWB functionality [adlp+] (Imre Deak)
- Fix SSC selection for MPLLA [mtl] (Radhakrishna Sripada)
- Use hw.adjusted mode when calculating io/fast wake times [psr] (Jouni Högander)
- Apply min softlimit correctly [guc/slpc] (Vinay Belgaumkar)
- Assign correct hdcp content type [hdcp] (Suraj Kandpal)
- Add missing forward declarations/includes to display power headers (Imre Deak)

----------------------------------------------------------------
Imre Deak (2):
      drm/i915/adlp+: Allow DC states along with PW2 only for PWB functionality
      drm/i915: Add missing forward declarations/includes to display power headers

Jouni Högander (1):
      drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake times

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix SSC selection for MPLLA

Suraj Kandpal (1):
      drm/i915/hdcp: Assign correct hdcp content type

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Apply min softlimit correctly

 drivers/gpu/drm/i915/display/intel_cx0_phy.c            |  3 ++-
 drivers/gpu/drm/i915/display/intel_display_power.h      |  4 ++++
 drivers/gpu/drm/i915/display/intel_display_power_map.c  | 16 ++++++++--------
 drivers/gpu/drm/i915/display/intel_display_power_well.h |  2 ++
 drivers/gpu/drm/i915/display/intel_hdcp.c               |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c                |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c             |  2 +-
 7 files changed, 20 insertions(+), 13 deletions(-)
