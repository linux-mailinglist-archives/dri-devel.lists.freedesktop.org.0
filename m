Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2C727A30
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 10:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F4110E084;
	Thu,  8 Jun 2023 08:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0304C10E046;
 Thu,  8 Jun 2023 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686213671; x=1717749671;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=pWTvZGPYmADZNEyXpuU1YHRsVuZOa3Yva9EeJR7YffE=;
 b=gsdEf2QsXzXU7JYaWQ7t0RoEvt/OA2Qs6vZr7QC63SrVaOt8CD5mbAVy
 emVB4KD57m/MS65ZNpgWmnSQgnJnkDiecimjhPaIkpIEWwtG11Xw2GIoB
 Kx34ANfKrCNnV2r/p7/i1U9DrfZmjUdVS9vyPf5o6kvtCUfZocQI3465K
 5duxh+Ei+7/0IsEZu9WoLpcYCE2RwrcIlc1RULmmAI6u+G572I7uTBnpF
 WlbebhRq0J7/vAazhk7Ke87103t6iFOYmL8Sod//QZUPGT9s0/GZgf9OG
 ndR6itesCgnvBn7jp5ZforE8YLukfIKzjcIo8E9nxBdbtozgx0KuKH20L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336879684"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="336879684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="743034255"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="743034255"
Received: from mlprotea-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.21.136])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:41:03 -0700
Date: Thu, 8 Jun 2023 11:41:00 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZIGUHBz7+LsqN2nm@jlahtine-mobl.ger.corp.intel.com>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here's the drm-intel-fixes PR for v6.4-rc6.

Couple of display compatibility fixes and two static checker fixes for
selftests.

Regards, Joonas

***

drm-intel-fixes-2023-06-08:

CDCLK voltage fix for ADL-P and eDP wake sync pulse fix.
Two error handling fixes to selftests (to appease static checkers)

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-06-08

for you to fetch changes up to 79d0150d2d983a4f6efee676cea06027f586fcd0:

  drm/i915/selftests: Add some missing error propagation (2023-06-07 12:43:22 +0300)

----------------------------------------------------------------
CDCLK voltage fix for ADL-P and eDP wake sync pulse fix.
Two error handling fixes to selftests (to appease static checkers)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Use the correct error value when kernel_context() fails

Chaitanya Kumar Borah (1):
      drm/i915/display: Set correct voltage level for 480MHz CDCLK

Jouni Högander (1):
      drm/i915: Use 18 fast wake AUX sync len

Tvrtko Ursulin (1):
      drm/i915/selftests: Add some missing error propagation

 drivers/gpu/drm/i915/display/intel_cdclk.c         | 30 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 +++++++---
 drivers/gpu/drm/i915/gt/selftest_execlists.c       | 12 ++++++---
 4 files changed, 45 insertions(+), 13 deletions(-)
