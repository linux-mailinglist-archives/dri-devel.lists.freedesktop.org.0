Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5966FECC5
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 09:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345A410E194;
	Thu, 11 May 2023 07:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895F10E085;
 Thu, 11 May 2023 07:28:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A5145C08CE;
 Thu, 11 May 2023 03:28:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 May 2023 03:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1683790124; x=1683876524; bh=2DGMxaz68lfbQSOmt05c1FHF4
 3i3eiEYZZf3NWV/les=; b=rFgsfmTLxz4UtgEB3zzNiUD9sJnK10Rl42hfpTj9D
 aRu5aRluBinvYnQ20BDhr7r1bqvTWdaPWH3GKOwd92wAJ2ESFqOxbSEmGG5yBGT5
 LwAjaNWNLzt08msgD0rymBbXLQcYurxGWPibi6a3xxxIsno0HUxgFGw4zVa4RnQg
 CfSC+gqmoVRkPuA7fspPtTDeAdBDsMoYAcFSFx9EzaPyc0oJwT2qyn9rUyjGTUo4
 mfpgJZsmGay2XerNi1QCG2zuiiYSIBm77YGM+D4jRt/4YiCi2wNQdWlFAF6q/6nk
 m8Qi6dBCJ28pd7hlDD6qHnVJ5iY3hYK3BsXY0AbFmGbhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683790124; x=1683876524; bh=2DGMxaz68lfbQSOmt05c1FHF43i3eiEYZZf
 3NWV/les=; b=hxSELixkGD7jyMKRB+Vk/M1tZFk6Ksr4U7RuAJzvkJ0hLbmdyEE
 U7EgxGiC0JBdiyG7t3t5d1p0wo1EXQwaJkMuDd4YeF2ckbm6srDkddyGoZxM3YNa
 bapsb3wl7oqtDb516E5ARtWlZcqq2/UOtgQgF1zvzxmhTsdlH0pzGGGfvY5rF6E0
 Xtc4gPnOi9LytRWUXM1WIM9QF3Y72YzmYBqrxuawu36q2CxZibSP0lLARAumwmRj
 nLnkYnxWmfX2E5GGzasNqmUK6E+ifmjM5mZH8lCjRJ+xpu2D2/Sr92jsF7GQiIFZ
 b3vZ/B8CRQ3YvPDnpkz52yxNmn0xZyzGrfA==
X-ME-Sender: <xms:K5lcZOWSf0LNUSQl9Wlp_PvyZ4U4iMLbRua6nWHqb0M2kVyKliaEWQ>
 <xme:K5lcZKllXTeM-KHoj3wDvASVRwl6-iAfGyWFN0B1eSQaAfU6w3thy7vWFJKy5ep0Z
 3RKrHNVrqaS5FICytI>
X-ME-Received: <xmr:K5lcZCZ3Rrkch8_1UcAmRAXdqYTsBfIr42TrnP6egDbO9IgDbjcUe_C_Oc7O4-xE-shkNhWcULApMxl8XBFREA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtdfsredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleejhfeuleffleeuvdeufeefvefftdehgefhffelheehvedvlefhhfejledt
 heeknecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:K5lcZFVL-EHj28zSndEdcdIKbKEh4LO6Xyb_hzqkwGcxmFzpkSudZA>
 <xmx:K5lcZIk1Bo8JB0TxBKNeazuxdsdyQ9ebOdnB6_dK6Did2TGiz8lgWQ>
 <xmx:K5lcZKd98CJiZ4F7z67Ltlpwn1PCYZusTwfNu3vqnf9ruIbr_l97fw>
 <xmx:LJlcZBc8eY9KgBL3Y31Tu1OS3EjXwlPsfW1O1hFTX5Q47-ab2och3Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 03:28:43 -0400 (EDT)
Date: Thu, 11 May 2023 09:28:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <2pxmxdzsk2ekjy6xvbpj67zrhtwvkkhfspuvdm5pfm5i54hed6@sooct7yq6z4w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3jypkz6hnh354tho"
Content-Disposition: inline
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


--3jypkz6hnh354tho
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's the first drm-misc-next PR for 6.5

