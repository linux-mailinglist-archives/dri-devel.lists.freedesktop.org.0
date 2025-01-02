Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91E9FF718
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 09:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C488110E3CB;
	Thu,  2 Jan 2025 08:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dy3t/aRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400F10E232;
 Thu,  2 Jan 2025 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735807634; x=1767343634;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=CLg8RVFqaid4LC8lEO+Qv4CMbonRv8NfjwmbBt9lCuo=;
 b=dy3t/aRDpxat1avz5hZM3LNc8qOlbMEC+kHohAxKMmXcrblkFVTySSo3
 RkBjM3TogjCYsRZoXtM5ErbqVObqcMRvAvHmDrwE7yQx/73eb64+t92VZ
 6kv1icx5j+m2Cmm+8+Ez0FUsEvHF0bzo/0Kt4qp456xqNyrkV7MwfNyzk
 CW4BCqF8uT49DrE62x2kxxJUZf7yTFU86WgjeP+cWOMKPjkQPABNb3aWi
 JoYRFtM6SOdy8XZlX5zJ251kdsItUdbX9wux77NS7RCf4yxX7PchJRjlQ
 XDaRhSSvXoXcX/RozaZN+8FwD0H51Q2N9Ul2iXDFJfC9UYZfzoKy/xxnL A==;
X-CSE-ConnectionGUID: bkzj43e6SM271+m+YO3gAA==
X-CSE-MsgGUID: rYGyH6ZMRyORKKCx99ABJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47451918"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="47451918"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 00:47:14 -0800
X-CSE-ConnectionGUID: qxxW+LqlRguwIXZKOn1mWA==
X-CSE-MsgGUID: QAwe1q6UTVerLiZMcH1O6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101293375"
Received: from opintica-mobl1 (HELO [10.245.245.107]) ([10.245.245.107])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 00:47:09 -0800
Message-ID: <f58429b7-5f11-4b78-b577-de32b41299ea@linux.intel.com>
Date: Thu, 2 Jan 2025 09:47:55 +0100
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

Happy newyear!

Cheers,
~Maarten

drm-misc-fixes-2025-01-02:
drm-misc-fixes for v6.13-rc6:
- Only fixes for adv7511 driver, including a use-after-free.
The following changes since commit 1b684ca15f9d78f45de3cdba7e19611387e16aa7:

  drm/sched: Fix drm_sched_fini() docu generation (2024-12-19 16:03:56 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-01-02

for you to fetch changes up to 79d67c499c3f886202a40c5cb27e747e4fa4d738:

  drm: adv7511: Drop dsi single lane support (2024-12-20 03:53:25 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.13-rc6:
- Only fixes for adv7511 driver, including a use-after-free.

----------------------------------------------------------------
Biju Das (3):
      drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
      dt-bindings: display: adi,adv7533: Drop single lane support
      drm: adv7511: Drop dsi single lane support

Stefan Ekenberg (1):
      drm/bridge: adv7511_audio: Update Audio InfoFrame properly

 .../devicetree/bindings/display/bridge/adi,adv7533.yaml    |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c             | 14 ++++++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c               | 10 ++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7533.c                   |  4 +---
 4 files changed, 22 insertions(+), 8 deletions(-)
