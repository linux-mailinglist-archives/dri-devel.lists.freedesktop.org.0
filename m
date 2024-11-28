Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499E9DBAB3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 16:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DA210ECFA;
	Thu, 28 Nov 2024 15:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IldQAYeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEC210ECF6;
 Thu, 28 Nov 2024 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732808403; x=1764344403;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=huCa5X2VbCt5mlaPLKedPAFZgM5dZ0fXcet3cjR/1z8=;
 b=IldQAYeC/z+gB+crhVVcqlbiMoRCt9f23onr0UIAzrqgDNgms0SmDBRb
 I71Gfy1clJPvKXhwQitb7A8GBWkulq5S/uDUbRYcDznltIZWNEKHLadOd
 SDBLtQw86dwQ/fO8+FiUYuODkSJPgDAErjwELEfq1XA8Z8WiYPewh+e1+
 sQQTBiCXT4BpxJHXDWZyCs1ltuYFlOzH2G7H6jhpCJDpeHHnNjVnoZYgl
 XtkFsDVAQuLnYY3eScvmvtovGOdSeg8SqVAqVhXEnIugkCgiUh2/CZZy9
 psb+A/DFS6QDbacE9QYTsU/5qllOrubu+vxJtuxDrXJXr8bufCuoY9x8n g==;
X-CSE-ConnectionGUID: TUChNay5Q6SLA3WUkstg9w==
X-CSE-MsgGUID: nEpAIpY2RyGNIF55UXXaGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20635970"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="20635970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 07:40:02 -0800
X-CSE-ConnectionGUID: iG0wdZBkSj2QKvzIrA7GpA==
X-CSE-MsgGUID: cojZ9awxQCOkLG4tJHmF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129767054"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.195])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 07:39:59 -0800
Date: Thu, 28 Nov 2024 16:39:46 +0100
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
Message-ID: <Z0iOjKwEGVo_DmgY@fedora>
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

An all-Matt drm-xe-next-fixes PR this week.

Thanks,
Thomas

drm-xe-next-fixes-2024-11-28:
Driver Changes:
- Update xe2 graphics name string (Matt Roper)
- Fix a couple of guc submit races (Matt Auld)
- Fix pat index usage in migrate (Matt Auld)
- Ensure non-cached migrate pagetable bo mappings (Matt Auld)
- Take a PM ref in the delayed snapshot capture worker (Matt Brost)
The following changes since commit ed31ba0aa7e93ecac62cfd445c3228345bdd87e6:

  drm/xe: Mark preempt fence workqueue as reclaim (2024-11-21 17:16:38 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-11-28

for you to fetch changes up to aef0b4a07277f715bfc2a0d76a16da2bc4e89205:

  drm/xe: Take PM ref in delayed snapshot capture worker (2024-11-28 15:22:36 +0100)

----------------------------------------------------------------
Driver Changes:
- Update xe2 graphics name string (Matt Roper)
- Fix a couple of guc submit races (Matt Auld)
- Fix pat index usage in migrate (Matt Auld)
- Ensure non-cached migrate pagetable bo mappings (Matt Auld)
- Take a PM ref in the delayed snapshot capture worker (Matt Brost)

----------------------------------------------------------------
Matt Roper (1):
      drm/xe: Update xe2_graphics name string

Matthew Auld (4):
      drm/xe/guc_submit: fix race around pending_disable
      drm/xe/guc_submit: fix race around suspend_pending
      drm/xe/migrate: fix pat index usage
      drm/xe/migrate: use XE_BO_FLAG_PAGETABLE

Matthew Brost (1):
      drm/xe: Take PM ref in delayed snapshot capture worker

 drivers/gpu/drm/xe/xe_devcoredump.c |  6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c  | 34 +++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_migrate.c     |  6 ++++--
 drivers/gpu/drm/xe/xe_pci.c         |  2 +-
 4 files changed, 36 insertions(+), 12 deletions(-)
