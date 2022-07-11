Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945D570901
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA6D8FE85;
	Mon, 11 Jul 2022 17:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A708F6B4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F1E8F5C0165;
 Mon, 11 Jul 2022 13:39:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657561182; x=1657647582; bh=QzGmAuidUS
 fyx+BTkX0r99ArIHEve2WMtBKOhdBX+hg=; b=xB2Wu70S4iB6CaHEEgIaob/LPC
 Ue+D89veFPBUpcOLDWA0FPEHFMCGNzadC83lYGmt0YVTGKPJKejZaJ2FQahe1e7C
 HT2Ay1J4HIh4l/hOw0HsToVIcq3yS8jTjjjNUT1RKKgDKmSZJSc6O5ZYzUTUctBg
 H7uHMGg0wR8jpwNOXQQaOU6djtpQUdfL4xUBEPy+e5HGSSWP5Ofbctjp+0jxwACh
 CzRANzT9SeysSXaLjnONQbyHMdgPlQ99E8HYvR84CISNbkpnYA840cZCCY/fL+Gr
 Vp/9P4ISYB8UI0hFQaCN25tzKBhyNtNTF+iF2Zozx975tO81hydaRB133oFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561182; x=1657647582; bh=QzGmAuidUSfyx
 +BTkX0r99ArIHEve2WMtBKOhdBX+hg=; b=bnEhsgz+nmpEN743kKBp/18KKlZcD
 IutrjMWrI3UuunfqLNfPhvFBbUpLcebvTtBC5SHz2cnioYp5RLC2jaOIHkmtlUGU
 JDsLosdaRc3WzaG22p30kWKIHdt0/NW8iI+QRYOFlmCuyadNjURv+D3s6XkoPokl
 iVekzpRcjFZHCcj3Ln9lgEyqjhagEWUvN1oiLF3VDaDkDNP5tm3VUI9vihSLfmPM
 TCKTqVdi7s7EbMmYrqbWygxXbdEuXS/02w2/CcTEwtizWM2BDb+tzXM14K7f8eon
 QNs6pv/6oYfohPytkZ2rjx6byhdq2DBZeYNf0QLUxa6tU/SLwFINghtGA==
X-ME-Sender: <xms:XWDMYmcJxVSZk24_93ELcxYhp-y-FkbQo4PeH_togio5GSPI77AMZw>
 <xme:XWDMYgOnQWOPSsXhUC_QxM83QD9eiv7mHFR5ZSysNheuLt3zZ4l1fEzrVzK-uayMR
 4AqIZxCdmEURbaZx58>
X-ME-Received: <xmr:XWDMYngmJcdbptzkeQy3rHDYxNx5kQc3gFAEaeWPPC0QuZ23ie0rkevY7OIXq87JyZ_nqZ3QqHURs5bHRyvndYyMX8Qvx-NOsm0K7Pk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelvddtgeekgedtjedvjedvjeelieefgeefveeugedvvdelveeigefhhfdt
 teegffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XWDMYj-d5PbOcZAsCDF3wwMebRize9vBFUk3lOcVoDb7Ze41X8o0Yg>
 <xmx:XWDMYitS9VjrB0ZPlJp67eUnpAadgXMRsmhDX2nsUAG-tas1M-KRJA>
 <xmx:XWDMYqE60dLacKuSBTPziWpdGtkO4kDM5VkB4G_zRr2F7b_82KZ8jQ>
 <xmx:XmDMYkJMoM9VlJlkpYa9dpT5Vyx_3PFUSf9q3t8U5Pcpf-9NLCYhbQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 00/69] drm/vc4: Fix hotplug for vc4
Date: Mon, 11 Jul 2022 19:38:30 +0200
Message-Id: <20220711173939.1132294-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here is a series that address multiple issues when trying to unbind/rebind
vc4-related devices to their drivers.

Most of these issues involve either use-after-free, improper resource
liberation or similar.

It has been tested on the Pi3 and Pi4, with X and glxgears running and KASAN
enabled to properly validate our memory accesses.

Pi3 isn't functional after a rebind though, with vblank timeouts occuring. I'm
not quite sure why at this point, but at least the kernel doesn't completely
crash now.

Let me know what you think,
Maxime

---
Changes from v4:
  - Rebased on next-20220711
  - Fixed a few W=1 warnings reported by the kernel test bot

Changes from v3:
  - Rebased on top of next-20220708
  - Switched WARN_ON to drm_WARN_ON
  - Added Thomas tags

Changes from v2:
  - Rebased on top of next-20220629
  - Fix va arguments on the crtc and encoder init
  - Removed drmm_connector_init_with_ddc and consolidated drm_connector_init*
  - Reworked the doc for drmm_of_get_bridge

Changes from v1:
  - Rebased on top on next-20220622
  - Consolidated the new drmm init helpers with their alloc counterparts
  - Dropped the drmm writeback and simple encoder helpers
  - Clarified the documentation of drm_connector_unregister
  - Removed the drm_connector_unregister usage
  - Fixed a vblank timeout when unbinding
  - Renamed the kref functions in vc4_dsi
  - Collected the tags

