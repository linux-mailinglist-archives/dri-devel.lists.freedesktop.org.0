Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C3CA08052
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 20:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BF910EE94;
	Thu,  9 Jan 2025 19:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDqWGLUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BF110E390;
 Thu,  9 Jan 2025 19:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736449208; x=1767985208;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=MrOhBx2de3zTOAJbV5+E4h0q1M9W2HVGFiuHuR0hK3A=;
 b=JDqWGLUtRLSt8HGsAuifi/Nv6YVUmobYKtaza8zQUiPFmGFLCbyGBEAB
 I8uB7YLn/o99qGtOjjFxfHTN3fkqCdIFwIBQbZ7wFXvAdo01uACtjr6P7
 r50MqoewzjMHyrsFGBqUGjiPED5PJNpIBA/wVpQf/aAPmXGVRFI0tSJdy
 hayIGLX5AvOUgYFysF0d1p5YuFO0XBz3eu7nfCEIfNOt5RRS3rKhrTU76
 jOp5STp3iskfiuAJiXCDpV25UULkZM9tl+h8IlthYnQn9PYgtpcfztYEl
 DJlkq7+H5NS666wHrxdflhaqbqeAO1KMEVgjkEbJxc8QQG7XoFbuhj/v6 A==;
X-CSE-ConnectionGUID: +soPOXc3TZOBOY2+ZaEFIQ==
X-CSE-MsgGUID: EYe3dnfySUypJ7zpxhlHqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36613791"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36613791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 11:00:08 -0800
X-CSE-ConnectionGUID: Qy5lptw4TTiWlm3F/t7TZA==
X-CSE-MsgGUID: 7YsSVaDTSHKvcEmXdqlL2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107535465"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.246.231])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 11:00:03 -0800
Date: Thu, 9 Jan 2025 19:59:52 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <Z4AcqP3Io_r0pEsR@fedora>
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

Hi Dave, Simona

Two fixes this week.

Thanks,
Thomas

drm-xe-fixes-2025-01-09:
Driver Changes:
- Avoid a NULL ptr deref when wedging (Lucas)
- Fix power gate sequence on DG1 (Rodrigo)
The following changes since commit f0ed39830e6064d62f9c5393505677a26569bb56:

  xe/oa: Fix query mode of operation for OAR/OAC (2025-01-02 19:01:21 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-01-09

for you to fetch changes up to b84e1cd22f8a8c03b7b1051372560c7017c8be92:

  drm/xe/dg1: Fix power gate sequence. (2025-01-09 10:38:56 +0100)

----------------------------------------------------------------
Driver Changes:
- Avoid a NULL ptr deref when wedging (Lucas)
- Fix power gate sequence on DG1 (Rodrigo)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe: Fix tlb invalidation when wedging

Rodrigo Vivi (1):
      drm/xe/dg1: Fix power gate sequence.

 drivers/gpu/drm/xe/xe_gt.c                  |  8 ++++----
 drivers/gpu/drm/xe/xe_gt_idle.c             | 10 ++++++----
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++-
 4 files changed, 14 insertions(+), 11 deletions(-)
