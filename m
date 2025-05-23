Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B126EAC1EA2
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 10:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8946110E7B2;
	Fri, 23 May 2025 08:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0IUxaeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD02010E7A7;
 Fri, 23 May 2025 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747988806; x=1779524806;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=gyv3nX/mpA+ZRLA3zwQVcOhXLlpnw/Y2zjt3lFT6NAI=;
 b=j0IUxaeE2NTNl3uqOJhlYTtqaYDq6AUhr3qCFxVQXK78U/VTke3emIof
 /E0GNwsxwFz8MqIvuXUqTgUSMySug7tNNmEwkUVatHjH6j1cLhL/WYvVQ
 8Zv63F03kqMdLQFqQNLYWGcbz44i69ZnQKqmRDTuo1jSanFHStE0w6OEU
 u+LZVujOXImdixP8/ypOrmroGSyVV713p5AVIBbGRVweLJvkl5MJtiyDY
 dKdD0rhd0gVKoNk30eWjMVpMw0OG+YZjsblSfYXMFnzPVBOSdvaV5B762
 Xt77SHvT7sOn+PUaElNQ/1SVeFdD50XfoxPtjuw2owLNXvWYUx+sej6Lv g==;
X-CSE-ConnectionGUID: DtgtQCNxQxW7S/h0qU1iIA==
X-CSE-MsgGUID: s9rzbys3QeqAvBKUHnYA2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72567505"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="72567505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:26:12 -0700
X-CSE-ConnectionGUID: 8SvSEpBqTja7Hm2fQvOr4A==
X-CSE-MsgGUID: oZSwtSARQIypXAnLXNpCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="145879479"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:26:08 -0700
Date: Fri, 23 May 2025 10:25:46 +0200
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
Message-ID: <aDAxCgfm7HJbrchD@fedora>
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

This week's drm-xe-next-fixes PR. Two small fixes.

Thanks
Thomas

drm-xe-next-fixes-2025-05-23:
Driver Changes:
- Fix a SLPC debugfs NULL pointer dereference (Aradhya)
- Fix an arbitrary value sysfs read return (Aradhya)
The following changes since commit 1faeeb315fdbd005bbc1bc74214e39087971dda9:

  Merge tag 'amd-drm-next-6.16-2025-05-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-05-12 07:14:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-05-23

for you to fetch changes up to 879ede53958f7bab79a88888f77e0ca91f0f77da:

  drm/xe: Default auto_link_downgrade status to false (2025-05-23 09:41:06 +0200)

----------------------------------------------------------------
Driver Changes:
- Fix a SLPC debugfs NULL pointer dereference (Aradhya)
- Fix an arbitrary value sysfs read return (Aradhya)

----------------------------------------------------------------
Aradhya Bhatia (2):
      drm/xe/guc: Make creation of SLPC debugfs files conditional
      drm/xe: Default auto_link_downgrade status to false

 drivers/gpu/drm/xe/xe_device_sysfs.c |  3 ++-
 drivers/gpu/drm/xe/xe_guc_debugfs.c  | 17 ++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)
