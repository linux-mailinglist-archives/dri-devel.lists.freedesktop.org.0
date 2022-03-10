Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB24D4217
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 08:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C38910F7B2;
	Thu, 10 Mar 2022 07:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8F10F7B2;
 Thu, 10 Mar 2022 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646899112; x=1678435112;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=iEBoJRUr+PIVj2h+0VZjq67F+6ydOhLcf7l5hBOruw0=;
 b=ATeFsalCQEZYnRGLmVPH7bi0AV6KMXxWdaTsPhzsQlB7kYKzE2/4LD3n
 F849j77eYiInmOaL9+Duqy71vbhnOsudSbXXiiniBXv7/hNZh+ZdiD/Eq
 z1VrexMFz2uGetkVwOa2gSq60Icj8HxR/WARvxpgvglck2S3UmqOULz4f
 2ikQwohl490BUu9MYg4DjtW+JsluNyWQsAMh+Gp00B898rPeWQ+bps04R
 Wf/GBf/P7GbKBfXXhrjbS+00XbqZH/kInt1wfh20j2p4+ruxvfTREPUaz
 LAPVjDE2UvwGTMH14FyVZerlYQ5/MElX+Xoi0QtyVR2C37ex/PLR6PYRR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235137504"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="235137504"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 23:58:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="538350461"
Received: from therrane-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.177])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 23:58:27 -0800
Date: Thu, 10 Mar 2022 09:58:24 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YimvoLOZ8RPKrITv@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here's a batch of -next-fixes from drm-intel-next/drm-intel-gt-next.

On GT side just a fix to relax GGTT alignment down 64K from 2M.
Addition of missing "name" attribute for GVT mdev device.
On display side async flip fixes and a static checker fix.

CI results had some display errors on TGL, the display has been
rebooted to fix those so should cause no worries.

Regards, Joonas

***

drm-intel-next-fixes-2022-03-10:

- Reduce overzealous alignment constraints for GGTT
- Add missing mdev attribute "name" for GVT
- Async flip fixes (Ville)
- Static checker fix (Ville)

The following changes since commit 6de7e4f02640fba2ffa6ac04e2be13785d614175:

  Merge tag 'drm-msm-next-2022-03-01' of https://gitlab.freedesktop.org/drm/msm into drm-next (2022-03-04 14:39:00 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-03-10

for you to fetch changes up to 5e7f44b5c2c035fe2e5458193c2bbee56db6a090:

  drm/i915/gtt: reduce overzealous alignment constraints for GGTT (2022-03-09 08:34:55 +0200)

----------------------------------------------------------------
- Reduce overzealous alignment constraints for GGTT
- Add missing mdev attribute "name" for GVT
- Async flip fixes (Ville)
- Static checker fix (Ville)

----------------------------------------------------------------
Joonas Lahtinen (1):
      Merge tag 'gvt-next-2022-03-07' of https://github.com/intel/gvt-linux into drm-intel-next-fixes

Matthew Auld (1):
      drm/i915/gtt: reduce overzealous alignment constraints for GGTT

Ville Syrjälä (4):
      drm/i915: Avoid negative shift due to bigjoiner_pipes==0
      drm/i915: Don't skip ddb allocation if data_rate==0
      drm/i915: Check async flip capability early on
      drm/i915: Fix the async flip wm0/ddb optimization

Zhi Wang (1):
      drm/i915/gvt: add the missing mdev attribute "name"

 drivers/gpu/drm/i915/display/intel_atomic.c        |   1 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   7 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 122 +++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_display_types.h |   6 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   3 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  15 +++
 drivers/gpu/drm/i915/intel_pm.c                    |  30 ++---
 8 files changed, 136 insertions(+), 52 deletions(-)
