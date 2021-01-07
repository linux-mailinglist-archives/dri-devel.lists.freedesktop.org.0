Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3D2ECB16
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 08:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7616E3FE;
	Thu,  7 Jan 2021 07:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9E06E3F9;
 Thu,  7 Jan 2021 07:50:36 +0000 (UTC)
IronPort-SDR: 11Xnq13BnXETSpPJtVoaBzwkvnhC0Bb35gbqJpii253EMnq18vDWQHOk9FEml5lTzAtu/Pjg8C
 46j407G7m/zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="156577808"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="156577808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 23:50:36 -0800
IronPort-SDR: 8c5cw/Si9ja+O1mGgH9NQtF2R0dm+4EdlewNmIEyDPM5Br+xOJ6aoU9Ten0Kz7p/jHou+3Fpok
 1yMlrORLrTLQ==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="379622302"
Received: from muhymini-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.207.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 23:50:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 07 Jan 2021 09:50:28 +0200
Message-ID: <877dop18zf.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Pretty quiet still, but here's some cc: stable fixes.

(Well, one doesn't have the explicit stable tag, but the Fixes tag
points at a commit in v3.9...)

drm-intel-fixes-2021-01-07:
drm/i915 fixes for v5.11-rc3:
- Use per-connector PM QoS tracking for DP aux communication
- GuC firmware fix for older Cometlakes
- Clear the gpu reloc and shadow batches

BR,
Jani.

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-01-07

for you to fetch changes up to 9397d66212cdf7a21c66523f1583e5d63a609e84:

  drm/i915/dp: Track pm_qos per connector (2021-01-05 10:25:03 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.11-rc3:
- Use per-connector PM QoS tracking for DP aux communication
- GuC firmware fix for older Cometlakes
- Clear the gpu reloc and shadow batches

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gt: Define guc firmware blob for older Cometlakes
      drm/i915/dp: Track pm_qos per connector

Matthew Auld (2):
      drm/i915: clear the shadow batch
      drm/i915: clear the gpu reloc batch

 drivers/gpu/drm/i915/display/intel_display_types.h |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c            |  8 +++++--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  1 +
 drivers/gpu/drm/i915/i915_cmd_parser.c             | 27 ++++++++--------------
 drivers/gpu/drm/i915/i915_drv.c                    |  5 ----
 drivers/gpu/drm/i915/i915_drv.h                    |  3 ---
 7 files changed, 22 insertions(+), 29 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
