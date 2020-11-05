Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC72A918E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BA16EE1A;
	Fri,  6 Nov 2020 08:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09EC6EA04;
 Thu,  5 Nov 2020 10:14:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E3616811;
 Thu,  5 Nov 2020 05:13:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 05:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=4PrZwtt4VxXefiHt47zgF6e1i7xKLCoHBl/W05l305s=; b=EH09o/bo
 hYntFSataeC204o6+s6T9iWo+IFsMCXGDyF8LVkcYpi+UGbg34H9Fj3GjRuqPFbG
 VjeAwTjgNkoKBqbAx1d04tRq2ZuNgBMjsX5DMQA3VHEj6LIf2MTXZaiDxJTx3mAL
 k+jJI9DmXfgPxXuAr9hqYTdZmEHzP3BE+C9ILmgJit8uqCILoGsGioeWxtuOz24N
 mOKA61v5cj0QdXpusYDy7FHPx1V1eUU/NshE//C+cmdBDbS8VWygPJecjtmwu2hX
 SD5sEWwl33j+jFOJSN4y3tXrUadcGcEju1Pzh6khyz0opG/w+j0H0G2LIOLJJVc/
 9NeYcZhrTAt/oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=4PrZwtt4VxXefiHt47zgF6e1i7xKL
 CoHBl/W05l305s=; b=JuG6aIFk69T2hBm/fhlDihDD5qXEhj4mLZeKO0Pozz3p6
 m1Gbq7mtqNH3zbA09EH37Xw9wvJDVqTXYzN6TslJ4Z9CVee0RaYcSarwS4iFHmJF
 ereDXI5X9egrSvLzUUltnA6lD2qD36WHBPB3re3eQKhgw97Q370MjOsUdy4bdNx3
 DgLAsrfGBw+pLDck7U9CPR47o3yGhbWplDAg9KsJN06yE79wqDYvYKlzcSX2+dHz
 5VKM5/Q7GS4uTy430yXtwfEhkA21JamIYgqlkzWO0uqF+zfJgRPSMLNdeRiQsTji
 Cl1vKIii/Dw6RjwtNivbe3WAWk622QJuTionyd9Bg==
X-ME-Sender: <xms:ZNCjX8TmQBSBmXoibk0SDbu1ZS0VF7w_yNGocLWDgByyD7KNMJeWuA>
 <xme:ZNCjX5x1nOtzWPvil8yLOeOFbFrrFacx_qy6IIqjuG6iPyVQx_TzmdZZF217-osny
 UBA2V8Wi-LfPwqQYC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZNCjX52TeI61BXTzF4Kdid04_w4tSYEzfXwcVObkUHPSHi70S8c2Og>
 <xmx:ZNCjXwBUlX0wWDxACGk_N4LJq-3It2Gw0dv9dZcGaVj-fSylRufvjQ>
 <xmx:ZNCjX1iIUE5g15zxSNAnL66H7BSiqh0v5IQ8h8docJQAkB3bu54YwA>
 <xmx:ZdCjX2WdlxiIZZTMXf45NJ2RMaW5w2Lhc4yKswi4u7D8kBaH8JjIrYGNUI0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2384A328037B;
 Thu,  5 Nov 2020 05:13:56 -0500 (EST)
Date: Thu, 5 Nov 2020 11:13:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20201105101354.socyu26jwyns7lfj@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Content-Type: multipart/mixed; boundary="===============0148548330=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0148548330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mdzsasxjshtl5frd"
Content-Disposition: inline


--mdzsasxjshtl5frd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week round of fixes for drm-misc

Thanks!
Maxime

drm-misc-fixes-2020-11-05:
Some patches for vc4 to fix some resources cleanup issues, two fixes for
panfrost for madvise and the shrinker and a constification of fonts
structure
The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-11-05

for you to fetch changes up to 9522750c66c689b739e151fcdf895420dc81efc0:

  Fonts: Replace discarded const qualifier (2020-11-03 10:51:34 +0100)

----------------------------------------------------------------
Some patches for vc4 to fix some resources cleanup issues, two fixes for
panfrost for madvise and the shrinker and a constification of fonts
structure

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panfrost: Fix a deadlock between the shrinker and madvise path

Lee Jones (1):
      Fonts: Replace discarded const qualifier

Maxime Ripard (7):
      drm/vc4: bo: Add a managed action to cleanup the cache
      drm/vc4: drv: Use managed drm_mode_config_init
      drm/vc4: gem: Add a managed action to cleanup the job queue
      drm/vc4: Use the helper to retrieve vc4_dev when needed
      drm/vc4: Use devm_drm_dev_alloc
      drm/vc4: kms: Add functions to create the state objects
      drm/vc4: drv: Remove unused variable

Steven Price (1):
      drm/panfrost: Fix module unload

 drivers/gpu/drm/panfrost/panfrost_drv.c          |  5 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  4 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 14 ++++-
 drivers/gpu/drm/vc4/vc4_bo.c                     |  9 +--
 drivers/gpu/drm/vc4/vc4_drv.c                    | 41 +++++-------
 drivers/gpu/drm/vc4/vc4_drv.h                    |  9 ++-
 drivers/gpu/drm/vc4/vc4_gem.c                    | 19 +++---
 drivers/gpu/drm/vc4/vc4_hvs.c                    |  4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                    | 80 +++++++++++++++++-------
 drivers/gpu/drm/vc4/vc4_v3d.c                    | 12 ++--
 lib/fonts/font_10x18.c                           |  2 +-
 lib/fonts/font_6x10.c                            |  2 +-
 lib/fonts/font_6x11.c                            |  2 +-
 lib/fonts/font_6x8.c                             |  2 +-
 lib/fonts/font_7x14.c                            |  2 +-
 lib/fonts/font_8x16.c                            |  2 +-
 lib/fonts/font_8x8.c                             |  2 +-
 lib/fonts/font_acorn_8x8.c                       |  2 +-
 lib/fonts/font_mini_4x6.c                        |  2 +-
 lib/fonts/font_pearl_8x8.c                       |  2 +-
 lib/fonts/font_sun12x22.c                        |  2 +-
 lib/fonts/font_sun8x16.c                         |  2 +-
 lib/fonts/font_ter16x32.c                        |  2 +-
 24 files changed, 128 insertions(+), 97 deletions(-)

--mdzsasxjshtl5frd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6PQYgAKCRDj7w1vZxhR
xQ6tAQDKp+CVLVkr8vuR/s/u6greiN7e98cmXGTKZxOfHOWKsAEAy53fr8c2324+
DBwCRnl093tOzPHGYCJ9n9cU2dwBKws=
=83OT
-----END PGP SIGNATURE-----

--mdzsasxjshtl5frd--

--===============0148548330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0148548330==--
