Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B1E3F0D30
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 23:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9525F6E8CC;
	Wed, 18 Aug 2021 21:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AC06E8C7;
 Wed, 18 Aug 2021 21:13:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216426133"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="216426133"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 14:13:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="521235962"
Received: from ygagnonx-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.34.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 14:13:20 -0700
Date: Wed, 18 Aug 2021 17:13:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <YR137zkSAIbun1Ed@intel.com>
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

Here goes drm-intel-fixes-2021-08-18:

- Expand a tweaked display workaround for all PCHs. (Anshuman)
- Fix eDP MSO pipe sanity checks for ADL-P. (Jani)
- Remove superfluous EXPORT_SYMBOL(). (Jani)

Thanks,
Rodrigo.

The following changes since commit 7c60610d476766e128cc4284bb6349732cbd6606:

  Linux 5.14-rc6 (2021-08-15 13:40:53 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-08-18

for you to fetch changes up to e3e86f41385b2b5d5f771de6009748b584334366:

  drm/i915/dp: remove superfluous EXPORT_SYMBOL() (2021-08-18 07:23:57 -0400)

----------------------------------------------------------------
- Expand a tweaked display workaround for all PCHs. (Anshuman)
- Fix eDP MSO pipe sanity checks for ADL-P. (Jani)
- Remove superfluous EXPORT_SYMBOL(). (Jani)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915: Tweaked Wa_14010685332 for all PCHs

Jani Nikula (2):
      drm/i915/edp: fix eDP MSO pipe sanity checks for ADL-P
      drm/i915/dp: remove superfluous EXPORT_SYMBOL()

 drivers/gpu/drm/i915/display/intel_ddi.c           | 24 +++++++++++-----------
 drivers/gpu/drm/i915/display/intel_display_power.c | 16 +++++++--------
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  1 -
 drivers/gpu/drm/i915/i915_irq.c                    | 21 -------------------
 4 files changed, 20 insertions(+), 42 deletions(-)
