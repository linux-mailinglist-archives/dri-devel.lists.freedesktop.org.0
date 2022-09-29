Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D75EF77C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1210EA9F;
	Thu, 29 Sep 2022 14:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6510EA9F;
 Thu, 29 Sep 2022 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664461614; x=1695997614;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ryenmlfeoJ/ZLk8IaRsAOICyMPT3Z0vDdCz6LHoOUK4=;
 b=kU17dh6GDhQal+O3RwnPxpRbPzAxWupnbk2eCAQVSX1u5hepKzAEj8iS
 xTWqxw1Gae3HDKFr6cMeuZ2YY+PuPIojtM9mkH/6SXmtezzwBHdQNuKYI
 2XCS1MfA8teNIBHiMbs1YacP2/kLmhkTu7jWAw90ihXufckPHeiCZzAM6
 DmTGwVvFfTd784XAmgKCv2ZhjTOodiEIwj2vB1twcfGJyqbtltkGnAWPP
 UafZEthk0EZiBo/f4dhX1U8aaCsFHcoPjp5cXlb2PhnPUqCzrRUBU0+6E
 2WsYwOVBQrJeZG/c4sOV5UySf4EwwkTrNA2hUNcPSVQuD+ktvM+QV1skO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="365958380"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="365958380"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 07:26:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="747855019"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="747855019"
Received: from aknyaze1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.226.16])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 07:26:51 -0700
Date: Thu, 29 Sep 2022 15:26:49 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YzWqtwPNxAe+r9FO@tursulin-desk>
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

Hi Dave, Daniel,

A few fixes for the upcoming merge window. Not many but most are pretty
important.

Another rather important one is missing due being too conflicty, but will
arrive via drm-intel-fixes (7738be973fc4 ("drm/i915/gt: Perf_limit_reasons
are only available for Gen11+")).

Regards,

Tvrtko

drm-intel-next-fixes-2022-09-29:
- Fix release build bug in 'remove GuC log size module parameters' (John Harrison)
- Remove ipc_enabled from struct drm_i915_private (Jani Nikula)
- Do not cleanup obj with NULL bo->resource (Nirmoy Das)
- Fix device info for devices without display (Jani Nikula)
- Force DPLL calculation for TC ports after readout (Ville Syrjälä)
- Use i915_vm_put on ppgtt_create error paths (Chris Wilson)
The following changes since commit 320305923c88258ce50c75bf721e9bf2e420ab27:

  Merge tag 'du-next-20220907' of git://linuxtv.org/pinchartl/media into drm-next (2022-09-23 03:52:08 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-09-29

for you to fetch changes up to 20e377e7b2e7c327039f10db80ba5bcc1f6c882d:

  drm/i915/gt: Use i915_vm_put on ppgtt_create error paths (2022-09-27 11:05:33 +0100)

----------------------------------------------------------------
- Fix release build bug in 'remove GuC log size module parameters' (John Harrison)
- Remove ipc_enabled from struct drm_i915_private (Jani Nikula)
- Do not cleanup obj with NULL bo->resource (Nirmoy Das)
- Fix device info for devices without display (Jani Nikula)
- Force DPLL calculation for TC ports after readout (Ville Syrjälä)
- Use i915_vm_put on ppgtt_create error paths (Chris Wilson)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gt: Use i915_vm_put on ppgtt_create error paths

Jani Nikula (2):
      drm/i915/display: remove ipc_enabled from struct drm_i915_private
      drm/i915: fix device info for devices without display

John Harrison (1):
      drm/i915/guc: Fix release build bug in 'remove log size module parameters'

Nirmoy Das (1):
      drm/i915: Do not cleanup obj with NULL bo->resource

Ville Syrjälä (1):
      drm/i915: Force DPLL calculation for TC ports after readout

 drivers/gpu/drm/i915/display/intel_ddi.c   | 18 ++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c       | 16 ++++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c       | 58 +++++++++++++++---------------
 drivers/gpu/drm/i915/gt/intel_gtt.c        |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 25 +------------
 drivers/gpu/drm/i915/i915_drv.h            |  2 --
 drivers/gpu/drm/i915/i915_pci.c            | 11 +++---
 drivers/gpu/drm/i915/intel_device_info.c   |  6 ++++
 9 files changed, 70 insertions(+), 71 deletions(-)
