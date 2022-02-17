Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F74B9D46
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD310EBAB;
	Thu, 17 Feb 2022 10:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AD810EBAB;
 Thu, 17 Feb 2022 10:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645094153; x=1676630153;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=JfPj/afQgMo8RGF/WNbpg185+WPhFj1O1Dqgx7flES8=;
 b=ly6F++3yzHHqbJlimdR8WWtjYrLFqJMFDZaQL4MnqfJWgMpm7y8/pL0L
 ldcrfuQyZsb4p+u25xRbGxiaNTdPvQ77XX/hDcCnfL4qy5XMPNZZiJaj+
 FOfZfAkB3npKcj6w3JqP/nTDkYaRO0kwTFwHjL5QZ3uGdemy9Q1bg5385
 qILhO6tGhcQYMCgOlP/WpaBVsYnQKcAt5GxUWT2r6qnoD2MNG7gm8f9NJ
 Ic1EtvGfi2hL2++Z8ql4q2hbL6iogHqOOOQkxCT81iAibZcAGXIcba7LU
 5Jk7X7fBJcLANLUL/UxBYQW8PAHNf1MC98lY+hMLB9sHzw6IVInQYDYqO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230808224"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="230808224"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 02:35:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="704732185"
Received: from markorti-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.216.21])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 02:35:50 -0800
Date: Thu, 17 Feb 2022 10:35:47 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Yg4lA6k8+xp8u3aB@tursulin-mobl2>
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

An assortment of fixes for -rc5, mostly display and one for the TTM
backend.

Contains a merge of two trivial GVT fixes as well which came via GVT pull
request.

Regards,

Tvrtko

drm-intel-fixes-2022-02-17:
- GVT kerneldoc cleanup. (Randy Dunlap)
- GVT Kconfig should depend on X86. (Siva Mullati)
- Prevent out of range access in SWSCI display code. (Jani Nikula)
- Fix mbus join and dbuf slice config lookup. (Ville Syrjälä)
- Fix inverted priority selection in the TTM backend. (Matthew Auld)
- Fix FBC plane end Y offset check. (Ville Syrjälä)
The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-02-17

for you to fetch changes up to 26ace8793aaefbcd0d6bb664573ded35c69cd6ef:

  drm/i915/fbc: Fix the plane end Y offset check (2022-02-14 09:52:56 +0000)

----------------------------------------------------------------
- GVT kerneldoc cleanup. (Randy Dunlap)
- GVT Kconfig should depend on X86. (Siva Mullati)
- Prevent out of range access in SWSCI display code. (Jani Nikula)
- Fix mbus join and dbuf slice config lookup. (Ville Syrjälä)
- Fix inverted priority selection in the TTM backend. (Matthew Auld)
- Fix FBC plane end Y offset check. (Ville Syrjälä)

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/opregion: check port number bounds for SWSCI display power state

Matthew Auld (1):
      drm/i915/ttm: tweak priority hint selection

Randy Dunlap (1):
      drm/i915/gvt: clean up kernel-doc in gtt.c

Siva Mullati (1):
      drm/i915/gvt: Make DRM_I915_GVT depend on X86

Tvrtko Ursulin (1):
      Merge tag 'gvt-fixes-2022-01-13' of https://github.com/intel/gvt-linux into drm-intel-fixes

Ville Syrjälä (3):
      drm/i915: Fix dbuf slice config lookup
      drm/i915: Fix mbus join config lookup
      drm/i915/fbc: Fix the plane end Y offset check

 drivers/gpu/drm/i915/Kconfig                  |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      |  3 ++-
 drivers/gpu/drm/i915/display/intel_opregion.c | 15 +++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  6 ++----
 drivers/gpu/drm/i915/gvt/gtt.c                |  4 ++--
 drivers/gpu/drm/i915/intel_pm.c               |  4 ++--
 6 files changed, 24 insertions(+), 9 deletions(-)
