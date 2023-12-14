Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D792812BC6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 10:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F327C10E915;
	Thu, 14 Dec 2023 09:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F223010E8FF;
 Thu, 14 Dec 2023 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702546475; x=1734082475;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=iZcVnSvOkEN5esgfgybW0yp3SnxqiD1leovH1e+9ZKo=;
 b=FsXc639cpXoRPZct2a+kCxMaGSRwGywj/8pPvwWuvA/3CuEvW8CpKn9J
 sfQoLIocN0yB5k5mRg1zlbPtoVaoJzeJYHsIoWpzn7aZv0w6p0mKpAP57
 vu7y13w3QDrhL3KCWULiassGZLjS6h0k9VRgTRjYD8W1hYbn188Pl2Bfl
 BB4HZ9XsRIQbQMQ2Iu0HzRHraZnQNSWt+4n2zoxw4bRb4tx39le9XkBMX
 c4TNIh4CLBtsEFqlMor0vAA99vmYkWypvzkNeH0YRXct0siV/mxW24XvN
 hunBi1unlSaO4AxOCEr8A+yKHR+XkPwAUj1JbsFmhTghH0sDfsnFH4I/d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2175072"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2175072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 01:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17712112"
Received: from avaza-mobl.ger.corp.intel.com (HELO [10.251.209.21])
 ([10.251.209.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 01:34:30 -0800
Message-ID: <2d46b68f-c5a4-45e5-beb4-411569f4aac8@linux.intel.com>
Date: Thu, 14 Dec 2023 10:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Small fixes all over the place, one regression fix for master capability.

Cheers,
~Maarten

drm-misc-fixes-2023-12-14:
drm-misc-fixes for v6.7-rc6:
- Fix regression for checking if FD is master capable.
- Fix uninitialized variables in drm/crtc.
- Fix ivpu w/a.
- Refresh modes correctly when updating EDID.
- Small panel fixes.
The following changes since commit e0f04e41e8eedd4e5a1275f2318df7e1841855f2:

   drm/atomic-helpers: Invoke end_fb_access while owning plane state 
(2023-12-06 10:51:27 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-12-14

for you to fetch changes up to 6c9dbee84cd005bed5f9d07b3a2797ae6414b435:

   drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w (2023-12-13 
18:33:43 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.7-rc6:
- Fix regression for checking if FD is master capable.
- Fix uninitialized variables in drm/crtc.
- Fix ivpu w/a.
- Refresh modes correctly when updating EDID.
- Small panel fixes.

----------------------------------------------------------------
Andrzej Kacprowski (1):
       accel/ivpu/37xx: Fix interrupt_clear_with_0 WA initialization

David Heidelberg (1):
       dt-bindings: panel-simple-dsi: move LG 5" HD TFT LCD panel into 
DSI yaml

Farouk Bouabid (1):
       drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w

Jani Nikula (2):
       drm/crtc: fix uninitialized variable use
       drm/edid: also call add modes in EDID connector update fallback

Lingkai Dong (1):
       drm: Fix FD ownership check in drm_master_check_perm()

Ziqi Zhao (1):
       drm/crtc: Fix uninit-value bug in drm_mode_setcrtc

  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml  |  2 ++
  .../devicetree/bindings/display/panel/panel-simple.yaml      |  2 --
  drivers/accel/ivpu/ivpu_hw_37xx.c                            | 12 
+++++++++---
  drivers/gpu/drm/drm_auth.c                                   |  2 +-
  drivers/gpu/drm/drm_crtc.c                                   |  8 ++++----
  drivers/gpu/drm/drm_edid.c                                   |  3 ++-
  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c           |  2 +-
  7 files changed, 19 insertions(+), 12 deletions(-)
