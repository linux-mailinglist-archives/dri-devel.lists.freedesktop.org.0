Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6B1E5967
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2B6E46B;
	Thu, 28 May 2020 07:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6529B6E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D79CB581FE2;
 Wed, 27 May 2020 11:49:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=Rj9Ye5tKBtVnumXch/RtSXG284
 Fs6hT2LHuSvNhJJxc=; b=RWjXR2RfJJh/uG9hH9SfAHIxO6agPpwsiQBD3aeIY3
 mQLshdm+fRxMGBPIwXY7btjka/azfD59OL61hUOD2rcgtWa2k7x7crcTE0D+OoG/
 WdPKIgqzFpeEzR8rGiUPUXpZCLfwPDyl/LoqFRM27zwmg1sYO1Ktc7Yn74LQiG3X
 SfuToX07ECuTCsnz2m5LURrV/wWx4uPHJYJuHNTytY7nTbv/emGO3xqLpamhKB2/
 BWGECNkmbBBuSH5wjc+lAgQeWvTuWwXr1TIMV2FymDRDqzJxaNX9CA102fxIC2qq
 sNMq3armovlDawiNgidm70DZ/9XHzSmdEg/Vvz2zcFfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Rj9Ye5tKBtVnumXch
 /RtSXG284Fs6hT2LHuSvNhJJxc=; b=aqEwTemr5nAXNqGkbc4sAfhx+FNmP8Oct
 l1UPbHMlf6QhzjIrpUA1kd+DQytXotZn0pGiR5ob5tzgTAcWjrnu6yotpj+MBBN/
 OH2VN88PDpa/dvzPKCV4CzU/cGf1qArpwpjIK7GWpBOXPtOPicHrYZRMKQBFxFx5
 wI4DDuY2v+wfhXdJSqZmExgCmX2CqJ4/4if/CbAuq4+qftTe/iwHtu3SbWrFnHX/
 JXxDjYSSBL+Jp7r3k3qNBek0s5ghjOZCPGlzdyOB1W/l/eFobQftQ9I+l0lcjuhj
 ZVTwDJksjXM7oUKIH/JzUv/u87KMSoV4bJq1a//Mrm0Wby52B4xtg==
X-ME-Sender: <xms:_YvOXm3ymeQy6rr81BkwARQn4pbNnPkZk0Y9HNiHCH1ZetA5s4fHFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
 gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
 hmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpefgteejgeelvdfhuedt
 vdffueekveekudekuddtieelieelhfeuveekfeevkeeghfenucffohhmrghinhepkhgvrh
 hnvghlrdhorhhgpdhrrghsphgsvghrrhihphhirdgtohhmnecukfhppeeltddrkeelrdei
 kedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_YvOXpFCzO_XPvvQCf8112_ZE0Ura9vduko18W-KbjZjSMHNHjYtXQ>
 <xmx:_YvOXu710rD7iZfbel8O1QtL-9xPXb0ph_jybZzzusGgo19T9HMOCg>
 <xmx:_YvOXn32ETNiapsHlTgRLC92WpK5SKI7MBEwiC-zpblMwuDuU33TRg>
 <xmx:_ovOXmckB-_B3fiW35XFVthEqXKnIMNIkX39oMFwonAdmXLypapvYw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE37E328005D;
 Wed, 27 May 2020 11:49:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 000/105] drm/vc4: Support BCM2711 Display Pipeline
Date: Wed, 27 May 2020 17:47:30 +0200
Message-Id: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

Only the HDMI support is enabled for now (even though the DPI output has
been tested too).

This is based on the firmware clocks series sent separately:
https://lore.kernel.org/lkml/cover.662a8d401787ef33780d91252a352de91dc4be10.1590594293.git-series.maxime@cerno.tech/

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

Dave Stevenson (6):
  drm/vc4: Add support for the BCM2711 HVS5
  drm/vc4: plane: Improve LBM usage
  drm/vc4: hdmi: Use reg-names to retrieve the HDMI audio registers
  drm/vc4: hdmi: Reset audio infoframe on encoder_enable if previously streaming
  drm/vc4: hdmi: Set the b-frame marker to the match ALSA's default.
  drm/vc4: hdmi: Add audio-related callbacks

