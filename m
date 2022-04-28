Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD4512D5F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D1010EC3A;
	Thu, 28 Apr 2022 07:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3C310EC24;
 Thu, 28 Apr 2022 07:52:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 06CB8320095F;
 Thu, 28 Apr 2022 03:52:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 28 Apr 2022 03:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1651132360; x=1651218760; bh=a1U5PV1cUT5WIckAxzf0rAaQ/YvQ1Ll0Ga9
 uE5JSHEE=; b=n7sEie6LHUWu7dJHfaQe6BwDay/Y8s8+7b/PyAly3Y8acW263nO
 isXtChjE+WlpBr1ZPAXRVIod9TTT8uFivjc+Dutykk0TkCJDgNLfjkgxVnvrMDF1
 rusG2eA6pRbZbgb6KOVZ3QU06dbvqE5AVW1lVdg0yM1TGONd6tEokHBH8Q2MsnPF
 6O97zL3DPXfFVCKWuzEbwvZtdYh0EpdiNM4HKeNpg5DvC5M+AaY6aGcF+lvICLu6
 QUQAqpKpMF6l5hAtN8Qksh9nd6tBwegu8R0EIG6w2wQG75vSpRBev8PLaFWDdha+
 nMHeCT7dzOCad6f46oLP4pHeutlwkZ978ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651132360; x=1651218760; bh=a1U5PV1cUT5WI
 ckAxzf0rAaQ/YvQ1Ll0Ga9uE5JSHEE=; b=Dg8QQSLdSv7qWfcHcU0BoyrW3h8MG
 8DsBuP6naoNf1J14RI+bOFfqRE74OTK6XUao0onnkK/xKzoYDeCSqSl0peeyZ+60
 pObORIRy3qbXY890eZeuxMDjdAwiJRjfvt71L7gmX1OwWybFUdYSU93kDlaxcu36
 zE2rfY+Zw8gf7uVzQgDz/Ovqm/cUT8KrXJe7kd02KJpafTO1oUsi6cVF2EuEW9yp
 HEJbHzPesqAiouJ9YtKE+NdZ71TlwRx+JAZp8udL3eVPWkfP1Y9weJrYKtrGF/1r
 12UhfB0a9CQYFiwpsgxdK+JtyaJ7FzlWZS+iHpZsjJkWAUPouK1lNe0EA==
X-ME-Sender: <xms:x0dqYuJqg_vwbTTvY7RGovih-GFirkhyU5Xp3rCUsoDtIgur5ohM3w>
 <xme:x0dqYmKqSfUJh_E31nErRoJFdsCHQ9HuOq9M611cVqUK2nlJ28WN9fYa4e6wGN4Xy
 D3jjpHHxtiZihx0BsM>
X-ME-Received: <xmr:x0dqYuvvKaV7dMN7iCXsNDov3BXNE7d7HBhl993BJveTG4ghZNoppy92A1xTh7DqLCr0hgAKiEG3nZT0yJ1IDDhcg-0H5j4nSvo84TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:x0dqYja17ztkWf14NxJ86EDqyeDo4PmOSoT1EsT2eIhmz6gw4a-TQg>
 <xmx:x0dqYlZw6v_hHmyNHVYieE7Yaxe1SQT19BmH4x4nhAr-NzGjfLtzBA>
 <xmx:x0dqYvC07TuIq3qTKiHOA7CSyZ6y4ouzFri6XpSy74I0YkJbIb7sYg>
 <xmx:yEdqYiTExYbprE2kOepFFPEbeK72l-M1Ix0ura7dtkyOt4WAZSRyPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 03:52:39 -0400 (EDT)
Date: Thu, 28 Apr 2022 09:52:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20220428075237.yypztjha7hetphcd@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xa7ndygsuvvkdshl"
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


--xa7ndygsuvvkdshl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-04-28:
drm-misc-next for 5.19:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Introduction of display-helper module, and rework of the DP, DSC,
    HDCP, HDMI and SCDC headers
  - doc: Improvements for tiny drivers, link to external resources
  - formats: helper to convert from RGB888 and RGB565 to XRGB8888
  - modes: make width-mm/height-mm check mandatory in of_get_drm_panel_disp=
lay_mode
  - ttm: Convert from kvmalloc_array to kvcalloc

Driver Changes:
  - bridge:
    - analogix_dp: Fix error handling in probe
    - dw_hdmi: Coccinelle fixes
    - it6505: Fix Kconfig dependency on DRM_DP_AUX_BUS
  - panel:
    - new panel: DataImage FG040346DSSWBG04
  - amdgpu: ttm_eu cleanups
  - mxsfb: Rework CRTC mode setting
  - nouveau: Make some variables static
  - sun4i: Drop drm_display_info.is_hdmi caching, support for the
    Allwinner D1
  - vc4: Drop drm_display_info.is_hdmi caching
  - vmwgfx: Fence improvements
