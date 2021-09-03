Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A03FFD4B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 11:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061496E098;
	Fri,  3 Sep 2021 09:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDDE6E098;
 Fri,  3 Sep 2021 09:38:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="219436500"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="219436500"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:37:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="543433538"
Received: from schuethe-mobl1.ger.corp.intel.com (HELO [10.252.60.46])
 ([10.252.60.46])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:37:42 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <41ff5e54-0837-2226-a182-97ffd11ef01e@linux.intel.com>
Date: Fri, 3 Sep 2021 11:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

drm-misc-next-fixes-2021-09-03:
drm-misc-next-fixes for v5.15:
- Fix ttm_bo_move_memcpy() when ttm_resource is subclassed.
- Small fixes to panfrost, mgag200, vc4.
- Small ttm compilation fixes.
The following changes since commit 2819cf0e7dbe45a2bccf2f6c60fe6a27b299cc3e:

  Merge tag 'drm-misc-next-2021-08-12' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-08-16 12:57:33 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-09-03

for you to fetch changes up to efcefc7127290e7e9fa98dea029163ad8eda8fb3:

  drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct ttm_resource (2021-08-31 10:48:26 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v5.15:
- Fix ttm_bo_move_memcpy() when ttm_resource is subclassed.
- Small fixes to panfrost, mgag200, vc4.
- Small ttm compilation fixes.

----------------------------------------------------------------
Alyssa Rosenzweig (3):
      drm/panfrost: Simplify lock_region calculation
      drm/panfrost: Use u64 for size in lock_region
      drm/panfrost: Clamp lock region to Bifrost minimum

Colin Ian King (1):
      drm/mgag200: Fix uninitialized variable delta

Jason Ekstrand (2):
      drm/ttm: ttm_bo_device is now ttm_device
      drm/ttm: Include pagemap.h from ttm_tt.h

Jiapeng Chong (1):
      drm/vc4: hdmi: make vc4_hdmi_codec_pdata static

Thomas Hellström (1):
      drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct ttm_resource

 Documentation/gpu/drm-mm.rst             |  2 +-
 drivers/gpu/drm/mgag200/mgag200_pll.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 31 +++++++++++--------------------
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 drivers/gpu/drm/ttm/ttm_bo_util.c        |  7 +++----
 drivers/gpu/drm/ttm/ttm_tt.c             |  1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c           |  2 +-
 include/drm/ttm/ttm_tt.h                 |  3 ++-
 8 files changed, 21 insertions(+), 28 deletions(-)
