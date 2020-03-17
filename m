Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3690188737
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635116E5A3;
	Tue, 17 Mar 2020 14:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3475589310;
 Tue, 17 Mar 2020 08:29:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 448B686E;
 Tue, 17 Mar 2020 04:29:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Mar 2020 04:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=A/r55f9vw75nOJb3+TMh+RejHlYZQpzETDXC5v+6ADU=; b=zMI4/cfD
 NxcsYeM5pS6NdowUkolRJi2ykXhMnwiXhwJomUdIZcg+ohtCJSkVDPP2x060icIc
 Sg1Ow1Kd3cCEVQnQzDzdOULUhu3b2JRthfIy2CJAKGUInxx+t/VTZ/k8hgCw66YV
 tHfaaE7xUkqf/sY3etO0Psr550bWoTEbOGwb6zCF+ZQ4jOXM3oW9CDxrUHWpN/8U
 LNkaDH7yte2NrJMlRJ5h/O9ZbFk+Mgg0nh/4s6E1ZGCHEcpAKNjR1MyNN63zLzqS
 5cqVlYuEUYRv0Mtzk8T0AhgCFE0Qbpb3iFkUoT2vMqE74UAxL5oO7Sm7tpkk1X4X
 eolYhFFLdNivUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=A/r55f9vw75nOJb3+TMh+RejHlYZQ
 pzETDXC5v+6ADU=; b=2aKx+axcuoRtU0VklKwfXkDcmGQVDnRORWYWPNeXCrBIi
 sQhwh6k+x4N3uGCXksTRLQvYcJQm/p4Ql7b8xeLE7dGc8PpPAmh2ujMHRxtYgod+
 aCXJ6eMLcuU9oFAhM4fqN3w61zly/boKZETE/zpyu6olMseH/XOrSv69/VgfjIAe
 R26oCz/YkH23Hc10M5y1werYfi8FD2061ytRd3vSnG/8D0ev6d5z5C8L3CE49v8z
 hl3BNnMoOrH5Dqr8X82WEcEkNGwIAonDxCUCmPPESyUoXKo5Da6KrFsCdfzDZRgC
 P3hRNZ3RvcYN7uFSlNb8V9ZEcjeOKuUPlDZXNcEdg==
X-ME-Sender: <xms:S4pwXuCe9H7h56Vg0GWiq5eKSjNhuWwFx0ciaPk7QSHGPM3FArSfyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S4pwXvxRPk1k40CYdDs95XFBfT8mTLujTECexGs0AXuVURaXL8Ox2w>
 <xmx:S4pwXhEV4SnoAe4_M4XCjhA-rzXijJ2a6j_xvbYtPqfzB25UwT0XVg>
 <xmx:S4pwXl7G0EOVN5k64ji35xnC666MuReAHNDt4iQluVZG2M36Bx9dFw>
 <xmx:TIpwXngKxYdfNst44OrHTzpC4dHDWN5fkI1sWLvdqh0DA7xHM9PZhnWDNro>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA6BE306215A;
 Tue, 17 Mar 2020 04:28:59 -0400 (EDT)
Date: Tue, 17 Mar 2020 09:28:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200317082858.lubmvlmvoprn2tuh@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1729017619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1729017619==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tls76me3rybwbj55"
Content-Disposition: inline


--tls76me3rybwbj55
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here is what should be the final drm-misc-next PR for 5.7.

Maxime

drm-misc-next-2020-03-17:
drm-misc-next for 5.7:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - dp-mst: Remove register_connector callback, add drm_dp_destroy_connector
  - Changes to scnprintf on multiple instances

Driver Changes:
  - meson: Support for YUV420
  - panel: Support Ortustech COM37H3M, idk-1110wr and idk-2121wr,
           multiple dotclock fixes
