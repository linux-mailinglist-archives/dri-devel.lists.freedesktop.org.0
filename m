Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066514C2B3A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 12:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876A810FB49;
	Thu, 24 Feb 2022 11:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8A10FB42;
 Thu, 24 Feb 2022 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645703772; x=1677239772;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=M2P7GbHWoXwE7QJUl2BmOoel373hop1mE4EClLRGqso=;
 b=eaoofo1if5qyZAXeIOkUyynBaqxzq2vic8ch1E2l7zYaqDZk9Qg4SXox
 mDo6BQHNgN6TtHfGFc+vdF7jfX3AbugKpnrM6+l6HxMw9rmAJ0FYaRZU5
 KQs1cevv3/2xTnRlTpxtlIM8wGmyWcqyttQmZciq1z7yN2yEXqbJ4kqm9
 Dl3Oc9Zh49gDxSBp4ajBl7fSSUajDkZ1PyWovGNuc4AtCkmsOZEVSs2ts
 7gnkftYvoXv3VMBsPHaO5sBAAZO1nv4fhomQgh3iyAPOmh9sglfUIr2bW
 SIzkhVdlM/7PuBqmCzhmqyfsqlms0RZ0XgJJo0wkThoOY0GKhmp3edHZ2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276844314"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="276844314"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 03:56:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="639697230"
Received: from cwadams-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.221.24])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 03:56:09 -0800
Date: Thu, 24 Feb 2022 11:55:11 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YhdyHwRWkOTWwlqi@tursulin-mobl2>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave,  Daniel,

An assortment of display fixes for -rc6.

Regards,

Tvrtko

drm-intel-fixes-2022-02-24:
- Fix QGV handling on ADL-P+ (Ville Syrjälä)
- Fix bw atomic check when switching between SAGV vs. no SAGV (Ville Syrjälä)
- Disconnect PHYs left connected by BIOS on disabled ports (Imre Deak)
- Fix SAVG to no SAGV transitions on TGL+ (Ville Syrjälä)
- Print PHY name properly on calibration error (DG2) (Matt Roper)
The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507:

  Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-02-24

for you to fetch changes up to 28adef861233c6fce47372ebd2070b55eaa8e899:

  drm/i915/dg2: Print PHY name properly on calibration error (2022-02-21 09:43:11 +0000)

----------------------------------------------------------------
- Fix QGV handling on ADL-P+ (Ville Syrjälä)
- Fix bw atomic check when switching between SAGV vs. no SAGV (Ville Syrjälä)
- Disconnect PHYs left connected by BIOS on disabled ports (Imre Deak)
- Fix SAVG to no SAGV transitions on TGL+ (Ville Syrjälä)
- Print PHY name properly on calibration error (DG2) (Matt Roper)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915: Disconnect PHYs left connected by BIOS on disabled ports

Matt Roper (1):
      drm/i915/dg2: Print PHY name properly on calibration error

Ville Syrjälä (3):
      drm/i915: Widen the QGV point mask
      drm/i915: Correctly populate use_sagv_wm for all pipes
      drm/i915: Fix bw atomic check when switching between SAGV vs. no SAGV

 drivers/gpu/drm/i915/display/intel_bw.c       | 18 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_bw.h       |  8 ++++----
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  2 +-
 drivers/gpu/drm/i915/display/intel_tc.c       | 26 ++++++++++++++++++++------
 drivers/gpu/drm/i915/intel_pm.c               | 22 +++++++++++-----------
 5 files changed, 52 insertions(+), 24 deletions(-)
