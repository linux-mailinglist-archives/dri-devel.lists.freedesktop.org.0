Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D3A11D6F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688010E5A9;
	Wed, 15 Jan 2025 09:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGesdY5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3748914B;
 Wed, 15 Jan 2025 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736932982; x=1768468982;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=D1noM1/Z4Srv0MH7iJLl2ke54StHSgG5Y9rb/yCUhL4=;
 b=JGesdY5Keu5dvKEWYTdt7eb61BI5AiwrBuVOndxc3xEG4UKmZaP9JYVw
 iFTIRriQG6HjVC6VhbWFo8L+N4qPpKw7gFnj7pkUPVGVMFPptb1wE7YiI
 U377bRyj0gvMRrSiW45f/s6H3RN38C371xTyCpWrXzQs4mw+RF9au0XtH
 qr6x9O+N9Tg4vBibIqMr7Vf1B8AkAl3JINVfLtkbstIkHJU1BFc7/CGEy
 /v/TkE8kLTRtjkKvYVUGtN4VpSwJz1H5kf/0av41HmtmLQgVbgfOfN/+d
 QY13oaVYzjuYgGVVSrYorgSRts47gdkDsQwDZbAZ12KR5VNbl7TPOJK0b w==;
X-CSE-ConnectionGUID: I+oZ8toNTwSI41HgMxmh+w==
X-CSE-MsgGUID: /948zWZjQP+vjx8SYFPenA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62629025"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="62629025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 01:23:01 -0800
X-CSE-ConnectionGUID: AErnjB1tQW+Sm7bs7IAiCw==
X-CSE-MsgGUID: vDBvRtGnR2aypV53ySvcNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110217505"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.166])
 ([10.245.244.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 01:22:57 -0800
Message-ID: <a89adcd5-2042-4e7f-93f4-2b299bb1ef17@linux.intel.com>
Date: Wed, 15 Jan 2025 10:22:54 +0100
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
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dave, Simona,

drm-misc-fixes for v6.13. I was out last week so it's 2 weeks worth. :-)

Cheers,
~Maarten

drm-misc-fixes-2025-01-15:
drm-misc-fixes for v6.13:

- itee-it6263 error handling fix.
- Fix warn when unloading v3d.
- Fix W=1 build for kunit tests.
- Fix backlight regression for macbooks 5,1 in nouveau.
- Handle YCbCr420 better in bridge code, with tests.
- Fix cross-device fence handling in nouveau.
- Fix BO reservation handling in vmwgfx.

The following changes since commit 79d67c499c3f886202a40c5cb27e747e4fa4d738:

   drm: adv7511: Drop dsi single lane support (2024-12-20 03:53:25 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-fixes-2025-01-15

for you to fetch changes up to ef84aee151bd6c2c9223c8b430cae21d57b5e1c1:

   drm/bridge: ite-it6263: Prevent error pointer dereference in probe() 
(2025-01-15 11:27:08 +0800)

----------------------------------------------------------------
drm-misc-fixes for v6.13:

- itee-it6263 error handling fix.
- Fix warn when unloading v3d.
- Fix W=1 build for kunit tests.
- Fix backlight regression for macbooks 5,1 in nouveau.
- Handle YCbCr420 better in bridge code, with tests.
- Fix cross-device fence handling in nouveau.
- Fix BO reservation handling in vmwgfx.

----------------------------------------------------------------
Cristian Ciocaltea (4):
       drm/bridge: Prioritize supported_formats over ycbcr_420_allowed
       drm/bridge-connector: Sync supported_formats with computed 
ycbcr_420_allowed
       drm/connector: hdmi: Validate supported_formats matches 
ycbcr_420_allowed
       drm/tests: connector: Add ycbcr_420_allowed tests

Dan Carpenter (1):
       drm/bridge: ite-it6263: Prevent error pointer dereference in probe()

Dave Airlie (1):
       nouveau/fence: handle cross device fences properly

Ian Forbes (3):
       drm/vmwgfx: Unreserve BO on error
       drm/vmwgfx: Remove busy_places
       drm/vmwgfx: Add new keep_resv BO param

Maíra Canal (1):
       drm/v3d: Ensure job pointer is set to NULL after job completion

Takashi Iwai (1):
       drm/nouveau/disp: Fix missing backlight control on Macbook 5,1

Yu-Chun Lin (1):
       drm/tests: helpers: Fix compiler warning

  drivers/gpu/drm/bridge/ite-it6263.c              |  4 +-
  drivers/gpu/drm/display/drm_bridge_connector.c   |  8 +++-
  drivers/gpu/drm/drm_bridge.c                     |  4 ++
  drivers/gpu/drm/drm_connector.c                  |  3 ++
  drivers/gpu/drm/nouveau/nouveau_fence.c          |  6 ++-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c |  1 +
  drivers/gpu/drm/tests/drm_connector_test.c       | 60 
++++++++++++++++++++++++
  drivers/gpu/drm/tests/drm_kunit_helpers.c        |  3 +-
  drivers/gpu/drm/v3d/v3d_irq.c                    |  4 ++
  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c               |  4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h               |  4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c              |  7 +--
  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c              |  1 +
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c              | 20 ++++++--
  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c           |  7 +--
  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       |  5 +-
  16 files changed, 111 insertions(+), 30 deletions(-)
