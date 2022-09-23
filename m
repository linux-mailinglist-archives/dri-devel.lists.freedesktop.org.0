Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BC5E74FD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406B710E481;
	Fri, 23 Sep 2022 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F222510E481;
 Fri, 23 Sep 2022 07:39:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 21575580BDD;
 Fri, 23 Sep 2022 03:39:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 23 Sep 2022 03:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1663918787; x=1663925987; bh=DxxLMxpGZNOcoQBIh/TAC7dHlOlAKgdCivE
 AIBLqp30=; b=1/1dVxq6PiO832a4adOeK2SFfYtzDUBlCBtB/sjVIKq3ihDGxOj
 0qTO6bYQczLycwP9MCy1ZCOWlTl2M1bD66Efj0GgLPi9S2/O2JNSe01HxN1S4PWU
 AUdNy4DnaJ8aX19do3Zq2jrWTBWfn0chcqW8fzWGqocuGK41/nsepf0KScUgrc7v
 w/agz11hHQcera4GcaCx5wCxUQ5s0pDWSJw7Kd5ugpPWIObIv+pgTk+CwpCTSKc3
 d7u9uo8CksY3mtIpmX9pb1e5RbnV40ZsI0NKgLm9tboeVBj+2IHqDF1pKcXB2RjB
 sgEvGN3DiaEqWdokapu/YXhMHn5MoChvXXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663918787; x=
 1663925987; bh=DxxLMxpGZNOcoQBIh/TAC7dHlOlAKgdCivEAIBLqp30=; b=D
 kKBsMdkEXf47eH4TA5/VETEeu4JPcc+B7+IhANSzJS5U2iy7kYIb+Hkdh3f1chb6
 vC4TkcoPEAe07+n5aASAOICYhs9KAcVwrEdRQFBsbO+W6LtIn79FagRmKZt4UhLG
 qnty5oL+Fz1Frf0FbL8bpMAHeXUFsKl9lvKLettF9MT4ItrAxsUvL9FA+htS1m2I
 YqFAMBwQ+XpSvkPxw9v2vHcLGDyEP7CmfqMkCLuCBbR8sv7wBeEpiM0aZsKqHnLn
 hHeu0qTNw2Qz3LPZPHJScOMBZ8MsODFMlaU0QVngmcBJVS2/1PVTccQCG3ECJ+g/
 ZCO1matcgOsPX5KaZhnWQ==
X-ME-Sender: <xms:wmItY4FQ8sW5OwjEx_nMZ3uhoaPttjlS4z6k_Fq3tRizFRe4PLYCIg>
 <xme:wmItYxVJYlmJxomSVxx_XCOml7nYK1c51NtlSYUATepdy1EQF9d0dABsK-ieNgpkI
 C461_zzdytwR3Uwwt8>
X-ME-Received: <xmr:wmItYyJUPulhQbVNJruGwo9FbSq9VF3vv2LsbITRUMcIR4HX_B897PbrO9Ze>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefhedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdeffeevtedvgeegkeetleetkeetueehfeevveefieekudevjeegueffjeff
 jedvnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wmItY6HKW5_fQINDuXhd42St1cLpB1pxWpH04R-5k6eN2Bd4SnqCaQ>
 <xmx:wmItY-Ww0fh3bJH6vOpT61Mnd5VcXxNwyudROjxmksZEVb8QjmLOZQ>
 <xmx:wmItY9OrOICeXy0kOnSt8RbLMQenvaS0OiaHlBjlMpHXYiBzkATP0Q>
 <xmx:w2ItY0G_xoo54rrZ8ERvKdFREaHJKA9Vqt5zS0GXxKRNFsc8lElDmw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Sep 2022 03:39:45 -0400 (EDT)
Date: Fri, 23 Sep 2022 09:39:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20220923073943.d43tne5hni3iknlv@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zr3hh4wiludvtbko"
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


--zr3hh4wiludvtbko
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

We haven't had a drm-misc-next PR for a while, so here it is.

It should be the last drm-misc-next PR for 6.1

Maxime

drm-misc-next-2022-09-23:
drm-misc-next for 6.1:

UAPI Changes:

Cross-subsystem Changes:
  - dma-buf: Improve signaling when debugging

Core Changes:
  - Backlight handling improvements
  - format-helper: Add drm_fb_build_fourcc_list()
  - fourcc: Kunit tests improvements
  - modes: Add DRM_MODE_INIT() macro
  - plane: Remove drm_plane_init(), Allocate planes with drm_universal_plan=
