Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4255733D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 08:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05691113EC9;
	Thu, 23 Jun 2022 06:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89EE113EC7;
 Thu, 23 Jun 2022 06:41:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E3CBA5C00C4;
 Thu, 23 Jun 2022 02:41:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 02:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1655966515; x=1656052915; bh=df3XzDQPFIi4s7cMzmiD0ku/ARANEqd2Esk
 ifQZCBik=; b=Y6f4zU8n7TnA7HrpAeTXXfPrgfM8gwJuVS7gPtHZIvhX3/rWvno
 SxI9ihOD2LSKmzvEBuM6ebrJlNnOaPWiip3+sF9p7psxhjNKqwOFI69EDgZNkoQd
 y/HdFd2WPc6JhpN96nuIFjCGiifv52flX83yHsEb6aKIzjdqvp/Lu0ZbNd71/G86
 oIir2mFC2YYpPf4c0tXNdK8JN9W2dtpxqf00UJSDo/vJzqcbaUEli+Rcc3Ia68n2
 6fU+RDH7HmvzxhR+3hxsmyZfliffdKZG39eG2pir8D9nw1pqPyhHhqHPJxsx2kyz
 ziN3NeXnuBrFnrkUic99yoVgjtsXX/TxxHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655966515; x=
 1656052915; bh=df3XzDQPFIi4s7cMzmiD0ku/ARANEqd2EskifQZCBik=; b=F
 BEeo/BZHK0Omw+x97EUKoXkdr0BvBtLWxZgM5De/9l8b+BtKbhHoJsQb6ugjJBjI
 hie0zvuU9QR1rtGrEJA5r2vMhck9bSS2ajdacBPDudCqjrfOgKtNW2KmFlbNWDbS
 wzOKWoa1NwIZtOdk+r5duTH6uoyQLbZ0BEoP2T//AE9hEmgp8EAWj3UtIR+WoUAV
 5q7DoBmaatXSN/uxZ2VMcl7PMpxZAK7T5KzsRPEXNtMlPn5ulvmw8MBfnIvGUUaN
 BTl+xbcjF86+gIhe39WGxxM5YYjYTFH5AUEE8ZYvFosGMKMKviF2zTSkJAz5MWNm
 Iaa5RDMsYuCrS+jIYepPg==
X-ME-Sender: <xms:Mwu0YiF0CfgpR1phuQDjG1N3moq5_vt3o0rivZqyQsRkXUVJPOJPWA>
 <xme:Mwu0YjU0vg5xuMr4dQl_X36YnJWcsXkD8OLVytmZwq3DiqgZ2-TBVbai9c2HTqoTl
 NfwwR76at71NuFmsTo>
X-ME-Received: <xmr:Mwu0YsIwIDiP8mDX_-xXUK9n6kZvvk5AvTERyhRV6s27sHWjqGBtaBK7nREt1E5xiw2mvbCK2QE4Pm46VIFVgJoCBx3rHVS0vgfIUtk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefiedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudev
 jeeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:Mwu0YsF6PkXs7Gi49XDQu9P2pLPMU-BqJyWErFToENzYYBZ4MBDhCg>
 <xmx:Mwu0YoVuE2JoFY2QZ8N-sRX_omnU4rCx7sVWyIiS-sID2w7O-4IOug>
 <xmx:Mwu0YvMoFPGRy5OeEklxRasDDBKcaeVfrnSejnZhSJ5XehlJ51zLpQ>
 <xmx:Mwu0YhOsdpJA_YY9m_-dwdhfklKtU6LyW_brSYutEFRyaKIS5ZiyYw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 02:41:54 -0400 (EDT)
Date: Thu, 23 Jun 2022 08:41:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220623064152.ubjmnpj7tdejdcw6@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vfjtikv65jpivvva"
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


