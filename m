Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4E56B60F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE8010F790;
	Fri,  8 Jul 2022 09:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7934B11379B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 42A6E32009BC;
 Fri,  8 Jul 2022 05:57:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657274228; x=1657360628; bh=HiYcO08KyB
 GX12gdkD/AOuuAZBT7Kr6En94jJfDmrjY=; b=Nzp4j+w0YDuBjUp29v8l4W0ltV
 JXhRzl2O7agwnl/OBBAMDEv4mzJeNG68p/aPSbbvuVV6WRxi8//IABCsy+ZtZQ0g
 HKxmK3fqUd1T8JfBKtYkOGUMQJIjNYLb09/V8qkh9s/yJx3++x1QRgMxGS/XpbvY
 ebL5s+Rm86LMZhnFq4To8+gNAQFD/l/wNS7cKoXbBWqTb3i+VP8iqiyBcV/YuK/X
 VQDH16cMPCK02fXggcWKobAPukXeHA6042D6rH9lZCikY0G9uZyxdMaeJM6DMBkY
 12hK0UwOFgFXAzh/OV7ws/o+zmWEphVDQNjOqKLazV9hV4TeL/wLH8Oob1MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274228; x=1657360628; bh=HiYcO08KyBGX1
 2gdkD/AOuuAZBT7Kr6En94jJfDmrjY=; b=Y9LSm54tJa5ONxOPmV2FrolfKpQk1
 Hocs73zx4KDmlwnTgrQFt7g3z2IHT5hv6YomDGBbiFvKxHYAh7L4LEsvPJjrTwAu
 UTAxxfGFotLXRZom4COmzK9DUA0siPfXOTuwePPBC4BCCWbYOAr6kmprjMqbaBrI
 2T80MxZ7vmFf73osLaBtsixXwJknKspb3ViLgDD93IBTYG13CI3GvAc5ndmmNdUF
 YJT7+ijklNttV2NphUNkKoS3jht6ExPy3jdxi44VumB1JhtZ5s5GwnNDXlxv7HNH
 3wKtxftyfFoUTpq4i6w6n7e5sYg1mPLPGIO+q466pnIOCmhTEmpKDinrQ==
X-ME-Sender: <xms:dP_HYmbGud2rCsOiCe_cL2m7eaqebWq5icKx9oTcv6NVVkQo7HChtg>
 <xme:dP_HYpY5V_J4Pr2xaHHqx0FEhMuWjk-dg1TOvRfMNcpp0cAgbOHnttAjk4pM0n-Hl
 H-zTpghCiZQ0wBYVBc>
X-ME-Received: <xmr:dP_HYg-hiK4MuopiW_4EoqYfP5AQs7RhpXRXggPrHcANk4S_kZbm3LaP39tLlhMXG9WxSNpCpk0xDzuwn4E70iKvyhtPnAtinBOR8Ik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
 geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dP_HYop5l9EaXV8ejSmMSkSUXIk_11kgFihUq7UDs4QXnKKkg59vEg>
 <xmx:dP_HYhqALEg9SpfGF_RJ2uZ3B0YAe5rMFien4OqmqcjlGaQLX127tw>
 <xmx:dP_HYmSD6NpeMblV9W83SNUP4Ih0Mv0u9z7i5YIQPdEB11yK5FmCWA>
 <xmx:dP_HYilzTcYTjyy1ZqblxSeIP5lZpRQTE2AWDzJiJB0VoKDY9hZlFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 00/69] drm/vc4: Fix hotplug for vc4
Date: Fri,  8 Jul 2022 11:55:58 +0200
Message-Id: <20220708095707.257937-1-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_crtc.c        |  93 ++++-
 drivers/gpu/drm/drm_encoder.c     |  74 +++-
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
 26 files changed, 1507 insertions(+), 634 deletions(-)

-- 
2.36.1

