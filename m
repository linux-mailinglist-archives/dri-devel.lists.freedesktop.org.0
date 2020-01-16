Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB01513DFBA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA16EDBD;
	Thu, 16 Jan 2020 16:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F736EDBB;
 Thu, 16 Jan 2020 16:14:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 08:14:25 -0800
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="218582608"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.21.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 08:14:21 -0800
Date: Thu, 16 Jan 2020 18:14:19 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200116161419.GA13594@jlahtine-desk.ger.corp.intel.com>
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

Hi Dave & Daniel,

Two new fixes still, the VMA activity fixes are overflow from
last week as I couldn't get CI results then.

One important uAPI fix for PMU names to comply with tools/perf,
thanks for our media team for noticing. A compile fix and two
VMA activity tracking fixes for error capture and a dependency.

Regards, Joonas

PS. There were quite a few conflicts due to the renames,
when applying.

***

drm-intel-fixes-2020-01-16:

- uAPI fix: Remove dash and colon from PMU names to comply with tools/perf
- Fix for include file that was indirectly included
- Two fixes to make sure VMA are marked active for error capture

The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-01-16

for you to fetch changes up to 88550e1c345c6d3f70292fa60d481eb320e11953:

  drm/i915/pmu: Do not use colons or dashes in PMU names (2020-01-14 08:56:58 +0200)

----------------------------------------------------------------
- uAPI fix: Remove dash and colon from PMU names to comply with tools/perf
- Fix for include file that was indirectly included
- Two fixes to make sure VMA are marked active for error capture

----------------------------------------------------------------
Chris Wilson (3):
      drm/i915/gt: Skip trying to unbind in restore_ggtt_mappings
      drm/i915/gt: Mark context->state vma as active while pinned
      drm/i915/gt: Mark ring->vma as active while pinned

Tvrtko Ursulin (1):
      drm/i915/pmu: Do not use colons or dashes in PMU names

YueHaibing (1):
      drm/i915: Add missing include file <linux/math64.h>

 drivers/gpu/drm/i915/gt/intel_context.c      | 40 +++++++++++++++++++++++++---
 drivers/gpu/drm/i915/i915_gem_gtt.c          |  7 ++---
 drivers/gpu/drm/i915/i915_pmu.c              | 11 +++++---
 drivers/gpu/drm/i915/selftests/i915_random.h |  1 +
 4 files changed, 48 insertions(+), 11 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
