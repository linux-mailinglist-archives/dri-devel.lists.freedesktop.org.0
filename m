Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3E6B0EE39
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 11:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C66D10E11B;
	Wed, 23 Jul 2025 09:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feSxJ4Hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2200010E11B;
 Wed, 23 Jul 2025 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753262293; x=1784798293;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=+/Acgm87p0ltn0l7KL7sK2ZocH085A58KWW+7N2VY68=;
 b=feSxJ4HrRFA58fKwk8vixlsi3zvpHfp00E6CzN5WtiGdo5P3krM5OLPQ
 VwsEQu3XWu25pD0KM9WGAWzIkOBgz+vFjw0qupp9V+xL/dhl788DG+ekc
 TrbjsCbkMP2P0jRQaotApD0gtUY33rjcDo8ygabMxQTBti45i1g2X5yJX
 L84g6B3i2AlAkZ35dVLPeanqIjSWj4DeFIRQwcxqteZ+rIrrDv0mfgt/x
 0Hx+pvBWK6WcqFfGODoyC13v894YBHDwNGrY8gmOJDVDg9nQoQB5raxp0
 +ztirsWTZY9U3jtaOHG13uC3CBBn7E++q9d1ZKmUq74hWKbpiy0jFfx7f w==;
X-CSE-ConnectionGUID: ul5y3JHKQzuIYo16P8+KnQ==
X-CSE-MsgGUID: BnpdgCenSMmvv/Ef5TtzbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="73112846"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73112846"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:18:12 -0700
X-CSE-ConnectionGUID: 4Mlsk2ozRqaVPWcfe+y2Cg==
X-CSE-MsgGUID: s/ifWkyzTlGI/8M354o2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190358405"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.245.156])
 ([10.245.245.156])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:18:07 -0700
Message-ID: <72235afd-c849-49fe-9cc1-2b1781abdf08@linux.intel.com>
Date: Wed, 23 Jul 2025 11:18:33 +0200
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

Hey,

It's reverting time!
Lots of reverts thsi time around, and some small fixes.

Best regards,
~Maarten

drm-misc-fixes-2025-07-23:
drm-misc-fixes for v6.16-rc8/final?:
- Revert all uses of drm_gem_object->dmabuf to
  drm_gem_object->import_attach->dmabuf.
- Fix amdgpu returning BIOS cluttered VRAM after resume.
- Scheduler hang fix.
- Revert nouveau ioctl fix as it caused regressions.
- Fix null pointer deref in nouveau.
- Fix unnecessary semicolon in ti_sn_bridge_probe.
The following changes since commit cb345f954eacd162601e7d07ca2f0f0a17b54ee3:

  drm/panfrost: Fix scheduler workqueue bug (2025-07-14 16:49:10 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-07-23

for you to fetch changes up to 15a7ca747d9538c2ad8b0c81dd4c1261e0736c82:

  drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn_bridge_probe() (2025-07-22 07:46:34 -0700)

----------------------------------------------------------------
drm-misc-fixes for v6.16-rc8/final?:
- Revert all uses of drm_gem_object->dmabuf to
  drm_gem_object->import_attach->dmabuf.
- Fix amdgpu returning BIOS cluttered VRAM after resume.
- Scheduler hang fix.
- Revert nouveau ioctl fix as it caused regressions.
- Fix null pointer deref in nouveau.
- Fix unnecessary semicolon in ti_sn_bridge_probe.

----------------------------------------------------------------
Arnd Bergmann (1):
      Revert "drm/nouveau: check ioctl command codes better"

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Reset the clear flag in buddy during resume

Ben Skeggs (1):
      drm/nouveau/nvif: fix null ptr deref on pre-fermi boards

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Remove extra semicolon in ti_sn_bridge_probe()

Lin.Cao (1):
      drm/sched: Remove optimization that causes hang when killing dependent jobs

Thomas Zimmermann (7):
      Revert "drm/virtio: Use dma_buf from GEM object instance"
      Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
      Revert "drm/etnaviv: Use dma_buf from GEM object instance"
      Revert "drm/prime: Use dma_buf from GEM object instance"
      Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
      Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
      Revert "drm/gem-dma: Use dma_buf from GEM object instance"

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        |  2 +-
 drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +--
 drivers/gpu/drm/drm_prime.c                  |  8 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c        | 11 +++----
 drivers/gpu/drm/nouveau/nvif/chan.c          |  3 ++
 drivers/gpu/drm/scheduler/sched_entity.c     | 21 ++------------
 drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 ++--
 include/drm/drm_buddy.h                      |  2 ++
 16 files changed, 101 insertions(+), 38 deletions(-)