Please note that I'll be off for about a month starting next week, and
Thomas has kindly agreed to fill in.

Thanks!
Maxime

drm-misc-next-2023-05-11:
drm-misc-next for 6.5:

UAPI Changes:

Cross-subsystem Changes:
 - arch: Consolidate <asm/fb.h>

Core Changes:
 - aperture: Ignore firmware framebuffers with non-primary devices
 - fbdev: Use fbdev's I/O helpers
 - sysfs: Expose DRM connector ID
 - tests: More tests for drm_rect

Driver Changes:
 - armada: Implement fbdev emulation as a client
 - bridge:
   - fsl-ldb: Support i.MX6SX
   - lt9211: Remove blanking packets
   - lt9611: Remove blanking packets
   - tc358768: Implement input bus formats reporting, fix various
     timings and clocks settings
   - ti-sn65dsi86: Implement wait_hpd_asserted
 - nouveau: Improve NULL pointer checks before dereference
 - panel:
   - nt36523: Support Lenovo J606F
   - st7703: Support Anbernic RG353V-V2
   - new panels: InnoLux G070ACE-L01
 - sun4i: Fix MIPI-DSI dotclock
 - vc4: RGB Range toggle property, BT601 and BT2020 support for HDMI
 - vkms: Convert to drmm helpers, Add reflection and rotation support
The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-05-11

for you to fetch changes up to 4795c78768bcbd58d4ffab650674d314dc6dd772:

  drm: sun4i: calculate proper DCLK rate for DSI (2023-05-10 16:03:19 +0200)

----------------------------------------------------------------
drm-misc-next for 6.5:

UAPI Changes:

Cross-subsystem Changes:
 - arch: Consolidate <asm/fb.h>

Core Changes:
 - aperture: Ignore firmware framebuffers with non-primary devices
 - fbdev: Use fbdev's I/O helpers
 - sysfs: Expose DRM connector ID
 - tests: More tests for drm_rect

Driver Changes:
 - armada: Implement fbdev emulation as a client
 - bridge:
   - fsl-ldb: Support i.MX6SX
   - lt9211: Remove blanking packets
   - lt9611: Remove blanking packets
   - tc358768: Implement input bus formats reporting, fix various
     timings and clocks settings
   - ti-sn65dsi86: Implement wait_hpd_asserted
 - nouveau: Improve NULL pointer checks before dereference
 - panel:
   - nt36523: Support Lenovo J606F
   - st7703: Support Anbernic RG353V-V2
   - new panels: InnoLux G070ACE-L01
 - sun4i: Fix MIPI-DSI dotclock
 - vc4: RGB Range toggle property, BT601 and BT2020 support for HDMI
 - vkms: Convert to drmm helpers, Add reflection and rotation support

----------------------------------------------------------------
Alexander Stein (1):
      drm/bridge: ti-sn65dsi83: Fix enable error path

Arthur Grillo (5):
      drm/tests: Add test cases for drm_rect_intersect()
      drm/tests: Add test cases for drm_rect_calc_hscale()
      drm/tests: Add test cases for drm_rect_calc_vscale()
      drm/tests: Add test cases for drm_rect_rotate()
      drm/test: Add test cases for drm_rect_rotate_inv()

Brandon Pollack (1):
      Documentation: vkms: clarify devres managed reference cleanup

Brian Norris (2):
      drm/atomic: Allow vblank-enabled + self-refresh "disable"
      drm/rockchip: vop: Leave vblank enabled in self-refresh

Chris Morgan (3):
      dt-bindings: panel: Add Anbernic RG353V-V2 panel compatible
      drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
      drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support

Christian K=F6nig (3):
      drm/scheduler: properly forward fence errors
      drm/scheduler: add drm_sched_entity_error and use rcu for last_schedu=
led
      drm/scheduler: mark jobs without fence as canceled

Dan Carpenter (2):
      drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
      drm/udl: delete dead code

Daniel Vetter (9):
      MAINTAINERS: add drm_bridge for drm bridge maintainers
      drm/gma500: Use drm_aperture_remove_conflicting_pci_framebuffers
      video/aperture: use generic code to figure out the vga default device
      drm/aperture: Remove primary argument
      video/aperture: Only kick vgacon when the pdev is decoding vga
      video/aperture: Move vga handling to pci function
      video/aperture: Drop primary argument
      video/aperture: Only remove sysfb on the default vga pci device
      fbdev: Simplify fb_is_primary_device for x86

