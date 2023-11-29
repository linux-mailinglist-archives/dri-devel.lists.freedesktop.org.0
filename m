Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B957FE0A5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 20:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893C210E65C;
	Wed, 29 Nov 2023 19:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 19:58:24 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE5010E079;
 Wed, 29 Nov 2023 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701287904; x=1732823904;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=QyW5HyGpIaGRy7E9j+XFj6/NRukJa5SLs0nyg0hu3pI=;
 b=n6hIYQlpejSQIzn4FyJyIPuzQx0hxRqW4CgFYnwvsWtLblK1M4ytEQHt
 q7Rkw3jYX9XNpBXgxfPLwXzB3jDj2HAl86j0zqYLl+86mEhOAiqiOdNWP
 nPbs4gmlOf+u56if/20Y9vv9BUFYC0T4SPvlkXX5xmDLzhLim7+TB7mq0
 Vve4rdkOnBzcNPVboy5l0fJdcTKza4Bcu9qWcQQveprQc/y6uucLBxtPO
 hV5fKbIvHK8GZX4FhRHzzsFmG+9yY3QuBIKXmK4na694nfdVE0bHDBIM6
 ZsiPF4WcsO7wUZxqlK0LL+T27/G5mjBEZQ8J4/xBMdI9ghzmi7tNpfLSK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="86211"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="86211"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:51:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100651076"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1100651076"
Received: from johnypau-mobl1.ger.corp.intel.com (HELO [10.251.221.130])
 ([10.251.221.130])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:51:14 -0800
Message-ID: <561f807e-f9d3-43c1-80d3-8b41ba83c9ec@linux.intel.com>
Date: Wed, 29 Nov 2023 20:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

This pull request is a bit confusing, as it first adds the panel fixes 
and a driver/core change, then immediately revert it.

Cheers,
~Maarten

drm-misc-fixes-2023-11-29:
Fixes for v6.7-rc4:
- Revert panel fixes as they require exporting device_is_dependent.
- Do not double add fences in dma_resv_add_fence.
- Fix GPUVM license identifier.
- Assorted nouveau fixes.
- Fix error check for nt36523.
The following changes since commit ab93edb2f94c3c0d5965be3815782472adbe3f52:

   nouveau/gsp: allocate enough space for all channel ids. (2023-11-21 
22:28:01 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-11-29

for you to fetch changes up to fb18fe0fdf22a2f4512a8b644bb5ea1473829cda:

   drm/panel: nt36523: fix return value check in nt36523_probe() 
(2023-11-29 16:54:23 +0100)

----------------------------------------------------------------
Fixes for v6.7-rc4:
- Revert panel fixes as they require exporting device_is_dependent.
- Do not double add fences in dma_resv_add_fence.
- Fix GPUVM license identifier.
- Assorted nouveau fixes.
- Fix error check for nt36523.

----------------------------------------------------------------
Christian König (1):
       dma-buf: fix check in dma_resv_add_fence

Dan Carpenter (1):
       nouveau/gsp/r535: remove a stray unlock in r535_gsp_rpc_send()

Dave Airlie (1):
       nouveau: find the smallest page allocation to cover a buffer alloc.

Gustavo A. R. Silva (1):
       nouveau/gsp: replace zero-length array with flex-array member and 
use __counted_by

Linus Walleij (3):
       Revert "drm/bridge: panel: Check device dependency before 
managing device link"
       Revert "driver core: Export device_is_dependent() to modules"
       Revert "drm/bridge: panel: Add a device link between drm device 
and panel device"

Liu Ying (2):
       drm/bridge: panel: Check device dependency before managing device 
link
       driver core: Export device_is_dependent() to modules

Thomas Hellström (1):
       drm/gpuvm: Fix deprecated license identifier

Yang Yingliang (1):
       drm/panel: nt36523: fix return value check in nt36523_probe()

xiazhengqiao (1):
       drm/panel: starry-2081101qfh032011-53g: Fine tune the panel power 
sequence

  drivers/dma-buf/dma-resv.c                              |  2 +-
  drivers/gpu/drm/bridge/panel.c                          | 17 
-----------------
  drivers/gpu/drm/drm_gpuvm.c                             |  2 +-
  .../nvrm/535.113.01/nvidia/generated/g_os_nvoc.h        |  2 +-
  drivers/gpu/drm/nouveau/nouveau_bo.c                    |  5 +++--
  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c          |  6 ++----
  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c          |  1 +
  drivers/gpu/drm/panel/panel-novatek-nt36523.c           |  4 ++--
  include/drm/drm_gpuvm.h                                 |  2 +-
  include/linux/dma-fence.h                               | 15 
+++++++++++++++
  10 files changed, 27 insertions(+), 29 deletions(-)
