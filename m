Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 579EF25D1D6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7D6EA8B;
	Fri,  4 Sep 2020 07:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5EF6E1F3;
 Thu,  3 Sep 2020 16:07:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0215DBC0;
 Thu,  3 Sep 2020 12:06:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 12:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=CDJxcejXbveVT7ieC7JLDFXzefOPZK7N4V/DE/RQ60E=; b=Prel7R0m
 7gFfX5FKLu2mZXWBBQ46953f/60UKt20cPPVJ3fDRrrvk0kfHBc4kQjgHi6tCXpJ
 9MOWm9Gz/12cz9zaKW+AXhZpfbjLO5w/xeZGZsHKLjJ2Mp6pO29+oXUnwYiCOhZX
 XgxIDV4pdQi8LqYMYczcllokeDypngzD45HuP6BVzzGZBcIi9/9UzRVY760pCPZy
 2JnkrBmiv3ZKw3UosH058UvlGzYjPVhbirapsVOkkcMUCH8Hc7TVJTsnTMhKfwT+
 xWvj/JGJraQJAixu+DQh5B/wLN9e5saqYDorBlmU4Kqrehani66gP5bjaVMT69Pe
 IZffBtczzv0Nsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=CDJxcejXbveVT7ieC7JLDFXzefOPZ
 K7N4V/DE/RQ60E=; b=fgodJSYpK+ujflHg9KkhlDPcYtxQ5CFIyabYcBb7Bmv2j
 nQoK6fu/Ulgg9aSTIFHJNZJW60hEvOLjjrF48AKFyO6zE5uvXxQ7sxUcIWM7lt7W
 ABhlS8BFERGByJb6QQopMFdkZ5MvEL3W6IXDA15zuEiMWPszFkTPYeHCbRP4aNeo
 PfJ8PemYDPxeHqmJM4jSbRJ9U/Ia5GlrIAhAVhtiDxN2zOrY2uQo+JSFxOuyIjYH
 3L8ZYkPkxSEMS1T7vIW0AwdUF6pTkr2KBZrRi0ryNkfBQ3gVrNA0WQpufiHe0laI
 CHoXY2eoCZ/Z676EIHlTXmdbkdGSpj86pTgp65A2g==
X-ME-Sender: <xms:oRRRX3aZaok27IoH7vpukzlLxD45vRh-2cAZpAqW1fBe0PrNylviAw>
 <xme:oRRRX2Z3AV1KndAPoqcSdJsO12foFXzsm_e59ugr9LpXlGhv3Kw9UzG8MVwksk0z_
 zWsMvWfSR7bCVTokN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oRRRX5_STWj7GJguPZuf_K6uKWAenrgo-FORv8UtyTYaAe34B7q0Jw>
 <xmx:oRRRX9rz1KU4sMmTxQEBtWceY0h-9ueEWpCNs4Z5W5NyEUUwI6AP9g>
 <xmx:oRRRXyp0_QPFHarRL6MXqBliMqlcrZPhEJrm6UgctgMPCgwU_2Vvfg>
 <xmx:ohRRX-egIl8r_R0X8c1qr7d4Pp5VSZUCMF6mZ11mzsZChZgPkZrKb1Qfr84>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5D893280067;
 Thu,  3 Sep 2020 12:06:56 -0400 (EDT)
Date: Thu, 3 Sep 2020 18:06:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200903160653.sulxo6x4lumump6x@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Content-Type: multipart/mixed; boundary="===============0522406278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0522406278==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ajxofjxazu4662dx"
Content-Disposition: inline


--ajxofjxazu4662dx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week PR for drm-misc-next

Thanks!
Maxime

drm-misc-next-2020-09-03:
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - doc: update the doc to encourage drivers to use devm_drm_dev_alloc
  - ttm: More reworks / cleanups

Driver Changes:
  - sun4i: Minor fix in the LVDS encoder
  - panels: New panel: AM-1280800N3TZQW-T00H
