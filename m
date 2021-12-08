Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41AB46D63C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 15:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1977374D;
	Wed,  8 Dec 2021 14:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C7873749;
 Wed,  8 Dec 2021 14:58:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="324101040"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="324101040"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 06:58:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="462787998"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 06:58:18 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/i915: Sanity Check for device memory region
Date: Wed,  8 Dec 2021 20:27:57 +0530
Message-Id: <20211208145800.27246-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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

Changes for introducing the quick test on the device memory range and
also a test of detailed validation for each addr of the range with read
and write.

Detailed testing is optionally enabled with a modparam i915.memtest=1

And third patch fixes the driver accessible stolen memory.

v2: Adding a wrapper for the memtest [Chris]

Chris Wilson (3):
  drm/i915: Exclude reserved stolen from driver use
  drm/i915: Sanitycheck device iomem on probe
  drm/i915: Test all device memory on probing

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c |   3 +
 drivers/gpu/drm/i915/i915_params.c         |   3 +
 drivers/gpu/drm/i915/i915_params.h         |   1 +
 drivers/gpu/drm/i915/intel_memory_region.c | 128 +++++++++++++++++++++
 4 files changed, 135 insertions(+)

-- 
2.20.1

