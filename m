Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7654DC23
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965F10F750;
	Thu, 16 Jun 2022 07:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF910F017;
 Thu, 16 Jun 2022 07:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655365800; x=1686901800;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=E7ceC3mMhkr1LCdJ9nZCXa/6noozbWTZizQmdFBvf10=;
 b=G2TixCNC5dAVk0Gt3IsEpzBiHnDtANgcWM0b9JjQA40ypvqEPQ4J4ken
 EfwOzbn7pbzShGhfRCcXdtd3jUkeHXmA2YagPpQbKDWSPrNBgXI6VSwD3
 OyQjyxqk1CvJeOSqaQ3y0jpQJOKz7D5alV9IAMWSgfq/J7KYm240VWfpr
 Tz2tmezw4tj7sN13yOUqYa35vAIlCY5F83+624KCLtfrpVLhLZrEJfZDe
 7pqkEra1l09lnNBsFm1YFCZfN+PysKS/N3k2CcsB4lWFAb9vqb7oCAT47
 bxW5likBmfjBtB5mBpl+AkBDvvqsgmJgtHZJ/CbPnOU9LP5vBql/+E7l9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259045553"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="259045553"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:49:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="641421889"
Received: from malashi-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.57.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:49:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 16 Jun 2022 10:49:54 +0300
Message-ID: <8735g5xd25.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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


Hi Dave & Daniel -

drm-intel-fixes-2022-06-16:
drm/i915 fixes for v5.19-rc3:
- Fix page fault on error state read
- Fix memory leaks in per-gt sysfs
- Fix multiple fence handling
- Remove accidental static from a local variable

BR,
Jani.

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-06-16

for you to fetch changes up to 2636e008112465ca54559ac4898da5a2515e118a:

  drm/i915/uc: remove accidental static from a local variable (2022-06-13 13:53:35 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.19-rc3:
- Fix page fault on error state read
- Fix memory leaks in per-gt sysfs
- Fix multiple fence handling
- Remove accidental static from a local variable

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/reset: Fix error_state_read ptr + offset use

Ashutosh Dixit (1):
      drm/i915/gt: Fix memory leaks in per-gt sysfs

Jani Nikula (1):
      drm/i915/uc: remove accidental static from a local variable

Nirmoy Das (1):
      drm/i915: Individualize fences before adding to dma_resv obj

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  3 +-
 drivers/gpu/drm/i915/gt/intel_gt.c             |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c       | 29 +++++++---------
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h       |  6 +---
 drivers/gpu/drm/i915/gt/intel_gt_types.h       |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c       |  2 +-
 drivers/gpu/drm/i915/i915_sysfs.c              | 17 +++++++--
 drivers/gpu/drm/i915/i915_vma.c                | 48 +++++++++++++++-----------
 8 files changed, 62 insertions(+), 47 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
