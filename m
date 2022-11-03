Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9386D6178C4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9E10E24E;
	Thu,  3 Nov 2022 08:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBB210E1AB;
 Thu,  3 Nov 2022 08:34:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id E8C002B06799;
 Thu,  3 Nov 2022 04:34:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 03 Nov 2022 04:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1667464480; x=1667471680; bh=pqVTo4hzoQ97GzENpjucz/tkJsen+KtlWOC
 rPQve2Mw=; b=cXIwevvn8gckJaipd87vPAY1X48PCPClrc3cZ49rEX0vGq04ETj
 Qd9W2RQQ4ToJSxEPbiwLQPwsotUEeYvkHlJDgcTPOPBKLYiaeJDZoFBiPpmXQCQB
 1xXiuvfiP8Pd8TOlqxSsx6b3so8B6w2ZFnklMS8O8kqX5vIvSa+yqkRo9AZkM1yw
 8l3PEmEu4WgXMgr6/evMH7JlUTfuJE6uWu1oioy4h1Ey8KJoSfJYIGt8X7q9HHes
 3bUrP7vLzuqk1h1KiInpO3ql5BK7YbNK1FHQAohOvLM/yOpZLdmz5obG7IFOnbgw
 6PSNjeBwgln7N9YLvZ37glBnAD5lqD+VdyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667464480; x=
 1667471680; bh=pqVTo4hzoQ97GzENpjucz/tkJsen+KtlWOCrPQve2Mw=; b=u
 Pczg58a4AGdSdyAxvvzshkgnGflitZ4k9GwWK9bWkkQF9Rt7D0GOy/XqPpzVM0as
 qOQSlENivXw1LwmWXh4QeGmpxmWmz0gLHqRpMhSi3C0NOYlxXfHapTpT5nZ98Qk5
 3QpCdEQhS6FYuEWF9kLmuxeYqSFeF4eSytF1gM5e7W+1jSAy8Pvt1bH7tvfs56l9
 pb184vIoLi7Kdf1X59KUDuSQa5YmupziHrgnzw+kbQQc1QQVYh7rkq9ThzbXvlCg
 CgBx52rQ5L922q6s3I+wByMF52TkwBV8culOIsllJ/qcgnSn4QUHIyeGp+852ETf
 S4ClIn5l4CK7JAnt4E33w==
X-ME-Sender: <xms:H31jYyVqJlZ7HQ-74cnFckyBfPsATsXW9AaGy0UXaMTTs2t-XaaY2g>
 <xme:H31jY-mLymllkJT1c_IrI0huisL5kOBcdp8pdn7C8EoP3Gul_sV5Blvua-odjqROh
 lzP0bsI2cPE7jS4qxM>
X-ME-Received: <xmr:H31jY2ZAHQWtddE_n59D1WQAZwUgNXFOjBv_EGpxAjM9Eopo2SZwi6TKzFE8QT5oeaCBcAyJztiz3Dm9pLU9Io8IZm8-Le5xt8xA0zF95zIOXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudekgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:H31jY5V7O4wE7cwps6YiDOBG9boNHs2UTUxbV7J9gL9W5kI1Al5_vg>
 <xmx:H31jY8lA-4UA3Fr_iqopJ_OYfWG4tFIQ052-5HsHOCc-YuaRZDh97A>
 <xmx:H31jY-fHYVBYOv2Trjvcfh3oi5ARkjybhaNVsReOB67Z3jytXruvWA>
 <xmx:IH1jY-V63GsMrMh23pFxK2NY8MNbTabHlFOG4pqaoRN732BNa7IOeMPh7qs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Nov 2022 04:34:39 -0400 (EDT)
Date: Thu, 3 Nov 2022 09:34:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20221103083437.ksrh3hcdvxaof62l@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mfjagy64ucdkwdmz"
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


--mfjagy64ucdkwdmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-11-03:
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:
- dma-buf: locking improvements
- firmware: New API in the RaspberryPi firmware driver used by vc4

Core Changes:
- client: Null pointer dereference fix in drm_client_buffer_delete()
- mm/buddy: Add back random seed log
- ttm: Convert ttm_resource to use size_t for its size, fix for an
  undefined behaviour

Driver Changes:
- bridge:
  - adv7511: use dev_err_probe
  - it6505: Fix return value check of pm_runtime_get_sync
- panel:
  - sitronix: Fixes and clean-ups
- lcdif: Increase DMA burst size
- rockchip: runtime_pm improvements
- vc4: Fix for a regression preventing the use of 4k @ 60Hz, and
  further HDMI rate constraints check.
