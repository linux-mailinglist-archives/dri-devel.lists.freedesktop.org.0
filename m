Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF719185F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7477410E91B;
	Wed, 26 Jun 2024 15:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjnmVXw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD43A10E91A;
 Wed, 26 Jun 2024 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719416160; x=1750952160;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=6VZK3zCXCoCGFwA0zd3QuKJtDw0GJSlyo3AIgW+Hw18=;
 b=fjnmVXw7pn3ZMgJka3ZPRkRV9EUHgkyUkGUbKH7NTvYDAQgTNn21Xd7u
 C9p7pbMu8geIp9Fwe4QbTQdeCvZXTvLtmOaUyMYVO5URgVhtI4RuwV+PA
 /RMmfDIAYOH1AdZ80MvFlIQFilo066A+RRli1yYkDdYoPYTs/4QqQjaSv
 Ab3iWCuCaIBZpIQ7gpvmBn1h39CdMuMmTfnjeCDxSFOro2fwQgJ4SvVvS
 uKP3SqmXkEkw5NljlVJHtsixPE8/wjZL0EfWBAMaSjDpPgpTM68Miw4zz
 LU2/DOvluo2HBv4cCEM+ZTQtb7Ga84bd/FC3fLdXJ3bELg6DrWzOJ1xl9 g==;
X-CSE-ConnectionGUID: Aw5Vfq2gSEO3yJS0CyMY+Q==
X-CSE-MsgGUID: qMOyyywkSnSO+UrMmgY8vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16646216"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16646216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:35:48 -0700
X-CSE-ConnectionGUID: KZ1dmqKFQTybTm+xrGCxYA==
X-CSE-MsgGUID: P7yOJanXSRGb56G6fNsRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="44679450"
Received: from adhamasi-mobl1.ger.corp.intel.com (HELO [10.249.39.73])
 ([10.249.39.73])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:35:44 -0700
Message-ID: <2e596c1e-9389-43c2-a029-06fe741c44c3@linux.intel.com>
Date: Wed, 26 Jun 2024 17:35:53 +0200
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
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Was out last week, didn't happen much anyway with only 2 patches, so 
have a double sized -fixes this week.

Cheers,
~Maarten

drm-misc-fixes-2024-06-26:
drm-misc-fixes for v6.10-rc6:
- nouveau tv mode fixes.
- Add KOE TX26D202VM0BWA timings.
- Fix fb_info when vmalloc is used, regression from
   CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM.
The following changes since commit 14731a640e5513bd514adcf35e96c84ad42f540d:

   Merge drm/drm-fixes into drm-misc-fixes (2024-06-14 09:55:46 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-fixes-2024-06-26

for you to fetch changes up to 66edf3fb331b6c55439b10f9862987b0916b3726:

   drm/nouveau/dispnv04: fix null pointer dereference in 
nv17_tv_get_ld_modes (2024-06-25 15:30:50 -0400)

----------------------------------------------------------------
drm-misc-fixes for v6.10-rc6:
- nouveau tv mode fixes.
- Add KOE TX26D202VM0BWA timings.
- Fix fb_info when vmalloc is used, regression from
   CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM.

----------------------------------------------------------------
Liu Ying (1):
       drm/panel: simple: Add missing display timing flags for KOE 
TX26D202VM0BWA

Ma Ke (2):
       drm/nouveau/dispnv04: fix null pointer dereference in 
nv17_tv_get_hd_modes
       drm/nouveau/dispnv04: fix null pointer dereference in 
nv17_tv_get_ld_modes

Thomas Zimmermann (1):
       drm/fbdev-dma: Only set smem_start is enable per module option

  drivers/gpu/drm/drm_fb_helper.c           | 6 +++---
  drivers/gpu/drm/drm_fbdev_dma.c           | 5 ++++-
  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 6 ++++++
  drivers/gpu/drm/panel/panel-simple.c      | 1 +
  4 files changed, 14 insertions(+), 4 deletions(-)