Danilo Krummrich (1):
      drm/scheduler: set entity to NULL in drm_sched_entity_pop_job()

Dave Stevenson (7):
      drm/vc4: hdmi: Add Broadcast RGB property to allow override of RGB ra=
nge
      drm/vc4: hdmi: Rename full range helper
      drm/vc4: hdmi: Swap CSC matrix channels for YUV444
      drm/vc4: hdmi: Rework the CSC matrices organization
      drm/vc4: hdmi: Add a function to retrieve the CSC matrix
      drm/vc4: hdmi: Add BT.601 Support
      drm/vc4: hdmi: Add BT.2020 Support

Fabio Estevam (2):
      dt-bindings: display: bridge: ldb: Add an i.MX6SX entry
      drm/bridge: fsl-ldb: Add i.MX6SX support

Francesco Dolcini (10):
      drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
      drm/bridge: tc358768: always enable HS video mode
      drm/bridge: tc358768: fix PLL parameters computation
      drm/bridge: tc358768: fix PLL target frequency
      drm/bridge: tc358768: fix TCLK_ZEROCNT computation
      drm/bridge: tc358768: fix TCLK_TRAILCNT computation
      drm/bridge: tc358768: fix THS_ZEROCNT computation
      drm/bridge: tc358768: fix TXTAGOCNT computation
      drm/bridge: tc358768: fix THS_TRAILCNT computation
      drm/bridge: tc358768: remove unused variable

Jani Nikula (3):
      drm/sti/sti_hdmi: convert to using is_hdmi from display info
      drm/rockchip: cdn-dp: call drm_connector_update_edid_property() uncon=
ditionally
      drm/connector: document enum drm_connector_tv_mode DRM_MODE_TV_MODE_M=
AX

Konrad Dybcio (4):
      dt-bindings: display: panel: nt36523: Add Lenovo J606F panel
      drm/panel: nt36523: Add DCS backlight support
      drm/panel: nt36523: Get orientation from OF
      drm/panel: nt36523: Add Lenovo J606F panel

Luc Ma (1):
      drm/vram-helper: fix function names in vram helper doc

Marek Vasut (2):
      drm/bridge: lt9211: Do not generate HFP/HBP/HSA and EOT packet
      drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet

Markus Elfring (10):
      drm/nouveau/debugfs: Move an expression into a function call paramete=
r in nouveau_debugfs_pstate_set()
      drm/nouveau/debugfs: Move a variable assignment behind a null pointer=
 check in nouveau_debugfs_pstate_get()
      drm/nouveau/debugfs: Use seq_putc() in nouveau_debugfs_pstate_get()
      drm/nouveau/debugfs: Replace five seq_printf() calls by seq_puts() in=
 nouveau_debugfs_pstate_get()
      drm/nouveau/bios/power_budget: Move an expression into a macro call p=
arameter in nvbios_power_budget_header()
      drm/nouveau/clk: Move a variable assignment behind a null pointer che=
ck in nvkm_pstate_new()
      drm/nouveau/pci: Move a variable assignment behind condition checks i=
n nvkm_pcie_set_link()
      drm/nouveau/pci: Move an expression into a function call parameter in=
 nvkm_pcie_set_link()
      drm/nouveau/therm: Move an assignment statement behind a null pointer=
 check in two functions
      drm/bridge: it6505: Move a variable assignment behind a null pointer =
check in receive_timing_debugfs_show()

Maxime Ripard (3):
      drm/vc4: Switch to container_of_const
      drm/vc4: hdmi: Update all the planes if the TV margins are changed
      Merge drm/drm-next into drm-misc-next