- vmwgfx: Cursor improvements
The following changes since commit e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7:

  drm/edid: convert to device specific logging (2022-10-26 11:30:45 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-11-03

for you to fetch changes up to ce28ab1380e823e0afdff06a59a04375ef9d9a29:

  drm/tests: Add back seed value information (2022-11-02 09:22:47 -0300)

----------------------------------------------------------------
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:
- dma-buf: locking improvements
- firmware: New API in the RaspberryPi firmware driver used by vc4

Core Changes:
- client: Null pointer dereference fix in drm_client_buffer_delete()
- mm/buddy: Add back random seed log
- ttm: Convert ttm_resource to use size_t for its size, fix for an
  undefined behaviour

Driver Changes:
- bridge:
  - adv7511: use dev_err_probe
  - it6505: Fix return value check of pm_runtime_get_sync
- panel:
  - sitronix: Fixes and clean-ups
- lcdif: Increase DMA burst size
- rockchip: runtime_pm improvements
- vc4: Fix for a regression preventing the use of 4k @ 60Hz, and
  further HDMI rate constraints check.
- vmwgfx: Cursor improvements

----------------------------------------------------------------
Ahmad Fatoum (1):
      drm: bridge: adv7511: use dev_err_probe in probe function

Arthur Grillo (1):
      drm/tests: Add back seed value information

Dmitry Osipenko (2):
      dma-buf: Make locking consistent in dma_buf_detach()
      drm/client: Prevent NULL dereference in drm_client_buffer_delete()

Dom Cobley (1):
      drm/vc4: hdmi: Add more checks for 4k resolutions

Gaosheng Cui (1):
      drm/ttm: fix undefined behavior in bit shift for TTM_TT_FLAG_PRIV_POPULATED

Jiapeng Chong (1):
      drm/rockchip: dsi: Remove the unused function dsi_update_bits()

Johan Jonker (1):
      drm: rockchip: remove rockchip_drm_framebuffer_init() function

Marco Felsch (1):
      drm: lcdif: change burst size to 256B

Marek Vasut (3):
      drm/panel/panel-sitronix-st7701: Fix RTNI calculation
      drm/panel/panel-sitronix-st7701: Clean up CMDnBKx selection
      drm/panel/panel-sitronix-st7701: Remove panel on DSI attach failure

Maxime Ripard (6):
      firmware: raspberrypi: Introduce rpi_firmware_find_node()
      firmware: raspberrypi: Move the clock IDs to the firmware header
      firmware: raspberrypi: Provide a helper to query a clock max rate
      drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
      drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
      drm/vc4: Make sure we don't end up with a core clock too high

Pin-yen Lin (1):
      drm/bridge: it6505: Fix return value check for pm_runtime_get_sync

Sascha Hauer (1):
      drm/rockchip: vop2: Register Esmart0-win0 as primary plane

Somalapuram Amaranath (1):
      drm/ttm: rework on ttm_resource to use size_t type

Yuan Can (1):
      drm/rockchip: use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()

Zack Rusin (2):
      drm/vmwgfx: Validate the box size for the snooped cursor
      drm/vmwgfx: Cleanup the cursor snooping code

Zhang Qilong (1):
      drm/rockchip: lvds: fix PM usage counter unbalance in poweron

 drivers/clk/bcm/clk-raspberrypi.c               | 19 -------
 drivers/dma-buf/dma-buf.c                       |  4 +-
 drivers/firmware/raspberrypi.c                  | 38 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c         |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    |  8 +--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    |  6 +--
 drivers/gpu/drm/bridge/adv7511/adv7533.c        | 20 +++----
 drivers/gpu/drm/bridge/ite-it6505.c             |  2 +-
 drivers/gpu/drm/drm_client.c                    |  6 +--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c         |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c         |  4 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 12 ++---
 drivers/gpu/drm/i915/intel_region_ttm.c         |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c               | 14 ++++-
 drivers/gpu/drm/mxsfb/lcdif_regs.h              |  4 ++
 drivers/gpu/drm/nouveau/nouveau_bo.c            |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c           |  5 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c           |  4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c           |  2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c   | 70 ++++++++++++-------------
 drivers/gpu/drm/radeon/radeon_cs.c              |  7 ++-
 drivers/gpu/drm/radeon/radeon_object.c          |  4 +-
 drivers/gpu/drm/radeon/radeon_trace.h           |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c             |  4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c |  8 +--
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c      | 43 ---------------
 drivers/gpu/drm/rockchip/rockchip_drm_fb.h      |  6 ---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c    |  2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c        | 10 ++--
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c    |  2 +-
 drivers/gpu/drm/tests/drm_buddy_test.c          |  6 ++-
 drivers/gpu/drm/tests/drm_mm_test.c             |  8 ++-
 drivers/gpu/drm/ttm/ttm_bo.c                    |  3 --
 drivers/gpu/drm/ttm/ttm_bo_util.c               |  6 +--
 drivers/gpu/drm/ttm/ttm_bo_vm.c                 |  4 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c         |  2 +-
 drivers/gpu/drm/ttm/ttm_resource.c              | 14 +++--
 drivers/gpu/drm/vc4/vc4_drv.h                   | 16 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 25 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |  8 ---
 drivers/gpu/drm/vc4/vc4_hvs.c                   | 26 +++++++++
 drivers/gpu/drm/vc4/vc4_kms.c                   | 13 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c            |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c              |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h             |  4 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             | 30 ++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c      |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c         | 14 +++--
 include/drm/ttm/ttm_resource.h                  |  4 +-
 include/drm/ttm/ttm_tt.h                        |  2 +-
 include/soc/bcm2835/raspberrypi-firmware.h      | 52 ++++++++++++++++++
 66 files changed, 346 insertions(+), 274 deletions(-)

--mfjagy64ucdkwdmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2N9HQAKCRDj7w1vZxhR
xV7JAQDokAjv/2NlIHCZibU8wjwGr8f7n7/Uz7c4HB4DzT2dpgD5AYPwWGM0yARI
d1EUnP0JWRnqp1yGIeoVZFc6t0fnEQU=
=6UX7
-----END PGP SIGNATURE-----

--mfjagy64ucdkwdmz--
