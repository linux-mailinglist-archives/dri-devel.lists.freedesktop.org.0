Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BE9C1DD8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5312410E9B1;
	Fri,  8 Nov 2024 13:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sz2il8+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5310E9AA;
 Fri,  8 Nov 2024 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731072358; x=1762608358;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=S2VNek8ejcTdYtioyD79AYWAgsLU1p+DQywLDkjDBa8=;
 b=Sz2il8+lZSmx63rma4IthMEDLyNhsaUoD1wuWaVF+ZLobpknQ/oYZ5rW
 7jEzsACQpidsiTHIowAbvoJSMIcNdmji9X6CBZ4ndGa8Bqp5viSvTjCEi
 AXiBRuIlzcHR5pc+hVTQx3T+qilX5BKkP6W38tdLkqyuAhuTZkG3hTPiL
 T+iB6p9HnpuHyAA0KiAzQPmQY/LiwDlo5gHg9uG2edwHaBqkBVXSpb8nY
 xYq4d4z8DlaoXIYqWa7Xu30gjfn2XfmREaKznkYolSrjNS4XSkoRRBZHZ
 7RCnHDizCKLPOv5O4MQPHFoRYn1O6CIoZGe0g+INE/TUpKT4+EAv9I3ND g==;
X-CSE-ConnectionGUID: 7DDQn2R6TSmVDmwibsmmRA==
X-CSE-MsgGUID: UqXYH0EEReiLSyloUBOrDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="56351288"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="56351288"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 05:25:57 -0800
X-CSE-ConnectionGUID: kpbk2IuhQpyz8ywqV7A0hw==
X-CSE-MsgGUID: CNfx694ESY+ZtkQf5Fx/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85076154"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.178])
 ([10.245.245.178])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 05:25:51 -0800
Message-ID: <344afe41-d27b-408a-8542-bfecfd3555f6@linux.intel.com>
Date: Fri, 8 Nov 2024 14:26:14 +0100
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
Subject: [PULL] drm-misc-next
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

Hi Dave, Simona,

Sorry for being late. I tried sending a pull request on monday, then noticed the first compile fix was already in drm-next. There's one more in this tree, mediatek no longer builds on arm64 without it.
I've lost my fiber connection on wednesday, and unfortunately it's still not repaired.
So here, a bit belatedly, last drm-misc-next pull request for this cycle I hope.

Cheers,
~Maarten

drm-misc-next-2024-11-08:
drm-misc-next for v6.13:

UAPI Changes:
- Add 1X7X5 media-bus formats.

Cross-subsystem Changes:
- Maintainer updates for VKMS and IT6263.
- Add media-bus-fmt for MEDIA_BUS_FMT_RGB101010_1X7X5_*.
- Add IT6263 DT bindings and driver.

Core Changes:
- Add ABGR210101010 support to panic handler.
- Use ATOMIC64_INIT in drm_file.c
- Improve scheduler teardown documentation.

Driver Changes:
- Make mediatek compile on ARM again.
- Add missing drm/drm_bridge.h header include, already in drm-next.
- Small fixes and cleanups to vkms, bridge/it6505, panfrost, panthor.
- Add panic support to nouveau for nv50+.
The following changes since commit 30169bb64580bd7bce9290c1952bf0aa6cc37fe5:

  Backmerge v6.12-rc6 of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into drm-next (2024-11-04 14:25:33 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-11-08

for you to fetch changes up to baf4afc5831438b35de4b0e951b9cd58435a6d99:

  drm/sched: Improve teardown documentation (2024-11-07 10:05:54 +0100)

----------------------------------------------------------------
drm-misc-next for v6.13:

UAPI Changes:
- Add 1X7X5 media-bus formats.

Cross-subsystem Changes:
- Maintainer updates for VKMS and IT6263.
- Add media-bus-fmt for MEDIA_BUS_FMT_RGB101010_1X7X5_*.
- Add IT6263 DT bindings and driver.

Core Changes:
- Add ABGR210101010 support to panic handler.
- Use ATOMIC64_INIT in drm_file.c
- Improve scheduler teardown documentation.

Driver Changes:
- Make mediatek compile on ARM again.
- Add missing drm/drm_bridge.h header include, already in drm-next.
- Small fixes and cleanups to vkms, bridge/it6505, panfrost, panthor.
- Add panic support to nouveau for nv50+.

----------------------------------------------------------------
Adrián Larumbe (2):
      drm/panfrost: Add missing OPP table refcnt decremental
      drm/panthor: Fix OPP refcnt leaks in devfreq initialisation

Arnd Bergmann (1):
      drm/imx/dcss: include drm/drm_bridge.h header

Chen-Yu Tsai (2):
      drm/mediatek: Drop dependency on ARM
      drm/bridge: it6505: Fix inverted reset polarity

Jocelyn Falempe (3):
      drm/panic: Add ABGR2101010 support
      drm/nouveau/disp: Move tiling functions to dispnv50/tile.h
      drm/nouveau: Add drm_panic support for nv50+

Jonathan Gray (1):
      drm: use ATOMIC64_INIT() for atomic64_t

José Expósito (1):
      drm/vkms: Drop unnecessary call to drm_crtc_cleanup()

Liu Ying (8):
      media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
      drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA, SPWG} LVDS data mappings
      drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
      dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel data mappings
      dt-bindings: display: Document dual-link LVDS display common properties
      dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
      drm/bridge: Add ITE IT6263 LVDS to HDMI converter
      MAINTAINERS: Add maintainer for ITE IT6263 driver

Louis Chauvet (1):
      drm/vkms: Remove usage of legacy drm_crtc members

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Maíra Canal (1):
      MAINTAINERS: Remove myself as a VKMS maintainer

Philipp Stanner (1):
      drm/sched: Improve teardown documentation

Vignesh Raman (1):
      drm/ci: remove update-xfails.py

 .../bindings/display/bridge/ite,it6263.yaml        | 250 ++++++
 .../bindings/display/lvds-data-mapping.yaml        |  31 +
 .../bindings/display/lvds-dual-ports.yaml          |  63 ++
 .../display/panel/advantech,idk-2121wr.yaml        |  14 +-
 .../panel/panel-simple-lvds-dual-ports.yaml        |  20 +-
 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++-
 MAINTAINERS                                        |   9 +-
 drivers/gpu/drm/bridge/Kconfig                     |  11 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ite-it6263.c                | 898 +++++++++++++++++++++
 drivers/gpu/drm/bridge/ite-it6505.c                |   8 +-
 drivers/gpu/drm/ci/xfails/requirements.txt         |  17 -
 drivers/gpu/drm/ci/xfails/update-xfails.py         | 204 -----
 drivers/gpu/drm/drm_file.c                         |   2 +-
 drivers/gpu/drm/drm_of.c                           |  84 +-
 drivers/gpu/drm/drm_panic.c                        |  10 +
 drivers/gpu/drm/mediatek/Kconfig                   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/tile.h            |  63 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            | 129 ++-
 drivers/gpu/drm/nouveau/nouveau_display.c          |  59 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   3 +-
 drivers/gpu/drm/panthor/panthor_devfreq.c          |  17 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  23 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   4 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   2 -
 drivers/gpu/drm/vkms/vkms_output.c                 |   5 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   4 +-
 include/drm/drm_of.h                               |   9 +
 include/uapi/linux/media-bus-format.h              |   4 +-
 29 files changed, 1754 insertions(+), 348 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
 delete mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 delete mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/tile.h
