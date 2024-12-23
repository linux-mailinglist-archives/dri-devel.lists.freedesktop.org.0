Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36019FB3B7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 18:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570E410E5A7;
	Mon, 23 Dec 2024 17:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxfN+jXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E8610E598;
 Mon, 23 Dec 2024 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734976464; x=1766512464;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=WYLIE+diRVGaLj2Jxor8J60nt/a9sZs6gWFZzhLo8pg=;
 b=VxfN+jXDY8korKKM0vmgElZZwwbITQCbLuwdKwfhoRYBlSiTkCyksbxB
 L8D82YK2i4tZEU/GLuF6ziEfhqyL7cWDWan0mFd3zJy8wJHCnd0D+5PxW
 uY5dcrGs+dpg2F0obpMAiakF5zk19rxfvCDoK5HYBBlNujPqEbwSdmv4e
 zvRf9IKonEOwFRnp4X0p6cz/KrvRu4DWThAeLfThh5o6AzCWZFwqZWc/4
 7EVIlqTEx2IhZXzSroRlYyzYYD3LCA2QQBcjXFfUQH0mpLm8kQj/nwvNn
 1mcy1+A49yHBBPZvDCGs0YVot2haBmBYgG+aEG1dLzlJbJYm/qRo8utMZ Q==;
X-CSE-ConnectionGUID: 8WpcDgCtQ1GKfT+UsKaWLA==
X-CSE-MsgGUID: oQr5bShUQqymkWQVErnneA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46452683"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="46452683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:54:24 -0800
X-CSE-ConnectionGUID: KQQf/0JNSm2B+9k7wvweKg==
X-CSE-MsgGUID: bOAqHcwwTaeB0FmoD6HQDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="99491355"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.74])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:54:20 -0800
Date: Mon, 23 Dec 2024 18:53:59 +0100
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
Message-ID: <Z2mjt7OTfH76cgua@fedora>
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

The Xe fixes for -rc5.

Thanks,
Thomas

drm-xe-fixes-2024-12-23:
UAPI Changes:
- Revert some devcoredump file format changes
  breaking a mesa debug tool (John)

Driver Changes:
- Fixes around waits when moving to system (Nirmoy)
- Fix a typo when checking for LMEM provisioning (Michal)
- Fix a fault on fd close after unbind (Lucas)
The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-12-23

for you to fetch changes up to fe39b222a4139354d32ff9d46b88757f63f71d63:

  drm/xe: Fix fault on fd close after unbind (2024-12-23 16:19:52 +0100)

----------------------------------------------------------------
UAPI Changes:
- Revert some devcoredump file format changes
  breaking a mesa debug tool (John)

Driver Changes:
- Fixes around waits when moving to system (Nirmoy)
- Fix a typo when checking for LMEM provisioning (Michal)
- Fix a fault on fd close after unbind (Lucas)

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

 drivers/gpu/drm/xe/xe_bo.c                 | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_devcoredump.c        | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 4 files changed, 34 insertions(+), 4 deletions(-)
