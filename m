Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436356BACFE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 11:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869EE10E9A0;
	Wed, 15 Mar 2023 10:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C923110E998;
 Wed, 15 Mar 2023 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678874744; x=1710410744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=792EcEyGkMM5NFPUcHWYoYYWA3xCUq1eLHZsnKaD7dY=;
 b=ZZlMvZjwdUzpOIrG2uV+1OlOcjEcHdvE2shDKeH0qsfA/HL9RzhbBH2q
 sD7AHkAW6977eBTaXYXDOWOmgNZVaqsdSvBd5EzHxAdXCJ3ctS4ZfcC0T
 5loCTcgHMHnnuFvdS7CIkRymx5OmkMzJMA6EoPPot8WpZQQtzI/3lETlt
 7V7yDBrW4oMwEMWKvDCw34vZbsRzu/0o/nyA5MwmbEMWMmRw5dGgB622V
 pSqITq+VIc5Pxz3VkRwSGa6lPEMiDoCrt0l92F5t7CW+4D1IkYHF5TOrx
 f1c4L7gNUb0l8hhShSwdKlX+6kEKphsXmt1nEI7KuJPVeU9Hfyby5IeOO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336350100"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="336350100"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711868677"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711868677"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.32])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:05:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 15 Mar 2023 12:05:36 +0200
Message-ID: <87r0tq5nyn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Missed fixes last week, so here we are early this week.


drm-intel-fixes-2023-03-15:
drm/i915 fixes for v6.3-rc3:
- Fix hwmon PL1 power limit enabling
- Fix audio ELD handling for DP MST
- Fix PSR io and wake line calculations
- Fix DG2 HDMI modes with 267.30 and 319.89 MHz pixel clocks
- Fix SSEU subslice out-of-bounds access
- Fix misuse of non-idle barriers as fence trackers

BR,
Jani.

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-03-=
15

for you to fetch changes up to e0e6b416b25ee14716f3549e0cbec1011b193809:

  drm/i915/active: Fix misuse of non-idle barriers as fence trackers (2023-=
03-13 11:38:05 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.3-rc3:
- Fix hwmon PL1 power limit enabling
- Fix audio ELD handling for DP MST
- Fix PSR io and wake line calculations
- Fix DG2 HDMI modes with 267.30 and 319.89 MHz pixel clocks
- Fix SSEU subslice out-of-bounds access
- Fix misuse of non-idle barriers as fence trackers

----------------------------------------------------------------
Andrea Righi (1):
      drm/i915/sseu: fix max_subslices array-index-out-of-bounds access

Ankit Nautiyal (1):
      drm/i915/dg2: Add HDMI pixel clock frequencies 267.30 and 319.89 MHz

Ashutosh Dixit (1):
      drm/i915/hwmon: Enable PL1 power limit

Janusz Krzysztofik (1):
      drm/i915/active: Fix misuse of non-idle barriers as fence trackers

Jouni H=C3=B6gander (1):
      drm/i915/psr: Use calculated io and fast wake lines

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Fix audio ELD handling for DP MST

 drivers/gpu/drm/i915/display/intel_display_types.h |  2 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 25 ++++---
 drivers/gpu/drm/i915/display/intel_psr.c           | 78 +++++++++++++++++-=
----
 drivers/gpu/drm/i915/display/intel_snps_phy.c      | 62 +++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_sseu.h               |  2 +-
 drivers/gpu/drm/i915/i915_active.c                 | 25 ++++---
 drivers/gpu/drm/i915/i915_hwmon.c                  |  5 ++
 7 files changed, 161 insertions(+), 38 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
