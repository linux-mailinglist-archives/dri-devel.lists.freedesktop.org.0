Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F2AE9FDD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B962B10E8C2;
	Thu, 26 Jun 2025 14:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYF6WMWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568EA10E2B2;
 Thu, 26 Jun 2025 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750946809; x=1782482809;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=wuYbMGWhBe2zq4Umy3BxOMaAVNnDoj8+D62cGkTieJM=;
 b=XYF6WMWfKldfUfTHipZF+H8OlapD57VRTnNxg60DmC2bcfi9AYVblOhZ
 r1jjn2x9jidlCcjWzoSgVu6dfB+53nccLnrJ4gZx782WMIP+wFX9EhcP2
 cz8KzWNYR6j5ZuJVD82xc2tUZ+LEHf3DSAHmknJdxK5Z6lNEMcc42HV9w
 w4n9xTYFA8bKjwP2lneS04vUyNYAar0yPOqXZz/IgSBYeBf+Rmi0zzgS2
 m5B1TGvRea9N3EnjEJ/U7SFxAurJd/39IAXRTctP1Z3ImZN7fCZuy3hyY
 kvfPLVG6VT304Q0eJAYgX4IVxnrsnMBm63h9MUs9UEUmJrexOMTT8JCmW g==;
X-CSE-ConnectionGUID: P5RV0rXPR06avssx4nb8lw==
X-CSE-MsgGUID: WLAG74M3SyWs9EN+GpCNgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52472007"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52472007"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:06:49 -0700
X-CSE-ConnectionGUID: XcrjBabRSY2iwmFLirDsEA==
X-CSE-MsgGUID: XlVUrZz0QkK2VDde7dismg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="189714644"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.244.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:06:45 -0700
Date: Thu, 26 Jun 2025 16:06:32 +0200
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
Subject: [PULL] drm-xe-fixes
Message-ID: <aF1T6EzzC3xj4K4H@fedora>
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

The drm-xe-fixes PR for -rc4.

Thanks,
Thomas

drm-xe-fixes-2025-06-26:
UAPI Changes:
Driver Changes:
- Missing error check (Haoxiang Li)
- Fix xe_hwmon_power_max_write (Karthik)
- Move flushes (Maarten and Matthew Auld)
- Explicitly exit CT safe mode on unwind (Michal)
- Process deferred GGTT node removals on device unwind (Michal)

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-06-26

for you to fetch changes up to af2b588abe006bd55ddd358c4c3b87523349c475:

  drm/xe: Process deferred GGTT node removals on device unwind (2025-06-26 15:21:45 +0200)

----------------------------------------------------------------
UAPI Changes:
Driver Changes:
- Missing error check (Haoxiang Li)
- Fix xe_hwmon_power_max_write (Karthik)
- Move flushes (Maarten and Matthew Auld)
- Explicitly exit CT safe mode on unwind (Michal)
- Process deferred GGTT node removals on device unwind (Michal)

----------------------------------------------------------------
Haoxiang Li (1):
      drm/xe/display: Add check for alloc_ordered_workqueue()

Karthik Poosa (1):
      drm/xe/hwmon: Fix xe_hwmon_power_max_write

Maarten Lankhorst (1):
      drm/xe: Move DSB l2 flush to a more sensible place

Matthew Auld (1):
      drm/xe: move DPT l2 flush to a more sensible place

Michal Wajdeczko (2):
      drm/xe/guc: Explicitly exit CT safe mode on unwind
      drm/xe: Process deferred GGTT node removals on device unwind

 drivers/gpu/drm/xe/display/xe_display.c    |  2 ++
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 11 ++++------
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  5 +++--
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h   |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 ++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c             | 10 +++++----
 drivers/gpu/drm/xe/xe_hwmon.c              | 34 +++++++++++++-----------------
 7 files changed, 42 insertions(+), 32 deletions(-)