e_alloc()
  - plane-helper: Add drm_plane_helper_atomic_check()
  - probe-helper: Add drm_connector_helper_get_modes_fixed() and
    drm_crtc_helper_mode_valid_fixed()
  - tests: Conversion to parametrized tests, test name consistency

Driver Changes:
  - amdgpu: Fix for a VRAM eviction issue
  - ast: Resolution handling improvements
  - mediatek: small code improvements for DP
  - omap: Refcounting fix, small improvements
  - rockchip: RK3568 support, Gamma support for RK3399
  - sun4i: Build failure fix when !OF
  - udl: Multiple fixes here and there
  - vc4: HDMI hotplug handling improvements
  - vkms: Warning fix
The following changes since commit 213cb76ddc8b875e772f9f4d173feefa122716af:

  Merge tag 'drm-intel-gt-next-2022-09-09' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2022-09-12 21:12:23 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-09-23

for you to fetch changes up to 39dd0cc2e5bd0d5188dd69f27e18783cea7ff06a:

  drm/amdgpu: Fix VRAM eviction issue (2022-09-22 19:53:06 +0200)

----------------------------------------------------------------
drm-misc-next for 6.1:

UAPI Changes:

Cross-subsystem Changes:
  - dma-buf: Improve signaling when debugging

Core Changes:
  - Backlight handling improvements
  - format-helper: Add drm_fb_build_fourcc_list()
  - fourcc: Kunit tests improvements
  - modes: Add DRM_MODE_INIT() macro
  - plane: Remove drm_plane_init(), Allocate planes with drm_universal_plan=
e_alloc()
  - plane-helper: Add drm_plane_helper_atomic_check()
  - probe-helper: Add drm_connector_helper_get_modes_fixed() and
    drm_crtc_helper_mode_valid_fixed()
  - tests: Conversion to parametrized tests, test name consistency

Driver Changes:
  - amdgpu: Fix for a VRAM eviction issue
  - ast: Resolution handling improvements
  - mediatek: small code improvements for DP
  - omap: Refcounting fix, small improvements
  - rockchip: RK3568 support, Gamma support for RK3399
  - sun4i: Build failure fix when !OF
  - udl: Multiple fixes here and there
  - vc4: HDMI hotplug handling improvements
  - vkms: Warning fix

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix VRAM eviction issue

Arvind Yadav (5):
      dma-buf: Remove the signaled bit status check
      dma-buf: set signaling bit for the stub fence
      dma-buf: Enable signaling on fence for selftests
      dma-buf: dma_fence_wait must enable signaling
      drm/sched: Use parent fence instead of finished

Bo-Chen Chen (3):
      drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
      drm/mediatek: dp: Remove unused register definitions
      drm/mediatek: dp: Fix compiler warning in mtk_dp_video_mute()

Chris Morgan (2):
      dt-bindings: display: rockchip-dsi: add rk3568 compatible
      drm/rockchip: dsi: add rk3568 support

Christian K=C3=B6nig (1):
      dma-buf: fix dma_fence_default_wait() signaling check

Gaosheng Cui (5):
      drm/vmwgfx: remove unused vmw_bo_is_vmw_bo() declaration
      drm/radeon/r600_cs: remove r600_cs_legacy_get_tiling_conf() declarati=
on
      drm/radeon: remove unused declarations for radeon
      drm/gma500: remove unused declarations in psb_intel_drv.h
      drm/amd/pm: remove unused declarations in hardwaremanager.h

Guo Zhengkui (1):
      drm: omapdrm: dss: replace ternary operator with max()

Hamza Mahfooz (1):
      drm/bridge: it6505: use drm_debug_enabled() in it6505_debug_print()

Hans de Goede (42):
      ACPI: video: Add acpi_video_backlight_use_native() helper
      drm/i915: Don't register backlight when another backlight should be u=
sed (v2)
      drm/amdgpu: Don't register backlight when another backlight should be=
 used (v3)
      drm/radeon: Don't register backlight when another backlight should be=
 used (v3)
      drm/nouveau: Don't register backlight when another backlight should b=
e used (v2)
      ACPI: video: Drop backlight_device_get_by_type() call from acpi_video=
_get_backlight_type()
      ACPI: video: Remove acpi_video_bus from list before tearing it down
      ACPI: video: Simplify acpi_video_unregister_backlight()
      ACPI: video: Make backlight class device registration a separate step=
 (v2)
      ACPI: video: Remove code to unregister acpi_video backlight when a na=
tive backlight registers
      drm/i915: Call acpi_video_register_backlight() (v3)
      drm/nouveau: Register ACPI video backlight when nv_backlight registra=
