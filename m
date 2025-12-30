Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E23CE918F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6310E86F;
	Tue, 30 Dec 2025 08:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiM3zenA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C47C10E2C8;
 Tue, 30 Dec 2025 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767084980; x=1798620980;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=REgqA+WS1olS25MSuroWbUxdMb469b9qExU/SVCyjYk=;
 b=jiM3zenAcBjddxjuJK70MeX/F7rL0OVBt5c6W/bfb8cZQ/8Dyydjeepo
 y6Fb14UNdLSRHDxtDKRtjfOdFaIW6V4yuyMD7SDwlALpJWB9nDbSxrYvn
 G4vQXh9GhGmpJzjx0Sb4SHOlN2z7neyoiihbuyrVkJyn50PPWa6us66rZ
 80xxxB1q0OFKJNUqSc9FLjOD07g4gTd+UioCMgeGaI0wCpI+X8cYJd7ui
 iNq6bEK5/6J32MRhj0S9vDiEbtdHIgVsGwxtezhtAeLGvtu9weJgCPR/G
 MCH5eekQiqr9f3/2hnsyTNgtKtArdHj+bOpMOBr9uJlRdJVQBNNSpXCvm Q==;
X-CSE-ConnectionGUID: 7dleZpfsSDWshXq5M9e73g==
X-CSE-MsgGUID: NfHbwGBLTluG8wVPPz4gIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68747668"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="68747668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 00:56:20 -0800
X-CSE-ConnectionGUID: +21/tMnWTkCPiJsXIHO53g==
X-CSE-MsgGUID: TnCbNA7cTTicIfKgD5RyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="238607509"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 00:56:16 -0800
Date: Tue, 30 Dec 2025 09:56:07 +0100
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
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <aVOTf6-whmkgrUuq@fedora>
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

The drm-xe-fixes PR towards -rc4. Two fixes for SVM and one adding
compiler barriers.

drm-xe-fixes-2025-12-30:
Core Changes:
- Ensure a SVM device memory allocation is idle before migration complete (Thomas)

Driver Changes:
- Fix a SVM debug printout (Thomas)
- Use READ_ONCE() / WRITE_ONCE() for g2h_fence (Jonathan)

The following changes since commit 80f9c601d9c4d26f00356c0a9c461650e7089273:

  drm/xe: Use usleep_range for accurate long-running workload timeslicing (2025-12-18 18:25:42 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-12-30

for you to fetch changes up to bed2a6bd20681aacfb063015c1edfab6f58a333e:

  drm/xe/guc: READ/WRITE_ONCE g2h_fence->done (2025-12-29 10:49:23 +0100)

----------------------------------------------------------------
Core Changes:
- Ensure a SVM device memory allocation is idle before migration complete (Thomas)

Driver Changes:
- Fix a SVM debug printout (Thomas)
- Use READ_ONCE() / WRITE_ONCE() for g2h_fence (Jonathan)

----------------------------------------------------------------
Jonathan Cavitt (1):
      drm/xe/guc: READ/WRITE_ONCE g2h_fence->done

Thomas Hellström (2):
      drm/xe/svm: Fix a debug printout
      drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use

 drivers/gpu/drm/drm_pagemap.c   | 17 ++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.c  | 14 +++++++----
 drivers/gpu/drm/xe/xe_migrate.c | 25 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_migrate.h |  6 +++--
 drivers/gpu/drm/xe/xe_svm.c     | 51 ++++++++++++++++++++++++++++++-----------
 include/drm/drm_pagemap.h       | 17 +++++++++++---
 6 files changed, 99 insertions(+), 31 deletions(-)