Ma=EDra Canal (14):
      drm/vkms: Use drmm_crtc_init_with_planes()
      drm/vkms: Use drmm_mode_config_init()
      drm/gem: Check for valid formats
      drm/bridge: anx7625: Drop of_gpio header
      drm/sti: Drop of_gpio header
      drm/vkms: isolate pixel conversion functionality
      drm/vkms: allow full alpha blending on all planes
      drm/vkms: drop full alpha blending TODO
      drm/vkms: add rotate-0 and reflect-x property
      drm/vkms: add reflect-y and rotate-180 property
      drm/vkms: add rotate-90 property
      drm/vkms: add rotate-270 property
      drm/vkms: drop "Rotation" TODO
      MAINTAINERS: Add Maira to VKMS maintainers

Nikita Travkin (1):
      drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted

Richard Leitner (2):
      dt-bindings: display: simple: add support for InnoLux G070ACE-L01
      drm/panel: simple: Add InnoLux G070ACE-L01

Rodrigo Siqueira (1):
      drm/display: Add missing OLED Vesa brightnesses definitions

Rodrigo Vivi (1):
      drm/doc/rfc: Introduce the merge plan for the Xe driver.

Roman Beranek (2):
      drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
      drm: sun4i: calculate proper DCLK rate for DSI

Sui Jingfeng (1):
      dma-buf/dma-resv.c: fix a typo

Thomas Zimmermann (46):
      video/aperture: Provide a VGA helper for gma500 and internal use
      Merge drm/drm-next into drm-misc-next
      fbdev: Prepare generic architecture helpers
      arch/arc: Implement <asm/fb.h> with generic helpers
      arch/arm: Implement <asm/fb.h> with generic helpers
      arch/arm64: Implement <asm/fb.h> with generic helpers
      arch/ia64: Implement <asm/fb.h> with generic helpers
      arch/loongarch: Implement <asm/fb.h> with generic helpers
      arch/m68k: Merge variants of fb_pgprotect() into single function
      arch/m68k: Implement <asm/fb.h> with generic helpers
      arch/mips: Implement <asm/fb.h> with generic helpers
      video: Remove trailing whitespaces
      video: Move HP PARISC STI core code to shared location
      arch/parisc: Remove trailing whitespaces
      arch/parisc: Implement fb_is_primary_device() under arch/parisc
      arch/parisc: Implement <asm/fb.h> with generic helpers
      arch/powerpc: Implement <asm/fb.h> with generic helpers
      arch/sh: Implement <asm/fb.h> with generic helpers
      arch/sparc: Implement fb_is_primary_device() in source file
      arch/sparc: Implement <asm/fb.h> with generic helpers
      arch/x86: Implement <asm/fb.h> with generic helpers
      drm/armada: Include <linux/of.h>
      drm/armada: Hide fbdev support behind config option
      drm/armada: Initialize fbdev DRM client
      drm/armada: Implement fbdev emulation as in-kernel client
      Merge drm/drm-next into drm-misc-next
      arch/x86: Include <asm/fb.h> in fbdev source file
      auxdisplay/cfag12864bfb: Use struct fb_info.screen_buffer
      auxdisplay/ht16k33: Use struct fb_info.screen_buffer
      hid/hid-picolcd_fb: Use struct fb_info.screen_buffer
      fbdev/arcfb: Use struct fb_info.screen_buffer
      fbdev/au1200fb: Use struct fb_info.screen_buffer
      fbdev/broadsheetfb: Use struct fb_info.screen_buffer
      fbdev/hecubafb: Use struct fb_info.screen_buffer
      fbdev/metronomefb: Use struct fb_info.screen_buffer
      fbdev/ps3fb: Use struct fb_info.screen_buffer
      fbdev/smscufx: Use struct fb_info.screen_buffer
      fbdev/udlfb: Use struct fb_info.screen_buffer
      fbdev/vfb: Use struct fb_info.screen_buffer
      fbdev/xen-fbfront: Use struct fb_info.screen_buffer
      fbdev: Return number of bytes read or written
      fbdev: Use screen_buffer in fb_sys_{read,write}()
      fbdev: Don't re-validate info->state in fb_ops implementations
      fbdev: Validate info->screen_{base, buffer} in fb_ops implementations
      fbdev: Move I/O read and write code into helper functions
      drm/fb-helper: Use fb_{cfb,sys}_{read, write}()

Tom Rix (1):
      drm/meson: set variables meson_hdmi_* storage-class-specifier to stat=
