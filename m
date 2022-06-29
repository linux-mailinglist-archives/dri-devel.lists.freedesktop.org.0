Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6055FDAE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 12:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF5112BC4D;
	Wed, 29 Jun 2022 10:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169C912BC4B;
 Wed, 29 Jun 2022 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656499589; x=1688035589;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lxIdPe9AgnyRbZj++EzzSe9jA1CI9ABE1KR8Jbk067A=;
 b=ReNpsCLBGRGbENqDiEA+hl81nkqbDXLcJLUmg+YTNq+Q/A652frpAdZG
 h9VOuVHkujGVAuHDhUr+DQ1qVSkCd34VcsXT1HAQ759FJGmpsfT4oN2sr
 A1Xhuw/zE6/RKkDNCklbVpuSKpABmHD11junP2/dcqJKae4W2ie1ZMvgH
 B653O/tpCwt/DYJKPHxEvd8nTuR6Ru/VjkdVrVUh0toKC/KUd60z2NnNg
 KKGyg0fWQPvk7cWa9yFx7f13Qq6YsRgnVaJY8olvQFwYddfzEgh6/2xrZ
 wm/jRjo3nhKFTf9WNe3DtDVQTZu/um/1wHyKC4bMpuz5DJduYBuzZGKqV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="279543615"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="279543615"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 03:46:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647339791"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.102])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 03:46:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 29 Jun 2022 13:46:20 +0300
Message-ID: <871qv7rblv.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2022-06-29:
drm/i915 fixes for v5.19-rc5:
- Fix ioctl argument error return
- Fix d3cold disable to allow PCI upstream bridge D3 transition
- Fix setting cache_dirty for dma-buf objects on discrete


Rodrigo will cover the remaining fixes until v5.19 final.


BR,
Jani.

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-06-29

for you to fetch changes up to 79538490fd7ade244dba400923e792519a2bdfea:

  drm/i915: tweak the ordering in cpu_write_needs_clflush (2022-06-27 18:12:10 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.19-rc5:
- Fix ioctl argument error return
- Fix d3cold disable to allow PCI upstream bridge D3 transition
- Fix setting cache_dirty for dma-buf objects on discrete

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915/dgfx: Disable d3cold at gfx root port

Matthew Auld (1):
      drm/i915: tweak the ordering in cpu_write_needs_clflush

katrinzhou (1):
      drm/i915/gem: add missing else

 drivers/gpu/drm/i915/gem/i915_gem_context.c |  5 +++--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c  |  6 ++---
 drivers/gpu/drm/i915/i915_driver.c          | 34 +++++++++++++----------------
 3 files changed, 21 insertions(+), 24 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
