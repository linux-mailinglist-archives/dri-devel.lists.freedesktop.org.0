Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B552B1121F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 22:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7549410E32D;
	Thu, 24 Jul 2025 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1Iei/Jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DDD10E09B;
 Thu, 24 Jul 2025 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753388574; x=1784924574;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=A2c5F0yV5S/slgP5bH8QsZkPQLLSdFERpZNT+3CQ3cs=;
 b=U1Iei/JhIklAH25WxLhtdpZG+vdN+WdJsiYd+npx/ymsdtQnDlp70PS3
 +xFYH5ivLB5YW6z1obdC+z5dqossf5eXFXCCXsEGSREIh84gCa1xHUint
 CUM5Ce7O53Fw1fZS1jdmV9gRV7SpRDdpY/QAvKPjEqMEBULyiLf1Av/2n
 mUOU1WDXMGVq2S41DEZ3txHEqXxp/hYujiU3e4lXhfd+VsYjCUXOT2U8l
 RQJW/gWW55Kw0Ep3EnrprFKdVgwoWA8sG5t+i0bxllwSqImuFJ8VelvCB
 2669ltzXsK9Zn8Rpf6U9wkdFtZZ1ZZa1wMZTdAQ0wgMaUhCpK+rgQVVnm g==;
X-CSE-ConnectionGUID: zJk0KxgDRr2Jm7zhhtMgiw==
X-CSE-MsgGUID: 1BvVAxATSHKYNOHEjeWcyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55598616"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55598616"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 13:22:53 -0700
X-CSE-ConnectionGUID: TtkZh9FeTiqIKr/Wz3Vgow==
X-CSE-MsgGUID: r99yHrz0TrqmK6KNV9cfdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="197564647"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.55])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 13:22:50 -0700
Date: Thu, 24 Jul 2025 22:22:35 +0200
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
Message-ID: <aIKWC2RPlbRxZc5o@fedora>
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

A single fix for -rc8/final.

Thanks,
Thomas

drm-xe-fixes-2025-07-24:
Driver Changes:
- Fix build without debugfs (Lucas)
The following changes since commit 5c244eeca57ff4e47e1f60310d059346d1b86b9b:

  drm/xe/pf: Resend PF provisioning after GT reset (2025-07-17 09:51:51 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-07-24

for you to fetch changes up to 99e91521cef80d74e4fefed16a156848052b13df:

  drm/xe: Fix build without debugfs (2025-07-24 21:06:52 +0200)

----------------------------------------------------------------
Driver Changes:
- Fix build without debugfs (Lucas)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe: Fix build without debugfs

 drivers/gpu/drm/xe/xe_gt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
