Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E33F2B1559
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 06:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD766E3AE;
	Fri, 13 Nov 2020 05:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C456E39B;
 Fri, 13 Nov 2020 05:24:50 +0000 (UTC)
IronPort-SDR: ufAfIF9wMbpOilTZs4RN4wNWSqRiVOqbs5oNx983Lgyi5PH3WdOn1P2L3v6WMiodhbbHjmDHsu
 /CKa6OjtqSrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="157448860"
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="157448860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 21:24:41 -0800
IronPort-SDR: 4WRL/GTHjHbJI9nYAQZVSulc+DfjgCqXb+WuAhc9QXJHl9KejdEJUvPEb95U24xKXsp+4SLyHj
 kGVUxIPfBIVw==
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="542531621"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 21:24:39 -0800
Date: Fri, 13 Nov 2020 00:25:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20201113052551.GA1319429@intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here it goes again, but wow with the right base.

Please note that one of the patches is only a dependency
that allows the pread override by backend.

Thanks,
Rodrigo.

drm-intel-fixes-2020-11-13:

- Pull phys pread/pwrite implementations to the backend (Chris)
- Correctly set SFC capability for video engines (Venkata)

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-11-13

for you to fetch changes up to 5ce6861d36ed5207aff9e5eead4c7cc38a986586:

  drm/i915: Correctly set SFC capability for video engines (2020-11-12 19:47:30 -0500)

----------------------------------------------------------------
- Pull phys pread/pwrite implementations to the backend (Chris)
- Correctly set SFC capability for video engines (Venkata)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gem: Pull phys pread/pwrite implementations to the backend

Matthew Auld (1):
      drm/i915/gem: Allow backends to override pread implementation

Venkata Sandeep Dhanalakota (1):
      drm/i915: Correctly set SFC capability for video engines

 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  2 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c         | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c        |  3 +-
 drivers/gpu/drm/i915/i915_gem.c                  | 32 +++-----------
 4 files changed, 65 insertions(+), 27 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
