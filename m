Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27CB906AF4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7D10EA41;
	Thu, 13 Jun 2024 11:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XasnU4Xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1022010EA3F;
 Thu, 13 Jun 2024 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718277992; x=1749813992;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=DI4xzYNkB0VECoqPzxVIwPHU0XAMRO514hn2ZEc+w/Q=;
 b=XasnU4Xg1gwDGjeIr68ALTICOSJc9sIiZGZ94EA3KqrBhj8+9TDDbotF
 Kp0dExvcw2Fd/X/w1axuJGsM+mBKJyig+3UasuDmLgHXR9F4cxvQc3D3i
 mBJ4rGzPF0yDEbXIvxB18e/K0RxRtI+KBcso05EWJ+TRQJif6oEi42Ial
 JzgpuXpVTyXsI6QbxcltIIrNnPxio3ByAKjmHDyDFet69+793V1DR/cSU
 fEfdIeFi5wbXKvWQ8nwqx+a17V176OKxakbPeaT5XZX5un4mn/RJ02nZN
 ugyH02t23sFsjdIpEx8S1hSVDC/0OtvcmCs6T1NRhnK0RnPagMiFug0MX A==;
X-CSE-ConnectionGUID: gcAc2RmvT3GPuxET+4YRsA==
X-CSE-MsgGUID: KZy/Ur9oSAKadM62BACOVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25668319"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="25668319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 04:26:31 -0700
X-CSE-ConnectionGUID: XFcQDc5cQKO/mY4BJwdKPw==
X-CSE-MsgGUID: 9v8b7O+kQSmyL6eQjEUjxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40178313"
Received: from opintica-mobl1 (HELO fedora) ([10.245.244.70])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 04:26:28 -0700
Date: Thu, 13 Jun 2024 13:26:15 +0200
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
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <ZmrXV0FoBb8M0c6J@fedora>
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

Hi Dave & Sima,

This week's drm-xe-fixes PR.

Except from the maintainer update, nothing major, really.
The "drm/xe: move disable_c6 call" required some conflict
resolution (both visible and silent) which was also
reflected in a conflict with drm-next when building
drm-tip.

drm-xe-fixes-2024-06-13:
Core Changes:
- Xe Maintainers update to MAINTAINERS file.

Driver Changes:
- Use correct forcewake assertions.
- Assert that VRAM provisioning is only done on DGFX.
- Flush render caches before user-fence signalling on all engines.
- Move the disable_c6 call since it was sometimes never called.

Thanks,
Thomas

The following changes since commit 0698ff57bf327d9a5735a898f78161b8dada160b:

  drm/xe/pf: Update the LMTT when freeing VF GT config (2024-06-04 16:31:24 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-06-13

for you to fetch changes up to 2470b141bfae2b9695b5b6823e3b978b22d33dde:

  drm/xe: move disable_c6 call (2024-06-13 12:35:13 +0200)

----------------------------------------------------------------
Core Changes:
- Xe Maintainers update to MAINTAINERS file.

Driver Changes:
- Use correct forcewake assertions.
- Assert that VRAM provisioning is only done on DGFX.
- Flush render caches before user-fence signalling on all engines.
- Move the disable_c6 call since it was sometimes never called.

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/xe: flush engine buffers before signalling user fence on all engines

Michal Wajdeczko (1):
      drm/xe/pf: Assert LMEM provisioning is done only on DGFX

Oded Gabbay (1):
      MAINTAINERS: update Xe driver maintainers

Riana Tauro (2):
      drm/xe/xe_gt_idle: use GT forcewake domain assertion
      drm/xe: move disable_c6 call

Thomas Hellström (1):
      MAINTAINERS: Update Xe driver maintainers

 MAINTAINERS                                |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c            |  9 ++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.c             |  6 ------
 drivers/gpu/drm/xe/xe_ring_ops.c           | 18 ++++++++++++++++--
 5 files changed, 38 insertions(+), 12 deletions(-)
