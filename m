Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qElEH7QdcmmPdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 13:53:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84D66E4A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 13:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BFC10E9AF;
	Thu, 22 Jan 2026 12:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMMnaFDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4913310E9A1;
 Thu, 22 Jan 2026 12:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086382; x=1800622382;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=hcBay3dPMkCCiJCq9GvNU4xj4gjQCZN013RgJaZnFrs=;
 b=dMMnaFDWoIfv244bI+8xxMG0Otq7QrRvGYI9ExLgdrlZEkD0GMMp19ll
 B1smebPScTJRBSIadcmC3VPIwRjZzVc0VM9cmvlejO5JsR0Ri9tdcc5Ur
 NI4YokNy5Q2HLiuZXjW7qorhIZHCkldkw5z5bU9dxJQisg8wclIxAbfAT
 bh+L4TDAf1pu5sVSEr0KExhnIXHHKe4ashYxyaLR28YL5jh8m1SlWoLSH
 rgA7Stitqjfy8JcewcMuOqYrWwjEV8xaC4/CUiIPGz/OarAFDFwET11hr
 Z5uw6xjCKMmeaX14vMXJsVnowf/KLno7KgH3ERmLhGkx8IigaqTUhkSaH Q==;
X-CSE-ConnectionGUID: iUdQTY4FTI+evGJVOvbctg==
X-CSE-MsgGUID: hizIt61RR0qYdqvvs0cd4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87903699"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87903699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:53:02 -0800
X-CSE-ConnectionGUID: 2PAo5p9bQEeH5bp6td8bqg==
X-CSE-MsgGUID: rdsAIIX1S3mwutqnStOsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206783086"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.235])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:52:58 -0800
Date: Thu, 22 Jan 2026 13:52:25 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <aXIdiXaY-RxoaviV@fedora>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,intel.com:dkim]
X-Rspamd-Queue-Id: 2D84D66E4A
X-Rspamd-Action: no action

Hi Dave, Simona

The drm-xe-fixes for -rc7.

Some notable changes:
- There is an UAPI fix by Matt Auld that allows us to skip a hairy
  fix in the driver that probably nobody would want to use anyway.
- Xe userptr was broken in 6.18 in the absence of CONFIG_DEVICE_PRIVATE.
  that's a regression that causes problem for people. Fix included,
  although some backporting had to be done so it conflicts a bit with
  drm-next. Resolution in drm-rerere.
- There is a (perhaps somewhat late) to the SVM config logic. It's not
  CC'd stable to avoid unlikely but possible side-effects from enabling
  CONFIG_DEVICE_PRIVATE. The purpose is to make the XE SVM choice more
  visible to increase the likelyhood of getting the code exercised and tested.

Thanks,
Thomas

drm-xe-fixes-2026-01-22:
UAPI Changes:
- Disallow bind-queue sharing across multiple VMs (Matt Auld)

Core Changes:
- Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE (Thomas)

Driver Changes:
- Fix a missed page count update (Matt Brost)
- Fix a confused argument to alloc_workqueue() (Marco Crivellari)
- Kernel-doc fixes (Jani)
- Disable a workaround on VFs (Matt Brost)
- Fix a job lock assert (Matt Auld)
- Update wedged.mode only after successful reset policy change (Lukasz)
- Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected (Thomas)
The following changes since commit 9dd1f5f3eb8cb175e2f7fd2a685bdb6b1bd2a726:

  Merge tag 'drm-misc-fixes-2026-01-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2026-01-16 20:27:21 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2026-01-22

for you to fetch changes up to e27ada4f19e7ffda4c05ce8633daf6daed667eea:

  drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected (2026-01-22 11:27:25 +0100)

----------------------------------------------------------------
UAPI Changes:
- Disallow bind-queue sharing across multiple VMs (Matt Auld)

Core Changes:
- Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE (Thomas)

Driver Changes:
- Fix a missed page count update (Matt Brost)
- Fix a confused argument to alloc_workqueue() (Marco Crivellari)
- Kernel-doc fixes (Jani)
- Disable a workaround on VFs (Matt Brost)
- Fix a job lock assert (Matt Auld)
- Update wedged.mode only after successful reset policy change (Lukasz)
- Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected (Thomas)

----------------------------------------------------------------
Jani Nikula (3):
      drm/xe/vf: fix struct xe_gt_sriov_vf_migration kernel-doc
      drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id kernel-doc
      drm/xe/vm: fix xe_vm_validation_exec() kernel-doc

Lukasz Laguna (1):
      drm/xe: Update wedged.mode only after successful reset policy change

Marco Crivellari (1):
      drm/xe: fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue()

Matthew Auld (2):
      drm/xe/uapi: disallow bind queue sharing
      drm/xe/migrate: fix job lock assert

Matthew Brost (2):
      drm/xe: Adjust page count tracepoints in shrinker
      drm/xe: Disable timestamp WA on VFs

Thomas Hellström (2):
      drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
      drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

 drivers/gpu/drm/Kconfig                    |  2 +-
 drivers/gpu/drm/Makefile                   |  4 +-
 drivers/gpu/drm/xe/Kconfig                 |  5 ++-
 drivers/gpu/drm/xe/xe_bo.c                 |  9 +++-
 drivers/gpu/drm/xe/xe_debugfs.c            | 72 +++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_device_types.h       | 18 ++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c         | 32 ++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h         |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h   |  6 +++
 drivers/gpu/drm/xe/xe_ggtt.c               |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h  |  4 +-
 drivers/gpu/drm/xe/xe_guc_ads.c            | 14 +++---
 drivers/gpu/drm/xe/xe_guc_ads.h            |  5 ++-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  4 +-
 drivers/gpu/drm/xe/xe_lrc.c                |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c            |  4 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                 |  7 ++-
 drivers/gpu/drm/xe/xe_vm.h                 |  2 +-
 include/drm/drm_pagemap.h                  | 19 +++++++-
 20 files changed, 175 insertions(+), 40 deletions(-)
