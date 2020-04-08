Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF21A2251
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 14:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FFF6E1C4;
	Wed,  8 Apr 2020 12:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CADE6E105;
 Wed,  8 Apr 2020 12:49:35 +0000 (UTC)
IronPort-SDR: 4mXdLrnv64VtdhZqnNIa1Oyi9nzxHoJ3osmZtsq517jeCT9lpIzCfYhPZ3xuT+FNp11ylltsjf
 8HasyGGQ59qw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 05:49:34 -0700
IronPort-SDR: OPNt/uqqeJHUhGTi/Tokle0hig9tFopVZvfJAx0K5GId5ZvnF0W73Hp2N3O9VG7Hhh+WOION1M
 wFGZKkQXhtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; d="scan'208";a="330527458"
Received: from dmocuta-mobl.ti.intel.com (HELO [10.252.40.186])
 ([10.252.40.186])
 by orsmga001.jf.intel.com with ESMTP; 08 Apr 2020 05:49:31 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Manasi Navare <manasi.d.navare@intel.com>
Subject: [PULL] topic/phy-compliance
Message-ID: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
Date: Wed, 8 Apr 2020 14:49:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Here's a pull request to pull in the DP PHY Compliance series.
It's based on top of drm/drm-next, and contains all patches for core, amd and i915. :)

Cheers,
Maarten

topic/phy-compliance-2020-04-08:
Topic pull request for topic/phy-compliance:
- Standardize DP_PHY_TEST_PATTERN name.
- Add support for setting/getting test pattern from sink.
- Implement DP PHY compliance to i915.
The following changes since commit 12ab316ced2c5f32ced0e6300a054db644b5444a:

  Merge tag 'amd-drm-next-5.7-2020-04-01' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-04-08 09:34:27 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/topic/phy-compliance-2020-04-08

for you to fetch changes up to 8cdf727119289db3a98835662eb28e1c5ad835f1:

  drm/i915/dp: Program vswing, pre-emphasis, test-pattern (2020-04-08 14:41:09 +0200)

----------------------------------------------------------------
Topic pull request for topic/phy-compliance:
- Standardize DP_PHY_TEST_PATTERN name.
- Add support for setting/getting test pattern from sink.
- Implement DP PHY compliance to i915.

----------------------------------------------------------------
Animesh Manna (7):
      drm/amd/display: Align macro name as per DP spec
      drm/dp: get/set phy compliance pattern
      drm/i915/dp: Made intel_dp_adjust_train() non-static
      drm/i915/dp: Preparation for DP phy compliance auto test
      drm/i915/dp: Add debugfs entry for DP phy compliance
      drm/i915/dp: Register definition for DP compliance register
      drm/i915/dp: Program vswing, pre-emphasis, test-pattern

 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   2 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  94 +++++++++++
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 171 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h            |   1 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   9 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   4 +
 drivers/gpu/drm/i915/i915_reg.h                    |  18 +++
 include/drm/drm_dp_helper.h                        |  33 +++-
 10 files changed, 337 insertions(+), 8 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
