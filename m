Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F0163744F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FFD10E6B1;
	Thu, 24 Nov 2022 08:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFFD10E6AF;
 Thu, 24 Nov 2022 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669279485; x=1700815485;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3cSfQr4FR/K77LnDabHSHtT5na0VFnm3cmqY2yH9+Wg=;
 b=OZxo7qtCfGlTwpnGB0P86LPfwUcmwdF/GfUi4iQrlFinka6FoiDETSNH
 mJCdqJjpDsH9hGxdNwvfedMyQdcyr/DfdoHjIPPjMyFevdORtXVNECRFi
 Lu3K8PSoUcHVpBzeMRvy2Srf5WA8UYUn/mucPBnz4lBMEV6umJT1LaQhQ
 hvNnlpJ/hYtcXE4usdE4t8k0nnj2MDdfQ6u/w0D0UInywQynFKF1DFOeb
 b452zWHlU0j//IlwGgrBTnoD1hQzJ/bKuChV8GbDXw7pZ2hfI75Vh1A5a
 OMrh6FCf0rSBPOJh9j2t04Y01DJLkNYVbhgLxkt/19YO7XatHdIJIYXFE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="400544491"
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; d="scan'208";a="400544491"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 00:44:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="971173107"
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; d="scan'208";a="971173107"
Received: from smurr10x-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.213.209.98])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 00:44:21 -0800
Date: Thu, 24 Nov 2022 08:44:19 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y38u44hb1LZfZC+M@tursulin-desk>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A couple of fixes for 6.1-rc. One TTM backend fix, one display warning
fixlet and a merge of two GVT patches which fix KVM reference count
handling there.

Regards,

Tvrtko

drm-intel-fixes-2022-11-24:
- Fix GVT KVM reference count handling (Sean Christopherson)
- Never purge busy TTM objects (Matthew Auld)
- Fix warn in intel_display_power_*_domain() functions (Imre Deak)
The following changes since commit eb7081409f94a9a8608593d0fb63a1aa3d6f95d8:

  Linux 6.1-rc6 (2022-11-20 16:02:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-11-24

for you to fetch changes up to 14af5d385878d22546914d37f13a314b14825a42:

  Merge tag 'gvt-fixes-2022-11-11' of https://github.com/intel/gvt-linux into drm-intel-fixes (2022-11-22 07:59:17 +0000)

----------------------------------------------------------------
- Fix GVT KVM reference count handling (Sean Christopherson)
- Never purge busy TTM objects (Matthew Auld)
- Fix warn in intel_display_power_*_domain() functions (Imre Deak)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915: Fix warn in intel_display_power_*_domain() functions

Matthew Auld (1):
      drm/i915/ttm: never purge busy objects

Sean Christopherson (2):
      drm/i915/gvt: Get reference to KVM iff attachment to VM is successful
      drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU

Tvrtko Ursulin (1):
      Merge tag 'gvt-fixes-2022-11-11' of https://github.com/intel/gvt-linux into drm-intel-fixes

 drivers/gpu/drm/i915/display/intel_display_power.c | 8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 4 ++++
 drivers/gpu/drm/i915/gvt/kvmgt.c                   | 8 +++-----
 3 files changed, 11 insertions(+), 9 deletions(-)
