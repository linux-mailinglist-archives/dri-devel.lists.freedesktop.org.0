Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0CAAB8080
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020C010E7B9;
	Thu, 15 May 2025 08:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWcr2wki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C40310E7B9;
 Thu, 15 May 2025 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747297635; x=1778833635;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=N3qCN0OTyUPrSoIr/lVhM2ZF0kTvlOwe7kpg5LGwHzE=;
 b=HWcr2wkiw5Vcjs8kcjrLX3OMTKvtbuBXICbvWjb2fz0tXGeWXMEQU0/g
 txBOXey45FA+0+Vszxgv9ILbw+OdsEnOZEb7EeIghn1Iebr+sTEPGRZ4+
 T8aAcgDwIQcTDgZ6y9r25+kmCscXf8TErB+Z6cHGG8SjomNcXCwKKgg6j
 5Qi4Z8sWv6znjN4SSGcXKRV+ainhZpB683wPHn4c6T8kkgEaQQZ7IhTHm
 ZXhtpotsi76net35AKK9qg/voWc65fSE0ZTLYyHapBGmegqGQwCa9/GM8
 ciYElB0TfeHEeDgenMX4arTwgRoIfdnPJuJUs0h8MsOzqwpA55GyCOAdW g==;
X-CSE-ConnectionGUID: UYmkC32mRSqNygMrgbr2Jg==
X-CSE-MsgGUID: eI0ltr/kQeCktdIyuk2Eyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49156833"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="49156833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:27:13 -0700
X-CSE-ConnectionGUID: EyYjhW5AQ3eXBlAVeAbXUQ==
X-CSE-MsgGUID: h6A7pXvbREOs0Eo192CGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="139296697"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.112])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:27:08 -0700
Date: Thu, 15 May 2025 11:27:06 +0300
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
Message-ID: <aCWlWk5rTE7TH1pN@jlahtine-mobl>
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

Here goes the drm-intel-next-fixes PR for this week.

Just one MST fix and one PSR fix this round.

The CI results for drm-intel-next-fixes are bit all over the place after -rc1,
before further rc backmerges.

Regards, Joonas

***

drm-intel-next-fixes-2025-05-15:

- Stop writing ALPM registers when PSR is enabled
- Use the correct connector while computing the link BPP limit on MST

The following changes since commit 1faeeb315fdbd005bbc1bc74214e39087971dda9:

  Merge tag 'amd-drm-next-6.16-2025-05-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-05-12 07:14:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2025-05-15

for you to fetch changes up to eff82fb0d266eeaea26f99780c5d8987974df2e9:

  drm/i915/alpm: Stop writing ALPM registers when PSR is enabled (2025-05-14 15:22:23 +0300)

----------------------------------------------------------------
- Stop writing ALPM registers when PSR is enabled
- Use the correct connector while computing the link BPP limit on MST

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp_mst: Use the correct connector while computing the link BPP limit on MST

Jouni Högander (2):
      drm/i915/alpm: Make intel_alpm_enable_sink available for PSR
      drm/i915/alpm: Stop writing ALPM registers when PSR is enabled

 drivers/gpu/drm/i915/display/intel_alpm.c   |  8 ++++----
 drivers/gpu/drm/i915/display/intel_alpm.h   |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c     |  7 ++++---
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  5 +++--
 drivers/gpu/drm/i915/display/intel_psr.c    | 13 ++++++++++---
 6 files changed, 24 insertions(+), 12 deletions(-)
