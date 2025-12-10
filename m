Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510BCB2AAB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 11:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403E10E26E;
	Wed, 10 Dec 2025 10:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP6I/W/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6362710E26E;
 Wed, 10 Dec 2025 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765362055; x=1796898055;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=X5nJ7Wel1CHXH3KCoR7BrEkIQvJHtJ5nhn7UT+CTn7c=;
 b=IP6I/W/osdVfPHV96Jv1CBpHxaj+qFdeyNXbxgiph25iWA+s0MVgl418
 2zYYEZVZS6OwsAiga/xC9x06ibfM0nZitrjS32FTnBVnn6XHibOR86Q8x
 PdzEpTOPNGJl+VT2lUfD0xk71IcWuyBmO4J4Iw/AJD09GODb6JQo16rHL
 4VTQAzKQEsq1pvoYXwiFWj7KvTS50vjPxJgYih+4PXIwrAYXkUin2cqlD
 Ch6/Ip+MUgPd78iofXLvhBsV0FcFHKBszMS4gVMJP/MrOKvUN9Mj28XxD
 WdrYcuExQv8r44kn3BWYT6csfrUKs9LpQFKSNtLVdWIt/d0l1bpL9ljxA g==;
X-CSE-ConnectionGUID: Kdoa31OzTv+fo76aH1iQDA==
X-CSE-MsgGUID: j3v/iG2eSmOpynHxGLMhlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77650750"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77650750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:20:55 -0800
X-CSE-ConnectionGUID: 0+4eP8NXQRqUwdRcyuS0hQ==
X-CSE-MsgGUID: XLcqaIlFQU6vdtvQMYVa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="197263852"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.244.92])
 ([10.245.244.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:20:49 -0800
Message-ID: <a82c2a2a-314f-403b-85bf-9b3ee09b903c@linux.intel.com>
Date: Wed, 10 Dec 2025 11:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Subject: [PULL] drm-misc-next-fixes
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

Hi Dave, Simona,

Here's the pull drm-misc-next-fixes pull request for v6.19

Kind regards,
~Maarten

drm-misc-next-fixes-2025-12-10:
drm-misc-next-fixes for v6.19-rc1:
- Fix uaf in panthor.
- Revert 8 byte alignment constraint for pitch in dumb bo's.
- Fix DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC handling renasas.
The following changes since commit 31d3354f42c0da34415164a1f621a195caa1f1bc:

  drm/nouveau: verify that hardware supports the flush page address (2025-11-24 17:53:22 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-12-10

for you to fetch changes up to 308eeb8ca3fdee54bcd3ec7272c05688e178299a:

  drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC (2025-12-04 14:59:21 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v6.19-rc1:
- Fix uaf in panthor.
- Revert 8 byte alignment constraint for pitch in dumb bo's.
- Fix DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC handling renasas.

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Prevent potential UAF in group creation

Ludovic Desroches (2):
      drm/gem-dma: revert the 8-byte alignment constraint
      drm/gem-shmem: revert the 8-byte alignment constraint

Marek Vasut (1):
      drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC

 drivers/gpu/drm/drm_gem_dma_helper.c            |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c          |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c         | 19 +++++++++++++++----
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c |  4 ++--
 4 files changed, 19 insertions(+), 8 deletions(-)
