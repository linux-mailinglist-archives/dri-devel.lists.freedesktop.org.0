Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201F219935
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A806E9F5;
	Thu,  9 Jul 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6D6E907
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 801B0102C;
 Wed,  8 Jul 2020 13:42:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=aco/xjpXcfoPImRdxU9Pd23iJz
 lhhHe3iGOSi8JwdVY=; b=T+ZdJ8RQ0B+V0qc1rD9XuGDk6HRJap8rKh1lya8jVt
 4rX+zHNzI9R/VpY27ZdA/WQMao3qai27IN6EuwsKXSS/ZyysTrGzUupcgKL7fGZY
 VvKlj4J8H55rGE/MEHkJwSd9jdrlI+cBxtmTadmOpw6Tm4T0PrcNb9VgB8SRmdgQ
 SxYsl+Lbo5v2pM2Fid0I7QZX+T8+/BYtuE6F2xdRiWRXnFnCjzg/oNWQSiZmgiJ9
 Ptn6ujLbbKSsuYJWu0Yql7cF8Ie0aMbBZG95lk78TLCkBT9Xwtz5fP9T6sJdpG34
 daDHGLBRBd2UJAwTcg043H4dYTy8WlvGtYH/IEa/IIxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aco/xjpXcfoPImRdx
 U9Pd23iJzlhhHe3iGOSi8JwdVY=; b=JzhSB6Gp48JU/uPkHlSk0gj+jn3unKVUF
 NxxadWMiSbxVqJUzia3X9BfhnmMuyDzsEm9Foq+ba/tFKM0hf5BOsRX99ZyVcc3o
 eNDQjYPd1UwGjcWML1jDr41maWWgUutSFPR1SxbX5u9TRUbIZPxliuRlvYCpp+v9
 TGe0bg/2RDbbLL03GCkJEc7vyOc7+7H9SJUbrha7kHVSWkVsdfBeVOL5symOpC7i
 wQbdQKdGdVwi5gCTR2AjE9jmp7uC3FrBTL0uhaw7Bs95iK1T/v+I2atTfEzPUuB9
 MhCSey0I6Bim/Dl8Deb4xNRNzA+YWwGWTJxEHMG4478JYO8LMIp8Q==
X-ME-Sender: <xms:hwUGX3Tf6dHyiUm0NzFHx2v95wUCvu8wjSf0gs1NY_Jf0UvHDs1kbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteevhfdtjeeludffieffgeefgeeugefhgfegkeeuteeigfejfeejkedujeehlefg
 necuffhomhgrihhnpehrrghsphgsvghrrhihphhirdgtohhmnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hwUGX4x4PF5JFpZusCarV86Em7XelB_AeS34C27DjKJlHtu27q7sJA>
 <xmx:hwUGX81zffS8t7AvML3lFRL0SNMljpEtWb1_BGfd2lh_mny3BZGe0g>
 <xmx:hwUGX3DoU5vP9dlhTKElN0JxDw-JDOy5S3J4QSmEDrnTNjW4NNmW5w>
 <xmx:iQUGXw6TArjj2AxCajkpRaH4ncYv-Q3Va7f0lGLUqK6TZdZXZYGu5Gc0Pic>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 311CB328005E;
 Wed,  8 Jul 2020 13:42:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 00/78] drm/vc4: Support BCM2711 Display Pipeline
Date: Wed,  8 Jul 2020 19:41:08 +0200
Message-Id: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

Here's a (pretty long) series to introduce support in the VC4 DRM driver
for the display pipeline found in the BCM2711 (and thus the RaspberryPi 4).

The main differences are that there's two HDMI controllers and that there's
more pixelvalve now. Those pixelvalve come with a mux in the HVS that still
have only 3 FIFOs. Both of those differences are breaking a bunch of
expectations in the driver, so we first need a good bunch of cleanup and
reworks to introduce support for the new controllers.

Similarly, the HDMI controller has all its registers shuffled and split in
multiple controllers now, so we need a bunch of changes to support this as
well.

Only the HDMI support is enabled for now (even though the DPI and DSI
outputs have been tested too).

Let me know if you have any comments
Maxime

Cc: bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>

