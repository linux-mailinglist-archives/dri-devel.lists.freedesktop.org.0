Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7DC9654A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A8510E39C;
	Mon,  1 Dec 2025 09:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbID8z4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043E10E390;
 Mon,  1 Dec 2025 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764580166; x=1796116166;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Djb7wvQP3//C24mluUdxYyDMw87ihkbEH4Pt5HJDiDk=;
 b=VbID8z4NMUE2d0KTx5zIbGjvYWOHNJXRkxdGeoUUkTgm87b4U5Fs2tvv
 r9iC8tVDd4O1QoBiiMIwtIhvraniEVAWZfcCxClalo2lxAGS4oSrl9FOA
 pVAvXAU9FHmS/kVUPtE79IfDu6jzGJdUrIwdMwDcbI6jWuOi6y6ltcise
 DiHAEHpxwePu4kplteBfX/1bwW7dZ0Dn6RXhOno9rsN30slA12qHq2EyO
 XrXeFxq7OFtKVcedyc+Y4TL6PGf7ZW64dHSr0/sn7adrP6n6qUSQsr2X8
 yspTwF3Td5ZRBrxaRIrzj1naRyLiB0uyo1atOusISZ3bsyooPAXQIURLo A==;
X-CSE-ConnectionGUID: VST0bpWIRkylN8WHZCXLJQ==
X-CSE-MsgGUID: 2K7A3EVLQ9yZgEwAKo4AqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65695435"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="65695435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:09:26 -0800
X-CSE-ConnectionGUID: qpJ+ppCtTIasDRe9Q+ONzw==
X-CSE-MsgGUID: TrvTtBDqTGKCVZeNKvAMsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194011231"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.245.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:09:22 -0800
Date: Mon, 1 Dec 2025 10:09:10 +0100
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
Subject: [PULL] topic/xe-vfio
Message-ID: <aS1bNpqeem6PIHrA@fedora>
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

Hi Dave, Simona!

Here's a PR of the xe-vfio driver variant for xe as discussed on IRC.
It includes some prereq drm-xe patches and the vfio driver itself.
For ack to merge through drm, please see second Link: in the vfio
driver patch.

Using a topic branch as suggested.

Thanks,
Thomas

topic/xe-vfio-2025-12-01:
Cross-subsystem Changes:
- Add device specific vfio_pci driver variant for intel graphics (Michal Winiarski)

Driver Changes:
- Add scope-based cleanup helper for runtime PM (Matt Roper)
- Additional xe driver prerequisites and exports (Michal Winiarski)
The following changes since commit 62433efe0b06042d8016ba0713d801165a939229:

  Merge tag 'drm-misc-next-fixes-2025-11-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-11-28 09:04:52 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/topic/xe-vfio-2025-12-01

for you to fetch changes up to 1f5556ec8b9efbb784aeb3536e147182dee73d0f:

  vfio/xe: Add device specific vfio_pci driver variant for Intel graphics (2025-12-01 09:45:48 +0100)

----------------------------------------------------------------
Cross-subsystem Changes:
- Add device specific vfio_pci driver variant for intel graphics (Michal Winiarski)

Driver Changes:
- Add scope-based cleanup helper for runtime PM (Matt Roper)
- Additional xe driver prerequisites and exports (Michal Winiarski)

----------------------------------------------------------------
Matt Roper (1):
      drm/xe/pm: Add scope-based cleanup helper for runtime PM

Michał Winiarski (4):
      drm/xe/pf: Enable SR-IOV VF migration
      drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
      drm/xe/pf: Export helpers for VFIO
      vfio/xe: Add device specific vfio_pci driver variant for Intel graphics

 MAINTAINERS                                      |   7 +
 drivers/gpu/drm/xe/Makefile                      |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c    |   9 +
 drivers/gpu/drm/xe/xe_pci.c                      |  17 +
 drivers/gpu/drm/xe/xe_pci.h                      |   3 +
 drivers/gpu/drm/xe/xe_pm.c                       |  21 +
 drivers/gpu/drm/xe/xe_pm.h                       |  17 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c       |  35 +-
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h       |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vfio.c               |  80 ++++
 drivers/vfio/pci/Kconfig                         |   2 +
 drivers/vfio/pci/Makefile                        |   2 +
 drivers/vfio/pci/xe/Kconfig                      |  12 +
 drivers/vfio/pci/xe/Makefile                     |   3 +
 drivers/vfio/pci/xe/main.c                       | 573 +++++++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h                | 143 ++++++
 17 files changed, 926 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h
