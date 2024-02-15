Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4E85637D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E061E10E782;
	Thu, 15 Feb 2024 12:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/BO1hYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CF510E757;
 Thu, 15 Feb 2024 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708001025; x=1739537025;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QnO807P1/lW6O2iUc/N3Ed6ue/aI53v5YMN7//EUvZM=;
 b=L/BO1hYveanWCidFhPWHBH0S1GFaE8QuQFZltbvnTxDsVgzjFb9kH/QK
 OEPonkwRfiHXtsYzXSNkW1ZSQT3PMygkhHFHlq+Lc8X0t8625BshrJz83
 spptRqdqdBzdeAsH3gMsJn7QkoIwvZOYGhjnmZ5IoTywk5fajgaC8/Mip
 NXqsv763t8xyACcHYP2yjqn0+6DN1QUW4HmeQFH1GqQlOyC00nVScDCam
 V1+oryewwNIiWvPn0u1rpBT5ajLuJ9Wr4EpNHLdqIBwYfbUsIa8e9sJNs
 AU6/ad5o2+ssVlJW+Ft7f1FqlDwzHfgIaCg4UGpboX/9qAUDsyG4eIe0P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="27531745"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="27531745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 04:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3592010"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.249.254.156])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 04:43:40 -0800
Date: Thu, 15 Feb 2024 13:43:22 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <Zc4GpcrbFVqdK9Ws@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima!

The xe fixes pull request for -rc5.
drm-xe-fixes-2024-02-15:
Driver Changes:
- Fix an out-of-bounds shift.
- Fix the display code thinking xe uses shmem
- Fix a warning about index out-of-bound
- Fix a clang-16 compilation warning

Thanks,
Thomas

The following changes since commit bf4c27b8267d7848bb81fd41e6aa07aa662f07fb:

  drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR (2024-02-08 09:51:19 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-02-15

for you to fetch changes up to 455dae7549aed709707feda5d6b3e085b37d33f7:

  drm/xe: avoid function cast warnings (2024-02-15 09:53:38 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix an out-of-bounds shift.
- Fix the display code thinking xe uses shmem
- Fix a warning about index out-of-bound
- Fix a clang-16 compilation warning

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe: avoid function cast warnings

Matthew Auld (1):
      drm/xe/display: fix i915_gem_object_is_shmem() wrapper

Thomas Hellström (2):
      drm/xe/vm: Avoid reserving zero fences
      drm/xe/pt: Allow for stricter type- and range checking

 .../xe/compat-i915-headers/gem/i915_gem_object.h   |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                         | 39 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_walk.c                    |  2 +-
 drivers/gpu/drm/xe/xe_pt_walk.h                    | 19 ++---------
 drivers/gpu/drm/xe/xe_range_fence.c                |  7 +++-
 drivers/gpu/drm/xe/xe_vm.c                         | 13 ++++++--
 6 files changed, 46 insertions(+), 36 deletions(-)
