Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDA165B1A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 11:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5556ED11;
	Thu, 20 Feb 2020 10:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85756E8B3;
 Thu, 20 Feb 2020 10:06:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 02:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,464,1574150400"; d="scan'208";a="436544199"
Received: from gumm-mobl2.ger.corp.intel.com (HELO [10.252.39.181])
 ([10.252.39.181])
 by fmsmga006.fm.intel.com with ESMTP; 20 Feb 2020 02:06:16 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <f5a6370d-9898-6c72-43e4-5bb56a99b6f2@linux.intel.com>
Date: Thu, 20 Feb 2020 11:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
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

I see I missed some commits in the actual tag, but I fixed this below.


drm-misc-fixes-2020-02-20:
drm-misc-fixes for v5.6-rc3:
- Fix dt binding for sunxi.
- Allow only 1 rotation argument, and allow 0 rotation in video cmdline.
- Small compiler warning fix for panfrost.
- Fix when using performance counters in panfrost when using per fd address space.
- Fix tc358767 poll timeouts.
- Fix ti-tfp410 error message.

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-02-20

for you to fetch changes up to dde2bb2da01e96c17f0a44b4a3cf72a30e66e3ef:

  drm/panfrost: perfcnt: Reserve/use the AS attached to the perfcnt MMU context (2020-02-12 14:27:29 -0600)

----------------------------------------------------------------
drm-misc-fixes for v5.6-rc3:
- Fix dt binding for sunxi.
- Allow only 1 rotation argument, and allow 0 rotation in video cmdline.
- Small compiler warning fix for panfrost.
- Fix when using performance counters in panfrost when using per fd address space.

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panfrost: perfcnt: Reserve/use the AS attached to the perfcnt MMU context

Geert Uytterhoeven (1):
      drm/bridge: ti-tfp410: Update drm_connector_init_with_ddc() error message

Maarten Lankhorst (1):
      Merge v5.6-rc1 into drm-misc-fixes

Maxime Ripard (1):
      dt-bindings: display: sunxi: Fix compatible

Stephan Gerhold (2):
      drm/modes: Make sure to parse valid rotation value from cmdline
      drm/modes: Allow DRM_MODE_ROTATE_0 when applying video mode parameters

Tomi Valkeinen (1):
      drm/bridge: tc358767: fix poll timeouts

YueHaibing (1):
      drm/panfrost: Remove set but not used variable 'bo'

 .../bindings/display/allwinner,sun4i-a10-tcon.yaml        |  6 +++++-
 drivers/gpu/drm/bridge/tc358767.c                         |  8 ++++----
 drivers/gpu/drm/bridge/ti-tfp410.c                        |  3 ++-
 drivers/gpu/drm/drm_client_modeset.c                      |  3 ++-
 drivers/gpu/drm/drm_dp_mst_topology.c                     |  3 ++-
 drivers/gpu/drm/drm_modes.c                               |  7 +++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c                   |  1 +
 drivers/gpu/drm/panfrost/panfrost_gem.h                   |  6 ++++++
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c          |  3 +++
 drivers/gpu/drm/panfrost/panfrost_job.c                   | 13 +++++++------
 drivers/gpu/drm/panfrost/panfrost_mmu.c                   |  7 ++++++-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c               | 11 ++++-------
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h         |  1 +
 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c       | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun4i_drv.c                         |  1 -
 15 files changed, 63 insertions(+), 25 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
