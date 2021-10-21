Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD0435E08
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B42189179;
	Thu, 21 Oct 2021 09:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5463E89165;
 Thu, 21 Oct 2021 09:33:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="292452430"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="292452430"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 02:33:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="444720951"
Received: from pkreftx-mobl1.ger.corp.intel.com (HELO [10.252.50.34])
 ([10.252.50.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 02:33:05 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <e66eaf89-b9b9-41f5-d0d2-dad7e59fabb5@linux.intel.com>
Date: Thu, 21 Oct 2021 11:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi Dave,

New drm-misc-fixes without the vc4 changes. I feel that needs some more discussion first.

drm-misc-fixes-2021-10-21-1:
drm-misc-fixes for v5.15-rc7:
- Rebased, to remove vc4 patches.
- Fix mxsfb crash on unload.
- Use correct sync parameters for Feixin K101-IM2BYL02.
- Assorted kmb modeset/atomic fixes.
The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-10-21-1

for you to fetch changes up to 74056092ff415e7e20ce2544689b32ee811c4f0b:

  drm/kmb: Enable ADV bridge after modeset (2021-10-21 11:08:09 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.15-rc7:
- Rebased, to remove vc4 patches.
- Fix mxsfb crash on unload.
- Use correct sync parameters for Feixin K101-IM2BYL02.
- Assorted kmb modeset/atomic fixes.

----------------------------------------------------------------
Anitha Chrisanthus (4):
      drm/kmb: Work around for higher system clock
      drm/kmb: Limit supported mode to 1080p
      drm/kmb: Corrected typo in handle_lcd_irq
      drm/kmb: Enable ADV bridge after modeset

Dan Johansen (1):
      drm/panel: ilitek-ili9881c: Fix sync for Feixin K101-IM2BYL02 panel

Edmund Dea (2):
      drm/kmb: Remove clearing DPHY regs
      drm/kmb: Disable change of plane parameters

Marek Vasut (1):
      drm: mxsfb: Fix NULL pointer dereference crash on unload

 drivers/gpu/drm/kmb/kmb_crtc.c                | 41 +++++++++++++++++++++++--
 drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.h                 | 10 ++++++-
 drivers/gpu/drm/kmb/kmb_dsi.c                 | 25 +++++++++-------
 drivers/gpu/drm/kmb/kmb_dsi.h                 |  2 +-
 drivers/gpu/drm/kmb/kmb_plane.c               | 43 ++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_plane.h               |  6 ++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  6 +++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++----
 9 files changed, 123 insertions(+), 24 deletions(-)
