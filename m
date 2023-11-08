Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330007E57E1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB5410E757;
	Wed,  8 Nov 2023 13:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A220B10E754;
 Wed,  8 Nov 2023 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699449526; x=1730985526;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=oofh0GlpQP69Q40Z1USLcXp/o16a6nYtM0nOttSfwq8=;
 b=MrmHqlEgSoTz+HM9X4ua8lAZUjeUMp/UScDR8zwd/FEPq41Z2WhssG76
 QG+Jmflnz2c+YF3qHN4G96dcESer26AGvf1Rx4Q+mTv/W4Y4ALbyCa0UP
 vN9+GRAJQvNS+w38csXy0qOW3c2XUIc3yV129WEa7YlwSSLxBVtLuOVyY
 8fIR36PCGbggO34Y68j202jRWar0yZ6fRVKQljtcXEdeK4YHEbqRp6WkC
 jXvG8Qf8KH/fAzwPFraryWHQSEddSpx7+H+TQ1Ue+XebBrg693hrV2Q+2
 sjbVjmH/KmOj5szOJiFBR0hxE4cG5AQgiLE31XtkxmIFnx4u/Sf17lER6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386931822"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="386931822"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="766642871"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="766642871"
Received: from ishachar-mobl1.ger.corp.intel.com (HELO [10.252.52.206])
 ([10.252.52.206])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:18:42 -0800
Message-ID: <bc8598ee-d427-4616-8ebd-64107ab9a2d8@linux.intel.com>
Date: Wed, 8 Nov 2023 14:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

drm-misc-next-fixes is empty, have a pull request for drm-misc-fixes.

Cheers,
~Maarten

drm-misc-fixes-2023-11-08:
drm-misc-fixes for v6.7-rc1:

- drm-misc-fixes from 2023-11-02 + a single qxl memory leak fix.
The following changes since commit 8f5ad367e8b884772945c6c9fb622ac94b7d3e32:

   accel/ivpu: Extend address range for MMU mmap (2023-10-19 08:01:20 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-11-08

for you to fetch changes up to 0e8b9f258baed25f1c5672613699247c76b007b5:

   drm/qxl: prevent memory leak (2023-11-06 09:37:03 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.7-rc1:

- drm-misc-fixes from 2023-11-02 + a single qxl memory leak fix.

----------------------------------------------------------------
Christian König (2):
       drm/amdgpu: ignore duplicate BOs again
       drm/amdkfd: reserve a fence slot while locking the BO

Erik Kurzinger (1):
       drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

Karol Wachowski (1):
       accel/ivpu/37xx: Fix missing VPUIP interrupts

Luben Tuikov (1):
       drm/amdgpu: Remove redundant call to priority_is_valid()

Lukasz Majczak (1):
       drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()

Maxime Ripard (1):
       drm/vc4: tests: Fix UAF in the mock helpers

Sui Jingfeng (1):
       drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO

Zongmin Zhou (1):
       drm/qxl: prevent memory leak

  drivers/accel/ivpu/ivpu_hw_37xx.c                | 11 +++++------
  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  3 ++-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c          | 15 ++++++++-------
  drivers/gpu/drm/display/drm_dp_mst_topology.c    |  6 +++---
  drivers/gpu/drm/drm_syncobj.c                    |  3 ++-
  drivers/gpu/drm/logicvc/Kconfig                  |  2 ++
  drivers/gpu/drm/qxl/qxl_display.c                |  3 +++
  drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c        |  2 +-
  drivers/gpu/drm/vc4/tests/vc4_mock_output.c      |  2 +-
  10 files changed, 28 insertions(+), 21 deletions(-)
