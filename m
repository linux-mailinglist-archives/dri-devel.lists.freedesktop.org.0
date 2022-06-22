Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBF554D14
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C981610F199;
	Wed, 22 Jun 2022 14:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EAC10EFD0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 356F73200094;
 Wed, 22 Jun 2022 10:32:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655908333; x=1655994733; bh=aSrFxp0cHx
 Q5KZLDx3rVc6+WIRPQGd5CqvFDoUDMS7Q=; b=dU5iuQm8ERRpMPF9FupLDPV77x
 rU2KvhSIjwuNpZCgbCaAo9ueZpnYJ8XzMawCJw5vNno9LA7+PgSmp4T/wN/PF5Fp
 RF6rZiT1ppF2TXp7XIpEshOR33MGQRa1tV2Vv5+L05NuXyROONsxA372X8RXJK5Q
 EpPKMmgZJ8wzZGIINo7j9/HSebGgJX4qL8tCtH2LLtVbVp8khzpsR1pqH6yrQeg0
 iGM35xpgJdaDEANLTCW22zrXU+APqPc0h+Jdn23q2EAI9Oma/8Qn6qm0kYCKn+OV
 G993o4ks+PqV8ziXNUhA9A+fB4I8666tGZbje2375OJ7a1LaFWoJmcnRAjzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908333; x=1655994733; bh=aSrFxp0cHxQ5K
 ZLDx3rVc6+WIRPQGd5CqvFDoUDMS7Q=; b=td92D+V0Oo7vSW4zPXUOyjgIIHZI2
 dxvsXLFz3ZVrBxCxSNdbGvno3exa1CY84ir+A4/Qij0i+SkY21BqOratmfwcMXhJ
 LowYd1Mm581JYDHyx7Dm/+OngQNI3AcXhqJwiwXcZ7N4HoF/kJSJX94XbbZtjwwh
 3RL+oCi8aKrd8htWAVpKPNbW12itOA+wqnMEhk8UcFscnLOxuc6EgZSNdOBYTFWF
 8Z8G79A/3coc6MBdaG7pBfMSE0RXoLFC22r20DJkY3ucXgnSsnP45Z982Rqt7WMJ
 1CR/nNCI51KJJ2BFm8hWhqS0vyscHQjJGuT/+xCeRBrsmxJXi8k9tGcWg==
X-ME-Sender: <xms:7SezYuKhhcqruNx0rz0rI7MLbozgf_-jeYJMJ_gNgXMdZ1LO-KqFhA>
 <xme:7SezYmIVpcqbbfbaZfqiePzfMp0LgFS6L0aAP5oVVUu_gvCAGws_Mi-goMKFfg5Xp
 dZEmvp1n8H63l3qStc>
X-ME-Received: <xmr:7SezYut-OEPHiwZZKAJ3oZnI9VFEcS7Xp2RADzKnzGyICp2cOTsvZjp0KcmHRnlMT48TDhS7T9mNTIwEp4Zz5EPlG9Zg4fZDjcxZT4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
 geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7SezYjaYnHBl7LZlMEbLK0LX8dLrHA96Nb4bsJm38c4M2r8gVPTyAw>
 <xmx:7SezYlYXeQUCgqS9_UbQZ4yBl6p7UJePbwdjZncpSVMeLmZ_LDz9CA>
 <xmx:7SezYvDPtLeqpFgUfosloU5i-BZHRmLrzqX0-kOxszGZ9jcOBiT9gg>
 <xmx:7SezYkWqWcg3JzkAJcAHLo88_-O1nsTeohjL7ou-1UCY0sMrxyRzvw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 00/68] drm/vc4: Fix hotplug for vc4
Date: Wed, 22 Jun 2022 16:31:01 +0200
Message-Id: <20220622143209.600298-1-maxime@cerno.tech>
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

Changes from v1:
  - Rebased on top on next-20220622
  - Consolidated the new drmm init helpers with their alloc counterparts
  - Dropped the drmm writeback and simple encoder helpers
  - Clarified the documentation of drm_connector_unregister
  - Removed the drm_connector_unregister usage
  - Fixed a vblank timeout when unbinding
  - Renamed the kref functions in vc4_dsi
  - Collected the tags

Maxime Ripard (68):
  drm/mipi-dsi: Detach devices when removing the host
  drm/crtc: Introduce drmm_crtc_init_with_planes
  drm/encoder: Introduce drmm_encoder_init
  drm/connector: Reorder headers
  drm/connector: Mention the cleanup after drm_connector_init
  drm/connector: Clarify when drm_connector_unregister is needed
  drm/connector: Introduce drmm_connector_init
  drm/connector: Introduce drmm_connector_init_with_ddc
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
 drivers/gpu/drm/drm_connector.c   | 196 +++++++--
 drivers/gpu/drm/drm_crtc.c        |  75 +++-
 drivers/gpu/drm/drm_encoder.c     |  57 ++-
 drivers/gpu/drm/drm_mipi_dsi.c    |   1 +
 drivers/gpu/drm/vc4/vc4_bo.c      |  33 +-
 drivers/gpu/drm/vc4/vc4_crtc.c    |  90 ++--
 drivers/gpu/drm/vc4/vc4_debugfs.c |  71 ++--
 drivers/gpu/drm/vc4/vc4_dpi.c     | 131 +++---
 drivers/gpu/drm/vc4/vc4_drv.c     |  21 +-
 drivers/gpu/drm/vc4/vc4_drv.h     |  47 ++-
 drivers/gpu/drm/vc4/vc4_dsi.c     | 133 ++++--
 drivers/gpu/drm/vc4/vc4_gem.c     |  10 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c    | 659 ++++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h    |   3 +-
 drivers/gpu/drm/vc4/vc4_hvs.c     | 138 ++++++-
 drivers/gpu/drm/vc4/vc4_irq.c     |   2 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c |   1 +
 drivers/gpu/drm/vc4/vc4_plane.c   |  36 +-
 drivers/gpu/drm/vc4/vc4_txp.c     |  55 ++-
 drivers/gpu/drm/vc4/vc4_v3d.c     |  65 ++-
 drivers/gpu/drm/vc4/vc4_vec.c     | 216 +++++-----
 include/drm/drm_bridge.h          |   4 +
 include/drm/drm_connector.h       |   9 +
 include/drm/drm_crtc.h            |   6 +
 include/drm/drm_encoder.h         |   5 +
 26 files changed, 1514 insertions(+), 624 deletions(-)

-- 
2.36.1

