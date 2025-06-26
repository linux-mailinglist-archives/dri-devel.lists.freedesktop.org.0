Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236AAE967A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 08:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E810E27D;
	Thu, 26 Jun 2025 06:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQHgbtH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3650110E045;
 Thu, 26 Jun 2025 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750920229; x=1782456229;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=elKGAq/0M7dGrm0e16NSIAJMioXgAAi7Sb/PaCUW5J8=;
 b=jQHgbtH5MMAO8DvyhhH/N6G2LGTe7zOCTLf4hbDWyzUxbLy4w+WHS3LZ
 X8xMX1ZtBrXcEETfuQ43jvgrRIGu+6SKV33263HhCPvL04AY47bjQnz42
 JWwG7PNyGfs1fSQU2XF2aAFQ1dcgKo/XzuPPmXUmUjHzl+kSdAMuPbq6V
 161LI9RrJma2oL4ayVIoPtBRuBET66y+0oMarV43suOD2KtVKTR2afPzD
 pWKpjfyyeX4sPU4cwU5MOPz5sjSMEysOL765sXcK588RIK7eJocu3ydmY
 gnYdzwVYARSeH9kIrW4zYHyUYxKitoWPO1N6Cyb9FdgyGir1lyeNOnso9 g==;
X-CSE-ConnectionGUID: /Wth5MBNSyeTCUpckoGfMQ==
X-CSE-MsgGUID: olgzNSp3T+qVznmcBFEYug==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53276447"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="53276447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:43:48 -0700
X-CSE-ConnectionGUID: e/aF56SVRYmLeAj90RwMQQ==
X-CSE-MsgGUID: +MuwESMdTGCCGp82kpN7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="157000071"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.123])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:43:45 -0700
Date: Thu, 26 Jun 2025 09:43:41 +0300
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aFzsHR9WLYsxg8jy@jlahtine-mobl>
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

Hi Dave & Sima,

Here goes the drm-intel-fixes PR towards v6.16-rc4.

Two Cc stable fixes, fix for HDMI 1080p@120Hz and DP AUX DPCD probing.
Then a followup build fix for GCOV + AutoFDO configs.

Regards, Joonas

***

drm-intel-fixes-2025-06-26:

- Fix for SNPS PHY HDMI for 1080p@120Hz
- Correct DP AUX DPCD probe address
- Followup build fix for GCOV and AutoFDO enabled config

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-06-26

for you to fetch changes up to d02b2103a08b6d6908f1d3d8e8783d3f342555ac:

  drm/i915: fix build error some more (2025-06-25 10:23:16 +0300)

----------------------------------------------------------------
- Fix for SNPS PHY HDMI for 1080p@120Hz
- Correct DP AUX DPCD probe address
- Followup build fix for GCOV and AutoFDO enabled config

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/snps_hdmi_pll: Fix 64-bit divisor truncation by using div64_u64

Arnd Bergmann (1):
      drm/i915: fix build error some more

Imre Deak (1):
      drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS

 drivers/gpu/drm/display/drm_dp_helper.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c | 4 ++--
 drivers/gpu/drm/i915/i915_pmu.c                    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
