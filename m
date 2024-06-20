Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D612590FE30
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281510E2E5;
	Thu, 20 Jun 2024 08:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpD5F6Fe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C42E10E2DB;
 Thu, 20 Jun 2024 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718870562; x=1750406562;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=6z51tK8pGRhA6LSDdrUFyamK7bWXLfILBTvRrRhhd6U=;
 b=LpD5F6Fe2L8Jf5YSAov2q5VdAqLEeIGrl7BkQskNTr0AHzn4lBcM6PL8
 SOcGOi6Ws4Eh9O7D2dCokflyOsNR1ev6pScfr9l0i7tg3dy21BcqpKvGE
 ujwMjwfIEmG+9UjM6CAwuJWPruB1MzaTfe0uSEwZ27YhAQ3QCIB/kaup6
 UfbWW+/E/HTkcmlKVznygQztisyhLjDTjAaA2RwSZNy0cpK5bH0vo6b2q
 9k6YEwZzWa9W9gWHJMnTYJaYs9HMLyPk6qkiJ8bxkDyeyWF4YI1zYW1d7
 B7QOIGkjeVpyMpJjB2XCdqhr9nLkgwZ5nsHViv52Vn6gL6pqfJIWbc1Jm w==;
X-CSE-ConnectionGUID: 3zfwNf4CTq+2Y0f71D/SNg==
X-CSE-MsgGUID: h0UoirczTk+jy721c4mZ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26518586"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="26518586"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 01:02:41 -0700
X-CSE-ConnectionGUID: lVvEIgHARkOWJZ2oqyY3Cg==
X-CSE-MsgGUID: l+nFTdE4Tx2lM6GNfOGjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46615026"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora) ([10.245.245.217])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 01:02:38 -0700
Date: Thu, 20 Jun 2024 10:02:27 +0200
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <ZnPiE4ROqBowa1nS@fedora>
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

Hi, Dave, Sima

A single fix this week.

Thanks,
Thomas

drm-xe-fixes-2024-06-20:
Driver Changes:
- Fix for invalid register access
The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-06-20

for you to fetch changes up to d21d44dbdde83c4a8553c95de1853e63e88d7954:

  drm/xe/vf: Don't touch GuC irq registers if using memory irqs (2024-06-20 09:22:37 +0200)

----------------------------------------------------------------
Driver Changes:
- Fix for invalid register access

----------------------------------------------------------------
Michal Wajdeczko (1):
      drm/xe/vf: Don't touch GuC irq registers if using memory irqs

 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
