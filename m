Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE1AF69C3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 07:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392810E004;
	Thu,  3 Jul 2025 05:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBm6ja16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6079A10E004;
 Thu,  3 Jul 2025 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751520580; x=1783056580;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=YcU6pUuL1Im3Dl0pZlz4TNdAxtIplL/UCAjdPBU0OjI=;
 b=NBm6ja16Hv4f7lwxpeqjNBIPTGYeSZu4ETe5xiAw2GUWANX6sfi/xP3/
 DZP7gL0E8VOae1k885dMYVmHg+WViSN/yyrrsSEm7MXTsQxmuTYQ2pB7e
 AL0wRw4ziNjduoFVewIsRv4i3GZdwNSckQ2JwVI9qBj66rreAFi6BcE7T
 nwXpkjowZ61wmJDA9K0V3ha16pktskgeRgUyFw27KY+IRZ0D4KAPZueZX
 IiFV4eziXrJYozLRFfXq4ZTHkquBBigWRDlASGpQ6Z1Ft2a40ZRxCjdJ0
 qT+xnXaGIx34wz+Tz9tA39zO9HyLrb9ifA4MMdj3IXopU6k8REbzbmYDa g==;
X-CSE-ConnectionGUID: Fook2PsASG6dt/aoMQkzQQ==
X-CSE-MsgGUID: 7e9Y8Zz+QuyY2qg07l0srg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53801109"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53801109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:29:39 -0700
X-CSE-ConnectionGUID: /FZ9ZBQZQUK1mLody2gGRA==
X-CSE-MsgGUID: aIaIEz1JQkizBchu6yDaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="158633617"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.89])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:29:35 -0700
Date: Thu, 3 Jul 2025 08:29:32 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <aGYVPAA4KvsZqDFx@jlahtine-mobl>
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

Here's drm-intel-fixes towards 6.16-rc5.

Fix for mei interrupt handling on RT builds, two NULL deref fixes
and one memory leak fix.

Regards, Joonas

***

drm-intel-fixes-2025-07-03:

- Make mei interrupt top half irq disabled to fix RT builds
- Fix timeline left held on VMA alloc error
- Fix NULL pointer deref in vlv_dphy_param_init()
- Fix selftest mock_request() to avoid NULL deref

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-07-03

for you to fetch changes up to 8cadce97bf264ed478669c6f32d5603b34608335:

  drm/i915/gsc: mei interrupt top half should be in irq disabled context (2025-07-01 08:10:46 +0300)

----------------------------------------------------------------
- Make mei interrupt top half irq disabled to fix RT builds
- Fix timeline left held on VMA alloc error
- Fix NULL pointer deref in vlv_dphy_param_init()
- Fix selftest mock_request() to avoid NULL deref

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/selftests: Change mock_request() to return error pointers

Hans de Goede (1):
      drm/i915/dsi: Fix NULL pointer deref in vlv_dphy_param_init()

Janusz Krzysztofik (1):
      drm/i915/gt: Fix timeline left held on VMA alloc error

Junxiao Chang (1):
      drm/i915/gsc: mei interrupt top half should be in irq disabled context

 drivers/gpu/drm/i915/display/vlv_dsi.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c             |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c |  3 ++-
 drivers/gpu/drm/i915/selftests/i915_request.c   | 20 ++++++++++----------
 drivers/gpu/drm/i915/selftests/mock_request.c   |  2 +-
 5 files changed, 15 insertions(+), 14 deletions(-)
