Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44893CEA8BF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 20:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724710E944;
	Tue, 30 Dec 2025 19:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjmSXpLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0E10E940;
 Tue, 30 Dec 2025 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767123631; x=1798659631;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=ULyoY1Plq1ryLsbHXwylBw8P/lScEJ5zdO+Dj5PItoY=;
 b=OjmSXpLhFHa21a2+93NpoQZ7iH0ZoUb1GMW1CbcWzA5/cPaybvh7QT3h
 jlsxNNtIbZpFPg0sC2XfcdNlIOs9A302fOA3j0x2wPfkS+RLbKi9gOUMy
 QwOOtgX3KR1p9k/TkBWfPu4Fkb9eLClM7jmBwKpuGbOYhFAO2DBlviJ5l
 biaqNe4UJwsVtioDwmS9O0j+YE3CrR9XwfbDAkO9TxSTaLW+G4ZjbX6Gb
 TczKP511pg89humEhy8/AXohlp25pFE35FI13AQ1zbzNpmubFpE610+60
 /FJmdN7u3r6VMubfSIAOK075eMqOtBKXgFKP/gBWVAfrvLJXYg/DKjy5H Q==;
X-CSE-ConnectionGUID: 0Lmx74FWTpewmGbwQpjm8A==
X-CSE-MsgGUID: ZWsQEVgIQSGNXyM8ygiOAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68782207"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="68782207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 11:40:31 -0800
X-CSE-ConnectionGUID: i68HPsv0TZ+glm9uzSoy3g==
X-CSE-MsgGUID: T/cJdtuJS4GsFR894R0Gnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="202234718"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.158])
 ([10.245.245.158])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 11:40:27 -0800
Message-ID: <5506492b-02ca-47bc-8712-51e67f0e4b8b@linux.intel.com>
Date: Tue, 30 Dec 2025 20:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
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

Hi Dave, Simona,

Last pull request of the year 2025, happy 2026!

Kind regards,
~Maarten Lankhorst

drm-misc-fixes-2025-12-29:
drm-misc-fixes for v6.19-rc4:
- Documentation fixes and MODULE_LICENSE fix for shmem helper.
- Fix warnings in nouveau prepare_fb().
- Prevent export of protected objects in imagination driver.
The following changes since commit 2bfca4fe1f36eb6618e5712a8b5b41433bb6f10b:

  drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE (2025-12-16 11:28:52 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-12-29

for you to fetch changes up to 3fbd97618f49e07e05aad96510e5f2ed22d68809:

  drm/gem-shmem: Fix the MODULE_LICENSE() string (2025-12-21 20:15:36 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.19-rc4:
- Documentation fixes and MODULE_LICENSE fix for shmem helper.
- Fix warnings in nouveau prepare_fb().
- Prevent export of protected objects in imagination driver.

----------------------------------------------------------------
Alessio Belle (1):
      drm/imagination: Disallow exporting of PM/FW protected objects

Lyude Paul (1):
      drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepare_fb

Thomas Zimmermann (2):
      drm/gem-shmem: Fix typos in documentation
      drm/gem-shmem: Fix the MODULE_LICENSE() string

 drivers/gpu/drm/drm_gem_shmem_helper.c  |  5 +++--
 drivers/gpu/drm/imagination/pvr_gem.c   | 11 +++++++++++
 drivers/gpu/drm/nouveau/dispnv50/atom.h | 13 +++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c |  2 +-
 4 files changed, 28 insertions(+), 3 deletions(-)
