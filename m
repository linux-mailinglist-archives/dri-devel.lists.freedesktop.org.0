Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9EF8FB69D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC54010E4A1;
	Tue,  4 Jun 2024 15:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoAcNauB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951CF10E3C0;
 Tue,  4 Jun 2024 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717513767; x=1749049767;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4HkQ9IV15yC4nyUw+pcsRuE8HZHiliExlLr304AM+fc=;
 b=HoAcNauBf6V45x0gqE2vt7Ofny48M5xVp8mGFCr/ZfuDJjPm4MLTViJj
 bpbE/oBZp19KPNfgkYvtAa1Rk0rnRK6FuL282OxUzXgHApu2uT4+K6s97
 xYtDp6P3ty3c9rpfL/EDrRxQjLJVcjVVJoZT0puMMkHvBuXEJUMiu8Lbh
 UUfspFGFuCwthS3ljGlvCMbtz7NSUFILSj82bhbODXEjGP1/ry+fpR1Lr
 w2NkV4myVb3DFoTdqVaeLE69aDqFWi/4VoAGOvWZgBPsnz384Rpy/F8Wp
 p+8xP5pjFE3A71IHvyQsdZYl4MeZrcWZZgQhjlkOmAk/ccDtgLGA1gd3e A==;
X-CSE-ConnectionGUID: gu6tIUmXRsaIxa9mOdMCDQ==
X-CSE-MsgGUID: 9XKliixkRou3dUwsPw7soA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25181455"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="25181455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:09:26 -0700
X-CSE-ConnectionGUID: LBPryZVtTIOHMzj7SVtqVA==
X-CSE-MsgGUID: Mc6AyjSFSQ2GGV0PgxHxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="68417002"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.236])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:09:23 -0700
Date: Tue, 4 Jun 2024 17:09:10 +0200
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
Message-ID: <Zl8uFrQp0YjTtX4p@fedora>
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

Dave and Sima,

A single fix for a missing Local Memory Translation Table update for -rc3.

Thanks,
Thomas

drm-xe-fixes-2024-06-04:
Driver Changes:
- drm/xe/pf: Update the LMTT when freeing VF GT config

The following changes since commit 6c5cd0807c79eb4c0cda70b48f6be668a241d584:

  drm/xe: Properly handle alloc_guc_id() failure (2024-05-28 08:53:45 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-06-04

for you to fetch changes up to 0698ff57bf327d9a5735a898f78161b8dada160b:

  drm/xe/pf: Update the LMTT when freeing VF GT config (2024-06-04 16:31:24 +0200)

----------------------------------------------------------------
Driver Changes:
- drm/xe/pf: Update the LMTT when freeing VF GT config

----------------------------------------------------------------
Michal Wajdeczko (1):
      drm/xe/pf: Update the LMTT when freeing VF GT config

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
 1 file changed, 1 insertion(+)
