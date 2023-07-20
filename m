Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3A75A908
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151F910E579;
	Thu, 20 Jul 2023 08:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9481C10E15F;
 Thu, 20 Jul 2023 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689841353; x=1721377353;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=7UzzN+U/lMPTyEWQ8kTAVRXl3ApP9uzHZfl3Ijoj16M=;
 b=UgSpB2Dz7BoidSHFE7OT4lrohUYM4Fa4CbSJZhjHxPrf5/dYSUX9C7DB
 p0uGnRx390cWOOIj4kCWmVLqC2B9NKKZmVZIaT6x3uIOLbldz5hRemTlV
 KLqrkuoPikf5kWzF9LzyrOJbf8DkDuH1AzCpKNHEKYBxsyjzLCLII23yB
 0ZxhAQQcj6OJWggwP0U+ACiU2qVuXFr6S2MLWm0cb2eVW2O7QoPmZ+L5P
 jpSDgpkT5Lhj4sXW0Q6xfwEoYOtv+lWioA0yqPeFwIjc1dYJIw4Ax47pH
 SVc5yzSW05yoEVw2EotWN+oI1ZFudfNzf01S/0HQ531cY4uG4wGV8jAGp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430438959"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430438959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753988264"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="753988264"
Received: from ctuohy-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.193.21])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:22:28 -0700
Date: Thu, 20 Jul 2023 09:22:26 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZLjuwhLhwab5B7RY@tursulin-desk>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Only two fixes for the 6.5 rc window this week - one perf/OA use after
free on Xe_HP platforms and one defconfig build fix for GCC versions older
than 8.

Regards,

Tvrtko

drm-intel-fixes-2023-07-20:
- Add sentinel to xehp_oa_b_counters [perf] (Andrzej Hajda)
- Revert "drm/i915: use localized __diag_ignore_all() instead of per file" (Jani Nikula)
The following changes since commit fdf0eaf11452d72945af31804e2a1048ee1b574c:

  Linux 6.5-rc2 (2023-07-16 15:10:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-07-20

for you to fetch changes up to 2c27770a7bc88ef7f6614d11d96d8e62017d0b78:

  Revert "drm/i915: use localized __diag_ignore_all() instead of per file" (2023-07-17 13:39:04 +0100)

----------------------------------------------------------------
- Add sentinel to xehp_oa_b_counters [perf] (Andrzej Hajda)
- Revert "drm/i915: use localized __diag_ignore_all() instead of per file" (Jani Nikula)

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915/perf: add sentinel to xehp_oa_b_counters

Jani Nikula (1):
      Revert "drm/i915: use localized __diag_ignore_all() instead of per file"

 drivers/gpu/drm/i915/Makefile                       | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_device.c | 5 -----
 drivers/gpu/drm/i915/display/intel_fbdev.c          | 5 -----
 drivers/gpu/drm/i915/i915_pci.c                     | 5 -----
 drivers/gpu/drm/i915/i915_perf.c                    | 1 +
 5 files changed, 6 insertions(+), 15 deletions(-)
