Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0987CA5966
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 23:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CE910E9D3;
	Thu,  4 Dec 2025 22:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dINdouo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FB410E9B3;
 Thu,  4 Dec 2025 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764886174; x=1796422174;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=KWVaznbNaByvEhzIWR/j9v9sejMAXJJb8Gs3b4/Qv68=;
 b=dINdouo9QI6Jobg0s3RUPZ2PfJMpVHXohITaWFWDVvUftA6+gQuCh8Wp
 3TOh+dyLjhbf6V4+t4eMEeqvGaaKhrqVWTq92WRqr/fT7g7t2ZphfQMSk
 EIb2CLp5iCbS3avtY8qjWh/jKnnWrxb3c7fE2A1yLIeOuSyrNDbT2FK5L
 q82QQYDaxhQ5CKwAIZu0VPpu8VJqUbjGOli6gRckB6Lkm+fySl7TUe8sS
 8emhnYumfLmM2ZaypvH/mP6bAWd7yZUvlDKKlnnQqDhUqnYnY5jgzmb7Y
 Ru3Bkg+g0q7WrrUTOT32+k6z67DBOUXa6x0QsGrRn3SVtgGcrrlCcSeVK w==;
X-CSE-ConnectionGUID: G9k35WPKSqiWhVbZK38wrQ==
X-CSE-MsgGUID: HbNYxZDuQieUC6jDxzcE0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66993067"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66993067"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:09:27 -0800
X-CSE-ConnectionGUID: KMGR2i7HQU2EJBiy+Q6HfA==
X-CSE-MsgGUID: n0TGUWPuTpej3tc5MyHIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="226066057"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.245.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:09:23 -0800
Date: Thu, 4 Dec 2025 23:09:12 +0100
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
Subject: [PULL] drm-xe-next-fixes for 6.19
Message-ID: <aTIGiHJnnMtqbDOO@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
A last drm-xe-next-fixes for 6.19 with fixes that would be good to have
in -rc1.

Thanks,
Thomas

drm-xe-next-fixes-2025-12-04:

Driver Changes:
- Fix a memory leak (Mika)
- Fix a 64-bit division (Michal Wajdeczko)
- vf migration fix (Matt Brost)
- LRC pause Fix (Tomasz lis)
The following changes since commit 0692602defb0c273f80dec9c564ca50726404aca:

  Merge tag 'amd-drm-next-6.19-2025-12-02' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-12-03 09:43:49 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-12-04

for you to fetch changes up to 3f1c07fc21c68bd3bd2df9d2c9441f6485e934d9:

  Merge drm/drm-next into drm-xe-next-fixes (2025-12-04 22:54:56 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix a memory leak (Mika)
- Fix a 64-bit division (Michal Wajdeczko)
- vf migration fix (Matt Brost)
- LRC pause Fix (Tomasz lis)

----------------------------------------------------------------
Matthew Brost (1):
      drm/xe/vf: Start re-emission from first unsignaled job during VF migration

Michal Wajdeczko (1):
      drm/xe/pf: Use div_u64 when calculating GGTT profile

Mika Kuoppala (1):
      drm/xe: Fix memory leak when handling pagefault vma

Thomas Hellström (1):
      Merge drm/drm-next into drm-xe-next-fixes

Tomasz Lis (1):
      drm/xe: Protect against unset LRC when pausing submissions

 drivers/gpu/drm/xe/xe_gpu_scheduler.h      |  5 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         | 47 +++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pagefault.c          |  1 -
 drivers/gpu/drm/xe/xe_sched_job_types.h    |  4 +--
 5 files changed, 36 insertions(+), 23 deletions(-)
