Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD597698F94
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 10:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A4310E159;
	Thu, 16 Feb 2023 09:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057010E159;
 Thu, 16 Feb 2023 09:19:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B68215824A6;
 Thu, 16 Feb 2023 04:19:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 16 Feb 2023 04:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1676539148; x=1676546348; bh=FSdyYVMXE37HjJCMg79L/WM51m8A74dn57Y
 7EBrjMmY=; b=RCfWQv4YKYb8QE9kuL0a0p3S9twNDmJKbOViE+Nr7CQLf98Z/j2
 pdT6msOHDhr4BVmjGbDQNnB+nonb51O6sloF0JKrEpYFOdgL/Im9K9MK2LB0N42Q
 iR/vKGEERezZjdGib0smFMqQaW5cPVmDxRUV9VNwXppJOOV/8VeFeztKDFYTRsOU
 QYItK7byS5CnlmIVHbmmTKO2KiNNbR1ul/UYAbzDCso/NkJaHoRNNYqu5Y9eaM6f
 1mmscFxHbEzA6XHoPRJRgj9B2Qfh7uKbE5qwNS3Sdlm2u7CZUTtZdXKsOjOiFf+R
 sOgmqucHBDVKv6Lx9RbNwIhw+YZXfYCJY2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676539148; x=
 1676546348; bh=FSdyYVMXE37HjJCMg79L/WM51m8A74dn57Y7EBrjMmY=; b=E
 9Wf+CM/gOK1/ElUrlUDz0LEs0zieTliC2qSjvdgISCHi/Zf98i0PXXdts1WcJ8ov
 Uvp7JE8A5HTMUsyo/oBn4jat437ZFLqemfx0Gcq1opnckF4TRizViDUHd1qS3vqF
 oNP/N2Xy482U7zmKoO5jhltYjih2AP/Oaw8k1haHVS8ePwoV5qhbKl/vjpsiI8tQ
 jybHYZLHZhiwu7m255qM2cAd7rvejcFUiPxA6dBjXsQjI3dG2CS5aj8NP0+sA99+
 +l5mm8c4H4XGtWcZa0nOs89DdPqhmPDlgsm4pRmvDnA1HIXbs35oN8hewnj34Fgw
 mW9WnF9NwJ7TIpJsvrPbw==
X-ME-Sender: <xms:DPXtY-wV4Vo45DVtXwd1Aw7pQJRNpE8TFJ4NeFki3K8HmrQ_DbibrA>
 <xme:DPXtY6R5DhFbkCXJ-tp3kFNE14scY42Z8Uye5tryqwOhgR07UEqZ7zb2JPowEHO7Y
 JZ_dbb5TXX0nTGxjRk>
X-ME-Received: <xmr:DPXtYwV7A5ebcnLZ-_1lZL7oKJY6DL0YiC5i8tSKhwiVh7PB-ZRO7rJUivzCv7FTYlv9lcxRdLuCLucZIy2sHt0aNXT-REk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:DPXtY0hLgXA0RhxELuNBqVcvfivrTl3YKOQZacdxzZs06_SvXO4-7Q>
 <xmx:DPXtYwCCUyM2O1pB3VWGT0O5vG0IKme685_p0fmNUtcFd6bD2g2lRA>
 <xmx:DPXtY1L2QGrqCAShbid-2ad8VzQ95sZEcznmqw4P7E-Y9hjEcvp8sA>
 <xmx:DPXtYyyWk3BCvDVxvnyg6mdR0nJRNLwjVcw3wt31N8-WZTiFD2tRVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 04:19:07 -0500 (EST)
Date: Thu, 16 Feb 2023 10:19:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230216091905.i5wswy4dd74x4br5@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pblore63f2xoltr2"
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


--pblore63f2xoltr2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2023-02-16:
Multiple fixes in vc4 to address issues with YUV planes, HDMI and CRTC;
an invalid page access fix for fbdev, mark dynamic debug as broken, a
double free and refcounting fix for vmwgfx.
The following changes since commit 85e26dd5100a182bf8448050427539c0a66ab793:

  drm/client: fix circular reference counting issue (2023-02-07 09:42:56 +0=
100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-02-16

for you to fetch changes up to a950b989ea29ab3b38ea7f6e3d2540700a3c54e8:

  drm/vmwgfx: Do not drop the reference to the handle too soon (2023-02-14 =
23:00:09 -0500)

----------------------------------------------------------------
Multiple fixes in vc4 to address issues with YUV planes, HDMI and CRTC;
an invalid page access fix for fbdev, mark dynamic debug as broken, a
double free and refcounting fix for vmwgfx.

----------------------------------------------------------------
Dave Stevenson (1):
      drm/vc4: Fix YUV plane handling when planes are in different buffers

Dom Cobley (2):
      drm/vc4: hdmi: Always enable GCP with AVMUTE cleared
      drm/vc4: crtc: Increase setup cost in core clock calculation to handl=
e extreme reduced blanking

Jocelyn Falempe (1):
      drm/ast: Fix start address computation

Takashi Iwai (1):
      fbdev: Fix invalid page access after closing deferred I/O devices

Ville Syrj=E4l=E4 (1):
      drm: Disable dynamic debug as broken

Zack Rusin (2):
      drm/vmwgfx: Stop accessing buffer objects which failed init
      drm/vmwgfx: Do not drop the reference to the handle too soon

 drivers/gpu/drm/Kconfig                 |  3 ++-
 drivers/gpu/drm/ast/ast_mode.c          |  4 ++--
 drivers/gpu/drm/vc4/vc4_crtc.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c          | 18 +++++++++---------
 drivers/gpu/drm/vc4/vc4_plane.c         |  6 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 12 ++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c  |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 10 ++++++----
 drivers/video/fbdev/core/fb_defio.c     | 10 +++++++++-
 drivers/video/fbdev/core/fbmem.c        |  4 ++++
 include/linux/fb.h                      |  1 +
 15 files changed, 57 insertions(+), 29 deletions(-)

--pblore63f2xoltr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY+31CQAKCRDj7w1vZxhR
xWYKAP9zKTtP0atNk+id7Z1vCyatD7YOYByybakTYfv7Qmz2OgEAhvV1BJzkeV7z
wgJjGf7czsYw+Y2qPW5Tqy2ThToZbw0=
=SbTH
-----END PGP SIGNATURE-----

--pblore63f2xoltr2--
