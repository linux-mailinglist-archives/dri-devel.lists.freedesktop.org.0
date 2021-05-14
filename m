Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B73380398
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 08:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC36EE0D;
	Fri, 14 May 2021 06:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9706EE07;
 Fri, 14 May 2021 06:19:34 +0000 (UTC)
IronPort-SDR: oPBcY3KOpiecg0G61yWl3omlHu7beTCN4UFX4zq0AxXGrbCrX6EzXeJvFsiTaPwNAkir2wYXYc
 WwJvXSXKSrwQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="197035299"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="197035299"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 23:19:33 -0700
IronPort-SDR: YypcnkMKyBP88pR73LsNUxYz5Ig2WWeH/jNVGB8AEVDkbjIMJTdwqT89Wwdm9YBf7Kh7SVyPsb
 uDe18Yi6hH3Q==
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="626692477"
Received: from abacha1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.34.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 23:19:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 14 May 2021 09:19:27 +0300
Message-ID: <87a6oxu9ao.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Sorry, late due to public holidays.

drm-intel-fixes-2021-05-14:
drm/i915 fixes for v5.13-rc2:
- Fix active callback alignment annotations and subsequent crashes
- Retract link training strategy to slow and wide, again
- Avoid division by zero on gen2
- Use correct width reads for C0DRB3/C1DRB3 registers
- Fix double free in pdp allocation failure path
- Fix HDMI 2.1 PCON downstream caps check

BR,
Jani.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-05-=
14

for you to fetch changes up to e4527420ed087f99c6aa2ac22c6d3458c7dc1a94:

  drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON (20=
21-05-12 20:53:08 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.13-rc2:
- Fix active callback alignment annotations and subsequent crashes
- Retract link training strategy to slow and wide, again
- Avoid division by zero on gen2
- Use correct width reads for C0DRB3/C1DRB3 registers
- Fix double free in pdp allocation failure path
- Fix HDMI 2.1 PCON downstream caps check

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON

Kai-Heng Feng (1):
      drm/i915/dp: Use slow and wide link training for everything

Lv Yunlong (1):
      drm/i915/gt: Fix a double free in gen8_preallocate_top_level_pdp

St=C3=A9phane Marchesin (1):
      drm/i915: Fix crash in auto_retire

Tvrtko Ursulin (1):
      drm/i915/overlay: Fix active retire callback alignment

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Avoid div-by-zero on gen2
      drm/i915: Read C0DRB3/C1DRB3 as 16 bits again

 drivers/gpu/drm/i915/display/intel_dp.c      | 61 +++---------------------=
----
 drivers/gpu/drm/i915/display/intel_overlay.c |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c     |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c         |  1 -
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c |  4 +-
 drivers/gpu/drm/i915/i915_active.c           |  3 +-
 6 files changed, 12 insertions(+), 61 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
