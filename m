Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED428BB925
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 18:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51452898C8;
	Mon, 23 Sep 2019 16:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E8898C7;
 Mon, 23 Sep 2019 16:09:49 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7E9B20835;
 Mon, 23 Sep 2019 16:09:48 +0000 (UTC)
Date: Mon, 23 Sep 2019 18:09:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20190923160946.nvaqiw5j7fpcdhc7@gilmour>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569254989;
 bh=BRIEQbJAxZ73ZnjtHrz/XBoTIR9zopbrn2AEd5GjZbw=;
 h=Date:From:To:Cc:Subject:From;
 b=PFS8tkXTc40LHGxuFfjiYSLl9KMF6tX1DAQHrEVTIzaxMoGNPa+X9u617BbHXfMDf
 TZbGIVUxwWUSdgD9RhOJaDqsCN/l8x+sWAmwxTTX7Jf9tA4s3tLyM9D3xpX9Q6pQTA
 PFrXlyZEFpc6PQxywRZxsn8A389Et6npgdgfXlhY=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2123899571=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2123899571==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zyh6t6fkfyyiiaqi"
Content-Disposition: inline


--zyh6t6fkfyyiiaqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here is a new round of drm-misc-next fixes

Maxime

drm-misc-next-fixes-2019-09-23:
 - Multiple panfrost fixes for regulator support and page fault handling
 - Some cleanups and fixes in the self-refresh helpers
 - Some cleanups and fixes in the atomic helpers
The following changes since commit 88537ddbbe4c755e193aa220a306395edf08a4cf:

  drm/mcde: Fix DSI transfers (2019-09-04 22:05:34 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2019-09-23

for you to fetch changes up to 65e51e30d8625c82ddfe405da46124e9bbffaa71:

  drm/panfrost: Prevent race when handling page fault (2019-09-19 11:48:57 -0500)

----------------------------------------------------------------
 - Multiple panfrost fixes for regulator support and page fault handling
 - Some cleanups and fixes in the self-refresh helpers
 - Some cleanups and fixes in the atomic helpers

----------------------------------------------------------------
Daniel Vetter (4):
      drm/kms: Duct-tape for mode object lifetime checks
      drm/atomic: Take the atomic toys away from X
      drm/atomic: Reject FLIP_ASYNC unconditionally
      drm/atomic: Rename crtc_state->pageflip_flags to async_flip

Mark Brown (1):
      drm/panfrost: Fix regulator_get_optional() misuse

Rob Clark (1):
      Revert "drm/bridge: adv7511: Attach to DSI host at probe time"

Sean Paul (2):
      drm: Fix kerneldoc and remove unused struct member in self_refresh helper
      drm: Measure Self Refresh Entry/Exit times to avoid thrashing

Steven Price (2):
      drm/panfrost: Remove NULL checks for regulator
      drm/panfrost: Prevent race when handling page fault

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c      | 12 +---
 drivers/gpu/drm/drm_atomic_helper.c               | 22 ++++++-
 drivers/gpu/drm/drm_atomic_state_helper.c         |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c                 |  3 +-
 drivers/gpu/drm/drm_drv.c                         |  4 +-
 drivers/gpu/drm/drm_ioctl.c                       |  7 ++-
 drivers/gpu/drm/drm_mode_object.c                 |  4 +-
 drivers/gpu/drm/drm_self_refresh_helper.c         | 73 ++++++++++++++++++++---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c           |  4 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c       | 10 ++--
 drivers/gpu/drm/panfrost/panfrost_device.c        |  8 +--
 drivers/gpu/drm/panfrost/panfrost_mmu.c           | 55 +++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c       |  5 +-
 include/drm/drm_crtc.h                            | 10 ++--
 include/drm/drm_self_refresh_helper.h             |  6 +-
 16 files changed, 157 insertions(+), 73 deletions(-)

--zyh6t6fkfyyiiaqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYjuSgAKCRDj7w1vZxhR
xQLCAQDGr/ePMmr4kTv14KhTqNLFs8r1AM69J9PpFCnrHU/cMwD/TZxlfy3eCbQk
a5DD7Pu6JF5KTnQnOgt1poK6jAk89Qg=
=Ttrp
-----END PGP SIGNATURE-----

--zyh6t6fkfyyiiaqi--

--===============2123899571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2123899571==--
