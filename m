Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1F7FF311
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B845710E00C;
	Thu, 30 Nov 2023 14:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A217510E04A;
 Thu, 30 Nov 2023 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701356338; x=1732892338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Tp1vCY6tGtjTfNIfU1mULtE6nTb/YJScfKMCbFKAzA=;
 b=FauuAt+VFugrCTKliMJhFeUD8jme3BGM0qvJ//CEdu4LVyia9QFUjKjJ
 6hLCNhP2bMLe1x+m7OJhzl+PsR2D5JLMfGfn67qeHVs7HvFbKQM4ECnx4
 u2GTH5ViOCB6d/3LJma4EvVVDHigNe1A4WyP4VzusfC0PAu7hrG++LY6q
 f86i4dtBO+1ztGAKjESerS4sR74jyZnEUAdmxWWPnXfycgUgV52Aw61uG
 oVV88Ru41q/g+Q2YJk43+gw5M255nKbRLqkSozlsYCJ6ML4OazatA2Gzj
 qef+k/8ze1ljx+hHhucuUClbwpj1Iq+Flu8Ps7Ml69CI/f9Lc2fh7m3Ng Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383729118"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="383729118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719141727"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="719141727"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:58:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 30 Nov 2023 16:58:48 +0200
Message-ID: <87msuv479z.fsf@intel.com>
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

i915 fixes for v6.7-rc4.

drm-intel-fixes-2023-11-30:
drm/i915 fixes for v6.7-rc4:
- Mark internal GSC engine with reserved uabi class
- Take VGA converters into account in eDP probe
- Fix intel_pre_plane_updates() call to ensure workarounds get applied

BR,
Jani.

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-11-=
30

for you to fetch changes up to d21a3962d3042e6f56ad324cf18bdd64a1e6ecfa:

  drm/i915: Call intel_pre_plane_updates() also for pipes getting enabled (=
2023-11-29 10:23:25 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc4:
- Mark internal GSC engine with reserved uabi class
- Take VGA converters into account in eDP probe
- Fix intel_pre_plane_updates() call to ensure workarounds get applied

----------------------------------------------------------------
Tvrtko Ursulin (1):
      drm/i915/gsc: Mark internal GSC engine with reserved uabi class

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Also check for VGA converter in eDP probe
      drm/i915: Call intel_pre_plane_updates() also for pipes getting enabl=
ed

 drivers/gpu/drm/i915/display/intel_display.c |  3 ++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 28 +++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_engine_user.c  | 39 ++++++++++++++++--------=
----
 3 files changed, 46 insertions(+), 24 deletions(-)

--=20
Jani Nikula, Intel
