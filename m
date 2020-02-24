Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF616A2E5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAEB6E301;
	Mon, 24 Feb 2020 09:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272D56E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:08:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 31F8446D;
 Mon, 24 Feb 2020 04:08:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=sRKwpL5+RncAjXft+T6z5gbIgX
 QOqukGjroCnWYAqkg=; b=Q85Ylt9Dt0fjb60GW0UFq5rl/p+oymlzPXOM5gTP1l
 0D0N3qYLdCUda5/KfHD2HTLdBiwBKPG5un01NQLU0rUZGAMm4ro/CoEOPWPkXS52
 VWhuuwV9IV5KIZJi5RZqsBJDeoLyX4vt8WEPRs4cAGwg/2fqZDKmBCp8SakOoqyK
 EfwPcjf6+FoUaBapnCiBSQcrkRyd8DVQT30x9TcDFC6C/2+ndlkf+oflH+y7sJrd
 8i0qzKAqqG8ZXxlZKXGzm9QEF8oiAnhWdI8zFL0OP1/ZYdiaczxb/MPnnofGWuP8
 xQzhtD4VNSb/nhdkJ0uRsgYw37OJSbdlJtAAkTK6/oWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sRKwpL5+RncAjXft+
 T6z5gbIgXQOqukGjroCnWYAqkg=; b=k8M68MbCRfIwH6MeuMRMiVoJ2JRTLUER8
 qPMdoepPnyRvgYofYGHs4ON3mZM03OGwRf1ZHVxGa2THtNtQT5NCYPancG80zOZ+
 Mtk+q7pA8SYloaXC4cS2cxPgDb50OwIp5KOTHTFQYryKD8KWuFi135axUzV2M33n
 5NFkWUuc6sTc5vVS2AIcnHMccMqh7HNapTg0vH1LklnrtVzh+WkV/av7Sw6ejWAs
 BCzF+QjN37JptQPPO8Mu6sU307asPtaJZh76DLNlW9JVmnY5LXL+lXHbo+4+TwoM
 Pu52HNaOSpd/3bgh+1PxldVkvStQkaSN4iTQVuBEXuYg/1vlYLHdQ==
X-ME-Sender: <xms:oZJTXpLa0AeaYBiFJzPahyk2pYE4QHhbgdg1b2AyBVJUqIPtd_CePQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgr
 rhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oZJTXsGLMDfCJtE8M5GFOAy3ZtCvEXooXjC1JEcXO9ylxnAsKlO40w>
 <xmx:oZJTXm0D7hJH9PGsEHB3RYqJddb5HFYLGN1J5fTkIIpZeRH-fi-2cA>
 <xmx:oZJTXuzx_0mrab0jwRtEFxY6QTTzQhY0wdbC9WNW5STb6tz90V6tpA>
 <xmx:p5JTXkxySZVwhc2xDToqJtByE3v-tON2zDaR-HP5fmKGMPWu1G2JZyUN6cY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55E583280063;
 Mon, 24 Feb 2020 04:08:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 00/89] drm/vc4: Support BCM2711 Display Pipeline
Date: Mon, 24 Feb 2020 10:06:02 +0100
Message-Id: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
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
been tested too). There's a couple of rough edges still that should be
addressed in the next versions:
  - Dual output doesn't work
  - The transposer (and thus writeback) doesn't work either and conflicts
    with the output mux too.

Let me know if you have any comments
Maxime

Dave Stevenson (2):
  drm/vc4: drv: Add support for the BCM2711 HVS5
  drm/vc4: plane: Improve LBM usage

