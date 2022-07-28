Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62796583A58
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 10:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12F312A5B4;
	Thu, 28 Jul 2022 08:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307111A8FB;
 Thu, 28 Jul 2022 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658996836; x=1690532836;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QMV3XUI6sZSyvbNxBjeFjDJrSL9m5v2NWUri683FjN4=;
 b=OwZAp9LaBWTHUoEGG/82KN/imurvIvmeCBu9kz6DyPS3xcOTWAwNayW1
 QIVlTLX417pXkZwoGMzigPnHy7IdLKn62dRgJL9fznFzcoe2M6JXev4dp
 CAXbRBBHVE4K67jospcjGSBh0AmWD3YnpdBD9zqtEQM0hpzj1Mhu/d5gr
 4IGNNLVSGsAfH25+4rIgKBG1r8t+QEKVExv9bUZhFKE8vFocBO/+mGxXt
 ximUwz+ib71SmGQwz3QcIUwN704Ow9FLQmvd1R1ZdqB6tF4FbcgG/sEHB
 ycwc/T9dv8iICN5qkfRWA9dC7a4TMwwmN8eR4bHOibnhw2xRMBKjOfSAz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289651741"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="289651741"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 01:27:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="576360881"
Received: from niviojax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.204.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 01:27:12 -0700
Date: Thu, 28 Jul 2022 09:27:05 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YuJIWaEbKcs/q0NY@tursulin-desk>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Just one fix this time round to further improve reliability of resets on
execlists platforms in some edge cases.

Not sure if there is scope to do one more fixes pull before 5.19 is out so
just in case. If it doesn't get pulled we'll send it to stable after release.
 
Regards,

Tvrtko

drm-intel-fixes-2022-07-28-1:
- Further reset robustness improvements for execlists [Wa_22011802037] (Umesh Nerlige Ramappa)
The following changes since commit e0dccc3b76fb35bb257b4118367a883073d7390e:

  Linux 5.19-rc8 (2022-07-24 13:26:27 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-07-28-1

for you to fetch changes up to a7a47a5dfa9a9692a41764ee9ab4054f12924a42:

  drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend (2022-07-25 15:57:54 +0100)

----------------------------------------------------------------
- Further reset robustness improvements for execlists [Wa_22011802037] (Umesh Nerlige Ramappa)

----------------------------------------------------------------
Umesh Nerlige Ramappa (1):
      drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend

 drivers/gpu/drm/i915/gt/intel_engine.h             |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 88 +++++++++++++++++++++-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 81 ++------------------
 5 files changed, 103 insertions(+), 79 deletions(-)
