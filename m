Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D271E69F0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 21:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3436E5D4;
	Thu, 28 May 2020 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8A06E116;
 Thu, 28 May 2020 19:01:23 +0000 (UTC)
IronPort-SDR: EaqUlQAJlTLSl92sxv03FTf8IZcvct1SunmOyYrL5TNWC85pcRnfMQj7Y0I7FbW2XVwNwsDyMQ
 eUD7odzV9oUg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 12:01:22 -0700
IronPort-SDR: Hb9Pwgm8czH6E0b+lvUugeOdNHcVleAFAKPCOiOwSzlMT6SSsWPl4kljnKdwida0G/zb6HEy2I
 ff4UtAFa9zHg==
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="469230786"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 12:01:22 -0700
Date: Thu, 28 May 2020 11:59:45 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200528185945.GA708600@intel.com>
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

Here goes drm-intel-fixes-2020-05-28:

couple compilation fixes for gcc-9+, and couple fixes for timeslicing,
one to respect I915_REQUEST_NOPREEMPT flag and another to incorporate
virtual engine into timeslicing.

Thanks,
Rodrigo.

The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-05-28

for you to fetch changes up to 1f65efb624c4164bfd2e2a025fc25e8bfb651daa:

  drm/i915/gt: Prevent timeslicing into unpreemptable requests (2020-05-28 06:06:27 -0700)

----------------------------------------------------------------
couple compilation fixes for gcc-9+, and couple fixes for timeslicing,
one to respect I915_REQUEST_NOPREEMPT flag and another to incorporate
virtual engine into timeslicing.

----------------------------------------------------------------
Arnd Bergmann (2):
      drm/i915/pmu: avoid an maybe-uninitialized warning
      drm/i915: work around false-positive maybe-uninitialized warning

Chris Wilson (2):
      drm/i915/gt: Incorporate the virtual engine into timeslicing
      drm/i915/gt: Prevent timeslicing into unpreemptable requests

 drivers/gpu/drm/i915/gt/intel_lrc.c            |  31 +++++--
 drivers/gpu/drm/i915/gt/selftest_lrc.c         | 118 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c |   2 +
 drivers/gpu/drm/i915/i915_pmu.c                |  84 +++++++++---------
 drivers/gpu/drm/i915/i915_priolist_types.h     |   2 +-
 5 files changed, 187 insertions(+), 50 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
