Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A612B5F6444
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 12:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBD10E3A4;
	Thu,  6 Oct 2022 10:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF0710E358;
 Thu,  6 Oct 2022 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665051542; x=1696587542;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5a56k8AZ0QcKA6I5eVmBR7T6rVNCmc9AVOXa4jaENV8=;
 b=jSw4PI5Klj+JmPKAyi05CbSTgdncJulsQsR48Dw/Ax2/4k6/Rl5znrTA
 SSNEuqRDxF/N9ml4LSqXt3AsjiLvDINuPCtQ9+819m1BxeG6D5gJUj2K6
 jvCheGl2ahKyZtMglsar1dABTM6YhBUVkpsBQxB8RiAjUETiRUkBws83c
 ZU9hbYZrIGCO53OM+6lSCYKnSARChgd4tSL2mti8fRpy443l+sJ47481s
 4z7QbosIO+ndhrs9U5tIDv7Jo2dRRXWshfSDKz0qamWC6eXWS9iCrS8yp
 VwngFxA9CD17UrN8oRhV3uUoryQuGQ/2nsIfWkh1Qx29KVLirviIGaxeE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="283774499"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="283774499"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 03:19:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="729089545"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="729089545"
Received: from nnolan-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.212.51])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 03:18:59 -0700
Date: Thu, 6 Oct 2022 11:18:57 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Yz6rkXI9HKFUvtWK@tursulin-desk>
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

Some fixes for the merge window - one EHL MOCS table fix and the rest is
in the display area around modifier handling and PSR on Gen12+, one fixup
for g4x+ and one fixing recent fastset refactoring.

Regards,

Tvrtko

drm-intel-next-fixes-2022-10-06-1:
- Round to closest in g4x+ HDMI clock readout (Ville Syrjälä)
- Update MOCS table for EHL (Tejas Upadhyay)
- Fix PSR_IMR/IIR field handling (Jouni Högander)
- Fix watermark calculations for gen12+ RC CCS modifier (Ville Syrjälä)
- Fix watermark calculations for gen12+ MC CCS modifier (Ville Syrjälä)
- Fix watermark calculations for gen12+ CCS+CC modifier (Ville Syrjälä)
- Fix watermark calculations for DG2 CCS modifiers (Ville Syrjälä)
- Fix watermark calculations for DG2 CCS+CC modifier (Ville Syrjälä)
- Reject excessive dotclocks early (Ville Syrjälä)
The following changes since commit 20e377e7b2e7c327039f10db80ba5bcc1f6c882d:

  drm/i915/gt: Use i915_vm_put on ppgtt_create error paths (2022-09-27 11:05:33 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-10-06-1

for you to fetch changes up to cdf6428dd518435a05739abf7659589de30970f4:

  drm/i915: Reject excessive dotclocks early (2022-10-03 17:55:32 +0100)

----------------------------------------------------------------
- Round to closest in g4x+ HDMI clock readout (Ville Syrjälä)
- Update MOCS table for EHL (Tejas Upadhyay)
- Fix PSR_IMR/IIR field handling (Jouni Högander)
- Fix watermark calculations for gen12+ RC CCS modifier (Ville Syrjälä)
- Fix watermark calculations for gen12+ MC CCS modifier (Ville Syrjälä)
- Fix watermark calculations for gen12+ CCS+CC modifier (Ville Syrjälä)
- Fix watermark calculations for DG2 CCS modifiers (Ville Syrjälä)
- Fix watermark calculations for DG2 CCS+CC modifier (Ville Syrjälä)
- Reject excessive dotclocks early (Ville Syrjälä)

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/psr: Fix PSR_IMR/IIR field handling

Tejas Upadhyay (1):
      drm/i915/ehl: Update MOCS table for EHL

Ville Syrjälä (7):
      drm/i915: Round to closest in g4x+ HDMI clock readout
      drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
      drm/i915: Fix watermark calculations for DG2 CCS modifiers
      drm/i915: Fix watermark calculations for DG2 CCS+CC modifier
      drm/i915: Reject excessive dotclocks early

 drivers/gpu/drm/i915/display/g4x_hdmi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++
 drivers/gpu/drm/i915/display/intel_psr.c     | 78 +++++++++++++++++-----------
 drivers/gpu/drm/i915/display/skl_watermark.c | 16 +++++-
 drivers/gpu/drm/i915/gt/intel_mocs.c         |  8 +++
 drivers/gpu/drm/i915/i915_reg.h              | 16 ++++--
 6 files changed, 100 insertions(+), 38 deletions(-)
