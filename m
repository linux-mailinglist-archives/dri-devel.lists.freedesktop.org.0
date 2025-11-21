Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5961C7837B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 10:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862B10E803;
	Fri, 21 Nov 2025 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdObhguZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84210E133;
 Fri, 21 Nov 2025 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763718399; x=1795254399;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=qAYRXDP3YxcNC7GNhMYVfpJnXpiA3jEZmGW3pib3VS8=;
 b=BdObhguZkwwRsVUjHuNr7gWFvIfzgEUQbwTPK/3P+VJO98E0o6HF80tg
 2KZrUAlzj7MUa4gnh3md6XMZ5fW9YVbKv+xjFeeqVYwrfv+e+MpO23cmS
 bpTweLlEa77dMoDIgXZrcJPgDCcGepYDHVfuUSlS/t/2bh7sMajl5GxGM
 XWgaTNDhUmYNatk2xOkRyhSLNosHERJX0cyy97QXvp7qqpMdS21G/E7uq
 nUg25rAHbuwxwlwT5o3hCGP+8mmrV7LyeWRdoXlznEqMYxwKZS3/qvUiz
 LOyfphnqlctqhDaCt9Ggl9Xn4K33ewuWOC1ghaf/G+P5af7CS9vs3o9cD w==;
X-CSE-ConnectionGUID: UQWe4BZSQk6yJj6Yw389oA==
X-CSE-MsgGUID: 2nKz1I5hRMiKvmLGSwiVEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77276438"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77276438"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:46:39 -0800
X-CSE-ConnectionGUID: NuRQ+670QAyo3mH1T6plGw==
X-CSE-MsgGUID: NYY+zMblQP2C7VcHKL/Njw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191440131"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.245.9])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:46:35 -0800
Date: Fri, 21 Nov 2025 10:46:24 +0100
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aSA08EW9JMU3LkIu@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

This week's drm-xe-next-fixes PR for drm-next.

drm-xe-next-fixes-2025-11-21:
Driver Changes:
- A couple of SR-IOV fixes (Michal Winiarski)
- Fix a potential UAF (Sanjay)

The following changes since commit f0ded972d37150f9f889de75c9eecc5cb0730013:

  Merge tag 'drm-rust-next-2025-11-18' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-next (2025-11-20 10:44:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-11-21

for you to fetch changes up to dcb171931954c51a1a7250d558f02b8f36570783:

  drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl() (2025-11-21 08:41:04 +0100)

----------------------------------------------------------------
Driver Changes:
- A couple of SR-IOV fixes (Michal Winiarski)
- Fix a potential UAF (Sanjay)

----------------------------------------------------------------
Michał Winiarski (3):
      drm/xe/pf: Fix kernel-doc warning in migration_save_consume
      drm/xe/pf: Drop the VF VRAM BO reference on successful restore
      drm/xe/pf: Check for fence error on VRAM save/restore

Sanjay Yadav (1):
      drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()

 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_oa.c                    |  8 +++++---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  2 --
 3 files changed, 16 insertions(+), 5 deletions(-)
