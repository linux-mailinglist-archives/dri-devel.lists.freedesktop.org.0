Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B127399CB3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CA76F430;
	Thu,  3 Jun 2021 08:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF5D6F42E;
 Thu,  3 Jun 2021 08:37:51 +0000 (UTC)
IronPort-SDR: IzgwLCB4n6leeoBLt193+g0q4pr/lOlWs690JwwRMcv8gSEOPjaFmLCkEyODSS2wfjVphzycSm
 OTuWjdDNcfCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="267863335"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="267863335"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:37:44 -0700
IronPort-SDR: Gohd7K8nXCq0XZ8ppl5wjIN4uoNxo6XDOnrU4bH4nliAYbGxgNfUmJ45tGP+AJDdPYKDesNcGX
 kdoV61CXWjOw==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="447768818"
Received: from sleader-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.200])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:37:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 03 Jun 2021 11:37:34 +0300
Message-ID: <87lf7rpcmp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2021-06-03:
drm/i915 fixes for v5.13-rc5:
- Revert conversion to io_mapping_map_user() which lead to BUG_ON()
- Fix check for error valued returns in a selftest

BR,
Jani.

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-06-03

for you to fetch changes up to b87482dfe800f326f8f5b0093273ee6bd5b5fe9f:

  Revert "i915: use io_mapping_map_user" (2021-06-02 15:06:10 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.13-rc5:
- Revert conversion to io_mapping_map_user() which lead to BUG_ON()
- Fix check for error valued returns in a selftest

----------------------------------------------------------------
Matthew Auld (1):
      Revert "i915: use io_mapping_map_user"

Zhihao Cheng (1):
      drm/i915/selftests: Fix return value check in live_breadcrumbs_smoketest()

 drivers/gpu/drm/i915/Kconfig                  |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  9 +++---
 drivers/gpu/drm/i915/i915_drv.h               |  3 ++
 drivers/gpu/drm/i915/i915_mm.c                | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/selftests/i915_request.c |  4 +--
 5 files changed, 54 insertions(+), 7 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