The following changes since commit bc1a4130fc0309cc2f43b9cc616ebbc295e886ff:

  drm/virtio: add case for shmem objects in virtio_gpu_cleanup_object(..) (=
2020-03-09 10:44:34 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-03-17

for you to fetch changes up to 6afe6929964bca6847986d0507a555a041f07753:

  drm: Mark up racy check of drm_gem_object.handle_count (2020-03-16 10:31:=
35 +0000)

----------------------------------------------------------------
drm-misc-next for 5.7:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - dp-mst: Remove register_connector callback, add drm_dp_destroy_connector
  - Changes to scnprintf on multiple instances

Driver Changes:
  - meson: Support for YUV420
  - panel: Support Ortustech COM37H3M, idk-1110wr and idk-2121wr,
           multiple dotclock fixes

----------------------------------------------------------------
Akeem G Abodunrin (1):
      drm/mm: Remove redundant assignment in drm_mm_reserve_node

Benjamin Gaignard (4):
      drm: context: Clean up documentation
      drm: vm: Clean up documentation
      drm: bufs: Clean up documentation
      drm: lock: Clean up documentation

Chris Wilson (2):
      drm/mm: Allow drm_mm_initialized() to be used outside of the locks
      drm: Mark up racy check of drm_gem_object.handle_count

Christian K=F6nig (1):
      drm/ttm: fix false positive assert

Fabrizio Castro (2):
      dt-bindings: display: Add idk-2121wr binding
      dt-bindings: display: Add idk-1110wr binding

H. Nikolaus Schaller (1):
      drm/panel-simple: Fix dotclock for Ortustech COM37H3M

Heiko Stuebner (1):
      drm/rockchip: rgb: don't count non-existent devices when determining =
subdrivers

Jonas Karlman (2):
      drm/bridge: dw-hdmi: set mtmdsclock for deep color
      drm/bridge: dw-hdmi: add max bpc connector property

Kamlesh Gurudasani (1):
      drm/tiny: fix sparse warning: incorrect type in assignment (different=
 base types)

Kees Cook (1):
      drm/edid: Distribute switch variables for initialization

Laurent Pinchart (1):
      drm: panel: Set connector type for OrtusTech COM43H4M85ULC panel

Lyude Paul (3):
      drm/dp_mst: Make drm_dp_mst_dpcd_write() consistent with drm_dp_dpcd_=
write()
      drm/dp_mst: Fix drm_dp_check_mstb_guid() return code
      drm/dp_mst: Convert drm_dp_mst_topology_mgr.is_waiting_for_dwn_reply =
to bitfield

Manasi Navare (2):
      drm/edid: Name the detailed monitor range flags
      drm/edid: Add function to parse EDID descriptors for monitor range

Neil Armstrong (9):
      drm/bridge: dw-hdmi: Plug atomic state hooks to the default implement=
ation
      drm/bridge: synopsys: dw-hdmi: add bus format negociation
      drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes for >=3D 0x200a
      drm/meson: venc: make drm_display_mode const
      drm/meson: meson_dw_hdmi: add bridge and switch to drm_bridge_funcs
      drm/meson: dw-hdmi: stop enforcing input_bus_format
      drm/meson: venc: add support for YUV420 setup
      drm/meson: vclk: add support for YUV420 setup
      drm/meson: Add YUV420 output support

Pankaj Bharadiya (5):
      drm: Register connector instead of calling register_connector callback
      drm: Remove dp mst register connector callbacks
      drm/dp_mst: Remove register_connector callback
      drm: Add drm_dp_destroy_connector helper and use it
      drm: Remove drm dp mst destroy_connector callbacks

Sam Ravnborg (1):
      dt-bindings: display: fix panel warnings

Takashi Iwai (2):
      drm/ttm: Use scnprintf() for avoiding potential buffer overflow
      drm: sysfs: Use scnprintf() for avoiding potential buffer overflow

Ville Syrj=E4l=E4 (5):
      drm/panel-novatek-nt35510: Fix dotclock
      drm/panel-ilitek-ili9322: Fix dotclocks
      drm/panel-lg-lg4573: Fix dotclock
      drm/panel-sony-acx424akp: Fix dotclocks
      drm/panel-simple: Fix dotclock for Logic PD Type 28

 .../display/panel/advantech,idk-1110wr.yaml        |  69 +++++
 .../display/panel/advantech,idk-2121wr.yaml        | 122 ++++++++
 .../bindings/display/panel/elida,kd35t133.yaml     |   2 +-
 .../display/panel/leadtek,ltk500hd1829.yaml        |   2 +-
 .../bindings/display/panel/novatek,nt35510.yaml    |   4 +-
 .../bindings/display/panel/orisetech,otm8009a.yaml |   2 +-
 .../bindings/display/panel/panel-dpi.yaml          |   2 +-
 .../bindings/display/panel/panel-simple-dsi.yaml   |   2 +-
 .../bindings/display/panel/raydium,rm68200.yaml    |   2 +-
 .../bindings/display/panel/xinpeng,xpp055c272.yaml |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   6 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 319 +++++++++++++++++=
+++-
 drivers/gpu/drm/drm_bufs.c                         |  20 +-
 drivers/gpu/drm/drm_context.c                      |  28 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  44 ++-
 drivers/gpu/drm/drm_edid.c                         |  47 ++-
 drivers/gpu/drm/drm_gem.c                          |   2 +-
 drivers/gpu/drm/drm_lock.c                         |  11 +-
 drivers/gpu/drm/drm_mm.c                           |   2 +-
 drivers/gpu/drm/drm_sysfs.c                        |   2 +-
 drivers/gpu/drm/drm_vm.c                           |  16 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  16 --
 drivers/gpu/drm/meson/meson_dw_hdmi.c              | 180 +++++++++---
 drivers/gpu/drm/meson/meson_vclk.c                 |  93 ++++--
 drivers/gpu/drm/meson/meson_vclk.h                 |   7 +-
 drivers/gpu/drm/meson/meson_venc.c                 |  10 +-
 drivers/gpu/drm/meson/meson_venc.h                 |   4 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  19 --
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  14 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c            |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               |  15 +-
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |   4 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |  17 --
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   3 +-
 drivers/gpu/drm/tiny/ili9486.c                     |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   5 +-
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c           |   2 +-
 include/drm/bridge/dw_hdmi.h                       |   1 +
 include/drm/drm_connector.h                        |  22 ++
 include/drm/drm_dp_mst_helper.h                    |  11 +-
 include/drm/drm_edid.h                             |   5 +
 include/drm/drm_mm.h                               |   2 +-
 44 files changed, 918 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advante=
ch,idk-1110wr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/advante=
ch,idk-2121wr.yaml

--tls76me3rybwbj55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnCKSgAKCRDj7w1vZxhR
xQCnAP9nYHJJHQTSfrC7mN5XfdjrUOAhKAYR1xhaXrW5HKTSdAEAq0QXIgTXgedd
lJF0Qv+k5Xi17y4PiFupY/NpRgUk4QA=
=V5gh
-----END PGP SIGNATURE-----

--tls76me3rybwbj55--

--===============1729017619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1729017619==--