Maxime Ripard (99):
  reset: Move reset-simple header out of drivers/reset
  reset: simple: Add reset callback
  dt-bindings: clock: Add BCM2711 DVP binding
  clk: bcm: Add BCM2711 DVP driver
  ARM: dts: bcm2711: Add HDMI DVP
  dt-bindings: display: Convert VC4 bindings to schemas
  dt-bindings: display: vc4: dpi: Add missing clock-names property
  dt-bindings: display: vc4: dsi: Add missing clock properties
  dt-bindings: display: vc4: hdmi: Add missing clock-names property
  dt-bindings: display: vc4: Document BCM2711 VC5
  drm/vc4: drv: Add include guards
  drm/vc4: drv: Support BCM2711
  dt-bindings: display: Add support for the BCM2711 HVS
  drm/vc4: hvs: Boost the core clock during modeset
  drm/vc4: plane: Move planes creation to its own function
  drm/vc4: plane: Move additional planes creation to driver
  drm/vc4: plane: Register all the planes at once
  drm/vc4: plane: Create overlays for any CRTC
  drm/vc4: plane: Create more planes
  drm/vc4: crtc: Rename SoC data structures
  drm/vc4: crtc: Switch to of_device_get_match_data
  drm/vc4: crtc: Move crtc state to common header
  drm/vc4: crtc: Deal with different number of pixel per clock
  drm/vc4: crtc: Use a shared interrupt
  drm/vc4: crtc: Turn static const variable into a define
  drm/vc4: crtc: Restrict HACT_ACT setup to DSI
  drm/vc4: crtc: Move the cob allocation outside of bind
  drm/vc4: crtc: Rename HVS channel to output
  drm/vc4: crtc: Use local chan variable
  drm/vc4: crtc: Enable and disable the PV in atomic_enable / disable
  drm/vc4: crtc: Assign output to channel automatically
  drm/vc4: crtc: Add FIFO depth to vc4_crtc_data
  drm/vc4: crtc: Add function to compute FIFO level bits
  drm/vc4: crtc: Rename HDMI encoder type to HDMI0
  drm/vc4: crtc: Add HDMI1 encoder type
  drm/vc4: crtc: Remove redundant call to drm_crtc_enable_color_mgmt
  drm/vc4: crtc: Disable color management for HVS5
  drm/vc4: crtc: Turn pixelvalve reset into a function
  drm/vc4: crtc: Move HVS mode config to HVS file
  drm/vc4: crtc: Move PV dump to config_pv
  drm/vc4: crtc: Move HVS init and close to a function
  drm/vc4: crtc: Move the HVS gamma LUT setup to our init function
  drm/vc4: hvs: Make sure our channel is reset
  drm/vc4: hvs: Remove mode_set_nofb
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
  drm/vc4: crtc: Make state functions public
  drm/vc4: crtc: Split CRTC data in two
  drm/vc4: crtc: Only access the PixelValve registers if we have to
  drm/vc4: crtc: Move the CRTC initialisation to a separate function
  drm/vc4: crtc: Change the HVS5 test for of_device_is_compatible
  drm/vc4: crtc: Move the txp_armed function to the TXP
  drm/vc4: txp: Turn the TXP into a CRTC of its own
  drm/vc4: crtc: Remove the feed_txp tests
  drm/vc4: hdmi: Use debugfs private field
  drm/vc4: hdmi: Move structure to header
  drm/vc4: hdmi: rework connectors and encoders
  drm/vc4: hdmi: Remove DDC argument to connector_init
  drm/vc4: hdmi: Rename hdmi to vc4_hdmi
  drm/vc4: hdmi: Move accessors to vc4_hdmi
  drm/vc4: hdmi: Use local vc4_hdmi directly
  drm/vc4: hdmi: Add container_of macros for encoders and connectors
  drm/vc4: hdmi: Pass vc4_hdmi to CEC code
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
  ARM: dts: bcm2711: Enable the display pipeline

 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml           |   47 ++-
 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt              |  174 +--------
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml        |  109 +++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml         |   72 +++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml        |   84 ++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml        |   80 ++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |   53 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |   45 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml         |   37 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml         |   42 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |   35 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml         |   44 ++-
 MAINTAINERS                                                             |    2 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts                                   |   46 ++-
 arch/arm/boot/dts/bcm2711.dtsi                                          |  130 +++++-
 drivers/clk/bcm/Kconfig                                                 |   11 +-
 drivers/clk/bcm/Makefile                                                |    1 +-
 drivers/clk/bcm/clk-bcm2711-dvp.c                                       |  127 ++++++-
 drivers/gpu/drm/vc4/Makefile                                            |    1 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                                          |  776 ++++++++++++++---------------------
 drivers/gpu/drm/vc4/vc4_drv.c                                           |    9 +-
 drivers/gpu/drm/vc4/vc4_drv.h                                           |  105 ++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                                          | 1610 ++++++++++++++++++++++++++++++++++++++++++------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h                                          |  183 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                                      |  520 +++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                                     |  451 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hvs.c                                           |  362 +++++++++++++++-
 drivers/gpu/drm/vc4/vc4_kms.c                                           |  191 ++++++++-
 drivers/gpu/drm/vc4/vc4_plane.c                                         |  271 +++++++++---
 drivers/gpu/drm/vc4/vc4_regs.h                                          |  176 +++-----
 drivers/gpu/drm/vc4/vc4_txp.c                                           |  109 ++++-
 drivers/reset/reset-simple.c                                            |   23 +-
 drivers/reset/reset-simple.h                                            |   41 +--
 drivers/reset/reset-socfpga.c                                           |    3 +-
 drivers/reset/reset-sunxi.c                                             |    3 +-
 drivers/reset/reset-uniphier-glue.c                                     |    3 +-
 include/linux/reset/reset-simple.h                                      |   48 ++-
 37 files changed, 4510 insertions(+), 1514 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
 create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_regs.h
 delete mode 100644 drivers/reset/reset-simple.h
 create mode 100644 include/linux/reset/reset-simple.h

base-commit: ec9e6942c9f16390e530c2aea2a565f95fe6e929
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
