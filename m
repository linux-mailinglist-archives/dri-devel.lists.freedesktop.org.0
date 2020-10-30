Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18C29F9EA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 01:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC706E931;
	Fri, 30 Oct 2020 00:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206D6E931;
 Fri, 30 Oct 2020 00:43:14 +0000 (UTC)
IronPort-SDR: bMOq2Y5exNQD9IQF4nT+S+9m6CrkmDctzqE3Q1vPmNg1I74sXwMk4t3KBTbyi8+f4Kvqh7IvIk
 fiLa0kKaqLIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="155511932"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="155511932"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 17:43:13 -0700
IronPort-SDR: EVq81WRtqd7WDYnZsxKO3/txK1csnWl67n2ob5SGlWXvxq6Xhg2pwLV1fkMqc3TJkJzdc0Hmvi
 QId0BVI01L/Q==
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="304783083"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 17:43:12 -0700
Date: Thu, 29 Oct 2020 20:44:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20201030004442.GA146813@intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Only 3 patches on this first round. I had blocked a few patches
because CI results were strange and I had blocked GVT pull request
for having a bad-formatted commit message. So we might see a bigger
number of patches next week.

Thanks,
Rodrigo.

drm-intel-fixes-2020-10-29:
- Fix max memory region size calculation (Matt)
- Restore ILK-M RPS support, restoring performance (Ville)
- Reject 90/270 degreerotated initial fbs (Ville)
The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-10-=
29

for you to fetch changes up to 61334ed227a5852100115180f5535b1396ed5227:

  drm/i915: Reject 90/270 degree rotated initial fbs (2020-10-29 14:20:24 -=
0400)

----------------------------------------------------------------
- Fix max memory region size calculation (Matt)
- Restore ILK-M RPS support, restoring performance (Ville)
- Reject 90/270 degreerotated initial fbs (Ville)

----------------------------------------------------------------
Matthew Auld (1):
      drm/i915/region: fix max size calculation

Ville Syrj=E4l=E4 (2):
      drm/i915: Restore ILK-M RPS support
      drm/i915: Reject 90/270 degree rotated initial fbs

 drivers/gpu/drm/i915/display/intel_display.c       |  4 ++
 drivers/gpu/drm/i915/i915_pci.c                    |  1 +
 drivers/gpu/drm/i915/intel_memory_region.c         |  2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   | 77 ++++++++++++++++++=
++++
 drivers/gpu/drm/i915/selftests/mock_region.c       |  2 +-
 5 files changed, 84 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
