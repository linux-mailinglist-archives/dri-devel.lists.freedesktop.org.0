Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCE63EB7E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02310E574;
	Thu,  1 Dec 2022 08:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852AB10E573;
 Thu,  1 Dec 2022 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669884432; x=1701420432;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=fyWsC3rPUetbJLO6tv5cesZTzlnzLpF97GPCWE8fJO0=;
 b=IcASCaPuq7Dk5ajSHXK7vuKmJA5feBMT80mnyj5Jm2lC47EYFqrSmm37
 ZOe/Weiu8c7YrPz7p31MHtL153FfmrWkRM/ydQIyoY3NA6+sxqquNKtqw
 U5M9py+C0fhjkgTGJn5uZ+jxWTzgobPvNGK2fpoJ6M4ogilwoS4UXBjQ0
 CrstakwNjcCFSnHgTMv26fxyPykSiDNGo/628ts/vLFhu+2l+e3d26gad
 qZDjnYq/IA1eMS8NgDqR9qZk4D4IOYytkDHprKMun2v2rTV0tG1+8mskv
 wF4pcgifD5euM7G8ub1PJwArOKv/VajRBzI6KTdiJusci2ArxwNkFTxWF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="342554239"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="342554239"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 00:46:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="646676999"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="646676999"
Received: from aguefor-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.229.22])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 00:46:51 -0800
Date: Thu, 1 Dec 2022 08:46:49 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y4hp+a3TJ13t2ZA1@tursulin-desk>
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

A few more small fixes for the release candidate week.

Fixes for confused return values when waiting on request retirement, which
can explode in the GuC backend, fix for reading on DRAM info data and a
fix to filter out impossible display pipes from the bigjoiner code.

Regards,

Tvrtko

drm-intel-fixes-2022-12-01:
- Fix dram info readout (Radhakrishna Sripada)
- Remove non-existent pipes from bigjoiner pipe mask (Ville Syrjälä)
- Fix negative value passed as remaining time (Janusz Krzysztofik)
- Never return 0 if not all requests retired (Janusz Krzysztofik)
The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-12-01

for you to fetch changes up to 12b8b046e4c9de40fa59b6f067d6826f4e688f68:

  drm/i915: Never return 0 if not all requests retired (2022-11-29 08:49:15 +0000)

----------------------------------------------------------------
- Fix dram info readout (Radhakrishna Sripada)
- Remove non-existent pipes from bigjoiner pipe mask (Ville Syrjälä)
- Fix negative value passed as remaining time (Janusz Krzysztofik)
- Never return 0 if not all requests retired (Janusz Krzysztofik)

----------------------------------------------------------------
Janusz Krzysztofik (2):
      drm/i915: Fix negative value passed as remaining time
      drm/i915: Never return 0 if not all requests retired

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix dram info readout

Ville Syrjälä (1):
      drm/i915: Remove non-existent pipes from bigjoiner pipe mask

 drivers/gpu/drm/i915/display/intel_display.c | 10 +++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c           |  9 +++++++--
 drivers/gpu/drm/i915/gt/intel_gt_requests.c  |  2 +-
 drivers/gpu/drm/i915/intel_dram.c            |  3 +--
 4 files changed, 16 insertions(+), 8 deletions(-)