Maxime Ripard (87):
  dt-bindings: i2c: brcmstb: Convert the BRCMSTB binding to a schema
  dt-bindings: i2c: brcmstb: Add BCM2711 BSC/AUTO-I2C binding
  i2c: brcmstb: Support BCM2711 HDMI BSC controllers
  i2c: brcmstb: Allow to compile it on BCM2835
  clk: Return error code when of provider pointer is NULL
  dt-bindings: clock: Add a binding for the RPi Firmware clocks
  clk: bcm: rpi: Allow the driver to be probed by DT
  clk: bcm: rpi: Statically init clk_init_data
  clk: bcm: rpi: Use clk_hw_register for pllb_arm
  clk: bcm: rpi: Remove global pllb_arm clock pointer
  clk: bcm: rpi: Make sure pllb_arm is removed
  clk: bcm: rpi: Remove pllb_arm_lookup global pointer
  clk: bcm: rpi: Switch to clk_hw_register_clkdev
  clk: bcm: rpi: Make sure the clkdev lookup is removed
  clk: bcm: rpi: Create a data structure for the clocks
  clk: bcm: rpi: Add clock id to data
  clk: bcm: rpi: Pass the clocks data to the firmware function
  clk: bcm: rpi: Rename is_prepared function
  clk: bcm: rpi: Split pllb clock hooks
  clk: bcm: rpi: Make the PLLB registration function return a clk_hw
  clk: bcm: rpi: Add DT provider for the clocks
  clk: bcm: rpi: Discover the firmware clocks
  ARM: dts: bcm2711: Add firmware clocks node
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
  drm/vc4: plane: Move planes creation to its own function
  drm/vc4: plane: Move additional planes creation to driver
  drm/vc4: plane: Register all the planes at once
  drm/vc4: plane: Create overlays for any CRTC
  drm/vc4: plane: Create more planes
  drm/vc4: crtc: Rename SoC data structures
  drm/vc4: crtc: Move crtc state to common header
  drm/vc4: crtc: Deal with different number of pixel per clock
  drm/vc4: crtc: Use a shared interrupt
  drm/vc4: crtc: Turn static const variable into a define
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
  drm/vc4: hdmi: Remove vc4_dev hdmi pointer
  drm/vc4: hdmi: Remove vc4_hdmi_connector
  drm/vc4: hdmi: Introduce resource init and variant
  drm/vc4: hdmi: Implement a register layout abstraction
  drm/vc4: hdmi: Add reset callback
  drm/vc4: hdmi: Add PHY init and disable function
  drm/vc4: hdmi: Add PHY RNG enable / disable function
  drm/vc4: hdmi: Add a CSC setup callback
  drm/vc4: hdmi: Add a set_timings callback
  drm/vc4: hdmi: Add HDMI ID
  drm/vc4: hdmi: Deal with multiple debugfs files
  drm/vc4: hdmi: Add an audio support flag
  drm/vc4: hdmi: Move CEC init to its own function
  drm/vc4: hdmi: Add CEC support flag
  drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
  drm/vc4: hdmi: Rename drm_encoder pointer in mode_valid
  drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate
  drm/vc4: hdmi: Support the BCM2711 HDMI controllers
  dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI controllers bindings
  ARM: dts: bcm2711: Enable the display pipeline

 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml            |   47 ++-
 Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml |   39 ++-
 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt               |  174 +---------
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml          |   72 ++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml         |   84 ++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml         |  180 ++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml          |   37 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml  |   45 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml          |   37 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml          |   42 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml          |   35 ++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml          |   44 ++-
 Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml              |   97 +++++-
 Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt                    |   26 +-
 MAINTAINERS                                                              |    4 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts                                    |   40 ++-
 arch/arm/boot/dts/bcm2711.dtsi                                           |  132 +++++++-
 drivers/clk/bcm/Kconfig                                                  |    1 +-
 drivers/clk/bcm/Makefile                                                 |    1 +-
 drivers/clk/bcm/clk-bcm2711-dvp.c                                        |  113 ++++++-
 drivers/clk/bcm/clk-raspberrypi.c                                        |  271 ++++++++++----
 drivers/clk/clk.c                                                        |   14 +-
 drivers/gpu/drm/vc4/Makefile                                             |    1 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                                           |  328 ++++++++++-------
 drivers/gpu/drm/vc4/vc4_drv.c                                            |    5 +-
 drivers/gpu/drm/vc4/vc4_drv.h                                            |   56 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                                           | 1364 ++++++++++++++++++++++++++++++++++++++++++------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h                                           |  175 +++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                                       |  509 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                                      |  445 +++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hvs.c                                            |   17 +-
 drivers/gpu/drm/vc4/vc4_kms.c                                            |  175 ++++++++-
 drivers/gpu/drm/vc4/vc4_plane.c                                          |  271 ++++++++++----
 drivers/gpu/drm/vc4/vc4_regs.h                                           |  173 ++++-----
 drivers/i2c/busses/Kconfig                                               |    2 +-
 drivers/i2c/busses/i2c-brcmstb.c                                         |   33 ++-
 drivers/reset/reset-simple.c                                             |   24 +-
 drivers/reset/reset-simple.h                                             |   41 +--
 drivers/reset/reset-socfpga.c                                            |    3 +-
 drivers/reset/reset-sunxi.c                                              |    3 +-
 drivers/reset/reset-uniphier-glue.c                                      |    3 +-
 include/linux/reset/reset-simple.h                                       |   45 ++-
 include/soc/bcm2835/raspberrypi-firmware.h                               |    5 +-
 43 files changed, 4020 insertions(+), 1193 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt
 create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_regs.h
 delete mode 100644 drivers/reset/reset-simple.h
 create mode 100644 include/linux/reset/reset-simple.h

base-commit: fca8fce14e6ce96f4d22783ab8ddea09c0f4de34
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
