Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB7976515
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295C410E9FB;
	Thu, 12 Sep 2024 08:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ea+5GTNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA51110E1FC;
 Thu, 12 Sep 2024 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726131587; x=1757667587;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=uh1L0wSedYTH7RKuGQiuUkOpE00TbwqtpAb0xo6E62A=;
 b=Ea+5GTNsEyHKy1ZYnwFDY40u2zwt7SLqUKwvOclwkCuh+kkjmIIIs0+B
 CU1iWg21Pc/BQkM4ylZplBlzh57GJ1a0wCDYKAo+SnRuoh/MZinzvp1U1
 uWjj5GyE0B2wMOKdr0wmbVNUh1KIuWdWRQxzL0MORGX9M3WENAty1lem2
 J0iINbAFwy+EL9FvjQ89JrVSP6aUPfoL749wcy5ChOTrKMSKRur5eiqwP
 yakI0xFXPYj0h0LC4Lje2T4SQSPvHZVk3lgpwErCSdM0K87WqO2YD2xpF
 AWh00niBCKZkwNO3K4qgmVBJ31Utd5HXVnX/Y55Wttzi0c2QC6Zlm5FtY A==;
X-CSE-ConnectionGUID: WnYcMNoTT1KMZyUa+lDzAg==
X-CSE-MsgGUID: fX2WxFI0SySgTMAaqzlSiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50386796"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="50386796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 01:59:47 -0700
X-CSE-ConnectionGUID: 2vwUt4+2TA+cYcV/lfNx4A==
X-CSE-MsgGUID: xxn/L8G6QPaKR1MRyHwXXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="72231785"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.222])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 01:59:43 -0700
Date: Thu, 12 Sep 2024 11:59:40 +0300
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
Message-ID: <ZuKtfPJZ7vp79lWN@jlahtine-mobl.ger.corp.intel.com>
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

Just two fixes this week in drm-intel-next-fixes towards v6.12-rc1.

CI baseline is bit upset afted drm-next, but not getting worse with the
two patches at least.

Regards, Joonas

***

drm-intel-next-fixes-2024-09-12:

- Add missing I915_FORMAT_MOD_4_TILED_BMG_CCS modifier for BMG
- Printk formatting fix

The following changes since commit 741d73f587d5cc86db5e65cc107e031263302616:

  Merge tag 'amd-drm-next-6.12-2024-09-06' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-09-11 11:22:47 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2024-09-12

for you to fetch changes up to 0289507609dcb7690e45e79fbcc3680d9298ec77:

  drm/i915/bios: fix printk format width (2024-09-11 11:01:00 +0300)

----------------------------------------------------------------
- Add missing I915_FORMAT_MOD_4_TILED_BMG_CCS modifier for BMG
- Printk formatting fix

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/bios: fix printk format width

Juha-Pekka Heikkila (1):
      drm/i915/display: Fix BMG CCS modifiers

 drivers/gpu/drm/i915/display/intel_bios.c          | 2 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)
