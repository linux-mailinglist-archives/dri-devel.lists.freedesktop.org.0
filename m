Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B754621E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249B1124AD;
	Fri, 10 Jun 2022 09:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57911124AD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 693A55C01A5;
 Fri, 10 Jun 2022 05:29:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654853367; x=1654939767; bh=HC4xm0hm2I
 hmtWHHJIRwCU5ThPxGw7SxeJVTG+/vnZg=; b=ykCEU2Dub/iQORnFa3AiLM54SJ
 hx2AY/hb3tGc466lQlqKaOlv1sbC+ZBSkTRmqlX+hgujXamYoLDB1TmDyApPOwEy
 cjEmv8SGX2/eLcCykPdZbzBUCZukf4mfB6ydYfGF2vFl17HPm/0Md3tHUw+h3N5C
 GtakW1QTpLKIZysLQnGGoxSgIDA8Rokfn6IFauBCEDLT8VI8NQmv3AbF4z92LbnK
 6hOzD5OnhOYNDHHHyl2CeTiJ2xsINTQtYqNHC1rNfBvKXZkBAhmZCdmiIvpTpNuz
 pUFaNWSnZjH1evhxt23y4Kn+3heJ+TfkGjJmy75WG/TSLfbUFW1bG5XqxMjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853367; x=1654939767; bh=HC4xm0hm2Ihmt
 WHHJIRwCU5ThPxGw7SxeJVTG+/vnZg=; b=N5s8d8lE/p320cISx39Cn4rJq1qii
 u1v24/sjOhjXYwrQwKUZuy7acheZZtZ0ELhROjQzv1Ex4hld6R+tOk5B/i1R15B7
 xDnzfEH9MVs6CcyKH80DSPLQoM9BzVeEGG+S4OKjDIKXHaQRSc6a2V08rUmBkaZM
 WVorESyTFsXJlfV4/gtPQBbW/2cI7dL0fobUvWUvbXrzDexd5kupd3hLyxCrLXZA
 1M46GnqHzeC8f/VqLg7UAf78OGqUjQGxvboKmLIYPPceCb2vuSKWzy73moaQcixB
 uwnIII2F4Fx9dYOKa3wHM6mIPnO5V47oyiB2XgzbJl52OMD/SZUnP7O5Q==
X-ME-Sender: <xms:9g6jYjI6F06ZHX28N7_S3wIond1BSIrPAaJsy3yuOzkgkRnSNnuFZQ>
 <xme:9g6jYnLPOmg2fcUCBwKYlzWxiY1KTAFEQA_ARyJrLXTWPsoi8jRafCIp9R4a6eJLB
 dYNO66E-KM1EYyvtUM>
X-ME-Received: <xmr:9g6jYrsX40c55p5T8E5nmy9JTEIrDSBGRCs8JNPRqUSgJgIYHhSEDZf3x9tdeJOBdN6G6RFVzITN0OpikVzEh630WmsfzdZISDsbkYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
 geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9g6jYsaISvJYrU-snpfXQbJuGA7V8UOBZ-geUkTSmdZDUUE3CPXsmg>
 <xmx:9g6jYqbkaSf3WiArlrYJ50-hXGHO3_flUhqlWzDIdHTbVH6GmiNuYA>
 <xmx:9g6jYgAbcil2dkl-SZRy35TOVxGJn43Eg63JoGn9m5jZ-8EjQaLjvA>
 <xmx:9w6jYhXqqTaGaiGO8DpEHftNHLNKBfwWE-z2OATMmTYHJ6ABqNiPrQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/64] drm/vc4: Fix hotplug for vc4
Date: Fri, 10 Jun 2022 11:28:20 +0200
Message-Id: <20220610092924.754942-1-maxime@cerno.tech>
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

Maxime Ripard (64):
  drm/mipi-dsi: Detach devices when removing the host
  drm/crtc: Introduce drmm_crtc_init_with_planes
  drm/encoder: Introduce drmm_encoder_init
  drm/connector: Reorder headers
  drm/connector: Mention the cleanup after drm_connector_init
  drm/connector: Introduce drmm_connector_init
  drm/connector: Introduce drmm_connector_init_with_ddc
  drm/writeback: Introduce drmm_writeback_connector_init
  drm/simple: Introduce drmm_simple_encoder_init
  drm/bridge: panel: Introduce drmm_panel_bridge_add
  drm/bridge: panel: Introduce drmm_of_get_bridge
  drm/vc4: Call component_unbind_all()
  drm/vc4: hvs: Protect device resources after removal
  drm/vc4: hvs: Remove planes currently allocated before taking down
  drm/vc4: plane: Take possible_crtcs as an argument
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
  drm/vc4: txp: Switch to DRM-managed writeback initialization
  drm/vc4: txp: Protect device resources
  drm/vc4: vec: Remove vc4_dev vec pointer
  drm/vc4: vec: Embed DRM structures into the private structure
  drm/vc4: vec: Switch to drmm_kzalloc
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

 drivers/gpu/drm/bridge/panel.c          |  74 +++
 drivers/gpu/drm/drm_connector.c         | 186 +++++--
 drivers/gpu/drm/drm_crtc.c              |  70 ++-
 drivers/gpu/drm/drm_encoder.c           |  48 +-
 drivers/gpu/drm/drm_mipi_dsi.c          |   1 +
 drivers/gpu/drm/drm_simple_kms_helper.c |  46 +-
 drivers/gpu/drm/drm_writeback.c         | 136 +++--
 drivers/gpu/drm/vc4/vc4_bo.c            |  33 +-
 drivers/gpu/drm/vc4/vc4_crtc.c          |  69 ++-
 drivers/gpu/drm/vc4/vc4_debugfs.c       |  71 ++-
 drivers/gpu/drm/vc4/vc4_dpi.c           | 131 ++---
 drivers/gpu/drm/vc4/vc4_drv.c           |  18 +-
 drivers/gpu/drm/vc4/vc4_drv.h           |  47 +-
 drivers/gpu/drm/vc4/vc4_dsi.c           | 120 +++--
 drivers/gpu/drm/vc4/vc4_gem.c           |  10 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c          | 637 +++++++++++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h          |   3 +-
 drivers/gpu/drm/vc4/vc4_hvs.c           | 145 +++++-
 drivers/gpu/drm/vc4/vc4_irq.c           |   2 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c       |   1 +
 drivers/gpu/drm/vc4/vc4_plane.c         |  36 +-
 drivers/gpu/drm/vc4/vc4_txp.c           |  69 +--
 drivers/gpu/drm/vc4/vc4_v3d.c           |  65 ++-
 drivers/gpu/drm/vc4/vc4_vec.c           | 216 ++++----
 include/drm/drm_bridge.h                |   4 +
 include/drm/drm_connector.h             |   9 +
 include/drm/drm_crtc.h                  |   6 +
 include/drm/drm_encoder.h               |   5 +
 include/drm/drm_simple_kms_helper.h     |   3 +
 include/drm/drm_writeback.h             |   5 +
 30 files changed, 1621 insertions(+), 645 deletions(-)

-- 
2.36.1

