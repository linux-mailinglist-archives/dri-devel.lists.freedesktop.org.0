Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B015C9442FB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 08:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2010A10E894;
	Thu,  1 Aug 2024 06:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8ivAyP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D210E339;
 Thu,  1 Aug 2024 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722492175; x=1754028175;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=98QGORXf4Jk8xEe/KZMMAz6ZxZrhN49ewA9wXZg+uOU=;
 b=S8ivAyP6DDm7e3PjBsaelZ+ky5/qEy5OWhFahObwvw+SOQsMQJAHc1bP
 4ONWxQZteXCU2i5oTeEABO8cMuuCh1Kc0xjGUIK5hsA+3E7Ec90jI/UJQ
 fuCEK3vDko5QdhjplRuRxoM0227P0nFMGbRTcaybNMYuQ6ApWtayF6Rmf
 Cp/0MszM8Qo9q5u/coPt0KhcNcrWsY4e2rbuLzVISn/PUr6q/IO4mmxfc
 i2+LsdTdQaX/o5YW32gCvFza65q9Vkk5Nl0TMbVflBox0g9UvmA7NhgMv
 fVfjFPSTGQ7dxEUZg/7mA5raYvt2NDnsvddm5D8Ld+pxc189ma3Le7qe6 Q==;
X-CSE-ConnectionGUID: +S+siVsNRAeHwKk/Dg5lpA==
X-CSE-MsgGUID: LgtfGoWgTYuzfy9/DPAx2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31074615"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="31074615"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:02:53 -0700
X-CSE-ConnectionGUID: dBierVjjT6u7HZDUbxnd+g==
X-CSE-MsgGUID: umco3u+MTLK38HJBmleHsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59568855"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.205])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:02:49 -0700
Date: Thu, 1 Aug 2024 09:02:46 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <ZqslBkcZlInYdYgm@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Just three smaller fixups. CI is again all over the place after -rc1,
but below changes shouldn't make it any worse.

Regards, Joonas

***

drm-intel-fixes-2024-08-01:

- Static analysis fix for int overflow
- Fix for HDCP2_STREAM_STATUS macro and removal of PWR_CLK_STATE for gen12

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-08-01

for you to fetch changes up to 5b511572660190db1dc8ba412efd0be0d3781ab6:

  drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll() (2024-07-30 16:57:24 +0300)

----------------------------------------------------------------
- Static analysis fix for int overflow
- Fix for HDCP2_STREAM_STATUS macro and removal of PWR_CLK_STATE for gen12

----------------------------------------------------------------
Nikita Zhandarovich (1):
      drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()

Suraj Kandpal (1):
      drm/i915/hdcp: Fix HDCP2_STREAM_STATUS macro

Umesh Nerlige Ramappa (1):
      i915/perf: Remove code to update PWR_CLK_STATE for gen12

 drivers/gpu/drm/i915/display/intel_dpll_mgr.c  |  6 ++---
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h |  2 +-
 drivers/gpu/drm/i915/i915_perf.c               | 33 --------------------------
 3 files changed, 4 insertions(+), 37 deletions(-)
