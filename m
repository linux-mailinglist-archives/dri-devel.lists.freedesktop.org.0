Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDAD8C130B
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 18:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A10510E0FB;
	Thu,  9 May 2024 16:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCPov13r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E7210E011;
 Thu,  9 May 2024 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715272543; x=1746808543;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mHJd8p5Tjz0afxfdDn3nOYI76VYbyKUrqy+KDEXsM4A=;
 b=mCPov13rKf2UY67Y2JMxJlyDvW7hEpGrMvVBOaD76Ble91het1xdiVKA
 Codv5Gklae0ziIdDzRZ7UAUKfYy8v+o8ac2OV0oPz0Jr4Swb/DZZuxgcF
 pgeymP/R85EQ+Ktz+J024clZX4iubcyj0GYTogQ95bhXPUNeKoGsdz7zK
 xBT88xSK7slUS6w/2U3Vh0YOHoGDbJFOgYqAnRJcuf68+2TJPXMoRn2Ri
 0bFDYeXSQ6SW6YqKu8fIdZaHP92O24yTesFC2QhJduVOwRqWWpPNzp7vB
 HWDouXhord1XvNUx2YsxzXzwt/FqI8ynbIywzUZ04+njoN39Ei+oJ3rZ+ A==;
X-CSE-ConnectionGUID: V6hn4NwwRT+82jyEsFKJKw==
X-CSE-MsgGUID: bbhqHzUBQ2aYw0hDzQ+/RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28691397"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="28691397"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:35:42 -0700
X-CSE-ConnectionGUID: +av35eoIQQm7W/rBSD1WlQ==
X-CSE-MsgGUID: jt1AFr10S6i4iBwn7XCAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="60158199"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora) ([10.245.246.154])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:35:37 -0700
Date: Thu, 9 May 2024 18:35:23 +0200
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <Zjz7SzCvfA3vQRxu@fedora>
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

Hi, Dave & Sima

This weeks -next-fixes. Two fixes breifly described below.

Driver Changes:
- Use ordered WQ for G2H handler. (Matthew Brost)
- Use flexible-array rather than zero-sized (Lucas De Marchi)

Thanks,
Thomas

The following changes since commit 3bc8848bb7f7478e6806e4522b06b63f40a53e1e:

  drm/xe: Merge 16021540221 and 18034896535 WAs (2024-05-02 11:29:42 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-05-09-1

for you to fetch changes up to d69c3d4b53829097b8948d6791ea32c07de3faab:

  drm/xe/ads: Use flexible-array (2024-05-09 17:51:46 +0200)

----------------------------------------------------------------
Driver Changes:
- Use ordered WQ for G2H handler. (Matthew Brost)
- Use flexible-array rather than zero-sized (Lucas De Marchi)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe/ads: Use flexible-array

Matthew Brost (1):
      drm/xe: Use ordered WQ for G2H handler

 drivers/gpu/drm/xe/xe_guc_ads.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 5 +++++
 drivers/gpu/drm/xe/xe_guc_ct.h       | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)
