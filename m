Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FA6E8C5F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19E510EBD6;
	Thu, 20 Apr 2023 08:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7B910EBD8;
 Thu, 20 Apr 2023 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681978364; x=1713514364;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=/ecep8f5OfKmzJrbDvKywx/YKgPmComjlAdnqMVrZuM=;
 b=m9fStrwuo8+FWVtFSFOqxFj5vuylglSu0o9rSdGOWsOymg2vn9+JXyhI
 W2vxZt0jzvi+oRQqt1HfSpGLXUtFqcY3ZrFNFDaFOBzcJGeoABnG406Mq
 iY38IurbRaWGDufmOghY84LY2N1kYTnW2p1f4r3sFRIxeQFb2NlqLBFZc
 jvQSD8RzWppFms5KTeKw3XZNAttJ23vOljF3A/EKruqcXNxh9Pelhc3jO
 zkpF63LnYPvm5YR+J/xqQ/bKl5jhKiuG6wq802H4ukinQeiOWVBnP/LI+
 p5yx4bD0LDR66RhGEXpOoOl5z0UFg0e53O0ynx05pSkYOjh44BuPTGGqe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431947312"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="431947312"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 01:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691810211"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="691810211"
Received: from mmoran1-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.30.212])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 01:12:39 -0700
Date: Thu, 20 Apr 2023 11:12:37 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZEDz9ZedyZVyFXxU@jlahtine-mobl.ger.corp.intel.com>
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

Here's another drm-intel-next-fixes pull request.

One Cc stable CSC plane index fix, then MST PLL fix and smaller
null/oob/leak fixes.

Regards, Joonas

***

drm-intel-next-fixes-2023-04-20-1:

Active port PLL MST fix for second stream, CSC plane index fix,
null and oob array deref fixes and selftest memory leak fix.

The following changes since commit 81900e3a37750d8c6ad705045310e002f6dd0356:

  drm/i915: disable sampler indirect state in bindless heap (2023-04-12 11:36:09 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2023-04-20-1

for you to fetch changes up to 2c69679626d5daa680d71c77ad58af0088db537f:

  drm/i915/dp_mst: Fix active port PLL selection for secondary MST streams (2023-04-19 17:25:29 +0300)

----------------------------------------------------------------
Active port PLL MST fix for second stream, CSC plane index fix,
null and oob array deref fixes and selftest memory leak fix.

----------------------------------------------------------------
Chaitanya Kumar Borah (1):
      drm/i915/color: Fix typo for Plane CSC indexes

Cong Liu (1):
      drm/i915: Fix memory leaks in i915 selftests

Imre Deak (1):
      drm/i915/dp_mst: Fix active port PLL selection for secondary MST streams

Lucas De Marchi (1):
      drm/i915/gt: Avoid out-of-bounds access when loading HuC

Ville Syrjälä (1):
      drm/i915: Make intel_get_crtc_new_encoder() less oopsy

 drivers/gpu/drm/i915/display/intel_ddi.c      | 27 ++++++++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_ddi.h      |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  7 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 21 +++++++++++++++++----
 drivers/gpu/drm/i915/i915_reg.h               |  4 ++--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +++-
 7 files changed, 53 insertions(+), 15 deletions(-)
