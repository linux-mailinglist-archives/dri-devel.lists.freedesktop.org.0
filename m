Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E75455622
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1F6E198;
	Thu, 18 Nov 2021 07:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B956E198;
 Thu, 18 Nov 2021 07:54:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id BF439580855;
 Thu, 18 Nov 2021 02:54:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 18 Nov 2021 02:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=YjrMHUzox/Nwo2j9LHTDHhTE8TXEOhzWT6PunE5Y7H0=; b=Ds6SYLGW
 /VlsA5CW3NCXPgQAoTuiLZb/V+YsFkYW6smRxbQ2mlLkc5/k+kuz/V0iSWyLQokg
 R+VMOpnK4ch57P4KIBUlHn2r5WhW/zI7EuCfrapFgpR+r+8RuTVifvroB7N90nXd
 JaGF78kO2YqFqhCexAh5WV8dJnrflHHZmTfvHQIJi97UOqC5ILvxylxFw6gkaoHw
 K7z8MRTdbhLq+ay8ZaZPmW/5qhgRQP54cwHcao1ZmvTi6R8a0oJaRlgLCUPro4VA
 N4dqVjM12r1O7CagsdlbTQeSAN1HzrN4d0IGjay1XzcXo2QS/OM6b1NeTTqZMTAe
 0jcRHRuZmG/C3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=YjrMHUzox/Nwo2j9LHTDHhTE8TXEO
 hzWT6PunE5Y7H0=; b=Do51t2xwdMAY+S7eYqGTb4lTwImf6lWHVmTVWRlathxUl
 YuWsQ6FKtr+hJKMGG3wRSakmb0+MvXZ2aRh3sBDado4sm/pQ0Ni8uFGypgm+MWw9
 7CBJk1RyUq7IaY+7r4/7WxXq2/T4ukFegN0VTRKn+W57LQuze0bClLHLumApV3uN
 8cFoLhfAoId+rGX8rw0s7gHIWJ97ci98nEiUOJV9rmlBm08syp6wzWHKAWAoAAFg
 oDN3/J4X7jdftZW2cSxJPyx2xlOk6nVbYGPH6e9Z6EuN3AqgZOg9rmQd+Fue7ybj
 q0okttL3Fk6uaVWZM6P3hU43uabl6Hrj5ErH+H1Zg==
X-ME-Sender: <xms:ywaWYR_N7evFpl5zD8pYzeSaMYAnwUUR9GQzZzQbXzqhPkZt3kyFNA>
 <xme:ywaWYVtMFF2nldsSlBIUx7Y-vfBsDPk0446o2B6In7ggcqdOVPXoPdu7DIAKJEOhD
 Z-x9_6HZ2i9HfBYV-o>
X-ME-Received: <xmr:ywaWYfCcgiPOjcG3ZgcKTEB6N9cFrrR_apYQDFhFKabwAhb6qnR-EuPTCX-aEoqOhAqHIsX0ENhO5K_b1PXl75Pr9OZzmFcNcSEtcisq6U0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeehgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:ywaWYVfev4kW0YbL5qult94X-X4qgy3a9xc5deWgfdm1i4I2-JUMqA>
 <xmx:ywaWYWOZ666JcCJG70YLOEO4m7jwyGCzsk4tuQB8NewVTX9znmYlTQ>
 <xmx:ywaWYXndSegtThjtPb0xnbgidZnLEKia-FFJiG-tgQrC3N0KVnk0lA>
 <xmx:ywaWYdpC9fV6ifHtMdEKYgwDd9I8IpldOZKDO4PmPyEk5JwlLNX0WQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 02:54:50 -0500 (EST)
Date: Thu, 18 Nov 2021 08:54:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20211118075447.5rn6zaulnrequqnm@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="34ojn7dkclpl4nhw"
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--34ojn7dkclpl4nhw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2021-11-18:
A infoframe corruption fix for nouveau, a wrong free function usage fix
for GEM CMA helpers, a Kconfig dependency fix for sun4i, two fixes for
drm/scheduler refcounting and a probing fix for efifb.
The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-11-18

for you to fetch changes up to fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee:

  fbdev: Prevent probing generic drivers if a FB is already registered (202=
1-11-17 10:15:05 +0100)

----------------------------------------------------------------
A infoframe corruption fix for nouveau, a wrong free function usage fix
for GEM CMA helpers, a Kconfig dependency fix for sun4i, two fixes for
drm/scheduler refcounting and a probing fix for efifb.

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies

Hans Verkuil (1):
      drm/nouveau: hdmigv100.c: fix corrupted HDMI Vendor InfoFrame

Javier Martinez Canillas (1):
      fbdev: Prevent probing generic drivers if a FB is already registered

Julian Braha (1):
      drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIP=
I_DPHY

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Rob Clark (1):
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder

Thomas Zimmermann (1):
      drm/cma-helper: Release non-coherent memory with dma_free_noncoherent=
()

 drivers/gpu/drm/drm_gem_cma_helper.c                 |  9 +++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c |  1 -
 drivers/gpu/drm/scheduler/sched_main.c               |  6 +++++-
 drivers/gpu/drm/sun4i/Kconfig                        |  1 +
 drivers/video/fbdev/efifb.c                          | 11 +++++++++++
 drivers/video/fbdev/simplefb.c                       | 11 +++++++++++
 6 files changed, 35 insertions(+), 4 deletions(-)

--34ojn7dkclpl4nhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZYGxwAKCRDj7w1vZxhR
xRWEAP9WcpeIfrR/VtUrKFLYYqeyzsTWr2wR1Va0yCvvbIUMtAD/XZumn1xl/n63
klXtsrREPhV/I9Swa3exzrUTWY+VTAg=
=lnEw
-----END PGP SIGNATURE-----

--34ojn7dkclpl4nhw--