ic

Ville Syrj=E4l=E4 (1):
      drm/uapi: Document CTM matrix better

Won Chung (2):
      drm/sysfs: Expose DRM connector id in each connector sysfs
      drm/sysfs: Link DRM connectors to corresponding Type-C connectors

Yang Li (1):
      drm/tve200: Use devm_platform_ioremap_resource()

 .../bindings/display/bridge/fsl,ldb.yaml           |   5 +-
 .../bindings/display/panel/novatek,nt36523.yaml    |  16 +-
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../display/panel/rocktech,jh057n00900.yaml        |   2 +
 Documentation/gpu/rfc/index.rst                    |   4 +
 Documentation/gpu/rfc/xe.rst                       | 235 +++++++++
 Documentation/gpu/todo.rst                         |   7 +-
 Documentation/gpu/vkms.rst                         |   7 +-
 MAINTAINERS                                        |   2 +
 arch/arc/include/asm/fb.h                          |  16 +-
 arch/arm/include/asm/fb.h                          |  15 +-
 arch/arm64/include/asm/fb.h                        |  15 +-
 arch/ia64/include/asm/fb.h                         |  11 +-
 arch/loongarch/include/asm/fb.h                    |  15 +-
 arch/m68k/include/asm/fb.h                         |  24 +-
 arch/mips/include/asm/fb.h                         |  10 +-
 arch/parisc/Makefile                               |   4 +-
 arch/parisc/include/asm/fb.h                       |  20 +-
 arch/parisc/video/Makefile                         |   3 +
 arch/parisc/video/fbdev.c                          |  27 +
 arch/powerpc/include/asm/fb.h                      |   8 +-
 arch/sh/include/asm/fb.h                           |  15 +-
 arch/sparc/Makefile                                |   1 +
 arch/sparc/include/asm/fb.h                        |  33 +-
 arch/sparc/video/Makefile                          |   3 +
 arch/sparc/video/fbdev.c                           |  24 +
 arch/x86/include/asm/fb.h                          |  21 +-
 arch/x86/video/fbdev.c                             |  30 +-
 drivers/auxdisplay/cfag12864bfb.c                  |   2 +-
 drivers/auxdisplay/ht16k33.c                       |   2 +-
 drivers/dma-buf/dma-resv.c                         |   2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   2 +-
 drivers/gpu/drm/armada/Makefile                    |   3 +-
 drivers/gpu/drm/armada/armada_drm.h                |  10 +-
 drivers/gpu/drm/armada/armada_drv.c                |  14 +-
 drivers/gpu/drm/armada/armada_fb.c                 |   1 -
 drivers/gpu/drm/armada/armada_fbdev.c              | 135 +++--
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   1 -
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  14 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   4 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/tc358768.c                  |  97 +++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  19 +
 drivers/gpu/drm/drm_aperture.c                     |  11 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  11 +-
 drivers/gpu/drm/drm_drv.c                          |   4 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 174 +------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   9 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   6 +-
 drivers/gpu/drm/drm_sysfs.c                        |  51 ++
 drivers/gpu/drm/gma500/psb_drv.c                   |  43 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   1 -
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   2 +-
 drivers/gpu/drm/meson/meson_venc.c                 |  32 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |  19 +-
 .../drm/nouveau/nvkm/subdev/bios/power_budget.c    |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c     |   7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      | 569 +++++++++++++++++=
