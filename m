Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC7F9FFFB0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AF110E7B1;
	Thu,  2 Jan 2025 19:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wwh+H2oH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7510E7AB;
 Thu,  2 Jan 2025 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735847617; x=1767383617;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=VaTzo2T/cod32BIpGYEBKEdj95muaj+NKxvfgxWDsBo=;
 b=Wwh+H2oH7BaIx5iaVgnZ5dJLx+HDwsjvj+gln5WuBGrVX/RQpsgAN2Ff
 CDi4rGsohiYxg/EXXJ8I7HLQj4oSobGeWpf1LIhM6J7IlaB7LphHjH1t1
 xCk3uqnLsei8Kcj6KYYdEQuK/lJcwJ2P/RPCBwICDSeWq/qEQhz0jmBa8
 r4+rwWXBWiLYubvjt6Qu88rA96kG1fg33msJVod5nnu6KysGl2DeoBoGl
 gLsH/1777wck4n49/60sa+P0UoHo2hyYAixhqv/9PQ72YxV80Rh2PMk79
 KhhHS33ucd3vnDbsUsksaWQUgqpGMwUUe/y1XQyEIKqL24kCfTpalhUpp w==;
X-CSE-ConnectionGUID: kDv9CaN2T3mYhA+HWWM3SQ==
X-CSE-MsgGUID: Sxz2ZQnqRD+WUu8U9K22Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36211971"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36211971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 11:53:37 -0800
X-CSE-ConnectionGUID: uBnHzayzTLS3Q8JSnhVEmw==
X-CSE-MsgGUID: fFZ/OmrlQzOh+QIZ4faibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="106457554"
Received: from slindbla-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.246.226])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 11:53:32 -0800
Date: Thu, 2 Jan 2025 20:53:19 +0100
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
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <Z3bur0RmH6-70YSh@fedora>
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

Hi Dave, Simona!

Happy new year!
This PR supersedes the one sent out 24-12-23, since that didn't seem to get
pulled over the holidays. There's one extra commit (The OA fixes). The
rest of the summary is repeated.

Thanks,
Thomas

drm-xe-fixes-2025-01-02:
This supersedes drm-xe-fixes-2024-12-23.

UAPI Changes:
- Revert some devcoredump file format changes
  breaking a mesa debug tool (John)

Driver Changes:
- Fixes around waits when moving to system (Nirmoy)
- Fix a typo when checking for LMEM provisioning (Michal)
- Fix a fault on fd close after unbind (Lucas)
- A couple of OA fixes squashed for stable backporting (Umesh)
The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-01-02

for you to fetch changes up to f0ed39830e6064d62f9c5393505677a26569bb56:

  xe/oa: Fix query mode of operation for OAR/OAC (2025-01-02 19:01:21 +0100)

----------------------------------------------------------------
This supersedes drm-xe-fixes-2024-12-23.

UAPI Changes:
- Revert some devcoredump file format changes
  breaking a mesa debug tool (John)

Driver Changes:
- Fixes around waits when moving to system (Nirmoy)
- Fix a typo when checking for LMEM provisioning (Michal)
- Fix a fault on fd close after unbind (Lucas)
- A couple of OA fixes squashed for stable backporting (Umesh)

----------------------------------------------------------------
John Harrison (1):
      drm/xe: Revert some changes that break a mesa debug tool

Lucas De Marchi (1):
      drm/xe: Fix fault on fd close after unbind

Michal Wajdeczko (1):
      drm/xe/pf: Use correct function to check LMEM provisioning

Nirmoy Das (2):
      drm/xe: Use non-interruptible wait when moving BO to system
      drm/xe: Wait for migration job before unmapping pages

Umesh Nerlige Ramappa (1):
      xe/oa: Fix query mode of operation for OAR/OAC

 drivers/gpu/drm/xe/xe_bo.c                 |  12 ++-
 drivers/gpu/drm/xe/xe_devcoredump.c        |  15 +++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |   9 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   2 +-
 drivers/gpu/drm/xe/xe_oa.c                 | 134 ++++++++++-------------------
 drivers/gpu/drm/xe/xe_ring_ops.c           |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h    |   2 +
 7 files changed, 85 insertions(+), 94 deletions(-)
