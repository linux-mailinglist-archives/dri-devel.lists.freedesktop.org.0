Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD156AC6DE8
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A3710E68D;
	Wed, 28 May 2025 16:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nb+n9/MF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D0610E686;
 Wed, 28 May 2025 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748449326; x=1779985326;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=cJB4+nrkx88MKzgE05JcOJwNo+gn4DnxlqhSxd8Jn6c=;
 b=nb+n9/MFodmPkVrWe2G+GwvGvJVwNFW+tChulDprCjjkbAUySxkofPhz
 t+A9VA6AP/nRzqtfgm0EllrbtdF2FFR8Lub3rMGE0yjL/KR5S2psaC/yk
 k8YhoGujvWUckQnunqugEcDFzA6g7odZ8bq+rPjcSGg8cbin/VGTNSHvE
 jYQqdMSefLUkzgrmqHZm/skdHh3Jb8KAE36JJDr+mytgqAx0kQV0c8fzp
 +Rv9osPnFL5YyYjBLWLXfz4Vx/TOXYzUAp5Wi0sTzhpq06x3xocYXpL2S
 5O2lEaX/dt2c1IOzHJtltE6XHQv4paSW6BztlVo8nzn4y9RjtYzet2jSf Q==;
X-CSE-ConnectionGUID: N5WxsoX1SDKW/c+reywdnw==
X-CSE-MsgGUID: 8DRJqix/QemkDIaMJtIlsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50359883"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50359883"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:22:06 -0700
X-CSE-ConnectionGUID: 32So+S8CQWC639DINEJe3A==
X-CSE-MsgGUID: IRQtaX7pRDKI6lh553zsig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148420161"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:22:02 -0700
Date: Wed, 28 May 2025 18:21:54 +0200
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
Message-ID: <aDc4Is-sQb3DPGO5@fedora>
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

Two documentation fixes this week.

Thanks,
Thomas

drm-xe-next-fixes-2025-05-28:
Driver Changes:
- Two documentation fixes (Rodrigo)

The following changes since commit 879ede53958f7bab79a88888f77e0ca91f0f77da:

  drm/xe: Default auto_link_downgrade status to false (2025-05-23 09:41:06 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-05-28

for you to fetch changes up to 40493d97b329f8185c0f04dc0ef2b9ffc58e7f3b:

  drm/xe: Add missing documentation of rpa_freq (2025-05-28 17:23:13 +0200)

----------------------------------------------------------------
Driver Changes:
- Two documentation fixes (Rodrigo)

----------------------------------------------------------------
Rodrigo Vivi (2):
      drm/xe: Make xe_gt_freq part of the Documentation
      drm/xe: Add missing documentation of rpa_freq

 Documentation/gpu/xe/index.rst      |  1 +
 Documentation/gpu/xe/xe_gt_freq.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_freq.c     |  5 +++++
 3 files changed, 20 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_gt_freq.rst
