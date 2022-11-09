Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DC5623014
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 17:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649A88C3D;
	Wed,  9 Nov 2022 16:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DF210E099;
 Wed,  9 Nov 2022 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668010990; x=1699546990;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=X981ZmslnejFIUwL7Qp+Ed/27lfz++7smi4Ze9bkD2g=;
 b=GlmhVbauc/OWkYtqxU0C4eB1eQ/GPrZidX7jVqRa8QROWMou05HwR/Bd
 CEPKnh3buVdzOfyqbBi41bYUEyZxaVjwaakZjBgme017Q1TwZq8bKI2qt
 L/cXgDlrAq1aJjX+Wo0MrmIdjc0BDseOUleVIWmWKvuhwuPSl9Mx3Hsic
 g0Zu+17mFALyM6u8/ZU9+ExUDnqFdzZCaJZ7vABIOv/MI9RcnDKVLTu0o
 3zG4dHNGE+NCMJvtQmHsoJcrJU77DDquNnO951TvVIPL+9fjPx6MOJExK
 aubqZ3LuTJ86SkXXQeZaDIeJxHhAz9lkvKGB0hASDINQJSxERNHE5iymn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312822930"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="312822930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:23:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700415754"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="700415754"
Received: from abhatiax-mobl.amr.corp.intel.com (HELO [10.252.58.107])
 ([10.252.58.107])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:23:06 -0800
Message-ID: <e02de501-4b85-28a0-3f6e-751ca13f5f9d@linux.intel.com>
Date: Wed, 9 Nov 2022 17:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-fixes
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


Hey Daniel & Dave,

Another small pull request. Various small assorted fixes.

drm-misc-fixes-2022-11-09:

drm-misc-fixes for v6.1-rc5:
- HDMI fixes to vc4.
- Make panfrost's uapi header compile with C++.
- Add rotation quirks for 2 panels.
- Fix s/r in amdgpu_vram_mgr_new
- Handle 1 gb boundary correctly in panfrost mmu code.
The following changes since commit fc007fb815ab5395c3962c09b79a1630b0fbed9c:

   drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid 
(2022-11-01 14:36:55 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-09

for you to fetch changes up to f352262f727215553879705bacbcb208979f3eff:

   drm/panfrost: Split io-pgtable requests properly (2022-11-09 14:17:39 
+0000)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc5:
- HDMI fixes to vc4.
- Make panfrost's uapi header compile with C++.
- Add rotation quirks for 2 panels.
- Fix s/r in amdgpu_vram_mgr_new
- Handle 1 gb boundary correctly in panfrost mmu code.

----------------------------------------------------------------
Hans de Goede (2):
       drm: panel-orientation-quirks: Add quirk for Nanote UMPC-01
       drm: panel-orientation-quirks: Add quirk for Acer Switch V 10 
(SW5-017)

Ma Jun (1):
       drm/amdgpu: Fix the lpfn checking condition in drm buddy

Robin Murphy (1):
       drm/panfrost: Split io-pgtable requests properly

Steven Price (1):
       drm/panfrost: Remove type name from internal struct again

Yuan Can (1):
       drm/vc4: Fix missing platform_unregister_drivers() call in 
vc4_drm_register()

maxime@cerno.tech (3):
       drm/vc4: hdmi: Take our lock to reset the link
       drm/vc4: hdmi: Fix outdated function name in comment
       drm/vc4: hdmi: Fix HSM clock too low on Pi4

  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c   |  2 +-
  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 +++++++
  drivers/gpu/drm/panfrost/panfrost_mmu.c        | 11 +++++-
  drivers/gpu/drm/vc4/vc4_drv.c                  |  7 +++-
  drivers/gpu/drm/vc4/vc4_hdmi.c                 | 47 
++++++++++++++++++++------
  drivers/gpu/drm/vc4/vc4_hdmi.h                 |  1 +
  include/uapi/drm/panfrost_drm.h                |  2 +-
  7 files changed, 67 insertions(+), 15 deletions(-)