The following changes since commit cd6da0b113512b15a4d35f355f9ecd8858297369:

  drm/mgag200: fix spelling mistake "expeced" -> "expected" (2020-08-27 11:=
17:52 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-09-03

for you to fetch changes up to 4c8e84b8876dc726a7e5327b3113d75423c46728:

  drm/managed: Cleanup of unused functions and polishing docs (2020-09-03 1=
6:25:06 +0200)

----------------------------------------------------------------
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - doc: update the doc to encourage drivers to use devm_drm_dev_alloc
  - ttm: More reworks / cleanups

Driver Changes:
  - sun4i: Minor fix in the LVDS encoder
  - panels: New panel: AM-1280800N3TZQW-T00H

----------------------------------------------------------------
Christian K=F6nig (3):
      drm/ttm: make sure that we always zero init mem.bus v2
      drm/nouveau: move io_reserve_lru handling into the driver v5
      drm/ttm: remove io_reserve_lru handling v3

Daniel Vetter (1):
      drm/managed: Cleanup of unused functions and polishing docs

Dave Airlie (2):
      drm/amdgpu/ttm: remove unused parameter to move blit
      drm/radeon/ttm: don't store driver copy of device pointer.

Dinghao Liu (1):
      drm/crc-debugfs: Fix memleak in crc_control_write

Gerd Hoffmann (2):
      drm/virtio: fix unblank
      drm/virtio: drop virtio_gpu_output->enabled

Jagan Teki (2):
      dt-bindings: display: simple: Add AM-1280800N3TZQW-T00H
      drm/panel: simple: Add AM-1280800N3TZQW-T00H

Laurent Pinchart (1):
      drm: panel: Fix bpc for OrtusTech COM43H4M85ULC panel

Maxime Ripard (1):
      drm/sun4i: lvds: Invert the LVDS polarity

Melissa Wen (1):
      drm/vkms: add alpha-premultiplied color blending

Randy Dunlap (3):
      drm: virtio: fix kconfig dependency warning
      dma-buf: fix kernel-doc warning in dma-fence.c
      dma-buf: fix kernel-doc warning in <linux/dma-buf.h>

Rikard Falkeborn (1):
      drm/gma500: Constify static structs

Robert Chiras (1):
      drm/panel: rm67191: Remove CLOCK_NON_CONTINUOUS flag

Sam McNally (1):
      drm/dp_mst: Support remote i2c writes

Sidong Yang (1):
      drm/vkms: avoid warning in vkms_get_vblank_timestamp

Tian Tao (1):
      drm/hisilicon: Removed the dependency on the mmu

Ville Syrj=E4l=E4 (2):
      drm: Nuke mode->private_flags
      drm: Replace mode->export_head with a boolean

Vinod Koul (1):
      drm/bridge: Fix the dsi remote end-points

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/driver-api/driver-model/devres.rst   |   2 +-
 drivers/dma-buf/dma-fence.c                        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   8 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/drm_connector.c                    |  45 +++++---
 drivers/gpu/drm/drm_debugfs_crc.c                  |   4 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              | 106 +++++++++++++++---
 drivers/gpu/drm/drm_drv.c                          |  78 ++++---------
 drivers/gpu/drm/drm_managed.c                      |   2 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   6 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               | 101 +++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   3 +
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   2 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |  44 +++++++-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   3 +-
 drivers/gpu/drm/panel/panel-simple.c               |  31 +++++-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   8 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  43 +++-----
 drivers/gpu/drm/ttm/ttm_bo_util.c                  | 121 ++---------------=
----
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  39 ++-----
 drivers/gpu/drm/ttm/ttm_resource.c                 |   3 -
 drivers/gpu/drm/virtio/Kconfig                     |   2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |  15 ++-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   6 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |  55 +++++++---
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   5 +
 include/drm/drm_device.h                           |   2 +-
 include/drm/drm_drv.h                              |  16 +--
 include/drm/drm_modes.h                            |  26 ++---
 include/drm/ttm/ttm_bo_api.h                       |   1 -
 include/drm/ttm/ttm_bo_driver.h                    |   5 -
 include/drm/ttm/ttm_resource.h                     |  16 ---
 include/linux/dma-buf.h                            |   3 +-
 37 files changed, 436 insertions(+), 380 deletions(-)

--ajxofjxazu4662dx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1EUnQAKCRDj7w1vZxhR
xR3cAP4zy7Lj6Qk79V4mwxtzr12b9G5gRCLRS6wGFwcfRDRZEQEAozj02mZoNPR4
jC/Qk9sP4My0ynEOTVWwjNjL1cpJbQY=
=klB7
-----END PGP SIGNATURE-----

--ajxofjxazu4662dx--

--===============0522406278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0522406278==--