tion fails (v2)
      drm/amdgpu: Register ACPI video backlight when skipping amdgpu backli=
ght registration
      drm/radeon: Register ACPI video backlight when skipping radeon backli=
ght registration
      platform/x86: nvidia-wmi-ec-backlight: Move fw interface definitions =
to a header (v2)
      ACPI: video: Refactor acpi_video_get_backlight_type() a bit
      ACPI: video: Add Nvidia WMI EC brightness control detection (v3)
      ACPI: video: Add Apple GMUX brightness control detection
      platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_t=
ype()
      platform/x86: apple-gmux: Stop calling acpi/video.h functions
      platform/x86: toshiba_acpi: Stop using acpi_video_set_dmi_backlight_t=
ype()
      platform/x86: acer-wmi: Move backlight DMI quirks to acpi/video_detec=
t.c
      platform/x86: asus-wmi: Drop DMI chassis-type check from backlight ha=
ndling
      platform/x86: asus-wmi: Move acpi_backlight=3Dvendor quirks to ACPI v=
ideo_detect.c
      platform/x86: asus-wmi: Move acpi_backlight=3Dnative quirks to ACPI v=
ideo_detect.c
      platform/x86: samsung-laptop: Move acpi_backlight=3D[vendor|native] q=
uirks to ACPI video_detect.c
      ACPI: video: Remove acpi_video_set_dmi_backlight_type()
      ACPI: video: Drop "Samsung X360" acpi_backlight=3Dnative quirk
      ACPI: video: Drop NL5x?U, PF4NU1F and PF5?U?? acpi_backlight=3Dnative=
 quirks
      ACPI: video: Fix indentation of video_detect_dmi_table[] entries
      drm/todo: Add entry about dealing with brightness control on devices =
with > 1 panel
      drm/gma500: Fix (vblank) IRQs not working after suspend/resume
      drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
      drm/gma500: Remove never set dev_priv->rpm_enabled flag
      drm/gma500: Remove a couple of not useful function wrappers
      drm/gma500: Rewrite power management code
      drm/gma500: Remove unnecessary suspend/resume wrappers
      drm/gma500: Refactor backlight support (v2)
      drm/gma500: Change registered backlight device type to raw/native
      drm/gma500: Use backlight_get_brightness() to get the brightness
      drm/gma500: Don't register backlight when another backlight should be=
 used
      drm/gma500: Call acpi_video_register_backlight()

Harshit Mogalapalli (1):
      drm/vkms: fix variable dereferenced before check warning

Hugh Cole-Baker (2):
      drm/rockchip: define gamma registers for RK3399
      drm/rockchip: support gamma control on RK3399

Jammy Huang (2):
      drm/ast: Add resolution support for 1152x864@75
      drm/ast: Fix video broken in some resolutions on ast2600

Javier Martinez Canillas (1):
      drm/plane-helper: Add a drm_plane_helper_atomic_check() helper

Jiapeng Chong (1):
      drm/atomic-helper: Fix kernel-doc

Jilin Yuan (2):
      drm/tidss: fix repeated words in comments
      drm/vboxvideo: fix repeated words in comments

Jouni H=C3=B6gander (2):
      drm: Use original src rect while initializing damage iterator
      drm/tests: Set also mock plane src_x, src_y, src_w and src_h

Liang He (1):
      drm/omap: dss: Fix refcount leak bugs

Maxime Ripard (11):
      drm/sun4i: tv: Include drm_atomic.h
      drm/vc4: hdmi: Constify drm_display_mode
      drm/vc4: hdmi: Remove unused argument in vc4_hdmi_supports_scrambling
      drm/vc4: hdmi: Remove mutex in detect
      drm/vc4: hdmi: Simplify the hotplug handling
      drm/vc4: hdmi: Switch to detect_ctx
      drm/vc4: hdmi: Move vc4_hdmi_supports_scrambling() around
      drm/vc4: hdmi: Reset link on hotplug
      drm/scdc: Document hotplug gotchas
      Merge drm/drm-next into drm-misc-next
      Merge tag 'backlight-detect-refactor-1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/pdx86/platform-drivers-x86 into drm-misc-next

Maya Matuszczyk (2):
      drm: panel-orientation-quirks: Add quirk for Anbernic Win600
      drm: panel-orientation-quirks: Add quirk for Aya Neo Air

Ma=C3=ADra Canal (2):
      drm/tests: Split drm_framebuffer_create_test into parameterized tests
      drm/tests: Change "igt_" prefix to "drm_test_"

Micha=C5=82 Winiarski (2):
      drm/format: Use appropriate types in expect/assert
      drm/format: Split into more granular test cases