Maxime Ripard (69):
  drm/mipi-dsi: Detach devices when removing the host
  drm/crtc: Introduce drmm_crtc_init_with_planes
  drm/encoder: Introduce drmm_encoder_init
  drm/connector: Reorder headers
  drm/connector: Mention the cleanup after drm_connector_init
  drm/connector: Clarify when drm_connector_unregister is needed
  drm/connector: Consolidate Connector Initialization
  drm/connector: Check for destroy implementation
  drm/connector: Introduce drmm_connector_init
  drm/bridge: panel: Introduce drmm_panel_bridge_add
  drm/bridge: panel: Introduce drmm_of_get_bridge
  drm/vc4: drv: Call component_unbind_all()
  drm/vc4: drv: Use drm_dev_unplug
  drm/vc4: crtc: Create vblank reporting function
  drm/vc4: hvs: Protect device resources after removal
  drm/vc4: hvs: Remove planes currently allocated before taking down
  drm/vc4: plane: Take possible_crtcs as an argument
  drm/vc4: crtc: Remove manual plane removal on error
  drm/vc4: plane: Switch to drmm_universal_plane_alloc()
  drm/vc4: crtc: Move debugfs_name to crtc_data
  drm/vc4: crtc: Switch to drmm_kzalloc
  drm/vc4: crtc: Switch to DRM-managed CRTC initialization
  drm/vc4: dpi: Remove vc4_dev dpi pointer
  drm/vc4: dpi: Embed DRM structures into the private structure
  drm/vc4: dpi: Switch to drmm_kzalloc
  drm/vc4: dpi: Return an error if we can't enable our clock
  drm/vc4: dpi: Remove unnecessary drm_of_panel_bridge_remove call
  drm/vc4: dpi: Add action to disable the clock
  drm/vc4: dpi: Switch to DRM-managed encoder initialization
  drm/vc4: dpi: Switch to drmm_of_get_bridge
  drm/vc4: dpi: Protect device resources
  drm/vc4: dsi: Embed DRM structures into the private structure
  drm/vc4: dsi: Switch to DRM-managed encoder initialization
  drm/vc4: dsi: Switch to drmm_of_get_bridge
  drm/vc4: dsi: Fix the driver structure lifetime
  drm/vc4: dsi: Switch to devm_pm_runtime_enable
  drm/vc4: hdmi: Switch to drmm_kzalloc
  drm/vc4: hdmi: Remove call to drm_connector_unregister()
  drm/vc4: hdmi: Switch to DRM-managed encoder initialization
  drm/vc4: hdmi: Switch to DRM-managed connector initialization
  drm/vc4: hdmi: Switch to device-managed ALSA initialization
  drm/vc4: hdmi: Switch to device-managed CEC initialization
  drm/vc4: hdmi: Use a device-managed action for DDC
  drm/vc4: hdmi: Switch to DRM-managed kfree to build regsets
  drm/vc4: hdmi: Use devm to register hotplug interrupts
  drm/vc4: hdmi: Move audio structure offset checks
  drm/vc4: hdmi: Protect device resources after removal
  drm/vc4: hdmi: Switch to devm_pm_runtime_enable
  drm/vc4: txp: Remove vc4_dev txp pointer
  drm/vc4: txp: Remove duplicate regset
  drm/vc4: txp: Switch to drmm_kzalloc
  drm/vc4: txp: Remove call to drm_connector_unregister()
  drm/vc4: txp: Protect device resources
  drm/vc4: vec: Remove vc4_dev vec pointer
  drm/vc4: vec: Embed DRM structures into the private structure
  drm/vc4: vec: Switch to drmm_kzalloc
  drm/vc4: vec: Remove call to drm_connector_unregister()
  drm/vc4: vec: Switch to DRM-managed encoder initialization
  drm/vc4: vec: Switch to DRM-managed connector initialization
  drm/vc4: vec: Protect device resources after removal
  drm/vc4: vec: Switch to devm_pm_runtime_enable
  drm/vc4: debugfs: Protect device resources
  drm/vc4: debugfs: Return an error on failure
  drm/vc4: debugfs: Simplify debugfs registration
  drm/vc4: Switch to drmm_mutex_init
  drm/vc4: perfmon: Add missing mutex_destroy
  drm/vc4: v3d: Stop disabling interrupts
  drm/vc4: v3d: Rework the runtime_pm setup
  drm/vc4: v3d: Switch to devm_pm_runtime_enable

 drivers/gpu/drm/bridge/panel.c    |  74 ++++
 drivers/gpu/drm/drm_connector.c   | 143 +++++--
 drivers/gpu/drm/drm_crtc.c        |  94 ++++-
 drivers/gpu/drm/drm_encoder.c     |  75 +++-
 drivers/gpu/drm/drm_mipi_dsi.c    |   1 +
 drivers/gpu/drm/vc4/vc4_bo.c      |  33 +-
 drivers/gpu/drm/vc4/vc4_crtc.c    |  90 ++--
 drivers/gpu/drm/vc4/vc4_debugfs.c |  72 ++--
 drivers/gpu/drm/vc4/vc4_dpi.c     | 131 +++---
 drivers/gpu/drm/vc4/vc4_drv.c     |  21 +-
 drivers/gpu/drm/vc4/vc4_drv.h     |  47 ++-
 drivers/gpu/drm/vc4/vc4_dsi.c     | 133 ++++--
 drivers/gpu/drm/vc4/vc4_gem.c     |  10 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c    | 672 ++++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h    |   3 +-
 drivers/gpu/drm/vc4/vc4_hvs.c     | 145 ++++++-
 drivers/gpu/drm/vc4/vc4_irq.c     |   2 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c |   1 +
 drivers/gpu/drm/vc4/vc4_plane.c   |  36 +-
 drivers/gpu/drm/vc4/vc4_txp.c     |  55 ++-
 drivers/gpu/drm/vc4/vc4_v3d.c     |  65 ++-
 drivers/gpu/drm/vc4/vc4_vec.c     | 216 +++++-----
 include/drm/drm_bridge.h          |   4 +
 include/drm/drm_connector.h       |   5 +
 include/drm/drm_crtc.h            |   9 +
 include/drm/drm_encoder.h         |   6 +
 26 files changed, 1509 insertions(+), 634 deletions(-)

-- 
2.36.1