The following changes since commit 40d8d4bd06720aed6c1125bab7296c57de4f1157:

  drm/radeon: Use TTM builtin resource manager debugfs code (2022-04-20 21:=
06:02 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-04-28

for you to fetch changes up to e08a99d005588f7f1d0647cdbc3368c98471fa6c:

  drm/format-helper: Add RGB565-to-XRGB8888 conversion (2022-04-27 08:52:06=
 +0200)

----------------------------------------------------------------
drm-misc-next for 5.19:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Introduction of display-helper module, and rework of the DP, DSC,
    HDCP, HDMI and SCDC headers
  - doc: Improvements for tiny drivers, link to external resources
  - formats: helper to convert from RGB888 and RGB565 to XRGB8888
  - modes: make width-mm/height-mm check mandatory in of_get_drm_panel_disp=
lay_mode
  - ttm: Convert from kvmalloc_array to kvcalloc

Driver Changes:
  - bridge:
    - analogix_dp: Fix error handling in probe
    - dw_hdmi: Coccinelle fixes
    - it6505: Fix Kconfig dependency on DRM_DP_AUX_BUS
  - panel:
    - new panel: DataImage FG040346DSSWBG04
  - amdgpu: ttm_eu cleanups
  - mxsfb: Rework CRTC mode setting
  - nouveau: Make some variables static
  - sun4i: Drop drm_display_info.is_hdmi caching, support for the
    Allwinner D1
  - vc4: Drop drm_display_info.is_hdmi caching
  - vmwgfx: Fence improvements

----------------------------------------------------------------
Chia-I Wu (2):
      drm/sched: use DECLARE_EVENT_CLASS
      drm/sched: use __string in tracepoints

Christian K=F6nig (2):
      drm/amdgpu: remove pointless ttm_eu usage from vkms
      drm/amdgpu: remove pointless ttm_eu usage from DM

Chunguang Xu (1):
      drm/tilcdc: fix typos in comment

Colin Ian King (1):
      drm/v3d: Fix null pointer dereference of pointer perfmon

Dmitry Baryshkov (1):
      drm/bridge: tc358762: drop connector field

Guo Zhengkui (1):
      drm/nouveau/devinit/nva3-: fix returnvar.cocci warning

Javier Martinez Canillas (1):
      drm/doc: Add sections about tiny drivers and external refs to intro p=
age

Jernej Skrabec (3):
      sun4i/drm: engine: Add mode_set callback
      sun4i/drm: backend: use mode_set engine callback
      sun4i/drm: sun8i: use mode_set engine callback

Jos=E9 Exp=F3sito (3):
      drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      drm/vc4: hdmi: Remove vc4_hdmi_encoder
      drm/sun4i: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi

Marek Vasut (10):
      dt-bindings: display: simple: Add DataImage FG040346DSSWBG04 compatib=
le string
      drm/panel: simple: Add DataImage FG040346DSSWBG04 panel support
      drm/modes: Make width-mm/height-mm check in of_get_drm_panel_display_=
mode() mandatory
      drm/panel: lvds: Drop now redundant width-mm and height-mm check
      drm/panel: simple: Add missing bus flags for Innolux G070Y2-L01
      drm: mxsfb: Wrap FIFO reset and comments into mxsfb_reset_block()
      drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr=
()
      drm: mxsfb: Factor out mxsfb_set_mode()
      drm: mxsfb: Reorder mxsfb_crtc_mode_set_nofb()
      drm: mxsfb: Obtain bus flags from bridge state

Miaoqian Lin (1):
      drm/bridge: Fix error handling in analogix_dp_probe

Robert Foss (1):
      drm/bridge: Fix it6505 Kconfig DRM_DP_AUX_BUS dependency

Samuel Holland (10):
      dt-bindings: display: Separate clock item lists by compatible
      dt-bindings: display: Add D1 display engine compatibles
      drm/sun4i: hdmi: Use more portable I/O helpers
      drm/sun4i: Allow building the driver on RISC-V
      drm/sun4i: Allow VI layers to be primary planes
      drm/sun4i: csc: Add support for the new MMIO layout
      drm/sun4i: Add support for D1 mixers
      drm/sun4i: Add support for D1 TCON TOP
      drm/sun4i: Add support for D1 TCONs
      drm/sun4i: Add compatible for D1 display engine

Thomas Zimmermann (11):
      drm: Put related statements next to each other in Makefile
      drm: Rename dp/ to display/
      drm/display: Introduce a DRM display-helper module
      drm/display: Split DisplayPort header into core and helper
      drm/display: Move DSC header and helpers into display-helper module
      drm/display: Move HDCP helpers into display-helper module
      drm/display: Move HDMI helpers into display-helper module
      drm/display: Move SCDC helpers into display-helper library
      drm/format-helper: Print warning on missing format conversion
      drm/format-helper: Add RGB888-to-XRGB8888 conversion
      drm/format-helper: Add RGB565-to-XRGB8888 conversion

Tom Rix (4):
      drm/nouveau/gsp: change gv100_gsp from global to static
      drm/nouveau/kms/gv100: use static for gv100_disp_core_mthd_[base|sor]
      drm/nouveau/disp/gv100: make gv100_disp_wimm static
      drm/nouveau/disp/gv100: make gv100_disp_wndw and gv100_disp_wndw_mthd=
 static

Uwe Kleine-K=F6nig (1):
      drm/ssd130x: Make ssd130x_remove() return void

Yang Wang (1):
      drm/ttm: use kvcalloc() instead of kvmalloc_array() in ttm_tt v2

Zack Rusin (1):
      drm/vmwgfx: Reserve fence slots on buffer objects in cotables

kernel test robot (1):
      drm: bridge: dw_hdmi: Audio: fix returnvar.cocci warnings

 .../allwinner,sun4i-a10-display-engine.yaml        |   1 +
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml |   2 +
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml    |   2 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml      | 133 ++--
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/gpu/drm-kms-helpers.rst              |  43 +-
 Documentation/gpu/introduction.rst                 |  60 ++
 drivers/gpu/drm/Kconfig                            |  40 +-
 drivers/gpu/drm/Makefile                           |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  32 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   3 +-
 drivers/gpu/drm/amd/display/Kconfig                |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  37 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   4 +-
 drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h    |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |   2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   2 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |   4 +-
 drivers/gpu/drm/bridge/Kconfig                     |  17 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |  10 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   2 +-
 .../gpu/drm/bridge/analogix/analogix-i2c-dptx.c    |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  18 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   6 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |   4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |   2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |   2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   4 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   4 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   4 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   1 -
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +-
 drivers/gpu/drm/display/Kconfig                    |  49 ++
 drivers/gpu/drm/display/Makefile                   |  16 +
 .../drm_display_helper_mod.c}                      |  10 +-
 drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_bus.c   |   4 +-
 drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_dev.c   |   4 +-
 drivers/gpu/drm/{dp =3D> display}/drm_dp_cec.c       |   2 +-
 .../drm/{dp =3D> display}/drm_dp_dual_mode_helper.c  |   2 +-
 .../drm/{dp/drm_dp.c =3D> display/drm_dp_helper.c}   |   4 +-
 .../drm/{dp =3D> display}/drm_dp_helper_internal.h   |   0
 .../gpu/drm/{dp =3D> display}/drm_dp_mst_topology.c  |   2 +-
 .../{dp =3D> display}/drm_dp_mst_topology_internal.h |   2 +-
 .../drm/{drm_dsc.c =3D> display/drm_dsc_helper.c}    |   5 +-
 .../drm/{drm_hdcp.c =3D> display/drm_hdcp_helper.c}  |   4 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          | 199 ++++++
 drivers/gpu/drm/{ =3D> display}/drm_scdc_helper.c    |   3 +-
 drivers/gpu/drm/dp/Makefile                        |   9 -
 drivers/gpu/drm/drm_connector.c                    |  34 -
 drivers/gpu/drm/drm_edid.c                         | 160 -----
 drivers/gpu/drm/drm_format_helper.c                |  95 +++
 drivers/gpu/drm/drm_mipi_dsi.c                     |   6 +-
 drivers/gpu/drm/drm_modes.c                        |   8 +-
 drivers/gpu/drm/exynos/Kconfig                     |   3 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   2 +-
 drivers/gpu/drm/gma500/intel_bios.c                |   3 +-
 drivers/gpu/drm/i915/Kconfig                       |   5 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   1 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   6 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   6 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   5 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   1 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   2 +
 drivers/gpu/drm/msm/Kconfig                        |   3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   3 +-
 drivers/gpu/drm/msm/edp/edp.h                      |   3 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |   3 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  | 180 ++---
 drivers/gpu/drm/nouveau/Kconfig                    |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |   2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |   6 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/coregv100.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c   |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c    |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c    |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |   3 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   4 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |  12 -
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   4 +-
 drivers/gpu/drm/panel/panel-simple.c               |  29 +
 drivers/gpu/drm/radeon/atombios_dp.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |   2 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |   4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |   2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   2 +-
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |  43 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |   4 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |   4 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   4 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |   2 +-
 drivers/gpu/drm/sun4i/Kconfig                      |   2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  40 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi.h                 |   1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   6 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c             |   4 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   8 +
 drivers/gpu/drm/sun4i/sun8i_csc.c                  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |   1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  74 ++-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |  14 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |  15 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |  30 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   6 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h               |  27 +
 drivers/gpu/drm/tegra/Kconfig                      |   4 +-
 drivers/gpu/drm/tegra/dp.c                         |   2 +-
 drivers/gpu/drm/tegra/dpaux.c                      |   4 +-
 drivers/gpu/drm/tegra/sor.c                        |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  16 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   3 +-
 drivers/gpu/drm/vc4/Kconfig                        |   2 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  45 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |   4 +
 drivers/gpu/drm/xlnx/Kconfig                       |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   2 +-
 drivers/misc/mei/hdcp/mei_hdcp.h                   |   2 +-
 .../drm/{dp/drm_dp_helper.h =3D> display/drm_dp.h}   | 698 +--------------=
