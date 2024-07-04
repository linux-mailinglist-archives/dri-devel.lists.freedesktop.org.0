Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED013927465
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 12:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6950010EA88;
	Thu,  4 Jul 2024 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wclo1QZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D8810EA7E;
 Thu,  4 Jul 2024 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720090320; x=1751626320;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=19CmyC12izESJi3+ELABAgcEAnzU2gJfwyP53mRhZTY=;
 b=Wclo1QZkRKAsuwk6PgeQjIq/dwLjQ7Dt+LxnBubisDdiDbF9RfeX1mqW
 YA0KRmg+FtpyFGN4dkGw1CvA2tudkwSDpxUH/mSplR+yR/R+YE/prT0yw
 wgsEbOZzWHivFLpQB6rbTiWr9DP4vKoQPt3X0UMrQIj4NripRVZSfzarN
 CygAaI/eNQPHRqpa6abmidE+FvWl/1OeBl0wPRdGamFPkaucjfEw8qQNd
 FLzJ5S/YuWpE7tPg4VXxe/aRsxRFB0YbpjcO9Pyigpaf++LTFoGmmQxvx
 TaYsZCw5WUK/qGlnNCz5gJCLsfyGMfroZ5YVPwXMcm5WdzrmQ/T6OL4P3 w==;
X-CSE-ConnectionGUID: 7S3+y8O4Sk2uempxRIOeLw==
X-CSE-MsgGUID: n+o1atfwS6OFGqSGyLGd8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17200775"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17200775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 03:51:59 -0700
X-CSE-ConnectionGUID: 3Ut1ZM6tTei1XFOmjNL23A==
X-CSE-MsgGUID: y0H/Se8wSkCSV9ezy/2upw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46700305"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 03:51:55 -0700
Date: Thu, 4 Jul 2024 12:51:44 +0200
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
Message-ID: <ZoZ-wD66lgjiNh72@fedora>
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

Hi Dave and Sima

Two small fixes this week.

Thanks,
Thomas

drm-xe-fixes-2024-07-04:
Driver Changes:
- One copy/paste mistake fix.
- One error path fix causing an error pointer dereference.

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-07-04

for you to fetch changes up to 1f006470284598060ca1307355352934400b37ca:

  drm/xe/mcr: Avoid clobbering DSS steering (2024-07-04 10:36:30 +0200)

----------------------------------------------------------------
Driver Changes:
- One copy/paste mistake fix.
- One error path fix causing an error pointer dereference.

----------------------------------------------------------------
Matt Roper (1):
      drm/xe/mcr: Avoid clobbering DSS steering

Matthew Auld (1):
      drm/xe: fix error handling in xe_migrate_update_pgtables

 drivers/gpu/drm/xe/xe_gt_mcr.c  | 6 +++---
 drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)
