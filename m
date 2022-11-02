Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01903617024
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 22:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685DC10E692;
	Wed,  2 Nov 2022 21:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5CC10E688;
 Wed,  2 Nov 2022 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667426384; x=1698962384;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=hsX/6/ttblyeUTQic+9dCjW/NoBivLG1S79shlLyLc8=;
 b=cxikGdPeUP3A/PaesvKy7JidSA/H9OEFI7Cnw+DZYl4r5Tz0A1g8x6+i
 TbRxxVD8+jXNpbVWj92D83oMsmFByhtpGC5IkfJKGAOjpwXCnF6xx41i8
 uGgJqQASSy3Bayjl1PR7Tlr/0sC0a3n6eHZOQh5w0IhPFEWv5dWM6Mafu
 VbUfBRnC7BfUZSPeISBne00rkToeFd5CDMqkUQudsSxROcTFL/H70uSON
 THX2LBFlsvkbtqnqiw7V7PJc5tyOD5cusEnA+vfRvEwUejUMaxlen2WR7
 5va6rAVmGWMba1itD4VQJXhEjLKfWzAsDGD6NAu8MyZmy3aIa/QFJikZh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="308246883"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
 d="scan'208,217";a="308246883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 14:59:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="612406340"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
 d="scan'208,217";a="612406340"
Received: from stamengx-mobl1.ger.corp.intel.com (HELO [10.251.216.17])
 ([10.251.216.17])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 14:59:40 -0700
Content-Type: multipart/alternative;
 boundary="------------Agw07O1NTL10IaXm8mVlVTc9"
Message-ID: <5476ef52-f91a-c2bc-f4b2-d338216d1e11@linux.intel.com>
Date: Wed, 2 Nov 2022 22:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-fixes
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Agw07O1NTL10IaXm8mVlVTc9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I had a massive disk crash, and my pull request is unsigned this one time.
However, it is signed with the promise the next tag will be signed again!
-----
drm-misc-fixes-2022-11-02-1:
drm-misc-fixes for v6.1-rc4:
- Small fixes to make rockchip work better.
- Fix imx Kconfig.
- Small fix to imx' mode_valid.
The following changes since commit e0ba1a39b8dfe4f005bebdd85daa89e7382e26b7:

   fbdev/core: Avoid uninitialized read in aperture_remove_conflicting_pci_device() (2022-10-27 09:20:05 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-02-1

for you to fetch changes up to fc007fb815ab5395c3962c09b79a1630b0fbed9c:

   drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid (2022-11-01 14:36:55 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc4:
- Small fixes to make rockchip work better.
- Fix imx Kconfig.
- Small fix to imx' mode_valid.

----------------------------------------------------------------
Aurelien Jarno (1):
       drm/rockchip: dw_hdmi: filter regulator -EPROBE_DEFER error messages

Brian Norris (2):
       drm/rockchip: dsi: Clean up 'usage_mode' when failing to attach
       drm/rockchip: dsi: Force synchronous probe

Hector Martin (1):
       drm/format-helper: Only advertise supported formats for conversion

John Keeping (1):
       drm/rockchip: fix fbdev on non-IOMMU devices

Liu Ying (1):
       drm/imx: Kconfig: Remove duplicated 'select DRM_KMS_HELPER' line

Michael Tretter (2):
       drm/rockchip: vop2: fix null pointer in plane_atomic_disable
       drm/rockchip: vop2: disable planes when disabling the crtc

Nathan Huckleberry (1):
       drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid

Ondrej Jirman (1):
       drm/rockchip: dsi: Fix VOP selection on SoCs that support it

  drivers/gpu/drm/drm_format_helper.c             | 66 ++++++++++++++++++-------
  drivers/gpu/drm/imx/Kconfig                     |  1 -
  drivers/gpu/drm/imx/imx-tve.c                   |  5 +-
  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 26 +++++++---
  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c     |  3 +-
  drivers/gpu/drm/rockchip/rockchip_drm_gem.c     |  5 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c    | 10 +++-
  7 files changed, 83 insertions(+), 33 deletions(-)

--------------Agw07O1NTL10IaXm8mVlVTc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>I had a massive disk crash, and my pull request is unsigned this one time.
However, it is signed with the promise the next tag will be signed again!
-----
drm-misc-fixes-2022-11-02-1:
drm-misc-fixes for v6.1-rc4:
- Small fixes to make rockchip work better.
- Fix imx Kconfig.
- Small fix to imx' mode_valid.
The following changes since commit e0ba1a39b8dfe4f005bebdd85daa89e7382e26b7:

  fbdev/core: Avoid uninitialized read in aperture_remove_conflicting_pci_device() (2022-10-27 09:20:05 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-02-1

for you to fetch changes up to fc007fb815ab5395c3962c09b79a1630b0fbed9c:

  drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid (2022-11-01 14:36:55 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc4:
- Small fixes to make rockchip work better.
- Fix imx Kconfig.
- Small fix to imx' mode_valid.

----------------------------------------------------------------
Aurelien Jarno (1):
      drm/rockchip: dw_hdmi: filter regulator -EPROBE_DEFER error messages

Brian Norris (2):
      drm/rockchip: dsi: Clean up 'usage_mode' when failing to attach
      drm/rockchip: dsi: Force synchronous probe

Hector Martin (1):
      drm/format-helper: Only advertise supported formats for conversion

John Keeping (1):
      drm/rockchip: fix fbdev on non-IOMMU devices

Liu Ying (1):
      drm/imx: Kconfig: Remove duplicated 'select DRM_KMS_HELPER' line

Michael Tretter (2):
      drm/rockchip: vop2: fix null pointer in plane_atomic_disable
      drm/rockchip: vop2: disable planes when disabling the crtc

Nathan Huckleberry (1):
      drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid

Ondrej Jirman (1):
      drm/rockchip: dsi: Fix VOP selection on SoCs that support it

 drivers/gpu/drm/drm_format_helper.c             | 66 ++++++++++++++++++-------
 drivers/gpu/drm/imx/Kconfig                     |  1 -
 drivers/gpu/drm/imx/imx-tve.c                   |  5 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 26 +++++++---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c     |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c     |  5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c    | 10 +++-
 7 files changed, 83 insertions(+), 33 deletions(-)

</pre>
  </body>
</html>

--------------Agw07O1NTL10IaXm8mVlVTc9--
