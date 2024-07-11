Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB50E92E3C5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BED10E9F6;
	Thu, 11 Jul 2024 09:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkHVihhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB87710E9E6;
 Thu, 11 Jul 2024 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720691513; x=1752227513;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=zk4aDJg6xr1GtYRHJaF39WqhwypP+YR2knZNrnjGJvg=;
 b=RkHVihhO6F5LkdZCfxJzt37/KMZ1mid04x4psVUlksOSRbvM+eGp1q4p
 PMjk4SBCym8ECUbHL2vsVbUwgjreTOY2wrtncayZdEomdFf2ditLB+DUc
 qMypXXWDpRH1cXmzXbnRRTLszzy7ZlhMVBWANE++DJjAerWyCdsGkzjZE
 jfri5bO15WOiiNdZzDM1fySYL4LoIiBTZymfXoKA4/7RCKE1tXER8upwL
 aMuJN4HkH+2tJ82mUZAwGKqNE24aQg6Jyu+I3zxl80Mk0TFw+WtjOvFlN
 SdAKmrHcS25YOOZgEm42nc+4z24ypxOffrSagAzHl9N9VA5OTU4hmG9uo A==;
X-CSE-ConnectionGUID: xlEgoc/5Saeh75+sTDTJ0A==
X-CSE-MsgGUID: kRq5CnICTQum3fDdx3sOdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18194948"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="18194948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:51:41 -0700
X-CSE-ConnectionGUID: QpFHjP7MQsShf1VoshUVIA==
X-CSE-MsgGUID: ymi0An13TOqDlGIStoa9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="71727122"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.36])
 ([10.245.245.36])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:51:37 -0700
Message-ID: <8abff46f-eae6-4521-8434-7c6240f9091c@linux.intel.com>
Date: Thu, 11 Jul 2024 11:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Dave, Sima,

Few fixes for v6.10. :)

Cheers,
~Maarten

drm-misc-fixes-2024-07-11:
drm-misc-fixes for v6.10:
- EDID irq fix for bridge/adv7511.
- gma500 null mode fixes.
- Cleanup meson binding.
The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-07-11

for you to fetch changes up to cb520c3f366c77e8d69e4e2e2781a8ce48d98e79:

  drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes (2024-07-09 20:02:14 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.10:
- EDID irq fix for bridge/adv7511.
- gma500 null mode fixes.
- Cleanup meson binding.

----------------------------------------------------------------
Adam Ford (1):
      drm/bridge: adv7511: Fix Intermittent EDID failures

Ma Ke (2):
      drm/gma500: fix null pointer dereference in psb_intel_lvds_get_modes
      drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes

Yao Zi (1):
      drm/meson: fix canvas release in bind function

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 13 +++++++---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++-------
 drivers/gpu/drm/gma500/cdv_intel_lvds.c      |  3 +++
 drivers/gpu/drm/gma500/psb_intel_lvds.c      |  3 +++
 drivers/gpu/drm/meson/meson_drv.c            | 37 ++++++++++++++--------------
 6 files changed, 47 insertions(+), 33 deletions(-)
