Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F1324CC1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2096E218;
	Thu, 25 Feb 2021 09:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66926E218;
 Thu, 25 Feb 2021 09:25:49 +0000 (UTC)
IronPort-SDR: MsqSf5pl9o6+htMSfMperKJyRGXIS/oo8tQVFKsvH+/lq27woi7TWRP3fUedLs4YgcmOd0YbKU
 n9WGhVpYAk/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="164688311"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="164688311"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 01:25:49 -0800
IronPort-SDR: zczo3BuwbZXbxNjLUGwXihKQQcunKpY2Vup/i3SopTDBytZquCqlpClmSkgxS0QDeXUrjE7/5n
 f0IpubgN5d7g==
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="392235214"
Received: from stuppert-mobl.ger.corp.intel.com (HELO [10.252.41.159])
 ([10.252.41.159])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 01:25:47 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <0f60a68c-d562-7266-0815-ea75ff680b17@linux.intel.com>
Date: Thu, 25 Feb 2021 10:25:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-fixes-2021-02-25:
drm-misc-next tasty fixes for v5.12:
- Cherry pick of drm-misc-fixes pull:
"here's this week's PR for drm-misc-fixes. One of the patches is a memory
leak; the rest is for hardware issues."
- Fix dt bindings for dp connector.
- Fix build error in atyfb.
- Improve error handling for dma-buf heaps.
- Make vblank timestamp more correct, by recording timestamp to be set when signaling.
The following changes since commit e2183fb135a7f62d317aa1c61eb3d1919080edba:

  Revert "drm/scheduler: Job timeout handler returns status (v3)" (2021-02-10 15:26:00 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-02-25

for you to fetch changes up to d922d58fedcd98ba625e89b625a98e222b090b10:

  drm/panel: kd35t133: allow using non-continuous dsi clock (2021-02-25 10:18:45 +0100)

----------------------------------------------------------------
drm-misc-next tasty fixes for v5.12:
- Cherry pick of drm-misc-fixes pull:
"here's this week's PR for drm-misc-fixes. One of the patches is a memory
leak; the rest is for hardware issues."
- Fix dt bindings for dp connector.
- Fix build error in atyfb.
- Improve error handling for dma-buf heaps.
- Make vblank timestamp more correct, by recording timestamp to be set when signaling.

----------------------------------------------------------------
Alyssa Rosenzweig (1):
      drm/rockchip: Require the YTR modifier for AFBC

Bjorn Andersson (1):
      dt-bindings: dp-connector: Drop maxItems from -supply

Heiko Stuebner (1):
      drm/panel: kd35t133: allow using non-continuous dsi clock

John Stultz (2):
      dma-buf: system_heap: Make sure to return an error if we abort
      dma-buf: heaps: Rework heap allocation hooks to return struct dma_buf instead of fd

Randy Dunlap (1):
      fbdev: atyfb: add stubs for aty_{ld,st}_lcd()

Veera Sundaram Sankaran (2):
      dma-fence: allow signaling drivers to set fence timestamp
      drm/drm_vblank: set the dma-fence timestamp during send_vblank_event

xinhui pan (1):
      drm/ttm: Fix a memory leak

 .../bindings/display/connector/dp-connector.yaml   |  1 -
 drivers/dma-buf/dma-fence.c                        | 70 +++++++++++++++++++---
 drivers/dma-buf/dma-heap.c                         | 14 ++++-
 drivers/dma-buf/heaps/cma_heap.c                   | 22 +++----
 drivers/dma-buf/heaps/system_heap.c                | 25 ++++----
 drivers/gpu/drm/drm_file.c                         | 68 +++++++++++++++++----
 drivers/gpu/drm/drm_vblank.c                       |  9 ++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        | 11 ++++
 drivers/gpu/drm/ttm/ttm_bo.c                       |  9 ++-
 drivers/video/fbdev/aty/atyfb_base.c               |  9 +++
 include/drm/drm_file.h                             |  3 +
 include/linux/dma-fence.h                          |  3 +
 include/linux/dma-heap.h                           | 12 ++--
 14 files changed, 197 insertions(+), 62 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
