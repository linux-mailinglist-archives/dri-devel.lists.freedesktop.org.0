Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88B81B702
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 14:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1118510E6C4;
	Thu, 21 Dec 2023 13:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C92D10E358;
 Thu, 21 Dec 2023 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703164130; x=1734700130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LvCH5Weeh81IDDie0Q2DXhlRjemIowRDzjYnmRDZVtU=;
 b=BsISFcGj+1ehAg0+p/KhdG3voqzSVn1U3JIrdpyBQGfF9UdIfARSiEW4
 l16H8s3wBDhQPgKQOKwmaFBYTgUhFyf9D4VkEsfMQW796znX0PHcw+mk1
 9SyF6pK9qVcTnn3qXO3jzifnEhcVRFZ3uyl2u8w0loLQ6s+m8UcUm7Hq5
 QHL/cBlEEnMv/+F9HUANb+1l4z5hriOxY9e6klG1lpvl8XOvaKwkqou8X
 QiNMmZ4z623hQNr6qnM/GC+QkgDggdUdI1+YP6eOCCXzsCLPWBNxwvZE9
 mg1IvYl9fzg+3do1yUQKQt+zQBiZYl3WinHLgEJVPapHsSJHOkdBMgtM9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="395697803"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="395697803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:08:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842624092"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="842624092"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:08:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 21 Dec 2023 15:08:41 +0200
Message-ID: <87plyzsnxi.fsf@intel.com>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

A bit more than I'd like at this stage, but next week will be quiet.

drm-intel-fixes-2023-12-21:
drm/i915 fixes for v6.7-rc7:
- Fix state readout and check for DSC and bigjoiner combo
- Fix a potential integer overflow
- Reject async flips with bigjoiner
- Fix MTL HDMI/DP PLL clock selection
- Fix various issues by disabling pipe DMC events

BR,
Jani.

The following changes since commit ceb6a6f023fd3e8b07761ed900352ef574010bcb:

  Linux 6.7-rc6 (2023-12-17 15:19:28 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-12-=
21

for you to fetch changes up to 49e0a85ec3441edc6c77aa40206d6e5ee4597efc:

  drm/i915/dmc: Don't enable any pipe DMC events (2023-12-18 15:29:23 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc7:
- Fix state readout and check for DSC and bigjoiner combo
- Fix a potential integer overflow
- Reject async flips with bigjoiner
- Fix MTL HDMI/DP PLL clock selection
- Fix various issues by disabling pipe DMC events

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/display: Get bigjoiner config before dsc config during reado=
ut

Imre Deak (1):
      drm/i915/mtl: Fix HDMI/DP PLL clock selection

Karthik Poosa (1):
      drm/i915/hwmon: Fix static analysis tool reported issues

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Reject async flips with bigjoiner
      drm/i915/dmc: Don't enable any pipe DMC events

 drivers/gpu/drm/i915/display/intel_cx0_phy.c |  3 +-
 drivers/gpu/drm/i915/display/intel_display.c | 13 ++++++++-
 drivers/gpu/drm/i915/display/intel_dmc.c     | 43 ++++++++++++++++++++++++=
++--
 drivers/gpu/drm/i915/i915_hwmon.c            |  4 +--
 4 files changed, 57 insertions(+), 6 deletions(-)

--=20
Jani Nikula, Intel
