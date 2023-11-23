Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15B7F6402
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 17:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9560410E76C;
	Thu, 23 Nov 2023 16:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD20710E08B;
 Thu, 23 Nov 2023 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700757256; x=1732293256;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xill+ncGnJ1sIrcKvawmuAds9qveAxO/RramVec06P0=;
 b=JsyQ5z0mpZG3+2NvMRJNbKeAZ4WuKz3dg72abNp23JdQc+aQfp/r9i78
 XTiuZENtBQjCLabQAUni/5oD71vJeGkTTuCyF8DMDa9AQqbdWMPWt8Kg8
 MwG4eo2mN4yuiiBDOoRD8BMSXbedi8Tzz+Zq0DRo9m+EjBGtmFcjduBfs
 1afba6HLMxlgwVoVcTs1/11Z2JqMi2NzmPIKRZyYrA6jH0IsfIWcTxCT6
 khyJMBZo+1S1aAgtuGGFxnpi/1asqQ2j2CBBUkYRk+HdYJ/E20EZH+SIv
 u5REBqy6xq/9lG54oN4ztb5n8wAN+a54YY1uikot+UwQNamOaHTH24vbl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456630054"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="456630054"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 08:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014669079"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="1014669079"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 08:34:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 23 Nov 2023 18:34:06 +0200
Message-ID: <87y1eol98h.fsf@intel.com>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

drm-intel-fixes-2023-11-23:
drm/i915 fixes for v6.7-rc3:
- Fix race between DP MST connectore registration and setup
- Fix GT memory leak on probe error path

BR,
Jani.

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-11-23

for you to fetch changes up to 0561794b6b642b84b879bf97061c4b4fa692839e:

  drm/i915: do not clean GT table on error path (2023-11-20 11:06:53 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc3:
- Fix race between DP MST connectore registration and setup
- Fix GT memory leak on probe error path

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915: do not clean GT table on error path

Imre Deak (1):
      drm/i915/dp_mst: Fix race between connector registration and setup

 drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 ++++++++--------
 drivers/gpu/drm/i915/gt/intel_gt.c          | 11 -----------
 drivers/gpu/drm/i915/i915_driver.c          |  4 +---
 3 files changed, 9 insertions(+), 22 deletions(-)

-- 
Jani Nikula, Intel