Minghao Chi (1):
      drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more robust and safer

Rafael Mendonca (1):
      drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()

Robert Foss (4):
      Revert "dt-bindings: Add byteswap order to chrontel ch7033"
      Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector operatio=
ns for DP"
      Revert "Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector =
operations for DP""
      Revert "drm/bridge: chrontel-ch7033: Add byteswap order setting"

Takashi Iwai (10):
      drm/udl: Restore display mode on resume
      Revert "drm/udl: Kill pending URBs at suspend and disconnect"
      drm/udl: Suppress error print for -EPROTO at URB completion
      drm/udl: Increase the default URB list size to 20
      drm/udl: Drop unneeded alignment
      drm/udl: Pass rectangle directly to udl_handle_damage()
      drm/udl: Fix potential URB leaks
      drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
      drm/udl: Don't re-initialize stuff at retrying the URB list allocation
      drm/udl: Sync pending URBs at the end of suspend

Thierry Reding (1):
      drm/aperture: Fix some kerneldoc comments

Thomas Zimmermann (10):
      drm/udl: Add reset_resume
      drm/udl: Enable damage clipping
      drm/probe-helper: Add drm_connector_helper_get_modes_fixed()
      drm/probe-helper: Add drm_crtc_helper_mode_valid_fixed()
      drm/modes: Add initializer macro DRM_MODE_INIT()
      drm/format-helper: Add drm_fb_build_fourcc_list() helper
      drm/plane: Remove drm_plane_init()
      drm/plane: Allocate planes with drm_universal_plane_alloc()
      drm/plane-helper: Warn if atomic drivers call non-atomic helpers
      drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macro

Tom Rix (1):
      drm/rockchip: remove vop_writel from vop1 driver

Yang Yingliang (1):
      drm/mediatek: dp: change mtk_dp_driver to static

wangjianli (1):
      drm/rockchip: vop: fix repeated words in comment

ye xingchen (1):
      drm/omap: dmm_tiler:Remove the print function dev_err()

 .../bindings/display/bridge/chrontel,ch7033.yaml   |  13 -
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |   1 +
 Documentation/gpu/todo.rst                         |  68 ++++
 MAINTAINERS                                        |   1 +
 drivers/acpi/Kconfig                               |   1 +
 drivers/acpi/acpi_video.c                          |  64 ++-
 drivers/acpi/video_detect.c                        | 440 ++++++++++++-----=
