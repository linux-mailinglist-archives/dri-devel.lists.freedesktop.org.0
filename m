Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467ACB832C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4D10E57A;
	Fri, 12 Dec 2025 08:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTzBA3Gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1BF10E574;
 Fri, 12 Dec 2025 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765526553; x=1797062553;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=YOgDUhSshfBzhEBZ7qzYvA3TdNhCWuzfxWuMGePWsDo=;
 b=cTzBA3Gvz4TRm68lFpR45BZP0fNWUxdYqCKips6EdD/dYwdQL9lf1hnW
 SZSWsJWsVewIJ8OAPYRTypOTHvIr15/OfCL3FgvAar+1FZ4J16vJH3iJT
 GJzEvzW0Hvaw3+r49cZ8K96K3pKa3iml/H9sxhUv6YF67VZLJs0H8AAy1
 MBfvDoG2iFnkCPieB8GHSJfJn1spyscAJ6YV88sn0GjkWHpWGlNioLuVS
 87ma0gRNzO5Hrp504+Caz7f0/TgfqZ7ZDvptU36tBRVlDMvYYoOeOmu2n
 oVU41D1Zjb5/2JYLIUmKUNcOfjozQ/hlpX9FDFENyBB0+q2diFZ2T5rSJ Q==;
X-CSE-ConnectionGUID: 5nZsMnF0TUeDHj5yiFrWcQ==
X-CSE-MsgGUID: jr6esjGYS+e52v7dNyDxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78220167"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78220167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 00:02:33 -0800
X-CSE-ConnectionGUID: fuXwU2buQGKfVPwAdBSZdQ==
X-CSE-MsgGUID: kkKL5IjoQXmTD1L8p0xZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="234420698"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 00:02:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next-fixes for v6.19-rc1
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Date: Fri, 12 Dec 2025 10:02:26 +0200
Message-ID: <281309f78560bcceebac8d5c0511efe66baf641c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

drm-intel-next-fixes-2025-12-12:
drm/i915 fixes for v6.19-rc1:
- Fix format string truncation warning
- FIx runtime PM reference during fbdev BO creation

BR,
Jani.

The following changes since commit c7685d11108acb387e44e3d81194d0d8959eaa44:

  Merge tag 'topic/drm-intel-plane-color-pipeline-2025-12-04' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-12-05 10:27:57 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2025-12-12

for you to fetch changes up to 1c7f9e528f8f488b060b786bfb90b40540854db3:

  drm/i915: Fix format string truncation warning (2025-12-09 15:53:12 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.19-rc1:
- Fix format string truncation warning
- FIx runtime PM reference during fbdev BO creation

----------------------------------------------------------------
Ard Biesheuvel (1):
      drm/i915: Fix format string truncation warning

Dibin Moolakadan Subrahmanian (1):
      drm/i915/fbdev: Hold runtime PM ref during fbdev BO creation

 drivers/gpu/drm/i915/display/intel_fbdev.c | 11 +++++++----
 drivers/gpu/drm/i915/intel_memory_region.h |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
Jani Nikula, Intel
