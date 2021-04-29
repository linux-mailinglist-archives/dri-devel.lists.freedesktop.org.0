Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7636E7B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BBD6E1BC;
	Thu, 29 Apr 2021 09:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D41D6E1BC;
 Thu, 29 Apr 2021 09:13:02 +0000 (UTC)
IronPort-SDR: ZNYAF9ez9a7i6zS6HGYllTGicTDCpGv1DpevVG9xLbn/W7flIVQhH/E3743LWsVBQJXj5o/6dy
 2OL+PZF2X4kQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011291"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011291"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:01 -0700
IronPort-SDR: 2kjDPsjb5v70aD7/twL6J079dNnN8ajzzmdYt5+0pDPB6YqbzVpgXPWZiIShLggxM5K+cXmeTO
 A//aaoXYlOPQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298784"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:00 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] Workaround building improvements
Date: Thu, 29 Apr 2021 10:12:48 +0100
Message-Id: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Some cleanups and improvements to checks being done when building workaround
lists. First five patches are small cleanups while the last one contains the
actual story of what gets improved.

Test-with: 20210429084130.850426-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (6):
  drm/i915: Drop duplicate WaDisable4x2SubspanOptimization:hsw
  drm/i915/debugfs: Expose read mask in i915_wa_registers
  drm/i915: Add a separate low-level helper for masked workarounds
  drm/i915/icl: Use appropriate helper for a masked workaround
  drm/i915/icl: Stop conflating mask and readback verify
  drm/i915: Add more checks when building workaround lists

 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 163 +++++++++++++-----
 .../gpu/drm/i915/gt/intel_workarounds_types.h |   4 +
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   4 +-
 4 files changed, 124 insertions(+), 51 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