----
 drivers/dma-buf/dma-fence.c                        |  22 +-
 drivers/dma-buf/st-dma-fence-chain.c               |   4 +
 drivers/dma-buf/st-dma-fence-unwrap.c              |  22 ++
 drivers/dma-buf/st-dma-fence.c                     |  16 +
 drivers/dma-buf/st-dma-resv.c                      |  10 +
 drivers/gpu/drm/Kconfig                            |  14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   9 +
 .../gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h |   2 -
 drivers/gpu/drm/ast/ast_mode.c                     |  19 +-
 drivers/gpu/drm/ast/ast_tables.h                   |   7 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  15 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   2 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |   6 +-
 drivers/gpu/drm/display/drm_scdc_helper.c          |  13 +
 drivers/gpu/drm/drm_aperture.c                     |  10 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   2 +-
 drivers/gpu/drm/drm_damage_helper.c                |  11 +-
 drivers/gpu/drm/drm_format_helper.c                | 108 +++++
 drivers/gpu/drm/drm_mipi_dbi.c                     |  38 +-
 drivers/gpu/drm/drm_modeset_helper.c               |  68 ++--
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  18 +
 drivers/gpu/drm/drm_plane.c                        |  70 ++--
 drivers/gpu/drm/drm_plane_helper.c                 |  40 ++
 drivers/gpu/drm/drm_probe_helper.c                 |  64 +++
 drivers/gpu/drm/gma500/Kconfig                     |   2 +
 drivers/gpu/drm/gma500/backlight.c                 | 102 +++--
 drivers/gpu/drm/gma500/cdv_device.c                |  50 +--
 drivers/gpu/drm/gma500/gma_display.c               |  19 +-
 drivers/gpu/drm/gma500/gma_display.h               |   2 -
 drivers/gpu/drm/gma500/oaktrail_device.c           |  70 +---
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |   1 -
 drivers/gpu/drm/gma500/opregion.c                  |   6 +-
 drivers/gpu/drm/gma500/power.c                     | 166 ++------
 drivers/gpu/drm/gma500/power.h                     |  18 -
 drivers/gpu/drm/gma500/psb_device.c                |  73 +---
 drivers/gpu/drm/gma500/psb_drv.c                   |  52 +--
 drivers/gpu/drm/gma500/psb_drv.h                   |  25 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |   5 -
 drivers/gpu/drm/gma500/psb_irq.c                   |  30 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |   2 +
 drivers/gpu/drm/i915/display/intel_acpi.c          |  27 ++
 drivers/gpu/drm/i915/display/intel_acpi.h          |   3 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  66 ++--
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |   6 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |  45 +--
 drivers/gpu/drm/nouveau/dispnv04/overlay.c         |  13 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c             |  10 +
 drivers/gpu/drm/nouveau/nouveau_acpi.h             |   4 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  13 +
 drivers/gpu/drm/omapdrm/dss/dispc.c                |   2 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |   3 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   1 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |   7 +
 drivers/gpu/drm/radeon/r600_cs.c                   |   2 -
 drivers/gpu/drm/radeon/radeon.h                    |   3 -
 drivers/gpu/drm/radeon/radeon_encoders.c           |  11 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   7 +
 drivers/gpu/drm/radeon/radeon_mode.h               |   1 -
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  51 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 113 ++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   2 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  24 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |   1 +
 drivers/gpu/drm/scheduler/sched_main.c             |   4 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |   7 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  18 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |  84 ++--
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    | 156 ++++----
 drivers/gpu/drm/tests/drm_damage_helper_test.c     |  89 +++--
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |   8 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   8 +-
 drivers/gpu/drm/tests/drm_format_test.c            | 324 ++++++++-------
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |  55 +--
 drivers/gpu/drm/tests/drm_mm_test.c                | 155 ++++----
 drivers/gpu/drm/tests/drm_plane_helper_test.c      |   4 +-
 drivers/gpu/drm/tests/drm_rect_test.c              |  16 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   9 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |   1 +
 drivers/gpu/drm/tiny/ili9163.c                     |   1 +
 drivers/gpu/drm/tiny/ili9341.c                     |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     |   1 +
 drivers/gpu/drm/tiny/mi0283qt.c                    |   1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   1 +
 drivers/gpu/drm/tiny/repaper.c                     |  26 +-
 drivers/gpu/drm/tiny/simpledrm.c                   | 123 +-----
 drivers/gpu/drm/tiny/st7735r.c                     |   1 +
 drivers/gpu/drm/udl/udl_drv.c                      |  19 +-
 drivers/gpu/drm/udl/udl_drv.h                      |  13 +-
 drivers/gpu/drm/udl/udl_main.c                     |  93 +++--
 drivers/gpu/drm/udl/udl_modeset.c                  |  53 +--
 drivers/gpu/drm/udl/udl_transfer.c                 |  45 +--
 drivers/gpu/drm/vboxvideo/vboxvideo.h              |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 305 +++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  12 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |   1 +
 drivers/platform/x86/Kconfig                       |   1 +
 drivers/platform/x86/acer-wmi.c                    |  66 ----
 drivers/platform/x86/apple-gmux.c                  |   3 -
 drivers/platform/x86/asus-nb-wmi.c                 |  21 -
 drivers/platform/x86/asus-wmi.c                    |  13 -
 drivers/platform/x86/asus-wmi.h                    |   2 -
 drivers/platform/x86/eeepc-wmi.c                   |  25 +-
 drivers/platform/x86/nvidia-wmi-ec-backlight.c     |  82 +---
 drivers/platform/x86/samsung-laptop.c              |  87 ----
 drivers/platform/x86/toshiba_acpi.c                |  16 -
 include/acpi/video.h                               |   9 +-
 include/drm/drm_format_helper.h                    |  11 +-
 include/drm/drm_mipi_dbi.h                         |   2 +
 include/drm/drm_modes.h                            |  45 ++-
 include/drm/drm_plane.h                            |  52 ++-
 include/drm/drm_plane_helper.h                     |  13 +
 include/drm/drm_probe_helper.h                     |   9 +-
 .../platform_data/x86/nvidia-wmi-ec-backlight.h    |  76 ++++
 129 files changed, 2324 insertions(+), 2098 deletions(-)
 create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight=
=2Eh

--zr3hh4wiludvtbko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYy1ivwAKCRDj7w1vZxhR
xevDAQDR9Jx7RJ78ixSSUyiwsrYBLXo1pzGnq2+aDfdaYrkd7wD+K8M2Lodkpz1P
wrJHD8Md6ONwnm0Sb4P+sUYs2bn1TQI=
=YPP1
-----END PGP SIGNATURE-----

--zr3hh4wiludvtbko--