Changes from v3:
  - Rebased on top of next-20200708
  - Added a name to the HDMI audio codec component
  - Only disable the BCM2711 HDMI pixelvalves at boot
  - Fixed an error in the HVS binding
  - Fix a framebuffer size condition that was inverted
  - Changed the channel allocation algorithm using Eric's suggestion
  - Always write the muxing values instead of updating if needed
  - Improved a bit the hvs_available_channels comment in the structure
  - Change atomic_complete_commit code to use for_each_new_crtc_in_state
  - Change the muxing code to take into account disparities between the
    BCM2711 and previous SoCs.
  - Only change the clock rate on BCM2711 during a modeset
  - Fix a crash at atomic_disable
  - Use clk_set_min_rate for the core clock too
  - Add a few defines, and simplify the FIFO level stuff
  - Reordered the patches according to Eric's reviews
  - Fixed a regression with VID_CTL setting on RPI3

Changes from v2:
  - Rebased on top of next-20200526
  - Split the firmware clock series away
  - Removed the stuck pixel (with all the subsequent pixels being shifted
    by one
  - Fixed the writeback issue too.
  - Fix the dual output
  - Fixed the return value of phy_get_cp_current
  - Enhanced the comment on the reset delay
  - Increase the max width and height
  - Made a proper Kconfig option for the DVP clock driver
  - Fixed the alsa card name collision

Changes from v1:
  - Rebased on top of 5.7-rc1
  - Run checkpatch
  - Added audio support
  - Fixed some HDMI timeouts
  - Swiched to clk_hw_register_gate_parent_data
  - Reorder Kconfig symbols in drivers/i2c/busses
  - Make the firmware clocks a child of the firmware node
  - Switch DVP clock driver to clk_hw interface
  - constify raspberrypi_clk_data in raspberrypi_clock_property
  - Don't mark firmware clocks as IGNORE_UNUSED
  - Change from reset_ms to reset_us in reset-simple, and add a bit more
    comments
  - Remove generic clk patch to test if a NULL pointer is returned
  - Removed misleading message in the is_prepared renaming patch commit
    message
  - Constify HDMI controller variants
  - Fix a bug in the allocation size of the clk data array
  - Added a mention in the DT binding conversion patches about the breakage
  - Merged a few fixes from kbuild
  - Fixed a few bisection and CEC build issues
  - Collected Acked-by and Reviewed-by
  - Change Dave email address to raspberrypi.com

Dave Stevenson (7):
  drm/vc4: Add support for the BCM2711 HVS5
  drm/vc4: plane: Change LBM alignment constraint on LBM
  drm/vc4: plane: Optimize the LBM allocation size
  drm/vc4: hdmi: Use reg-names to retrieve the HDMI audio registers
  drm/vc4: hdmi: Reset audio infoframe on encoder_enable if previously streaming
  drm/vc4: hdmi: Set the b-frame marker to the match ALSA's default.
  drm/vc4: hdmi: Add audio-related callbacks

Maxime Ripard (71):
  dt-bindings: display: Add support for the BCM2711 HVS
  drm/vc4: hvs: Boost the core clock during modeset
  drm/vc4: plane: Create more planes
  drm/vc4: crtc: Deal with different number of pixel per clock
  drm/vc4: crtc: Use a shared interrupt
  drm/vc4: crtc: Move the cob allocation outside of bind
  drm/vc4: crtc: Rename HVS channel to output
  drm/vc4: crtc: Use local chan variable
  drm/vc4: crtc: Enable and disable the PV in atomic_enable / disable
  drm/vc4: kms: Convert to for_each_new_crtc_state
  drm/vc4: crtc: Assign output to channel automatically
  drm/vc4: crtc: Add FIFO depth to vc4_crtc_data
  drm/vc4: crtc: Add function to compute FIFO level bits
  drm/vc4: crtc: Rename HDMI encoder type to HDMI0
  drm/vc4: crtc: Add HDMI1 encoder type
  drm/vc4: crtc: Disable color management for HVS5
  drm/vc4: crtc: Turn pixelvalve reset into a function
  drm/vc4: crtc: Move PV dump to config_pv
  drm/vc4: crtc: Move HVS init and close to a function
  drm/vc4: crtc: Move the HVS gamma LUT setup to our init function
  drm/vc4: hvs: Make sure our channel is reset
  drm/vc4: crtc: Remove mode_set_nofb
  drm/vc4: crtc: Remove redundant pixelvalve reset
  drm/vc4: crtc: Move HVS channel init before the PV initialisation
  drm/vc4: encoder: Add finer-grained encoder callbacks
  drm/vc4: crtc: Add a delay after disabling the PixelValve output
  drm/vc4: crtc: Clear the PixelValve FIFO on disable
  drm/vc4: crtc: Clear the PixelValve FIFO during configuration
  drm/vc4: hvs: Make the stop_channel function public
  drm/vc4: hvs: Introduce a function to get the assigned FIFO
  drm/vc4: crtc: Move the CRTC disable out
  drm/vc4: drv: Disable the CRTC at boot time
  dt-bindings: display: vc4: pv: Add BCM2711 pixel valves
  drm/vc4: crtc: Add BCM2711 pixelvalves
  drm/vc4: hdmi: Use debugfs private field
  drm/vc4: hdmi: Move structure to header
  drm/vc4: hdmi: rework connectors and encoders
  drm/vc4: hdmi: Remove DDC argument to connector_init
  drm/vc4: hdmi: Rename hdmi to vc4_hdmi
  drm/vc4: hdmi: Move accessors to vc4_hdmi
  drm/vc4: hdmi: Use local vc4_hdmi directly
  drm/vc4: hdmi: Add container_of macros for encoders and connectors
  drm/vc4: hdmi: Pass vc4_hdmi to CEC code
  drm/vc4: hdmi: Retrieve the vc4_hdmi at unbind using our device
  drm/vc4: hdmi: Remove vc4_dev hdmi pointer
  drm/vc4: hdmi: Remove vc4_hdmi_connector
  drm/vc4: hdmi: Introduce resource init and variant
  drm/vc4: hdmi: Implement a register layout abstraction
  drm/vc4: hdmi: Add reset callback
  drm/vc4: hdmi: Add PHY init and disable function
  drm/vc4: hdmi: Add PHY RNG enable / disable function
  drm/vc4: hdmi: Add a CSC setup callback
  drm/vc4: hdmi: Store the encoder type in the variant structure
  drm/vc4: hdmi: Deal with multiple debugfs files
  drm/vc4: hdmi: Move CEC init to its own function
  drm/vc4: hdmi: Add CEC support flag
  drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
  drm/vc4: hdmi: Rename drm_encoder pointer in mode_valid
  drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate
  drm/vc4: hdmi: Use clk_set_min_rate instead
  drm/vc4: hdmi: Deal with multiple ALSA cards
  drm/vc4: hdmi: Remove register dumps in enable
  drm/vc4: hdmi: Always recenter the HDMI FIFO
  drm/vc4: hdmi: Implement finer-grained hooks
  drm/vc4: hdmi: Do the VID_CTL configuration at once
  drm/vc4: hdmi: Switch to blank pixels when disabled
  drm/vc4: hdmi: Support the BCM2711 HDMI controllers
  dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI controllers bindings
  dt-bindings: display: vc4: Document BCM2711 VC5
  drm/vc4: drv: Support BCM2711
  ARM: dts: bcm2711: Enable the display pipeline

 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml        |  109 +++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |   18 +-
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |    5 +-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |    1 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts                                   |   46 ++-
 arch/arm/boot/dts/bcm2711.dtsi                                          |  115 ++++-
 drivers/gpu/drm/vc4/Makefile                                            |    1 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                                          |  338 +++++++++++----
 drivers/gpu/drm/vc4/vc4_drv.c                                           |    5 +-
 drivers/gpu/drm/vc4/vc4_drv.h                                           |   43 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                                          | 1625 +++++++++++++++++++++++++++++++++++++++++++-----------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h                                          |  183 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                                      |  520 +++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                                     |  442 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hvs.c                                           |  260 +++++++-----
 drivers/gpu/drm/vc4/vc4_kms.c                                           |  225 +++++++++-
 drivers/gpu/drm/vc4/vc4_plane.c                                         |  222 +++++++---
 drivers/gpu/drm/vc4/vc4_regs.h                                          |  177 +++-----
 drivers/gpu/drm/vc4/vc4_txp.c                                           |    4 +-
 19 files changed, 3331 insertions(+), 1008 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_regs.h

base-commit: 5bdd2824d705fb8d339d6f96e464b907c9a1553d
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
