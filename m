Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A8E8D4FFF
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 18:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610D12B44F;
	Thu, 30 May 2024 16:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxbksFJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1112B42B;
 Thu, 30 May 2024 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717087302; x=1748623302;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=51pmR43MM9IvMIrVencztXFO4krhieSdMWJ2cCW7oMY=;
 b=YxbksFJnc/7DXsxXAZb+/O2Caku+dfW28XlqKytV5WhbKxdw81HKB5qS
 Uq+mJ/sSsu0DhiK3BMqqE74qav3bQahRkCwe0f4W6qnsAEEZtjjKA0ySE
 92jvnSlVAKEVwxfta3CwYpN1ISlPozc+S3f5OZpjGjDqwvkXE3r9YtwEz
 bRWYP4O9OK0lmpVlYj0FQ6OiE1J6SsV9pQ+WMY6JW7C5xLFT0pN4ywDRU
 jZOyIixxG6ZaEdryR1uiEgCwjgffwtpltzynMcsNjUewd64yXXMU/EYk7
 ORjAiBN6VrdTbJT2Y5B4HK4+wHqlmScNvKsAo9ZPfn9DhfC3q0TqPk+jx Q==;
X-CSE-ConnectionGUID: EpI2eQv/QYCISX3uDsJdPg==
X-CSE-MsgGUID: ejxDh7ZWRzORcSmZqwWqcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13431214"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13431214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 09:41:40 -0700
X-CSE-ConnectionGUID: /PhTuRJWTZCi4oDVf99c1w==
X-CSE-MsgGUID: Vrv0jbswSY2aeSpLq1RNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="35807250"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 09:41:36 -0700
Date: Thu, 30 May 2024 18:41:24 +0200
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <ZlisNHzgoq9nVg6g@fedora>
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

Hi Dave, Sima

The drm-xe-fixes for -rc2

Only three fixes so far. I'm holding back one additional
fix to be able to sort out whether it's correct or need more work.

drm-xe-fixes-2024-05-30:
Driver Changes:
- One pcode polling timeout change
- One fix for deadlocks for faulting VMs
- One error-path lock imbalance fix

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-05-30

for you to fetch changes up to 6c5cd0807c79eb4c0cda70b48f6be668a241d584:

  drm/xe: Properly handle alloc_guc_id() failure (2024-05-28 08:53:45 +0200)

----------------------------------------------------------------
Driver Changes:
- One pcode polling timeout change
- One fix for deadlocks for faulting VMs
- One error-path lock imbalance fix

----------------------------------------------------------------
Himal Prasad Ghimiray (1):
      drm/xe: Change pcode timeout to 50msec while polling again

Matthew Brost (1):
      drm/xe: Only use reserved BCS instances for usm migrate exec queue

Niranjana Vishwanathapura (1):
      drm/xe: Properly handle alloc_guc_id() failure

 drivers/gpu/drm/xe/xe_guc_submit.c |  1 +
 drivers/gpu/drm/xe/xe_migrate.c    | 12 +++++-------
 drivers/gpu/drm/xe/xe_pcode.c      |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)
