Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91349C83E4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 08:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A610C10E7A8;
	Thu, 14 Nov 2024 07:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvEHKDJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4325810E0CF;
 Thu, 14 Nov 2024 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731568825; x=1763104825;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=65zpiDoZSLoUYyvWElatN5U0m5x2ciY3L2lSfQAxQDk=;
 b=XvEHKDJQ/+UPcwkpLibByZQdnx6SFdFwJS3xFdBUa7xNv/Xr1bRGeyzI
 mtajsrjCUZ12LjmXT6XGvRnr5gAbOcAONTmPC5bQuDZJ32tjJs7QgDGfx
 FMjLjJtpCr3ePDKHNgxwIqai3dum7fVYwbKsv+tzUjJjU0Ma1nD1Ky/cS
 fsWGQciuBeL5kjCDk6NHLudBKXvKaqe5QpMUCPyuT2q0sak2dDwD24Usg
 kHp0X1j3p+G2zaPSxQR90K99CegV5tQ/1qqOObrqMS86UZneRqw8usdmg
 aU2lYfTp4tT8JxFkTeR6x7G3tIg++ApwVRfhOph/EgbPNpMA7ZbQwwDwD w==;
X-CSE-ConnectionGUID: AH+gnGbNTOO8hRd8VO/f9A==
X-CSE-MsgGUID: L+DsHjyVSdaW0k0/Urda2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31373709"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31373709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 23:20:25 -0800
X-CSE-ConnectionGUID: n7cmpNwzRDe3cFG0Q2OCTA==
X-CSE-MsgGUID: NewAXuvXTU6SZVoKyGbM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88527917"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.232])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 23:20:20 -0800
Date: Thu, 14 Nov 2024 09:20:17 +0200
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
Message-ID: <ZzWksU6CMGLPfjkT@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes PR towards v6.12 release.

Just two fixes: One potential OOPS fix for TV outputs and skip GSC
loading on ARL-H and ARL-U with old FW.

Regards, Joonas

***

drm-intel-fixes-2024-11-14:

- Don't load GSC on ARL-H and ARL-U if too old FW
- Avoid potential OOPS in enabling/disabling TV output

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-11-14

for you to fetch changes up to 67e023b93d69e5a21b16f9602656a803d314e825:

  drm/i915: Grab intel_display from the encoder to avoid potential oopsies (2024-11-12 11:08:06 +0200)

----------------------------------------------------------------
- Don't load GSC on ARL-H and ARL-U if too old FW
- Avoid potential OOPS in enabling/disabling TV output

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.

Ville Syrjälä (1):
      drm/i915: Grab intel_display from the encoder to avoid potential oopsies

 drivers/gpu/drm/i915/display/intel_tv.c   |  4 +--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 50 ++++++++++++++++++++-----------
 drivers/gpu/drm/i915/i915_drv.h           |  8 +++--
 drivers/gpu/drm/i915/intel_device_info.c  | 24 +++++++++++----
 drivers/gpu/drm/i915/intel_device_info.h  |  4 ++-
 include/drm/intel/i915_pciids.h           | 19 +++++++++---
 6 files changed, 77 insertions(+), 32 deletions(-)