+++-
 drivers/gpu/drm/panel/panel-simple.c               |  35 ++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 102 +++-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   8 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |  49 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  22 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |  11 +-
 drivers/gpu/drm/sti/sti_hdmi.h                     |   2 -
 drivers/gpu/drm/stm/drv.c                          |   2 +-
 drivers/gpu/drm/sun4i/Makefile                     |   2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  46 +-
 .../sun4i/{sun4i_dotclock.c =3D> sun4i_tcon_dclk.c}  |   2 +-
 .../sun4i/{sun4i_dotclock.h =3D> sun4i_tcon_dclk.h}  |   0
 drivers/gpu/drm/tegra/drm.c                        |   2 +-
 drivers/gpu/drm/tests/drm_rect_test.c              | 315 ++++++++++++
 drivers/gpu/drm/tve200/tve200_drv.c                |   4 +-
 drivers/gpu/drm/udl/udl_main.c                     |   2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |   3 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |   4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   2 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  65 +--
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  17 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 336 ++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  25 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  16 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |   3 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |  12 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |  14 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |  38 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   5 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   6 +-
 drivers/gpu/drm/vkms/vkms_formats.c                | 141 +++--
 drivers/gpu/drm/vkms/vkms_formats.h                |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |  50 +-
 drivers/hid/hid-picolcd_fb.c                       |   4 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |   4 +-
 drivers/video/Kconfig                              |   7 +
 drivers/video/Makefile                             |   1 +
 drivers/video/aperture.c                           |  70 ++-
 drivers/video/console/Kconfig                      |   1 +
 drivers/video/console/Makefile                     |   4 +-
 drivers/video/console/sticon.c                     |   6 +-
 drivers/video/fbdev/Kconfig                        |   3 +-
 drivers/video/fbdev/arcfb.c                        |  11 +-
 drivers/video/fbdev/au1200fb.c                     |   2 +-
 drivers/video/fbdev/broadsheetfb.c                 |  16 +-
 drivers/video/fbdev/cobalt_lcdfb.c                 |   6 +
 drivers/video/fbdev/core/Makefile                  |   2 +-
 drivers/video/fbdev/core/fb_io_fops.c              | 133 +++++
 drivers/video/fbdev/core/fb_sys_fops.c             |  36 +-
 drivers/video/fbdev/core/fbmem.c                   | 111 +---
 drivers/video/fbdev/hecubafb.c                     |  12 +-
 drivers/video/fbdev/hyperv_fb.c                    |   2 +-
 drivers/video/fbdev/metronomefb.c                  |  16 +-
 drivers/video/fbdev/ps3fb.c                        |   4 +-
 drivers/video/fbdev/pvr2fb.c                       |   3 +
 drivers/video/fbdev/sm712fb.c                      |  10 +-
 drivers/video/fbdev/smscufx.c                      |  14 +-
 drivers/video/fbdev/ssd1307fb.c                    |   3 +
 drivers/video/fbdev/stifb.c                        | 158 +++---
 drivers/video/fbdev/udlfb.c                        |  12 +-
 drivers/video/fbdev/vfb.c                          |   2 +-
 drivers/video/fbdev/xen-fbfront.c                  |   2 +-
 drivers/video/{console =3D> }/sticore.c              | 123 ++---
 include/asm-generic/fb.h                           |  24 +-
 include/drm/display/drm_dp.h                       |   3 +
 include/drm/drm_aperture.h                         |   7 +-
 include/drm/drm_connector.h                        |   5 +
 include/drm/gpu_scheduler.h                        |   5 +-
 include/linux/aperture.h                           |  16 +-
 include/linux/fb.h                                 |  10 +
 include/uapi/drm/drm_mode.h                        |   5 +
 {drivers/video/fbdev =3D> include/video}/sticore.h   |  16 +-
 144 files changed, 2840 insertions(+), 1243 deletions(-)
 create mode 100644 Documentation/gpu/rfc/xe.rst
 create mode 100644 arch/parisc/video/Makefile
 create mode 100644 arch/parisc/video/fbdev.c
 create mode 100644 arch/sparc/video/Makefile
 create mode 100644 arch/sparc/video/fbdev.c
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.c =3D> sun4i_tcon_dclk.c} (99=
%)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.h =3D> sun4i_tcon_dclk.h} (10=
0%)
 create mode 100644 drivers/video/fbdev/core/fb_io_fops.c
 rename drivers/video/{console =3D> }/sticore.c (95%)
 rename {drivers/video/fbdev =3D> include/video}/sticore.h (99%)

--3jypkz6hnh354tho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZFyZKAAKCRDj7w1vZxhR
xRaPAP9J7hRRIpzzSAFI+IBhaVVtFvjt91dOaWDUGmwe8kXuAgD/WJgeJ1l17KHR
lMRn+LWJty3Sh8zyAd0ucew6YQnWkAk=
=ndL+
-----END PGP SIGNATURE-----

--3jypkz6hnh354tho--
