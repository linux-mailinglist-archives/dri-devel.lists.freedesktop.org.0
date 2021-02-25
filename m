Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECE3251AC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 15:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29296ECA6;
	Thu, 25 Feb 2021 14:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4786E188;
 Thu, 25 Feb 2021 14:44:20 +0000 (UTC)
IronPort-SDR: WnRE0w3nzr5c4Pd38Tk8nUHqKC/8zhjs1ogH3QHlRKoR3TfAkRcLMQFrv9/Gac7u2kRco9smxe
 07EpMCB0cFRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="249602292"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="249602292"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 06:44:19 -0800
IronPort-SDR: O1WWtD91MUdtYDqhshMux0fiNELB7uz1j6p3uHtU4Plr5jktJx8hvwxB2G+D5/roWbWqGVjfLh
 LF5a/lKOGOjA==
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="433982534"
Received: from smilbran-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.209.140.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 06:43:51 -0800
Date: Thu, 25 Feb 2021 09:43:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YDe3pBPV5Kx3hpk6@intel.com>
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

Here goes drm-intel-next-fixes-2021-02-25:

A fix for color format check from Ville, plus the re-enable of -Wuninitiali=
zed
from Nathan, and the GVT fixes including fixes for ww locking, cmd parser a=
nd
a general cleanup of dev_priv->gt.

Thanks,
Rodrigo.

The following changes since commit 81ce8f04aa96f7f6cae05770f68b5d15be91f5a2:

  drm/i915/gt: Correct surface base address for renderclear (2021-02-17 06:=
19:04 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
1-02-25

for you to fetch changes up to ed428ffc28521b9f1b6a71584d1875318a122859:

  drm/i915: Nuke INTEL_OUTPUT_FORMAT_INVALID (2021-02-23 09:38:14 -0500)

----------------------------------------------------------------
A fix for color format check from Ville, plus the re-enable of -Wuninitiali=
zed
from Nathan, and the GVT fixes including fixes for ww locking, cmd parser a=
nd
a general cleanup of dev_priv->gt.

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gvt: Parse default state to update reg whitelist
      drm/i915/gvt: Purge dev_priv->gt

Nathan Chancellor (1):
      drm/i915: Enable -Wuninitialized

Rodrigo Vivi (1):
      Merge tag 'gvt-next-fixes-2021-02-22' of https://github.com/intel/gvt=
-linux into drm-intel-next-fixes

Ville Syrj=E4l=E4 (1):
      drm/i915: Nuke INTEL_OUTPUT_FORMAT_INVALID

Zhi Wang (1):
      drm/i915/gvt: Introduce per object locking in GVT scheduler.

 drivers/gpu/drm/i915/Makefile                      |  1 -
 drivers/gpu/drm/i915/display/intel_crtc.c          |  1 -
 drivers/gpu/drm/i915/display/intel_display.c       |  3 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  1 -
 drivers/gpu/drm/i915/gvt/cmd_parser.c              | 93 +++++-------------=
----
 drivers/gpu/drm/i915/gvt/execlist.c                |  8 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               | 52 +++++++++---
 7 files changed, 65 insertions(+), 94 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
