Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEEAC626D
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 08:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC14410E570;
	Wed, 28 May 2025 06:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLT9Ewaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECD210E2AE;
 Wed, 28 May 2025 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748415420; x=1779951420;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=y8LnKWl0reReE5wgkFA3hS8SJWX9rlHMy3MM1N7+oCc=;
 b=CLT9EwafF9Fke2guT59TmKqC/SCp8C5nHTxrXNpzxNUEgiVRhRvvtSWd
 L4Vd/EyOu8ZR3BhuQ4G1DfTKnOZC3AWGYCuGQqF2bvuKfacqb3qHttXEf
 9hzNtFn+0A2gmgdQ1xwwf0yMEhdlpcEZFnwEgk2bcoN2mMq6OgBYncUdM
 yaz4niL+rJjYHGIz1Hq7m8BsFpxapbXOXdjVNSne8dDRDIvTG9D/65P4t
 8n54q8bc9OIbPBPWV1nGIatakui5TlJ/v1XgL1NjTQiGdyK/7XCPGDPB1
 QGdBV5Xt1OfPBGlCp/wUTSmCJVTnp5F7lZkQRm7ZGevBSo1K4Nf9mGvDY A==;
X-CSE-ConnectionGUID: Q0xdkNSDR5ivKII+7Oq3rg==
X-CSE-MsgGUID: O9GIDH21QmWxq86kljFVVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49676565"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="49676565"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 23:56:59 -0700
X-CSE-ConnectionGUID: wwAm5jKzQz+tfkZ6bgRbAA==
X-CSE-MsgGUID: K5xNNZQtTUO3n6mRfV2xkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143066610"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 23:56:55 -0700
Date: Wed, 28 May 2025 09:56:52 +0300
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
Message-ID: <aDaztAmV_erxo1Am@jlahtine-mobl>
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

Here's this week's drm-intel-next-fixes towards 6.16-rc1.

Just one DP audio fix.

Regards, Joonas

PS. There is also one Cc: stable patch and revert for it.

***

drm-intel-next-fixes-2025-05-28:

- Fix the enabling/disabling of DP audio SDP splitting

The following changes since commit f4c7baa0699b69edb6887a992283b389761e0e81:

  drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue() (2025-05-22 09:25:57 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2025-05-28

for you to fetch changes up to ed5915cfce2abb9a553c3737badebd4a11d6c9c7:

  Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1" (2025-05-27 16:40:55 +0300)

----------------------------------------------------------------
- Fix the enabling/disabling of DP audio SDP splitting

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp: Fix the enabling/disabling of audio SDP splitting

Joonas Lahtinen (1):
      Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1"

Ville Syrjälä (1):
      drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1

 drivers/gpu/drm/i915/display/intel_audio.c  | 27 +++++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_audio.h  |  1 -
 drivers/gpu/drm/i915/display/intel_ddi.c    |  3 ---
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 --
 4 files changed, 17 insertions(+), 16 deletions(-)
