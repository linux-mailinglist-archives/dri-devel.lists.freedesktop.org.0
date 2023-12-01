Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA7800607
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C2A10E820;
	Fri,  1 Dec 2023 08:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CF010E81C;
 Fri,  1 Dec 2023 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701420079; x=1732956079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2HVkqEltSHIHRyCa3onK96hvLzy5ly3KmEyj6guft0M=;
 b=DQRAmQhBYFWIqILWrIFMJP+gBfClj9Z6iEzezw4uM2HfZIlgzP+fXhMy
 F9EvPYG39GRTElzZsiAhBqIbT49z5suWvFwtRWPa7If8IvxpinfhdTpPs
 czGx4ehzIHu/aq5p7uKcSFcQqqhLsQ5ru90IrwXsqN6tV2Ht8WeJYmA5D
 QadS8tng4QjDjGpDzZdSnVy/ZqipeBhJqmZ11+J2lFXddk95EbpwLbIKF
 i980XWekjAfvSGnwnrAVqgneJGdGQtvGxGwoyvENmQYHYf9r0hCVGr/ZC
 1ptMKdU/mMTiiR2PD1GqJDIurQKhlq9zzuyfgL21tDbX7eMf+7EovKKIb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="459962723"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="459962723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 00:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="17241075"
Received: from vlubart-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 00:40:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes follow-up
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 01 Dec 2023 10:40:42 +0200
Message-ID: <87fs0m48ol.fsf@intel.com>
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

As Ville observed in [1], yesterday's fixes pull depends on a commit
that wasn't included, and VRR might suffer without it. Here's the
missing one.

I see that Dave already sent the drm fixes pull on to Linus, but here
goes nothing.

BR,
Jani.


[1] https://lore.kernel.org/r/ZWjlapi4-QmzxwYO@intel.com


drm-intel-fixes-2023-12-01-1:
drm/i915 fixes for v6.7-rc4 #2:
- d21a3962d304 ("drm/i915: Call intel_pre_plane_updates() also for pipes
  getting enabled") in the previous fixes pull depends on a change that
  wasn't included. Pick it up.


The following changes since commit d21a3962d3042e6f56ad324cf18bdd64a1e6ecfa:

  drm/i915: Call intel_pre_plane_updates() also for pipes getting enabled (=
2023-11-29 10:23:25 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-12-=
01-1

for you to fetch changes up to 96d7e79401364c6e9a63af5f74f76792b03cb832:

  drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling}() =
(2023-12-01 10:19:11 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.7-rc4 #2:
- d21a3962d304 ("drm/i915: Call intel_pre_plane_updates() also for pipes
  getting enabled") in the previous fixes pull depends on a change that
  wasn't included. Pick it up.

----------------------------------------------------------------
Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling=
}()

 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

--=20
Jani Nikula, Intel
