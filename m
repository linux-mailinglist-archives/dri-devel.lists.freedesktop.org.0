Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68703808815
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 13:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2589610E891;
	Thu,  7 Dec 2023 12:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972ED10E88B;
 Thu,  7 Dec 2023 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953042; x=1733489042;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=VXMkNCp/0fEh5/tqDJmqJh6C86hFzFqSsaftGWwhb24=;
 b=kye3DrHQ4rldKc5zroDwUr5MDdmJ+k2l3IEzZ5OjWUd2N3/PmoLo3Jxo
 qiHtEB8jkZhK+bNIEjtL2V3ozJewMojHWifsyY26oOSUyXLFFnmY/fDXx
 qyW2SVm1PNCD3WV7bai5RO+4ZpN5HAspec1gC2hO+FWdjdTDHQ1yYdFHl
 pV1o9INN0xH6AQ7QSXTIh1BHZa3DhyiA1hqmcBX75+lkhAJD6ZeZ0rBIq
 jGjeRekAjeQHkQghfErnpFGKmv+4BVFJqg7q4059+CueDo8tMQt76X7e7
 /KFvO4uKgb95YiofDH4GeDTl6SsWe8ux6wZvPcRSx6eR/ZgGZYR4KGUSq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458546369"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="458546369"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889731378"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="889731378"
Received: from amarov-mobl.ger.corp.intel.com (HELO [10.249.34.252])
 ([10.249.34.252])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:43:59 -0800
Message-ID: <05a26dc0-8cf1-4b1f-abb6-3bf471fbfc99@linux.intel.com>
Date: Thu, 7 Dec 2023 13:43:56 +0100
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

Pull request for v6.7-rc5.

Cheers,
~Maarten

drm-misc-fixes-2023-12-07:
drm-misc-fixes for v6.7-rc5:
- Document nouveau's GSP-RM.
- Flush vmm harder on nouveau tu102.
- Panfrost fix for imported dma-buf objects, and device frequency.
- Kconfig Build fix for tc358768.
- Call end_fb_access after atomic commit.
The following changes since commit fb18fe0fdf22a2f4512a8b644bb5ea1473829cda:

   drm/panel: nt36523: fix return value check in nt36523_probe() 
(2023-11-29 16:54:23 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-12-07

for you to fetch changes up to e0f04e41e8eedd4e5a1275f2318df7e1841855f2:

   drm/atomic-helpers: Invoke end_fb_access while owning plane state 
(2023-12-06 10:51:27 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.7-rc5:
- Document nouveau's GSP-RM.
- Flush vmm harder on nouveau tu102.
- Panfrost fix for imported dma-buf objects, and device frequency.
- Kconfig Build fix for tc358768.
- Call end_fb_access after atomic commit.

----------------------------------------------------------------
Adrián Larumbe (2):
       drm/panfrost: Consider dma-buf imported objects as resident
       drm/panfrost: Fix incorrect updating of current device frequency

Arnd Bergmann (1):
       drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS

Dave Airlie (1):
       nouveau/tu102: flush all pdbs on vmm flush

Thomas Zimmermann (1):
       drm/atomic-helpers: Invoke end_fb_access while owning plane state

Timur Tabi (1):
       nouveau/gsp: document some aspects of GSP-RM

  drivers/gpu/drm/bridge/Kconfig                     |  1 +
  drivers/gpu/drm/drm_atomic_helper.c                | 78 
+++++++++++++-------
  drivers/gpu/drm/i915/display/intel_display.c       |  2 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            |  2 +-
  .../common/shared/msgq/inc/msgq/msgq_priv.h        | 51 ++++++++++++++
  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 82 
++++++++++++++++++++++
  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |  2 +-
  drivers/gpu/drm/panfrost/panfrost_devfreq.c        | 17 ++++-
  drivers/gpu/drm/panfrost/panfrost_gem.c            |  2 +-
  include/drm/drm_atomic_helper.h                    |  2 +
  10 files changed, 207 insertions(+), 32 deletions(-)
