Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FB60F12F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22010E41D;
	Thu, 27 Oct 2022 07:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1613710E41D;
 Thu, 27 Oct 2022 07:34:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B03472B066D0;
 Thu, 27 Oct 2022 03:34:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 27 Oct 2022 03:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1666856051; x=1666863251; bh=SmHkv6r6RD44L7JCxidQrXOhTOQ9MFVJ9LD
 UD4uhr14=; b=koJAKMKgqRfCQyvHSXrxK2fRBHDJxp7knRmxIEq3IHsiO1ke8Ss
 58xhfvVWDEmHX+iy0zlG+0jdo0i+NUuycqsN9J5uelQccvyqb2NsBD0SWsmvK9XY
 bOD2QWxeUwWVTmeHQkill6s47t9T3Of8nPbP9iu5PvV2lkvTHbZ9HVCfAfN/aQIJ
 /ozuo6dUClAeUbSt6K+7XXFpu8Cxw/b7r+79TNHGDZ6cLsy6Nt4L7iNZxYBhlHQj
 m7iNtk/vAjBkoqPNZBrW6cI3xjfooa0grKH7rE0WLHSH6To1x1533a2WqCYq/FVY
 /7sV9fMbR9RNsmApLb0oW3Exdl5bcC0zEmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666856051; x=
 1666863251; bh=SmHkv6r6RD44L7JCxidQrXOhTOQ9MFVJ9LDUD4uhr14=; b=j
 CGjKYr/grCwJvcGPDvkj2xucPacCEReMza7Zxr6UlMCqm1RdHDHY2Yjg10WzG1yb
 q48bWdNl+I7sM6XlU4jtkqysA5+XU9w2TmxIEiRBdPR5ndOYQJlcGzA4aOvoFZoK
 0YPRksX5p6BU5pa3VdMzaaMhCrWaHtFP49od5tXURuJ5IckBp2CQd2He55dSag3T
 ZslmEptJgiFo+otSkQ1Rp/YPl7W3v+HXr++PPHEZiXD7DIPPDpK7nC4c7fT9FWYJ
 +XXNRQDymKEUh72mhOXt8mznlq4NJj0M6WQdi1dyWS/1QqBhPU0Tpj79Z5o7BZDb
 rikpxgUy5es/Gkf7dAJAg==
X-ME-Sender: <xms:cjRaYwHMpeZFjqUMlJkhmBKF9QoGX1qGeWqECCtEHXsWhKjWTdGJAg>
 <xme:cjRaY5XewmAOn3cz3YNOWxf-Ak2DXBNZA-Xsdtm7J5TSTkcwxWIjg5oVj8hu824vL
 biDLob1YOMYXaniH4A>
X-ME-Received: <xmr:cjRaY6L7rqUO-fvCrj3wctKvJRB-7NuNyF2hIJnTVAcAS1ZNCK_yRRno8_LIUqbZqHEKadFw5Ges2YGPEteIhrzIT8IxPzhPrsYVaJ96RO6YTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdefgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuueeftdeigfejieelgfeifeegheeugeffgeffgeffgfdtuddujeelffekkeek
 geenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:cjRaYyEc0Hsq4Bj_ymYHTMYC9g0voVdm539p0u5KQY_IcI2c22veUA>
 <xmx:cjRaY2VkkXnAcxVGDNpq7SnFmex1aoljrLtXkIMZe_lgGb7x6okVKA>
 <xmx:cjRaY1MZHQdY74UMNqIQJ6O9WPVsYIsfVvOovsZfgrkjFkEPiXqH9g>
 <xmx:czRaY8H6XWBq4tGtugT6Eu73YU0P5f7Jiqs35X_eN_RItoI2fmD52WIyoIg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 03:34:09 -0400 (EDT)
Date: Thu, 27 Oct 2022 09:34:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20221027073407.c2tlaczvzjrnzazi@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="es3jwmivf7ilizkp"
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


--es3jwmivf7ilizkp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-10-27:
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- connector: Send hotplug event on cleanup
- edid: logging/debug improvements
- plane_helper: Improve tests

Driver Changes:
- bridge:
  - it6505: Synchronization improvements
- panel:
  - panel-edp: Add INX N116BGE-EA2 C2 and C4 support.
