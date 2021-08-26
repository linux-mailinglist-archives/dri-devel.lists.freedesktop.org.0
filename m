Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1003F8D38
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89E36E891;
	Thu, 26 Aug 2021 17:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338B6E88F;
 Thu, 26 Aug 2021 17:42:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217521747"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="217521747"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 10:42:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="465201789"
Received: from fbenmlih-mobile.amr.corp.intel.com (HELO intel.com)
 ([10.255.36.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 10:42:19 -0700
Date: Thu, 26 Aug 2021 13:42:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <YSfSeHbyS5wBZtNJ@intel.com>
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

Hi Dave and Daniel,

I also had other 2 display patches, but I decided to keep them
out for now because CI_DIF_604 returned a bunch of link training
errors on TGL when compared to CI_DIF_603 which is based
on drm/drm-fixes.

Those patches are:
d7f213c131ad ("drm/i915/dp: Use max params for panels < eDP 1.4")
dab1b47e57e0 ("drm/i915/dp: return proper DPRX link training result")

Likely, this second one is the culprit so I will try to keep this out
and try to include the first one, but I'm not sure if CI will return
results in time, so let's try to not be late and propagate the
other 2 good patches below:

Here goes drm-intel-fixes-2021-08-26:

- Fix syncmap memory leak
- Drop redundant display port debug print

Thanks,
Rodrigo.

The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93:

  Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-08-26

for you to fetch changes up to 71de496cc489b6bae2f51f89da7f28849bf2836e:

  drm/i915/dp: Drop redundant debug print (2021-08-26 07:31:52 -0400)

----------------------------------------------------------------
- Fix syncmap memory leak
- Drop redundant display port debug print

----------------------------------------------------------------
Matthew Brost (1):
      drm/i915: Fix syncmap memory leak

Swati Sharma (1):
      drm/i915/dp: Drop redundant debug print

 drivers/gpu/drm/i915/display/intel_dp.c  | 9 ++-------
 drivers/gpu/drm/i915/gt/intel_timeline.c | 9 +++++++++
 2 files changed, 11 insertions(+), 7 deletions(-)
