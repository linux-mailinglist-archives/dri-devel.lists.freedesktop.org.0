Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02241276CDB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 11:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3456E1B8;
	Thu, 24 Sep 2020 09:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D496E194;
 Thu, 24 Sep 2020 09:12:09 +0000 (UTC)
IronPort-SDR: qpHfHcG4LrAntDb4K+2hYSmz17YJAeOQq6GPVIcb+hrl5oLZ4wCxQiUXrDjK/2rycBa/2h0FsF
 SZeZxPA81sbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="225289152"
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="225289152"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 02:12:08 -0700
IronPort-SDR: P86bosMa7MQ29QaYgRe2bSFcPqEnCcFL8li00en4Qjd3ZxRHeM95deyu2fA0Mv8RpPSrOnBjZf
 IYR3n27sbXDA==
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="486825788"
Received: from echristi-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.63])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 02:12:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 24 Sep 2020 12:12:17 +0300
Message-ID: <87zh5fpmha.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Just a couple of simple fixes.

With Daniel's irc ack I backmerged Linus' tree at an arbitrary commit
due to a build failure in v5.9-rc6 that blocked CI.


drm-intel-fixes-2020-09-24:
drm/i915 fixes for v5.9-rc7:
- Fix selftest reference to stack data out of scope
- Fix GVT null pointer dereference
- Backmerge from Linus' master to fix build

BR,
Jani.

The following changes since commit 98477740630f270aecf648f1d6a9dbc6027d4ff1:

  Merge branch 'rcu/urgent' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu (2020-09-21 12:42:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-09-24

for you to fetch changes up to 16cce04cdb200ba905d1241b425ac48da5a9ace5:

  drm/i915/selftests: Push the fake iommu device from the stack to data (2020-09-23 10:15:46 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.9-rc7:
- Fix selftest reference to stack data out of scope
- Fix GVT null pointer dereference
- Backmerge from Linus' master to fix build

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/selftests: Push the fake iommu device from the stack to data

Jani Nikula (2):
      Merge remote-tracking branch 'origin/master' into drm-intel-fixes
      Merge tag 'gvt-fixes-2020-09-17' of https://github.com/intel/gvt-linux into drm-intel-fixes

Zhenyu Wang (1):
      drm/i915/gvt: Fix port number for BDW on EDID region setup

 drivers/gpu/drm/i915/gvt/vgpu.c                  |  6 +++++-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 12 +++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