-----
 include/drm/{dp =3D> display}/drm_dp_aux_bus.h       |   0
 .../drm/{dp =3D> display}/drm_dp_dual_mode_helper.h  |   0
 include/drm/display/drm_dp_helper.h                | 722 +++++++++++++++++=
++++
 include/drm/{dp =3D> display}/drm_dp_mst_helper.h    |   2 +-
 include/drm/{ =3D> display}/drm_dsc.h                |   8 +-
 include/drm/display/drm_dsc_helper.h               |  20 +
 include/drm/{ =3D> display}/drm_hdcp.h               |  14 +-
 include/drm/display/drm_hdcp_helper.h              |  22 +
 include/drm/display/drm_hdmi_helper.h              |  27 +
 .../drm/{drm_scdc_helper.h =3D> display/drm_scdc.h}  |  52 +-
 include/drm/display/drm_scdc_helper.h              |  79 +++
 include/drm/drm_connector.h                        |   3 -
 include/drm/drm_edid.h                             |  12 -
 include/drm/i915_mei_hdcp_interface.h              |   2 +-
 172 files changed, 2027 insertions(+), 1544 deletions(-)
 create mode 100644 drivers/gpu/drm/display/Kconfig
 create mode 100644 drivers/gpu/drm/display/Makefile
 rename drivers/gpu/drm/{dp/drm_dp_helper_mod.c =3D> display/drm_display_he=
lper_mod.c} (51%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_bus.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_dev.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_cec.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_dual_mode_helper.c (99%)
 rename drivers/gpu/drm/{dp/drm_dp.c =3D> display/drm_dp_helper.c} (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_helper_internal.h (100%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_mst_topology.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_mst_topology_internal.h (9=
4%)
 rename drivers/gpu/drm/{drm_dsc.c =3D> display/drm_dsc_helper.c} (99%)
 rename drivers/gpu/drm/{drm_hdcp.c =3D> display/drm_hdcp_helper.c} (99%)
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_helper.c
 rename drivers/gpu/drm/{ =3D> display}/drm_scdc_helper.c (99%)
 delete mode 100644 drivers/gpu/drm/dp/Makefile
 rename include/drm/{dp/drm_dp_helper.h =3D> display/drm_dp.h} (74%)
 rename include/drm/{dp =3D> display}/drm_dp_aux_bus.h (100%)
 rename include/drm/{dp =3D> display}/drm_dp_dual_mode_helper.h (100%)
 create mode 100644 include/drm/display/drm_dp_helper.h
 rename include/drm/{dp =3D> display}/drm_dp_mst_helper.h (99%)
 rename include/drm/{ =3D> display}/drm_dsc.h (97%)
 create mode 100644 include/drm/display/drm_dsc_helper.h
 rename include/drm/{ =3D> display}/drm_hdcp.h (95%)
 create mode 100644 include/drm/display/drm_hdcp_helper.h
 create mode 100644 include/drm/display/drm_hdmi_helper.h
 rename include/drm/{drm_scdc_helper.h =3D> display/drm_scdc.h} (65%)
 create mode 100644 include/drm/display/drm_scdc_helper.h

--xa7ndygsuvvkdshl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmpHxQAKCRDj7w1vZxhR
xUaUAQCMm/SO9cgFN3AyzFE6xSFA0Nyd0Or1PpYUxNeuM+86pAD9HRGQG6you4VF
jz2A7iCsUbmzKGnzsg5xDtMrgf9qhAg=
=68CH
-----END PGP SIGNATURE-----

--xa7ndygsuvvkdshl--