--vfjtikv65jpivvva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-06-23:
Multiple fixes in sun4i for suspend, DDC, DMA setup; A rework of vc4 to
properly split the driver between hardware capabilities that wasn't done
properly causing multiple crashes; and a panel quirk for Aya Neo Next
The following changes since commit 0f9cd1ea10d307cad221d6693b648a8956e812b0:

  drm/ttm: fix bulk move handling v2 (2022-06-14 11:15:19 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-06-23

for you to fetch changes up to 85016f66af8506cb601fd4f4fde23ed327a266be:

  drm/sun4i: Return if frontend is not present (2022-06-22 16:42:25 +0200)

----------------------------------------------------------------
Multiple fixes in sun4i for suspend, DDC, DMA setup; A rework of vc4 to
properly split the driver between hardware capabilities that wasn't done
properly causing multiple crashes; and a panel quirk for Aya Neo Next

----------------------------------------------------------------
Dan Carpenter (1):
      drm/vc4: fix error code in vc4_check_tex_size()

Jernej Skrabec (1):
      drm/sun4i: Add DMA mask and segment size

Maxime Ripard (14):
      drm/vc4: plane: Prevent async update if we don't have a dlist
      drm/vc4: Consolidate Hardware Revision Check
      drm/vc4: bo: Rename vc4_dumb_create
      drm/vc4: bo: Split out Dumb buffers fixup
      drm/vc4: drv: Register a different driver on BCM2711
      drm/vc4: kms: Register a different drm_mode_config_funcs on BCM2711
      drm/vc4: plane: Register a different drm_plane_helper_funcs on BCM2711
      drm/vc4: drv: Skip BO Backend Initialization on BCM2711
      drm/vc4: crtc: Use an union to store the page flip callback
      drm/vc4: crtc: Move the BO handling out of common page-flip callback
      drm/vc4: crtc: Move the BO Handling out of Common Page-Flip Handler
      drm/vc4: crtc: Don't call into BO Handling on Async Page-Flips on BCM2711
      drm/vc4: crtc: Fix out of order frames during asynchronous page flips
      drm/vc4: Warn if some v3d code is run on BCM2711

Maya Matuszczyk (1):
      drm: panel-orientation-quirks: Add quirk for Aya Neo Next

Samuel Holland (2):
      drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer conflict
      drm/sun4i: Fix crash during suspend after component bind failure

Saud Farooqui (2):
      drm/vc4: hdmi: Fixed possible integer overflow
      drm/sun4i: Return if frontend is not present

 drivers/gpu/drm/drm_panel_orientation_quirks.c |   6 +
 drivers/gpu/drm/sun4i/sun4i_drv.c              |  12 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c            |   2 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c          |  54 +------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h          |   2 -
 drivers/gpu/drm/vc4/vc4_bo.c                   |  62 +++++++-
 drivers/gpu/drm/vc4/vc4_crtc.c                 | 200 ++++++++++++++++++-------
 drivers/gpu/drm/vc4/vc4_drv.c                  |  97 ++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h                  |  19 ++-
 drivers/gpu/drm/vc4/vc4_gem.c                  |  40 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                  |  18 +--
 drivers/gpu/drm/vc4/vc4_irq.c                  |  16 ++
 drivers/gpu/drm/vc4/vc4_kms.c                  |  24 ++-
 drivers/gpu/drm/vc4/vc4_perfmon.c              |  47 +++++-
 drivers/gpu/drm/vc4/vc4_plane.c                |  29 +++-
 drivers/gpu/drm/vc4/vc4_render_cl.c            |   4 +
 drivers/gpu/drm/vc4/vc4_v3d.c                  |  15 ++
 drivers/gpu/drm/vc4/vc4_validate.c             |  16 ++
 drivers/gpu/drm/vc4/vc4_validate_shaders.c     |   4 +
 20 files changed, 505 insertions(+), 164 deletions(-)

--vfjtikv65jpivvva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrQLMAAKCRDj7w1vZxhR
xTYsAQDXVkd4H6WvUL94yh9qjK8fLQyY64VIemyciwMVv++sFAD9EA3F55cb3t8g
FdB1d3awL3ZZbAWkyhXzSKJ3BR1kdQ8=
=mHpe
-----END PGP SIGNATURE-----

--vfjtikv65jpivvva--
