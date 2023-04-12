Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098C6DF73B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EA410E7F1;
	Wed, 12 Apr 2023 13:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211C210E7E5;
 Wed, 12 Apr 2023 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681306357; x=1712842357;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=a+DUgoFx53ai7zeE+1wZ7ShrSVGe9fQWLh8Xn2jLHBU=;
 b=gYzdDKAoNAotccS3JMEhHB3lSbyKv/y+/HPc991/TWjIUGQhnotwKOAq
 qiy6/VZTdgMyPqx2zmnUBYHfXi8DV4emGHA9wlbgRVXeutDDnLG5rClDb
 T2GzhRVstmB5X7Igvd1GLevlOWmz27z75iDSvhfmnx0YgqI0R0Iroj6zO
 4Qz2cxJrHkcQ1gVXtA1xBlHiIvdOaQMcGjiZvpySNUyUPVhLdLkZJETUl
 8fOfpb+YUrp2MT7r1HLbBjATAyiKsN2EN26DOLmuPGvd3XhW3JZV4QIUQ
 UjoYVrJSfN2A727O5hT+jO1waXkIC7+giqBoFGxpXPqEFADoYf+ks93Jb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332592919"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332592919"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 06:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691531915"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691531915"
Received: from gjebert-mobl.amr.corp.intel.com (HELO [10.252.57.51])
 ([10.252.57.51])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 06:32:33 -0700
Message-ID: <b7c37d4e-8f16-85dc-0f5f-3bd98f961395@linux.intel.com>
Date: Wed, 12 Apr 2023 15:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Good afternoon Daniel, Dave,

One last pull request for drm-misc-next.

Small one, so easy to merge. As a result also more likely to eat your 
computer alive. ;)

Cheers,

~Maarten

drm-misc-next-2023-04-12:

drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- Convert MIPI DSIM bridge to yaml.

Core Changes:
- Fix UAF race in drm scheduler.

Driver Changes:
- Add primary plane positioning support to VKMS.
- Convert omapdrm fbdev emulation to in-kernel client.
- Assorted small fixes to vkms, vc4, nouveau, vmwgfx.
The following changes since commit e44f18c6ff8beef7b2b10592287f0a9766376d9b:

   drm/ttm: Make the call to ttm_tt_populate() interruptible when 
faulting (2023-04-06 10:01:42 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-04-12

for you to fetch changes up to fd35174e13f98f9232c4aa66689816731d34ca28:

   drm/vmwgfx: remove unused vmw_overlay function (2023-04-11 13:48:55 
-0400)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- Convert MIPI DSIM bridge to yaml.

Core Changes:
- Fix UAF race in drm scheduler.

Driver Changes:
- Add primary plane positioning support to VKMS.
- Convert omapdrm fbdev emulation to in-kernel client.
- Assorted small fixes to vkms, vc4, nouveau, vmwgfx.

----------------------------------------------------------------
Asahi Lina (1):
       drm/scheduler: Fix UAF race in drm_sched_entity_push_job()

Ben Dooks (1):
       drm/nouveau/mc/ga100: make ga100_mc_device static

Jagan Teki (1):
       dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml

Javier Martinez Canillas (2):
       drm/vkms: Drop vkms_connector_destroy() wrapper
       drm/vkms: Remove <drm/drm_simple_kms_helper.h> include

Martin Krastev (2):
       drm/vmwgfx: Drop mksstat_init_record fn as currently unused
       drm/vmwgfx: Fix Legacy Display Unit atomic drm support

Maíra Canal (2):
       drm/vkms: remove the need for the primary plane to be visible
       drm/vkms: allow the primary plane to be positioned

Thomas Zimmermann (5):
       drm/omapdrm: Include <linux/of.h>
       drm/omapdrm: Remove fb from struct omap_fbdev
       drm/omapdrm: Remove bo from struct omap_fbdev
       drm/omapdrm: Remove fbdev from struct omap_drm_private
       drm/omapdrm: Implement fbdev emulation as in-kernel client

Tom Rix (2):
       drm/vc4: remove unused render_wait variable
       drm/vmwgfx: remove unused vmw_overlay function

Zack Rusin (1):
       drm/vmwgfx: Print errors when running on broken/unsupported configs

ruanjinjie (1):
       drm/nouveau/disp: make gv100_disp_core_mthd_base static

  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 255 
+++++++++++++++++++++
  .../bindings/display/exynos/exynos_dsim.txt        |  92 --------
  MAINTAINERS                                        |   1 +
  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |   2 +-
  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c     |   2 +-
  drivers/gpu/drm/omapdrm/omap_debugfs.c             |   6 +-
  drivers/gpu/drm/omapdrm/omap_drv.c                 |  13 +-
  drivers/gpu/drm/omapdrm/omap_drv.h                 |   3 -
  drivers/gpu/drm/omapdrm/omap_fbdev.c               | 163 ++++++++-----
  drivers/gpu/drm/omapdrm/omap_fbdev.h               |   9 +-
  drivers/gpu/drm/scheduler/sched_entity.c           |  11 +-
  drivers/gpu/drm/vc4/vc4_irq.c                      |   2 -
  drivers/gpu/drm/vkms/vkms_output.c                 |  15 +-
  drivers/gpu/drm/vkms/vkms_plane.c                  |  10 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  29 +++
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   2 +
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  62 +----
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   5 -
  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  45 +++-
  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |  35 +--
  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |   6 -
  21 files changed, 465 insertions(+), 303 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
  delete mode 100644 
Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt

