Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE0B5FD9A6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 14:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C73210E21C;
	Thu, 13 Oct 2022 12:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27B010E21C;
 Thu, 13 Oct 2022 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665665786; x=1697201786;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=q8cQ1DwGd87RaS6pzGDydRuwXbxbSDcDIQbnbnxaZ3c=;
 b=DvrMnk5mDvQ3eu5oU2ZQv5/f8PXfjibdkD+6U0jj6Vb750qMllKskvv8
 The+lDjc0xTpyX0yyP08xD5DCaS1rUM4Y2lWy8lhfpYyMJ3fAoW+ea4wG
 r0K8ScAznq1gi2BU1psDoMlI7Qd3zeXIhmAVb+dPd3N6bfm4hM7LPV6LN
 PbP+oqHEZoLK4pthq5N24psOuQG76dDuxFrr5f56Y3gu7HvtjhUMKq12w
 SwgzZN6jQzs80Qu+x/yQyVfwbaT7oX2GRaU5OSCJEcSjt3zreTVACK/tq
 W6eKXw3tftKbt2Bjt6Sr1ARkMdwk2Jbhk4+vkHYpJ6J5OR+5xGV0fbeUH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="331574442"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="331574442"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 05:56:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="769606984"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="769606984"
Received: from mpower1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.212.156])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 05:56:23 -0700
Date: Thu, 13 Oct 2022 13:56:21 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Y0gK9QmCmktLLzqp@tursulin-desk>
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

Hi Dave, Daniel,

Not sure if there is time for one more pull during the merge window, but
in case there is here it is. Only one which affects platforms outside
force_probe and that is the fix for DPT PTE corruption after resume. The
rest are all DG2 specific.

Regards,

Tvrtko

drm-intel-next-fixes-2022-10-13:
- Fix revocation of non-persistent contexts (Tvrtko Ursulin)
- Handle migration for dpt (Matthew Auld)
- Fix display problems after resume (Thomas Hellström)
- Allow control over the flags when migrating (Matthew Auld)
- Consider DG2_RC_CCS_CC when migrating buffers (Matthew Auld)
The following changes since commit cdf6428dd518435a05739abf7659589de30970f4:

  drm/i915: Reject excessive dotclocks early (2022-10-03 17:55:32 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-10-13

for you to fetch changes up to ea19684afb545605bbcb690c49a91ce2c8e596dd:

  drm/i915/display: consider DG2_RC_CCS_CC when migrating buffers (2022-10-11 17:29:05 +0100)

----------------------------------------------------------------
- Fix revocation of non-persistent contexts (Tvrtko Ursulin)
- Handle migration for dpt (Matthew Auld)
- Fix display problems after resume (Thomas Hellström)
- Allow control over the flags when migrating (Matthew Auld)
- Consider DG2_RC_CCS_CC when migrating buffers (Matthew Auld)

----------------------------------------------------------------
Matthew Auld (3):
      drm/i915/display: handle migration for dpt
      drm/i915: allow control over the flags when migrating
      drm/i915/display: consider DG2_RC_CCS_CC when migrating buffers

Thomas Hellström (1):
      drm/i915: Fix display problems after resume

Tvrtko Ursulin (1):
      drm/i915/guc: Fix revocation of non-persistent contexts

 drivers/gpu/drm/i915/display/intel_fb_pin.c       | 62 ++++++++++++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_context.c       |  8 +--
 drivers/gpu/drm/i915/gem/i915_gem_object.c        | 37 +++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h        |  4 ++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c           |  5 +-
 drivers/gpu/drm/i915/gt/intel_context.c           |  5 +-
 drivers/gpu/drm/i915/gt/intel_context.h           |  3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c              |  8 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +++++-----
 10 files changed, 113 insertions(+), 48 deletions(-)