- nouveau: Fix page-fault handling
- vmwgfx: fb and cursor refactoring, convert to generic hashtable
The following changes since commit 7c99616e3fe7f35fe25bf6f5797267da29b4751e:

  drm: Remove drm_mode_config::fb_base (2022-10-19 21:46:16 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-10-27

for you to fetch changes up to e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7:

  drm/edid: convert to device specific logging (2022-10-26 11:30:45 +0300)

----------------------------------------------------------------
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- connector: Send hotplug event on cleanup
- edid: logging/debug improvements
- plane_helper: Improve tests

Driver Changes:
- bridge:
  - it6505: Synchronization improvements
- panel:
  - panel-edp: Add INX N116BGE-EA2 C2 and C4 support.
- nouveau: Fix page-fault handling
- vmwgfx: fb and cursor refactoring, convert to generic hashtable

----------------------------------------------------------------
Alistair Popple (1):
      nouveau: Fix migrate_to_ram() for faulting page

Colin Ian King (1):
      drm/vc4: Fix spelling mistake "mmaping" -> "mmapping"

Dmitry Osipenko (1):
      drm/client: Switch drm_client_buffer_delete() to unlocked drm_gem_vun=
map

Jani Nikula (16):
      drm/i915/hdmi: do dual mode detect only if connected
      drm/i915/hdmi: stop using connector->override_edid
      drm/amd/display: stop using connector->override_edid
      drm/edid: debug log EDID override set/reset
      drm/edid: abstract debugfs override EDID show better
      drm/edid: rename drm_add_override_edid_modes() to drm_edid_override_c=
onnector_update()
      drm/edid: split drm_edid block count helper
      drm/edid: add function for checking drm_edid validity
      drm/edid: detach debugfs EDID override from EDID property update
      drm/edid/firmware: drop redundant connector_name variable/parameter
      drm/edid/firmware: rename drm_load_edid_firmware() to drm_edid_load_f=
irmware()
      drm/edid: use struct drm_edid for override/firmware EDID
      drm/edid: move edid load declarations to internal header
      drm/edid/firmware: convert to drm device specific logging
      drm/edid: add [CONNECTOR:%d:%s] to debug logging
      drm/edid: convert to device specific logging

Luben Tuikov (1):
      drm/scheduler: Set the FIFO scheduling policy as the default

Maaz Mombasawala (5):
      drm/vmwgfx: Refactor resource manager's hashtable to use linux/hashta=
ble implementation.
      drm/vmwgfx: Remove ttm object hashtable
      drm/vmwgfx: Refactor resource validation hashtable to use linux/hasht=
able implementation.
      drm/vmwgfx: Refactor ttm reference object hashtable to use linux/hash=
table.
      drm/vmwgfx: Remove vmwgfx_hashtab

Martin Krastev (1):
      drm/vmwgfx: Fix frame-size warning in vmw_mksstat_add_ioctl

Michael Banack (4):
      drm/vmwgfx: Clean up cursor mobs
      drm/vmwgfx: Start diffing new mob cursors against old ones
      drm/vmwgfx: Support cursor surfaces with mob cursor
      drm/vmwgfx: Diff cursors when using cmds

Micha=C5=82 Winiarski (2):
      drm/plane_helper: Print actual/expected values on failure
      drm/plane_helper: Split into parameterized test cases

Pin-yen Lin (3):
      drm/bridge: it6505: Initialize AUX channel in it6505_i2c_probe
      drm/bridge: it6505: Setup links in it6505_irq_hpd
      drm/bridge: it6505: Improve synchronization between extcon subsystem

Sean Hong (2):
      drm/panel-edp: Add INX N116BGE-EA2 (HW: C2)
      drm/panel-edp: Add INX N116BGE-EA2 (HW: C4)

Simon Ser (2):
      Revert "drm: hide unregistered connectors from GETCONNECTOR IOCTL"
      drm/connector: send hotplug uevent on connector cleanup

Yang Li (1):
      nouveau/dmem: Remove duplicated include in nouveau_dmem.c

Zack Rusin (8):
      drm/nouveau: Remove unused variable
      drm/vmwgfx: Write the driver id registers
      drm/vmwgfx: Do not allow invalid bpp's for dumb buffers
      drm/vmwgfx: Port the framebuffer code to drm fb helpers
      drm/vmwgfx: Remove explicit and broken vblank handling
      drm/vmwgfx: Add a mksstat counter for cotable resizes
      drm/vmwgfx: Optimize initial sizes of cotables
      drm/vmwgfx: Fix a sparse warning in kernel docs

wangjianli (2):
      gpu/drm: fix repeated words in comments
      gpu/drm: fix repeated words in comments

 Documentation/gpu/todo.rst                        |  11 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 -
 drivers/gpu/drm/bridge/ite-it6505.c               | 106 ++-
 drivers/gpu/drm/drm_client.c                      |   2 +-
 drivers/gpu/drm/drm_connector.c                   |   4 +
 drivers/gpu/drm/drm_crtc_internal.h               |  15 +-
 drivers/gpu/drm/drm_debugfs.c                     |   8 +-
 drivers/gpu/drm/drm_edid.c                        | 346 +++++----
 drivers/gpu/drm/drm_edid_load.c                   | 109 +--
 drivers/gpu/drm/drm_mipi_dsi.c                    |   2 +-
 drivers/gpu/drm/drm_mode_config.c                 |   3 -
 drivers/gpu/drm/drm_probe_helper.c                |   2 +-
 drivers/gpu/drm/drm_rect.c                        |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c         |  20 +-
 drivers/gpu/drm/nouveau/nouveau_display.c         |   1 -
 drivers/gpu/drm/nouveau/nouveau_dmem.c            |   2 +-
 drivers/gpu/drm/panel/panel-edp.c                 |   2 +
 drivers/gpu/drm/scheduler/sched_main.c            |   4 +-
 drivers/gpu/drm/tests/drm_plane_helper_test.c     | 449 +++++++-----
 drivers/gpu/drm/vc4/vc4_bo.c                      |   4 +-
 drivers/gpu/drm/vmwgfx/Kconfig                    |   7 -
 drivers/gpu/drm/vmwgfx/Makefile                   |   4 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c               | 123 ++--
 drivers/gpu/drm/vmwgfx/ttm_object.h               |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c        |  62 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c           |  29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c               | 129 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h               |  49 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c           |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                | 831 ------------------=
----
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c           | 199 ------
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h           |  83 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c               | 653 +++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h               |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c               |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h           |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c               |  59 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c              |  31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c              |  26 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c        |  55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h        |  26 +-
 include/drm/drm_connector.h                       |  16 +-
 include/drm/drm_edid.h                            |  10 +-
 44 files changed, 1272 insertions(+), 2307 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h

--es3jwmivf7ilizkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1o0bwAKCRDj7w1vZxhR
xZAMAP9ltPwCahp4Mn+k7g4sKQ4yUTCig8xHeTJm2KilazhSXwEAi+LCeZvWSC2B
RjJrpRBcNQka0U/x4ETtLlTWPXPWrQg=
=Dzga
-----END PGP SIGNATURE-----

--es3jwmivf7ilizkp--
