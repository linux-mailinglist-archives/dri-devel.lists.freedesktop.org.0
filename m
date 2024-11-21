Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336989D537E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 20:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1699310E1F4;
	Thu, 21 Nov 2024 19:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPMymUz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BF10E169;
 Thu, 21 Nov 2024 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732218023; x=1763754023;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=nufxwgwyom9rkfg2vzG4dt3losmETl9RTondmUdLhM0=;
 b=NPMymUz0dANFuAESbI5y3Sm/OCvFx6kOkbUYHiVWyuj/VibboxNnCXAh
 b9V8YAHb7rKni0nZIEJtMCUMNh6FEgmjvX6+tcuA/meo3ybB3YqDNTJVy
 0dpGv9LYL+JZSURdBZU9sd2KsBVViaY3NpmLaW+FmrhH95RzP1ojNMczf
 bcOau84DMpWw7QprydbGgPz5a4WxYe/JYlYpY52klgsmfcLv6JlzBY3i+
 IvS3aNjT197IrrpDZ2Yx6k1F7cNWlYADEOcSc4XWplxPXnZv2hrmeNsvH
 Ec1sZCm3sttasmk5/G5xnskgrl1I1cCNB/CsrzELJ9QXmgj0qybIoBKX/ Q==;
X-CSE-ConnectionGUID: tlR2xfb8TGmecg9GYR7mLw==
X-CSE-MsgGUID: 2nQt4iRnTvi5DNzV+xDJRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32499816"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32499816"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:40:22 -0800
X-CSE-ConnectionGUID: teiCY3ulTc6A5G39lLXEJw==
X-CSE-MsgGUID: 8gDD11eUTCqgjjvCfBk+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90288768"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.104])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:40:19 -0800
Date: Thu, 21 Nov 2024 20:39:53 +0100
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <Zz-MiVLFjOZQLrlc@fedora>
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

A couple of fixes to drm-xe-next. I'm currently looking into as to why they are
not CC'd stable and will ensure they get backported if needed.

Thanks,
Thomas

drm-xe-next-fixes-2024-11-21:
Driver Changes:
- Wake up waiters after wait condition set to true (Nirmoy Das)
- Mark the preempt fence workqueue as reclaim. (Matthew Brost)
The following changes since commit 6d9f9115c091c88cacf78734d8ea34c8609e8680:

  drm/xe/guc: Fix dereference before NULL check (2024-11-14 14:55:01 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-11-21

for you to fetch changes up to ed31ba0aa7e93ecac62cfd445c3228345bdd87e6:

  drm/xe: Mark preempt fence workqueue as reclaim (2024-11-21 17:16:38 +0100)

----------------------------------------------------------------
Driver Changes:
- Wake up waiters after wait condition set to true (Nirmoy Das)
- Mark the preempt fence workqueue as reclaim. (Matthew Brost)

----------------------------------------------------------------
Matthew Brost (1):
      drm/xe: Mark preempt fence workqueue as reclaim

Nirmoy Das (1):
      drm/xe/ufence: Wake up waiters after setting ufence->signalled

 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 drivers/gpu/drm/xe/xe_sync.c   | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
