Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838659275F3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D9910EAC6;
	Thu,  4 Jul 2024 12:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXhF4440";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375310EAC4;
 Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720096077; x=1751632077;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=/xZRxZP5+a2PWzhEMmbMnBPs5ROF1T5pYZY3NUGl5qA=;
 b=hXhF4440kBWCWJajXMno2pvlY0xsuvwzYivqrZsScgDpnqYNt55jPpII
 xhJDITIxW8xH/5RJL5EaZs1CDllewX/0DRYlBJHs6PiDqIEIlCJk4IZgn
 wF7fZqAmadAnzb5lGDpTAS/UrV+GCGD21+EvElGLUI/3LzHnkO4tjLnG9
 dVZ5ahhzT3JYhqUNEs5UF3L+Mib6mCvMCKoUV7vGDU7Yr0c8ky/YoIRrL
 TFgI1VeBKdfXjZjGYlEul2mDHSsb0I+dWchx972im5HaL0ocJgLsrXbKN
 jda/7nspyJfMXXBb3PpdEp3raNOEGBAj/dRjWaS+G86rr55HQ2YUeBJjG w==;
X-CSE-ConnectionGUID: t/h++ePaQ4y3sW5YEOywLw==
X-CSE-MsgGUID: PDiwpzUbT1OmOnobp9oN2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27977028"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="27977028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 05:27:56 -0700
X-CSE-ConnectionGUID: I7ubbYafR7SesiNz/WKJBQ==
X-CSE-MsgGUID: d3376Jb/SHWiQpOknz7A8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="77724329"
Received: from unknown (HELO [10.245.245.96]) ([10.245.245.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 05:27:50 -0700
Message-ID: <ffba0c63-2798-40b6-948d-361cd3b14e9f@linux.intel.com>
Date: Thu, 4 Jul 2024 14:27:58 +0200
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

Hi Dave, Sima,

A nicely filled fixes tree just for you! And the rest of the world!

Cheers,
~Maarten

drm-misc-fixes-2024-07-04:
drm-misc-fixes for v6.10-rc7:
- Add panel quirks.
- Firmware sysfb refcount fix.
- Another null pointer mode deref fix for nouveau.
- Panthor sync and uobj fixes.
- Fix fbdev regression since v6.7.
- Delay free imported bo in ttm to fix lockdep splat.
The following changes since commit 66edf3fb331b6c55439b10f9862987b0916b3726:

  drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_ld_modes (2024-06-25 15:30:50 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-07-04

for you to fetch changes up to d99fbd9aab624fc030934e21655389ab1765dc94:

  drm/ttm: Always take the bo delayed cleanup path for imported bos (2024-07-04 09:22:04 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.10-rc7:
- Add panel quirks.
- Firmware sysfb refcount fix.
- Another null pointer mode deref fix for nouveau.
- Panthor sync and uobj fixes.
- Fix fbdev regression since v6.7.
- Delay free imported bo in ttm to fix lockdep splat.

----------------------------------------------------------------
Boris Brezillon (2):
      drm/panthor: Don't check the array stride on empty uobj arrays
      drm/panthor: Fix sync-only jobs

John Schoenick (1):
      drm: panel-orientation-quirks: Add quirk for Valve Galileo

Ma Ke (1):
      drm/nouveau: fix null pointer dereference in nouveau_connector_get_modes

Matthew Schwartz (1):
      drm: panel-orientation-quirks: Add labels for both Valve Steam Deck revisions

Thomas Hellström (1):
      drm/ttm: Always take the bo delayed cleanup path for imported bos

Thomas Huth (1):
      drm/fbdev-generic: Fix framebuffer on big endian devices

Thomas Zimmermann (1):
      firmware: sysfb: Fix reference count of sysfb parent device

 drivers/firmware/sysfb.c                       | 12 ++++---
 drivers/gpu/drm/drm_fbdev_generic.c            |  3 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c |  9 +++++-
 drivers/gpu/drm/nouveau/nouveau_connector.c    |  3 ++
 drivers/gpu/drm/panthor/panthor_drv.c          |  6 ++--
 drivers/gpu/drm/panthor/panthor_sched.c        | 44 +++++++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_bo.c                   |  1 +
 include/uapi/drm/panthor_drm.h                 |  5 +++
 8 files changed, 63 insertions(+), 20 deletions(-)
