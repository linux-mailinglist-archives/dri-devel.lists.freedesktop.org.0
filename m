Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B42DE5FF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 16:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2886E1D3;
	Fri, 18 Dec 2020 15:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4236E199;
 Fri, 18 Dec 2020 15:04:22 +0000 (UTC)
IronPort-SDR: INKZP7p7PBrjzjHcZZrhQVuRSF1lfNn6KSaDPBf4divKI+ja6+jpZolVkSzjmcbR3OevAahSO+
 ADgUbmXNL+5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="171946179"
X-IronPort-AV: E=Sophos;i="5.78,430,1599548400"; d="scan'208";a="171946179"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 07:04:21 -0800
IronPort-SDR: UwF4s0ddbh/Pv3rtYT6OZVMpCB7QxbUjPj7tydb0lzy358i9LorNMhb6iuIKIZhRbAPrSaByF3
 eW0NjkKnoIIg==
X-IronPort-AV: E=Sophos;i="5.78,430,1599548400"; d="scan'208";a="340445293"
Received: from mtsachix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.201.58])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 07:04:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 18 Dec 2020 17:04:09 +0200
Message-ID: <87zh2bp34m.fsf@intel.com>
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

drm-intel-next-fixes-2020-12-18:
drm/i915 fixes for the merge window


BR,
Jani.

The following changes since commit efd3043790c6e92f0bbe1fe385db9b544131c59c:

  Merge tag 'amd-drm-fixes-5.11-2020-12-16' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-12-16 23:25:51 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2020-12-18

for you to fetch changes up to 046f70d31ddb2069941aec54966fec5b7fbc7b7b:

  drm/i915/tgl: Fix REVID macros for TGL to fetch correct stepping (2020-12-18 12:30:10 +0200)

----------------------------------------------------------------
drm/i915 fixes for the merge window

----------------------------------------------------------------
Aditya Swarup (1):
      drm/i915/tgl: Fix REVID macros for TGL to fetch correct stepping

Chris Wilson (2):
      Revert "drm/i915: re-order if/else ladder for hpd_irq_setup"
      drm/i915: Fix mismatch between misplaced vma check and vma insert

Lionel Landwerlin (1):
      drm/i915/perf: also include Gen11 in OATAILPTR workaround

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                | 12 ++++++------
 drivers/gpu/drm/i915/i915_irq.c                | 27 ++++++++++++++------------
 drivers/gpu/drm/i915/i915_perf.c               |  2 +-
 4 files changed, 23 insertions(+), 20 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
