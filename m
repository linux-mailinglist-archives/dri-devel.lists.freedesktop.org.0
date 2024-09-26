Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23222986DED
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3E010EAD3;
	Thu, 26 Sep 2024 07:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJMg9bzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88D310E0A3;
 Thu, 26 Sep 2024 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727336749; x=1758872749;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=gTVkOpoGqWyu8FIyK3go/K4ZeY5u/y4JMRNx8+D2Ot8=;
 b=WJMg9bzXKE+OM6y4CAcceKmF/dQ/ttgHSMtE8EBT7qSXaDBEkxcozIX4
 7WgPK8SnLGINhmnSsGHIinYXIsba0qc1X+6QCTF/EIOAkf2AJIdzdTf8b
 UvQHH9pOWFBwy1cxeMr0Et2QGaxmJcPdpB7bDyLLo0RYPH0kMEa1FRL7o
 fo8YUIXOREkxDNO2NgKJAylcqEiGh0zuNMjav17uOBsNWG8kHsVktb7ny
 rvkBQQCgzXdtfx82ueaNqjpn3GqHL/7Rs/jQCt7NtfZs6C0Be8aoMjTk9
 Z3hfLxbV/F4D9jbxIVvQHnmXDUaQc7aDNLEbS9uJoyG0jwoOQOpAQUVqk A==;
X-CSE-ConnectionGUID: 7BAyOU2hRxS2/ie46m2SqQ==
X-CSE-MsgGUID: RGzqotVvT+KGoVQHd1XBZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36981347"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="36981347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 00:45:48 -0700
X-CSE-ConnectionGUID: sy6OxKxDTLuKP86vjVy8xw==
X-CSE-MsgGUID: eflbc7DsSp+RAZUIJOQ1Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="76141438"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.143])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 00:45:44 -0700
Date: Thu, 26 Sep 2024 10:45:41 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZvURJYm5lo-XIzbY@jlahtine-mobl.ger.corp.intel.com>
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

Here goes final drm-intel-next-fixes towards v6.12.

Just one fix for DP colorimetry detection.

Regards, Joonas

***

drm-intel-next-fixes-2024-09-26:

- Fix colorimetry detection for DP

The following changes since commit d7126c0cfc137a580eba92bd82b6d288bd43961d:

  Merge tag 'drm-xe-next-fixes-2024-09-19' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-09-25 12:11:10 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2024-09-26

for you to fetch changes up to e860513f56d8428fcb2bd0282ac8ab691a53fc6c:

  drm/i915/dp: Fix colorimetry detection (2024-09-25 11:56:23 +0300)

----------------------------------------------------------------
- Fix colorimetry detection for DP

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915/dp: Fix colorimetry detection

 drivers/gpu/drm/i915/display/intel_dp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
